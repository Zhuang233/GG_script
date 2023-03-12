Visible = true
Types={
    WG={name = '物攻',eng_name='WG',offset=1,org_val=nil},
    WF={name = '物防',eng_name='WF',offset=2,org_val=nil},
    HP={name = '血量',eng_name='HP',offset=3,org_val=nil},
    SP={name = '速度',eng_name='SP',offset=4,org_val=nil},
    TF={name = '特防',eng_name='TF',offset=5,org_val=nil},
    TG={name = '特攻',eng_name='TG',offset=6,org_val=nil}
}


function Main()
    local menu = gg.choice(
    {"测试",
    "显示种族值",
    "超级物攻",
    "超级特攻",
    "超级物防",
    "超级特防",
    "超级血量",
    "超级速度",
    "还原物攻",
    "还原特攻",
    "还原物防",
    "还原特防",
    "还原血量",
    "还原速度",
    "退出"},nil,"复刻脚本")
    if menu == 1 then Test() end
    if menu == 2 then Display() end
    if menu == 3 then Modify_value(Types.WG,999999) end
    if menu == 4 then Modify_value(Types.TG,999999) end
    if menu == 5 then Modify_value(Types.WF,999999) end
    if menu == 6 then Modify_value(Types.TF,999999) end
    if menu == 7 then Modify_value(Types.HP,999999) end
    if menu == 8 then Modify_value(Types.SP,999999) end
    if menu == 9 then  Restore(Types.WG) end
    if menu == 10 then Restore(Types.TG) end
    if menu == 11 then Restore(Types.WF) end
    if menu == 12 then Restore(Types.TF) end
    if menu == 13 then Restore(Types.HP) end
    if menu == 14 then Restore(Types.SP) end
    if menu == 15 then Exit() end               

    Visible = false
end

function Init()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local searchkey1 = '112B;2.65249476E-315E;-80B;16B;10E~300E;10E~300E;10E~300E;10E~300E;10E~300E;10E~300E::c0h'
    local searchkey2 = '10~300E;10~300E;10~300E;10~300E;10~300E;10~300E::30h'
    gg.searchNumber(searchkey1,gg.TYPE_DOUBLE) --搜索
    gg.searchNumber(searchkey2,gg.TYPE_DOUBLE) --改善
    ZZZ_list = gg.getResults(6)
    if(#ZZZ_list < 6) then
        gg.toast('种族值定位失败')
        os.exit()
    else
        Types.WG.org_val = ZZZ_list[1].value
        Types.WF.org_val = ZZZ_list[2].value
        Types.HP.org_val = ZZZ_list[3].value
        Types.SP.org_val = ZZZ_list[4].value
        Types.TF.org_val = ZZZ_list[5].value
        Types.TG.org_val = ZZZ_list[6].value
        gg.addListItems(ZZZ_list)
    end
    
end

-- 修改数值
function Modify_value(Type,value)
    gg.toast("超级"..Type.name)
    local items_temp = ZZZ_list
    local item = ZZZ_list[Type.offset]
    item.value = value
    item.freeze = true
    items_temp[Type.offset] = item
    gg.addListItems(items_temp)
end

-- 无伤模式
function No_atk()
    Modify_value(Types.WG,0)
    Modify_value(Types.WF,999999)
    Modify_value(Types.TG,0)
    Modify_value(Types.TF,999999)
end

-- 高伤模式
function Super_atk()
    Modify_value(Types.WG,999999)
    Modify_value(Types.WF,0)
    Modify_value(Types.TG,999999)
    Modify_value(Types.TF,0)
end

-- 高物低特
function Super_WG()
    Modify_value(Types.WG,999999)
    Modify_value(Types.WF,0)
    Modify_value(Types.TG,0)
    Modify_value(Types.TF,999999)
end

-- 高特低物
function Super_WG()
    Modify_value(Types.WG,0)
    Modify_value(Types.WF,999999)
    Modify_value(Types.TG,999999)
    Modify_value(Types.TF,0)
end

-- 还原初始值
function Restore(Type)
    gg.toast("还原"..Type.name)
    local items_temp = ZZZ_list
    local item = ZZZ_list[Type.offset]
    item.value = Type.org_val
    item.freeze = false
    items_temp[Type.offset] = item
    gg.addListItems(items_temp)
end

-- 显示当前数值
function Display()
    gg.alert( '物攻：'..ZZZ_list[Types.WG.offset].value..'\n'
            ..'物防：'..ZZZ_list[Types.WF.offset].value..'\n'
            ..'特攻：'..ZZZ_list[Types.TG.offset].value..'\n'
            ..'特防：'..ZZZ_list[Types.TF.offset].value..'\n'
            ..'血量：'..ZZZ_list[Types.HP.offset].value..'\n'
            ..'速度：'..ZZZ_list[Types.SP.offset].value..'\n'
    )
end

-- 退出
function Exit()
    Restore(Types.WG)
    Restore(Types.TG)
    Restore(Types.WF)
    Restore(Types.TF)
    Restore(Types.HP)
    Restore(Types.SP)
    os.exit()
end

function Test()
    -- gg.clearResults()
    -- gg.setRanges(gg.REGION_ANONYMOUS)
    -- local searchkey1 = '1.1E;0.9E;13875W::100h'
    -- local searchkey2 = '13875'
    -- gg.searchNumber(searchkey1,gg.TYPE_DOUBLE) --搜索
    -- -- gg.searchNumber(searchkey2,gg.TYPE_WORD) --改善
    -- local r = gg.getResults(100)
    -- gg.addListItems(r)
    -- if #r > 0 then
    --     for i = 1, #r, 1 do
    --         local addr1_1 = r[i].address - 0x70
    --         local addr0_9 = r[i].address - 0x28
    --         local item1_1=gg.getValues({{address=addr1_1,flags=gg.TYPE_DOUBLE}})
    --         local item0_9=gg.getValues({{address=addr0_9,flags=gg.TYPE_DOUBLE}})
    --         if item1_1.value == 1.1 and item0_9.value == 0.9 then
    --             XG1_1 = item1_1
    --             XG0_9 = item0_9
    --         end
    --     end
    -- end
    -- -- print(XG0_9)
    -- -- print(XG1_1)

    -- -- gg.addListItems({XG1_1,XG0_9})
    -- os.exit()
end


gg.setVisible(false)
Init()

while true do
    if gg.isVisible() then
    Visible = true
    gg.setVisible(false)
    end
    gg.clearResults()
    if Visible then
    Main()
    end
end