#namespace("crm.receivablesplan")
  #sql("queryByContractId")
    SELECT * FROM 72crm_crm_receivables_plan where contract_id = ? order by num desc limit 0,1
   #end
   #sql("queryListByContractId")
     select scrp.plan_id,  scrp.num,scc.customer_name ,scco.num as contract_num ,
     scrp.money,scrp.return_date,
     (SELECT value FROM 72crm_admin_field WHERE label = 8 and batch_id = scrp.file_batch and name = '计划回款方式') as return_type,
     scrp.remind,scrp.remark
                     from 72crm_crm_receivables_plan as scrp
                    LEFT JOIN 72crm_crm_customer as scc on scc.customer_id = scrp.customer_id
                     LEFT JOIN 72crm_crm_contract as scco on scco.contract_id = scrp.contract_id
                    where scrp.contract_id = ?
   #end
    #sql("queryListByCustomerId")
    select scrp.plan_id,  scrp.num,scc.customer_name ,scco.num as contract_num ,
     scrp.money,scrp.return_date,
     (SELECT value FROM 72crm_admin_field WHERE label = 8 and batch_id = scrp.file_batch and name = '计划回款方式') as return_type,
     scrp.remind,scrp.remark
                     from 72crm_crm_receivables_plan as scrp
                    LEFT JOIN 72crm_crm_customer as scc on scc.customer_id = scrp.customer_id
                     LEFT JOIN 72crm_crm_contract as scco on scco.contract_id = scrp.contract_id
                    where scrp.customer_id = ?
   #end
   #sql("queryByNumCustomerId")
     SELECT * from 72crm_crm_receivables_plan WHERE num = ? and contract_id = ? and customer_id = ?
   #end
   #sql("queryByCustomerIdContractId")
     SELECT * from 72crm_crm_receivables_plan WHERE receivables_id is null and contract_id = ? and customer_id = ?
   #end
   #sql("queryReceivablesPlanById")
     select * from 72crm_crm_receivables_plan where contract_id = ?
   #end
#end
