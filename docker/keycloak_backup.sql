--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: org; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO keycloak;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
c7e21ce6-9492-4f2b-aa31-d74667b26a78	\N	auth-cookie	56b327ff-740d-4ddf-9176-2d0997c1abec	0dcabd7a-cdc7-43cb-a339-e963b35fb167	2	10	f	\N	\N
5ff0183c-c9a2-4b02-bd8a-9377987345b4	\N	auth-spnego	56b327ff-740d-4ddf-9176-2d0997c1abec	0dcabd7a-cdc7-43cb-a339-e963b35fb167	3	20	f	\N	\N
5d97bca2-73a0-4976-82f8-f0df214d57ab	\N	identity-provider-redirector	56b327ff-740d-4ddf-9176-2d0997c1abec	0dcabd7a-cdc7-43cb-a339-e963b35fb167	2	25	f	\N	\N
5a3c5949-c24c-4830-9419-a3c727a3acd4	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	0dcabd7a-cdc7-43cb-a339-e963b35fb167	2	30	t	f3a78277-6b82-46f0-8d70-42a80652d498	\N
00e42a84-75f1-478c-8d18-766f59fc5f3e	\N	auth-username-password-form	56b327ff-740d-4ddf-9176-2d0997c1abec	f3a78277-6b82-46f0-8d70-42a80652d498	0	10	f	\N	\N
32037981-962b-43c5-97f8-6ca5479d48dd	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	f3a78277-6b82-46f0-8d70-42a80652d498	1	20	t	ecb46cba-cfc1-4a38-a64b-e36d00c16b87	\N
8365c96f-e4e8-424b-b882-3ba2cc92ed83	\N	conditional-user-configured	56b327ff-740d-4ddf-9176-2d0997c1abec	ecb46cba-cfc1-4a38-a64b-e36d00c16b87	0	10	f	\N	\N
13bc9b05-41af-43d7-8e82-1203d3b8f279	\N	auth-otp-form	56b327ff-740d-4ddf-9176-2d0997c1abec	ecb46cba-cfc1-4a38-a64b-e36d00c16b87	0	20	f	\N	\N
3831316c-25ca-47a1-9f64-ef7acc501062	\N	direct-grant-validate-username	56b327ff-740d-4ddf-9176-2d0997c1abec	c25ad38f-c08d-46f8-ad08-0c888cc6a2e3	0	10	f	\N	\N
53d2b857-add3-4455-860a-d036f417af9e	\N	direct-grant-validate-password	56b327ff-740d-4ddf-9176-2d0997c1abec	c25ad38f-c08d-46f8-ad08-0c888cc6a2e3	0	20	f	\N	\N
4f8d1278-c84b-4db5-ac34-941ab5ad71f0	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	c25ad38f-c08d-46f8-ad08-0c888cc6a2e3	1	30	t	7330ed6a-5a17-49b3-8203-0b62b30e106c	\N
1137637b-2861-425f-a61f-c14a402470d3	\N	conditional-user-configured	56b327ff-740d-4ddf-9176-2d0997c1abec	7330ed6a-5a17-49b3-8203-0b62b30e106c	0	10	f	\N	\N
ab9f38ff-689c-41aa-bb8d-b69189caefb6	\N	direct-grant-validate-otp	56b327ff-740d-4ddf-9176-2d0997c1abec	7330ed6a-5a17-49b3-8203-0b62b30e106c	0	20	f	\N	\N
03aaf596-d041-46ff-9ff5-02e77632ac5b	\N	registration-page-form	56b327ff-740d-4ddf-9176-2d0997c1abec	828b08a7-7179-426b-8fa9-194d1ad0deca	0	10	t	4975b95b-ac38-4dbf-ad33-0ffdff468190	\N
bc4c9e90-38b6-4f30-96a8-2540c202d89d	\N	registration-user-creation	56b327ff-740d-4ddf-9176-2d0997c1abec	4975b95b-ac38-4dbf-ad33-0ffdff468190	0	20	f	\N	\N
d141ce5a-7179-49f6-8a8b-df63ee5f67ec	\N	registration-password-action	56b327ff-740d-4ddf-9176-2d0997c1abec	4975b95b-ac38-4dbf-ad33-0ffdff468190	0	50	f	\N	\N
e95177d5-ea29-408f-967f-ecbffa91dc66	\N	registration-recaptcha-action	56b327ff-740d-4ddf-9176-2d0997c1abec	4975b95b-ac38-4dbf-ad33-0ffdff468190	3	60	f	\N	\N
4f51c2b0-fe31-4251-8ef0-d3b7cbd0776a	\N	registration-terms-and-conditions	56b327ff-740d-4ddf-9176-2d0997c1abec	4975b95b-ac38-4dbf-ad33-0ffdff468190	3	70	f	\N	\N
f9042176-a8de-42ba-b9f2-9e78af6bd10d	\N	reset-credentials-choose-user	56b327ff-740d-4ddf-9176-2d0997c1abec	2810efc5-e1d2-443d-9e0f-5407cde5c08e	0	10	f	\N	\N
34f42672-121a-4f4d-8133-be3df894ce9a	\N	reset-credential-email	56b327ff-740d-4ddf-9176-2d0997c1abec	2810efc5-e1d2-443d-9e0f-5407cde5c08e	0	20	f	\N	\N
0e5339e5-bde1-4096-82d9-843eb66961ef	\N	reset-password	56b327ff-740d-4ddf-9176-2d0997c1abec	2810efc5-e1d2-443d-9e0f-5407cde5c08e	0	30	f	\N	\N
b08b381f-a919-4791-98ba-eac1c3a16b5a	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	2810efc5-e1d2-443d-9e0f-5407cde5c08e	1	40	t	f6018d43-62ad-470d-8368-99f10c83213c	\N
0536bed5-90a0-4acf-b190-522736c1254f	\N	conditional-user-configured	56b327ff-740d-4ddf-9176-2d0997c1abec	f6018d43-62ad-470d-8368-99f10c83213c	0	10	f	\N	\N
c49b5661-d92c-42e0-bd4b-97b34f6f267b	\N	reset-otp	56b327ff-740d-4ddf-9176-2d0997c1abec	f6018d43-62ad-470d-8368-99f10c83213c	0	20	f	\N	\N
fb85a9d6-0bac-4755-bd28-6a0a13b05aff	\N	client-secret	56b327ff-740d-4ddf-9176-2d0997c1abec	f6cb886c-f214-4929-b558-a711a98f9e56	2	10	f	\N	\N
9a64f816-61cf-49ee-9f8b-a2903f16c5df	\N	client-jwt	56b327ff-740d-4ddf-9176-2d0997c1abec	f6cb886c-f214-4929-b558-a711a98f9e56	2	20	f	\N	\N
81c47617-65b2-419f-bd6e-eab39ac02d4a	\N	client-secret-jwt	56b327ff-740d-4ddf-9176-2d0997c1abec	f6cb886c-f214-4929-b558-a711a98f9e56	2	30	f	\N	\N
c63f4976-d3f9-4ee1-b103-acdfe9c28dc0	\N	client-x509	56b327ff-740d-4ddf-9176-2d0997c1abec	f6cb886c-f214-4929-b558-a711a98f9e56	2	40	f	\N	\N
0c5b856b-e424-40a0-ad53-8a331c7ee732	\N	idp-review-profile	56b327ff-740d-4ddf-9176-2d0997c1abec	36659472-5445-43f5-aaa1-15b589f36520	0	10	f	\N	40d86ad4-9fea-4713-9f6f-e11bcd512728
f78204ab-8a28-4490-8521-7f75a0abc12c	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	36659472-5445-43f5-aaa1-15b589f36520	0	20	t	0e37bd6a-447c-4b2d-a072-5f64f6f95de4	\N
6bd2a6b8-afcc-4a23-b79c-65bb78c1bb34	\N	idp-create-user-if-unique	56b327ff-740d-4ddf-9176-2d0997c1abec	0e37bd6a-447c-4b2d-a072-5f64f6f95de4	2	10	f	\N	b42de7a8-cb94-42a6-8493-935cfafa1524
534942db-d2ad-460c-94f3-586d63d8c0a5	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	0e37bd6a-447c-4b2d-a072-5f64f6f95de4	2	20	t	639adb7e-82be-407f-a5c7-94405b21a4f5	\N
6046ada1-8cac-45c6-9f67-a38d2f245b65	\N	idp-confirm-link	56b327ff-740d-4ddf-9176-2d0997c1abec	639adb7e-82be-407f-a5c7-94405b21a4f5	0	10	f	\N	\N
c4ce8b26-3ff7-438e-9caa-711e04f820d5	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	639adb7e-82be-407f-a5c7-94405b21a4f5	0	20	t	25e994c4-1eca-42d6-900e-3999e5afc3f1	\N
ff5d4f56-706d-4324-959a-804e7454d092	\N	idp-email-verification	56b327ff-740d-4ddf-9176-2d0997c1abec	25e994c4-1eca-42d6-900e-3999e5afc3f1	2	10	f	\N	\N
496482ef-a226-4097-9008-23862ad831b0	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	25e994c4-1eca-42d6-900e-3999e5afc3f1	2	20	t	3966ab53-b486-4296-9d64-1e58f7c2a9a1	\N
f8c6dd5b-c82f-46f5-84fc-e58ebb93c67c	\N	idp-username-password-form	56b327ff-740d-4ddf-9176-2d0997c1abec	3966ab53-b486-4296-9d64-1e58f7c2a9a1	0	10	f	\N	\N
5391ce2e-6da2-4925-b20f-5ed534379f03	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	3966ab53-b486-4296-9d64-1e58f7c2a9a1	1	20	t	f7a0ed25-3ce2-494d-949c-934dae71d2f9	\N
5a1e3b01-eca8-4c10-90b5-18c94666c670	\N	conditional-user-configured	56b327ff-740d-4ddf-9176-2d0997c1abec	f7a0ed25-3ce2-494d-949c-934dae71d2f9	0	10	f	\N	\N
73ea76c2-6970-4475-bdf8-0cc75bc94bbd	\N	auth-otp-form	56b327ff-740d-4ddf-9176-2d0997c1abec	f7a0ed25-3ce2-494d-949c-934dae71d2f9	0	20	f	\N	\N
f4b0bbe0-09be-4fca-9c27-1daf51e17ae5	\N	http-basic-authenticator	56b327ff-740d-4ddf-9176-2d0997c1abec	ff619a99-3cc4-4d2a-80b9-5814a30569d0	0	10	f	\N	\N
cf23a27d-3994-4f2d-b1a5-4b55f17c924a	\N	docker-http-basic-authenticator	56b327ff-740d-4ddf-9176-2d0997c1abec	090e9851-f248-47dd-b656-1ae1a63edd44	0	10	f	\N	\N
c04d6065-e11f-4cee-b5cf-1b42024958de	\N	auth-cookie	c06c755e-09ee-4891-9c04-67318d8ec8d7	5a897671-2928-4280-8730-6cc222b9f346	2	10	f	\N	\N
4d27d5b1-7c99-42fc-9d39-47ca6dc4402a	\N	auth-spnego	c06c755e-09ee-4891-9c04-67318d8ec8d7	5a897671-2928-4280-8730-6cc222b9f346	3	20	f	\N	\N
1a88e414-d25a-4217-afae-0d863d3a7357	\N	identity-provider-redirector	c06c755e-09ee-4891-9c04-67318d8ec8d7	5a897671-2928-4280-8730-6cc222b9f346	2	25	f	\N	\N
63f6ac4d-906e-49d0-923c-52709ae2af82	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	5a897671-2928-4280-8730-6cc222b9f346	2	30	t	99c03c7e-f7ad-4b5f-bdc0-772b5ab58033	\N
1070eb37-daed-43ed-9649-443b63c3dc3d	\N	auth-username-password-form	c06c755e-09ee-4891-9c04-67318d8ec8d7	99c03c7e-f7ad-4b5f-bdc0-772b5ab58033	0	10	f	\N	\N
5aa7679c-2fcf-45c8-b5e6-3343a30d3a2a	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	99c03c7e-f7ad-4b5f-bdc0-772b5ab58033	1	20	t	fd31ec53-4f82-4409-9833-69dc88af3739	\N
2ccbaa2e-e16c-4b1c-abae-8e2d5dc5d12c	\N	conditional-user-configured	c06c755e-09ee-4891-9c04-67318d8ec8d7	fd31ec53-4f82-4409-9833-69dc88af3739	0	10	f	\N	\N
0e0def4f-d7e0-42c0-9b98-59f6b779ebc8	\N	auth-otp-form	c06c755e-09ee-4891-9c04-67318d8ec8d7	fd31ec53-4f82-4409-9833-69dc88af3739	0	20	f	\N	\N
e7f7d6ea-5fde-4b27-9ba3-f34a12582999	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	5a897671-2928-4280-8730-6cc222b9f346	2	26	t	9f9b388c-6f26-4802-9c94-6a1b449cbde4	\N
578a7e10-81d7-4c1a-b15d-b79765d5ccbf	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	9f9b388c-6f26-4802-9c94-6a1b449cbde4	1	10	t	098eaddf-0438-4c28-8f6f-efa38991db8a	\N
91406ac9-7d21-4aa8-8d41-e0f067d2272a	\N	conditional-user-configured	c06c755e-09ee-4891-9c04-67318d8ec8d7	098eaddf-0438-4c28-8f6f-efa38991db8a	0	10	f	\N	\N
8c3d986a-1dd1-4790-9687-730b82710a03	\N	organization	c06c755e-09ee-4891-9c04-67318d8ec8d7	098eaddf-0438-4c28-8f6f-efa38991db8a	2	20	f	\N	\N
255c68e3-f9fc-4d8c-9826-9e5982375586	\N	direct-grant-validate-username	c06c755e-09ee-4891-9c04-67318d8ec8d7	21893c14-6850-480a-81d5-7c8ab6f88a46	0	10	f	\N	\N
a0a100b4-1357-47de-92a3-dbce8f79baa8	\N	direct-grant-validate-password	c06c755e-09ee-4891-9c04-67318d8ec8d7	21893c14-6850-480a-81d5-7c8ab6f88a46	0	20	f	\N	\N
8098aa40-8cf2-47d6-ac6b-d6d7677c33e6	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	21893c14-6850-480a-81d5-7c8ab6f88a46	1	30	t	d9daf1cc-a532-4a65-bc9b-ed75d2a7d6ab	\N
898702fb-5700-4e66-9c1c-5805eb720ca4	\N	conditional-user-configured	c06c755e-09ee-4891-9c04-67318d8ec8d7	d9daf1cc-a532-4a65-bc9b-ed75d2a7d6ab	0	10	f	\N	\N
a9db25be-b072-4f6f-823f-7d7b96c9af1d	\N	direct-grant-validate-otp	c06c755e-09ee-4891-9c04-67318d8ec8d7	d9daf1cc-a532-4a65-bc9b-ed75d2a7d6ab	0	20	f	\N	\N
73e578a4-6549-4011-a1c3-ac60f3a2abe4	\N	registration-page-form	c06c755e-09ee-4891-9c04-67318d8ec8d7	0d05c7bd-1c68-4ea0-bb7e-358deaa1d590	0	10	t	9b182d2a-7f42-4343-95cb-e6600bdfee2b	\N
dbbe69be-0316-4944-8b77-7feb80ffa9a2	\N	registration-user-creation	c06c755e-09ee-4891-9c04-67318d8ec8d7	9b182d2a-7f42-4343-95cb-e6600bdfee2b	0	20	f	\N	\N
e370aa4a-611e-4469-bc4a-f362eb1a6529	\N	registration-password-action	c06c755e-09ee-4891-9c04-67318d8ec8d7	9b182d2a-7f42-4343-95cb-e6600bdfee2b	0	50	f	\N	\N
d3d83df0-c549-4b58-8cd7-9299055ba99e	\N	registration-recaptcha-action	c06c755e-09ee-4891-9c04-67318d8ec8d7	9b182d2a-7f42-4343-95cb-e6600bdfee2b	3	60	f	\N	\N
a28b9f16-a3ea-4269-9787-0f32b0bfec7c	\N	registration-terms-and-conditions	c06c755e-09ee-4891-9c04-67318d8ec8d7	9b182d2a-7f42-4343-95cb-e6600bdfee2b	3	70	f	\N	\N
daac2cff-ee4f-480f-8aa7-bb7bd4b6c833	\N	reset-credentials-choose-user	c06c755e-09ee-4891-9c04-67318d8ec8d7	d8cac174-ccf5-4d73-ab97-c2ee61e9af1a	0	10	f	\N	\N
f0821d3e-b883-4fa6-b0ec-028521c11892	\N	reset-credential-email	c06c755e-09ee-4891-9c04-67318d8ec8d7	d8cac174-ccf5-4d73-ab97-c2ee61e9af1a	0	20	f	\N	\N
f2b2471a-7122-4c28-ba12-00e8964b56d3	\N	reset-password	c06c755e-09ee-4891-9c04-67318d8ec8d7	d8cac174-ccf5-4d73-ab97-c2ee61e9af1a	0	30	f	\N	\N
7c5d3d75-c9f0-47ae-bed8-50f8eb17890c	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	d8cac174-ccf5-4d73-ab97-c2ee61e9af1a	1	40	t	c2fb0d62-9528-4b7a-8317-d30e22e4b65c	\N
369e581d-e2ef-49b6-a377-8797a85f1e3b	\N	conditional-user-configured	c06c755e-09ee-4891-9c04-67318d8ec8d7	c2fb0d62-9528-4b7a-8317-d30e22e4b65c	0	10	f	\N	\N
76bcfad4-d676-4f95-bd0b-c3bee4499401	\N	reset-otp	c06c755e-09ee-4891-9c04-67318d8ec8d7	c2fb0d62-9528-4b7a-8317-d30e22e4b65c	0	20	f	\N	\N
1f07c88a-9aa6-4a1b-83a1-13c2fe9c203a	\N	client-secret	c06c755e-09ee-4891-9c04-67318d8ec8d7	9ebe01e9-58a8-474a-8bf2-71bf8c0b425e	2	10	f	\N	\N
eec1b390-7ab7-4c97-845f-b7441cfbe70c	\N	client-jwt	c06c755e-09ee-4891-9c04-67318d8ec8d7	9ebe01e9-58a8-474a-8bf2-71bf8c0b425e	2	20	f	\N	\N
2cbfb73b-a292-4177-8472-77afaee20dce	\N	client-secret-jwt	c06c755e-09ee-4891-9c04-67318d8ec8d7	9ebe01e9-58a8-474a-8bf2-71bf8c0b425e	2	30	f	\N	\N
c99bfff8-a9e3-427b-a438-ce8c8d736f10	\N	client-x509	c06c755e-09ee-4891-9c04-67318d8ec8d7	9ebe01e9-58a8-474a-8bf2-71bf8c0b425e	2	40	f	\N	\N
0cd7b1cb-304b-4ede-b728-f1ffadb1fa9b	\N	idp-review-profile	c06c755e-09ee-4891-9c04-67318d8ec8d7	9bab4c16-959c-4477-ae1c-ba14d9e8c1ec	0	10	f	\N	b1dcce70-d6b4-406d-950d-55b15f3230cc
5ee5d018-9fbd-4bb5-a87c-6bef75edc39f	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	9bab4c16-959c-4477-ae1c-ba14d9e8c1ec	0	20	t	ccf18f5d-b75d-4159-bc85-5432350f9051	\N
4237c8f6-aae2-467f-a50b-a7befdd946ad	\N	idp-create-user-if-unique	c06c755e-09ee-4891-9c04-67318d8ec8d7	ccf18f5d-b75d-4159-bc85-5432350f9051	2	10	f	\N	0e3fbf62-b1cd-402b-9353-92b1cdfcdb13
ecbf97fe-1a39-4d75-97ae-90bc08d9cedc	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	ccf18f5d-b75d-4159-bc85-5432350f9051	2	20	t	e8d0b37c-8351-4e6c-b529-c1671e01201b	\N
8432a57d-8e27-4fe7-9e44-f70db07efa97	\N	idp-confirm-link	c06c755e-09ee-4891-9c04-67318d8ec8d7	e8d0b37c-8351-4e6c-b529-c1671e01201b	0	10	f	\N	\N
602d33a3-cc8d-40e2-94df-388259d4a531	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	e8d0b37c-8351-4e6c-b529-c1671e01201b	0	20	t	2c34662a-eca7-45a0-adc2-cdc6aa94889a	\N
33044af3-dfb7-41c5-93e0-1692d9c3e12a	\N	idp-email-verification	c06c755e-09ee-4891-9c04-67318d8ec8d7	2c34662a-eca7-45a0-adc2-cdc6aa94889a	2	10	f	\N	\N
9aa47ee6-ecad-43d0-8cfe-b333406793b5	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	2c34662a-eca7-45a0-adc2-cdc6aa94889a	2	20	t	13b2d5be-0888-4aaf-a262-9474d509572a	\N
c7d66379-6b30-40d2-b42a-294bdfdeffcc	\N	idp-username-password-form	c06c755e-09ee-4891-9c04-67318d8ec8d7	13b2d5be-0888-4aaf-a262-9474d509572a	0	10	f	\N	\N
586e5d3b-f2cd-4621-9e45-f419cb7d5c7e	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	13b2d5be-0888-4aaf-a262-9474d509572a	1	20	t	733b2342-ce77-4135-ba75-a09627cd1aff	\N
1e888245-ce39-4054-99d8-327c0e930fe7	\N	conditional-user-configured	c06c755e-09ee-4891-9c04-67318d8ec8d7	733b2342-ce77-4135-ba75-a09627cd1aff	0	10	f	\N	\N
521d6011-f073-4c73-8f8b-8a4e7edba98c	\N	auth-otp-form	c06c755e-09ee-4891-9c04-67318d8ec8d7	733b2342-ce77-4135-ba75-a09627cd1aff	0	20	f	\N	\N
167ef561-39b6-4067-8547-16a8f62ce5f2	\N	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	9bab4c16-959c-4477-ae1c-ba14d9e8c1ec	1	50	t	3f969eeb-07ac-40e9-9b29-bed054101d69	\N
2469c9df-1cad-4151-9e81-97daccb98c7b	\N	conditional-user-configured	c06c755e-09ee-4891-9c04-67318d8ec8d7	3f969eeb-07ac-40e9-9b29-bed054101d69	0	10	f	\N	\N
a6bd101f-5ef1-4364-af42-721723c5e222	\N	idp-add-organization-member	c06c755e-09ee-4891-9c04-67318d8ec8d7	3f969eeb-07ac-40e9-9b29-bed054101d69	0	20	f	\N	\N
58f93d23-2839-451b-b418-aeb99cfd34b6	\N	http-basic-authenticator	c06c755e-09ee-4891-9c04-67318d8ec8d7	84fe8d06-8c99-4430-9ab9-bde434200b8c	0	10	f	\N	\N
77b4cdb1-6a08-4e91-8c06-ca0a3e0bf414	\N	docker-http-basic-authenticator	c06c755e-09ee-4891-9c04-67318d8ec8d7	ae50f47a-645a-4e10-9cfc-f3cabe5354e5	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
0dcabd7a-cdc7-43cb-a339-e963b35fb167	browser	Browser based authentication	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	t	t
f3a78277-6b82-46f0-8d70-42a80652d498	forms	Username, password, otp and other auth forms.	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
ecb46cba-cfc1-4a38-a64b-e36d00c16b87	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
c25ad38f-c08d-46f8-ad08-0c888cc6a2e3	direct grant	OpenID Connect Resource Owner Grant	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	t	t
7330ed6a-5a17-49b3-8203-0b62b30e106c	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
828b08a7-7179-426b-8fa9-194d1ad0deca	registration	Registration flow	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	t	t
4975b95b-ac38-4dbf-ad33-0ffdff468190	registration form	Registration form	56b327ff-740d-4ddf-9176-2d0997c1abec	form-flow	f	t
2810efc5-e1d2-443d-9e0f-5407cde5c08e	reset credentials	Reset credentials for a user if they forgot their password or something	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	t	t
f6018d43-62ad-470d-8368-99f10c83213c	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
f6cb886c-f214-4929-b558-a711a98f9e56	clients	Base authentication for clients	56b327ff-740d-4ddf-9176-2d0997c1abec	client-flow	t	t
36659472-5445-43f5-aaa1-15b589f36520	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	t	t
0e37bd6a-447c-4b2d-a072-5f64f6f95de4	User creation or linking	Flow for the existing/non-existing user alternatives	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
639adb7e-82be-407f-a5c7-94405b21a4f5	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
25e994c4-1eca-42d6-900e-3999e5afc3f1	Account verification options	Method with which to verity the existing account	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
3966ab53-b486-4296-9d64-1e58f7c2a9a1	Verify Existing Account by Re-authentication	Reauthentication of existing account	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
f7a0ed25-3ce2-494d-949c-934dae71d2f9	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	f	t
ff619a99-3cc4-4d2a-80b9-5814a30569d0	saml ecp	SAML ECP Profile Authentication Flow	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	t	t
090e9851-f248-47dd-b656-1ae1a63edd44	docker auth	Used by Docker clients to authenticate against the IDP	56b327ff-740d-4ddf-9176-2d0997c1abec	basic-flow	t	t
5a897671-2928-4280-8730-6cc222b9f346	browser	Browser based authentication	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	t	t
99c03c7e-f7ad-4b5f-bdc0-772b5ab58033	forms	Username, password, otp and other auth forms.	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
fd31ec53-4f82-4409-9833-69dc88af3739	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
9f9b388c-6f26-4802-9c94-6a1b449cbde4	Organization	\N	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
098eaddf-0438-4c28-8f6f-efa38991db8a	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
21893c14-6850-480a-81d5-7c8ab6f88a46	direct grant	OpenID Connect Resource Owner Grant	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	t	t
d9daf1cc-a532-4a65-bc9b-ed75d2a7d6ab	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
0d05c7bd-1c68-4ea0-bb7e-358deaa1d590	registration	Registration flow	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	t	t
9b182d2a-7f42-4343-95cb-e6600bdfee2b	registration form	Registration form	c06c755e-09ee-4891-9c04-67318d8ec8d7	form-flow	f	t
d8cac174-ccf5-4d73-ab97-c2ee61e9af1a	reset credentials	Reset credentials for a user if they forgot their password or something	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	t	t
c2fb0d62-9528-4b7a-8317-d30e22e4b65c	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
9ebe01e9-58a8-474a-8bf2-71bf8c0b425e	clients	Base authentication for clients	c06c755e-09ee-4891-9c04-67318d8ec8d7	client-flow	t	t
9bab4c16-959c-4477-ae1c-ba14d9e8c1ec	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	t	t
ccf18f5d-b75d-4159-bc85-5432350f9051	User creation or linking	Flow for the existing/non-existing user alternatives	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
e8d0b37c-8351-4e6c-b529-c1671e01201b	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
2c34662a-eca7-45a0-adc2-cdc6aa94889a	Account verification options	Method with which to verity the existing account	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
13b2d5be-0888-4aaf-a262-9474d509572a	Verify Existing Account by Re-authentication	Reauthentication of existing account	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
733b2342-ce77-4135-ba75-a09627cd1aff	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
3f969eeb-07ac-40e9-9b29-bed054101d69	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	f	t
84fe8d06-8c99-4430-9ab9-bde434200b8c	saml ecp	SAML ECP Profile Authentication Flow	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	t	t
ae50f47a-645a-4e10-9cfc-f3cabe5354e5	docker auth	Used by Docker clients to authenticate against the IDP	c06c755e-09ee-4891-9c04-67318d8ec8d7	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
40d86ad4-9fea-4713-9f6f-e11bcd512728	review profile config	56b327ff-740d-4ddf-9176-2d0997c1abec
b42de7a8-cb94-42a6-8493-935cfafa1524	create unique user config	56b327ff-740d-4ddf-9176-2d0997c1abec
b1dcce70-d6b4-406d-950d-55b15f3230cc	review profile config	c06c755e-09ee-4891-9c04-67318d8ec8d7
0e3fbf62-b1cd-402b-9353-92b1cdfcdb13	create unique user config	c06c755e-09ee-4891-9c04-67318d8ec8d7
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
40d86ad4-9fea-4713-9f6f-e11bcd512728	missing	update.profile.on.first.login
b42de7a8-cb94-42a6-8493-935cfafa1524	false	require.password.update.after.registration
0e3fbf62-b1cd-402b-9353-92b1cdfcdb13	false	require.password.update.after.registration
b1dcce70-d6b4-406d-950d-55b15f3230cc	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	f	master-realm	0	f	\N	\N	t	\N	f	56b327ff-740d-4ddf-9176-2d0997c1abec	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	56b327ff-740d-4ddf-9176-2d0997c1abec	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
458d22c7-d9da-4293-ac2b-b6cd7bb19985	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	56b327ff-740d-4ddf-9176-2d0997c1abec	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
78c42635-86c8-462f-8fda-0cec3b715c39	t	f	broker	0	f	\N	\N	t	\N	f	56b327ff-740d-4ddf-9176-2d0997c1abec	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	56b327ff-740d-4ddf-9176-2d0997c1abec	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
f737643b-0597-4da1-8fef-8156d5e2dd15	t	t	admin-cli	0	t	\N	\N	f	\N	f	56b327ff-740d-4ddf-9176-2d0997c1abec	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
411e2d55-fd42-40d2-811c-7665243af5e3	t	f	microservice-realm-realm	0	f	\N	\N	t	\N	f	56b327ff-740d-4ddf-9176-2d0997c1abec	\N	0	f	f	microservice-realm Realm	f	client-secret	\N	\N	\N	t	f	f	f
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	f	realm-management	0	f	\N	\N	t	\N	f	c06c755e-09ee-4891-9c04-67318d8ec8d7	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	f	account	0	t	\N	/realms/microservice-realm/account/	f	\N	f	c06c755e-09ee-4891-9c04-67318d8ec8d7	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5f91e27e-b433-4d28-8d66-47e221570093	t	f	account-console	0	t	\N	/realms/microservice-realm/account/	f	\N	f	c06c755e-09ee-4891-9c04-67318d8ec8d7	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
25036c4c-f3cb-408c-be0c-ec7ea96662cc	t	f	broker	0	f	\N	\N	t	\N	f	c06c755e-09ee-4891-9c04-67318d8ec8d7	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	t	t	security-admin-console	0	t	\N	/admin/microservice-realm/console/	f	\N	f	c06c755e-09ee-4891-9c04-67318d8ec8d7	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
5056f6fa-db6d-452a-bd84-1d808bd9ed11	t	t	admin-cli	0	t	\N	\N	f	\N	f	c06c755e-09ee-4891-9c04-67318d8ec8d7	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
8e1ec687-37a5-487a-b1e7-30646387404d	t	t	angular-client	0	t	\N		f	http://localhost:4200	f	c06c755e-09ee-4891-9c04-67318d8ec8d7	openid-connect	-1	t	f	angular-client	f	client-secret	http://localhost:4200		\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	post.logout.redirect.uris	+
458d22c7-d9da-4293-ac2b-b6cd7bb19985	post.logout.redirect.uris	+
458d22c7-d9da-4293-ac2b-b6cd7bb19985	pkce.code.challenge.method	S256
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	post.logout.redirect.uris	+
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	pkce.code.challenge.method	S256
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	client.use.lightweight.access.token.enabled	true
f737643b-0597-4da1-8fef-8156d5e2dd15	client.use.lightweight.access.token.enabled	true
cee6ee7b-7d7a-4f45-8748-b21f60571c88	post.logout.redirect.uris	+
5f91e27e-b433-4d28-8d66-47e221570093	post.logout.redirect.uris	+
5f91e27e-b433-4d28-8d66-47e221570093	pkce.code.challenge.method	S256
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	post.logout.redirect.uris	+
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	pkce.code.challenge.method	S256
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	client.use.lightweight.access.token.enabled	true
5056f6fa-db6d-452a-bd84-1d808bd9ed11	client.use.lightweight.access.token.enabled	true
8e1ec687-37a5-487a-b1e7-30646387404d	client.secret.creation.time	1748383340
8e1ec687-37a5-487a-b1e7-30646387404d	oauth2.device.authorization.grant.enabled	false
8e1ec687-37a5-487a-b1e7-30646387404d	oidc.ciba.grant.enabled	false
8e1ec687-37a5-487a-b1e7-30646387404d	backchannel.logout.session.required	true
8e1ec687-37a5-487a-b1e7-30646387404d	backchannel.logout.revoke.offline.tokens	false
8e1ec687-37a5-487a-b1e7-30646387404d	realm_client	false
8e1ec687-37a5-487a-b1e7-30646387404d	display.on.consent.screen	false
8e1ec687-37a5-487a-b1e7-30646387404d	frontchannel.logout.session.required	true
8e1ec687-37a5-487a-b1e7-30646387404d	use.refresh.tokens	true
8e1ec687-37a5-487a-b1e7-30646387404d	client_credentials.use_refresh_token	false
8e1ec687-37a5-487a-b1e7-30646387404d	token.response.type.bearer.lower-case	false
8e1ec687-37a5-487a-b1e7-30646387404d	tls.client.certificate.bound.access.tokens	false
8e1ec687-37a5-487a-b1e7-30646387404d	require.pushed.authorization.requests	false
8e1ec687-37a5-487a-b1e7-30646387404d	client.use.lightweight.access.token.enabled	false
8e1ec687-37a5-487a-b1e7-30646387404d	client.introspection.response.allow.jwt.claim.enabled	false
8e1ec687-37a5-487a-b1e7-30646387404d	acr.loa.map	{}
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
b74709cb-5868-4cac-a860-84f5ebe5c0fb	offline_access	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect built-in scope: offline_access	openid-connect
3fc1e194-7f03-4ce9-9421-44f991f3ce6d	role_list	56b327ff-740d-4ddf-9176-2d0997c1abec	SAML role list	saml
df5d31dc-719a-4a90-b63c-fcd7e9157093	saml_organization	56b327ff-740d-4ddf-9176-2d0997c1abec	Organization Membership	saml
56a06bc5-035f-43cf-97d3-75d0fb73048b	profile	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect built-in scope: profile	openid-connect
94d0cb07-84a3-440a-975f-a519fda69f7b	email	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect built-in scope: email	openid-connect
712e8e55-ebc6-45af-be41-96c280a2e970	address	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect built-in scope: address	openid-connect
2829ae55-ef6a-432b-93c8-e5f924e6ea14	phone	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect built-in scope: phone	openid-connect
f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	roles	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect scope for add user roles to the access token	openid-connect
b50ce408-a9f5-4a54-8e94-54f2197956ff	web-origins	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect scope for add allowed web origins to the access token	openid-connect
127bdce0-88fd-481c-aa97-433b7f9c2f5c	microprofile-jwt	56b327ff-740d-4ddf-9176-2d0997c1abec	Microprofile - JWT built-in scope	openid-connect
b7f0cff9-5433-414e-b6ba-126725261b54	acr	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
9d99c46d-3468-4fe2-9bdb-b0ba44b86931	basic	56b327ff-740d-4ddf-9176-2d0997c1abec	OpenID Connect scope for add all basic claims to the token	openid-connect
ece5ae14-53cb-4152-8d1c-9c5c07c17ada	service_account	56b327ff-740d-4ddf-9176-2d0997c1abec	Specific scope for a client enabled for service accounts	openid-connect
484303a4-808c-4590-a033-92d493652055	organization	56b327ff-740d-4ddf-9176-2d0997c1abec	Additional claims about the organization a subject belongs to	openid-connect
60accfc9-ef06-4a93-a901-606908128e47	offline_access	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect built-in scope: offline_access	openid-connect
15da97c7-4b33-4b9b-8667-e9f6d6a62177	role_list	c06c755e-09ee-4891-9c04-67318d8ec8d7	SAML role list	saml
57dd1fb7-5792-479a-adf3-7f137ee28c33	saml_organization	c06c755e-09ee-4891-9c04-67318d8ec8d7	Organization Membership	saml
71b18bcc-1019-4332-924b-09dd77da1c92	profile	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect built-in scope: profile	openid-connect
33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	email	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect built-in scope: email	openid-connect
fb26d20a-f1e2-4344-a4df-77b1745af85d	address	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect built-in scope: address	openid-connect
1407b722-eb03-451a-a1ec-b7e030bcc382	phone	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect built-in scope: phone	openid-connect
688e61e6-34cc-4326-b31b-9695c24896a8	roles	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect scope for add user roles to the access token	openid-connect
5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	web-origins	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect scope for add allowed web origins to the access token	openid-connect
ebcfc508-1a65-4be4-9514-98186373acd7	microprofile-jwt	c06c755e-09ee-4891-9c04-67318d8ec8d7	Microprofile - JWT built-in scope	openid-connect
85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	acr	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
053b2279-7f1b-4e73-be85-85c8fa9f3bdc	basic	c06c755e-09ee-4891-9c04-67318d8ec8d7	OpenID Connect scope for add all basic claims to the token	openid-connect
d49faeb0-0395-48eb-87f7-23517eda09b3	service_account	c06c755e-09ee-4891-9c04-67318d8ec8d7	Specific scope for a client enabled for service accounts	openid-connect
2a9bf981-b6d8-4937-8943-7d4c2f4588fd	organization	c06c755e-09ee-4891-9c04-67318d8ec8d7	Additional claims about the organization a subject belongs to	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
b74709cb-5868-4cac-a860-84f5ebe5c0fb	true	display.on.consent.screen
b74709cb-5868-4cac-a860-84f5ebe5c0fb	${offlineAccessScopeConsentText}	consent.screen.text
3fc1e194-7f03-4ce9-9421-44f991f3ce6d	true	display.on.consent.screen
3fc1e194-7f03-4ce9-9421-44f991f3ce6d	${samlRoleListScopeConsentText}	consent.screen.text
df5d31dc-719a-4a90-b63c-fcd7e9157093	false	display.on.consent.screen
56a06bc5-035f-43cf-97d3-75d0fb73048b	true	display.on.consent.screen
56a06bc5-035f-43cf-97d3-75d0fb73048b	${profileScopeConsentText}	consent.screen.text
56a06bc5-035f-43cf-97d3-75d0fb73048b	true	include.in.token.scope
94d0cb07-84a3-440a-975f-a519fda69f7b	true	display.on.consent.screen
94d0cb07-84a3-440a-975f-a519fda69f7b	${emailScopeConsentText}	consent.screen.text
94d0cb07-84a3-440a-975f-a519fda69f7b	true	include.in.token.scope
712e8e55-ebc6-45af-be41-96c280a2e970	true	display.on.consent.screen
712e8e55-ebc6-45af-be41-96c280a2e970	${addressScopeConsentText}	consent.screen.text
712e8e55-ebc6-45af-be41-96c280a2e970	true	include.in.token.scope
2829ae55-ef6a-432b-93c8-e5f924e6ea14	true	display.on.consent.screen
2829ae55-ef6a-432b-93c8-e5f924e6ea14	${phoneScopeConsentText}	consent.screen.text
2829ae55-ef6a-432b-93c8-e5f924e6ea14	true	include.in.token.scope
f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	true	display.on.consent.screen
f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	${rolesScopeConsentText}	consent.screen.text
f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	false	include.in.token.scope
b50ce408-a9f5-4a54-8e94-54f2197956ff	false	display.on.consent.screen
b50ce408-a9f5-4a54-8e94-54f2197956ff		consent.screen.text
b50ce408-a9f5-4a54-8e94-54f2197956ff	false	include.in.token.scope
127bdce0-88fd-481c-aa97-433b7f9c2f5c	false	display.on.consent.screen
127bdce0-88fd-481c-aa97-433b7f9c2f5c	true	include.in.token.scope
b7f0cff9-5433-414e-b6ba-126725261b54	false	display.on.consent.screen
b7f0cff9-5433-414e-b6ba-126725261b54	false	include.in.token.scope
9d99c46d-3468-4fe2-9bdb-b0ba44b86931	false	display.on.consent.screen
9d99c46d-3468-4fe2-9bdb-b0ba44b86931	false	include.in.token.scope
ece5ae14-53cb-4152-8d1c-9c5c07c17ada	false	display.on.consent.screen
ece5ae14-53cb-4152-8d1c-9c5c07c17ada	false	include.in.token.scope
484303a4-808c-4590-a033-92d493652055	true	display.on.consent.screen
484303a4-808c-4590-a033-92d493652055	${organizationScopeConsentText}	consent.screen.text
484303a4-808c-4590-a033-92d493652055	true	include.in.token.scope
60accfc9-ef06-4a93-a901-606908128e47	true	display.on.consent.screen
60accfc9-ef06-4a93-a901-606908128e47	${offlineAccessScopeConsentText}	consent.screen.text
15da97c7-4b33-4b9b-8667-e9f6d6a62177	true	display.on.consent.screen
15da97c7-4b33-4b9b-8667-e9f6d6a62177	${samlRoleListScopeConsentText}	consent.screen.text
57dd1fb7-5792-479a-adf3-7f137ee28c33	false	display.on.consent.screen
71b18bcc-1019-4332-924b-09dd77da1c92	true	display.on.consent.screen
71b18bcc-1019-4332-924b-09dd77da1c92	${profileScopeConsentText}	consent.screen.text
71b18bcc-1019-4332-924b-09dd77da1c92	true	include.in.token.scope
33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	true	display.on.consent.screen
33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	${emailScopeConsentText}	consent.screen.text
33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	true	include.in.token.scope
fb26d20a-f1e2-4344-a4df-77b1745af85d	true	display.on.consent.screen
fb26d20a-f1e2-4344-a4df-77b1745af85d	${addressScopeConsentText}	consent.screen.text
fb26d20a-f1e2-4344-a4df-77b1745af85d	true	include.in.token.scope
1407b722-eb03-451a-a1ec-b7e030bcc382	true	display.on.consent.screen
1407b722-eb03-451a-a1ec-b7e030bcc382	${phoneScopeConsentText}	consent.screen.text
1407b722-eb03-451a-a1ec-b7e030bcc382	true	include.in.token.scope
688e61e6-34cc-4326-b31b-9695c24896a8	true	display.on.consent.screen
688e61e6-34cc-4326-b31b-9695c24896a8	${rolesScopeConsentText}	consent.screen.text
688e61e6-34cc-4326-b31b-9695c24896a8	false	include.in.token.scope
5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	false	display.on.consent.screen
5b77f5ac-f487-4fab-98b8-d52a3fe88e7d		consent.screen.text
5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	false	include.in.token.scope
ebcfc508-1a65-4be4-9514-98186373acd7	false	display.on.consent.screen
ebcfc508-1a65-4be4-9514-98186373acd7	true	include.in.token.scope
85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	false	display.on.consent.screen
85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	false	include.in.token.scope
053b2279-7f1b-4e73-be85-85c8fa9f3bdc	false	display.on.consent.screen
053b2279-7f1b-4e73-be85-85c8fa9f3bdc	false	include.in.token.scope
d49faeb0-0395-48eb-87f7-23517eda09b3	false	display.on.consent.screen
d49faeb0-0395-48eb-87f7-23517eda09b3	false	include.in.token.scope
2a9bf981-b6d8-4937-8943-7d4c2f4588fd	true	display.on.consent.screen
2a9bf981-b6d8-4937-8943-7d4c2f4588fd	${organizationScopeConsentText}	consent.screen.text
2a9bf981-b6d8-4937-8943-7d4c2f4588fd	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	t
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	b50ce408-a9f5-4a54-8e94-54f2197956ff	t
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	b7f0cff9-5433-414e-b6ba-126725261b54	t
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	94d0cb07-84a3-440a-975f-a519fda69f7b	t
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	56a06bc5-035f-43cf-97d3-75d0fb73048b	t
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	9d99c46d-3468-4fe2-9bdb-b0ba44b86931	t
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	127bdce0-88fd-481c-aa97-433b7f9c2f5c	f
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	2829ae55-ef6a-432b-93c8-e5f924e6ea14	f
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	712e8e55-ebc6-45af-be41-96c280a2e970	f
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	b74709cb-5868-4cac-a860-84f5ebe5c0fb	f
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	484303a4-808c-4590-a033-92d493652055	f
458d22c7-d9da-4293-ac2b-b6cd7bb19985	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	t
458d22c7-d9da-4293-ac2b-b6cd7bb19985	b50ce408-a9f5-4a54-8e94-54f2197956ff	t
458d22c7-d9da-4293-ac2b-b6cd7bb19985	b7f0cff9-5433-414e-b6ba-126725261b54	t
458d22c7-d9da-4293-ac2b-b6cd7bb19985	94d0cb07-84a3-440a-975f-a519fda69f7b	t
458d22c7-d9da-4293-ac2b-b6cd7bb19985	56a06bc5-035f-43cf-97d3-75d0fb73048b	t
458d22c7-d9da-4293-ac2b-b6cd7bb19985	9d99c46d-3468-4fe2-9bdb-b0ba44b86931	t
458d22c7-d9da-4293-ac2b-b6cd7bb19985	127bdce0-88fd-481c-aa97-433b7f9c2f5c	f
458d22c7-d9da-4293-ac2b-b6cd7bb19985	2829ae55-ef6a-432b-93c8-e5f924e6ea14	f
458d22c7-d9da-4293-ac2b-b6cd7bb19985	712e8e55-ebc6-45af-be41-96c280a2e970	f
458d22c7-d9da-4293-ac2b-b6cd7bb19985	b74709cb-5868-4cac-a860-84f5ebe5c0fb	f
458d22c7-d9da-4293-ac2b-b6cd7bb19985	484303a4-808c-4590-a033-92d493652055	f
f737643b-0597-4da1-8fef-8156d5e2dd15	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	t
f737643b-0597-4da1-8fef-8156d5e2dd15	b50ce408-a9f5-4a54-8e94-54f2197956ff	t
f737643b-0597-4da1-8fef-8156d5e2dd15	b7f0cff9-5433-414e-b6ba-126725261b54	t
f737643b-0597-4da1-8fef-8156d5e2dd15	94d0cb07-84a3-440a-975f-a519fda69f7b	t
f737643b-0597-4da1-8fef-8156d5e2dd15	56a06bc5-035f-43cf-97d3-75d0fb73048b	t
f737643b-0597-4da1-8fef-8156d5e2dd15	9d99c46d-3468-4fe2-9bdb-b0ba44b86931	t
f737643b-0597-4da1-8fef-8156d5e2dd15	127bdce0-88fd-481c-aa97-433b7f9c2f5c	f
f737643b-0597-4da1-8fef-8156d5e2dd15	2829ae55-ef6a-432b-93c8-e5f924e6ea14	f
f737643b-0597-4da1-8fef-8156d5e2dd15	712e8e55-ebc6-45af-be41-96c280a2e970	f
f737643b-0597-4da1-8fef-8156d5e2dd15	b74709cb-5868-4cac-a860-84f5ebe5c0fb	f
f737643b-0597-4da1-8fef-8156d5e2dd15	484303a4-808c-4590-a033-92d493652055	f
78c42635-86c8-462f-8fda-0cec3b715c39	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	t
78c42635-86c8-462f-8fda-0cec3b715c39	b50ce408-a9f5-4a54-8e94-54f2197956ff	t
78c42635-86c8-462f-8fda-0cec3b715c39	b7f0cff9-5433-414e-b6ba-126725261b54	t
78c42635-86c8-462f-8fda-0cec3b715c39	94d0cb07-84a3-440a-975f-a519fda69f7b	t
78c42635-86c8-462f-8fda-0cec3b715c39	56a06bc5-035f-43cf-97d3-75d0fb73048b	t
78c42635-86c8-462f-8fda-0cec3b715c39	9d99c46d-3468-4fe2-9bdb-b0ba44b86931	t
78c42635-86c8-462f-8fda-0cec3b715c39	127bdce0-88fd-481c-aa97-433b7f9c2f5c	f
78c42635-86c8-462f-8fda-0cec3b715c39	2829ae55-ef6a-432b-93c8-e5f924e6ea14	f
78c42635-86c8-462f-8fda-0cec3b715c39	712e8e55-ebc6-45af-be41-96c280a2e970	f
78c42635-86c8-462f-8fda-0cec3b715c39	b74709cb-5868-4cac-a860-84f5ebe5c0fb	f
78c42635-86c8-462f-8fda-0cec3b715c39	484303a4-808c-4590-a033-92d493652055	f
b4eca891-8db4-463c-9cbd-3e4da02b47ab	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	t
b4eca891-8db4-463c-9cbd-3e4da02b47ab	b50ce408-a9f5-4a54-8e94-54f2197956ff	t
b4eca891-8db4-463c-9cbd-3e4da02b47ab	b7f0cff9-5433-414e-b6ba-126725261b54	t
b4eca891-8db4-463c-9cbd-3e4da02b47ab	94d0cb07-84a3-440a-975f-a519fda69f7b	t
b4eca891-8db4-463c-9cbd-3e4da02b47ab	56a06bc5-035f-43cf-97d3-75d0fb73048b	t
b4eca891-8db4-463c-9cbd-3e4da02b47ab	9d99c46d-3468-4fe2-9bdb-b0ba44b86931	t
b4eca891-8db4-463c-9cbd-3e4da02b47ab	127bdce0-88fd-481c-aa97-433b7f9c2f5c	f
b4eca891-8db4-463c-9cbd-3e4da02b47ab	2829ae55-ef6a-432b-93c8-e5f924e6ea14	f
b4eca891-8db4-463c-9cbd-3e4da02b47ab	712e8e55-ebc6-45af-be41-96c280a2e970	f
b4eca891-8db4-463c-9cbd-3e4da02b47ab	b74709cb-5868-4cac-a860-84f5ebe5c0fb	f
b4eca891-8db4-463c-9cbd-3e4da02b47ab	484303a4-808c-4590-a033-92d493652055	f
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	t
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	b50ce408-a9f5-4a54-8e94-54f2197956ff	t
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	b7f0cff9-5433-414e-b6ba-126725261b54	t
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	94d0cb07-84a3-440a-975f-a519fda69f7b	t
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	56a06bc5-035f-43cf-97d3-75d0fb73048b	t
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	9d99c46d-3468-4fe2-9bdb-b0ba44b86931	t
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	127bdce0-88fd-481c-aa97-433b7f9c2f5c	f
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	2829ae55-ef6a-432b-93c8-e5f924e6ea14	f
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	712e8e55-ebc6-45af-be41-96c280a2e970	f
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	b74709cb-5868-4cac-a860-84f5ebe5c0fb	f
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	484303a4-808c-4590-a033-92d493652055	f
cee6ee7b-7d7a-4f45-8748-b21f60571c88	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	t
cee6ee7b-7d7a-4f45-8748-b21f60571c88	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	t
cee6ee7b-7d7a-4f45-8748-b21f60571c88	688e61e6-34cc-4326-b31b-9695c24896a8	t
cee6ee7b-7d7a-4f45-8748-b21f60571c88	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	t
cee6ee7b-7d7a-4f45-8748-b21f60571c88	053b2279-7f1b-4e73-be85-85c8fa9f3bdc	t
cee6ee7b-7d7a-4f45-8748-b21f60571c88	71b18bcc-1019-4332-924b-09dd77da1c92	t
cee6ee7b-7d7a-4f45-8748-b21f60571c88	fb26d20a-f1e2-4344-a4df-77b1745af85d	f
cee6ee7b-7d7a-4f45-8748-b21f60571c88	ebcfc508-1a65-4be4-9514-98186373acd7	f
cee6ee7b-7d7a-4f45-8748-b21f60571c88	2a9bf981-b6d8-4937-8943-7d4c2f4588fd	f
cee6ee7b-7d7a-4f45-8748-b21f60571c88	1407b722-eb03-451a-a1ec-b7e030bcc382	f
cee6ee7b-7d7a-4f45-8748-b21f60571c88	60accfc9-ef06-4a93-a901-606908128e47	f
5f91e27e-b433-4d28-8d66-47e221570093	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	t
5f91e27e-b433-4d28-8d66-47e221570093	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	t
5f91e27e-b433-4d28-8d66-47e221570093	688e61e6-34cc-4326-b31b-9695c24896a8	t
5f91e27e-b433-4d28-8d66-47e221570093	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	t
5f91e27e-b433-4d28-8d66-47e221570093	053b2279-7f1b-4e73-be85-85c8fa9f3bdc	t
5f91e27e-b433-4d28-8d66-47e221570093	71b18bcc-1019-4332-924b-09dd77da1c92	t
5f91e27e-b433-4d28-8d66-47e221570093	fb26d20a-f1e2-4344-a4df-77b1745af85d	f
5f91e27e-b433-4d28-8d66-47e221570093	ebcfc508-1a65-4be4-9514-98186373acd7	f
5f91e27e-b433-4d28-8d66-47e221570093	2a9bf981-b6d8-4937-8943-7d4c2f4588fd	f
5f91e27e-b433-4d28-8d66-47e221570093	1407b722-eb03-451a-a1ec-b7e030bcc382	f
5f91e27e-b433-4d28-8d66-47e221570093	60accfc9-ef06-4a93-a901-606908128e47	f
5056f6fa-db6d-452a-bd84-1d808bd9ed11	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	t
5056f6fa-db6d-452a-bd84-1d808bd9ed11	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	t
5056f6fa-db6d-452a-bd84-1d808bd9ed11	688e61e6-34cc-4326-b31b-9695c24896a8	t
5056f6fa-db6d-452a-bd84-1d808bd9ed11	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	t
5056f6fa-db6d-452a-bd84-1d808bd9ed11	053b2279-7f1b-4e73-be85-85c8fa9f3bdc	t
5056f6fa-db6d-452a-bd84-1d808bd9ed11	71b18bcc-1019-4332-924b-09dd77da1c92	t
5056f6fa-db6d-452a-bd84-1d808bd9ed11	fb26d20a-f1e2-4344-a4df-77b1745af85d	f
5056f6fa-db6d-452a-bd84-1d808bd9ed11	ebcfc508-1a65-4be4-9514-98186373acd7	f
5056f6fa-db6d-452a-bd84-1d808bd9ed11	2a9bf981-b6d8-4937-8943-7d4c2f4588fd	f
5056f6fa-db6d-452a-bd84-1d808bd9ed11	1407b722-eb03-451a-a1ec-b7e030bcc382	f
5056f6fa-db6d-452a-bd84-1d808bd9ed11	60accfc9-ef06-4a93-a901-606908128e47	f
25036c4c-f3cb-408c-be0c-ec7ea96662cc	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	t
25036c4c-f3cb-408c-be0c-ec7ea96662cc	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	t
25036c4c-f3cb-408c-be0c-ec7ea96662cc	688e61e6-34cc-4326-b31b-9695c24896a8	t
25036c4c-f3cb-408c-be0c-ec7ea96662cc	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	t
25036c4c-f3cb-408c-be0c-ec7ea96662cc	053b2279-7f1b-4e73-be85-85c8fa9f3bdc	t
25036c4c-f3cb-408c-be0c-ec7ea96662cc	71b18bcc-1019-4332-924b-09dd77da1c92	t
25036c4c-f3cb-408c-be0c-ec7ea96662cc	fb26d20a-f1e2-4344-a4df-77b1745af85d	f
25036c4c-f3cb-408c-be0c-ec7ea96662cc	ebcfc508-1a65-4be4-9514-98186373acd7	f
25036c4c-f3cb-408c-be0c-ec7ea96662cc	2a9bf981-b6d8-4937-8943-7d4c2f4588fd	f
25036c4c-f3cb-408c-be0c-ec7ea96662cc	1407b722-eb03-451a-a1ec-b7e030bcc382	f
25036c4c-f3cb-408c-be0c-ec7ea96662cc	60accfc9-ef06-4a93-a901-606908128e47	f
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	t
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	t
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	688e61e6-34cc-4326-b31b-9695c24896a8	t
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	t
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	053b2279-7f1b-4e73-be85-85c8fa9f3bdc	t
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	71b18bcc-1019-4332-924b-09dd77da1c92	t
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	fb26d20a-f1e2-4344-a4df-77b1745af85d	f
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	ebcfc508-1a65-4be4-9514-98186373acd7	f
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	2a9bf981-b6d8-4937-8943-7d4c2f4588fd	f
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	1407b722-eb03-451a-a1ec-b7e030bcc382	f
9d801321-bc51-46f8-be2f-fd6b2bcaccf4	60accfc9-ef06-4a93-a901-606908128e47	f
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	t
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	t
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	688e61e6-34cc-4326-b31b-9695c24896a8	t
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	t
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	053b2279-7f1b-4e73-be85-85c8fa9f3bdc	t
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	71b18bcc-1019-4332-924b-09dd77da1c92	t
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	fb26d20a-f1e2-4344-a4df-77b1745af85d	f
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	ebcfc508-1a65-4be4-9514-98186373acd7	f
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	2a9bf981-b6d8-4937-8943-7d4c2f4588fd	f
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	1407b722-eb03-451a-a1ec-b7e030bcc382	f
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	60accfc9-ef06-4a93-a901-606908128e47	f
8e1ec687-37a5-487a-b1e7-30646387404d	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	t
8e1ec687-37a5-487a-b1e7-30646387404d	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	t
8e1ec687-37a5-487a-b1e7-30646387404d	688e61e6-34cc-4326-b31b-9695c24896a8	t
8e1ec687-37a5-487a-b1e7-30646387404d	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	t
8e1ec687-37a5-487a-b1e7-30646387404d	053b2279-7f1b-4e73-be85-85c8fa9f3bdc	t
8e1ec687-37a5-487a-b1e7-30646387404d	71b18bcc-1019-4332-924b-09dd77da1c92	t
8e1ec687-37a5-487a-b1e7-30646387404d	fb26d20a-f1e2-4344-a4df-77b1745af85d	f
8e1ec687-37a5-487a-b1e7-30646387404d	ebcfc508-1a65-4be4-9514-98186373acd7	f
8e1ec687-37a5-487a-b1e7-30646387404d	2a9bf981-b6d8-4937-8943-7d4c2f4588fd	f
8e1ec687-37a5-487a-b1e7-30646387404d	1407b722-eb03-451a-a1ec-b7e030bcc382	f
8e1ec687-37a5-487a-b1e7-30646387404d	60accfc9-ef06-4a93-a901-606908128e47	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
b74709cb-5868-4cac-a860-84f5ebe5c0fb	2f4da990-af73-45e4-96e7-3513ddf7b0af
60accfc9-ef06-4a93-a901-606908128e47	46bc56db-5b9a-49b9-8807-7f7863dd744f
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
f204d050-b400-4a11-935e-0f043938502b	Trusted Hosts	56b327ff-740d-4ddf-9176-2d0997c1abec	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	anonymous
af2b27d4-d9c6-49dd-bf54-4209b51aa944	Consent Required	56b327ff-740d-4ddf-9176-2d0997c1abec	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	anonymous
4b81920e-7dab-4f6a-9382-bf83b12a955b	Full Scope Disabled	56b327ff-740d-4ddf-9176-2d0997c1abec	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	anonymous
7b964627-bacd-44d5-a721-76956aeffdf9	Max Clients Limit	56b327ff-740d-4ddf-9176-2d0997c1abec	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	anonymous
822ff720-670a-4b62-acd3-b9bd2aef6ef4	Allowed Protocol Mapper Types	56b327ff-740d-4ddf-9176-2d0997c1abec	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	anonymous
0121560a-f63d-4a22-a02e-275e8ebc5b04	Allowed Client Scopes	56b327ff-740d-4ddf-9176-2d0997c1abec	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	anonymous
7c9a2600-2a3e-4d70-8ea7-72eea02f6817	Allowed Protocol Mapper Types	56b327ff-740d-4ddf-9176-2d0997c1abec	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	authenticated
a5cac5f9-8b42-4571-85f3-9d2d5728d9d4	Allowed Client Scopes	56b327ff-740d-4ddf-9176-2d0997c1abec	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	authenticated
a1fdebda-2293-44ac-af5b-b847b4641159	rsa-generated	56b327ff-740d-4ddf-9176-2d0997c1abec	rsa-generated	org.keycloak.keys.KeyProvider	56b327ff-740d-4ddf-9176-2d0997c1abec	\N
4c9b444f-0972-4eef-b437-6c15d8c1b932	rsa-enc-generated	56b327ff-740d-4ddf-9176-2d0997c1abec	rsa-enc-generated	org.keycloak.keys.KeyProvider	56b327ff-740d-4ddf-9176-2d0997c1abec	\N
d2a94fd3-f695-4b6c-bb4e-4c3823278d49	hmac-generated-hs512	56b327ff-740d-4ddf-9176-2d0997c1abec	hmac-generated	org.keycloak.keys.KeyProvider	56b327ff-740d-4ddf-9176-2d0997c1abec	\N
4a40bfdf-fec9-4861-a3bd-da4a747dcde6	aes-generated	56b327ff-740d-4ddf-9176-2d0997c1abec	aes-generated	org.keycloak.keys.KeyProvider	56b327ff-740d-4ddf-9176-2d0997c1abec	\N
96a1a447-b041-472f-93c9-7607a6c31169	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	56b327ff-740d-4ddf-9176-2d0997c1abec	\N
83af7b75-041c-42fc-8f4c-463e563c5575	rsa-generated	c06c755e-09ee-4891-9c04-67318d8ec8d7	rsa-generated	org.keycloak.keys.KeyProvider	c06c755e-09ee-4891-9c04-67318d8ec8d7	\N
267aa9ab-02d8-4c44-8fd7-5b7c4e2d24c1	rsa-enc-generated	c06c755e-09ee-4891-9c04-67318d8ec8d7	rsa-enc-generated	org.keycloak.keys.KeyProvider	c06c755e-09ee-4891-9c04-67318d8ec8d7	\N
29d73152-0f15-4a06-b50e-4fb8ffe1b212	hmac-generated-hs512	c06c755e-09ee-4891-9c04-67318d8ec8d7	hmac-generated	org.keycloak.keys.KeyProvider	c06c755e-09ee-4891-9c04-67318d8ec8d7	\N
b7171801-a536-4c5b-ab84-d9fe5102f67a	aes-generated	c06c755e-09ee-4891-9c04-67318d8ec8d7	aes-generated	org.keycloak.keys.KeyProvider	c06c755e-09ee-4891-9c04-67318d8ec8d7	\N
663d6ddd-9976-4b2c-8f75-ab9c4a17bb90	Trusted Hosts	c06c755e-09ee-4891-9c04-67318d8ec8d7	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	anonymous
6bde6860-03b3-42dc-b1ae-5f942b8e9f85	Consent Required	c06c755e-09ee-4891-9c04-67318d8ec8d7	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	anonymous
d714a0fe-2abc-449b-a603-42f8b7410bdd	Full Scope Disabled	c06c755e-09ee-4891-9c04-67318d8ec8d7	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	anonymous
7572a869-ec9d-45fd-b711-4804d1b222aa	Max Clients Limit	c06c755e-09ee-4891-9c04-67318d8ec8d7	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	anonymous
540513ab-9162-4c2a-aedb-cb1406b85daa	Allowed Protocol Mapper Types	c06c755e-09ee-4891-9c04-67318d8ec8d7	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	anonymous
4f6822e2-e596-43ec-b6ab-16f1dc97464b	Allowed Client Scopes	c06c755e-09ee-4891-9c04-67318d8ec8d7	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	anonymous
4c2ba9ad-a85e-4e11-bcba-8167f12526a8	Allowed Protocol Mapper Types	c06c755e-09ee-4891-9c04-67318d8ec8d7	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	authenticated
ff3981aa-26ca-4474-a093-a9eb32f39b06	Allowed Client Scopes	c06c755e-09ee-4891-9c04-67318d8ec8d7	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
545a50e8-3de5-4529-ac95-f2a623a6b08f	0121560a-f63d-4a22-a02e-275e8ebc5b04	allow-default-scopes	true
e4faa2c5-4244-4265-843f-87a028c1dbd3	a5cac5f9-8b42-4571-85f3-9d2d5728d9d4	allow-default-scopes	true
df504ea6-ccc6-4b6a-be3b-cf6401552b1f	7b964627-bacd-44d5-a721-76956aeffdf9	max-clients	200
bbec0cae-e1b9-4421-b69c-2c13b562d2d0	f204d050-b400-4a11-935e-0f043938502b	client-uris-must-match	true
0b0ebea7-2c02-4fe6-92ff-bcf6baa22fb4	f204d050-b400-4a11-935e-0f043938502b	host-sending-registration-request-must-match	true
9b94d695-b31c-4766-8b36-44d2fada2d73	822ff720-670a-4b62-acd3-b9bd2aef6ef4	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
ab1d96f6-6f74-44fb-904b-7ad3b9965ccd	822ff720-670a-4b62-acd3-b9bd2aef6ef4	allowed-protocol-mapper-types	saml-user-property-mapper
1fdf19ac-d1d0-4a73-a262-7935382d1368	822ff720-670a-4b62-acd3-b9bd2aef6ef4	allowed-protocol-mapper-types	oidc-address-mapper
257bc9e1-5cdb-4ead-aa43-61e447da27e2	822ff720-670a-4b62-acd3-b9bd2aef6ef4	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
6e9404b4-2530-499b-a851-a40144d6fc88	822ff720-670a-4b62-acd3-b9bd2aef6ef4	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
e22ba08f-26a1-4444-a722-a616f0f358cf	822ff720-670a-4b62-acd3-b9bd2aef6ef4	allowed-protocol-mapper-types	saml-user-attribute-mapper
ebeafcbd-218a-4760-9df2-98551c76911a	822ff720-670a-4b62-acd3-b9bd2aef6ef4	allowed-protocol-mapper-types	saml-role-list-mapper
ea78568d-810f-43b0-aa1e-286922807e4d	822ff720-670a-4b62-acd3-b9bd2aef6ef4	allowed-protocol-mapper-types	oidc-full-name-mapper
d6974491-a2c3-4ef8-b75e-49bed74ac76b	7c9a2600-2a3e-4d70-8ea7-72eea02f6817	allowed-protocol-mapper-types	saml-user-property-mapper
1eb586bb-5495-4131-bcda-858326f99403	7c9a2600-2a3e-4d70-8ea7-72eea02f6817	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
4a999013-a880-4e96-a2a1-0eff0926b57a	7c9a2600-2a3e-4d70-8ea7-72eea02f6817	allowed-protocol-mapper-types	saml-user-attribute-mapper
dc631bb9-1d1e-4efc-82e6-37f62bc43f35	7c9a2600-2a3e-4d70-8ea7-72eea02f6817	allowed-protocol-mapper-types	saml-role-list-mapper
fb7e33db-d59b-486e-af0a-9b2b10f3b218	7c9a2600-2a3e-4d70-8ea7-72eea02f6817	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
316977ac-8704-4c88-8ac2-8b87b34e4211	7c9a2600-2a3e-4d70-8ea7-72eea02f6817	allowed-protocol-mapper-types	oidc-full-name-mapper
cc9ea487-33c9-47e3-b547-e043e67a3360	7c9a2600-2a3e-4d70-8ea7-72eea02f6817	allowed-protocol-mapper-types	oidc-address-mapper
ec1f5ec6-2e74-41b2-a0b5-89b6fc29a634	7c9a2600-2a3e-4d70-8ea7-72eea02f6817	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
24243c74-55ef-4c9f-805e-eb391eafae4a	4c9b444f-0972-4eef-b437-6c15d8c1b932	keyUse	ENC
fa613290-a6e0-4716-b002-fe13ac1159f7	4c9b444f-0972-4eef-b437-6c15d8c1b932	privateKey	MIIEowIBAAKCAQEAuH2hqb+2hWGVFAO3JN+2a0DfXB1MUfhPpDecYplP5w8qhPwt5VAXJs49wX0y3G0prgi6qmUV0W3jj2tVWQT7BC3qQ73D4Qu3etGqTvocs7jPyamVG5RCfMarwqhSmQrkTRp+NWmzEfQjdM0IdrSzsV//ptDvgPyECKHMqK4JY7wN4bzkohF59XYaFPHAAWCKxJ7gMVbjYOp6IS87xpgSLnhY9ixLtCZXjMiWhgGiOOrnog7/xx+T1fKLF1w5aTafnHkZ7NnJRb+yvRFwnRIzlz77SuSd3ZQM+aE3v5tltFPoeVKfDfdX1RM7Rf7VHdZZ2Y7T/4eQdhRQPGnOxxOoJQIDAQABAoIBADlyEQEQq24bxPYu8/t810nNMN93VfjeFzpcgIrpDwq027n95fKVvie8p1kUuV4OdaB1ol4FTMZh764ML06hMOILw/qk35W29sI8/8lIsuA5RyYVclLcltlQaVIa5GE4FX92pN7P00zfVpz7bMu9l4g/CpUwUKs6tYgUjWvmiRDvCTABbbFDxMmvzrrthytaCBbVxa7WfmVYM1ovZgMjFE7AFIvY8WhQHYmuxE10kLLxvcnXuDlvn/67J3KJP3XmkTqewsItlWuWO4B4wO/ACYzx+K6oT5wEPJx2lNVD1iObUyxDW2UmbtYCHFeA8bQ+3xZpAD/BM6WOd0/dypJP7b8CgYEA6lcyfovoW6riZ/RqtNGArEcQn6C9zo8NTta4Pt5JHH52qC4NYNUJLsF1x2/AdUa46vttP4kWXq/1yMabrO/Mj2eibsRUg6m+fYBWMCgHTwPlCWK92xzYzirvSm1xPVrntZK9/rTk0ZLdnAtqCspzUo6wkb7OUST4CpXKq0i0S9cCgYEAyYrr+k23fB9Tp44PpsjQijIjASxnqd6FSevFlhaHiD2Y75bbSlLKkJaHuvSl7DaxG+ZFy4se6U8ruBa/bqi/D3uS46yj9kqV6mDm3Z8GWQmbUl0ort1pSX/g5e12si0IVKbobm/+iLystR5ThBcM8/HKiTkcAl6wYvOtmpUNzGMCgYASCwCySadsV23zPxhwL6lOmnInOEMlAlKt/U5WWNscPIh6ToFtMTnxxaeB4ZLZ9MYMIau5tp5oT/gGq3QVDqmbaQlSqf8v3AP0ucrpDkvxw4UBAf9IPaJbzWZ7Po33gWZRzqieUeNEV6CEgUR67DeQ5bemoSBVkxkeB4aBRanMJQKBgQCp/yriWxFMeeQG7bXX+YSlPHr4L2tVBiOpYVytJ120ljhcxwM7IrBH2yCrmlYl80/ad5YhhLxTEPuQcGeSQHW/6nzQ27sFMI5ZPtkc0Fj7WzYO+BMrxAhd/aZGatD2ozNmq85b8M1iqrqGnwjU3tiHH0i2DFzKxvHC1UV2oQkdfwKBgDnVJc7E/MQkHXg4UvdzvBhckVOWWtP2/siQLgszm9/3KLJmNMEX5OTwZ9SDZqGUWBq7aOivuzo1xGffw6kAmGCrgfz4UyzONs5l3VRQNZUUFaRMWmBA+1YbyIEMJDrCcRt066muZtnnXvbsdk1d4NzcIaroqH/qIafzWJ/FuZR7
33930021-9dec-4472-9f85-cf148e273fb2	4c9b444f-0972-4eef-b437-6c15d8c1b932	algorithm	RSA-OAEP
40af7f99-b7b9-4bf0-8507-394cac5db729	4c9b444f-0972-4eef-b437-6c15d8c1b932	priority	100
90e848b6-ec38-495e-97d4-158f1a253f6e	4c9b444f-0972-4eef-b437-6c15d8c1b932	certificate	MIICmzCCAYMCBgGXE7+ZIzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNTI3MjE1NTEzWhcNMzUwNTI3MjE1NjUzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC4faGpv7aFYZUUA7ck37ZrQN9cHUxR+E+kN5ximU/nDyqE/C3lUBcmzj3BfTLcbSmuCLqqZRXRbeOPa1VZBPsELepDvcPhC7d60apO+hyzuM/JqZUblEJ8xqvCqFKZCuRNGn41abMR9CN0zQh2tLOxX/+m0O+A/IQIocyorgljvA3hvOSiEXn1dhoU8cABYIrEnuAxVuNg6nohLzvGmBIueFj2LEu0JleMyJaGAaI46ueiDv/HH5PV8osXXDlpNp+ceRns2clFv7K9EXCdEjOXPvtK5J3dlAz5oTe/m2W0U+h5Up8N91fVEztF/tUd1lnZjtP/h5B2FFA8ac7HE6glAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADqh+dzhIMsKrSjXuKXzt6T4oxbbyabeKRjxnSV8w5HVa8UPiLqjOkn7eCgAhgyzhg3ZOHZaNA4MRyyhEKlmu85GMUiWhdgQo5c64HwzooDD2C8ohCsN/AUrP05GeuYQ0hr5k3YCdAkdZA8ToZsl6LffawCqVk4Y/1MXJ2EKk4UJKvlat8+0K/0ffrUxzKNOxLlZJuZv6SBcCEZDkjXh57WH7rBz7nm9x4agp7L4S3PTW12ZyuLf92zISK2Owyt9ushoRtVg//QWGlf5gB020ah/VmGOCL+s7cR1W/d+aU7bDTqpH0fUXGp8oJPRzHYnLnAEGIup2yqmB1ubOHiGEU0=
428ba9de-6b97-4092-89e8-4c4e32a83991	d2a94fd3-f695-4b6c-bb4e-4c3823278d49	algorithm	HS512
9770f78e-0102-4965-b875-9e792c835846	d2a94fd3-f695-4b6c-bb4e-4c3823278d49	kid	8418792f-6876-4ba6-a215-8f1021b7bfad
90f1a305-44ee-48a6-9145-cef0ba5a01ab	d2a94fd3-f695-4b6c-bb4e-4c3823278d49	priority	100
fe107f64-41c7-4b20-a5d6-a3770ea71ebd	d2a94fd3-f695-4b6c-bb4e-4c3823278d49	secret	KcapkQuBv_l_0tAsKWbaknp3mVE7ZI3He4pHei8t7UrQnalWWsNVQM416Wt2MxpxIU8CnwPXCSHnmNtBUhQCaqWVI0QOIRyw8XbyQuTxcduA9HZDX3U6GD9mwT6doeGeTfPSeyrQX11e-sDjficoElLnhv6TvCnReGV3NWCEw4s
040aed76-a8f4-495d-a07e-09cda69b46b1	a1fdebda-2293-44ac-af5b-b847b4641159	certificate	MIICmzCCAYMCBgGXE7+YTjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNTI3MjE1NTEyWhcNMzUwNTI3MjE1NjUyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDZWfPeYyZesDFC5fFnKO6jWAqzG++FeINqTFTXp8f+GWCBeSNZIRee2wNQI63O3VtOQ9n8PkiQpUmJHMxOdsSBsFms43hX0tFj6pAC6eTpozmiEqKFR84+OowkAIh0RcG412pjXjzQyiGbtlElGUgCSk3Rv6ilRYkmBpuriwrXbIHY+3UjfS+l+bV7mWUOXKeB8T0BXL91UDP2z77wB3TVh2VrbdunkM0n3s1xzGx89QQ2viX96Ng1uWAwMy5H/T0w4mnjwOeIomAyJc6BMpVjHBZSWVHptofZ6kohwd7PGQqgTZV1xykJZcO50XOW+nvSH1a/xr8c+L9xlCrCjH8vAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAMQe1gkXI08eVAbEFw+sWe0tX+YL892TEYqSbDcRD4ai+C7Ql0m5LNL5hGo/mbBsl05UPv5d2zxg2Oyn70iq838CBNJuNz6B0qjtLhs0e1jmAjjq180TSTXR2eCIa4TS9O5PGLEHlaOWZ85aNv/1r/u8lULpS5XPUNjRJUtTI7ZWv1lo1Iix9P0wUjH5xpdyfaxjRKRfxu4AhhGeDj9bCTb/jfjaivXYnpkx4hnrAOnL2L98mr9oOgjBilWgMVBLFH4quFMZtYSllr+mp4d1g+QpFr77u0js/pPfWkil5LXH6hPzxLuwIV4IlWXWDnDfZphLu/6s2waWwJcuFDS0UR8=
482da88c-8deb-4f47-b40b-36ea9ff78fe7	a1fdebda-2293-44ac-af5b-b847b4641159	privateKey	MIIEowIBAAKCAQEA2Vnz3mMmXrAxQuXxZyjuo1gKsxvvhXiDakxU16fH/hlggXkjWSEXntsDUCOtzt1bTkPZ/D5IkKVJiRzMTnbEgbBZrON4V9LRY+qQAunk6aM5ohKihUfOPjqMJACIdEXBuNdqY1480Mohm7ZRJRlIAkpN0b+opUWJJgabq4sK12yB2Pt1I30vpfm1e5llDlyngfE9AVy/dVAz9s++8Ad01Ydla23bp5DNJ97NccxsfPUENr4l/ejYNblgMDMuR/09MOJp48DniKJgMiXOgTKVYxwWUllR6baH2epKIcHezxkKoE2VdccpCWXDudFzlvp70h9Wv8a/HPi/cZQqwox/LwIDAQABAoIBADFvbjI0pvN+a5XlquRlwPFSAwz925ql8G3q8pkiRjCbIQIRxWJuTmsJMVW2579XRX8lm5ztpZ+QmIshC68FAGjm7V6PVj3Ta2CoZxziifhB8cfVKTXbQSOSOXGu1Vpsy0T5ae8z7e0nLEG4U/h2KZSrxcthJkCA8lK9ygZYV5zrW42D1HGWObsmNAJvpF/ehrvWrfZN+noV8XPUmbt3ECzTaOzRbF8HZkSVi2SzdSEtpqNYxRBsaDWFocHtGW/UrFIH8Wp5iTTLbSBXdPTraseuwU2k+f/FQyshOO2x4S1MHIlrOQKTBnGpMDpwIQWV0Uu8LqKqB9XWi0nWKKwUzPECgYEA+7w6a83K2a3pA3F5CBtotLJkJJBvcTVyFn39Y3i9Pmax7jJ140kJWIjo6vjruKZh+jaEuEXMslB9JvbRLV9GrGNsdyQmuuZbZybZx4Y/11Qilg4KsvXIbxmaZpFVpphamVLUy6TTI4nZPC979U9raQqEWFKAucatZ06CMLkVr90CgYEA3QiaHsc91k5ZmP0Lq9srEU5Xg93Y7Gxx5AK6+TGMcWCEgqgdWvntEhwG4zk/4qT2LBeF2N3D3H5l+CzvFYlcDfTsOEwSVMgeVv3Sg5covllHUWiTDKY/Ckiih9ZyFAZKUBh54VBrkkgDewJx395nSFY6z7uK4ZUcggBacYgVAHsCgYAn7awqi0LAkjgiZq423foWpzEBJ7O1di+5Z5R4YZ9KtYlFadWPDnegBl9DXeYtrJ5fzKPygoe8RM4FDyMQmksgbsi2gRJvlLgsvVnPrviTU/IEcQe7aQa4sIvv9t9qBEJijWPZRTSEL4o4ZKO5vjYgPB3P0I5AaUX529cEmWbaNQKBgQCUQ+XmCW5AZ/QP/IWstOpxxGRN7y1IggHvmalD6Om1T7HzVsPCN+2/fQ9dshRZeqAquWiuLSvpptvNmo6Rmr8mGYmuxdByEH7RiZeBb48ECC0fvY8OKCIXStvDVKTXK9UDXze6XNCbojS7ectbCPus+TKgD8Q8R2KFDamdiFPWKwKBgDmeJSHpWAZdCP08mteEY1yqRdTFd4u4kGtI9E7FY/quw7Yr93AjotisaMAo5HearHm4F2N6ROGkgIdOM+q9WL7bxYbGkbFDiXYnoH7679TFraEjIw4KNQmpSCwHDDPQx7DNGi2boxgvU3qtud4BVcppdhoJKTPyBSJhrmhPTOpp
6417afad-c14f-419a-aab1-d4e850eff6b0	a1fdebda-2293-44ac-af5b-b847b4641159	keyUse	SIG
2f5de478-b363-477a-a32c-2e3c7ed5815e	a1fdebda-2293-44ac-af5b-b847b4641159	priority	100
2f427323-1da7-42d2-840c-f5e320094cdf	96a1a447-b041-472f-93c9-7607a6c31169	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
402667c6-8c32-4953-8e05-00608cccbfe5	4a40bfdf-fec9-4861-a3bd-da4a747dcde6	priority	100
6d926895-16db-4f1b-ac1f-e9c786a192af	4a40bfdf-fec9-4861-a3bd-da4a747dcde6	secret	wBtQAGC5Yc15u4UUQVBT_Q
76a2a126-4b29-4c26-a055-5c00c5e37bb8	4a40bfdf-fec9-4861-a3bd-da4a747dcde6	kid	e3e55918-baab-4387-bac3-18c0bb336854
0368ec39-9bbe-4e0d-9495-fad9bfb6f9c6	267aa9ab-02d8-4c44-8fd7-5b7c4e2d24c1	privateKey	MIIEowIBAAKCAQEAjv+9OIyoYNAbEysOsUdANDd2gKBiHLCWXXPKF78PFTmMgH//wSkascndfGfghmcYLxB9HDi77KzUH3Sn96bPYpdyGUdq8DUngK5N1GpSuG6BO11OSPpywB2xELSCVuTID3whvYQRyxWfMCrfTg8S6ay9znBrJxyNcle+EyM4WhlAQDae6JkFAqr+3m+MEVVQ1u0iMDv4NbWfT27bzgDLDy2nm+9Q8mNOPRZUIUTAJXUmCkVpmmVUJBqrqzr3X+LzPHmKbZ3XhBm6iCiXutwckUMxGGQVo1BFb6vZjX4zlWEsK/VV6QCyU03RFZqR2/tV3tdYokIu3EBC5vl5eG8sWwIDAQABAoIBAAaM9Dk/HEbUZwEcSP/ZpePJIfkSH8cfrGuwg7KjHR5ESh7oKNT2PJOmDdWGmVRJgblE4Jj73QP3sNSWDqG7dvxAYsjXVYXrxsOleHRBa0j+lZXyGBrOD5akZY7rLfNWvKFqTCNh2uzPhet6HfZLSNBX35lcMKm/LELvfl9jDtBLDqFCZNmWi/aAz4KfXwDYXIZIA/jdAwzVSmOD43jisRGyByAWpQtYyYYUPLIpM6DBLZ1ewXY2VZFRr1Np5Q549u8Fd8I6XzshkoeGdsctrcAd7Rp/cxwOlwanxhEgTLXknWLCGLdfNYlcnJNHIcjCyjKbm1jEFjz7n1eevjFKjfECgYEAw5uNuknD+RjBBPFNu4U45O59lB6QGZiKnw71rW5hi8zsfEv6JeY9wagh5uuCDWwq1rhDYenG5tio7dsFiSX68RNiL1fEUxFk08QhrAyQUbNdfJWiqr6Wykr59T8XwgFbKQwcMQGrReLFfPSdxe2ZyG/o2+LfSY6/TYR0SGEqjmsCgYEAuyYZp9ZhoHs1OjoV832DPe8u2s9J5lR8xZn4iRuTUBwPC3Bv+gCxJmjGp6Tg3BWVxbOrWfc2fDfo5Xhx/YIdjYnTgzBi77D1I9ckhtW5RfIQLhm9JRHNU/uRf37CuLw61Bf57u3n7aJrB2htcxKsDhpYL3zv1dkw1QvR8CdOddECgYBbVmVlmVBDHoXy0uJjL6ATdjF5WpQa/5mrEAc0BpjR+MxsdeXGkK5BoUrDUzEVJ28ReFUugUT5Qi4PcvgwxGVa8JwmUys/Rp34LFs0xWEWZVS/+fdNF1W9/Cifleh4FL4GersnPwpExdFFuct6QqpOZ8Mp+dQduuQlRDYwHf8LJQKBgGKf5HtPfeldpKJHxBOqPESiTJXhEXfBZHOZ/aD7mDlqX/9ORKSCQtkT9ESanik9cs1aLt3daqgxqplrTN8k98AENyP2ltzr63P0x/oKnXWf6CjzRXtIk2VDuNxwh9tkzrfA3uSsGUJhCng/7xXqbCOOfJSiCZ4vtA1CCmO9wxpRAoGBAK2a6bvyY6ligVCGKaAMV8cwn7YYJj3/52nf9aEjDqmYruAFFmB9BQ//sYOzsevR+orTx+6rMNTu8cU2NTiNEQ306sSAlXngJ84bY6PDxv1vYUyfGolZGTy2SqoPlMEsB8psDRYZTFljCwpBmoMgpbjHYZkF8/dyAiMWMQP1dGNS
c9dcbbbd-d33e-4321-a83f-fbed32a9e1a0	267aa9ab-02d8-4c44-8fd7-5b7c4e2d24c1	keyUse	ENC
8d8072ae-7954-4326-a3cc-a7fcab1da05e	267aa9ab-02d8-4c44-8fd7-5b7c4e2d24c1	certificate	MIICszCCAZsCBgGXE8OAyjANBgkqhkiG9w0BAQsFADAdMRswGQYDVQQDDBJtaWNyb3NlcnZpY2UtcmVhbG0wHhcNMjUwNTI3MjE1OTI5WhcNMzUwNTI3MjIwMTA5WjAdMRswGQYDVQQDDBJtaWNyb3NlcnZpY2UtcmVhbG0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCO/704jKhg0BsTKw6xR0A0N3aAoGIcsJZdc8oXvw8VOYyAf//BKRqxyd18Z+CGZxgvEH0cOLvsrNQfdKf3ps9il3IZR2rwNSeArk3UalK4boE7XU5I+nLAHbEQtIJW5MgPfCG9hBHLFZ8wKt9ODxLprL3OcGsnHI1yV74TIzhaGUBANp7omQUCqv7eb4wRVVDW7SIwO/g1tZ9PbtvOAMsPLaeb71DyY049FlQhRMAldSYKRWmaZVQkGqurOvdf4vM8eYptndeEGbqIKJe63ByRQzEYZBWjUEVvq9mNfjOVYSwr9VXpALJTTdEVmpHb+1Xe11iiQi7cQELm+Xl4byxbAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEXOyQ+Qg3oxrJG97h41zkB9g+9w8w7W9yhwb07W2nW/CT5sS8i5UFN64gpAajK4bt4zCWIIBaC4dN560n6W9933G/z/O8Vwtpx5sOzPhHgbxSS+vhfkA9bCgEtz7wG1DV4XCwiJ1k5nfLEEyLq0VL7D91u7g8UZXSByw01B9l1F8tF9BFieKQ9FjrUGwaH+sQ0fNiC5JVl0MphUCEiaWo1BpSYa1YqNI24hlH5kg5eloX3lJC3dAJyJImVdKcjvzvHmCV+BKt8nXHknupAgCQigk/H/pFdtxg6pXtaEZbuJxwsnvLscACnA4B0Zs1YzOUsF48iS7MsdCmOPF9hnBPY=
cb9b057a-96bf-4118-8a75-2422d16421ae	267aa9ab-02d8-4c44-8fd7-5b7c4e2d24c1	priority	100
3866132f-2387-4fac-8de9-7cff2bbbd864	267aa9ab-02d8-4c44-8fd7-5b7c4e2d24c1	algorithm	RSA-OAEP
ff872edd-9fce-4cb7-a38f-33ac1f75716c	29d73152-0f15-4a06-b50e-4fb8ffe1b212	priority	100
73daad41-9bd2-4c3d-8bd4-359be4409378	29d73152-0f15-4a06-b50e-4fb8ffe1b212	kid	2239ee9f-82ea-494a-ac5b-6151ca604065
f802c554-bd48-4fef-8cf9-2689b09b9ce7	29d73152-0f15-4a06-b50e-4fb8ffe1b212	secret	J_g6hAqfvIhFeme1tgwcFQyfIsGqUlM_OWn4fVMOBtYO2kS4zOawIhrRBc1XEKWbrM3mJ4S-ns4t78s1cSgvPKwIomI-HOa_nT6JHl0DYCroSvYdL81THUyA8M3FSsJy0KEKVSkCyHAkDaKiYT-irUFsjI1LeRfaDNNJR3Fc3aQ
ae15d71e-d657-4011-bf15-ff2e569246ae	29d73152-0f15-4a06-b50e-4fb8ffe1b212	algorithm	HS512
e5ee4774-c062-4689-aad4-9f37609a7f7d	83af7b75-041c-42fc-8f4c-463e563c5575	priority	100
5cd602ad-95e8-4a3f-afb9-c76ae4736982	83af7b75-041c-42fc-8f4c-463e563c5575	certificate	MIICszCCAZsCBgGXE8OAKDANBgkqhkiG9w0BAQsFADAdMRswGQYDVQQDDBJtaWNyb3NlcnZpY2UtcmVhbG0wHhcNMjUwNTI3MjE1OTI4WhcNMzUwNTI3MjIwMTA4WjAdMRswGQYDVQQDDBJtaWNyb3NlcnZpY2UtcmVhbG0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvPecVnxgi7QHDj8TPhetg+9KzaCbrjyF+dlCqWWja9SntWCeyPvQWf4AGDSpAGfNPgQFMifKN/nWc2SR6Y1JJTZ41F03IMGK10e5+ZbXSbwsFdgYk6MFkYhJLTDpnZr1rUr06/pDSlKO6sdvRyUpSO6oQyTc1Opcg9uhoMhw/+uVha/eTUb6xkwGxjOEjbLSReilf55knIZwEeM8PY9eZTffvm3Njb2dM3Tatw2f8HSOGyu62KdI85X1nMwZd5WURhuwAZ4Zo5XwFoDnTqcxU5HVUCc4llp8gWfZuwrmsv9drBivKFQcA7QE5F1I2ENniVwYKH2mzZ4uEKeFwUMdZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFoPpQpYi0gSgtDlpw9qJ4C8ahoz2/A/Y06U9VJxePiikQj9a+m5MS6njBh4+b8976onK/KpQLRMrAktNvfmUspVXmdsQbZlm2qa26NQVhBOc7yRdDL9nLRzAFJmxLeY+hzXFErjb+HLdVRYQpxXc5/MbtvAVkoqcU4rq2kYSzH0UU4Wl1TCQmxoPxCfDayjyTdPWpHlWYJ+dCkZeI0ZHXXRDpHoOU6aECSSGd8kSLJJpXnntFP24QMvG9FkHgPx+lYjVQplbpDFq3jfAXSCSGqZsLvMNfULr0go4DK9uYfNL8KQPE8PJcr8+MibKYiKHR3gtYntLmish9o3Ffy6+4w=
8d169776-1375-49dc-9432-9e5a5c0cd746	83af7b75-041c-42fc-8f4c-463e563c5575	privateKey	MIIEowIBAAKCAQEArz3nFZ8YIu0Bw4/Ez4XrYPvSs2gm648hfnZQqllo2vUp7Vgnsj70Fn+ABg0qQBnzT4EBTInyjf51nNkkemNSSU2eNRdNyDBitdHufmW10m8LBXYGJOjBZGISS0w6Z2a9a1K9Ov6Q0pSjurHb0clKUjuqEMk3NTqXIPboaDIcP/rlYWv3k1G+sZMBsYzhI2y0kXopX+eZJyGcBHjPD2PXmU3375tzY29nTN02rcNn/B0jhsrutinSPOV9ZzMGXeVlEYbsAGeGaOV8BaA506nMVOR1VAnOJZafIFn2bsK5rL/XawYryhUHAO0BORdSNhDZ4lcGCh9ps2eLhCnhcFDHWQIDAQABAoIBADu3N/I9uw9XvUSjTrk61OlBFt0s7ipSJWM/NSC/hAQtDAMFic1rN2kdPIaTYOTkEu3yM3ud/GoXnoN62TvdcZJqITHNRaOknVaA+ajXxvw0+8f6HoDgUdp/suU2ziYjNAQI91PNoJMptJtvdU1JLwrTqxG6R5ZbZ1mD2dF71fWU27wns3AvjAvwcSSSak7N6MOmUP5QAEHqQBQiZDD0FJVrgWntCvGU92ds3bqSWQxw5sCwM96Cs7x4q6okz0cue6PMz/n4CW3uQPUlbbCquRi6xqMuDck98oNhmt73XzxMjTKjBqzV4FTe1JnOegkKfqQW7X+HUOZlGaQOxYvnjQsCgYEA71FXCIBqXMBDiuzmJI/TsvSO6AYbJAAaEkzyXC86jNOHw0Hg7BTMV1tyUK9i8F/0Q3m8ql06fYLj7FkWVGajlXFiL0DFYj67ExhRV142Fc7urvs4C99AO3HOf16wClytjuuWwyYsIi3guWpH9yfnsiB237AHUrHkgtxV2p9iPR8CgYEAu3UeT0SS3MUhtrWSJ+6MnSfA6K0nG20HY5YPGMb/JEvuiPBkkumCqXVThfq1Lxo8wAE83p8MV13pm25uY1FJDsow1VzFA2Lk/wsYqnu6o1K3Nex2S4rK4V8AObkMR8UuWE2jCPiATua3gV/BIzN6hLX0AjcH0xQsfhxOUdWf9IcCgYA9Fp1JzUXZQTa8irZAlPosDyM/dPeOm/wLudqPz3p5ojFglTtt5+01S2GF2Q8/Xq8CXlvbfQrGKRg3J5J8nuqY5iVy/GymJG8qc6Wn0KOrs3PX9MacuTMzOVzFxIzZSEkBV3/XdrIDU4Sur8OJAoWxQXo2pT9pS4GSKd48fTzdbwKBgBx/WoM8boMnaM+o3LY7Wp8NixMUN6zAr23hQxxGLEVtUa75tKBs5VMzpeXpTiACAhhCV+mUDkE94qShbiClG9EmxbO57a1tHFj1a+OG+cGYcoe9EeK8D8mhMpyT2B0VCc2cx9s2Q/M6uczuLKNYURjZvGWVzhe1qmnljbZ9HlsDAoGBALiwuH8/Vp/7mgB/uAWHk3QRmpxICK9lbM0eLMQ/mgV+DvfUqYy1QAlm1BibVD47wVFze9R4NX41lIcSfy/68Bd3T/UhAWl8SrxE/ERO/K/68QNBiMUFOHi4oRzKka1HY12EPqOirz0QexKEiFCypYSpWclWwZCeFjY1ZeN/Sd3v
e209e32a-444f-4d75-bd11-5227668f7462	83af7b75-041c-42fc-8f4c-463e563c5575	keyUse	SIG
ea48a4ed-e39d-470a-8694-032240762351	b7171801-a536-4c5b-ab84-d9fe5102f67a	priority	100
d2e52f11-35eb-44ca-90c6-f2aaf6fa3e57	b7171801-a536-4c5b-ab84-d9fe5102f67a	secret	RiGtxKNcrLrbpEZG8KHudg
421b9f6c-2efd-488d-8bbb-e3fa40bd041c	b7171801-a536-4c5b-ab84-d9fe5102f67a	kid	f0168138-2e33-40e4-8baf-2dd103f10537
4fa89ceb-991d-4ed9-8835-8d5ef0a22763	663d6ddd-9976-4b2c-8f75-ab9c4a17bb90	client-uris-must-match	true
12ed1f9e-eff8-41b0-981c-7c818684f93b	663d6ddd-9976-4b2c-8f75-ab9c4a17bb90	host-sending-registration-request-must-match	true
f5ef4f79-41e8-4d1c-be78-95872d28c299	4f6822e2-e596-43ec-b6ab-16f1dc97464b	allow-default-scopes	true
d7c342bc-3748-47ea-98d7-c3c3bebdd1e4	7572a869-ec9d-45fd-b711-4804d1b222aa	max-clients	200
b5f87bb0-96c6-4944-a794-b501e757d615	540513ab-9162-4c2a-aedb-cb1406b85daa	allowed-protocol-mapper-types	saml-user-property-mapper
b79246b5-a417-4abd-93e3-1d8a1c6f40cf	540513ab-9162-4c2a-aedb-cb1406b85daa	allowed-protocol-mapper-types	oidc-address-mapper
fc1a6e60-7cb6-4439-8f72-84fed4878de8	540513ab-9162-4c2a-aedb-cb1406b85daa	allowed-protocol-mapper-types	saml-user-attribute-mapper
0537c66f-1d6d-42bd-b82b-714b5d1fed26	540513ab-9162-4c2a-aedb-cb1406b85daa	allowed-protocol-mapper-types	oidc-full-name-mapper
9a96fbed-daaf-4d79-ae98-32a0612a189c	540513ab-9162-4c2a-aedb-cb1406b85daa	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
61d1b42f-5c4b-4ce9-8b2a-28673e6e19bc	540513ab-9162-4c2a-aedb-cb1406b85daa	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
51e261d4-74ea-4c14-ac83-61b19efae6a3	540513ab-9162-4c2a-aedb-cb1406b85daa	allowed-protocol-mapper-types	saml-role-list-mapper
21bca517-97d5-4682-bc83-da82b5c29925	540513ab-9162-4c2a-aedb-cb1406b85daa	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
5dc1a268-24d0-4d59-9ae9-6bd975a5c3cf	4c2ba9ad-a85e-4e11-bcba-8167f12526a8	allowed-protocol-mapper-types	saml-user-attribute-mapper
0420c4b7-f029-4bdc-8fcc-60cd8ff85050	4c2ba9ad-a85e-4e11-bcba-8167f12526a8	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
3606d2de-309e-4c77-b0ae-752241d40402	4c2ba9ad-a85e-4e11-bcba-8167f12526a8	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
6f5901d7-05c4-41d4-a1c8-1dc462cb06fd	4c2ba9ad-a85e-4e11-bcba-8167f12526a8	allowed-protocol-mapper-types	oidc-address-mapper
d6104ae0-ef6b-4cf9-86a2-bb777bbce273	4c2ba9ad-a85e-4e11-bcba-8167f12526a8	allowed-protocol-mapper-types	saml-role-list-mapper
99f4c0ef-ee97-469f-9c81-0627f38f97b1	4c2ba9ad-a85e-4e11-bcba-8167f12526a8	allowed-protocol-mapper-types	saml-user-property-mapper
d733f092-5b3f-41d6-a67a-d512d1f9b3dc	4c2ba9ad-a85e-4e11-bcba-8167f12526a8	allowed-protocol-mapper-types	oidc-full-name-mapper
0088d4ea-90e8-4d43-81c9-c51d738b0f2a	4c2ba9ad-a85e-4e11-bcba-8167f12526a8	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8e768ec2-0c10-424f-aba2-42d680ddd38f	ff3981aa-26ca-4474-a093-a9eb32f39b06	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
26a78061-dde5-410d-817b-158914fcce25	4173feb9-2b47-4231-bd99-cd62db2cf423
26a78061-dde5-410d-817b-158914fcce25	7039b8c9-71d5-4708-ada4-eef36014492f
26a78061-dde5-410d-817b-158914fcce25	e5f6bd3d-6101-4691-89db-90c26ad21873
26a78061-dde5-410d-817b-158914fcce25	79b45d1c-85a7-45a8-b458-f22217caa9f2
26a78061-dde5-410d-817b-158914fcce25	6bebb5e3-8120-4a4b-9b3d-97bcbb569113
26a78061-dde5-410d-817b-158914fcce25	d47a50d8-3cec-4ed8-a0f0-f85b69adf9fe
26a78061-dde5-410d-817b-158914fcce25	6dcc0cf4-76cf-4b95-a39d-afae7eb7e370
26a78061-dde5-410d-817b-158914fcce25	2834fc98-494e-4cca-8f99-7c95bb8b65d2
26a78061-dde5-410d-817b-158914fcce25	8d90be7b-e7da-400a-b73a-1f821279f9eb
26a78061-dde5-410d-817b-158914fcce25	88379d73-c5f2-485a-bc01-332fef52d210
26a78061-dde5-410d-817b-158914fcce25	53314414-a720-4be7-81dc-61fafcb8006f
26a78061-dde5-410d-817b-158914fcce25	07fcba8c-fb49-4206-94ad-fdbe8a60f5de
26a78061-dde5-410d-817b-158914fcce25	020ce401-fc50-4250-96b6-b64b47641653
26a78061-dde5-410d-817b-158914fcce25	8b406055-ba45-4b12-83ff-7a5b0a913a23
26a78061-dde5-410d-817b-158914fcce25	d6834ae5-323a-4c07-9c54-14576209d619
26a78061-dde5-410d-817b-158914fcce25	7f034aa2-05a7-48fc-a8ed-249e9363e1e6
26a78061-dde5-410d-817b-158914fcce25	d092c547-fefe-4d03-9f50-c2e6952adabf
26a78061-dde5-410d-817b-158914fcce25	a8f253cc-c129-4eab-8541-1eee29424353
6bebb5e3-8120-4a4b-9b3d-97bcbb569113	7f034aa2-05a7-48fc-a8ed-249e9363e1e6
79b45d1c-85a7-45a8-b458-f22217caa9f2	d6834ae5-323a-4c07-9c54-14576209d619
79b45d1c-85a7-45a8-b458-f22217caa9f2	a8f253cc-c129-4eab-8541-1eee29424353
f24e02a8-9e85-4b28-b527-13941514017d	5eeb6e14-33c8-48d8-b29e-6399b63f41bf
f24e02a8-9e85-4b28-b527-13941514017d	273925b7-d838-413d-b31b-19e02dd9893e
273925b7-d838-413d-b31b-19e02dd9893e	8d19e50f-3a8f-469a-8e82-b350b48042c0
ed9a9890-6f3b-4fbb-ad7b-53c1f0209b7e	c9e01250-66d2-42e6-b885-8cb0b090a467
26a78061-dde5-410d-817b-158914fcce25	758e8db2-f84d-4333-a764-f05cc9c2295f
f24e02a8-9e85-4b28-b527-13941514017d	2f4da990-af73-45e4-96e7-3513ddf7b0af
f24e02a8-9e85-4b28-b527-13941514017d	c3c319cd-22a4-4e84-b1a0-77130a153b22
26a78061-dde5-410d-817b-158914fcce25	61902238-d048-42c1-ad0d-72e676b9aa5a
26a78061-dde5-410d-817b-158914fcce25	5872481c-076e-4dcf-a18b-b33f185c0303
26a78061-dde5-410d-817b-158914fcce25	bdd2db8d-e8dd-411f-840d-1e71e3fab9d5
26a78061-dde5-410d-817b-158914fcce25	c488cc1e-968b-477c-8ce2-d13b5fb36334
26a78061-dde5-410d-817b-158914fcce25	b1d9e2e1-fffe-481f-bca4-e6ebee1486ae
26a78061-dde5-410d-817b-158914fcce25	4e7e14f7-c2d3-493d-80a0-4cf32c4273f6
26a78061-dde5-410d-817b-158914fcce25	297f2fc0-7682-4847-881f-d036a21ac3d2
26a78061-dde5-410d-817b-158914fcce25	bdb3b79b-d6cb-480e-a48a-62987da8972a
26a78061-dde5-410d-817b-158914fcce25	e489eb85-673c-45b9-953d-574393eb594a
26a78061-dde5-410d-817b-158914fcce25	3bb4fbf9-5de6-4ed0-a537-6d34a7318057
26a78061-dde5-410d-817b-158914fcce25	29f45875-c006-4763-9a5f-8355e810955b
26a78061-dde5-410d-817b-158914fcce25	bd06ed44-5b95-48c0-826d-f4e0e7208342
26a78061-dde5-410d-817b-158914fcce25	f0dffc82-d4ea-4efe-9da0-db262647cc58
26a78061-dde5-410d-817b-158914fcce25	e26d0304-ff2c-4582-b922-fee73467fa81
26a78061-dde5-410d-817b-158914fcce25	cefa03c2-622a-4d41-a546-5f64e350e6ba
26a78061-dde5-410d-817b-158914fcce25	f6ee112f-6931-414b-8aab-803d18ceff11
26a78061-dde5-410d-817b-158914fcce25	9dab4d5d-adaa-4122-bafc-d8742dc55000
bdd2db8d-e8dd-411f-840d-1e71e3fab9d5	9dab4d5d-adaa-4122-bafc-d8742dc55000
bdd2db8d-e8dd-411f-840d-1e71e3fab9d5	e26d0304-ff2c-4582-b922-fee73467fa81
c488cc1e-968b-477c-8ce2-d13b5fb36334	cefa03c2-622a-4d41-a546-5f64e350e6ba
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	7bf0b5e7-9676-44a2-b5ec-70037b5ac502
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	15e147c5-dbb5-44d2-bada-a11c74b109b4
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	f9033825-7182-40f8-9aaa-f44f6308bc95
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	35c1f7ab-5498-4d0b-874f-1217c07e9c1e
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	6f8934e4-4d18-4502-8f03-b24de5225ca5
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	76046636-e9e6-434f-83bd-068783db561b
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	bac1f1f6-642c-4462-b4f5-1aed7adb0b89
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	3b5ce055-89f0-4a16-82a1-104fdd340440
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	edf24d53-2dc0-44c0-a54e-4c9fcebd9b06
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	334e5750-05ca-4fb0-a6ff-8074a1bded22
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	964f6fbc-284e-4bb0-a43d-5c3a6ddc7922
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	195e21c7-6a25-4f93-b4ef-d1d525e2a7d7
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	b5e6af65-0e93-49f9-ac61-b437bcf686b9
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	3a1e652e-ae8f-4d75-8b62-3edc9d782450
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	ce045f9e-6ae4-4f88-926f-364982629d06
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	ea298942-ef1c-481f-ba6c-fae04919b756
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	e8b37979-df9e-4283-a978-d1a3cce2f643
35c1f7ab-5498-4d0b-874f-1217c07e9c1e	ce045f9e-6ae4-4f88-926f-364982629d06
c44996aa-ddd1-4f7c-88be-5a7a68d5bbe6	2881dfa3-ceb8-4f6d-9b72-1f03eef60370
f9033825-7182-40f8-9aaa-f44f6308bc95	e8b37979-df9e-4283-a978-d1a3cce2f643
f9033825-7182-40f8-9aaa-f44f6308bc95	3a1e652e-ae8f-4d75-8b62-3edc9d782450
c44996aa-ddd1-4f7c-88be-5a7a68d5bbe6	18fec74c-2066-4a21-944a-da2e0a3dd3b8
18fec74c-2066-4a21-944a-da2e0a3dd3b8	044f16e7-ce3d-4609-8363-0a6a2e46360b
f834e586-4fa8-4b2a-bf14-fd9e7c662c46	8a5aa85f-9886-41fe-a038-fb2ce66ab9be
26a78061-dde5-410d-817b-158914fcce25	85771159-ae8b-4abb-9ffb-d5e94dc77c81
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	f971bef0-1302-432d-ab7a-8592ee927f26
c44996aa-ddd1-4f7c-88be-5a7a68d5bbe6	46bc56db-5b9a-49b9-8807-7f7863dd744f
c44996aa-ddd1-4f7c-88be-5a7a68d5bbe6	5c82a412-2664-436c-99be-396dc92c6a04
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
990d6693-206d-4609-a70c-bc09693042aa	\N	password	aa10695d-4cfd-40e4-9623-88fd11cbd142	1748383013446	\N	{"value":"xQGX6GGDgREIm1IwSMnXt6W0MOKhXu97o1TRJOZl9fQ=","salt":"/2FF0V72TuNc2P0qbKElKw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
6f93707f-ac78-4040-8e0b-21b4ddb3a8d2	\N	password	6cbf3695-c463-48ca-85d4-d36c2aa9870b	1748383397957	My password	{"value":"OQHHAEESX8pDax9hIcHID4dULsM8PliEA4Bt8XauDs0=","salt":"/kIjhAoGjZVSn4dSYM6rnA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-05-27 21:56:43.957051	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	8383003488
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-05-27 21:56:43.977933	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	8383003488
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-05-27 21:56:44.016421	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	8383003488
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-05-27 21:56:44.022615	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8383003488
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-05-27 21:56:44.111061	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	8383003488
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-05-27 21:56:44.119229	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	8383003488
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-05-27 21:56:44.201243	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	8383003488
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-05-27 21:56:44.206057	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	8383003488
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-05-27 21:56:44.216564	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	8383003488
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-05-27 21:56:44.335423	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	8383003488
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-05-27 21:56:44.386764	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8383003488
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-05-27 21:56:44.392161	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8383003488
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-05-27 21:56:44.41597	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8383003488
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-27 21:56:44.431107	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	8383003488
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-27 21:56:44.434375	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-27 21:56:44.437494	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	8383003488
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-27 21:56:44.441071	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	8383003488
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-05-27 21:56:44.472316	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	8383003488
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-05-27 21:56:44.507658	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	8383003488
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-05-27 21:56:44.514287	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	8383003488
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-05-27 21:56:44.519199	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	8383003488
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-05-27 21:56:44.523627	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	8383003488
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-05-27 21:56:44.625761	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	8383003488
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-05-27 21:56:44.63237	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	8383003488
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-05-27 21:56:44.634479	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	8383003488
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-05-27 21:56:45.085182	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	8383003488
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-05-27 21:56:45.125716	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	8383003488
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-05-27 21:56:45.129435	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	8383003488
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-05-27 21:56:45.162254	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	8383003488
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-05-27 21:56:45.183154	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	8383003488
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-05-27 21:56:45.20333	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	8383003488
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-05-27 21:56:45.208311	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	8383003488
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 21:56:45.215374	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 21:56:45.218398	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	8383003488
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 21:56:45.237937	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	8383003488
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 21:56:45.244925	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	8383003488
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 21:56:45.250483	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8383003488
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-05-27 21:56:45.255534	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	8383003488
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-05-27 21:56:45.26036	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	8383003488
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-27 21:56:45.262171	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	8383003488
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-27 21:56:45.264483	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	8383003488
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-05-27 21:56:45.269712	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	8383003488
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-27 21:56:47.009058	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	8383003488
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-05-27 21:56:47.01727	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	8383003488
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 21:56:47.0271	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	8383003488
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 21:56:47.035746	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	8383003488
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 21:56:47.039586	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	8383003488
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 21:56:47.219433	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	8383003488
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 21:56:47.225696	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	8383003488
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-05-27 21:56:47.252345	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	8383003488
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-05-27 21:56:47.67005	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	8383003488
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-05-27 21:56:47.67695	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-05-27 21:56:47.681674	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	8383003488
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-05-27 21:56:47.686249	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	8383003488
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-27 21:56:47.695899	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	8383003488
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-27 21:56:47.704596	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	8383003488
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-27 21:56:47.777722	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	8383003488
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-27 21:56:48.284149	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	8383003488
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-05-27 21:56:48.307306	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	8383003488
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-05-27 21:56:48.314244	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	8383003488
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-05-27 21:56:48.325464	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	8383003488
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-05-27 21:56:48.330869	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	8383003488
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-05-27 21:56:48.336521	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	8383003488
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-05-27 21:56:48.340797	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	8383003488
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-05-27 21:56:48.344843	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	8383003488
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-05-27 21:56:48.399171	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	8383003488
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-05-27 21:56:48.438472	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	8383003488
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-05-27 21:56:48.443513	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	8383003488
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-05-27 21:56:48.48956	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	8383003488
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-05-27 21:56:48.495227	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	8383003488
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-05-27 21:56:48.501591	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	8383003488
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 21:56:48.512669	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8383003488
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 21:56:48.524624	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8383003488
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 21:56:48.528036	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8383003488
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 21:56:48.5559	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	8383003488
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 21:56:48.629117	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	8383003488
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-27 21:56:48.636817	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	8383003488
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-27 21:56:48.639845	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	8383003488
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-27 21:56:48.659514	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	8383003488
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-27 21:56:48.662495	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	8383003488
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 21:56:48.709781	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	8383003488
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 21:56:48.712782	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8383003488
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 21:56:48.71945	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8383003488
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 21:56:48.722191	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8383003488
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 21:56:48.771909	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8383003488
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-05-27 21:56:48.778452	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	8383003488
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-05-27 21:56:48.787389	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	8383003488
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-05-27 21:56:48.795447	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	8383003488
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 21:56:48.809209	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	8383003488
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 21:56:48.819183	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	8383003488
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 21:56:48.866794	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 21:56:48.87709	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	8383003488
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 21:56:48.881711	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	8383003488
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 21:56:48.891967	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	8383003488
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 21:56:48.895293	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	8383003488
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 21:56:48.903884	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	8383003488
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 21:56:49.016617	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 21:56:49.019147	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 21:56:49.039022	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 21:56:49.132533	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 21:56:49.135604	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 21:56:49.186501	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	8383003488
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 21:56:49.192256	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	8383003488
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-05-27 21:56:49.201234	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	8383003488
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-05-27 21:56:49.253944	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	8383003488
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-05-27 21:56:49.307484	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	8383003488
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-05-27 21:56:49.375517	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	8383003488
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-05-27 21:56:49.380712	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	8383003488
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-27 21:56:49.435892	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	8383003488
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-27 21:56:49.439108	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	8383003488
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-27 21:56:49.451545	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-05-27 21:56:49.458294	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	8383003488
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-05-27 21:56:49.469579	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	8383003488
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-05-27 21:56:49.473532	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	8383003488
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-05-27 21:56:49.479722	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	8383003488
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-05-27 21:56:49.481789	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	8383003488
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-05-27 21:56:49.487393	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	8383003488
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-05-27 21:56:49.49074	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8383003488
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-27 21:56:49.636048	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	8383003488
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-27 21:56:49.642723	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	8383003488
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-27 21:56:49.651433	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-27 21:56:49.717871	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-27 21:56:49.723808	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	8383003488
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-27 21:56:49.725607	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-27 21:56:49.730829	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8383003488
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:49.739789	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8383003488
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:49.798793	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:49.896215	128	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:49.964344	129	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:50.045403	130	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:50.116606	131	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8383003488
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:50.120748	132	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:50.193513	133	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8383003488
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:50.207891	134	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	8383003488
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:50.217728	135	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	8383003488
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:50.219865	136	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	8383003488
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-27 21:56:50.346221	137	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	8383003488
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.354285	138	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	8383003488
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.375379	139	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	8383003488
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.423811	140	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	8383003488
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.430094	141	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	8383003488
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.437358	142	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	8383003488
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.481038	143	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	8383003488
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.627245	144	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	8383003488
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.688599	145	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8383003488
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.701835	146	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	8383003488
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-27 21:56:50.707609	147	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	8383003488
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-05-27 21:56:50.71712	148	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.29.1	\N	\N	8383003488
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-05-27 21:56:50.732469	149	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	8383003488
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-05-27 21:56:50.738054	150	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.29.1	\N	\N	8383003488
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
56b327ff-740d-4ddf-9176-2d0997c1abec	b74709cb-5868-4cac-a860-84f5ebe5c0fb	f
56b327ff-740d-4ddf-9176-2d0997c1abec	3fc1e194-7f03-4ce9-9421-44f991f3ce6d	t
56b327ff-740d-4ddf-9176-2d0997c1abec	df5d31dc-719a-4a90-b63c-fcd7e9157093	t
56b327ff-740d-4ddf-9176-2d0997c1abec	56a06bc5-035f-43cf-97d3-75d0fb73048b	t
56b327ff-740d-4ddf-9176-2d0997c1abec	94d0cb07-84a3-440a-975f-a519fda69f7b	t
56b327ff-740d-4ddf-9176-2d0997c1abec	712e8e55-ebc6-45af-be41-96c280a2e970	f
56b327ff-740d-4ddf-9176-2d0997c1abec	2829ae55-ef6a-432b-93c8-e5f924e6ea14	f
56b327ff-740d-4ddf-9176-2d0997c1abec	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c	t
56b327ff-740d-4ddf-9176-2d0997c1abec	b50ce408-a9f5-4a54-8e94-54f2197956ff	t
56b327ff-740d-4ddf-9176-2d0997c1abec	127bdce0-88fd-481c-aa97-433b7f9c2f5c	f
56b327ff-740d-4ddf-9176-2d0997c1abec	b7f0cff9-5433-414e-b6ba-126725261b54	t
56b327ff-740d-4ddf-9176-2d0997c1abec	9d99c46d-3468-4fe2-9bdb-b0ba44b86931	t
56b327ff-740d-4ddf-9176-2d0997c1abec	484303a4-808c-4590-a033-92d493652055	f
c06c755e-09ee-4891-9c04-67318d8ec8d7	60accfc9-ef06-4a93-a901-606908128e47	f
c06c755e-09ee-4891-9c04-67318d8ec8d7	15da97c7-4b33-4b9b-8667-e9f6d6a62177	t
c06c755e-09ee-4891-9c04-67318d8ec8d7	57dd1fb7-5792-479a-adf3-7f137ee28c33	t
c06c755e-09ee-4891-9c04-67318d8ec8d7	71b18bcc-1019-4332-924b-09dd77da1c92	t
c06c755e-09ee-4891-9c04-67318d8ec8d7	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7	t
c06c755e-09ee-4891-9c04-67318d8ec8d7	fb26d20a-f1e2-4344-a4df-77b1745af85d	f
c06c755e-09ee-4891-9c04-67318d8ec8d7	1407b722-eb03-451a-a1ec-b7e030bcc382	f
c06c755e-09ee-4891-9c04-67318d8ec8d7	688e61e6-34cc-4326-b31b-9695c24896a8	t
c06c755e-09ee-4891-9c04-67318d8ec8d7	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d	t
c06c755e-09ee-4891-9c04-67318d8ec8d7	ebcfc508-1a65-4be4-9514-98186373acd7	f
c06c755e-09ee-4891-9c04-67318d8ec8d7	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae	t
c06c755e-09ee-4891-9c04-67318d8ec8d7	053b2279-7f1b-4e73-be85-85c8fa9f3bdc	t
c06c755e-09ee-4891-9c04-67318d8ec8d7	2a9bf981-b6d8-4937-8943-7d4c2f4588fd	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
f24e02a8-9e85-4b28-b527-13941514017d	56b327ff-740d-4ddf-9176-2d0997c1abec	f	${role_default-roles}	default-roles-master	56b327ff-740d-4ddf-9176-2d0997c1abec	\N	\N
26a78061-dde5-410d-817b-158914fcce25	56b327ff-740d-4ddf-9176-2d0997c1abec	f	${role_admin}	admin	56b327ff-740d-4ddf-9176-2d0997c1abec	\N	\N
4173feb9-2b47-4231-bd99-cd62db2cf423	56b327ff-740d-4ddf-9176-2d0997c1abec	f	${role_create-realm}	create-realm	56b327ff-740d-4ddf-9176-2d0997c1abec	\N	\N
7039b8c9-71d5-4708-ada4-eef36014492f	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_create-client}	create-client	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
e5f6bd3d-6101-4691-89db-90c26ad21873	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_view-realm}	view-realm	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
79b45d1c-85a7-45a8-b458-f22217caa9f2	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_view-users}	view-users	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
6bebb5e3-8120-4a4b-9b3d-97bcbb569113	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_view-clients}	view-clients	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
d47a50d8-3cec-4ed8-a0f0-f85b69adf9fe	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_view-events}	view-events	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
6dcc0cf4-76cf-4b95-a39d-afae7eb7e370	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_view-identity-providers}	view-identity-providers	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
2834fc98-494e-4cca-8f99-7c95bb8b65d2	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_view-authorization}	view-authorization	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
8d90be7b-e7da-400a-b73a-1f821279f9eb	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_manage-realm}	manage-realm	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
88379d73-c5f2-485a-bc01-332fef52d210	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_manage-users}	manage-users	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
53314414-a720-4be7-81dc-61fafcb8006f	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_manage-clients}	manage-clients	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
07fcba8c-fb49-4206-94ad-fdbe8a60f5de	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_manage-events}	manage-events	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
020ce401-fc50-4250-96b6-b64b47641653	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_manage-identity-providers}	manage-identity-providers	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
8b406055-ba45-4b12-83ff-7a5b0a913a23	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_manage-authorization}	manage-authorization	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
d6834ae5-323a-4c07-9c54-14576209d619	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_query-users}	query-users	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
7f034aa2-05a7-48fc-a8ed-249e9363e1e6	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_query-clients}	query-clients	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
d092c547-fefe-4d03-9f50-c2e6952adabf	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_query-realms}	query-realms	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
bd06ed44-5b95-48c0-826d-f4e0e7208342	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_manage-identity-providers}	manage-identity-providers	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
f0dffc82-d4ea-4efe-9da0-db262647cc58	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_manage-authorization}	manage-authorization	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
e26d0304-ff2c-4582-b922-fee73467fa81	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_query-users}	query-users	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
cefa03c2-622a-4d41-a546-5f64e350e6ba	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_query-clients}	query-clients	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
f6ee112f-6931-414b-8aab-803d18ceff11	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_query-realms}	query-realms	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
9dab4d5d-adaa-4122-bafc-d8742dc55000	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_query-groups}	query-groups	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
efd1f4a8-a7f9-4e36-85eb-b26d4a32c0ae	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_realm-admin}	realm-admin	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
7bf0b5e7-9676-44a2-b5ec-70037b5ac502	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_create-client}	create-client	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
15e147c5-dbb5-44d2-bada-a11c74b109b4	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_view-realm}	view-realm	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
a8f253cc-c129-4eab-8541-1eee29424353	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_query-groups}	query-groups	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
5eeb6e14-33c8-48d8-b29e-6399b63f41bf	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	${role_view-profile}	view-profile	56b327ff-740d-4ddf-9176-2d0997c1abec	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	\N
273925b7-d838-413d-b31b-19e02dd9893e	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	${role_manage-account}	manage-account	56b327ff-740d-4ddf-9176-2d0997c1abec	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	\N
8d19e50f-3a8f-469a-8e82-b350b48042c0	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	${role_manage-account-links}	manage-account-links	56b327ff-740d-4ddf-9176-2d0997c1abec	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	\N
c8b0f942-8cfb-4848-89eb-b39a058e945e	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	${role_view-applications}	view-applications	56b327ff-740d-4ddf-9176-2d0997c1abec	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	\N
c9e01250-66d2-42e6-b885-8cb0b090a467	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	${role_view-consent}	view-consent	56b327ff-740d-4ddf-9176-2d0997c1abec	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	\N
ed9a9890-6f3b-4fbb-ad7b-53c1f0209b7e	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	${role_manage-consent}	manage-consent	56b327ff-740d-4ddf-9176-2d0997c1abec	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	\N
41cfd181-822f-4aa6-a893-08e822f1c7d2	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	${role_view-groups}	view-groups	56b327ff-740d-4ddf-9176-2d0997c1abec	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	\N
3c7c2653-37ec-4aa7-9bbc-957eede04b69	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	t	${role_delete-account}	delete-account	56b327ff-740d-4ddf-9176-2d0997c1abec	f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	\N
ffd45a24-2047-40cd-911f-cbb523645094	78c42635-86c8-462f-8fda-0cec3b715c39	t	${role_read-token}	read-token	56b327ff-740d-4ddf-9176-2d0997c1abec	78c42635-86c8-462f-8fda-0cec3b715c39	\N
758e8db2-f84d-4333-a764-f05cc9c2295f	b4eca891-8db4-463c-9cbd-3e4da02b47ab	t	${role_impersonation}	impersonation	56b327ff-740d-4ddf-9176-2d0997c1abec	b4eca891-8db4-463c-9cbd-3e4da02b47ab	\N
2f4da990-af73-45e4-96e7-3513ddf7b0af	56b327ff-740d-4ddf-9176-2d0997c1abec	f	${role_offline-access}	offline_access	56b327ff-740d-4ddf-9176-2d0997c1abec	\N	\N
c3c319cd-22a4-4e84-b1a0-77130a153b22	56b327ff-740d-4ddf-9176-2d0997c1abec	f	${role_uma_authorization}	uma_authorization	56b327ff-740d-4ddf-9176-2d0997c1abec	\N	\N
c44996aa-ddd1-4f7c-88be-5a7a68d5bbe6	c06c755e-09ee-4891-9c04-67318d8ec8d7	f	${role_default-roles}	default-roles-microservice-realm	c06c755e-09ee-4891-9c04-67318d8ec8d7	\N	\N
61902238-d048-42c1-ad0d-72e676b9aa5a	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_create-client}	create-client	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
5872481c-076e-4dcf-a18b-b33f185c0303	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_view-realm}	view-realm	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
bdd2db8d-e8dd-411f-840d-1e71e3fab9d5	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_view-users}	view-users	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
c488cc1e-968b-477c-8ce2-d13b5fb36334	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_view-clients}	view-clients	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
b1d9e2e1-fffe-481f-bca4-e6ebee1486ae	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_view-events}	view-events	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
4e7e14f7-c2d3-493d-80a0-4cf32c4273f6	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_view-identity-providers}	view-identity-providers	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
297f2fc0-7682-4847-881f-d036a21ac3d2	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_view-authorization}	view-authorization	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
bdb3b79b-d6cb-480e-a48a-62987da8972a	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_manage-realm}	manage-realm	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
e489eb85-673c-45b9-953d-574393eb594a	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_manage-users}	manage-users	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
3bb4fbf9-5de6-4ed0-a537-6d34a7318057	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_manage-clients}	manage-clients	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
29f45875-c006-4763-9a5f-8355e810955b	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_manage-events}	manage-events	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
f9033825-7182-40f8-9aaa-f44f6308bc95	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_view-users}	view-users	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
35c1f7ab-5498-4d0b-874f-1217c07e9c1e	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_view-clients}	view-clients	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
6f8934e4-4d18-4502-8f03-b24de5225ca5	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_view-events}	view-events	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
76046636-e9e6-434f-83bd-068783db561b	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_view-identity-providers}	view-identity-providers	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
bac1f1f6-642c-4462-b4f5-1aed7adb0b89	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_view-authorization}	view-authorization	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
3b5ce055-89f0-4a16-82a1-104fdd340440	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_manage-realm}	manage-realm	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
edf24d53-2dc0-44c0-a54e-4c9fcebd9b06	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_manage-users}	manage-users	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
334e5750-05ca-4fb0-a6ff-8074a1bded22	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_manage-clients}	manage-clients	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
964f6fbc-284e-4bb0-a43d-5c3a6ddc7922	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_manage-events}	manage-events	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
195e21c7-6a25-4f93-b4ef-d1d525e2a7d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_manage-identity-providers}	manage-identity-providers	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
b5e6af65-0e93-49f9-ac61-b437bcf686b9	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_manage-authorization}	manage-authorization	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
3a1e652e-ae8f-4d75-8b62-3edc9d782450	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_query-users}	query-users	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
ce045f9e-6ae4-4f88-926f-364982629d06	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_query-clients}	query-clients	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
ea298942-ef1c-481f-ba6c-fae04919b756	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_query-realms}	query-realms	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
e8b37979-df9e-4283-a978-d1a3cce2f643	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_query-groups}	query-groups	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
2881dfa3-ceb8-4f6d-9b72-1f03eef60370	cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	${role_view-profile}	view-profile	c06c755e-09ee-4891-9c04-67318d8ec8d7	cee6ee7b-7d7a-4f45-8748-b21f60571c88	\N
18fec74c-2066-4a21-944a-da2e0a3dd3b8	cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	${role_manage-account}	manage-account	c06c755e-09ee-4891-9c04-67318d8ec8d7	cee6ee7b-7d7a-4f45-8748-b21f60571c88	\N
044f16e7-ce3d-4609-8363-0a6a2e46360b	cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	${role_manage-account-links}	manage-account-links	c06c755e-09ee-4891-9c04-67318d8ec8d7	cee6ee7b-7d7a-4f45-8748-b21f60571c88	\N
cf95188c-49ee-49cf-a6e4-32ff6f9ea229	cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	${role_view-applications}	view-applications	c06c755e-09ee-4891-9c04-67318d8ec8d7	cee6ee7b-7d7a-4f45-8748-b21f60571c88	\N
8a5aa85f-9886-41fe-a038-fb2ce66ab9be	cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	${role_view-consent}	view-consent	c06c755e-09ee-4891-9c04-67318d8ec8d7	cee6ee7b-7d7a-4f45-8748-b21f60571c88	\N
f834e586-4fa8-4b2a-bf14-fd9e7c662c46	cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	${role_manage-consent}	manage-consent	c06c755e-09ee-4891-9c04-67318d8ec8d7	cee6ee7b-7d7a-4f45-8748-b21f60571c88	\N
75c36249-bc16-4081-93af-9dffa39a8cde	cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	${role_view-groups}	view-groups	c06c755e-09ee-4891-9c04-67318d8ec8d7	cee6ee7b-7d7a-4f45-8748-b21f60571c88	\N
3e61e9c8-606a-4657-980c-7225b1462a36	cee6ee7b-7d7a-4f45-8748-b21f60571c88	t	${role_delete-account}	delete-account	c06c755e-09ee-4891-9c04-67318d8ec8d7	cee6ee7b-7d7a-4f45-8748-b21f60571c88	\N
85771159-ae8b-4abb-9ffb-d5e94dc77c81	411e2d55-fd42-40d2-811c-7665243af5e3	t	${role_impersonation}	impersonation	56b327ff-740d-4ddf-9176-2d0997c1abec	411e2d55-fd42-40d2-811c-7665243af5e3	\N
f971bef0-1302-432d-ab7a-8592ee927f26	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	t	${role_impersonation}	impersonation	c06c755e-09ee-4891-9c04-67318d8ec8d7	9d801321-bc51-46f8-be2f-fd6b2bcaccf4	\N
6aa92579-8527-42b5-a17b-213525d26842	25036c4c-f3cb-408c-be0c-ec7ea96662cc	t	${role_read-token}	read-token	c06c755e-09ee-4891-9c04-67318d8ec8d7	25036c4c-f3cb-408c-be0c-ec7ea96662cc	\N
46bc56db-5b9a-49b9-8807-7f7863dd744f	c06c755e-09ee-4891-9c04-67318d8ec8d7	f	${role_offline-access}	offline_access	c06c755e-09ee-4891-9c04-67318d8ec8d7	\N	\N
5c82a412-2664-436c-99be-396dc92c6a04	c06c755e-09ee-4891-9c04-67318d8ec8d7	f	${role_uma_authorization}	uma_authorization	c06c755e-09ee-4891-9c04-67318d8ec8d7	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
460c7	26.1.2	1748383011
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
e404f12d-b811-42a5-bcbf-c37473414af7	6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	0	1748385760	{"authMethod":"openid-connect","redirectUri":"http://localhost:8090/admin/master/console/","notes":{"clientId":"6f2c4f3d-aed4-4714-a6e1-210f47f16ef6","iss":"http://localhost:8090/realms/master","startedAt":"1748383058","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"d1a1115c-243f-4770-a299-652348f18e0d","response_mode":"query","scope":"openid","userSessionStartedAt":"1748383058","redirect_uri":"http://localhost:8090/admin/master/console/","state":"6f457d1b-041f-46a3-9042-b16c20974845","code_challenge":"P5f9r668-iyGGOcQOPXEl95TFG_UzH4jjnLBP9dcWGA","prompt":"none","SSO_AUTH":"true"}}	local	local	23
0f73e4e3-d710-4254-b203-0d7097db1f81	8e1ec687-37a5-487a-b1e7-30646387404d	0	1748385806	{"authMethod":"openid-connect","redirectUri":"http://localhost:4200/","notes":{"clientId":"8e1ec687-37a5-487a-b1e7-30646387404d","iss":"http://localhost:8090/realms/microservice-realm","startedAt":"1748385292","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"a3d41808-ebe3-40d2-9c9a-803b5ce06d05","response_mode":"fragment","scope":"openid","userSessionStartedAt":"1748385292","redirect_uri":"http://localhost:4200/","state":"c9653361-33b7-4bf8-afbc-37dc06ebab97","code_challenge":"y-hMRSgmCAQnACQGDxrFsEmjtoKd0LSwQ4RNIlgD_rc","SSO_AUTH":"true"}}	local	local	6
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
e404f12d-b811-42a5-bcbf-c37473414af7	aa10695d-4cfd-40e4-9623-88fd11cbd142	56b327ff-740d-4ddf-9176-2d0997c1abec	1748383058	0	{"ipAddress":"172.19.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMTkuMC4xIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiT3BlcmEvMTE4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1748383058","authenticators-completed":"{\\"00e42a84-75f1-478c-8d18-766f59fc5f3e\\":1748383058,\\"c7e21ce6-9492-4f2b-aa31-d74667b26a78\\":1748383466}"},"state":"LOGGED_IN"}	1748385760	\N	23
0f73e4e3-d710-4254-b203-0d7097db1f81	6cbf3695-c463-48ca-85d4-d36c2aa9870b	c06c755e-09ee-4891-9c04-67318d8ec8d7	1748385292	0	{"ipAddress":"172.19.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMTkuMC4xIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiT3BlcmEvMTE4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1748385292","authenticators-completed":"{\\"1070eb37-daed-43ed-9649-443b63c3dc3d\\":1748385292,\\"c04d6065-e11f-4cee-b5cf-1b42024958de\\":1748385504}"},"state":"LOGGED_IN"}	1748385806	\N	6
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
7b974562-d139-455e-9d74-a75d33fb7803	audience resolve	openid-connect	oidc-audience-resolve-mapper	458d22c7-d9da-4293-ac2b-b6cd7bb19985	\N
327d3154-7342-4eba-9d45-6789f4510c50	locale	openid-connect	oidc-usermodel-attribute-mapper	6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	\N
9416b4bc-bfa3-498f-8081-3abfa4b27c44	role list	saml	saml-role-list-mapper	\N	3fc1e194-7f03-4ce9-9421-44f991f3ce6d
a256caa1-5621-4d66-aaa9-2e6b2902b9c4	organization	saml	saml-organization-membership-mapper	\N	df5d31dc-719a-4a90-b63c-fcd7e9157093
fbf81ac9-6257-4f5e-b556-98e70ef1b6c6	full name	openid-connect	oidc-full-name-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
25b26b26-303f-400c-8474-a8805f444bf9	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
0e24d251-8f0b-47a2-b801-92fe9a871c1d	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
7e06862e-f08d-46cb-94a2-ed80367205c7	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
28e2bdf9-0470-4b58-970c-001835a8635d	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
00e23d48-c029-4cc3-93f1-89219aa18578	username	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
7790092e-40b2-4180-8105-64c1da94703e	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
ad3a4ee8-8ffe-41f3-8533-fa7adc9fae83	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
6aaba66b-397e-42cc-b714-955e0040ea04	website	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
bfe8ee6f-20dc-41f6-9271-1164e1aaf076	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
97a644bb-4ae8-4491-a236-10fa4afb487e	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
e57224cf-a6c1-4436-aa4f-48e40c5c0472	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
5f38ed51-1746-4a24-91f1-38d00bd3b00e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
cd69ec10-9828-46e0-8015-f4cfad642bec	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	56a06bc5-035f-43cf-97d3-75d0fb73048b
05da7c3e-5dad-4fe0-b392-5d3ba4b0b175	email	openid-connect	oidc-usermodel-attribute-mapper	\N	94d0cb07-84a3-440a-975f-a519fda69f7b
51f38541-35f8-4c6f-b707-299dca745c36	email verified	openid-connect	oidc-usermodel-property-mapper	\N	94d0cb07-84a3-440a-975f-a519fda69f7b
85091a10-c705-4156-a721-787983b1cf5d	address	openid-connect	oidc-address-mapper	\N	712e8e55-ebc6-45af-be41-96c280a2e970
f54eae02-f405-4ba1-9692-60d4079e058b	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	2829ae55-ef6a-432b-93c8-e5f924e6ea14
a8d38098-d5c6-43d9-b689-9eb8cf600288	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	2829ae55-ef6a-432b-93c8-e5f924e6ea14
71f8be92-f192-4b6f-bb8e-81f6007495b1	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c
9274518c-9bc1-4f4d-a53e-33c9a18125fe	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c
d77285f2-a8d5-48d4-a5ec-de7e8203aa7e	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	f1a71dbe-07a7-4e54-bc5e-4ab82b12362c
5b1c33cd-8335-4745-a805-8789765d1815	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	b50ce408-a9f5-4a54-8e94-54f2197956ff
1e00dba5-7eb5-4675-9a0c-d9a130be143e	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	127bdce0-88fd-481c-aa97-433b7f9c2f5c
bfd3f620-86c4-4c9a-8bb3-7438c2392050	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	127bdce0-88fd-481c-aa97-433b7f9c2f5c
dc3f0977-c438-487a-bd58-0ef9169c959e	acr loa level	openid-connect	oidc-acr-mapper	\N	b7f0cff9-5433-414e-b6ba-126725261b54
f231c655-dc0a-4b3f-b4ed-af95c2c0a8a0	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	9d99c46d-3468-4fe2-9bdb-b0ba44b86931
1829e281-1a05-4f53-ba00-e461506fdf3b	sub	openid-connect	oidc-sub-mapper	\N	9d99c46d-3468-4fe2-9bdb-b0ba44b86931
fe4d36ac-43db-4307-96bd-75ee212218ef	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	ece5ae14-53cb-4152-8d1c-9c5c07c17ada
b145f386-bde6-40cf-b28a-4bdb44c35098	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	ece5ae14-53cb-4152-8d1c-9c5c07c17ada
8c1d3661-2f55-4ee5-9fb9-43c57aa79a69	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	ece5ae14-53cb-4152-8d1c-9c5c07c17ada
ee143796-6f8f-4572-8d8f-b61ee373beeb	organization	openid-connect	oidc-organization-membership-mapper	\N	484303a4-808c-4590-a033-92d493652055
6ecc9dab-51ff-4c50-8b4b-4f31c448f840	audience resolve	openid-connect	oidc-audience-resolve-mapper	5f91e27e-b433-4d28-8d66-47e221570093	\N
a312e1c9-3f14-418d-8ae7-61ba7c99788d	role list	saml	saml-role-list-mapper	\N	15da97c7-4b33-4b9b-8667-e9f6d6a62177
b4a1b5e3-90db-449c-a8f1-80144e4ddebe	organization	saml	saml-organization-membership-mapper	\N	57dd1fb7-5792-479a-adf3-7f137ee28c33
ce338615-c7a4-446b-bc43-2279343c75dc	full name	openid-connect	oidc-full-name-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
a14e28ba-8305-421b-8aba-b494a14de002	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
4d506a6e-8a98-417e-a377-b0fbb597e9da	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
c566fd67-3dfa-44c5-ae8e-0eb690075f17	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
8babb777-99ae-4644-89e4-c805191830e0	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
cd919291-2fcd-4f6a-b960-372043d7701b	username	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
8a872653-490a-466a-a58c-5fdc3e2d360f	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
88ec7cd7-939a-4e54-980b-cfebf4cef311	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
38b529e5-31ae-411d-8395-38c45c8fdb9f	website	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
660381b3-7bf8-4baa-8d9f-e8c9e2eae6a0	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
a1806ef4-9088-4ade-b090-cf1cb9ae670d	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
3b127376-711b-47d4-b5d2-efeada8e39e6	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
b15859cf-7fbc-40ea-9e17-100c103ceb07	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
e089a7a9-4ab8-468b-9155-7d46d535192a	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	71b18bcc-1019-4332-924b-09dd77da1c92
b320c5dc-0e86-4404-8887-f0fc0ddcf0c5	email	openid-connect	oidc-usermodel-attribute-mapper	\N	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7
6326c9dc-a797-47b0-a3fb-817d9f9ace90	email verified	openid-connect	oidc-usermodel-property-mapper	\N	33f1f9bd-57a4-4a95-8c19-5e4217ddcce7
19e0d850-c837-4214-8a69-256ef93e4601	address	openid-connect	oidc-address-mapper	\N	fb26d20a-f1e2-4344-a4df-77b1745af85d
8e99c9c6-691d-48fd-a6a1-d3853f7849cc	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	1407b722-eb03-451a-a1ec-b7e030bcc382
ff842e4b-0040-4e89-a415-c71e11885143	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	1407b722-eb03-451a-a1ec-b7e030bcc382
7b179172-3b9e-4972-860c-dbe5eb4920c8	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	688e61e6-34cc-4326-b31b-9695c24896a8
8ea7e7d3-9a1b-4a75-80c3-67d6fc544628	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	688e61e6-34cc-4326-b31b-9695c24896a8
38aec9ba-0ef6-4ddf-b0b8-ba235c997cba	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	688e61e6-34cc-4326-b31b-9695c24896a8
a87dc44c-ad9d-4983-aa06-5721a4ea604f	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	5b77f5ac-f487-4fab-98b8-d52a3fe88e7d
bb8c8c30-933e-48c6-a4b9-32bdd4869e98	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	ebcfc508-1a65-4be4-9514-98186373acd7
37736d4c-acae-4bee-9580-094eb30985d6	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	ebcfc508-1a65-4be4-9514-98186373acd7
60b8bfa7-57d2-468f-9bc1-d7c13ec58e78	acr loa level	openid-connect	oidc-acr-mapper	\N	85169c0d-dacc-4efb-bdcd-1b1ae1ec98ae
3d38e512-7b27-4de9-9832-805711c7cd90	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	053b2279-7f1b-4e73-be85-85c8fa9f3bdc
32f95382-bbef-4f0e-9518-6884769bf18e	sub	openid-connect	oidc-sub-mapper	\N	053b2279-7f1b-4e73-be85-85c8fa9f3bdc
406c68fb-f3f3-4253-adac-c9acc9d9b883	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	d49faeb0-0395-48eb-87f7-23517eda09b3
4950fe44-a432-4445-a82f-18e530a6c1b0	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	d49faeb0-0395-48eb-87f7-23517eda09b3
a4b5a5ee-a5f4-4055-940e-aa3f50f4c436	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	d49faeb0-0395-48eb-87f7-23517eda09b3
56d38634-ecff-4da5-a34e-6b608a3dab7c	organization	openid-connect	oidc-organization-membership-mapper	\N	2a9bf981-b6d8-4937-8943-7d4c2f4588fd
5427fd8d-7672-4cdf-b567-f29760d12c8d	locale	openid-connect	oidc-usermodel-attribute-mapper	fcb30a8a-c358-425d-a01b-bcc770b5f3bd	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
327d3154-7342-4eba-9d45-6789f4510c50	true	introspection.token.claim
327d3154-7342-4eba-9d45-6789f4510c50	true	userinfo.token.claim
327d3154-7342-4eba-9d45-6789f4510c50	locale	user.attribute
327d3154-7342-4eba-9d45-6789f4510c50	true	id.token.claim
327d3154-7342-4eba-9d45-6789f4510c50	true	access.token.claim
327d3154-7342-4eba-9d45-6789f4510c50	locale	claim.name
327d3154-7342-4eba-9d45-6789f4510c50	String	jsonType.label
9416b4bc-bfa3-498f-8081-3abfa4b27c44	false	single
9416b4bc-bfa3-498f-8081-3abfa4b27c44	Basic	attribute.nameformat
9416b4bc-bfa3-498f-8081-3abfa4b27c44	Role	attribute.name
00e23d48-c029-4cc3-93f1-89219aa18578	true	introspection.token.claim
00e23d48-c029-4cc3-93f1-89219aa18578	true	userinfo.token.claim
00e23d48-c029-4cc3-93f1-89219aa18578	username	user.attribute
00e23d48-c029-4cc3-93f1-89219aa18578	true	id.token.claim
00e23d48-c029-4cc3-93f1-89219aa18578	true	access.token.claim
00e23d48-c029-4cc3-93f1-89219aa18578	preferred_username	claim.name
00e23d48-c029-4cc3-93f1-89219aa18578	String	jsonType.label
0e24d251-8f0b-47a2-b801-92fe9a871c1d	true	introspection.token.claim
0e24d251-8f0b-47a2-b801-92fe9a871c1d	true	userinfo.token.claim
0e24d251-8f0b-47a2-b801-92fe9a871c1d	firstName	user.attribute
0e24d251-8f0b-47a2-b801-92fe9a871c1d	true	id.token.claim
0e24d251-8f0b-47a2-b801-92fe9a871c1d	true	access.token.claim
0e24d251-8f0b-47a2-b801-92fe9a871c1d	given_name	claim.name
0e24d251-8f0b-47a2-b801-92fe9a871c1d	String	jsonType.label
25b26b26-303f-400c-8474-a8805f444bf9	true	introspection.token.claim
25b26b26-303f-400c-8474-a8805f444bf9	true	userinfo.token.claim
25b26b26-303f-400c-8474-a8805f444bf9	lastName	user.attribute
25b26b26-303f-400c-8474-a8805f444bf9	true	id.token.claim
25b26b26-303f-400c-8474-a8805f444bf9	true	access.token.claim
25b26b26-303f-400c-8474-a8805f444bf9	family_name	claim.name
25b26b26-303f-400c-8474-a8805f444bf9	String	jsonType.label
28e2bdf9-0470-4b58-970c-001835a8635d	true	introspection.token.claim
28e2bdf9-0470-4b58-970c-001835a8635d	true	userinfo.token.claim
28e2bdf9-0470-4b58-970c-001835a8635d	nickname	user.attribute
28e2bdf9-0470-4b58-970c-001835a8635d	true	id.token.claim
28e2bdf9-0470-4b58-970c-001835a8635d	true	access.token.claim
28e2bdf9-0470-4b58-970c-001835a8635d	nickname	claim.name
28e2bdf9-0470-4b58-970c-001835a8635d	String	jsonType.label
5f38ed51-1746-4a24-91f1-38d00bd3b00e	true	introspection.token.claim
5f38ed51-1746-4a24-91f1-38d00bd3b00e	true	userinfo.token.claim
5f38ed51-1746-4a24-91f1-38d00bd3b00e	locale	user.attribute
5f38ed51-1746-4a24-91f1-38d00bd3b00e	true	id.token.claim
5f38ed51-1746-4a24-91f1-38d00bd3b00e	true	access.token.claim
5f38ed51-1746-4a24-91f1-38d00bd3b00e	locale	claim.name
5f38ed51-1746-4a24-91f1-38d00bd3b00e	String	jsonType.label
6aaba66b-397e-42cc-b714-955e0040ea04	true	introspection.token.claim
6aaba66b-397e-42cc-b714-955e0040ea04	true	userinfo.token.claim
6aaba66b-397e-42cc-b714-955e0040ea04	website	user.attribute
6aaba66b-397e-42cc-b714-955e0040ea04	true	id.token.claim
6aaba66b-397e-42cc-b714-955e0040ea04	true	access.token.claim
6aaba66b-397e-42cc-b714-955e0040ea04	website	claim.name
6aaba66b-397e-42cc-b714-955e0040ea04	String	jsonType.label
7790092e-40b2-4180-8105-64c1da94703e	true	introspection.token.claim
7790092e-40b2-4180-8105-64c1da94703e	true	userinfo.token.claim
7790092e-40b2-4180-8105-64c1da94703e	profile	user.attribute
7790092e-40b2-4180-8105-64c1da94703e	true	id.token.claim
7790092e-40b2-4180-8105-64c1da94703e	true	access.token.claim
7790092e-40b2-4180-8105-64c1da94703e	profile	claim.name
7790092e-40b2-4180-8105-64c1da94703e	String	jsonType.label
7e06862e-f08d-46cb-94a2-ed80367205c7	true	introspection.token.claim
7e06862e-f08d-46cb-94a2-ed80367205c7	true	userinfo.token.claim
7e06862e-f08d-46cb-94a2-ed80367205c7	middleName	user.attribute
7e06862e-f08d-46cb-94a2-ed80367205c7	true	id.token.claim
7e06862e-f08d-46cb-94a2-ed80367205c7	true	access.token.claim
7e06862e-f08d-46cb-94a2-ed80367205c7	middle_name	claim.name
7e06862e-f08d-46cb-94a2-ed80367205c7	String	jsonType.label
97a644bb-4ae8-4491-a236-10fa4afb487e	true	introspection.token.claim
97a644bb-4ae8-4491-a236-10fa4afb487e	true	userinfo.token.claim
97a644bb-4ae8-4491-a236-10fa4afb487e	birthdate	user.attribute
97a644bb-4ae8-4491-a236-10fa4afb487e	true	id.token.claim
97a644bb-4ae8-4491-a236-10fa4afb487e	true	access.token.claim
97a644bb-4ae8-4491-a236-10fa4afb487e	birthdate	claim.name
97a644bb-4ae8-4491-a236-10fa4afb487e	String	jsonType.label
ad3a4ee8-8ffe-41f3-8533-fa7adc9fae83	true	introspection.token.claim
ad3a4ee8-8ffe-41f3-8533-fa7adc9fae83	true	userinfo.token.claim
ad3a4ee8-8ffe-41f3-8533-fa7adc9fae83	picture	user.attribute
ad3a4ee8-8ffe-41f3-8533-fa7adc9fae83	true	id.token.claim
ad3a4ee8-8ffe-41f3-8533-fa7adc9fae83	true	access.token.claim
ad3a4ee8-8ffe-41f3-8533-fa7adc9fae83	picture	claim.name
ad3a4ee8-8ffe-41f3-8533-fa7adc9fae83	String	jsonType.label
bfe8ee6f-20dc-41f6-9271-1164e1aaf076	true	introspection.token.claim
bfe8ee6f-20dc-41f6-9271-1164e1aaf076	true	userinfo.token.claim
bfe8ee6f-20dc-41f6-9271-1164e1aaf076	gender	user.attribute
bfe8ee6f-20dc-41f6-9271-1164e1aaf076	true	id.token.claim
bfe8ee6f-20dc-41f6-9271-1164e1aaf076	true	access.token.claim
bfe8ee6f-20dc-41f6-9271-1164e1aaf076	gender	claim.name
bfe8ee6f-20dc-41f6-9271-1164e1aaf076	String	jsonType.label
cd69ec10-9828-46e0-8015-f4cfad642bec	true	introspection.token.claim
cd69ec10-9828-46e0-8015-f4cfad642bec	true	userinfo.token.claim
cd69ec10-9828-46e0-8015-f4cfad642bec	updatedAt	user.attribute
cd69ec10-9828-46e0-8015-f4cfad642bec	true	id.token.claim
cd69ec10-9828-46e0-8015-f4cfad642bec	true	access.token.claim
cd69ec10-9828-46e0-8015-f4cfad642bec	updated_at	claim.name
cd69ec10-9828-46e0-8015-f4cfad642bec	long	jsonType.label
e57224cf-a6c1-4436-aa4f-48e40c5c0472	true	introspection.token.claim
e57224cf-a6c1-4436-aa4f-48e40c5c0472	true	userinfo.token.claim
e57224cf-a6c1-4436-aa4f-48e40c5c0472	zoneinfo	user.attribute
e57224cf-a6c1-4436-aa4f-48e40c5c0472	true	id.token.claim
e57224cf-a6c1-4436-aa4f-48e40c5c0472	true	access.token.claim
e57224cf-a6c1-4436-aa4f-48e40c5c0472	zoneinfo	claim.name
e57224cf-a6c1-4436-aa4f-48e40c5c0472	String	jsonType.label
fbf81ac9-6257-4f5e-b556-98e70ef1b6c6	true	introspection.token.claim
fbf81ac9-6257-4f5e-b556-98e70ef1b6c6	true	userinfo.token.claim
fbf81ac9-6257-4f5e-b556-98e70ef1b6c6	true	id.token.claim
fbf81ac9-6257-4f5e-b556-98e70ef1b6c6	true	access.token.claim
05da7c3e-5dad-4fe0-b392-5d3ba4b0b175	true	introspection.token.claim
05da7c3e-5dad-4fe0-b392-5d3ba4b0b175	true	userinfo.token.claim
05da7c3e-5dad-4fe0-b392-5d3ba4b0b175	email	user.attribute
05da7c3e-5dad-4fe0-b392-5d3ba4b0b175	true	id.token.claim
05da7c3e-5dad-4fe0-b392-5d3ba4b0b175	true	access.token.claim
05da7c3e-5dad-4fe0-b392-5d3ba4b0b175	email	claim.name
05da7c3e-5dad-4fe0-b392-5d3ba4b0b175	String	jsonType.label
51f38541-35f8-4c6f-b707-299dca745c36	true	introspection.token.claim
51f38541-35f8-4c6f-b707-299dca745c36	true	userinfo.token.claim
51f38541-35f8-4c6f-b707-299dca745c36	emailVerified	user.attribute
51f38541-35f8-4c6f-b707-299dca745c36	true	id.token.claim
51f38541-35f8-4c6f-b707-299dca745c36	true	access.token.claim
51f38541-35f8-4c6f-b707-299dca745c36	email_verified	claim.name
51f38541-35f8-4c6f-b707-299dca745c36	boolean	jsonType.label
85091a10-c705-4156-a721-787983b1cf5d	formatted	user.attribute.formatted
85091a10-c705-4156-a721-787983b1cf5d	country	user.attribute.country
85091a10-c705-4156-a721-787983b1cf5d	true	introspection.token.claim
85091a10-c705-4156-a721-787983b1cf5d	postal_code	user.attribute.postal_code
85091a10-c705-4156-a721-787983b1cf5d	true	userinfo.token.claim
85091a10-c705-4156-a721-787983b1cf5d	street	user.attribute.street
85091a10-c705-4156-a721-787983b1cf5d	true	id.token.claim
85091a10-c705-4156-a721-787983b1cf5d	region	user.attribute.region
85091a10-c705-4156-a721-787983b1cf5d	true	access.token.claim
85091a10-c705-4156-a721-787983b1cf5d	locality	user.attribute.locality
a8d38098-d5c6-43d9-b689-9eb8cf600288	true	introspection.token.claim
a8d38098-d5c6-43d9-b689-9eb8cf600288	true	userinfo.token.claim
a8d38098-d5c6-43d9-b689-9eb8cf600288	phoneNumberVerified	user.attribute
a8d38098-d5c6-43d9-b689-9eb8cf600288	true	id.token.claim
a8d38098-d5c6-43d9-b689-9eb8cf600288	true	access.token.claim
a8d38098-d5c6-43d9-b689-9eb8cf600288	phone_number_verified	claim.name
a8d38098-d5c6-43d9-b689-9eb8cf600288	boolean	jsonType.label
f54eae02-f405-4ba1-9692-60d4079e058b	true	introspection.token.claim
f54eae02-f405-4ba1-9692-60d4079e058b	true	userinfo.token.claim
f54eae02-f405-4ba1-9692-60d4079e058b	phoneNumber	user.attribute
f54eae02-f405-4ba1-9692-60d4079e058b	true	id.token.claim
f54eae02-f405-4ba1-9692-60d4079e058b	true	access.token.claim
f54eae02-f405-4ba1-9692-60d4079e058b	phone_number	claim.name
f54eae02-f405-4ba1-9692-60d4079e058b	String	jsonType.label
71f8be92-f192-4b6f-bb8e-81f6007495b1	true	introspection.token.claim
71f8be92-f192-4b6f-bb8e-81f6007495b1	true	multivalued
71f8be92-f192-4b6f-bb8e-81f6007495b1	foo	user.attribute
71f8be92-f192-4b6f-bb8e-81f6007495b1	true	access.token.claim
71f8be92-f192-4b6f-bb8e-81f6007495b1	realm_access.roles	claim.name
71f8be92-f192-4b6f-bb8e-81f6007495b1	String	jsonType.label
9274518c-9bc1-4f4d-a53e-33c9a18125fe	true	introspection.token.claim
9274518c-9bc1-4f4d-a53e-33c9a18125fe	true	multivalued
9274518c-9bc1-4f4d-a53e-33c9a18125fe	foo	user.attribute
9274518c-9bc1-4f4d-a53e-33c9a18125fe	true	access.token.claim
9274518c-9bc1-4f4d-a53e-33c9a18125fe	resource_access.${client_id}.roles	claim.name
9274518c-9bc1-4f4d-a53e-33c9a18125fe	String	jsonType.label
d77285f2-a8d5-48d4-a5ec-de7e8203aa7e	true	introspection.token.claim
d77285f2-a8d5-48d4-a5ec-de7e8203aa7e	true	access.token.claim
5b1c33cd-8335-4745-a805-8789765d1815	true	introspection.token.claim
5b1c33cd-8335-4745-a805-8789765d1815	true	access.token.claim
1e00dba5-7eb5-4675-9a0c-d9a130be143e	true	introspection.token.claim
1e00dba5-7eb5-4675-9a0c-d9a130be143e	true	userinfo.token.claim
1e00dba5-7eb5-4675-9a0c-d9a130be143e	username	user.attribute
1e00dba5-7eb5-4675-9a0c-d9a130be143e	true	id.token.claim
1e00dba5-7eb5-4675-9a0c-d9a130be143e	true	access.token.claim
1e00dba5-7eb5-4675-9a0c-d9a130be143e	upn	claim.name
1e00dba5-7eb5-4675-9a0c-d9a130be143e	String	jsonType.label
bfd3f620-86c4-4c9a-8bb3-7438c2392050	true	introspection.token.claim
bfd3f620-86c4-4c9a-8bb3-7438c2392050	true	multivalued
bfd3f620-86c4-4c9a-8bb3-7438c2392050	foo	user.attribute
bfd3f620-86c4-4c9a-8bb3-7438c2392050	true	id.token.claim
bfd3f620-86c4-4c9a-8bb3-7438c2392050	true	access.token.claim
bfd3f620-86c4-4c9a-8bb3-7438c2392050	groups	claim.name
bfd3f620-86c4-4c9a-8bb3-7438c2392050	String	jsonType.label
dc3f0977-c438-487a-bd58-0ef9169c959e	true	introspection.token.claim
dc3f0977-c438-487a-bd58-0ef9169c959e	true	id.token.claim
dc3f0977-c438-487a-bd58-0ef9169c959e	true	access.token.claim
1829e281-1a05-4f53-ba00-e461506fdf3b	true	introspection.token.claim
1829e281-1a05-4f53-ba00-e461506fdf3b	true	access.token.claim
f231c655-dc0a-4b3f-b4ed-af95c2c0a8a0	AUTH_TIME	user.session.note
f231c655-dc0a-4b3f-b4ed-af95c2c0a8a0	true	introspection.token.claim
f231c655-dc0a-4b3f-b4ed-af95c2c0a8a0	true	id.token.claim
f231c655-dc0a-4b3f-b4ed-af95c2c0a8a0	true	access.token.claim
f231c655-dc0a-4b3f-b4ed-af95c2c0a8a0	auth_time	claim.name
f231c655-dc0a-4b3f-b4ed-af95c2c0a8a0	long	jsonType.label
8c1d3661-2f55-4ee5-9fb9-43c57aa79a69	clientAddress	user.session.note
8c1d3661-2f55-4ee5-9fb9-43c57aa79a69	true	introspection.token.claim
8c1d3661-2f55-4ee5-9fb9-43c57aa79a69	true	id.token.claim
8c1d3661-2f55-4ee5-9fb9-43c57aa79a69	true	access.token.claim
8c1d3661-2f55-4ee5-9fb9-43c57aa79a69	clientAddress	claim.name
8c1d3661-2f55-4ee5-9fb9-43c57aa79a69	String	jsonType.label
b145f386-bde6-40cf-b28a-4bdb44c35098	clientHost	user.session.note
b145f386-bde6-40cf-b28a-4bdb44c35098	true	introspection.token.claim
b145f386-bde6-40cf-b28a-4bdb44c35098	true	id.token.claim
b145f386-bde6-40cf-b28a-4bdb44c35098	true	access.token.claim
b145f386-bde6-40cf-b28a-4bdb44c35098	clientHost	claim.name
b145f386-bde6-40cf-b28a-4bdb44c35098	String	jsonType.label
fe4d36ac-43db-4307-96bd-75ee212218ef	client_id	user.session.note
fe4d36ac-43db-4307-96bd-75ee212218ef	true	introspection.token.claim
fe4d36ac-43db-4307-96bd-75ee212218ef	true	id.token.claim
fe4d36ac-43db-4307-96bd-75ee212218ef	true	access.token.claim
fe4d36ac-43db-4307-96bd-75ee212218ef	client_id	claim.name
fe4d36ac-43db-4307-96bd-75ee212218ef	String	jsonType.label
ee143796-6f8f-4572-8d8f-b61ee373beeb	true	introspection.token.claim
ee143796-6f8f-4572-8d8f-b61ee373beeb	true	multivalued
ee143796-6f8f-4572-8d8f-b61ee373beeb	true	id.token.claim
ee143796-6f8f-4572-8d8f-b61ee373beeb	true	access.token.claim
ee143796-6f8f-4572-8d8f-b61ee373beeb	organization	claim.name
ee143796-6f8f-4572-8d8f-b61ee373beeb	String	jsonType.label
a312e1c9-3f14-418d-8ae7-61ba7c99788d	false	single
a312e1c9-3f14-418d-8ae7-61ba7c99788d	Basic	attribute.nameformat
a312e1c9-3f14-418d-8ae7-61ba7c99788d	Role	attribute.name
38b529e5-31ae-411d-8395-38c45c8fdb9f	true	introspection.token.claim
38b529e5-31ae-411d-8395-38c45c8fdb9f	true	userinfo.token.claim
38b529e5-31ae-411d-8395-38c45c8fdb9f	website	user.attribute
38b529e5-31ae-411d-8395-38c45c8fdb9f	true	id.token.claim
38b529e5-31ae-411d-8395-38c45c8fdb9f	true	access.token.claim
38b529e5-31ae-411d-8395-38c45c8fdb9f	website	claim.name
38b529e5-31ae-411d-8395-38c45c8fdb9f	String	jsonType.label
3b127376-711b-47d4-b5d2-efeada8e39e6	true	introspection.token.claim
3b127376-711b-47d4-b5d2-efeada8e39e6	true	userinfo.token.claim
3b127376-711b-47d4-b5d2-efeada8e39e6	zoneinfo	user.attribute
3b127376-711b-47d4-b5d2-efeada8e39e6	true	id.token.claim
3b127376-711b-47d4-b5d2-efeada8e39e6	true	access.token.claim
3b127376-711b-47d4-b5d2-efeada8e39e6	zoneinfo	claim.name
3b127376-711b-47d4-b5d2-efeada8e39e6	String	jsonType.label
4d506a6e-8a98-417e-a377-b0fbb597e9da	true	introspection.token.claim
4d506a6e-8a98-417e-a377-b0fbb597e9da	true	userinfo.token.claim
4d506a6e-8a98-417e-a377-b0fbb597e9da	firstName	user.attribute
4d506a6e-8a98-417e-a377-b0fbb597e9da	true	id.token.claim
4d506a6e-8a98-417e-a377-b0fbb597e9da	true	access.token.claim
4d506a6e-8a98-417e-a377-b0fbb597e9da	given_name	claim.name
4d506a6e-8a98-417e-a377-b0fbb597e9da	String	jsonType.label
660381b3-7bf8-4baa-8d9f-e8c9e2eae6a0	true	introspection.token.claim
660381b3-7bf8-4baa-8d9f-e8c9e2eae6a0	true	userinfo.token.claim
660381b3-7bf8-4baa-8d9f-e8c9e2eae6a0	gender	user.attribute
660381b3-7bf8-4baa-8d9f-e8c9e2eae6a0	true	id.token.claim
660381b3-7bf8-4baa-8d9f-e8c9e2eae6a0	true	access.token.claim
660381b3-7bf8-4baa-8d9f-e8c9e2eae6a0	gender	claim.name
660381b3-7bf8-4baa-8d9f-e8c9e2eae6a0	String	jsonType.label
88ec7cd7-939a-4e54-980b-cfebf4cef311	true	introspection.token.claim
88ec7cd7-939a-4e54-980b-cfebf4cef311	true	userinfo.token.claim
88ec7cd7-939a-4e54-980b-cfebf4cef311	picture	user.attribute
88ec7cd7-939a-4e54-980b-cfebf4cef311	true	id.token.claim
88ec7cd7-939a-4e54-980b-cfebf4cef311	true	access.token.claim
88ec7cd7-939a-4e54-980b-cfebf4cef311	picture	claim.name
88ec7cd7-939a-4e54-980b-cfebf4cef311	String	jsonType.label
8a872653-490a-466a-a58c-5fdc3e2d360f	true	introspection.token.claim
8a872653-490a-466a-a58c-5fdc3e2d360f	true	userinfo.token.claim
8a872653-490a-466a-a58c-5fdc3e2d360f	profile	user.attribute
8a872653-490a-466a-a58c-5fdc3e2d360f	true	id.token.claim
8a872653-490a-466a-a58c-5fdc3e2d360f	true	access.token.claim
8a872653-490a-466a-a58c-5fdc3e2d360f	profile	claim.name
8a872653-490a-466a-a58c-5fdc3e2d360f	String	jsonType.label
8babb777-99ae-4644-89e4-c805191830e0	true	introspection.token.claim
8babb777-99ae-4644-89e4-c805191830e0	true	userinfo.token.claim
8babb777-99ae-4644-89e4-c805191830e0	nickname	user.attribute
8babb777-99ae-4644-89e4-c805191830e0	true	id.token.claim
8babb777-99ae-4644-89e4-c805191830e0	true	access.token.claim
8babb777-99ae-4644-89e4-c805191830e0	nickname	claim.name
8babb777-99ae-4644-89e4-c805191830e0	String	jsonType.label
a14e28ba-8305-421b-8aba-b494a14de002	true	introspection.token.claim
a14e28ba-8305-421b-8aba-b494a14de002	true	userinfo.token.claim
a14e28ba-8305-421b-8aba-b494a14de002	lastName	user.attribute
a14e28ba-8305-421b-8aba-b494a14de002	true	id.token.claim
a14e28ba-8305-421b-8aba-b494a14de002	true	access.token.claim
a14e28ba-8305-421b-8aba-b494a14de002	family_name	claim.name
a14e28ba-8305-421b-8aba-b494a14de002	String	jsonType.label
a1806ef4-9088-4ade-b090-cf1cb9ae670d	true	introspection.token.claim
a1806ef4-9088-4ade-b090-cf1cb9ae670d	true	userinfo.token.claim
a1806ef4-9088-4ade-b090-cf1cb9ae670d	birthdate	user.attribute
a1806ef4-9088-4ade-b090-cf1cb9ae670d	true	id.token.claim
a1806ef4-9088-4ade-b090-cf1cb9ae670d	true	access.token.claim
a1806ef4-9088-4ade-b090-cf1cb9ae670d	birthdate	claim.name
a1806ef4-9088-4ade-b090-cf1cb9ae670d	String	jsonType.label
b15859cf-7fbc-40ea-9e17-100c103ceb07	true	introspection.token.claim
b15859cf-7fbc-40ea-9e17-100c103ceb07	true	userinfo.token.claim
b15859cf-7fbc-40ea-9e17-100c103ceb07	locale	user.attribute
b15859cf-7fbc-40ea-9e17-100c103ceb07	true	id.token.claim
b15859cf-7fbc-40ea-9e17-100c103ceb07	true	access.token.claim
b15859cf-7fbc-40ea-9e17-100c103ceb07	locale	claim.name
b15859cf-7fbc-40ea-9e17-100c103ceb07	String	jsonType.label
c566fd67-3dfa-44c5-ae8e-0eb690075f17	true	introspection.token.claim
c566fd67-3dfa-44c5-ae8e-0eb690075f17	true	userinfo.token.claim
c566fd67-3dfa-44c5-ae8e-0eb690075f17	middleName	user.attribute
c566fd67-3dfa-44c5-ae8e-0eb690075f17	true	id.token.claim
c566fd67-3dfa-44c5-ae8e-0eb690075f17	true	access.token.claim
c566fd67-3dfa-44c5-ae8e-0eb690075f17	middle_name	claim.name
c566fd67-3dfa-44c5-ae8e-0eb690075f17	String	jsonType.label
cd919291-2fcd-4f6a-b960-372043d7701b	true	introspection.token.claim
cd919291-2fcd-4f6a-b960-372043d7701b	true	userinfo.token.claim
cd919291-2fcd-4f6a-b960-372043d7701b	username	user.attribute
cd919291-2fcd-4f6a-b960-372043d7701b	true	id.token.claim
cd919291-2fcd-4f6a-b960-372043d7701b	true	access.token.claim
cd919291-2fcd-4f6a-b960-372043d7701b	preferred_username	claim.name
cd919291-2fcd-4f6a-b960-372043d7701b	String	jsonType.label
ce338615-c7a4-446b-bc43-2279343c75dc	true	introspection.token.claim
ce338615-c7a4-446b-bc43-2279343c75dc	true	userinfo.token.claim
ce338615-c7a4-446b-bc43-2279343c75dc	true	id.token.claim
ce338615-c7a4-446b-bc43-2279343c75dc	true	access.token.claim
e089a7a9-4ab8-468b-9155-7d46d535192a	true	introspection.token.claim
e089a7a9-4ab8-468b-9155-7d46d535192a	true	userinfo.token.claim
e089a7a9-4ab8-468b-9155-7d46d535192a	updatedAt	user.attribute
e089a7a9-4ab8-468b-9155-7d46d535192a	true	id.token.claim
e089a7a9-4ab8-468b-9155-7d46d535192a	true	access.token.claim
e089a7a9-4ab8-468b-9155-7d46d535192a	updated_at	claim.name
e089a7a9-4ab8-468b-9155-7d46d535192a	long	jsonType.label
6326c9dc-a797-47b0-a3fb-817d9f9ace90	true	introspection.token.claim
6326c9dc-a797-47b0-a3fb-817d9f9ace90	true	userinfo.token.claim
6326c9dc-a797-47b0-a3fb-817d9f9ace90	emailVerified	user.attribute
6326c9dc-a797-47b0-a3fb-817d9f9ace90	true	id.token.claim
6326c9dc-a797-47b0-a3fb-817d9f9ace90	true	access.token.claim
6326c9dc-a797-47b0-a3fb-817d9f9ace90	email_verified	claim.name
6326c9dc-a797-47b0-a3fb-817d9f9ace90	boolean	jsonType.label
b320c5dc-0e86-4404-8887-f0fc0ddcf0c5	true	introspection.token.claim
b320c5dc-0e86-4404-8887-f0fc0ddcf0c5	true	userinfo.token.claim
b320c5dc-0e86-4404-8887-f0fc0ddcf0c5	email	user.attribute
b320c5dc-0e86-4404-8887-f0fc0ddcf0c5	true	id.token.claim
b320c5dc-0e86-4404-8887-f0fc0ddcf0c5	true	access.token.claim
b320c5dc-0e86-4404-8887-f0fc0ddcf0c5	email	claim.name
b320c5dc-0e86-4404-8887-f0fc0ddcf0c5	String	jsonType.label
19e0d850-c837-4214-8a69-256ef93e4601	formatted	user.attribute.formatted
19e0d850-c837-4214-8a69-256ef93e4601	country	user.attribute.country
19e0d850-c837-4214-8a69-256ef93e4601	true	introspection.token.claim
19e0d850-c837-4214-8a69-256ef93e4601	postal_code	user.attribute.postal_code
19e0d850-c837-4214-8a69-256ef93e4601	true	userinfo.token.claim
19e0d850-c837-4214-8a69-256ef93e4601	street	user.attribute.street
19e0d850-c837-4214-8a69-256ef93e4601	true	id.token.claim
19e0d850-c837-4214-8a69-256ef93e4601	region	user.attribute.region
19e0d850-c837-4214-8a69-256ef93e4601	true	access.token.claim
19e0d850-c837-4214-8a69-256ef93e4601	locality	user.attribute.locality
8e99c9c6-691d-48fd-a6a1-d3853f7849cc	true	introspection.token.claim
8e99c9c6-691d-48fd-a6a1-d3853f7849cc	true	userinfo.token.claim
8e99c9c6-691d-48fd-a6a1-d3853f7849cc	phoneNumber	user.attribute
8e99c9c6-691d-48fd-a6a1-d3853f7849cc	true	id.token.claim
8e99c9c6-691d-48fd-a6a1-d3853f7849cc	true	access.token.claim
8e99c9c6-691d-48fd-a6a1-d3853f7849cc	phone_number	claim.name
8e99c9c6-691d-48fd-a6a1-d3853f7849cc	String	jsonType.label
ff842e4b-0040-4e89-a415-c71e11885143	true	introspection.token.claim
ff842e4b-0040-4e89-a415-c71e11885143	true	userinfo.token.claim
ff842e4b-0040-4e89-a415-c71e11885143	phoneNumberVerified	user.attribute
ff842e4b-0040-4e89-a415-c71e11885143	true	id.token.claim
ff842e4b-0040-4e89-a415-c71e11885143	true	access.token.claim
ff842e4b-0040-4e89-a415-c71e11885143	phone_number_verified	claim.name
ff842e4b-0040-4e89-a415-c71e11885143	boolean	jsonType.label
38aec9ba-0ef6-4ddf-b0b8-ba235c997cba	true	introspection.token.claim
38aec9ba-0ef6-4ddf-b0b8-ba235c997cba	true	access.token.claim
7b179172-3b9e-4972-860c-dbe5eb4920c8	true	introspection.token.claim
7b179172-3b9e-4972-860c-dbe5eb4920c8	true	multivalued
7b179172-3b9e-4972-860c-dbe5eb4920c8	foo	user.attribute
7b179172-3b9e-4972-860c-dbe5eb4920c8	true	access.token.claim
7b179172-3b9e-4972-860c-dbe5eb4920c8	realm_access.roles	claim.name
7b179172-3b9e-4972-860c-dbe5eb4920c8	String	jsonType.label
8ea7e7d3-9a1b-4a75-80c3-67d6fc544628	true	introspection.token.claim
8ea7e7d3-9a1b-4a75-80c3-67d6fc544628	true	multivalued
8ea7e7d3-9a1b-4a75-80c3-67d6fc544628	foo	user.attribute
8ea7e7d3-9a1b-4a75-80c3-67d6fc544628	true	access.token.claim
8ea7e7d3-9a1b-4a75-80c3-67d6fc544628	resource_access.${client_id}.roles	claim.name
8ea7e7d3-9a1b-4a75-80c3-67d6fc544628	String	jsonType.label
a87dc44c-ad9d-4983-aa06-5721a4ea604f	true	introspection.token.claim
a87dc44c-ad9d-4983-aa06-5721a4ea604f	true	access.token.claim
37736d4c-acae-4bee-9580-094eb30985d6	true	introspection.token.claim
37736d4c-acae-4bee-9580-094eb30985d6	true	multivalued
37736d4c-acae-4bee-9580-094eb30985d6	foo	user.attribute
37736d4c-acae-4bee-9580-094eb30985d6	true	id.token.claim
37736d4c-acae-4bee-9580-094eb30985d6	true	access.token.claim
37736d4c-acae-4bee-9580-094eb30985d6	groups	claim.name
37736d4c-acae-4bee-9580-094eb30985d6	String	jsonType.label
bb8c8c30-933e-48c6-a4b9-32bdd4869e98	true	introspection.token.claim
bb8c8c30-933e-48c6-a4b9-32bdd4869e98	true	userinfo.token.claim
bb8c8c30-933e-48c6-a4b9-32bdd4869e98	username	user.attribute
bb8c8c30-933e-48c6-a4b9-32bdd4869e98	true	id.token.claim
bb8c8c30-933e-48c6-a4b9-32bdd4869e98	true	access.token.claim
bb8c8c30-933e-48c6-a4b9-32bdd4869e98	upn	claim.name
bb8c8c30-933e-48c6-a4b9-32bdd4869e98	String	jsonType.label
60b8bfa7-57d2-468f-9bc1-d7c13ec58e78	true	introspection.token.claim
60b8bfa7-57d2-468f-9bc1-d7c13ec58e78	true	id.token.claim
60b8bfa7-57d2-468f-9bc1-d7c13ec58e78	true	access.token.claim
32f95382-bbef-4f0e-9518-6884769bf18e	true	introspection.token.claim
32f95382-bbef-4f0e-9518-6884769bf18e	true	access.token.claim
3d38e512-7b27-4de9-9832-805711c7cd90	AUTH_TIME	user.session.note
3d38e512-7b27-4de9-9832-805711c7cd90	true	introspection.token.claim
3d38e512-7b27-4de9-9832-805711c7cd90	true	id.token.claim
3d38e512-7b27-4de9-9832-805711c7cd90	true	access.token.claim
3d38e512-7b27-4de9-9832-805711c7cd90	auth_time	claim.name
3d38e512-7b27-4de9-9832-805711c7cd90	long	jsonType.label
406c68fb-f3f3-4253-adac-c9acc9d9b883	client_id	user.session.note
406c68fb-f3f3-4253-adac-c9acc9d9b883	true	introspection.token.claim
406c68fb-f3f3-4253-adac-c9acc9d9b883	true	id.token.claim
406c68fb-f3f3-4253-adac-c9acc9d9b883	true	access.token.claim
406c68fb-f3f3-4253-adac-c9acc9d9b883	client_id	claim.name
406c68fb-f3f3-4253-adac-c9acc9d9b883	String	jsonType.label
4950fe44-a432-4445-a82f-18e530a6c1b0	clientHost	user.session.note
4950fe44-a432-4445-a82f-18e530a6c1b0	true	introspection.token.claim
4950fe44-a432-4445-a82f-18e530a6c1b0	true	id.token.claim
4950fe44-a432-4445-a82f-18e530a6c1b0	true	access.token.claim
4950fe44-a432-4445-a82f-18e530a6c1b0	clientHost	claim.name
4950fe44-a432-4445-a82f-18e530a6c1b0	String	jsonType.label
a4b5a5ee-a5f4-4055-940e-aa3f50f4c436	clientAddress	user.session.note
a4b5a5ee-a5f4-4055-940e-aa3f50f4c436	true	introspection.token.claim
a4b5a5ee-a5f4-4055-940e-aa3f50f4c436	true	id.token.claim
a4b5a5ee-a5f4-4055-940e-aa3f50f4c436	true	access.token.claim
a4b5a5ee-a5f4-4055-940e-aa3f50f4c436	clientAddress	claim.name
a4b5a5ee-a5f4-4055-940e-aa3f50f4c436	String	jsonType.label
56d38634-ecff-4da5-a34e-6b608a3dab7c	true	introspection.token.claim
56d38634-ecff-4da5-a34e-6b608a3dab7c	true	multivalued
56d38634-ecff-4da5-a34e-6b608a3dab7c	true	id.token.claim
56d38634-ecff-4da5-a34e-6b608a3dab7c	true	access.token.claim
56d38634-ecff-4da5-a34e-6b608a3dab7c	organization	claim.name
56d38634-ecff-4da5-a34e-6b608a3dab7c	String	jsonType.label
5427fd8d-7672-4cdf-b567-f29760d12c8d	true	introspection.token.claim
5427fd8d-7672-4cdf-b567-f29760d12c8d	true	userinfo.token.claim
5427fd8d-7672-4cdf-b567-f29760d12c8d	locale	user.attribute
5427fd8d-7672-4cdf-b567-f29760d12c8d	true	id.token.claim
5427fd8d-7672-4cdf-b567-f29760d12c8d	true	access.token.claim
5427fd8d-7672-4cdf-b567-f29760d12c8d	locale	claim.name
5427fd8d-7672-4cdf-b567-f29760d12c8d	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
c06c755e-09ee-4891-9c04-67318d8ec8d7	60	300	300	\N	\N	\N	t	f	0	\N	microservice-realm	0	\N	t	f	f	f	EXTERNAL	1800	36000	f	f	411e2d55-fd42-40d2-811c-7665243af5e3	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	5a897671-2928-4280-8730-6cc222b9f346	0d05c7bd-1c68-4ea0-bb7e-358deaa1d590	21893c14-6850-480a-81d5-7c8ab6f88a46	d8cac174-ccf5-4d73-ab97-c2ee61e9af1a	9ebe01e9-58a8-474a-8bf2-71bf8c0b425e	2592000	f	900	t	f	ae50f47a-645a-4e10-9cfc-f3cabe5354e5	0	f	0	0	c44996aa-ddd1-4f7c-88be-5a7a68d5bbe6
56b327ff-740d-4ddf-9176-2d0997c1abec	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	b4eca891-8db4-463c-9cbd-3e4da02b47ab	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	0dcabd7a-cdc7-43cb-a339-e963b35fb167	828b08a7-7179-426b-8fa9-194d1ad0deca	c25ad38f-c08d-46f8-ad08-0c888cc6a2e3	2810efc5-e1d2-443d-9e0f-5407cde5c08e	f6cb886c-f214-4929-b558-a711a98f9e56	2592000	f	900	t	f	090e9851-f248-47dd-b656-1ae1a63edd44	0	f	0	0	f24e02a8-9e85-4b28-b527-13941514017d
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	56b327ff-740d-4ddf-9176-2d0997c1abec	
_browser_header.xContentTypeOptions	56b327ff-740d-4ddf-9176-2d0997c1abec	nosniff
_browser_header.referrerPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	no-referrer
_browser_header.xRobotsTag	56b327ff-740d-4ddf-9176-2d0997c1abec	none
_browser_header.xFrameOptions	56b327ff-740d-4ddf-9176-2d0997c1abec	SAMEORIGIN
_browser_header.contentSecurityPolicy	56b327ff-740d-4ddf-9176-2d0997c1abec	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	56b327ff-740d-4ddf-9176-2d0997c1abec	1; mode=block
_browser_header.strictTransportSecurity	56b327ff-740d-4ddf-9176-2d0997c1abec	max-age=31536000; includeSubDomains
bruteForceProtected	56b327ff-740d-4ddf-9176-2d0997c1abec	false
permanentLockout	56b327ff-740d-4ddf-9176-2d0997c1abec	false
maxTemporaryLockouts	56b327ff-740d-4ddf-9176-2d0997c1abec	0
bruteForceStrategy	56b327ff-740d-4ddf-9176-2d0997c1abec	MULTIPLE
maxFailureWaitSeconds	56b327ff-740d-4ddf-9176-2d0997c1abec	900
minimumQuickLoginWaitSeconds	56b327ff-740d-4ddf-9176-2d0997c1abec	60
waitIncrementSeconds	56b327ff-740d-4ddf-9176-2d0997c1abec	60
quickLoginCheckMilliSeconds	56b327ff-740d-4ddf-9176-2d0997c1abec	1000
maxDeltaTimeSeconds	56b327ff-740d-4ddf-9176-2d0997c1abec	43200
failureFactor	56b327ff-740d-4ddf-9176-2d0997c1abec	30
realmReusableOtpCode	56b327ff-740d-4ddf-9176-2d0997c1abec	false
firstBrokerLoginFlowId	56b327ff-740d-4ddf-9176-2d0997c1abec	36659472-5445-43f5-aaa1-15b589f36520
displayName	56b327ff-740d-4ddf-9176-2d0997c1abec	Keycloak
displayNameHtml	56b327ff-740d-4ddf-9176-2d0997c1abec	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	56b327ff-740d-4ddf-9176-2d0997c1abec	RS256
offlineSessionMaxLifespanEnabled	56b327ff-740d-4ddf-9176-2d0997c1abec	false
offlineSessionMaxLifespan	56b327ff-740d-4ddf-9176-2d0997c1abec	5184000
bruteForceProtected	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
permanentLockout	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
maxTemporaryLockouts	c06c755e-09ee-4891-9c04-67318d8ec8d7	0
bruteForceStrategy	c06c755e-09ee-4891-9c04-67318d8ec8d7	MULTIPLE
maxFailureWaitSeconds	c06c755e-09ee-4891-9c04-67318d8ec8d7	900
minimumQuickLoginWaitSeconds	c06c755e-09ee-4891-9c04-67318d8ec8d7	60
waitIncrementSeconds	c06c755e-09ee-4891-9c04-67318d8ec8d7	60
quickLoginCheckMilliSeconds	c06c755e-09ee-4891-9c04-67318d8ec8d7	1000
maxDeltaTimeSeconds	c06c755e-09ee-4891-9c04-67318d8ec8d7	43200
failureFactor	c06c755e-09ee-4891-9c04-67318d8ec8d7	30
realmReusableOtpCode	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
defaultSignatureAlgorithm	c06c755e-09ee-4891-9c04-67318d8ec8d7	RS256
offlineSessionMaxLifespanEnabled	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
offlineSessionMaxLifespan	c06c755e-09ee-4891-9c04-67318d8ec8d7	5184000
actionTokenGeneratedByAdminLifespan	c06c755e-09ee-4891-9c04-67318d8ec8d7	43200
actionTokenGeneratedByUserLifespan	c06c755e-09ee-4891-9c04-67318d8ec8d7	300
oauth2DeviceCodeLifespan	c06c755e-09ee-4891-9c04-67318d8ec8d7	600
oauth2DevicePollingInterval	c06c755e-09ee-4891-9c04-67318d8ec8d7	5
webAuthnPolicyRpEntityName	c06c755e-09ee-4891-9c04-67318d8ec8d7	keycloak
webAuthnPolicySignatureAlgorithms	c06c755e-09ee-4891-9c04-67318d8ec8d7	ES256,RS256
webAuthnPolicyRpId	c06c755e-09ee-4891-9c04-67318d8ec8d7	
webAuthnPolicyAttestationConveyancePreference	c06c755e-09ee-4891-9c04-67318d8ec8d7	not specified
webAuthnPolicyAuthenticatorAttachment	c06c755e-09ee-4891-9c04-67318d8ec8d7	not specified
webAuthnPolicyRequireResidentKey	c06c755e-09ee-4891-9c04-67318d8ec8d7	not specified
webAuthnPolicyUserVerificationRequirement	c06c755e-09ee-4891-9c04-67318d8ec8d7	not specified
webAuthnPolicyCreateTimeout	c06c755e-09ee-4891-9c04-67318d8ec8d7	0
webAuthnPolicyAvoidSameAuthenticatorRegister	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
webAuthnPolicyRpEntityNamePasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	ES256,RS256
webAuthnPolicyRpIdPasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	
webAuthnPolicyAttestationConveyancePreferencePasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	not specified
webAuthnPolicyRequireResidentKeyPasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	not specified
webAuthnPolicyCreateTimeoutPasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
cibaBackchannelTokenDeliveryMode	c06c755e-09ee-4891-9c04-67318d8ec8d7	poll
cibaExpiresIn	c06c755e-09ee-4891-9c04-67318d8ec8d7	120
cibaInterval	c06c755e-09ee-4891-9c04-67318d8ec8d7	5
cibaAuthRequestedUserHint	c06c755e-09ee-4891-9c04-67318d8ec8d7	login_hint
parRequestUriLifespan	c06c755e-09ee-4891-9c04-67318d8ec8d7	60
firstBrokerLoginFlowId	c06c755e-09ee-4891-9c04-67318d8ec8d7	9bab4c16-959c-4477-ae1c-ba14d9e8c1ec
organizationsEnabled	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
adminPermissionsEnabled	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
verifiableCredentialsEnabled	c06c755e-09ee-4891-9c04-67318d8ec8d7	false
clientSessionIdleTimeout	c06c755e-09ee-4891-9c04-67318d8ec8d7	0
clientSessionMaxLifespan	c06c755e-09ee-4891-9c04-67318d8ec8d7	0
clientOfflineSessionIdleTimeout	c06c755e-09ee-4891-9c04-67318d8ec8d7	0
clientOfflineSessionMaxLifespan	c06c755e-09ee-4891-9c04-67318d8ec8d7	0
client-policies.profiles	c06c755e-09ee-4891-9c04-67318d8ec8d7	{"profiles":[]}
client-policies.policies	c06c755e-09ee-4891-9c04-67318d8ec8d7	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	c06c755e-09ee-4891-9c04-67318d8ec8d7	
_browser_header.xContentTypeOptions	c06c755e-09ee-4891-9c04-67318d8ec8d7	nosniff
_browser_header.referrerPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	no-referrer
_browser_header.xRobotsTag	c06c755e-09ee-4891-9c04-67318d8ec8d7	none
_browser_header.xFrameOptions	c06c755e-09ee-4891-9c04-67318d8ec8d7	SAMEORIGIN
_browser_header.contentSecurityPolicy	c06c755e-09ee-4891-9c04-67318d8ec8d7	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	c06c755e-09ee-4891-9c04-67318d8ec8d7	1; mode=block
_browser_header.strictTransportSecurity	c06c755e-09ee-4891-9c04-67318d8ec8d7	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
56b327ff-740d-4ddf-9176-2d0997c1abec	jboss-logging
c06c755e-09ee-4891-9c04-67318d8ec8d7	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	56b327ff-740d-4ddf-9176-2d0997c1abec
password	password	t	t	c06c755e-09ee-4891-9c04-67318d8ec8d7
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
f03d2cc1-6890-4ff1-8e4a-2e6e8fd33015	/realms/master/account/*
458d22c7-d9da-4293-ac2b-b6cd7bb19985	/realms/master/account/*
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	/admin/master/console/*
cee6ee7b-7d7a-4f45-8748-b21f60571c88	/realms/microservice-realm/account/*
5f91e27e-b433-4d28-8d66-47e221570093	/realms/microservice-realm/account/*
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	/admin/microservice-realm/console/*
8e1ec687-37a5-487a-b1e7-30646387404d	http://localhost:4200/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
9e703415-5ad4-4659-ba6b-09113d9e7bf1	VERIFY_EMAIL	Verify Email	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	VERIFY_EMAIL	50
8d9308b7-e729-43e7-b904-01fee65935d3	UPDATE_PROFILE	Update Profile	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	UPDATE_PROFILE	40
9c5bbe7c-eb13-4ca6-ab05-f5f25e8a4b07	CONFIGURE_TOTP	Configure OTP	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	CONFIGURE_TOTP	10
29c8d97f-bac5-425c-9658-fb521c7e41cf	UPDATE_PASSWORD	Update Password	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	UPDATE_PASSWORD	30
4d3c500b-5dc2-4fa8-ad90-e84633d163f0	TERMS_AND_CONDITIONS	Terms and Conditions	56b327ff-740d-4ddf-9176-2d0997c1abec	f	f	TERMS_AND_CONDITIONS	20
6a27e37e-6195-4347-86a8-a0dc74744cf2	delete_account	Delete Account	56b327ff-740d-4ddf-9176-2d0997c1abec	f	f	delete_account	60
5250d07a-3a2e-4cab-ae72-c785f9d2d98c	delete_credential	Delete Credential	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	delete_credential	100
06420261-1e62-45f8-baea-4b80d820865f	update_user_locale	Update User Locale	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	update_user_locale	1000
f399db3a-d952-47d8-a11d-170dd0184cf2	webauthn-register	Webauthn Register	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	webauthn-register	70
6af86a0d-dbe8-4dcf-b190-613facb539f1	webauthn-register-passwordless	Webauthn Register Passwordless	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	webauthn-register-passwordless	80
443ea5f2-91ae-49da-bb1a-ef73c18ff5ea	VERIFY_PROFILE	Verify Profile	56b327ff-740d-4ddf-9176-2d0997c1abec	t	f	VERIFY_PROFILE	90
d91e066b-cda8-44af-8532-520f7aad3803	VERIFY_EMAIL	Verify Email	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	VERIFY_EMAIL	50
74a31128-ea43-48e1-b49f-fda5b89b748f	UPDATE_PROFILE	Update Profile	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	UPDATE_PROFILE	40
7638dab3-3823-4ac1-a7d3-c3c559084817	CONFIGURE_TOTP	Configure OTP	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	CONFIGURE_TOTP	10
fb5f9da7-0f23-461e-8e3f-6edcd57f620c	UPDATE_PASSWORD	Update Password	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	UPDATE_PASSWORD	30
3e947726-e525-43de-b429-18006e41b727	TERMS_AND_CONDITIONS	Terms and Conditions	c06c755e-09ee-4891-9c04-67318d8ec8d7	f	f	TERMS_AND_CONDITIONS	20
c5f411a5-80a4-406d-9225-f19e43b0bb60	delete_account	Delete Account	c06c755e-09ee-4891-9c04-67318d8ec8d7	f	f	delete_account	60
3a43a8c9-6bb8-442e-af3e-43835978fecb	delete_credential	Delete Credential	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	delete_credential	100
4d13b6b9-4001-47ad-bf15-108daaad321b	update_user_locale	Update User Locale	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	update_user_locale	1000
07ecd2a5-b76e-4ee7-bb21-b4513a7228ef	webauthn-register	Webauthn Register	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	webauthn-register	70
844e48b0-928c-4c27-aad3-44e7b1842a71	webauthn-register-passwordless	Webauthn Register Passwordless	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	webauthn-register-passwordless	80
4686dfb4-0cee-4456-9c7d-1d43396d7aad	VERIFY_PROFILE	Verify Profile	c06c755e-09ee-4891-9c04-67318d8ec8d7	t	f	VERIFY_PROFILE	90
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
458d22c7-d9da-4293-ac2b-b6cd7bb19985	41cfd181-822f-4aa6-a893-08e822f1c7d2
458d22c7-d9da-4293-ac2b-b6cd7bb19985	273925b7-d838-413d-b31b-19e02dd9893e
5f91e27e-b433-4d28-8d66-47e221570093	75c36249-bc16-4081-93af-9dffa39a8cde
5f91e27e-b433-4d28-8d66-47e221570093	18fec74c-2066-4a21-944a-da2e0a3dd3b8
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	aa10695d-4cfd-40e4-9623-88fd11cbd142	aaee11f7-debc-4d49-bdc8-3e8e4f09df0c	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
aa10695d-4cfd-40e4-9623-88fd11cbd142	\N	6e49daf6-be32-4780-8006-64c9cdb83399	f	t	\N	\N	\N	56b327ff-740d-4ddf-9176-2d0997c1abec	admin	1748383013280	\N	0
6cbf3695-c463-48ca-85d4-d36c2aa9870b	test@gmail.com	test@gmail.com	t	t	\N	test	test	c06c755e-09ee-4891-9c04-67318d8ec8d7	test	1748383377950	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
f24e02a8-9e85-4b28-b527-13941514017d	aa10695d-4cfd-40e4-9623-88fd11cbd142
26a78061-dde5-410d-817b-158914fcce25	aa10695d-4cfd-40e4-9623-88fd11cbd142
c44996aa-ddd1-4f7c-88be-5a7a68d5bbe6	6cbf3695-c463-48ca-85d4-d36c2aa9870b
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
6f2c4f3d-aed4-4714-a6e1-210f47f16ef6	+
fcb30a8a-c358-425d-a01b-bcc770b5f3bd	+
8e1ec687-37a5-487a-b1e7-30646387404d	http://localhost:4200
\.


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

