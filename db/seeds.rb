# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationQuestion.destroy_all
ApplicationAnswer.destroy_all
Member.destroy_all
User.destroy_all
Position.destroy_all

Position.create([
    { role: 'Applicant', member: false },
    { role: 'Member' },
    { role: 'Sports Saturday Executive', can_change_events: 'true', officer: 'true' },
    { role: 'Sports Fest Executive', can_change_events: 'true', officer: 'true' },
    { role: 'Socials Executive', can_change_events: 'true', officer: 'true' },
    { role: 'Show & Tell Executive', can_change_events: 'true', officer: 'true' },
    { role: 'Intramurals Executive', can_change_events: 'true', officer: 'true' },
    { role: 'Fundraising/Outreach Executive', can_change_events: 'true', officer: 'true' },
    { role: 'Boys & Girls Club Executive', can_change_events: 'true', officer: 'true' },
    { role: 'Financial Co-Chair', officer: 'true' },
    { role: 'Managerial Co-Chair', can_change_positions: 'true', can_change_events: 'true', can_change_roster: 'true', officer: 'true' },
])

User.create([
    {
        email: 'sfk.website.431@gmail.com',
        full_name: 'Sports For Kids Admin',
        uid: '102204533502419280226',
        avatar_url: 'https://lh3.googleusercontent.com/a/AATXAJzAzbh_7qALHCCDG8iqnA1b0hikmOKL7TmsIhOP=s96-c'
    },
    {
        email: 'sclark@tamu.edu',
        full_name: 'Steven Clark',
        uid: '117000275485057102157',
        avatar_url: 'https://lh3.googleusercontent.com/a-/AOh14Ghdo_SG5FBV75pKSdSwOs1iiDEv1EYm56Mi57SY=s96-c'
    },
    {
        email: 'lfh447@tamu.edu',
        full_name: 'Luis Hernandez',
        uid: '115117386107436502086',
        avatar_url: 'https://lh3.googleusercontent.com/a-/AOh14Gin0aq_tEkTFCx8_9bSRhmCwUHagmIeOzx6kqNSEw=s96-c'
    },
    {
        email: 'nickbanderson@tamu.edu',
        full_name: 'Nicholas Anderson',
        uid: '106166469615892178356',
        avatar_url: 'https://lh3.googleusercontent.com/a-/AOh14GgBbEAcpx1P-CB60gqM01JxjaDFtNt8aq321vP5Lg=s96-c'
    },
    {
        email: 'kiddrock025@tamu.edu',
        full_name: 'Nicholas LaBombard',
        uid: '117163153697784923471',
        avatar_url: 'https://lh3.googleusercontent.com/a/AATXAJw9rp4zQCcUFbCNWPtiWdILj23QYrwqaG1Mrci1=s96-c'
    },
    {
        email: 'sutrisnaroy@tamu.edu',
        full_name: 'Sutrisna Roy',
        uid: '114996820190055871012',
        avatar_url: 'https://lh3.googleusercontent.com/a/AATXAJxLHnTYhAK553v6b8zf03IwcEVIzDWkqstHg3Sx=s96-c'
    }
])

Member.create([
    { email: 'sfk.website.431@gmail.com', full_name: 'Test Admin', position_id: '11' },
    { email: 'sclark@tamu.edu', full_name: 'Steven Clark', position_id: '1' },
    { email: 'lfh447@tamu.edu', full_name: 'Luis Hernandez', position_id: '2' },
    { email: 'nickbanderson@tamu.edu', full_name: 'Nicholas Anderson', position_id: '2' },
    { email: 'kiddrock025@tamu.edu', full_name: 'Nicholas LaBombard', position_id: '2' },
    { email: 'sutrisnaroy@tamu.edu', full_name: 'Sutrisna Roy', position_id: '2' }
])

ApplicationQuestion.create([
    { question: 'What is your name?' },
    { question: 'What is your favorite color?' },
])
