---
to: src/reducers/<%= name %>/__test__/<%= name %>.test.ts
---
<%
    Name = h.changeCase.pascal(name);
    State = Name + 'State';
-%>
import snapshotDiff from 'snapshot-diff';
import { update<%= Name %> } from '~/actions/<%= name %>';

import { initial<%= Name %>, <%= name %> } from '~/reducers/<%= name %>';
import { <%= State %> } from '~/stateTypes';

const testing<%= Name %>: <%= State %> = {
    value: 'hoge'
};

describe('<%= Name %> reducer', () => {
    it('update <%= name %>', () => {
        expect(
            snapshotDiff(
                initial<%= Name %>,
                <%= name %>(initial<%= Name %>, update<%= Name %>(testing<%= Name %>))
            )
        ).toMatchSnapshot();
    });
});
