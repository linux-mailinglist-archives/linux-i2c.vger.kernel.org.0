Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012B47E3429
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Nov 2023 04:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbjKGDVj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Nov 2023 22:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjKGDVi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Nov 2023 22:21:38 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2081.outbound.protection.outlook.com [40.107.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0B210C;
        Mon,  6 Nov 2023 19:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FakS0lkrXZKbcBjIFVBjmvBsPuNX3xmUZojSwWx63hMUueHfTKJT87jb6NWzU6aRV3WGm6YwXQlv0Wrmt7F5qiAirNrnpeVdu8XGt5WXUWbb3IPo+kVAFRn1C5VwC0Upi5v1LeNsw5GhuiPXMncvXdFs03r6HmSsZe+VZFnCjPDFV2PPk96xThFJlB3spYFb57eVaokKXgnFjRP8JmrKpHVZWy+aj2mfy2VxNd99F8f6jTC6Xw3T8PELjV492MbZ9J8ZtoDaelK3eRAIFw2UA9qt0VkzEzeFQU9qEupVb4aRK5LiB9CwtYd2XVQ41smSl4xGU2DiGY6CrTKQgA63Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FM8H9uS1lu11MLbzIjgrLXEtEO8Huh52uvedvbJF4Y=;
 b=BzrE39pBItfbQOuEBWDsDhsOc01TbCpn2thBY+x+pEZ++ls7T2skqDQ2s4XekVnTWh6dp3saCwPROBbC8UzfHLf3pgImSbRB+e8pSU1tB5BKXbvwQMl+BT1N2sivDNvfi1IJFAfmZguFzy4iVUJfL2uPvRRPl0omHJlmdsQiyA0yArGSyD7WBj6PVOAPspF3X0l2MMDuq/anzFSZK5vU9ciqUCKFxagh2tyjH7nOaJbh7K09IbfOkUJYXmi+f1C/BDh+8Z/OSdZ+eVtY+Jx2vADeo3n1cHcccxSPpg+5kLimOMz/aYnGa2K5GxhZP/2mP03p+W7inGwLti8LQs0Tfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FM8H9uS1lu11MLbzIjgrLXEtEO8Huh52uvedvbJF4Y=;
 b=E3UO0HdKL134SNu8/PEbgFmiX++GVrDkcqI0S65gpJ9UTlUO/aDRVr8YF54fqZ7bRQFJEt0nb19M87gYz67Wj5nO4n3UPJTZTZ5Ho6jGsIhFYrmL/JON6dqVf0LaLuJPIWs93JKXva0lAwwotAkQPoOZHLHxlrjUmYREJyMSvgYp82xi//776mYBQ9pKS1SP3mc2y+V5oWgF/qJzBJzHls6V0u23Uw/izoDTYLK9GiaMQibH2SFRY3swpjleOKN0yJ6wAFqwXH/Pw4H6aKJ+S/4TS4JzUvXDofSPLxvxyWDuceCK+OJJwt0IbP0eXKZFDt7alZNJlpX3tOmGibNpVg==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by TY0PR04MB5983.apcprd04.prod.outlook.com (2603:1096:400:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 03:21:25 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 03:21:25 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Topic: [PATCH v3 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Index: AQHaC8sOws01u5R+aUe/pR8wrzpsD7BkMziAgAoF/OA=
Date:   Tue, 7 Nov 2023 03:21:25 +0000
Message-ID: <SG2PR04MB5543C831A591C963A3129582A1A9A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231031072124.201181-3-Delphine_CC_Chiu@Wiwynn.com>
 <96d7bf00-a5f8-486f-912d-931e918f3fa3@roeck-us.net>
In-Reply-To: <96d7bf00-a5f8-486f-912d-931e918f3fa3@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|TY0PR04MB5983:EE_
x-ms-office365-filtering-correlation-id: e8719755-9424-49a2-0b55-08dbdf409fe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZXHjt4wN45GOrH4ca2zdUgekQTeyxLIkBBFSDpwXwqKoZKk7xybVUD/2pvJbqkoYpsaFiE5ylpGv+6XKQYmzNgQ6uiSI+V2lYF7pIcXa008SMvlbbuoTpNlwuJYWHVNXUwiffb340aLYbzp306BURFdLJVLB2JnYvVZlRYcvrI79K3it98sni/qW1ZzLfDX0nJSzx63VBUjlwFuXVotSKvIUetMc+wce14d3lYl7YEvbfm/NgtW52GUtAi4ju57iRah/rawm1HbGAyJHRs3xDHvFCsndv+iOSYXU63kYtZh37JWnl36ih83VonmUcAOxNlKDcI72IrPS8kqbiLvxHIB6VVxCR8udCvVh7I/JXqerKENx57nuJ7SKhWCiaXZPdoKmfQXM4su0gl1wYKIDclsAIQPO+KPQLDElBtWFewUPC4xCWQlanB1YXV7b7OiAYaX9hQDNge2vprRnEZVEHdbjLLg51ucE+OxSRDFiPZDBvPIM4JNGBSXnQzyw+j72HxTlAzjGf1DiBIx3eiJmO6VUWJPQ6xGm8E2kHRmtTj5OZk8VYkKiGuBlhd4py0lsjfIskMHZNCwgObfakirkAPyr0zlueD3uybvtAN9z9JW0L28MQLTkY00Zf8R9g6Plu+DjUD5lWRpcfQh5PHcxhD1bs7LUVaZPw8RdAZSTp2M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(1800799009)(451199024)(30864003)(71200400001)(478600001)(53546011)(7696005)(6506007)(9686003)(966005)(45080400002)(5660300002)(83380400001)(26005)(66574015)(76116006)(2906002)(41300700001)(7416002)(66446008)(66556008)(64756008)(66946007)(66476007)(110136005)(316002)(4326008)(8676002)(54906003)(8936002)(38070700009)(52536014)(38100700002)(33656002)(86362001)(122000001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b+1Vte/T+ZoUPs6XunyNhJahpec4LDZc1Uj9LWiQ7v3kDxE+IW+1A0SqPAZi?=
 =?us-ascii?Q?vAHc0agcQlAjT/KpPfmTSvasbBeXV8RWS7EoGl2w0gVki9lTCYFjaHBczh7F?=
 =?us-ascii?Q?zNJT/2GMRTuzidK/tdVtSEnxKsM9+mEQIE7Ls30c14ueQAi9+TRuGFF7+pQi?=
 =?us-ascii?Q?UhP/wxBa+l3IgwMe+WhUL068ZeGieJgGDMFUF3FH96CfFjNsx7dZzABK/kKe?=
 =?us-ascii?Q?idK5Y0n+kZ+KDIy1/atlRAxCZFHDdIS4tFqKX7ly1nZf19rZHZ8qmcYOzysQ?=
 =?us-ascii?Q?PPW5dJJUxuhaoCiEeopR0Un3mIXZPV84qJTkby6/wpiJDNnesLx8bamA8msf?=
 =?us-ascii?Q?vcMQ3T1xIFUG4DdCgEyLnaec1BkbNEhg9L5uKq1Yu4xiDsc5equBRQzYXoUG?=
 =?us-ascii?Q?AXyEAXNb6N1VtSPnTbRpWhuQhZxApfRaa+qiZMHPyQiUypPB38Stwc1c8pmg?=
 =?us-ascii?Q?+aL886eF1YK8RGQJvmmu+6APISWX8aFO7UpHcc8IdT8BzfFx5HreATYUdmx6?=
 =?us-ascii?Q?+Wb7jM7H87lLMRw0LMA8WJ6g9mdkE5pVJREM65OpD7bQwASQ/OpeENbX/Vsc?=
 =?us-ascii?Q?dEpvxTmkIHkAA5yYnE0NXldY1UCwc++XcJCAtHQilOGYMVimQx+Jc8psN3dH?=
 =?us-ascii?Q?RkDcDpNXiOfM9vLI9QXcm3tLWaqUqqxflO4tCqErhPosrVtcDC7zW7FbvmS7?=
 =?us-ascii?Q?42F5ALtzE8YZjWPB+0svN88Ad9HjA4YBP2cz83Pw/bLFap/pX6xM/7hEMyLK?=
 =?us-ascii?Q?QYN6Y3n0rJT97HDa59fGjEoafrcCJvbYDSpFVkSckosQ20UbEgJNNMb4u0X7?=
 =?us-ascii?Q?dlBzuTPmwRJMhTgt8fJrMQllPPV/l9qI0eWc7VQ8v4kOkKbz8TJYOJrgQeix?=
 =?us-ascii?Q?PS03+299x8A/2iSuSQQxFkEHWFg/CtpzjJesqbkFZeU+qXayogu4gsUxhiAJ?=
 =?us-ascii?Q?Q0QGp6ZssHXgwJ15W0xvg17J8rZkBKp4B6b72ImwVlDIEdQt23ANt4uAeO89?=
 =?us-ascii?Q?H4vuD9lCqwPY4oWFD9f2vaombd5hdIoCf6hb8aUhsKn+fZXhmjWKh/k4tzy+?=
 =?us-ascii?Q?Zf2hCIDRY5z+r96kABjfNtB5slMCSRWPLQ5oyoefK9UkU33Cs9P39EGUAbqy?=
 =?us-ascii?Q?aQrLEIJcAw1ZpIcrp73mg0FO2hYwFfxvot1zlfGnq3lCaHWFtZbNsxEd/0gl?=
 =?us-ascii?Q?5J9dymIOKWQt4LaBDvSHUhnlK6RWt1sHktYpfDeXLvILJojITQxqWXT5ZirA?=
 =?us-ascii?Q?1ySSvb3wdWlb2G9y/OZCUzYT4OLfe4j98l0SPEGqXrYzBudASwxPBIZEs9UD?=
 =?us-ascii?Q?UglW1Lb5zV6GK5BYm1t05IsTY+aIl8kDHbyO5LkKJXTJvnoVjPj79XTNqYt/?=
 =?us-ascii?Q?6HmBLcaY7UtPmDCbFB0Igc8v6D57aAppVYL2QjOMvoWhaawZRVrPl8w0dYYs?=
 =?us-ascii?Q?wGPrzxBHAMtCjHeDSfG1BaZhvOu8mqPdX0uPlMl/oykLKbEDd4qlBIwyRT5b?=
 =?us-ascii?Q?2CQBVHeDCoVuzMQhlIpIkWsjK+RJsPsROCwks/vARTuGRkXGNMFqZym/sfAs?=
 =?us-ascii?Q?UDx67PJqlQkWQtnXGRifG4CHdBwAlN1cLhEXKKvt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8719755-9424-49a2-0b55-08dbdf409fe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 03:21:25.6329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9p/eq0XHf30Dj1smHldYSLwmbdsQ2eSOefd4tVtvLstOm7yVNVGXY47QPMQqGWHiv7lFX24qqIjqEU8AGKbrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5983
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Wednesday, November 1, 2023 2:10 AM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Jonathan Corbet
> <corbet@lwn.net>
> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> linux-i2c@vger.kernel.org; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-doc@vger.kernel.org
> Subject: Re: [PATCH v3 2/2] hwmon: pmbus: Add ltc4286 driver
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> On 10/31/23 00:21, Delphine CC Chiu wrote:
> > Add a driver to support ltc4286 chip
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >
> > Changelog:
> >    v3 - Use dev_err_probe() instead of dev_err()
> >       - The VRANGE_SELECT bit only be written if it actually changed
> >       - Avoid the info pointer being overwritten
> >       - Check the MBR value range to avoid overflow
> >       - Revise ltc4286.rst to corrcet description
> >    v2 - Revise Linear Technologies LTC4286 to
> >         Analog Devices LTC4286 in Kconfig
> >       - Add more description for this driver in Kconfig
> >       - Add some comments for MBR setting in ltc4286.c
> >       - Add ltc4286.rst
> > ---
> >   Documentation/hwmon/ltc4286.rst |  95 +++++++++++++++++
>=20
> Needs to be added to Documentation/hwmon/index.rst

We will add to Documentation/hwmon/index.rst

>=20
> >   drivers/hwmon/pmbus/Kconfig     |   9 ++
> >   drivers/hwmon/pmbus/Makefile    |   1 +
> >   drivers/hwmon/pmbus/ltc4286.c   | 178
> ++++++++++++++++++++++++++++++++
> >   4 files changed, 283 insertions(+)
> >   create mode 100644 Documentation/hwmon/ltc4286.rst
> >   create mode 100644 drivers/hwmon/pmbus/ltc4286.c
> >
> > diff --git a/Documentation/hwmon/ltc4286.rst
> > b/Documentation/hwmon/ltc4286.rst new file mode 100644 index
> > 000000000000..2cd149676d86
> > --- /dev/null
> > +++ b/Documentation/hwmon/ltc4286.rst
> > @@ -0,0 +1,95 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +Kernel driver ltc4286
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chips:
> > +
> > +  * Analog Devices LTC4286
> > +
> > +    Prefix: 'ltc4286'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet:
> > + https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
w
> > +
> w.analog.com%2Fmedia%2Fen%2Ftechnical-documentation%2Fdata-sheets%2
> F
> > +
> ltc4286.pdf&data=3D05%7C01%7CWayne_SC_Liu%40wiwynn.com%7C19174887b
> 0924
> > +
> 20a374208dbda3c8d3b%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%
> 7C638
> > +
> 343725997659187%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoi
> > +
> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D0Vi
> JT74
> > + gySA7E0eBm%2FOBDkVAxp72j1spi8UG8un6zW4%3D&reserved=3D0
> > +
> > +  * Analog Devices LTC4287
> > +
> > +    Prefix: 'ltc4287'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet:
> > + https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
w
> > +
> w.analog.com%2Fmedia%2Fen%2Ftechnical-documentation%2Fdata-sheets%2
> F
> > +
> ltc4287.pdf&data=3D05%7C01%7CWayne_SC_Liu%40wiwynn.com%7C19174887b
> 0924
> > +
> 20a374208dbda3c8d3b%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%
> 7C638
> > +
> 343725997659187%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoi
> > +
> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DZW
> BSxI9
> > + ZgOgKMTU0UhQal9OiYjAUTPLXijAZqzN%2Fuh0%3D&reserved=3D0
> > +
> > +Author: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > +
> > +
> > +Description
> > +-----------
> > +
> > +This driver supports hardware monitoring for Analog Devices LTC4286
> > +and LTC4287 Hot-Swap Controller and Digital Power Monitors.
> > +
> > +LTC4286 and LTC4287 are hot-swap controllers that allow a circuit
> > +board to be removed from or inserted into a live backplane. They also
> > +feature current and voltage readback via an integrated 12 bit
> > +analog-to-digital converter (ADC), accessed using a PMBus interface.
> > +
> > +The driver is a client driver to the core PMBus driver. Please see
> > +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> > +
> > +
> > +Usage Notes
> > +-----------
> > +
> > +This driver does not auto-detect devices. You will have to
> > +instantiate the devices explicitly. Please see
> > +Documentation/i2c/instantiating-devices.rst for details.
> > +
> > +The shunt value in micro-ohms can be set via device tree at
> > +compile-time. Please refer to the
> > +Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml for bindings
> if the device tree is used.
> > +
> > +
> > +Platform data support
> > +---------------------
> > +
> > +The driver supports standard PMBus driver platform data. Please see
> > +Documentation/hwmon/pmbus.rst for details.
> > +
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +The following attributes are supported. Limits are read-write,
> > +history reset attributes are write-only, all other attributes are read=
-only.
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +in1_label            "vin"
> > +in1_input            Measured voltage.
> > +in1_alarm            Input voltage alarm.
> > +in1_min              Minimum input voltage.
> > +in1_max              Maximum input voltage.
> > +
> > +in2_label            "vout1"
> > +in2_input            Measured voltage.
> > +in2_alarm            Output voltage alarm.
> > +in2_min              Minimum output voltage.
> > +in2_max              Maximum output voltage.
> > +
> > +curr1_label          "iout1"
> > +curr1_input          Measured current.
> > +curr1_alarm          Output current alarm.
> > +curr1_max            Maximum current.
> > +
> > +power1_label         "pin"
> > +power1_input         Input power.
> > +power1_alarm         Input power alarm.
> > +power1_max           Maximum poewr.
> > +
> > +temp1_input          Chip temperature.
> > +temp1_min            Minimum chip temperature.
> > +temp1_max            Maximum chip temperature.
> > +temp1_crit           Critical chip temperature.
> > +temp1_alarm          Chip temperature alarm.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index b4e93bd5835e..f2b53e8abc3c 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -226,6 +226,15 @@ config SENSORS_LTC3815
> >
> >         This driver can also be built as a module. If so, the module wi=
ll
> >         be called ltc3815.
>=20
> Add empty line

We will add empty line here

>=20
> > +config SENSORS_LTC4286
> > +     bool "Analog Devices LTC4286"
> > +     help
> > +       LTC4286 is an integrated solution for hot swap applications tha=
t
> > +       allows a board to be safely inserted and removed from a live
> > +       backplane.
> > +       This chip could be used to monitor voltage, current, ...etc.
> > +       If you say yes here you get hardware monitoring support for Ana=
log
> > +       Devices LTC4286.
> >
> >   config SENSORS_MAX15301
> >       tristate "Maxim MAX15301"
> > diff --git a/drivers/hwmon/pmbus/Makefile
> > b/drivers/hwmon/pmbus/Makefile index 84ee960a6c2d..94e28f6d6a61
> 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -24,6 +24,7 @@ obj-$(CONFIG_SENSORS_LM25066)       +=3D
> lm25066.o
> >   obj-$(CONFIG_SENSORS_LT7182S)       +=3D lt7182s.o
> >   obj-$(CONFIG_SENSORS_LTC2978)       +=3D ltc2978.o
> >   obj-$(CONFIG_SENSORS_LTC3815)       +=3D ltc3815.o
> > +obj-$(CONFIG_SENSORS_LTC4286)        +=3D ltc4286.o
> >   obj-$(CONFIG_SENSORS_MAX15301)      +=3D max15301.o
> >   obj-$(CONFIG_SENSORS_MAX16064)      +=3D max16064.o
> >   obj-$(CONFIG_SENSORS_MAX16601)      +=3D max16601.o
> > diff --git a/drivers/hwmon/pmbus/ltc4286.c
> > b/drivers/hwmon/pmbus/ltc4286.c new file mode 100644 index
> > 000000000000..042d3af99489
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/ltc4286.c
> > @@ -0,0 +1,178 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pmbus.h>
> > +#include "pmbus.h"
> > +
> > +/* LTC4286 register */
> > +#define LTC4286_MFR_CONFIG1  0xF2
> > +
> > +/* LTC4286 configuration */
> > +#define VRANGE_SELECT_BIT    BIT(1)
> > +
> > +#define LTC4286_MFR_ID_SIZE  3
> > +#define VRANGE_25P6          0
> > +
> > +enum chips { ltc4286, ltc4287 };
>=20
> Not really used anywhere and can be dropped.

We use this enum in v3 line 63-64

>=20
> > +
> > +/*
> > + * Initialize the MBR as default settings which is referred to
> > +LTC4286 datasheet
> > + * (March 22, 2022 version) table 3 page 16  */ static struct
> > +pmbus_driver_info ltc4286_info =3D {
> > +     .pages =3D 1,
> > +     .format[PSC_VOLTAGE_IN] =3D direct,
> > +     .format[PSC_VOLTAGE_OUT] =3D direct,
> > +     .format[PSC_CURRENT_OUT] =3D direct,
> > +     .format[PSC_POWER] =3D direct,
> > +     .format[PSC_TEMPERATURE] =3D direct,
> > +     .m[PSC_VOLTAGE_IN] =3D 32,
> > +     .b[PSC_VOLTAGE_IN] =3D 0,
> > +     .R[PSC_VOLTAGE_IN] =3D 1,
> > +     .m[PSC_VOLTAGE_OUT] =3D 32,
> > +     .b[PSC_VOLTAGE_OUT] =3D 0,
> > +     .R[PSC_VOLTAGE_OUT] =3D 1,
> > +     .m[PSC_CURRENT_OUT] =3D 1024,
> > +     .b[PSC_CURRENT_OUT] =3D 0,
> > +     /*
> > +      * The rsense value used in MBR formula in LTC4286 datasheet
> should be ohm unit.
> > +      * However, the rsense value that user input is mirco ohm.
>=20
> micro

We will revise this typo

>=20
> > +      * Thus, the MBR setting which involves rsense should be shifted =
by 6
> digits.
> > +      */
> > +     .R[PSC_CURRENT_OUT] =3D 3 - 6,
> > +     .m[PSC_POWER] =3D 1,
> > +     .b[PSC_POWER] =3D 0,
> > +     /*
> > +      * The rsense value used in MBR formula in LTC4286 datasheet
> should be ohm unit.
> > +      * However, the rsense value that user input is mirco ohm.
>=20
> micro

We will revise this typo

>=20
> > +      * Thus, the MBR setting which involves rsense should be shifted =
by 6
> digits.
> > +      */
> > +     .R[PSC_POWER] =3D 4 - 6,
> > +     .m[PSC_TEMPERATURE] =3D 1,
> > +     .b[PSC_TEMPERATURE] =3D 273,
> > +     .R[PSC_TEMPERATURE] =3D 0,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |
> PMBUS_HAVE_IOUT |
> > +                PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP |
> PMBUS_HAVE_STATUS_VOUT |
> > +                PMBUS_HAVE_STATUS_IOUT |
> PMBUS_HAVE_STATUS_TEMP, };
> > +
> > +static const struct i2c_device_id ltc4286_id[] =3D { { "ltc4286", ltc4=
286 },
> > +                                                { "ltc4287",
> ltc4287 },
> > +                                                {} };
> > +MODULE_DEVICE_TABLE(i2c, ltc4286_id);
> > +
> > +static int ltc4286_probe(struct i2c_client *client) {
> > +     int ret;
> > +     const struct i2c_device_id *mid;
> > +     u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> > +     struct pmbus_driver_info *info;
> > +     u32 rsense;
> > +
> > +     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
> block_buffer);
> > +     if (ret < 0) {
> > +             return dev_err_probe(&client->dev, ret,
> > +                                  "Failed to read manufacturer
> id\n");
> > +     }
> > +
> > +     /*
> > +      * Refer to ltc4286 datasheet page 20
> > +      * the manufacturer id is LTC
> > +      */
> > +     if (ret !=3D LTC4286_MFR_ID_SIZE ||
> > +         strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> > +             return dev_err_probe(&client->dev, ret,
> > +                                  "Manufacturer id mismatch\n");
> > +     }
> > +
> > +     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
> block_buffer);
> > +     if (ret < 0) {
> > +             return dev_err_probe(&client->dev, ret,
> > +                                  "Failed to read manufacturer
> model\n");
> > +     }
> > +
> > +     for (mid =3D ltc4286_id; mid->name[0]; mid++) {
> > +             if (!strncasecmp(mid->name, block_buffer,
> strlen(mid->name)))
> > +                     break;
> > +     }
> > +     if (!mid->name[0])
> > +             return dev_err_probe(&client->dev, -ENODEV,
> > +                                  "Unsupported device\n");
> > +
> > +     ret =3D of_property_read_u32(client->dev.of_node,
> > +                                "shunt-resistor-micro-ohms",
> &rsense);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (rsense =3D=3D 0)
> > +             return -EINVAL;
> > +
> > +     info =3D devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +     memcpy(info, &ltc4286_info, sizeof(*info));
>=20
> devm_kmemdup()

We will revise as below
info =3D devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info), GFP_KERNE=
L);
if (!info)
	return -ENOMEM;

>=20
> > +
> > +     /* Default of VRANGE_SELECT =3D 1, 102.4V */
> > +     if (device_property_read_bool(&client->dev, "adi,vrange-low-enabl=
e"))
> {
> > +             /* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> > +             ret =3D i2c_smbus_read_word_data(client,
> LTC4286_MFR_CONFIG1);
> > +             if (ret < 0) {
> > +                     return dev_err_probe(
> > +                             &client->dev, ret,
> > +                             "Failed to read manufacturer
> configuration one\n");
> > +             }
> > +
> > +             if ((ret & VRANGE_SELECT_BIT) !=3D VRANGE_25P6) {
> > +                     ret &=3D ~VRANGE_SELECT_BIT; /*
> VRANGE_SELECT =3D 0, 25.6V */
> > +                     ret =3D i2c_smbus_write_word_data(
> > +                             client, LTC4286_MFR_CONFIG1, ret);
> > +                     if (ret < 0)
> > +                             return dev_err_probe(&client->dev, ret,
> > +                                                  "Failed to set
> vrange\n");
> > +             }
> > +
> > +             info->m[PSC_VOLTAGE_IN] =3D 128;
> > +             info->m[PSC_VOLTAGE_OUT] =3D 128;
> > +             info->m[PSC_POWER] =3D 4 * rsense;
> > +             if (info->m[PSC_POWER] > INT_MAX)
>=20
> This is too late. See below.

We will check sooner.

>=20
> > +                     return dev_err_probe(&client->dev, -ERANGE,
> > +                                          "Power coefficient
> overflow\n");
> > +     } else {
> > +             info->m[PSC_POWER] =3D rsense;
> > +             if (info->m[PSC_POWER] > INT_MAX)
> > +                     return dev_err_probe(&client->dev, -ERANGE,
> > +                                          "Power coefficient
> > + overflow\n");
>=20
> This still needs to be written into the chip. There is no guarantee that =
the chip
> is in its default configuration when the driver is loaded.

We will check sooner.

>=20
> > +     }
> > +
> > +     info->m[PSC_CURRENT_OUT] =3D 1024 * rsense;
> > +     if (info->m[PSC_CURRENT_OUT] > INT_MAX)
>=20
> This is too late. If rsense =3D=3D INT_MAX, for example, 1024 * rsense wi=
ll be some
> negative number.

We will check sooner.

>=20
> > +             return dev_err_probe(&client->dev, -ERANGE,
> > +                                  "Current coefficient overflow\n");
> > +
> > +     return pmbus_do_probe(client, info); }
> > +
> > +static const struct of_device_id ltc4286_of_match[] =3D {
> > +     { .compatible =3D "lltc,ltc4286" },
> > +     { .compatible =3D "lltc,ltc4287" },
> > +     {}
> > +};
> > +
> > +static struct i2c_driver ltc4286_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "ltc4286",
> > +             .of_match_table =3D ltc4286_of_match,
> > +     },
> > +     .probe =3D ltc4286_probe,
> > +     .id_table =3D ltc4286_id,
> > +};
> > +
> > +module_i2c_driver(ltc4286_driver);
> > +
> > +MODULE_AUTHOR("Delphine CC Chiu
> <Delphine_CC_Chiu@wiwynn.com>");
> > +MODULE_DESCRIPTION("PMBUS driver for LTC4286 and compatibles");
> > +MODULE_LICENSE("GPL");

