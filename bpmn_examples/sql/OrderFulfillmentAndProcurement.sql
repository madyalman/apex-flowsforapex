set define off
PROMPT >> Loading Exported Diagrams
PROMPT >> Loading Example "Order Fulfillment and Procurement"
begin
insert into flow_diagrams( dgrm_name, dgrm_content)
 values (
'Order Fulfillment and Procurement',
apex_string.join_clob(
  apex_t_varchar2(
  q'[<?xml version='1.0' encoding='UTF-8'?>]'
  , q'[<bpmn:definitions xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:bpmn='http://www.omg.org/spec/BPMN/20100524/MODEL' xmlns:bpmndi='http://www.omg.org/spec/BPMN/20100524/DI' xmlns:di='http://www.omg.org/spec/DD/20100524/DI' xmlns:dc='http://www.omg.org/spec/DD/20100524/DC' id='Definitions_1wzb475' targetNamespace='http://bpmn.io/schema/bpmn' exporter='bpmn-js (https://demo.bpmn.io)' exporterVersion='7.2.0'>]'
  , q'[  <bpmn:process id='Process_0rxermh' isExecutable='false'>]'
  , q'[    <bpmn:task id='Activity_1pombio' name='Check availability'>]'
  , q'[      <bpmn:incoming>Flow_17kanrn</bpmn:incoming>]'
  , q'[      <bpmn:outgoing>Flow_1w3l5en</bpmn:outgoing>]'
  , q'[    </bpmn:task>]'
  , q'[    <bpmn:sequenceFlow id='Flow_17kanrn' sourceRef='Event_0ob5sj9' targetRef='Activity_1pombio' />]'
  , q'[    <bpmn:exclusiveGateway id='Gateway_1bnb7cm' name='Article available'>]'
  , q'[      <bpmn:incoming>Flow_1w3l5en</bpmn:incoming>]'
  , q'[      <bpmn:outgoing>Flow_0leqi57</bpmn:outgoing>]'
  , q'[      <bpmn:outgoing>Flow_02pdkzm</bpmn:outgoing>]'
  , q'[    </bpmn:exclusiveGateway>]'
  , q'[    <bpmn:sequenceFlow id='Flow_1w3l5en' sourceRef='Activity_1pombio' targetRef='Gateway_1bnb7cm' />]'
  , q'[    <bpmn:sequenceFlow id='Flow_0leqi57' name='N' sourceRef='Gateway_1bnb7cm' targetRef='Activity_1vge0u1' />]'
  , q'[    <bpmn:subProcess id='Activity_1vge0u1' name='Procurement'>]'
  , q'[      <bpmn:incoming>Flow_0leqi57</bpmn:incoming>]'
  , q'[      <bpmn:outgoing>Flow_0kbj0so</bpmn:outgoing>]'
  , q'[      <bpmn:startEvent id='Event_1clgqjn' name='Start&#10;Procurement'>]'
  , q'[        <bpmn:outgoing>Flow_1qywl5r</bpmn:outgoing>]'
  , q'[      </bpmn:startEvent>]'
  , q'[      <bpmn:task id='Activity_0rwkcu9' name='Check availability with supplier'>]'
  , q'[        <bpmn:incoming>Flow_1qywl5r</bpmn:incoming>]'
  , q'[        <bpmn:outgoing>Flow_0i65vd9</bpmn:outgoing>]'
  , q'[      </bpmn:task>]'
  , q'[      <bpmn:sequenceFlow id='Flow_1qywl5r' sourceRef='Event_1clgqjn' targetRef='Activity_0rwkcu9' />]'
  , q'[      <bpmn:exclusiveGateway id='Gateway_0y4d9cr' name='Deliverable?'>]'
  , q'[        <bpmn:incoming>Flow_0i65vd9</bpmn:incoming>]'
  , q'[        <bpmn:outgoing>Flow_1bvceou</bpmn:outgoing>]'
  , q'[        <bpmn:outgoing>Flow_0519fbf</bpmn:outgoing>]'
  , q'[        <bpmn:outgoing>Flow_12t23s3</bpmn:outgoing>]'
  , q'[      </bpmn:exclusiveGateway>]'
  , q'[      <bpmn:sequenceFlow id='Flow_0i65vd9' sourceRef='Activity_0rwkcu9' targetRef='Gateway_0y4d9cr' />]'
  , q'[      <bpmn:sequenceFlow id='Flow_1bvceou' name='2 days' sourceRef='Gateway_0y4d9cr' targetRef='Event_1t737q3' />]'
  , q'[      <bpmn:intermediateThrowEvent id='Event_1t737q3' name='Late delivery'>]'
  , q'[        <bpmn:incoming>Flow_1bvceou</bpmn:incoming>]'
  , q'[        <bpmn:outgoing>Flow_1417wab</bpmn:outgoing>]'
  , q'[        <bpmn:escalationEventDefinition id='EscalationEventDefinition_1wk9jkt' />]'
  , q'[      </bpmn:intermediateThrowEvent>]'
  , q'[      <bpmn:intermediateCatchEvent id='Event_137dw80' name='article received'>]'
  , q'[        <bpmn:incoming>Flow_1a3bnnq</bpmn:incoming>]'
  , q'[        <bpmn:outgoing>Flow_09q6c5w</bpmn:outgoing>]'
  , q'[        <bpmn:messageEventDefinition id='MessageEventDefinition_1sv95am' />]'
  , q'[      </bpmn:intermediateCatchEvent>]'
  , q'[      <bpmn:endEvent id='Event_0cmaxeh' name='Article procured'>]'
  , q'[        <bpmn:incoming>Flow_09q6c5w</bpmn:incoming>]'
  , q'[      </bpmn:endEvent>]'
  , q'[      <bpmn:sequenceFlow id='Flow_09q6c5w' sourceRef='Event_137dw80' targetRef='Event_0cmaxeh' />]'
  , q'[      <bpmn:sequenceFlow id='Flow_0519fbf' name='no' sourceRef='Gateway_0y4d9cr' targetRef='Event_13os2sp' />]'
  , q'[      <bpmn:endEvent id='Event_13os2sp' name='undeliverable'>]'
  , q'[        <bpmn:incoming>Flow_0519fbf</bpmn:incoming>]'
  , q'[        <bpmn:errorEventDefinition id='ErrorEventDefinition_1apkrbo' />]'
  , q'[      </bpmn:endEvent>]'
  , q'[      <bpmn:task id='Activity_040z2tc' name='Order Item'>]'
  , q'[        <bpmn:incoming>Flow_12t23s3</bpmn:incoming>]'
  , q'[        <bpmn:incoming>Flow_1417wab</bpmn:incoming>]'
  , q'[        <bpmn:outgoing>Flow_1a3bnnq</bpmn:outgoing>]'
  , q'[      </bpmn:task>]'
  , q'[      <bpmn:sequenceFlow id='Flow_12t23s3' sourceRef='Gateway_0y4d9cr' targetRef='Activity_040z2tc' />]'
  , q'[      <bpmn:sequenceFlow id='Flow_1417wab' sourceRef='Event_1t737q3' targetRef='Activity_040z2tc' />]'
  , q'[      <bpmn:sequenceFlow id='Flow_1a3bnnq' sourceRef='Activity_040z2tc' targetRef='Event_137dw80' />]'
  , q'[    </bpmn:subProcess>]'
  , q'[    <bpmn:task id='Activity_0qoql0l' name='Ship article'>]'
  , q'[      <bpmn:incoming>Flow_02pdkzm</bpmn:incoming>]'
  , q'[      <bpmn:incoming>Flow_0kbj0so</bpmn:incoming>]'
  , q'[      <bpmn:outgoing>Flow_1czn41y</bpmn:outgoing>]'
  , q'[    </bpmn:task>]'
  , q'[    <bpmn:sequenceFlow id='Flow_1czn41y' sourceRef='Activity_0qoql0l' targetRef='Activity_0hjhoia' />]'
  , q'[    <bpmn:endEvent id='Event_1pblycm' name='Payment received'>]'
  , q'[      <bpmn:incoming>Flow_0ndvyyk</bpmn:incoming>]'
  , q'[    </bpmn:endEvent>]'
  , q'[    <bpmn:sequenceFlow id='Flow_0ndvyyk' sourceRef='Activity_0hjhoia' targetRef='Event_1pblycm' />]'
  , q'[    <bpmn:subProcess id='Activity_0hjhoia' name='Financial settlement'>]'
  , q'[      <bpmn:incoming>Flow_1czn41y</bpmn:incoming>]'
  , q'[      <bpmn:outgoing>Flow_0ndvyyk</bpmn:outgoing>]'
  , q'[      <bpmn:startEvent id='Event_0qbaump' name='Start Settlement'>]'
  , q'[        <bpmn:outgoing>Flow_0yl1n2p</bpmn:outgoing>]'
  , q'[      </bpmn:startEvent>]'
  , q'[      <bpmn:task id='Activity_1vlzqdu' name='Settle'>]'
  , q'[        <bpmn:incoming>Flow_0yl1n2p</bpmn:incoming>]'
  , q'[        <bpmn:outgoing>Flow_0ramh86</bpmn:outgoing>]'
  , q'[      </bpmn:task>]'
  , q'[      <bpmn:sequenceFlow id='Flow_0yl1n2p' sourceRef='Event_0qbaump' targetRef='Activity_1vlzqdu' />]'
  , q'[      <bpmn:endEvent id='Event_16lk98o' name='End Settlement'>]'
  , q'[        <bpmn:incoming>Flow_0ramh86</bpmn:incoming>]'
  , q'[      </bpmn:endEvent>]'
  , q'[      <bpmn:sequenceFlow id='Flow_0ramh86' sourceRef='Activity_1vlzqdu' targetRef='Event_16lk98o' />]'
  , q'[    </bpmn:subProcess>]'
  , q'[    <bpmn:sequenceFlow id='Flow_02pdkzm' name='Y' sourceRef='Gateway_1bnb7cm' targetRef='Activity_0qoql0l' />]'
  , q'[    <bpmn:sequenceFlow id='Flow_0kbj0so' sourceRef='Activity_1vge0u1' targetRef='Activity_0qoql0l' />]'
  , q'[    <bpmn:task id='Activity_13qn4iy' name='Inform Customer'>]'
  , q'[      <bpmn:incoming>Flow_00zmvu1</bpmn:incoming>]'
  , q'[      <bpmn:outgoing>Flow_0k56fv4</bpmn:outgoing>]'
  , q'[    </bpmn:task>]'
  , q'[    <bpmn:task id='Activity_159n99f' name='Inform Customer'>]'
  , q'[      <bpmn:incoming>Flow_020tzri</bpmn:incoming>]'
  , q'[      <bpmn:outgoing>Flow_102bv96</bpmn:outgoing>]'
  , q'[    </bpmn:task>]'
  , q'[    <bpmn:endEvent id='Event_0y5bmqz' name='Customer informed'>]'
  , q'[      <bpmn:incoming>Flow_0k56fv4</bpmn:incoming>]'
  , q'[    </bpmn:endEvent>]'
  , q'[    <bpmn:sequenceFlow id='Flow_0k56fv4' sourceRef='Activity_13qn4iy' targetRef='Event_0y5bmqz' />]'
  , q'[    <bpmn:task id='Activity_1347d33' name='Remove article from catalogue'>]'
  , q'[      <bpmn:incoming>Flow_102bv96</bpmn:incoming>]'
  , q'[      <bpmn:outgoing>Flow_18mfws3</bpmn:outgoing>]'
  , q'[    </bpmn:task>]'
  , q'[    <bpmn:sequenceFlow id='Flow_102bv96' sourceRef='Activity_159n99f' targetRef='Activity_1347d33' />]'
  , q'[    <bpmn:endEvent id='Event_04el70n' name='Article removed'>]'
  , q'[      <bpmn:incoming>Flow_18mfws3</bpmn:incoming>]'
  , q'[    </bpmn:endEvent>]'
  , q'[    <bpmn:sequenceFlow id='Flow_18mfws3' sourceRef='Activity_1347d33' targetRef='Event_04el70n' />]'
  , q'[    <bpmn:sequenceFlow id='Flow_020tzri' sourceRef='Event_1b4k94x' targetRef='Activity_159n99f' />]'
  , q'[    <bpmn:boundaryEvent id='Event_1b4k94x' name='Undeliverable Error' attachedToRef='Activity_1vge0u1'>]'
  , q'[      <bpmn:outgoing>Flow_020tzri</bpmn:outgoing>]'
  , q'[      <bpmn:errorEventDefinition id='ErrorEventDefinition_0sgibm4' />]'
  , q'[    </bpmn:boundaryEvent>]'
  , q'[    <bpmn:boundaryEvent id='Event_1yzg7nj' name='Escalate Late Delivery' cancelActivity='false' attachedToRef='Activity_1vge0u1'>]'
  , q'[      <bpmn:outgoing>Flow_00zmvu1</bpmn:outgoing>]'
  , q'[      <bpmn:escalationEventDefinition id='EscalationEventDefinition_1u44h4u' />]'
  , q'[    </bpmn:boundaryEvent>]'
  , q'[    <bpmn:sequenceFlow id='Flow_00zmvu1' sourceRef='Event_1yzg7nj' targetRef='Activity_13qn4iy' />]'
  , q'[    <bpmn:startEvent id='Event_0ob5sj9' name='Order received'>]'
  , q'[      <bpmn:outgoing>Flow_17kanrn</bpmn:outgoing>]'
  , q'[    </bpmn:startEvent>]'
  , q'[  </bpmn:process>]'
  , q'[  <bpmndi:BPMNDiagram id='BPMNDiagram_1'>]'
  , q'[    <bpmndi:BPMNPlane id='BPMNPlane_1' bpmnElement='Process_0rxermh'>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_18mfws3_di' bpmnElement='Flow_18mfws3'>]'
  , q'[        <di:waypoint x='1380' y='1000' />]'
  , q'[        <di:waypoint x='1462' y='1000' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_102bv96_di' bpmnElement='Flow_102bv96'>]'
  , q'[        <di:waypoint x='1160' y='1000' />]'
  , q'[        <di:waypoint x='1280' y='1000' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_0k56fv4_di' bpmnElement='Flow_0k56fv4'>]'
  , q'[        <di:waypoint x='1380' y='860' />]'
  , q'[        <di:waypoint x='1462' y='860' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_0kbj0so_di' bpmnElement='Flow_0kbj0so'>]'
  , q'[        <di:waypoint x='1440' y='516' />]'
  , q'[        <di:waypoint x='1515' y='516' />]'
  , q'[        <di:waypoint x='1515' y='240' />]'
  , q'[        <di:waypoint x='1590' y='240' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_02pdkzm_di' bpmnElement='Flow_02pdkzm'>]'
  , q'[        <di:waypoint x='625' y='220' />]'
  , q'[        <di:waypoint x='1590' y='220' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='655' y='202' width='8' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_0ndvyyk_di' bpmnElement='Flow_0ndvyyk'>]'
  , q'[        <di:waypoint x='1860' y='220' />]'
  , q'[        <di:waypoint x='1932' y='220' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_1czn41y_di' bpmnElement='Flow_1czn41y'>]'
  , q'[        <di:waypoint x='1690' y='220' />]'
  , q'[        <di:waypoint x='1760' y='220' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_0leqi57_di' bpmnElement='Flow_0leqi57'>]'
  , q'[        <di:waypoint x='600' y='245' />]'
  , q'[        <di:waypoint x='600' y='360' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='611' y='263' width='8' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_1w3l5en_di' bpmnElement='Flow_1w3l5en'>]'
  , q'[        <di:waypoint x='520' y='220' />]'
  , q'[        <di:waypoint x='575' y='220' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_17kanrn_di' bpmnElement='Flow_17kanrn'>]'
  , q'[        <di:waypoint x='368' y='220' />]'
  , q'[        <di:waypoint x='420' y='220' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_020tzri_di' bpmnElement='Flow_020tzri'>]'
  , q'[        <di:waypoint x='980' y='738' />]'
  , q'[        <di:waypoint x='980' y='1000' />]'
  , q'[        <di:waypoint x='1060' y='1000' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_00zmvu1_di' bpmnElement='Flow_00zmvu1'>]'
  , q'[        <di:waypoint x='1160' y='738' />]'
  , q'[        <di:waypoint x='1160' y='860' />]'
  , q'[        <di:waypoint x='1280' y='860' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNShape id='Activity_1pombio_di' bpmnElement='Activity_1pombio'>]'
  , q'[        <dc:Bounds x='420' y='180' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Gateway_1bnb7cm_di' bpmnElement='Gateway_1bnb7cm' isMarkerVisible='true'>]'
  , q'[        <dc:Bounds x='575' y='195' width='50' height='50' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='561' y='173' width='77' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_0a9251x_di' bpmnElement='Event_0ob5sj9'>]'
  , q'[        <dc:Bounds x='332' y='202' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='314' y='245' width='73' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_0qoql0l_di' bpmnElement='Activity_0qoql0l'>]'
  , q'[        <dc:Bounds x='1590' y='180' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_1pblycm_di' bpmnElement='Event_1pblycm'>]'
  , q'[        <dc:Bounds x='1932' y='202' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1906' y='245' width='89' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_0elb6md_di' bpmnElement='Activity_1vge0u1' isExpanded='true'>]'
  , q'[        <dc:Bounds x='500' y='360' width='940' height='360' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_0519fbf_di' bpmnElement='Flow_0519fbf'>]'
  , q'[        <di:waypoint x='910' y='585' />]'
  , q'[        <di:waypoint x='910' y='640' />]'
  , q'[        <di:waypoint x='962' y='640' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='919' y='608' width='13' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_09q6c5w_di' bpmnElement='Flow_09q6c5w'>]'
  , q'[        <di:waypoint x='1248' y='420' />]'
  , q'[        <di:waypoint x='1352' y='420' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_1bvceou_di' bpmnElement='Flow_1bvceou'>]'
  , q'[        <di:waypoint x='935' y='560' />]'
  , q'[        <di:waypoint x='1062' y='560' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='983' y='542' width='33' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_0i65vd9_di' bpmnElement='Flow_0i65vd9'>]'
  , q'[        <di:waypoint x='780' y='560' />]'
  , q'[        <di:waypoint x='885' y='560' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_1qywl5r_di' bpmnElement='Flow_1qywl5r'>]'
  , q'[        <di:waypoint x='558' y='560' />]'
  , q'[        <di:waypoint x='680' y='560' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_12t23s3_di' bpmnElement='Flow_12t23s3'>]'
  , q'[        <di:waypoint x='910' y='535' />]'
  , q'[        <di:waypoint x='910' y='420' />]'
  , q'[        <di:waypoint x='1030' y='420' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_1417wab_di' bpmnElement='Flow_1417wab'>]'
  , q'[        <di:waypoint x='1080' y='542' />]'
  , q'[        <di:waypoint x='1080' y='460' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_1a3bnnq_di' bpmnElement='Flow_1a3bnnq'>]'
  , q'[        <di:waypoint x='1130' y='420' />]'
  , q'[        <di:waypoint x='1212' y='420' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNShape id='Event_1clgqjn_di' bpmnElement='Event_1clgqjn'>]'
  , q'[        <dc:Bounds x='522' y='542' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='509' y='585' width='63' height='27' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_0rwkcu9_di' bpmnElement='Activity_0rwkcu9'>]'
  , q'[        <dc:Bounds x='680' y='520' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Gateway_0y4d9cr_di' bpmnElement='Gateway_0y4d9cr' isMarkerVisible='true'>]'
  , q'[        <dc:Bounds x='885' y='535' width='50' height='50' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='829' y='573' width='62' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_0jyzlng_di' bpmnElement='Event_137dw80'>]'
  , q'[        <dc:Bounds x='1212' y='402' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1193' y='445' width='74' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_1fiehhy_di' bpmnElement='Event_13os2sp'>]'
  , q'[        <dc:Bounds x='962' y='622' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='947' y='665' width='66' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_0cmaxeh_di' bpmnElement='Event_0cmaxeh'>]'
  , q'[        <dc:Bounds x='1352' y='402' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1332' y='445' width='78' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_040z2tc_di' bpmnElement='Activity_040z2tc'>]'
  , q'[        <dc:Bounds x='1030' y='380' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_01ibwps_di' bpmnElement='Event_1t737q3'>]'
  , q'[        <dc:Bounds x='1062' y='542' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1048' y='588' width='63' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_13qn4iy_di' bpmnElement='Activity_13qn4iy'>]'
  , q'[        <dc:Bounds x='1280' y='820' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_159n99f_di' bpmnElement='Activity_159n99f'>]'
  , q'[        <dc:Bounds x='1060' y='960' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_0y5bmqz_di' bpmnElement='Event_0y5bmqz'>]'
  , q'[        <dc:Bounds x='1462' y='842' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1455' y='885' width='50' height='27' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_1347d33_di' bpmnElement='Activity_1347d33'>]'
  , q'[        <dc:Bounds x='1280' y='960' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_04el70n_di' bpmnElement='Event_04el70n'>]'
  , q'[        <dc:Bounds x='1462' y='982' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1442' y='1025' width='76' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_0hcqzcx_di' bpmnElement='Activity_0hjhoia' isExpanded='false'>]'
  , q'[        <dc:Bounds x='1760' y='180' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_0yl1n2p_di' bpmnElement='Flow_0yl1n2p'>]'
  , q'[        <di:waypoint x='1698' y='200' />]'
  , q'[        <di:waypoint x='1750' y='200' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNEdge id='Flow_0ramh86_di' bpmnElement='Flow_0ramh86'>]'
  , q'[        <di:waypoint x='1850' y='200' />]'
  , q'[        <di:waypoint x='1902' y='200' />]'
  , q'[      </bpmndi:BPMNEdge>]'
  , q'[      <bpmndi:BPMNShape id='Event_0qbaump_di' bpmnElement='Event_0qbaump'>]'
  , q'[        <dc:Bounds x='1662' y='182' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1641' y='225' width='79' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Activity_1vlzqdu_di' bpmnElement='Activity_1vlzqdu'>]'
  , q'[        <dc:Bounds x='1750' y='160' width='100' height='80' />]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_16lk98o_di' bpmnElement='Event_16lk98o'>]'
  , q'[        <dc:Bounds x='1902' y='182' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1882' y='225' width='76' height='14' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_1n1k1ab_di' bpmnElement='Event_1b4k94x'>]'
  , q'[        <dc:Bounds x='962' y='702' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='892' y='745' width='68' height='27' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[      <bpmndi:BPMNShape id='Event_18uw9m6_di' bpmnElement='Event_1yzg7nj'>]'
  , q'[        <dc:Bounds x='1142' y='702' width='36' height='36' />]'
  , q'[        <bpmndi:BPMNLabel>]'
  , q'[          <dc:Bounds x='1077' y='745' width='67' height='27' />]'
  , q'[        </bpmndi:BPMNLabel>]'
  , q'[      </bpmndi:BPMNShape>]'
  , q'[    </bpmndi:BPMNPlane>]'
  , q'[  </bpmndi:BPMNDiagram>]'
  , q'[</bpmn:definitions>]'
  , q'[]'
  )
));
commit;
end;
/
 
PROMPT >> Example "Order Fulfillment and Procurement" loaded.
PROMPT >> ========================================================
 

