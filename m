Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1463E1979F2
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 12:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbgC3K4b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 06:56:31 -0400
Received: from mail-eopbgr30042.outbound.protection.outlook.com ([40.107.3.42]:4161
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729313AbgC3K4b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Mar 2020 06:56:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPlJwfowHdNat42HsJ4FaOIsDv3+gvx9btBRBE92jwBHI28fxCU9gI7+pJdW62ov3J5nzjRKDa5ETJdFN5WkkJnwJt5VrUXKrxT0FwfZmkF43fmjPlf7jtgMU2iSw1I2aV/KabH0qmUlJPhug5X4ExUiQ6gyKhQ3EAcoiD5bm76kPp3L9Gh2WgPwromFKgPT7FMWTXj14qz202Q2NVFr4XlDAJGCWfHnPMYYn8GB5oGUDjhOrnQmG9qDTmF0g5wTtgIuc+ZKmjRklxK9UNesW+JQoV0Vy0hQqzaGm55lpY6QirTULeLzS6sogdSRJTCdXIPvLwtgjQemvPo4NnVNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+mbqMgwsRQgumE//vtkuj8aigQ7wM2Ep4uzg6kxjDA=;
 b=MT2pGRKHYtEzuyIyslImjfl2YQUDpfw64VnVqu+LjDkJ6zjEHUAjSSWJSBDAnWvrKX79sHrHyYd5LGUjS/DWeRWyispMzuT+J3OPc23v+1z323AbJN5xp/4O25nhfN1W+4yWYqcYGcuGAmrSuj1i7o5qlPy7IXYAQXjNbV+yRX980GcVgWqCTDSF6+WBB2Pb265citYyknmUvVaoONYMD+xsFoBavgdEwLHMSbg+c2WX7ZFXq64kcXmCGjl4wqiUoRzg2nvEyH3ddEFkaX2fr8u08ecwPBnfy3RG9YWTrmq1JM5geVGKPgU8WK539YC6klkx7BLTQiOCWyqKVLuqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+mbqMgwsRQgumE//vtkuj8aigQ7wM2Ep4uzg6kxjDA=;
 b=L8TYuMQnjDse6mApcrYhzvKvsLzHPEOBco+XFVjHj3iRdVrXsagSPIt2xFrIHFH6kBnt+6FSf8A610pRlZl97P3/aG2TMuoIXnkEnR65z0QN2Dt0irbzFgf5IOCsBBPoBVikmK/DVKcrVQvOiyk5/lXBg559HlQlcl4PPZMN8EM=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (10.169.223.14) by
 DB6PR0401MB2246.eurprd04.prod.outlook.com (10.168.53.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Mon, 30 Mar 2020 10:56:28 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::bca5:53b2:e6c3:4037]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::bca5:53b2:e6c3:4037%7]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 10:56:28 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>
Subject: RE: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read
 transactions
Thread-Topic: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read
 transactions
Thread-Index: AQHWBoGPzsFqXVo7uEyFouSq+UmCu6hg9iog
Date:   Mon, 30 Mar 2020 10:56:28 +0000
Message-ID: <DB6PR0401MB24389E2570C242FB9036EC968FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20200330105038.22546-1-biwen.li@oss.nxp.com>
In-Reply-To: <20200330105038.22546-1-biwen.li@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a4bb1a74-dbfe-4145-797c-08d7d498ffb3
x-ms-traffictypediagnostic: DB6PR0401MB2246:|DB6PR0401MB2246:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2246655B002231F910FFC7F98FCB0@DB6PR0401MB2246.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(86362001)(54906003)(26005)(478600001)(76116006)(66446008)(66946007)(966005)(66476007)(4744005)(4326008)(64756008)(66556008)(5660300002)(316002)(186003)(33656002)(52536014)(44832011)(110136005)(81156014)(81166006)(2906002)(6506007)(8676002)(7696005)(71200400001)(9686003)(8936002)(55016002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cfqAqfu7xhsMZwlu4vbNDJ6o7Dnykfp9fWA0RKZaI2Yn6tNJG5uv9YiZMDIiprzUhbcwJsu+u5aPu5jxH4dAGml8vaIevp/dNI7sBt1XVbTRBaVfj0VZqJMEAkKqdW8h8pNShWx/0E16W7Ph7iSOB2yXe3G6gQ09YLOcWb2Pp+px9vTPFnq1Eif69eaRettZsLnGUefMlsdP6rQoibTibWEb8jCvuaTkxmkVNrlmu+Z2A1KclXmNKn79cUqhiLJQHElq6peeqvPVtPq0/ox3g790y///duvdSHsYED5dDF5fLWDN1uUiP51Kf8frzj5lZMTLpxHOHCXMdzj1VU3Xw7oQJ+Pw9upIyn+4HLa+8PyZLTCjsqXqlsObkM7JBFPw8mxqjlxzgHdI/31WKv2h57tdb097Z70lMgMr9LhOPNaNtR10i3AFUDlUfk6xvv101oKwOoOVS2nlem/GM6+rZY7I56IAJR1V0ag18NWjOVfT7sRR/t27rGof1R7N+ExLocP4DezZKlyMz4elLvL3jw==
x-ms-exchange-antispam-messagedata: kxweAxbNku9Nyvxi0Iy9tYwvUoJ7Gim411HRNZpO38FdbKd9B1i0TMFCD3HLNJPnhUhoRzyu+gflmMeUelulJirkFkewOA17lXxuMN0543nLbCBH/oJxzYUVdnEQb5IaWxwDXjG9vgvww7Zatk1LJA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bb1a74-dbfe-4145-797c-08d7d498ffb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 10:56:28.5104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+R6YuWF7k2LZaDYJNfB2D3GJZjXUeV0qevAhKNzpNUjUubZ8UrtwZ64/AC7HjOwxNDfI3ltBPL4gWUTZQxaCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2246
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

The patch based on https://patchwork.ozlabs.org/patch/1203640/
and it is not accepted, so it(https://patchwork.ozlabs.org/patch/1203640/) =
is needed before apply the new patch.=20

Best Regards,
Biwen Li
> Support I2C_SLAVE_STOP event for the read transactions(master read from
> slave)
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c =
index
> 62517a41b32d..1fd0d87885d5 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1464,6 +1464,7 @@ static irqreturn_t i2c_imx_slave_isr(struct
> imx_i2c_struct *i2c_imx)
>  		ctl &=3D ~I2CR_MTX;
>  		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
>  		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +		i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
>  	}
>  	return IRQ_HANDLED;
>  }
> --
> 2.17.1

