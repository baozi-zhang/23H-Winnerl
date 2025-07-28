template = '''
(connector
	(text "wr{index}_[15..0]" (rect 226 {rect_y1} 297 {rect_y2})(font "Intel Clear" ))
	(pt 368 {pt_y})
	(pt 296 {pt_y})
	(bus)
)
'''

output = []
for i in range(1, 16):
    rect_y1 = 184 + (i ) * 16
    rect_y2 = 203 + (i ) * 16
    pt_y = 192 + (i ) * 16
    
    output.append(template.format(index=i, rect_y1=rect_y1, rect_y2=rect_y2, pt_y=pt_y))

for line in output:
    print(line)
