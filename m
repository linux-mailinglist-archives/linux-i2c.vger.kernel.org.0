Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C102CCF91
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 07:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgLCGh1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 01:37:27 -0500
Received: from mail-mw2nam12on2077.outbound.protection.outlook.com ([40.107.244.77]:55649
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727908AbgLCGh0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 01:37:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrY8CXsCXuqRCcVRedrhnrAjAfFDEP9h4NMUTxVAdw3I6eTrcUsNras8hLDnLevV74MHz8MXKGEe7sfSfRsr2XwGj3k7StaqTPTlo/IR5NYH4r8BsX20rkvpy9nMafC2QkIZjbJ8DAd5A84DO3v2o9M8c1oZOKuXrO+vbeyE3EWFFR6zztgppSg6/icluFEPmOTQj5bzJ12QTjOU1AWXwXw1GAnpc7AOEUWXuACFNzZFGz6zbTQqun7rg+X28JqjlwP/6nDqfbG0hf1WgjW0is4NKjFBymVUD7Z0zblStQfdLqXD45OxEyu2+N98mcwThSMvWcvhB4vPVHLXyqb2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RztgGnOW09w3RsugC599Ue61IRnRdky32cOFPWSVrY=;
 b=oJy2tImu0bM3lGqip9wVhvyCVUmiqog8ijblj0CRY5UETgYbNupV9yBmjiG4/7634eOJ2Mbbz1bNFlNkd1iLcEOKDzwgVyW/DNeoOhHhH3uBVwYc8FJKCkF7iR5mxRU8UPTHr+C5Nv+O3z/Pu5MefV8gPzbXzRZ1z5nZEn93STu8CPUA5HSZoxmRZ4x4OZf8vr0NdxAFzeNYNdwEt1uEjhFOte7LsAT4nXzknv7Ng5TRuH3NrnrNxJh63WMcsXjmW51v+3YDB84fBAJkqizcjh1yp+6/rBQmJCcdpazr/aTVSnkmcQRTwu3yi/j2dpwl1gFMnXe4FMbzERZlrorZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RztgGnOW09w3RsugC599Ue61IRnRdky32cOFPWSVrY=;
 b=IvOcrzSTjnBdL62IPGdKUclH4KfStoAg2D5IOs3fkWNOdMpIxfBs1IXaGiZFbvbZ6EJJu/zFEv1rtUeqf5Z6a84rTqcR1biljPBiYgXAkTC7IZnbf0N/EUi1xlCzQ3bGg3pE9CDNITwWUAC5X2IDOpe6vrLW8C3+IWjeciu466s=
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB4520.namprd13.prod.outlook.com (2603:10b6:a03:1d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Thu, 3 Dec
 2020 06:36:32 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.005; Thu, 3 Dec 2020
 06:36:32 +0000
From:   Yash Shah <yash.shah@openfive.com>
To:     Andrew Lunn <andrew@lunn.ch>
CC:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "peter@korsgaard.com" <peter@korsgaard.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Sachin Ghadi <sachin.ghadi@openfive.com>
Subject: RE: [PATCH 1/4] dt-bindings: riscv: Update DT binding docs to support
 SiFive FU740 SoC
Thread-Topic: [PATCH 1/4] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
Thread-Index: AQHWyIHBGfYvEaJ6f0qSdKOZggdFCqnj5iWAgAEFz3A=
Date:   Thu, 3 Dec 2020 06:36:32 +0000
Message-ID: <BY5PR13MB4453B21AD0714272B39B375982F20@BY5PR13MB4453.namprd13.prod.outlook.com>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
 <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
 <20201202145823.GC2324545@lunn.ch>
In-Reply-To: <20201202145823.GC2324545@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lunn.ch; dkim=none (message not signed)
 header.d=none;lunn.ch; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [103.109.13.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c01b394d-a1d6-44ce-3428-08d89755c648
x-ms-traffictypediagnostic: BY5PR13MB4520:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR13MB4520BF8E53256F7EC213475D82F20@BY5PR13MB4520.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PVJNyFs8K9RXxiUH/2oHgzFJ7Eg/HJftmqg8vnNP8KW2qju6E+p8iVcpUtPHf+1OD/o0Eqwi3d6EsfRpZtYqDoaWwpPAMc6CC3j+XellyDwag7uEqH+dxy7q3nK9VbdZYK2u3K3Noo98up96gG/LeiDMKbgUvUIix0dB4IbwAIMSIgn0XsP3+258m00MCPD4ceh/XdrO9ZQOgqHudzeTl5Jcqt5DegdvQjW05mUSZvKR4iYC+J3oyghZABW/fg4D2a0/oNpurNGdn3wn4UCGOa8XceCmrastKhvnaSEnGCvbs7/Sibd8ZCLlBkY8jBuQcJ7yhvDEG5rEOEs3mAzzbg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(39840400004)(136003)(346002)(366004)(376002)(396003)(7696005)(66446008)(53546011)(52536014)(6506007)(4326008)(5660300002)(64756008)(107886003)(66946007)(66556008)(66476007)(186003)(26005)(76116006)(55016002)(9686003)(54906003)(71200400001)(6916009)(15650500001)(478600001)(2906002)(83380400001)(86362001)(8936002)(7416002)(33656002)(316002)(8676002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xYSfoCz+wR0kTQRgfwNFBhFbicJR5mHoDsUbKmmq19761rPQbBKUR9urL+5E?=
 =?us-ascii?Q?XuOv9Hs+GJUMZZP4y/Lw4vma86ZuMYxV7Mn48H41k46ge9m0aF65yrOJmmia?=
 =?us-ascii?Q?glTMbPpBlJlHM9p6YAxAdErKGCJYdCahxErp0qy4BqoXkA8pV7nFt/SAMAds?=
 =?us-ascii?Q?P3JdNaBlQn/owH002ZeD3LMR29Iudp/JXpn4DqVpdo5GJYg+GW66Ym+9klfZ?=
 =?us-ascii?Q?I8HCYAKIQOxE0umrgHrIeP3jBI9c+oMx6HwuYWvOxKB1B2hcoXc+2pjQGyaf?=
 =?us-ascii?Q?292HyRrAp8yC2ho6jOfVcbgQ2eAe3e0BhSF+DsFP7QzFoyyD2aut/BXVb4Xu?=
 =?us-ascii?Q?2yf5YEACb16R5WXM3sbnjpjQlRyPGP6yBqX59ZlGlZ57GA4g4vW9Ei9NHSvQ?=
 =?us-ascii?Q?Ri6fMJ15LXYMSllSJEqohNCfA8jtkAaZkdbXbaA4D58MsoMFqKH6NKChKpni?=
 =?us-ascii?Q?jOqYottsqIaqM3/tu2tNFEnDbpRoC4MZPwbSuHxQ87F0qQb0my5djM7YgsW0?=
 =?us-ascii?Q?LqtQPYWh72LxDlnIdQUu4rlPQCk3J0j06Vl6SghvkoB9YT+EFwgltizo9pYY?=
 =?us-ascii?Q?X8djNSVheD+zsfRIct1v6jJWeHI+bVdtqI5RXGsjEfRemVNOZs0V6gU7fBEZ?=
 =?us-ascii?Q?EfdJd4DNtFeGZBEVM+V6UC9zYtyILHMXcKRZsaNV/6O8P3oI25YoL7DVIyYH?=
 =?us-ascii?Q?H1Lvz6NKYTZzXcA1h4095ygxceDtDBho/DaVN1g6FLcxBq0pRmjq9Z6zZfxj?=
 =?us-ascii?Q?jFhrDlBaqlcrJWkGWoxvV3nIG6UCErS0nQ3Y7E5nUvoKHmuh6YO/UJBm17Gh?=
 =?us-ascii?Q?RAJSw2J2KbLG/1wzrzI2o+xy95laiDsjcY5iYr/j2cGpipQ7XjL39EydZfO7?=
 =?us-ascii?Q?1NET/I10p8kezUG6u4HuBKfvMK4hZa+n55vVvmWYqTEv/YvtEmrCtd9I6RoN?=
 =?us-ascii?Q?UKdEd6bKFbry+AYSEPESAFdmfhVkq1abyuPkVmrRSiU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01b394d-a1d6-44ce-3428-08d89755c648
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 06:36:32.6136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16wh5RM7AeJwrfdaNzH5FqDOJqCJC2qQWCzXXIw+fJ+ZCD6mnZo4EFY9MNtJm1EZx1pa8xrGHNrJtoqhXPFKDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4520
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 02 December 2020 20:28
> To: Yash Shah <yash.shah@openfive.com>
> Cc: linux-spi@vger.kernel.org; linux-serial@vger.kernel.org; linux-
> pwm@vger.kernel.org; linux-i2c@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org;
> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org;
> broonie@kernel.org; gregkh@linuxfoundation.org; aou@eecs.berkeley.edu;
> lee.jones@linaro.org; u.kleine-koenig@pengutronix.de;
> thierry.reding@gmail.com; peter@korsgaard.com; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; palmer@dabbelt.com; robh+dt@kernel.org;
> bgolaszewski@baylibre.com; linus.walleij@linaro.org; Sachin Ghadi
> <sachin.ghadi@openfive.com>
> Subject: Re: [PATCH 1/4] dt-bindings: riscv: Update DT binding docs to
> support SiFive FU740 SoC
>=20
> [External Email] Do not click links or attachments unless you recognize t=
he
> sender and know the content is safe
>=20
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > index 6b25a80..1966b2c 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > @@ -3,9 +3,11 @@ Device tree configuration for i2c-ocores  Required
> > properties:
> >  - compatible      : "opencores,i2c-ocores"
> >                      "aeroflexgaisler,i2cmst"
> > -                    "sifive,fu540-c000-i2c", "sifive,i2c0"
> > +                    "sifive,<chip>-i2c", "sifive,i2c0"
>=20
> Please make this a full list. At some point, this file will get turned in=
to yaml, at
> which point substitution like this will need expanding. It is better to d=
o that
> now.

Ok sure, will do that in patch v2.

- Yash

>=20
>      Andrew
