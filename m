Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E41030E970
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Feb 2021 02:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbhBDBZW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 20:25:22 -0500
Received: from mail-eopbgr1310107.outbound.protection.outlook.com ([40.107.131.107]:44448
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232478AbhBDBZV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Feb 2021 20:25:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALxyo32JMGHCva3WdvZiezVrXDtUvZYlx/Hb+MZiG6RtfFuix+usi87PXZbQ1DLAe9FowihVDbqkf8Bg/kuJMykAOwRV89jVuzx1Ts6VgWi68dDGnKsTjd0hejtM/BpUk1DgO95T1AOxTTDBTokDBPs0ZHxXA2ykxupbknSQMEtea+y1LO7yq+LamP6KXQJ6CM98XvnxOG3TiWrd5SvFyudq6oiU4jifvdATuKjNaDUBGwghvclgYzirMEzwFhUu7gJ6c674Tcrcnd1jfxuMxvT6kzheAFS9lx38tt63B9OZpuo49BjFZsXkkxqoCZuJaCYSqvSDMUu4G+AucgKBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Old0rdXZWv43PfbIhG26no4aLnfEBTDYw+/gdgFJsp4=;
 b=Z2VKJ+C4PUh8QPgNWIzGy4kD71vvaP6E9x5mNt6ddbfJwZ5htH968tZwUVuBukY0igcJHuXVRk0dijlMZvwkxYDsIZ7UY4G57ROzM8kuAhmyHCvOeOQQaI/JM3J4jNkCWF1XRtmbeE7otsWF55HPj4rM2LzJg4bV5GZoDVDEBGurDPxq/IESzLgjVFiMTDfDa5OX8SkKfC+js2CFq7ngPI7L/T677bDCqOmgEcM/Tmg7W/uJhawOMjgp7XrLyO3HEccOmkJOESQoK4Vgn/hqiDWDtX+UsqDi+mx2WiXjVJWeoDbe13aYhElDm7zPEEg42uhOnJ0vi2dUb3eg4kP6pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Old0rdXZWv43PfbIhG26no4aLnfEBTDYw+/gdgFJsp4=;
 b=IUoOjKV12E9UlnWMDJ8W+jb9Bv5LhRPiHi+mxwV/zwSjCWM3ODz/KNVovDKoDUXS+TEua0aHchyb2NEpjhEAm4zn7osEATyqYdjyRy8LhnvYUQHjl7iH0BSj34aijw9u9oj9xUhrYhlEE6FmxPgsW+PKydNdWIU+MDDkxULJKBc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4505.jpnprd01.prod.outlook.com (2603:1096:404:10e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Thu, 4 Feb
 2021 01:23:43 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3805.026; Thu, 4 Feb 2021
 01:23:43 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: iommu: renesas,ipmmu-vmsa: Make
 'power-domains' conditionally required
Thread-Topic: [PATCH 2/3] dt-bindings: iommu: renesas,ipmmu-vmsa: Make
 'power-domains' conditionally required
Thread-Index: AQHW+aXLE6kjTToERUyrYHC6EOlTKKpHMinQ
Date:   Thu, 4 Feb 2021 01:23:43 +0000
Message-ID: <TY2PR01MB3692149180074B3B9AB2CA96D8B39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210202205544.24812-1-robh@kernel.org>
 <20210202205544.24812-2-robh@kernel.org>
In-Reply-To: <20210202205544.24812-2-robh@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:8026:caa1:e178:9d3a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1631757f-8f8e-4390-6972-08d8c8ab82f7
x-ms-traffictypediagnostic: TY2PR01MB4505:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB45053EA2BE840D050BBD60C5D8B39@TY2PR01MB4505.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mo91YQ88obFlXQU+2dA48sxI9KSdllCe1EMxNXOsF2Gs3zI4nvlt6EaDTRr1aZonLMaA1XBO46xNO+AVtsAXmVB/Z65Az2CSm84qN4OjaQmDfC12yo0bhjKktI2EXY8tgtzmvcpC1IDPr6lFx/06mtiPS+eFc81i7Pp/kYKMjdbOGrF7B7jzoLlRo1taqKBzW3oLEqkrMWfURui2j44L54GNEXIL7y655vDi7rWm+88HPkbhkVSGlYCcpMweAfol9+RDghOZI+Mfd8g4R/lNOfg0x7O7AMZ+bg1OYnFArLRQkxjzmYZlWHbVMy+MYaBf1L0N/7lfy4vNA+tAAw3gESCgVHtSIn/NjfRfJtqSM0kZnTA4+WlIoMbYzdUgZU8aFqINmupNqC8AHstPZUX+1XXXVSTT+eVt2jdfihDLR6YMKuNZCDRQXjvlimRLiEHxf2kb8MdEti6OF7qmBrUJCBXAXm6qqfTXnbARq0dn7EE/qs1H7DmdyJynEMilElFR1N7GuZx31LBPJqfsuVrl7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(6506007)(86362001)(9686003)(7416002)(76116006)(52536014)(55016002)(66556008)(66476007)(66946007)(64756008)(66446008)(5660300002)(8676002)(186003)(33656002)(478600001)(4744005)(2906002)(4326008)(7696005)(54906003)(110136005)(316002)(71200400001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Cg5nTliDXEJiVVvLE2+t51ahGg9dX9Wtmjkoxtm1ZQvgQwvQtpZp1PVZTRrp?=
 =?us-ascii?Q?TzIsX9WuyWYzUzXUtM6QZmzeirSr75xFbIo0/hQrlQEXRR6ePth7n4Yr53cl?=
 =?us-ascii?Q?qkLET8yYHzF3S55VItFeazhtz0sdW9u9Z6lQBSiK4csxxvGIP8E5JD8IIXeC?=
 =?us-ascii?Q?Y+Y9aoWrmDjXL9vgZEgEAZBCICQypGWZE4cKuZ/CPrvMYN3R0z+EzVlVom3d?=
 =?us-ascii?Q?AVWt2dC4Bye/ANqzlxQL4MGAcQT4rgX4lQ/iFLnoDhrJA7ix/hqzfEUhFwag?=
 =?us-ascii?Q?RfjW0e/pWxBdbbrhCHOymppKdsIfM1+AMh/WM/npleq3ogCK+GEnfD/Fy6C5?=
 =?us-ascii?Q?3GAr/jNl3BB5KToNgYprgqY+K1NDD98hExNP0GzxBu3hfJDt0vuEYYDA1zmz?=
 =?us-ascii?Q?7wXqwmc+Rz2XK7cObI7br6urAew6BxsGgj+2FP2gWqy7+7VCo/OpBkSUu4ru?=
 =?us-ascii?Q?iWQPmTwL5wJ+zksy8/s82HmF9MAk6hXvMgYlkONxDL4Q1urftdt9ZlFSkRBq?=
 =?us-ascii?Q?p6qN4fci0I+Bz+RDZsBzHLSrSu+AsC8MleYs+3ZI5waXh5AfNoc9nzk2zGCS?=
 =?us-ascii?Q?bjJU7+cl6+BSTA80WEg8d3tvh/ckiRGsoe4svJ7NUS8ksZ9oSnEQ3QFCd7ma?=
 =?us-ascii?Q?NCX+njyOpabyDzM2TEkSseLMpy7YhtJwpfZ5ytgXXGR/Tjdk4/dk0alQVPPW?=
 =?us-ascii?Q?bIkaRbO7fiwtCFEYbRnPHkWAe1C2LSOkDMVbJeecvVWXkJziuZuWfS+h/QmP?=
 =?us-ascii?Q?rLyegp4BUj9Nn2xYTWLlwprcDfhHCy7lmLNQdpIplSuHrTN8MbjDvZNcYgjl?=
 =?us-ascii?Q?MS05lXT7CTUY3Ehqe9ijjy4wDnAOrYkmxCEihmkd/Dc+LSe36aWT+dqTQzd2?=
 =?us-ascii?Q?91bJMRch9wOGvrgF/bb3OWhCujgFJhTLTz40DI2H3r0RSDcm53T1Hd4jn0ZU?=
 =?us-ascii?Q?TAFEegp13uKVOSbTuBYsbHfZKluS/v5nheR81jVjZo0UVNfDnNLhpr3+/28k?=
 =?us-ascii?Q?060fP3GXnXpD3nlPmQRdgVQFwiFv27g2lQNBH5dM3mAfQLWI4fWOPmnIHd1M?=
 =?us-ascii?Q?DGWzZN73XM/Nzs4JjrhIcGSveybTkSffeZosG4D/pxqPO5ZO/Ck=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1631757f-8f8e-4390-6972-08d8c8ab82f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 01:23:43.3741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3n8JFwkZrBsmQZ2U1bl4FnjXyA+4MfxBEB9bxRIK8FZHv03K7eghtyq6GlObhKYeLbj+GdngtsvzbAAdMtGUJMuL1IOV2d5NDNiqoznez+sDdpiG6SCYnd9YQDn/Iw2P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4505
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

> From: Rob Herring, Sent: Wednesday, February 3, 2021 5:56 AM
>=20
> Fixing the compatible string typos results in an error in the example:
>=20
> Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.example.dt.yam=
l:
>   iommu@fe951000: 'power-domains' is a required property
>=20
> Based on the dts files, a 'power-domains' property only exists on Gen 3
> which can be conditioned on !renesas,ipmmu-vmsa.
>=20
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: iommu@lists.linux-foundation.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

