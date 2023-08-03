Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9536076DFF7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 08:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbjHCGBL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 02:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjHCGBK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 02:01:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242A3E6F;
        Wed,  2 Aug 2023 23:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwU8937S5GUACBfumIvT18GsmF73KH9ilXojVuFlG3hXjAlyX/ARJMecYPxc+G1o7spebMZpAZsbxvk3Sp90EWZhpDhUESA2Z3al4SUqzpgvmo3PuRgc5BuZhW9WqOtnmTvNjW5/g5oVUZeSC3GI3v1HJAZlA6JYf36SqI856bw8HsC/qFaBAYldCDhVmtZiWEXchgnhwj4YPWeGjTiHW0OJxmAeG1RLbQFmXcZ6SUh/4KjwlZ3fj8dxFrQte98OLRg7En2Wa8vDzmur1+gP9yZV7aCGUsSXhysP+6AOufqmuciCocAchWFl3B4B/6SAM3Rtkr10tC8k4FyFzAvv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltFYv4GIQGNYuKWJnYmmkNqwUpbagq8DQpOE4Y+RPsY=;
 b=fXIBgjGGZDU3u4mozyHSJWTqbdGk0lw8Frgvj5yG6OGfAMqvAGrxJ0JQiFZfx2P9xFJThJuxY/eML2l7HcfOU+P+ZUOwEftgE8taTTdAIY1H07kCz/FfyB/Ajrxy2jiyC4gFgKJiRvFY+laje5R5Pklsy4WpQhlivUGMi9WwQlAzRqAz3rGILphlcvSZJlMCz7IyOW6ZiAQa5h2Ykbkl0RdXN5SGOPaiX49Xw2a+t85lfukw1NpqsJa/k86miRB4bLRVEXRZKWgyWsq+OImpnbQKyVtYp/jtnQuT+5VQ0BCC/jiE/a2BlRqDnjanTemZlyiVzvasTckW6XvPqk0/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltFYv4GIQGNYuKWJnYmmkNqwUpbagq8DQpOE4Y+RPsY=;
 b=lhVbuLRuIoJdlK57s4gbLspXCRuGAJwzgbAfZfZsZJDXDQt1r3e7aneGaIXQvP/HyZqijpow+JDMvkeqTWs4fCHBf5uoFDwitROX8OtPCQdGbo+RFjfTkz89wu/WpJ/8GMPCVsvAds1M9G04D+kn9D6mfIqRUrR1I6/X9T4pH3E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9840.jpnprd01.prod.outlook.com (2603:1096:400:229::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 06:01:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 06:01:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/3] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH v4 2/3] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZxTPELxwc8vJH5E2y5cpL45xCf6/XHAeAgAD4iGA=
Date:   Thu, 3 Aug 2023 06:01:04 +0000
Message-ID: <OS0PR01MB5922E3FE58E8EF93EF94A11B8608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
 <20230802112317.252745-3-biju.das.jz@bp.renesas.com>
 <ZMpxd91WelcwGicN@smile.fi.intel.com>
