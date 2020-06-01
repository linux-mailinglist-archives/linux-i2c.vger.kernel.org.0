Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F041E9E19
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jun 2020 08:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgFAGYh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jun 2020 02:24:37 -0400
Received: from mail-eopbgr60070.outbound.protection.outlook.com ([40.107.6.70]:65248
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725972AbgFAGYg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Jun 2020 02:24:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XikagcgwH05wTojBLudYHNSZDv+KeEltQQQnL3PP/CXoJWzK7gchORCodhAPGqpuzGVTfhIfca7K/UGmXbsjDmN/fdo1uUX0jff7BRfgNoIMDT8OsDVNVlW3U+Rfcf5I6V1XwSxa3NIP0viRipohRSzTw08Kfj156Y8+5AzFQTAgAQCN97jfXm93hbMCH+1nlvX24s5lAQhmVoPXQ9dek4vGApSjy+PCnSEuqeO2oC6szANBF+GMrOwOGisInDfBffG8sQhPj5iNiOoGkFanT/Qr4XULZgMDizcODvw9jbTeajwbLm3NEgRkRze57xa316UVv8M+/ftjH7yKlbuIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiBDgNxOeIv10L0yafCEvbC8pgC1WDZ7ImqpGKRSPew=;
 b=av5pexjiP5Avnt6na0tiH1auJ+oYZ2yow/JTFGoobnBTw53SFi/yncQsM3odxEZXnpUlFJ9Qxlv0bNz1uNLQwDU75BjtRvxKN/4LArdgSskr87H2cBGCAAJbsQYdVtzmhBEPZ4WVVRmdpb6VfZhihyhEng6h+Tt+EGwiJAO0dAQZOxuN6wPgEbqaTwv73Vg2nUBcpHA+yz5yBMq+/wuVbe4Rr7smII9jTYaqkO21MpBIuHtNLy5ORqorGvT9P8e7sSlEuyAHdFj0jramOwy8AQaKEwhz7PIJe5C2BnUu0VF2ikzxGzxkC60u3OlkFxzjo68busCODRVG3kk6S51ZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiBDgNxOeIv10L0yafCEvbC8pgC1WDZ7ImqpGKRSPew=;
 b=sePMwbNcy3BsVgiyyscHrxzywIjdyDZ0bI/MHCpH0lArQB1D/+mVS3Uslq8IX4IVmjQPdu6flZuxx9WzT3ukFr3o2rUU9m8ELX0MosAKVrJs/ocS0oubO3UbdMlpFsgqhjjH63yXEXdCsDk99umiBWwERGf4WSqG2cjysrhCbCE=
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 (2603:10a6:209:12::18) by AM6PR0402MB3413.eurprd04.prod.outlook.com
 (2603:10a6:209:11::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.25; Mon, 1 Jun
 2020 06:24:32 +0000
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1]) by AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1%7]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 06:24:32 +0000
From:   Andy Duan <fugang.duan@nxp.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, "kjlu@umn.edu" <kjlu@umn.edu>
CC:     Markus Elfring <Markus.Elfring@web.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] [PATCH] [v3] i2c: imx-lpi2c: Fix runtime PM imbalance on
 error
Thread-Topic: [EXT] [PATCH] [v3] i2c: imx-lpi2c: Fix runtime PM imbalance on
 error
Thread-Index: AQHWN9w+YzYh2GSNZkyuyJOi3EJqXqjDSjyA
Date:   Mon, 1 Jun 2020 06:24:32 +0000
Message-ID: <AM6PR0402MB3607C88AD2E6087000D62F29FF8A0@AM6PR0402MB3607.eurprd04.prod.outlook.com>
References: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zju.edu.cn; dkim=none (message not signed)
 header.d=none;zju.edu.cn; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [101.224.80.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 40251208-4a11-49ed-3e8e-08d805f472c1
x-ms-traffictypediagnostic: AM6PR0402MB3413:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB3413EC308803AA6960F7A2AEFF8A0@AM6PR0402MB3413.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:161;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f469cGHwdOXEPVQPxPicHIslOqswNSd2XiTIUMxPtw1AmTz5dhvwTsEofJV3zhxsqd1ZhdOG3QqO8Pusjon1DcT3enjZrzZm4stDbG3tsc40dh74GbeuycVq8B7ihE2dXK2+QsCR9bwBw3uQs92MxxKz+k/ZtNMJAUbewchkUWzJn7+xYeis3g84Tjwd1UVStFvAocXO2sLNFCrXDH1VAFEm7sErD1NT70Eb3WaMQYcA7iBSzIDpTGMf/fRaglGwOWrCXBxdF/n0yHl+Vvc6o6otSBeKrWvn6y2JuQquYOrLG/HvtN+HRzl+aOmLVmyU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0402MB3607.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(9686003)(55016002)(4326008)(478600001)(33656002)(52536014)(5660300002)(7416002)(64756008)(66946007)(26005)(66476007)(76116006)(86362001)(66446008)(66556008)(6506007)(71200400001)(110136005)(54906003)(8676002)(2906002)(83380400001)(8936002)(186003)(7696005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yWGRiJljadya7K1UYnELmWSreN2xn8QG3qOp1CUV1ogZIbvVnxFBwRSDWu+2+KTqAlb4sVsy5s8hzyzO/SvGVUpJAjX1CrA6D9oyE571FbkwwKeuWR1/6Cu3495BB8JdlEBOILrjNsJxXFQzcsYxZcbE1Z1Ho3ymLtTsGHwfngoSYF8rUd2e+k3Zx4UpVXKm3yXgJ2kTmhp+7riGQrsnlo8jxFzeZkjXC45uQXIkionpvjACs58aB2nUDgq/t7Ctqhgx0YNbTsuy8EMWcgmA6Ir+8tDfcCpFj/6SDl/4dnNB+dZZ4pGoa/QCBPuRy2cWhdkEoV8F3C4ft6Br0nyXs/euKmX9ay8nfAatvDsF2rIElgpImYSVG4lR7KGhxWCbS3fPx0AfVqCRFFa7aDtK6UJnSbJRAKwKaLQxtu2rInkKWNworOEYeICKbCAWMKmgl6M5oJywxK/Nn8T+m5vMNK6va5QhYkD5hZ5ZrYubiho=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40251208-4a11-49ed-3e8e-08d805f472c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 06:24:32.7343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibtKse3DNFcFPveEBqV+P4xMX1+X9Wc9eUy8fL6shYq+wyAfuW0XymycQTjhEgoh7wAxaGvRzw+Fu9C+OR6odA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3413
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dinghao Liu <dinghao.liu@zju.edu.cn> Sent: Monday, June 1, 2020 2:17 =
PM
> pm_runtime_get_sync() increments the runtime PM usage counter even the
> call returns an error code. Thus a corresponding decrement is needed on t=
he
> error handling path to keep the counter balanced.
>=20
> Fix this by adding the missed function call.
>=20
> Fixes: 13d6eb20fc79a ("i2c: imx-lpi2c: add runtime pm support")
> Co-developed-by: Markus Elfring <Markus.Elfring@web.de>
> Signed-off-by: Markus Elfring <Markus.Elfring@web.de>
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Reviewed-by: Fugang Duan <fugang.duan@nxp.com>
> ---
>=20
> Changelog:
>=20
> v2: - Use pm_runtime_put_noidle() instead of
>       pm_runtime_put_autosuspend().
>=20
> v3: - Refine commit message.
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 94743ba581fe..bdee02dff284 100644
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

