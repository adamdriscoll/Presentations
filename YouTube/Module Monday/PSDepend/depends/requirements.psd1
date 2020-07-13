@{
    task2 = @{
        DependencyType = 'task'
        Target = '$PWD\script2.ps1'
        DependsOn = 'task1'
    }

    task1 = @{
        DependencyType = 'task'
        Target = '$PWD\script3.ps1'
    }

    task3 = @{
        DependencyType = 'task'
        Target = '$PWD\script1.ps1'
        DependsOn = 'task2'        
    }
}