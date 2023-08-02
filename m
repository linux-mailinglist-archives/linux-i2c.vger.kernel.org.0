Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E333676C989
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 11:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjHBJe0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 05:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjHBJeY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 05:34:24 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A101EE52;
        Wed,  2 Aug 2023 02:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfhaMPoLe2F0Hrtj1M2llsPTI/+AlUJs4w4r/eVnIDl2NnIW5DI7IR72OE2VwjnSf64akoZLxJ1P19fourcCBf1mHM8kbky6sGEU1U2CHL90+cNBSToaklQ+nA+pFUkLeTDsxg5b7GMQnJ/AfTDHUVt8hGd0au98bHDLaSfc5+ZetTCd7EEwddWdFxQ+arOa4+AZSVQxZ2/p3eKRo85r62/lEC5ASyX550cpeu882USOMcjzH2gkk9jOro5CSG7qBbbXCAltooBDrgMUyCTF4MVFKn3N5I3fR4B8AuPsRa4D47mL1TF80ym0r9+iHxxnflAL58e2mLAZX39AxL1QKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSgsDwA7opyZZD5r29bL+ECVQibUOSPwoLB8A7ujXs8=;
 b=nbcfzcjOm6HPxLSbU7Sq2BfB5iNwQccTS2pisJjF8rCC7N5sYJbVLULQOTiPK2W52pI8hDP37Pw2hlIwlgV081ibwU8+65fdFai8+hrB7iWO3S/xY80Gx36jf1i2lSchrI5OXZ5sNYuKywKzDxhAI9NQ4nyL0+VL8QcwlodvogNurXhnjQED63wk7eXbP8pZN0BxMeH4s8FYA8G/yTe2N4P0svwGfMaCFgBauYgeecGc0y/XNS67RFDObKrgQIf7Nh8zitHDaCkwrPO6OqSdUVCS5XTdwruic9wU3hgpNBr/SrnLliTRORcODJfacoQUC+OoBphQJIlEaD7+BNtUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSgsDwA7opyZZD5r29bL+ECVQibUOSPwoLB8A7ujXs8=;
 b=rs0VLJTJQRj+4MD3fodaR1ZE1BTaRm64OjVVxukZpiOvUDR637fMKgQ0YJvRSVcDTEJO39odg4TymjijjUu49lDMna6I6sLbpHL0XUTwwteAzGbpKeR89vzdyYHrphsf4oHD2l9S+YeRL/IjIx9OC92M3kFovb2qVLu2KfTJNng=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11460.jpnprd01.prod.outlook.com (2603:1096:400:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 09:34:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 09:34:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZxJobTrEvnta3tEGNX72C24BfYK/V04kAgAAUQ4CAANdjIA==
Date:   Wed, 2 Aug 2023 09:34:18 +0000
Message-ID: <OS0PR01MB592298554E93EB64465DD302860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
 <ZMlc5jHfSf/bOCe3@smile.fi.intel.com> <ZMlt5SpEgawlWHoB@google.com>
In-Reply-To: <ZMlt5SpEgawlWHoB@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11460:EE_
x-ms-office365-filtering-correlation-id: 355059b7-509c-4483-e5a8-08db933ba4e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M5A4YLQ8EmLSBr10aisaTkqmznYgoi+hlWE+X/mVgtedDZl6PYKCahCf8A3oOSJQP91kMkUjNhXzCouzE44WPTJOb5fE9Rm7CqE8aSqfmwe/OBCeCTsnZ1ajE3JkHQVTKZv64rPRsyS6QXZfoq4tDP+TbaIEA3FqqfW5Gs8GOBAA5IQ6Xszp77Egt8Hix1FCBRXzFJ0rpYQDdYeVGuvC7hAcUWe650+2rbAEBxNOzxBksVR8T+46C6tT+069+uEkZEBcj4iZvRc2orcbcgnEtiTb/ScBbp8ofmOPTXFKpfA2zWa4jF89fgPhiLtQiw1XorPoBvLajCXCVS2nfmUYCWRXxB5Nym2D66XmeOJA1UUafqZvSQoKULuOM+is2UjQdAzTGeDiUktAUxpm+ssz6wHTZT+J1BzgyU61sahQStWQhsFtRxDysfWsQADOtfvn/oY3NfajAsu8af8/ZzvN795x/GCLx3hFfTzRGtl/9Wtr+ZQs8YT3Bt/qW6RLDBJMSvyCI1tr+vAxEk3xWFDwx7iqD4kXUPkWWp45KhfAl/rAdZjR+RQVc5Ty+lnCIFRRXNN+Mo6M8RUZT4QfeczNNJVomvOkmyyz5k2rPDjafG8jX2SXGIQZAm9kEYYd06/O2FnhRzVm1moi5D9CdmVOqKIy4D9BIMxKMrhJ5730Z74=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(2906002)(5660300002)(38070700005)(52536014)(55016003)(86362001)(478600001)(122000001)(110136005)(54906003)(316002)(38100700002)(6506007)(33656002)(66446008)(7696005)(76116006)(66946007)(71200400001)(66476007)(66556008)(64756008)(4326008)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YJi+J0iiwQgf9J4HbCUqlAYJi1qe6cAaSmwXb+BIY6BlC8wuPdZ6MjxGfavs?=
 =?us-ascii?Q?B42DtbHpwTnU45hILmNpGOJH0pD66mmo75DLWa5MNLKNppuYQgSaREARIkpj?=
 =?us-ascii?Q?oNicI+jpczITtdJsH4iTHudNoONRfwXIXPKbiD2GbecZNF8AmFnEHBLns7cx?=
 =?us-ascii?Q?hqdIg1lB1ox1SifYD9/0vZqdrpWnh/nAULNcJoW22FvIud2bnci8+odL6RDR?=
 =?us-ascii?Q?FvDtzSn3kY2l1hAyWflJG7joDy9sW7Ar4tR5WBHaCZeQ/6YfqoosHkPGjXlC?=
 =?us-ascii?Q?FLEMOLjKJzGnoYStFzpbVEyE2BpMinNduV0BpcQhrt4DrNOvxnKK/3/65fHZ?=
 =?us-ascii?Q?J12RHKqXm6sok8Dr1vI8unpgMupYqMHuEWdRSG7OHXiTf8po/+FuNRq/s5MY?=
 =?us-ascii?Q?r7eovCrso4nQK0Y0jJ8JaEFVWka99zxxOfJZZ0bSZGCciJnXmyfX+QntV/w6?=
 =?us-ascii?Q?YyghQQyEXJ0IenT18tN2KdpPsvCVs74QpMwwgZoD4NMyng9K0dQh446uIb2U?=
 =?us-ascii?Q?dckXPpxAz/OORvmAhWBpoFvQhX1EkDSMSD8D3xuqCJveID816rcir22wx+Q3?=
 =?us-ascii?Q?4U/qiJ4Pb6hbyO7eqgBQfbF+cuMSBjv1WYi3v8tlzjVAOQcLPH/FadfVY2f4?=
 =?us-ascii?Q?gezNvGRsX0eih27hmjJF9J0YQx5YBvC1qoRBeFRT5FHpOFjlehR9k6oMfJ62?=
 =?us-ascii?Q?Pj/n/bTyB3kXm6Lc5q1cFjHYsGiTjYGV6wCu1dq8El9bPq5l6qZYiWCo+jqr?=
 =?us-ascii?Q?MMIfGLWuYQ39OG0GRTz2n9/t07WTTGdCsjv6y+VAohUdpD68UvT24y54Rgkj?=
 =?us-ascii?Q?K27BtGwrbSnMQzn23ni6B7ZENQ/yD7eYRUQG2tXoVsufMvllQeuFrtGTA8/h?=
 =?us-ascii?Q?Z1sLvqCZUUutm8eOD0CQKYr1fadGMl3Rg4eIZT11jINQlf5pBFZHzQfIkL76?=
 =?us-ascii?Q?+1yhkoKatPAhmlDiNiPKtIaddxVBmWg+Fz8LGhNJ/fbw3yEu8OCKZh8gzFta?=
 =?us-ascii?Q?RxNpyYUoRaH8cIyuEZGxJh6b0PR7zUVHhQornt64maWmMZXq7K+VLzAzkmb3?=
 =?us-ascii?Q?BRhuHvvRkUc1oomtpVRdXCHIq0GGGAlXKgy4eJMEq8kpMtLUth1Gt4IKhDFI?=
 =?us-ascii?Q?O6nKfv7Z3qLlOpEkCfTuPU9YCZt7N7uB4rZTx4x1tO4xCOn2bKF4+HEmHjoL?=
 =?us-ascii?Q?RlYItVGnVM3WMdI65+w44jACGdTaa5EcKW9jj/B1d2qcp14uQNbGMnhe8Swr?=
 =?us-ascii?Q?EUEZRAwfVuiPmLw6WFjDgsLDtT/M9Jyggdg2UjCZq+Fc8itbtYBBUp1wgUmb?=
 =?us-ascii?Q?8zV0UpUEFqWdYccNihOp5v0r7vLLB9bM6BSSfF2jr0dzeXgw6sSALjs3rNMV?=
 =?us-ascii?Q?5NgSEUaDaQTaRV1GVKYuEk/Ym9uv5jsrpfAIAvDMYQn4vTBZL6rDaIuVpiEp?=
 =?us-ascii?Q?x2368+K+JVlibNCD49nG8pY+0yhd3fRkZ5CPVNRQZPQ9BTUencINHr2w0XRD?=
 =?us-ascii?Q?8+PL6COBFKOTcA+4PRJl8AftduXYIM6ULKW9NoqVdf9b8QlhwCKbe2Un1nOJ?=
 =?us-ascii?Q?CSvl+id3tfXAm9Ndex2/HKvNYNnQd+gqbdqRXTHZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355059b7-509c-4483-e5a8-08db933ba4e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 09:34:18.1544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lbKtxTBaXd9rEdEfzsGENtwFGdixDain8/s+T9Qkf6RsXqyuRRSfU+4Maqbycihi0W2oep1f85/ZcVq1KCIAzPPPgsHqq52CCt46TrtmhsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11460
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dmitry Torokhov,

Thanks for the feedback.

> Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data()
> callback
>=20
> On Tue, Aug 01, 2023 at 10:28:38PM +0300, Andy Shevchenko wrote:
> > On Tue, Aug 01, 2023 at 06:03:18PM +0100, Biju Das wrote:
> > > Add i2c_device_get_match_data() callback to struct bus_type().
> > >
> > > While at it, introduced i2c_get_match_data_helper() to avoid code
> > > duplication with i2c_get_match_data().
> >
> > Have you used --patience when prepared the patch for sending?
> >
> > ...
> >
> > > -const void *i2c_get_match_data(const struct i2c_client *client)
> > > +static const void *i2c_get_match_data_helper(const struct
> i2c_driver *driver,
> > > +					     const struct i2c_client *client)
> > >  {
> >
> > > -	struct i2c_driver *driver =3D to_i2c_driver(client->dev.driver);
> >
> > Does it make sense to remove and add an additional parameter? In one
> > case it's a copy, in another it probably the same, just hidden in the
> code.
> >
> > >  	const struct i2c_device_id *match;
> > > +
> > > +	match =3D i2c_match_id(driver->id_table, client);
> > > +	if (!match)
> > > +		return NULL;
> > > +
> > > +	return (const void *)match->driver_data; }
> > > +
> > > +static const void *i2c_device_get_match_data(const struct device
> > > +*dev) {
> > > +	/* TODO: use i2c_verify_client() when it accepts const pointer */
> > > +	const struct i2c_client *client =3D (dev->type =3D=3D
> &i2c_client_type) ?
> > > +					  to_i2c_client(dev) : NULL;
> > >  	const void *data;
> >
> > > +	if (!dev->driver)
> > > +		return NULL;
> >
> > When can this be true?
>=20
> It is not guaranteed that the function is always called on a device
> bound to a driver (even though we normally expect this to be the case).
>=20
> >
> > > +	data =3D i2c_get_match_data_helper(to_i2c_driver(dev->driver),
> client);
> > > +	if (data)
> > > +		return data;
> > >
> > > -		data =3D (const void *)match->driver_data;
> > > +	if (dev->driver->of_match_table) {
> > > +		const struct of_device_id *match;
> > > +
> > > +		match =3D i2c_of_match_device_sysfs(dev->driver-
> >of_match_table,
> > > +						  (struct i2c_client *)client);
>=20
> Can we make i2c_of_match_device_sysfs() take a const pointer to a
> client? Casting away constness is something that we should avoid.

I agree, we are not supposed to modify client pointer inside
i2c_of_match_device_sysfs(), so const makes sense here.
Wolfram, I guess you are ok with it.

>=20
> > > +		if (match)
> > > +			data =3D match->data;
> > >  	}
> > >
> > >  	return data;
> > >  }
> >
> > ...
> >
> > > -static const struct of_device_id*
> > > +const struct of_device_id*
> >
> > While here, add a missing space after of_device_id.
> >
> > ...
> >
> > > +const struct of_device_id*
> >
> > Ditto.
> >
> > Or use below (weird) style in case it occurs more often than usual
> one.
> >
> > > +i2c_of_match_device_sysfs(const struct of_device_id *matches,
> > > +			  struct i2c_client *client);
> > > +
> > >  const struct of_device_id
> > >  *i2c_of_match_device(const struct of_device_id *matches,
> > >  		     struct i2c_client *client);
> >
> > ...
> >
> > > +static inline const struct of_device_id *i2c_of_match_device(const
> > > +struct of_device_id *matches,
> >
> > As per above.
>=20
> Was it supposed to be i2c_of_match_device_sysfs()? Also, this should be
> in drivers/i2c/i2c-core.h, not in public header.

Agreed.

Cheers,
Biju
