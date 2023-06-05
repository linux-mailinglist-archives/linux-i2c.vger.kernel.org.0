Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F141872235C
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 12:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjFEKYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 06:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjFEKYb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 06:24:31 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2104.outbound.protection.outlook.com [40.107.114.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFE1A1;
        Mon,  5 Jun 2023 03:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SygqvLRFmz8Hm9CksL4FTVOzLM/mNK/6K73wLcgOyTI0qABG+GGH/C/8OL6nOzN6rtTxe1UZWPkM6/V6yVptM3mYOie9qIJLhE8DdfkXihMCkfiTpWWgMlYTfwGWUmn+hNTtBoiUet/zIwyawLxfik1NpkMLWyRNkAYLBcts/tEFoOrkzDV2BGh4YKZVEQV7sPcCWmoUI3zCDoajsLJw8Z/cTrfQBluJCwqBQzZDhMc4J1+aelZPgE61Np3F6EmHEmWVDTZlOE28w91GnfDdbHfkwPAwubW0LkB0xSX6zg2Pkc1DV3YjS1fEiyQSzq0L/bFP8n740NFlpVGdsez8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7y+JuiOJ7AM28ezoK+6hnjryCXu8QVwuSlDpjpqLNPA=;
 b=dgNEbfRPFr50X3ZwWw0bsWX8w47riC9RyuLvFLEd1llFmIaVRSxckqQagHpyvH8VLAGrbJ3v8eI8wXFLLd7jX79jKgtuOrvICFZfgEZAm+8OtA4VCWR8NPi5kAF5gimpeh8yMpzPGx5Q7WHF8E7FCQal4jSP0Ea6vzIPL6JzA9cPqBaYHjLqLdCY+MvTyH2bUIkyyRqwIIA/pm38+w38bk6buaKcue8H9uXRdz2Zy/qnDWzsso/I3sBudch0sDZleTnwn1pcFGZtCE5vOoV9q0varAhj222xPjAwCIP6L1IWoqoJMCbouzqKTrR8lHHxO+juWF0PMQuV6WR+9XCDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y+JuiOJ7AM28ezoK+6hnjryCXu8QVwuSlDpjpqLNPA=;
 b=G3iDsI1bbE7JqG286c8vPfr+DeeS2PDiZtfXgCvjySmwmfc+/Z+tIR8OShaxhNH3MBQJkSYx5pJXOt4rwLkZ/2n30vXabHWJw1DHBCd74GrJvYPwjofw3G79FZWRvSyKQ0thP5qdcnfGsuHe3ekj4k5xQZI4FO5qP25d+X+Qjs8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8316.jpnprd01.prod.outlook.com (2603:1096:400:163::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 10:24:26 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 10:24:26 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH v2] i2c: Add i2c_get_match_data()
Thread-Index: AQHZlKzrKxpdhC80OUSwaqoUiGHLGK979dwAgAAEDsCAAAYRAIAABRHQ
Date:   Mon, 5 Jun 2023 10:24:26 +0000
Message-ID: <OS0PR01MB59228279E7F1163901B64180864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230601171711.221430-1-biju.das.jz@bp.renesas.com>
 <ZH2p7iWYizLsxZ1g@shikoro>
 <OS0PR01MB5922300F70EF37359C53D646864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZH2ybOmr8fyWOtmg@shikoro>
In-Reply-To: <ZH2ybOmr8fyWOtmg@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8316:EE_
x-ms-office365-filtering-correlation-id: 5bcd4d00-6ba3-4b9d-7761-08db65af0a1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLZvDbexVvpWD9XB2MDzfvSq+VlyHRCN3YbwDk9cEQtm6ZOKiHfGs11zeidZtm681/UlL9a+7U7dyb4I3B1m3ykHNzewGF9UgFDolfs1JR1sQtNUDO5cR2vXUJcf6i9hfsxDX7WKSc6xceAvYFl6ybWMQFbG6QcEBXFP4CXxPBgY3sej/DJ4/RpSTCAHwHQ1t9TMiOBy+3seTYQSkebEh2epgfUPWzmTvzHZ3+2mSsytUwrrw/664byqb3BNW/zK87/gxbwWzV04Gptaaxys4ioEkpscuK/ndVa90NTWsgNXCV6jE+tNMZn+fFpDddH0YkEYxFkMti7pXnkAoBAjKJk+RI+AeCv4vgmjMpLh5p/HCV7fX9qRYSv/IL6M/n51aQApCSD0vxva+EqjC4DcvybXAzzrDd+ASVOAFUgNL+4s4/Sxm1pkDTarRjQsoleC5IeH6GruZb7TYOhQJYBEKz/8/IQ6RVnDxef4XA5rRyd7fLzZLVird+AuTapqFGpnAPqEnXaI3sxSPBZWRg/9vz2Fi2og/XK70D9x1IJROtq4tBAZym3LnK+cly3M0Y0Zc8ttapP3brQ7Wp0VgyJWXZrM9y1D1nS3BQ6jMCEKSGi1v3kwInLPPFzvOxz53zqc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199021)(54906003)(33656002)(55016003)(478600001)(8676002)(8936002)(41300700001)(38070700005)(316002)(66476007)(66446008)(66946007)(76116006)(64756008)(66556008)(52536014)(122000001)(5660300002)(38100700002)(6916009)(86362001)(4326008)(7696005)(71200400001)(2906002)(4744005)(186003)(9686003)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cr93mw+AoV3Hp28UZ/oOudAM+8GJTfniQ9yd4CddRuspxDk7xZ9NFGuecamA?=
 =?us-ascii?Q?z8bKsnkvEqd2KYqV/JIRJeBLnDtmznyovdDErBlQ1rz//j5UFrc7Sm3nR6GK?=
 =?us-ascii?Q?I2dmF+R3jJPKPadinP3xKayElOukC88otALx5erTMHpV+Mv9tan/JivgvMKZ?=
 =?us-ascii?Q?RE7Xq8bhYlRpeuiTt7HjlNRGXDSTXngaKl2z//uH86N3v9t3NhqUGGxIr9YF?=
 =?us-ascii?Q?MfhelTes5b9XllQamWgbVO6F6Zztd/SEJ6ulmu7pCOAO9RaQPWGFeOnnS19r?=
 =?us-ascii?Q?zYE/+Qdsx3pDXfwvas65kpDtI6+QrfV9zJqOjNOCt33chpLPpBGHQ81OrsTu?=
 =?us-ascii?Q?vdPPP3VM1j+ZW3tsGeFPSNweLcrmHFAdn/ZuYRWbBVekX9LiZ9DJ04f8Yhf0?=
 =?us-ascii?Q?z4qQEg7HoL8me6xctM5d7EVmgzo6xXNUTt6/6InfExQx3UnIS0SccEqP/WDM?=
 =?us-ascii?Q?VmihS0DWhC6/ZcbYMaMLLA9EIF1wC0Em+GX8VCqO+ab8UfXQAvZKgkP+40wM?=
 =?us-ascii?Q?K3hwqjBw3K2BtnTW/39V2MEolPhg8JwqrhLUDvuTmqvWZij0o0K2EjJHVDX5?=
 =?us-ascii?Q?4l14kEzlCL3t1Af9a0YnDE3e1g1Wk+r61+XxKbeigc3Gntr2gGns8O5XTulj?=
 =?us-ascii?Q?qqQoWv8qy8RvWfidoKps9DO6Q707NE+yhm5KxufYY6n8u//PxTNpZAxAU83Z?=
 =?us-ascii?Q?JhjvEySDZy46LHMfM1wSlGtxDXZwPJH96/V8dio42m6gPqTXCVnqF8qFNLGU?=
 =?us-ascii?Q?zSxgDdqMPT4+/+XaZb9b33HAkymsXq2xun27/AfXAmUjpt3JGWI1cvbbQXZ0?=
 =?us-ascii?Q?ZZT0leFqI41npxYujNnd++31RLCQ/IqyoR2Cxry5Nx4jiQrshd5wrN2GgVEQ?=
 =?us-ascii?Q?sUeN4qXnHsEaUDsSZaYRtohiStAnvQNe2bWuEHca/ex9X4RlTY75NhFpFicF?=
 =?us-ascii?Q?D7g5Oi+J4EP3B2DRCWPIJuCxQgX8RcPJFUZJsBIXGkVO1d8Gw/DUDfmvciFS?=
 =?us-ascii?Q?/DRclZYCXUEULrT6DO3RJ4VEhfsRDyz1HLetHbs7HyS3ELXlXxBo3RevXjfi?=
 =?us-ascii?Q?U4Z1z5lLNBvi0HnqgL2F9Z5eW0LimCpJE2fY3EGiDHYKyvosBwfhxATvDcGI?=
 =?us-ascii?Q?8FTQC9ps9lOivjZ1H6zpikmoYXBD+SXCfOOlcq57B5ono4z1FBsqLK0jFEfJ?=
 =?us-ascii?Q?LhLBWGYRIy3HYjGlURAssnkSoCRR9CGO4iyxVP84i40z1G0uecZJ66Np4qgI?=
 =?us-ascii?Q?8lHcF2Tb0DBw39nb++xOArolazr3XsBVeqbCFUiqwwomlK7YmTIQmhFqJBq9?=
 =?us-ascii?Q?n+lbziaQA7q1er2LuofonzSp10eJmuQMpTEb0nX2AzybLM2G+2E/1iU5OFdu?=
 =?us-ascii?Q?PG+LUwbYb1YuWohVc2EKb39TywFCQwwdqZcK4SSXP0ywCgz6GZ7GZxrCgOPO?=
 =?us-ascii?Q?+mcvlHBjniT7hDhLaFBg/5Bx5Nl7SddWaCKGxVR2MpKKRI4fzM27RD5Yv+Vu?=
 =?us-ascii?Q?oK8lSrtF/kXJrOa1MQoeRJZwX5/+/K2QsEktrhxSoA96gzL27rfiFhsY8qJm?=
 =?us-ascii?Q?4xK4npuFizfGq6yv5qJ8dgezMNY2rnB1N7TB1DJy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcd4d00-6ba3-4b9d-7761-08db65af0a1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 10:24:26.6037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtCUxSE9ISyx7C5wwVnJxuQ6RtId9NCll3oc1taHJgyC1jrQTZWJSbOmWuZyLy9Ihwm5z2PllvBp305/uL+wmxsPtNhLuGoKGBD/siJEk+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8316
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH v2] i2c: Add i2c_get_match_data()
>=20
>=20
> > You mean like below?? The new helper function will do both I2C and DT-
> based matching??
> > const void *i2c_get_match_data(const struct i2c_client *client) {
> > 	struct device_driver *drv =3D client->dev.driver;
> > 	struct i2c_driver *driver =3D to_i2c_driver(drv);
> > 	const struct i2c_device_id *match;
> > 	const void *match_data;
> >
> > 	if (client->dev.of_node){
> > 		match_data =3D of_device_get_match_data(&client->dev);
> > 	} else {
> > 	      match =3D i2c_match_id(driver->id_table, client);
> > 	      if (!match)
> > 		   return NULL;
> >
> > 		match_data =3D (const void *)match->driver_data;
> > 	}
> >
> > 	return match_data;
> > }
> > EXPORT_SYMBOL(i2c_get_match_data);
>=20
> Yes. Not good? I thought a function named 'i2c_get_match_data' should
> get match_data and find out itself where it is coming from. No?

Yes, It looks good to me based on your explanation.

Cheers,
Biju

