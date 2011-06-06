module BackendHelper

  def exercise_type_tag
      "exercise type <select name='info[exercise_type]'>
#{options_for_select(@exercise_types,nil)}
</select> other
   <input type='text' name='info[exercise_type1]'>
      <br/>"
  end

  def backend_tag(type)
      "#{type} #{eval "collection_select(:#{type},
                                     :id,
                                     @#{type}s,
                                     :id,
                                     :name, {:prompt => true})"}  other
   <input type='text' name='#{type}[name]'>
      <br/>"
    end

  def muscle_part_backend_tag(type ,num = 1)
    "#{type} muscle #{num} #{collection_select(type,
                                "id_#{num}",
                                @muscles,
                                :id,
                                :name, {:prompt => true})}  other

 <input type='text' name='#{type}[name_#{num}]'>
<br/>
<div id='#{type}_muscles_button'>
  #{link_to_remote "add #{type} muscle select", :url =>{:controller=>:backend, :action=>:add_muscle_select, :muscle_type=>type, :select_id=>(num + 1)}}
</div>
"
  end


end
