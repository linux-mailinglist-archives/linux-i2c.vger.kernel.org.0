Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63EDE76C7B8
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 10:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjHBIAZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 04:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjHBIAI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 04:00:08 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B116C2706;
        Wed,  2 Aug 2023 00:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgbsqRnElZ/bCDHTmOo90TNOsxlgj0Zca4OW7f4DoNpz3lvFKSQzCZjEbkICAhfT3tui9qp28knx0G/Sc8NVH2RgoEFhjN7k6VIvK8Gssb1FlwnIhdtlGM/3XVH8q1IuLpjCMWdaPeo/csx6bwM47fYzlOgFdpOdLrORxuvtdHZNmUkeURH15lEjaZ0Tj74LeSR0DIlCNMiL2IY9Iunzf4CEuIep/HFOoKnyNvbHn5YMg9f3zG9KV59xUcXzbTYgoJ7ltvXSOILmo1K6aF5DUVxwIhjO0mV9BnDiqHBPcCNY9HMl8fSf15WTV5c6kc7kVmLUTbTOjClnEXkzdBEtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMcg1x3Rs8Op7C9uBRquK1UoMfMSNqYS8KybDEqTDgA=;
 b=BHfF8ou399KAkHkmgEQao6yBeuHeaVo97/1AcU1VX1m+UzSc1HIvZxNLaFg/3JjrR3SvWzRbcY4k1klCihqgSTPgXHlbS41grfLHA39e4nBLlLsHuQroW+0AIKdFpjl85CpNurp8Def9jnkwmyY28Yz4V13GNFVBDpxRwVoOyoYe70dnK16gFN/aqXxFxrEDKFye0SuXKcxEe4agq9E3HMNWy60islSv10TOYmLAXmw/SNbtquGLdcAUt64yhXEMA7mAoSPXRpneoGWvNlb0v0tc+DEOn9PVv0er66M1g7eeT6hCeXVT/WcPvVTpQSQWCmKRHEqmThG2K/dNVDOHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMcg1x3Rs8Op7C9uBRquK1UoMfMSNqYS8KybDEqTDgA=;
 b=A2J7x/6mbbe2mKtLBQRPGSRcjNXCrDbKZm5O1U4//6tGGxVKBomb9rcVFVSjIH6opY4QTZOSZ7RYq6LLI3EAnAuu61q4utab6PXD0VxWrZXIOIDugxfLyMdt0rkmKMB2/cU4+977BEnwohvlThu1q3KXAp56wF3W2PUxS2UDVy4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9670.jpnprd01.prod.outlook.com (2603:1096:400:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:59:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:59:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZxJobTrEvnta3tEGNX72C24BfYK/V04kAgAC4fpA=
Date:   Wed, 2 Aug 2023 07:59:21 +0000
Message-ID: <OS0PR01MB5922AA1F68BC091BB997D941860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
 <ZMlc5jHfSf/bOCe3@smile.fi.intel.com>
