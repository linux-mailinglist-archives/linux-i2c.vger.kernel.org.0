Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5597076A976
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 08:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjHAGqL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 02:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjHAGqK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 02:46:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3341C1;
        Mon, 31 Jul 2023 23:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9NU3PdCjT9zvTyZzb5vZv9uZBmqNC8GcvOiE0X8HZ0C5nK9D9hWOqb80YxdzvYUO/C8OvMozGgQFSOfJH1qfQWlJeD6dHbWrK+B8cckwS+cfugEXPMMZhZ9s/HIItNACawaWXLKCuzrc+Pv9StgEP+Mv3kvbJfK9Q4y6YyjS0Y96LUCJLyGwYChNR3BZsOUzBfJBKokhNXFKNcF+TAaVkiC5MxsNPan+G/FqiAD3dQmDGuyjrRkse4QVGmzGmBJ4X8sRHVNdLYT30axzWPK9Kblvz2G0ANsgpQy6YSEQnQTIdm17xYjc5kp3N/UlWHrOehhbLqBS4SHtnqFxIKqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERaxS15XqcGxy2xGjjvZE7+zwRZxCylhp+11LtSOmik=;
 b=mkApY4i8NlzGg6Q8sBWbVY5gLEE5+WxausdrcuoIO6LjsyoluhQGdtbgSczjXGYCiZk8mN+V1mnv+qv6sdKdEGF8C9h2thrI6AEfI3/3Eapd9HyJrn8zdlNQt72FiHEjpDMYSN6mQwvK/jOPFIbGkLHb6P9nna7+evkEC/YCeg+1HX5uPcV8Ehm1clIn5hI4uL4Ow/kZzWJR4IJBImlV9VcBdXUV64YyPsm0AwxqDTagEhvjPhMK7bNQlpaVU4HGdADgT0PDIsZBtPfx5m/Lw8JqKInPxncrTbl1SAh9b5GNBcnKGF0j450v2SQkhyD6fnv0vZHsq+8Zozax/OxZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERaxS15XqcGxy2xGjjvZE7+zwRZxCylhp+11LtSOmik=;
 b=aYtZK89TmAkpaOANtsyI8+5YpJEKSLnj9xmCNTHsdlcxrEJ6f+TVW66VlXmybdUepna71Rf8UN58BfOoHn2D9/cL7zVeUZtRAslkG9wv/gh2OI5BjYV2K29xD8BWH4cjvZ27y/lr4rWG0vnv080QQz2S2Zdt5f7d5uFvONHIqVM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8672.jpnprd01.prod.outlook.com (2603:1096:604:185::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 06:46:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 06:46:05 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZv8I//eJwt44Rq0y5OeqtZOu7J6/MQVGAgAAUOoCAAQ0IgIAHpSxA
Date:   Tue, 1 Aug 2023 06:46:05 +0000
Message-ID: <OS0PR01MB5922A34032A181B0257E2429860AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230726130804.186313-1-biju.das.jz@bp.renesas.com>
 <20230726130804.186313-3-biju.das.jz@bp.renesas.com>
 <ZMFNYQHqWrS+zSXQ@smile.fi.intel.com>
 <CAKdAkRT1Zdut28YYG9PxOQXfvMGZuXD8=qG9q4KtHKNvsxy76A@mail.gmail.com>
 <ZMJAB7RcICd9wjdv@smile.fi.intel.com>
In-Reply-To: <ZMJAB7RcICd9wjdv@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8672:EE_
x-ms-office365-filtering-correlation-id: 422761d7-6cbd-4bb6-7b64-08db925afb09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 67SEHSxBR51W25wouoejCvflJbsXmrv7GPKdxKVgAP20ZCsnMcFS8HeSG8azIeK33NveLCmwNKEclUHTCj/xrerJVn1s9ZK19X8u2mgEatZY7LSDVxSzuE59Lm5fzMClHpVPZBqFbl0yA1fQ43lOFVmmnSdsDKrZ+1sMhrWxUjajROtYPiIiun7OWYZTdCJpEU4Nt5kMBh0k/omCtxRc9CiyM5rhOtA/F22Ts/yu12eOdrs0U/SbHPyoKodNGNKIS6TSViJzwAtFQaworTK/W6C8wkRc4Q1xYhofVIlEh2rBqAp4Bs9hupFhGmoAezrYFFfnnRc3qe09cryOMRz1x3ldIwCJDpQESSS4W8Y+7c6aBvOdKckKhI693joqvAbJEr+YENJo/L9PQb5XcvyxLVxra7alaIeQX7klTcDGTzd7WB/Ai2pcNsqyD0FNYRc/gwV7rbcW6dKuETopIhHkOoJuPNs/yM5xCpQ4wGWwunKnmDcsHEbFEj2tYQWpnxlLbGENCNqZZ7CyxVA1yiYdOIkyo8+ZW6fgnGn2iXvBMr1/FoDSBnDWo5MAFiHRUlo7aH61fWjFpV69RAnrbqcLVRG3JreKsJ1P352OhYtpp7xawaptbZWBU0YqTHQSILVv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199021)(52536014)(110136005)(54906003)(122000001)(9686003)(26005)(33656002)(6506007)(7696005)(8676002)(8936002)(5660300002)(55016003)(66946007)(66476007)(76116006)(64756008)(66556008)(71200400001)(66446008)(4326008)(2906002)(83380400001)(38070700005)(478600001)(41300700001)(86362001)(186003)(38100700002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?skdh7koUHJMlKmUrSMWOSOCRStw8Xb4k4CxIByH96vpMW2w9bF9N6UBKyf0/?=
 =?us-ascii?Q?arxNEG/VP6PfxKDncZmfaDObFLVIlmmr74tZ8OnRqh6e3zRhs+cuRDmQ3/0O?=
 =?us-ascii?Q?OWD1eCIXji9dmsV798ACew9N4X7idyNMQZ/rzGaH2uzNPgPXxQelgGmG8XWH?=
 =?us-ascii?Q?EO7r2KbUjx1f2M3E/FvXzC6N6SUEhV2MNFSlNyzMpZ8G81K2y9NGM0lr7FpF?=
 =?us-ascii?Q?VnsjCxHN/qZx6I26tKPlVYZFuoR3RBM41w+NoWS6Dor2X8zen37bboLOBYhf?=
 =?us-ascii?Q?/MwB5dg42doj37olDMgcEh0uAYoH+ixIFk/vnInc/sokH+sGZg+ScFx3YllA?=
 =?us-ascii?Q?Mnjsy2REeNEHUsRJQCrq7CnhXuYRvH/uf8YjY/n8SGbZZvhnwv3i6cchgt4t?=
 =?us-ascii?Q?MJcz3sHBEwOPKbOSixWQpFzud+SPf4sY6zYeCr7kvQF74riMN/1f6sawE8/G?=
 =?us-ascii?Q?4ve/0p/YYpXBD0PhC8FJLm4tk7fe2qaO1g+GzlcM+7LjO0HlDQ1VtUvD/WzS?=
 =?us-ascii?Q?EkmVJwan/nLLZXQjT6Aj7nFtm4kZCoOBxxpsuFFCExATu2V09puHhp2hCcpl?=
 =?us-ascii?Q?ulqqvo7JGmHzKnU/SfOD+R4thcHXnhEScKm+9IKHTbSmD3KhjzztVy916dMj?=
 =?us-ascii?Q?O/qvV1uMQEsXsIuQKviA1skYF6MsCJDALamNmQ9SI7keDDUkpnEtyvFzy0gN?=
 =?us-ascii?Q?woAX3ddCpxcpF7zQM99YKbUmyMvI5sAR86qTdaYkXGNcH8zm1lOj/e9wU8oD?=
 =?us-ascii?Q?yKmxneVWtLBjcO+/GClKnsgHhNPpt4gXIvNmEFDL4k3jovbHL9pu0nr1P9HO?=
 =?us-ascii?Q?0/hKZmpOfY0M1UqGo/o7QuoC8o1dgJEFlBYui/oxYS2N/awcQ+nhnxr0SvLI?=
 =?us-ascii?Q?+Fbs0LNnQKoJz2/pHvI4xpi99+VOZeoUHhcqLkghBfcMaHkqQb7WOWUOjgZP?=
 =?us-ascii?Q?bbNIMrBKGtUQ6DiFpSuC2GqG0qpArLIiT1lI3sXhU46OqX2N9fV8JzZdKpjE?=
 =?us-ascii?Q?ffaVS86XJ/P2TUVEMSMD1ZiBjF6mQgnI205t+Iy23tR2EbBmWcKPq4RNXwUN?=
 =?us-ascii?Q?Z4zZwGRC3HRGUSCHYWCjWA205uB1G9joSqibbBye0SZ4/eCLwUbX28wJUIsN?=
 =?us-ascii?Q?Ih02P9pULTlRcfeq0HCjCVucMGsOYMQFxWxI6+AolbgvRMn0Q67DtYk/LS8V?=
 =?us-ascii?Q?2yQkJXTPTrjenkV2xF7ujbJpqNJQ+zQgLHdjLg3evyB4Sx/uji2YVugf2rQq?=
 =?us-ascii?Q?ngD2z8T2bRmbr3TTjXYxD81/vnyPHXlvoPK396FttODcOMVtYjGDKK8AsY/H?=
 =?us-ascii?Q?z5TpQhnV7ZPegFw0ICfyo75FWWQpOnQIc+DAoqNPC4tqZkrE/KrBB31DWYY5?=
 =?us-ascii?Q?iKWXNmOdtFUROK6jZg722OArf0hOhsS3+AksakmPml8FaH80RbOiRn84s8b0?=
 =?us-ascii?Q?xO4riWX5+crxFHEHC6erue55S5yGqjo15iJrl0ysFjoSme9yPDOn7Q3HL7Pf?=
 =?us-ascii?Q?c494nWKNw37lFsVrCKaShEYn3vWp/POl2d3vIWaXqjGnvLrGH3nHZ5vi7sxU?=
 =?us-ascii?Q?9XAvSQ0Tn36q4Mgq3rLPkGSO1pi5ofU9tXXmGUrG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422761d7-6cbd-4bb6-7b64-08db925afb09
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 06:46:05.9413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3WtnUJ5RvYpr5Ltza05xaBAmyx+IXOWJ9vtsgaJptZ9t+eKoqOOJ4ELzB45NFQlYcsRaC3xC4jEbLn1TYEY96pKsJf8ZsDqpxm7FpEmHg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8672
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data()
> callback
>=20
> On Wed, Jul 26, 2023 at 10:56:41AM -0700, Dmitry Torokhov wrote:
> > On Wed, Jul 26, 2023 at 07:44:17PM +0300, Andy Shevchenko wrote:
> > > On Wed, Jul 26, 2023 at 02:08:04PM +0100, Biju Das wrote:
>=20
> ...
>=20
> > > > +static const void *i2c_device_get_match_data(const struct device
> > > > +*dev) {
> > > > +   const struct i2c_client *client =3D (dev->type =3D=3D
> &i2c_client_type) ?
> > > > +                                     to_i2c_client(dev) : NULL;
> > >
> > > There is an API i2c_verify_client() or something like this, I don't
> > > remember by heart.
> >
> > It's been discussed in a separate thread. i2c_verify_client() needs a
> > non-const pointer. It would be nice to clean up i2c_verify_client() to
> > accept both variants, but that can be done later.
>=20
> Then this code needs a TODO comment:
>=20
> 	/* TODO: use i2c_verify_client() when it accepts const pointer */

Agreed.

>=20
>=20
> > > > +   if (!dev->driver)
> > > > +           return NULL;
> > > > +
> > > > +   return i2c_get_match_data_helper(to_i2c_driver(dev->driver),
> > > > +client); }
>=20
> ...
>=20
> > > Side question, what is the idea for i2c_of_match_device()? Shouldn't
> > > you also take it into consideration?
> >
> > Good call. I think we need to add something like
> >
> >         if (!data && driver->driver.of_match_table) {
> >                 match =3D
> > i2c_of_match_device_sysfs(driver->driver.of_match_table, client);
> >                 if (match)
> >                         data =3D match->data;
> >         }
> >
> > to i2c_device_get_match_data().
>=20
> Haven't checked myself, by I trust your suggestion. Let's see it in v3
> then.

OK, will send V3 to provide feedback.

Cheers,
Biju
