import pandas as pd
import numpy as np

def generate_task_analytics(tasks):

    # Convert task objects into dictionary list
    task_data = []

    for task in tasks:
        task_data.append({
            "title": task.title,
            "status": task.status
        })

    # Create DataFrame
    df = pd.DataFrame(task_data)

    # Total tasks
    total_tasks = len(df)

    # Completed tasks
    completed_tasks = len(
        df[df["status"] == "Completed"]
    )

    # Pending tasks
    pending_tasks = total_tasks - completed_tasks

    # Completion percentage
    if total_tasks > 0:

        completion_percentage = np.round(
            (completed_tasks / total_tasks) * 100,
            2
        )

    else:

        completion_percentage = 0

    return {
        "total_tasks": total_tasks,
        "completed_tasks": completed_tasks,
        "pending_tasks": pending_tasks,
        "completion_percentage": completion_percentage
    }