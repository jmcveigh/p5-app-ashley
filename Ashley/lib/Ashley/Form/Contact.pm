package Ashley::Form::Contact;
use HTML::FormHandler::Moose;

extends 'HTML::FormHandler';

has '+item_class' => ( default => 'Contact::Item' );

has_field 'name' => (
	type => 'Text',
    element_attr => {
		placeholder => 'Please, enter full name ...',
	},
	tags => {
		wrapper_tag => 'div',
        label_tag => 'label',
	},
    wrapper_class => ['form-group'],
    element_class => ['form-control'],
	required => 1,
);

has_field 'email' => (
	type => 'Email',
    element_attr => {
		placeholder => 'Please, enter email address ...',
	},
	tags => {
		wrapper_tag => 'div',
        label_tag => 'label',
	},
    wrapper_class => ['form-group'],
    element_class => ['form-control'],
	required => 1,
);

has_field 'phone' => (
	type => 'Text',
    element_attr => {
		placeholder => 'Enter a phone number ...',
	},
	tags => {
		wrapper_tag => 'div',
        label_tag => 'label',
	},
    wrapper_class => ['form-group'],
    element_class => ['form-control'],
	required => 1,
);

has_field 'comments' => (
	type => 'TextArea',
    element_attr => {
		placeholder => 'Enter comments ...',
	},
	tags => {
		wrapper_tag => 'div',
        label_tag => 'label',
	},
    wrapper_class => ['form-group'],
    element_class => ['form-control'],
	required => 1,
);

has_field 'contact' => (
	type => 'Submit',
	value => 'Contact',
	element_class => ['row', 'btn', 'btn-lg', 'pull-left'],
	tags => {
		wrapper_tag => 'div',
	},
	wrapper_class => ['form-group', 'ml10', 'mt15'],
);

has_block 'block_left' => (
    render_list => ['name', 'email', 'phone'],
    class => ['col-sm-4'],
);

has_block 'block_right' => (
    render_list => ['comments'],
    class => ['col-sm-4'],
);

has_block 'block_foot' => (
    render_list => ['contact'],
    class => ['col-md-8', 'col-md-offset-4'],
);

sub build_render_list {['block_left', 'block_right', 'block_foot']};

1;