In-Reply-To: <ZMpxd91WelcwGicN@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9840:EE_
x-ms-office365-filtering-correlation-id: 90768bc7-3cb6-489b-4106-08db93e7059b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ytsFcZDcpJUfVmSxIjWTsUX2DCCA/v9NTcBFWSkx8wAiM7IzHsnjCLDkj8weqzW0uBxEUCjn4tVKOz5ylQ++62NglqZKt6q5Kgj7Nvq2FnnHzaFDFvD0W4pdBLZzMIfDQEY8ayvvU9MrmKCiSKOcAb5ClwvUyNB2IHTGiivWTYTFi8fCgNv/sBlNr1kmaxX11ypfd7f4HZZBiyuR1MLfoqte3KatOAI6CQtVsTmC34XRBSrpNo9mMCvdtlvoyalIoZV4oFM3Okh9ssop0XGphcThTEgIzFEoO/vakPpyGntY0/0GScwXJAFgta5HerpeoYhD6GXhk4QvhksCCtq5SPpEoMrJR4G+lScJrk0JxcfKEbKrHSGbdiaFktBNRMkFjppX6sCmzlY2EZTtuJ+tBvEbNO25ewRtoOjsA71Uksnbfn7lw1CGJM9JK4BZHyTvniqTVJpwNm6kLZnaNFU6s06WJ6rtD+MMd7Cp+aV9l/T8kUpXL3NGsLqYyhSrUDLH6qW8a+WbX7qZEo3kZD7KmLS/MSKbtC9Xe2FDtmlIYfOefC+0N4UTuJQr3+pQBni3gSRqMz4iwRNPxnSAkhimtiLgYavQERUqoizMaonwwVu0hG5q4MZh7PYBVB+UThBj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(6506007)(83380400001)(26005)(186003)(316002)(76116006)(2906002)(66946007)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(5660300002)(52536014)(41300700001)(8676002)(8936002)(7696005)(71200400001)(9686003)(478600001)(54906003)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DB5FgPlxTFfp074fKjZ0vePxDIZ46tXjnN+uf62Vd3PBTMKq9A++3Szt2zL9?=
 =?us-ascii?Q?rQ4rXP/wlzvrr/BLFFc5pdtVF7PtoHBJ9vdX/u+XZyHvhxtdDCWo/2lAnJH4?=
 =?us-ascii?Q?1Mc6MHxJKMZzh747MwOEg8vzSNTsZt0h+KF9Jwf8P7/fDIkwkqO0R5VSe4N/?=
 =?us-ascii?Q?FLfkerl+g9vdH4qwPlh4hd99CZpZM1JiOvyOtWjyPKH/OFOHPRF2LrAUhwOe?=
 =?us-ascii?Q?o+5F5Ca53g4MK4coO0bEwcnXZGmFI8yvJI57+Kat6jQt+nP7CSw1J12kEzhJ?=
 =?us-ascii?Q?XhqzUaAJzJitNpyVr/WRTUGuyvc9L7MkBmuYoTpl2h9kFKdCcRdh8wdD5nYy?=
 =?us-ascii?Q?866Ll+/uY/h0KpY7m0I4GdyFI28vv7pvEHp4lRK8FQVOveswbw6nhBwt3weJ?=
 =?us-ascii?Q?WQnQSHHhlW4e3bDHNAPevwDvyOsv6moFGS5c9qeqSRRZ4/1aDOS0SJ4sHa4H?=
 =?us-ascii?Q?K33BezWhgaEPTuAXmafcWyGvVKqMlfSDeQKZNNG8sKIEfOYAxwSV9Y6IGXJ8?=
 =?us-ascii?Q?YxWBexgUJ85ue0pD2U2r1gAn4VADqf42LeC8IjZfxR/scNWlsT7XY/5okJKf?=
 =?us-ascii?Q?yy+qc27YfjNbHBtNYd0FqlAOfnb6CpsT0jZD4+h36aV2sYZ8EIARB+uch5ie?=
 =?us-ascii?Q?zI114QWBhZ4SAT50LE0oHZoLu6C08dQnYsWSUluGa53DVpEZm6Jjp8X8IXKO?=
 =?us-ascii?Q?DDtG5r8D+023eR8UOhXHiBAB9OdX7KiI5d5kGg3z5hVpNaZ8TQ8ogmrr6EGf?=
 =?us-ascii?Q?8ccCSaeEnprPv0q/jIC1R6lFfoDUXVAtgKKgrTkXuRNp9/hJf7Om30LDQPc+?=
 =?us-ascii?Q?2dJamyXiuB5L4j9ZjT0NtLmQwCiysTGg/ZLqHTsNe/K6RS/E+QWNhGL6H0/u?=
 =?us-ascii?Q?EGhqhGb5Rw3Mf2tRMkkArVE+47agiPx4rhW7cQDvvUAs9Cskgd6GlIMx/XPH?=
 =?us-ascii?Q?gPjNt/ZqAxsR1szF3eQWZpG8zd73cB/FC37BP8rIIp1s+jv/kzN2gMU+kAwa?=
 =?us-ascii?Q?D5vR1kjU6cEV8Zo9bGVBJOjuUjt4oW7w8Ea2ukw3/eWzce5uJH4UJ3Iq2Zit?=
 =?us-ascii?Q?74subG/yUaXv8RQ9F8i8XFBB2IiYG6WXLjS0y9mSvXXMvACOXXGNzpxTsNCX?=
 =?us-ascii?Q?bPlbuhLum7xHJeQ/cThKZX2jNLvC3/nykPtfmXjoyy+JVDbdp9fx8oqslcJO?=
 =?us-ascii?Q?fxv+YwmOgxjG8jj4yOcBXjS8NALAJrjNJr9zPXAdMU8lV6CJ4fB4y70SoL+e?=
 =?us-ascii?Q?a/SepT2IgWOdaYflt9hRBigvOLnRssa9xRJT3NsXykdHusS+leXhceYJGFXW?=
 =?us-ascii?Q?mIaHais1ROovWwaqBPjGr/iVoNqLMkb//N483AaXmzvBXoq68VCQjUxSqvJe?=
 =?us-ascii?Q?qTXj9UR3iNtgadrlIEKIwuVpciT/5T3tj7Kl+j4iZL19ALDssLF7U9pemc21?=
 =?us-ascii?Q?9kXudK70Ov3aUs9KBPASqpUVlnEriZRejiF4SpC5i422RwHaE3nmkq2PttGQ?=
 =?us-ascii?Q?kUfQVZ9bDh7c3hoY9Bg/yuDENtduZO2ThHvUyVlLXsvQijObWVCyWJf5wdH7?=
 =?us-ascii?Q?XEn90MuL0/xhJcybfQUo3NcxkOmqti3H/jWLOzX2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90768bc7-3cb6-489b-4106-08db93e7059b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 06:01:04.3294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxXKyBQIWp4iVIT5x35pkgU9mrn57vNhoYjvWUAYxu3THUyOEb82viv1yIqQhQQdi4cAqWT6V7g0jp1geRVp9DGN6rqQ1qPFBdguf6oT1bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9840
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v4 2/3] i2c: Add i2c_device_get_match_data()
> callback
>=20
> On Wed, Aug 02, 2023 at 12:23:16PM +0100, Biju Das wrote:
> > Add i2c_device_get_match_data() callback to struct bus_type().
> >
> > While at it, introduced i2c_get_match_data_helper() to avoid code
> > duplication with i2c_get_match_data().
>=20
> ...
>=20
> > +static const void *i2c_get_match_data_helper(const struct i2c_client
> > +*client)
> >  {
> > -	struct i2c_driver *driver =3D to_i2c_driver(client->dev.driver);
> > +	const struct i2c_driver *driver =3D to_i2c_driver(client-
> >dev.driver);
> >  	const struct i2c_device_id *match;
> > +
> > +	match =3D i2c_match_id(driver->id_table, client);
> > +	if (!match)
> > +		return NULL;
> > +
> > +	return (const void *)match->driver_data; }
>=20
> Yes, perfect!
>=20
> ...
>=20
> > +static const void *i2c_device_get_match_data(const struct device
> > +*dev) {
> > +	/* TODO: use i2c_verify_client() when it accepts const pointer */
> > +	const struct i2c_client *client =3D (dev->type =3D=3D
> &i2c_client_type) ?
> > +					  to_i2c_client(dev) : NULL;
> > +
> > +	if (!client || !dev->driver)
> > +		return NULL;
> > +
> > +	return i2c_get_match_data_helper(client);
>=20
>=20
> I believe below looks better from readability and maintenance
> perspectives.

Agreed. Will Incorporate latest comment from v4 as well.

Cheers,
Biju

>=20
> 	const struct i2c_client *client;
>=20
> 	/* ...comment as in Dmitry's reply in v3 thread on why we need
> this check... */
> 	if (!dev->driver)
> 		return NULL;
>=20
> 	/* TODO: use i2c_verify_client() when it accepts const pointer */
> 	client =3D (dev->type =3D=3D &i2c_client_type) ? to_i2c_client(dev) :
> NULL;
> 	if (!client)
> 		return NULL;
>=20
> > +	return i2c_get_match_data_helper(client);
> > +}
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

