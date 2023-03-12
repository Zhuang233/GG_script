-- gg.clearResults() --清除结果
-- gg.setRanges(gg.REGION_ANONYMOUS) --设置搜索范围

-- local searchkey="50;50;48;46;66;67::512"
-- gg.searchNumber(searchkey,gg.TYPE_DOUBLE) --搜索
-- local r= gg.getResults(1) --得到第一条结果
-- print(r)
local r = gg.getListItems()

for i=-4000,4000 do
    local a=gg.getValues({{address=r[1].address+i,flags=gg.TYPE_BYTE}})
    print(a[1].value)
end