In-Reply-To: <ZMlc5jHfSf/bOCe3@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9670:EE_
x-ms-office365-filtering-correlation-id: 81ed05e3-9ae1-4b29-c3af-08db932e618e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zMGOoKGF9qm/WIzSd2x7kFB8VzWLY5geN+LOVpmGKKNck2UllvXQYqg8BzJffm0eXfMdDODQWROGQ/XIqd3nU5nQuHb4JueYCZPNLPmE6fREEVfhxOPxXKoQF/ddi5hqwFjZZDU7s81yXjIMn695rDCZ+Bi6ofwczISO4+FEwXs8hheyGI/KYAfTfFiuWhUiIRSlvw5qyML6QsvgUSMGUvIYjaHjRGSrnN9KAFf9lpAqXqj9Kuz0UfaMUljaUiqnGpt+ytoYQPs05wRYZlcuAeFDWuHwZrG/LnfEPYs5ks7PPPqt4f/bj8pku/4LYDrpooFywNjpqewzYFpMStWbxakjjVBXcOHeR9tkReDckvrN+gsY+nemaABq9E4fnOX++ckOLsiruMSitf35FN4PAE/IKxk5RWyFc9RroN2oEcvepq7bdnFPfbNw2yt1ONBglFZu8i9/1kF3XPPn+Lai79U5ALaB1xvNrIxxKPt47v3wX5c9rbMgxXF5w8KgOA1zvOroQVuI/C2bNSXTuS5a3v93ezLc+Ej/dP+DKJRC9Svfryju+BogIRNZ6rGtULXkJCFJiUMGpZDCe3kZyWkSw/8Bnl8KD/3IqagVkp+zFPFa+0OITZYXeaBplDKGOZR1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(55016003)(9686003)(316002)(86362001)(478600001)(122000001)(54906003)(38100700002)(76116006)(71200400001)(66946007)(66476007)(66556008)(33656002)(66446008)(7696005)(64756008)(4326008)(6916009)(6506007)(41300700001)(26005)(186003)(83380400001)(8676002)(8936002)(38070700005)(5660300002)(52536014)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DT8EF6CZ1E/q9O5BZzOfm3eIVHbg+IOt8LSi1MC8KD3MDH07ts1JbSFw/OO9?=
 =?us-ascii?Q?lZwhDd8DlMyu+hvu4j+dWgQXyro2dRRgYV0+oY+Iw9qJO4SeFB6ENSO2mawl?=
 =?us-ascii?Q?C6zJEv87kbpj8ke/1wPL8eKzP6biwVWg9hZizwf+DjLOT7Xx+7T63s6QefyB?=
 =?us-ascii?Q?6VUyQ5hu0FLB40Si63Gx4qW5IDL8Tr6t1m+9jRGG9NItqa3+M0YhSYvDvJO2?=
 =?us-ascii?Q?i+YjlUGKx2/Li38QtmnNqinnlLejr4SXwLQh+IuB9gt/9eQH3rEMc0djzhNO?=
 =?us-ascii?Q?ZdihoyEkr/gLIaGaI6loSG3TThc5t/FnrJz3cdOVKQR+wSeo5sdtPVezzpJr?=
 =?us-ascii?Q?aIKYX/JAQ8L86LKoIf7a+wIlqamDzAa9ZwFePxyqMMNqRznelBrHUO2wsJJU?=
 =?us-ascii?Q?EnBn+Cl5RrJu/uE42H6+b7U6qvpPZvIhKbhDTeOtEl1OyBEZe+5qmFNDQjkU?=
 =?us-ascii?Q?7NjhNtcOvuu8auD1G31jnJ9/QeLMxJ+7BdvH5lbLML2NyAaTyXcPLeW/fWmJ?=
 =?us-ascii?Q?yfyEuydqpHMI8nrZFX7KsXzGrmlZwa7QYrABlz9JzZv5VLrIR3eWlyxF16cJ?=
 =?us-ascii?Q?6LwbzFDkLa5RsgkmBMqyI1DhTACVTrQbL8wZJ2JJXxO6KNanNOs3OcE1LHFQ?=
 =?us-ascii?Q?ds3kjOHl8fzoCWBFpEn5UKhCp2/jbkI0Km3LtKMOspumtj6NNC6fF4cG4ujM?=
 =?us-ascii?Q?g1pAAJaUBXuOPCgWvKUYjxbcpRVU16p58md9TajbRYp8ZBSGzNbXLeFFKOeL?=
 =?us-ascii?Q?1a635TU+kVLKbZP0MD9phKBJLMrQIZMSzCN5jgH+7uRm7JhVJzwhnCABEfIQ?=
 =?us-ascii?Q?/ozjLdUddey9UgiVmFV+pCYdBbK9BdsvgDk0qV3wc5xw/pEjpLvZzUcgRI4B?=
 =?us-ascii?Q?jsveAuiIrx/Dca6bNokyEkisSf9VIPLJVFTY8gAhaDVQ7qJ85rHnJmyh5/dr?=
 =?us-ascii?Q?YPEKRKEZkLFlrtwOT6Amk1Kip2RNaqwdluZ9QGu5wjzpDdlRZ0H0tMk7UJnZ?=
 =?us-ascii?Q?GAYxCDIrJbM0LnmY/qs4caYUnSSM0zkjNSizEIMr6oYn3HxTeMCWmpA0oDf3?=
 =?us-ascii?Q?WJD1Q8BGOWmyF1o7BfgPO6H/VBUHdY3OO5va6FUdrhBjdTvSG1jilovagRWN?=
 =?us-ascii?Q?4ifnpg/SvM5GbBbCfjgu9ooebW3YBwqCInfRHRsMwqETMv1K01na6maNEbiw?=
 =?us-ascii?Q?TGiQK2yJy+sQboZzLPXYswb8qhZVOeEj6ErWcUJaHR7EJpg+VaHHzuOXi5H3?=
 =?us-ascii?Q?tEDMgBj1PSQ+djQc073Aql84B2BBsbAp6LUFwrQjZylViyslboDIn2y3AxNN?=
 =?us-ascii?Q?/uIXCfsI6D2r04XmhRaF9YRPpuDJiuUjdLvl54wvSU3lV6oF+MyR+z/ZMmh1?=
 =?us-ascii?Q?8zq1Q85Pm6m21RGqouIkjJon3398tUasv2RwFVkOBM0sWHykefaOzpVIBoeA?=
 =?us-ascii?Q?W6OupagYrgtbRm9QN3hkkXXFsXyxwW5z4SeRG5MqGQRFXECGXuIHZA0wTtQ9?=
 =?us-ascii?Q?ZPY3K/yDwwaGWBKm6p8taMGrFiWl1hr8/rcs6q+C+SJ/SIwnyw4H4DyC4ahK?=
 =?us-ascii?Q?LeO2HcGUJje7vshKC2g/8pUIApdANLeiqVCVOWji?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ed05e3-9ae1-4b29-c3af-08db932e618e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 07:59:21.7569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OxtOQ11iiVZZoJuG8ZUp4YqnoOXiJyuOTaK9kFsuMRaEYGXGS5YeMuyyIyWUATSN+10J2hQohqshaQB9TjaGsAOSE8/5sM6KT6IOmkV4Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9670
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

> Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data()
> callback
>=20
> On Tue, Aug 01, 2023 at 06:03:18PM +0100, Biju Das wrote:
> > Add i2c_device_get_match_data() callback to struct bus_type().
> >
> > While at it, introduced i2c_get_match_data_helper() to avoid code
> > duplication with i2c_get_match_data().
>=20
> Have you used --patience when prepared the patch for sending?

Normally, I use "git format-patch -n --subject-prefix=3D"PATCH vY" --cover-=
letter" for preparing patch.

I see there is a difference with "git format-patch -n --patience *".

I will send this patch series with --patience option.

>=20
> ...
>=20
> > -const void *i2c_get_match_data(const struct i2c_client *client)
> > +static const void *i2c_get_match_data_helper(const struct i2c_driver
> *driver,
> > +					     const struct i2c_client *client)
> >  {
>=20
> > -	struct i2c_driver *driver =3D to_i2c_driver(client->dev.driver);
>=20
> Does it make sense to remove and add an additional parameter? In one
> case it's a copy, in another it probably the same, just hidden in the
> code.

Ok, you mean add the below check in i2c_device_get_match_data() and
drop *driver parameter from i2c_get_match_data_helper().

if (!client || !dev->driver)                                            =20
 return NULL;

>=20
> >  	const struct i2c_device_id *match;
> > +
> > +	match =3D i2c_match_id(driver->id_table, client);
> > +	if (!match)
> > +		return NULL;
> > +
> > +	return (const void *)match->driver_data; }
> > +
> > +static const void *i2c_device_get_match_data(const struct device
> > +*dev) {
> > +	/* TODO: use i2c_verify_client() when it accepts const pointer */
> > +	const struct i2c_client *client =3D (dev->type =3D=3D
> &i2c_client_type) ?
> > +					  to_i2c_client(dev) : NULL;
> >  	const void *data;
>=20
> > +	if (!dev->driver)
> > +		return NULL;
>=20
> When can this be true?
>=20
> > +	data =3D i2c_get_match_data_helper(to_i2c_driver(dev->driver),
> client);
> > +	if (data)
> > +		return data;
> >
> > -		data =3D (const void *)match->driver_data;
> > +	if (dev->driver->of_match_table) {
> > +		const struct of_device_id *match;
> > +
> > +		match =3D i2c_of_match_device_sysfs(dev->driver-
> >of_match_table,
> > +						  (struct i2c_client *)client);
> > +		if (match)
> > +			data =3D match->data;
> >  	}
> >
> >  	return data;
> >  }
>=20
> ...
>=20
> > -static const struct of_device_id*
> > +const struct of_device_id*
>=20
> While here, add a missing space after of_device_id.

OK.

>=20
> ...
>=20
> > +const struct of_device_id*
>=20
> Ditto.
>=20
> Or use below (weird) style in case it occurs more often than usual one.

It is one of case. So, I will use space after of_device_id.

>=20
> > +i2c_of_match_device_sysfs(const struct of_device_id *matches,
> > +			  struct i2c_client *client);
> > +
> >  const struct of_device_id
> >  *i2c_of_match_device(const struct of_device_id *matches,
> >  		     struct i2c_client *client);
>=20
> ...
>=20
> > +static inline const struct of_device_id *i2c_of_match_device(const
> > +struct of_device_id *matches,
>=20
> As per above.

OK, This will be moved to i2c-core.h.


Cheers,
Biju

>=20
> > +		     struct i2c_client *client)
> > +{
> > +	return NULL;
> > +}
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

