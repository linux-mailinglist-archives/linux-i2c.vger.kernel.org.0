Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFD91F8C51
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 04:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgFOCsi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 22:48:38 -0400
Received: from mail-eopbgr40054.outbound.protection.outlook.com ([40.107.4.54]:62528
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728028AbgFOCsh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 22:48:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWvN1hbnICaMKMI22LfJl02T4Ei10K+zxHBdO1MupNNCaRgZsm61/TUT+CIYT0JnkWZgpHcoOl9BBFvwAQqmtIlNQnZ5vkjrqy6bUQyFXlHFDfFUZbBwNRBn/j4WBYpKWaN8LgViGruBmleN7vroYHh5tlG0oBmZVV43v1mwjxyOblJm2QIZQpN6sd4N1/gpMpXPIEkbvp5+xPegV7zpdYbU47AaaXeHcWA1G3uhdQbxfAJ/Ar7P5z8cejZE+JNV3qqDs0w9UKNwyteTgw7H8ONlD/4Rj+GJjI0WiK0zUOKijwl3vqcRR8jJK6DmrQ2+H3rHLHIa1uzmfsm2dtOnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjWBxzCzef2PLnNvF36EMNRusNQqfMQqbXp6ZOmzrkA=;
 b=MIWerlq0AjX2xiFRr0JiJsUPq71XHnEHtmxGwoZtrO1vqB/9FXsbMXBc+h4E85CWUoQVRdVh8pb62jT1MB5tsGsWlV/AX70+UvxNIL/fiqUmoETn0D3WbiVrQdrhU2/iFHzjzfYzmt7xv45upZbib/x8sxHGS5LxPSOgHd3vhxt3V/SyJk2Te6iZyDHz26Q0b7YdsplmB+4EW39YfZSwRVY0qDKkLqHQ31MPh8ze3ZOm0z5bLhv4PlKQiEdQdnqgUcr9qZJgiaEafnj+YiYFm5JX0KOgvbPE43Akmj3mhdVzzwYRfSvugGWEAJsBxFcuglp1pfBn5YPtf5qOog3CIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjWBxzCzef2PLnNvF36EMNRusNQqfMQqbXp6ZOmzrkA=;
 b=kdU21r5xaMoTRKfBckiIYTvNhIWgUTWQdOvRqDVcTglFK8Ut3rkMmSIE00TxUKXQZxT67wZDLMRAvC33IordBKdWmw7M8cLKdZtsxGv0Qmh1NxOggaZ9CX90VetHaGm8T9tGMcG2hRXslipo6nEomFK3dko9722Gy5Ft0dZuCK0=
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 (2603:10a6:209:12::18) by AM6PR0402MB3846.eurprd04.prod.outlook.com
 (2603:10a6:209:18::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Mon, 15 Jun
 2020 02:48:34 +0000
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1]) by AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1%7]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 02:48:34 +0000
From:   Andy Duan <fugang.duan@nxp.com>
To:     "wu000273@umn.edu" <wu000273@umn.edu>,
        "kjlu@umn.edu" <kjlu@umn.edu>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] [PATCH] i2c: busses: Fix a reference count leak.
Thread-Topic: [EXT] [PATCH] i2c: busses: Fix a reference count leak.
Thread-Index: AQHWQc+52GnSsJfEJEa/K47t5grMhqjY+ylA
Date:   Mon, 15 Jun 2020 02:48:33 +0000
Message-ID: <AM6PR0402MB36071B3C8859FA8F694FB706FF9C0@AM6PR0402MB3607.eurprd04.prod.outlook.com>
References: <20200613221213.6679-1-wu000273@umn.edu>
In-Reply-To: <20200613221213.6679-1-wu000273@umn.edu>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: umn.edu; dkim=none (message not signed)
 header.d=none;umn.edu; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 561f26df-7afd-45c3-9d54-08d810d6987d
x-ms-traffictypediagnostic: AM6PR0402MB3846:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB3846B9BCFD8899CCA4AEC616FF9C0@AM6PR0402MB3846.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:298;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 03PgDYci00kBYI2Q7oy7a1QzqIsQ2ZTZlsfPj1YiqEXcpzMtVIOhj+zOaZREVrCQnhPnb58dO9RGVua5LvzSmRv/588BgmFqP8HVfcCDdII4mBq9Eu6zaAwLgrL2bpGboGbMRf9gi3Sph4RBqAbEwy+jbC+BiqPGhCzCcmoWtkDIACI35NDIEGBfbMm0ejuOKpl+/MpBmj5TSu/6JAPYdCFwGoQnyKYj6RLk4Sah5ZS55LRomdgcLABfvzhMasY1/9p49V+/V2y9o1HgGvjnB+cou2x+Rk3E2144nynYPjyBiVGAeQZU2GKaBMWCrj1z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0402MB3607.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(7696005)(52536014)(55016002)(9686003)(6506007)(83380400001)(86362001)(7416002)(26005)(8676002)(5660300002)(76116006)(8936002)(66446008)(66556008)(66476007)(186003)(66946007)(64756008)(316002)(4326008)(2906002)(33656002)(54906003)(71200400001)(110136005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: w3ikn4oVBT1M7HPfC+dfcFenhQrPG4vjmf9O3neHExDBJ/JtwvBJiedIfE/VNH6kywZ51GLSu5y/OiEB+DShek7YJcbUGBVAosZGyUlAIdy+IP7ivwmBt6zyobideuwVbapAWmL6wNG5TZjQLQdskCgCxVkp+5OcuDLxXaA3rdNsTLsDY6aSDE/zQ5XdudRn3uafTatcWPihMpSUTylFuG97fxZP5U33cWexIwwfcvBuOt8R86hjIkNuRmufwHYvTATmc0U5/+fYHQmQUasNGqSQyBi7vnQRRokZaUfRvk3MjjxASR9NBXbNImC79aigUmNZe6/UzZo36O+BQ1DTF5rIh0TC4wy3WCa57UpnCGwCR+Nr2fQCOwDuzFJfvGTNaVLrGogmY9QVQmIFQmVJAw/Nmt+vQSLZzIWdFwvlIpphKJFNRnSUWKMDU6MC6z/1zUq+Xv+Z/5eT/lkOtk9rNqdzBxrxeGfPbChxfv6ymPU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561f26df-7afd-45c3-9d54-08d810d6987d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 02:48:33.8952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wqaiwy8eAv8iAF8nnBxe33N1oJU5g3S6sKeC0JXp6gecklI62loIXEgjubklECL9oZbOLMcaostoISmvE0NcEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3846
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: wu000273@umn.edu <wu000273@umn.edu> Sent: Sunday, June 14, 2020 6:12 =
AM
> From: Qiushi Wu <wu000273@umn.edu>
>=20
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus call pm_runtime_put_noidle() if
> pm_runtime_get_sync() fails.
>=20
> Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>

Again, which case can trigger the issue ?
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 9db6ccded5e9..85b9c1fc7681 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -260,8 +260,10 @@ static int lpi2c_imx_master_enable(struct
> lpi2c_imx_struct *lpi2c_imx)
>         int ret;
>=20
>         ret =3D pm_runtime_get_sync(lpi2c_imx->adapter.dev.parent);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(lpi2c_imx->adapter.dev.parent);
>                 return ret;
> +       }
>=20
>         temp =3D MCR_RST;
>         writel(temp, lpi2c_imx->base + LPI2C_MCR);
> --
> 2.17.1

