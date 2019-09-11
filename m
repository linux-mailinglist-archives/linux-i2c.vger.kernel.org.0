Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974E4AF5C3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 08:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfIKGZw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 02:25:52 -0400
Received: from mail-eopbgr20048.outbound.protection.outlook.com ([40.107.2.48]:52793
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726792AbfIKGZw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Sep 2019 02:25:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhQgZA9RL2RnUEE8En3cCN6d3nqE6gxNFyzAm6Aq134MqX0W5hOF6xYUbbHXfCLs6wcSglQJi1H8eFFmL8NhJx30CJ/txM8Krn51HB8hDryTY62JLf8Prlpdet4biqL4mAODLFXPHbS56Liwr1RsEPDMRd5VtMXVW9a7h+x81rDjFZGfE9HT44glvmW/5/Pc7yrt7mcwH7tW2Bb2gTrX1R7aahutEBXTcRpbBz0bmdeDIqQbu0z1Ce94301wl/aGuWPIGcdJv/EtePFn6Af823Tn5h5Zb6b5KUQydvqeTN5AA4jrr5sH++aAMQ3g/P8pZanb9UhfLIkBozFqBuQHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0oEkVv3Qp5GP1MfcPqvcdNuPJFghY9hqhJQ2bMLAkM=;
 b=iOq9/A1p3Tt8Dckl4B4TqKuwpY50JsfbtFXgKZRnqaT35xglHU1751zRth9k2WNNGfD5D4eQqyt4J3lhB+qpxoq2bY6u0EkemcYtD4c8SG+vZQEdiwMyt2a8QLPZJIx4pHwfXdPb2DDNIPDajbu/DAHmzOXrX9QLCBp8oZ9htCAuao31+mcB5R2KEmzlhEBzO68SBpMbYKQ3qa25YoZSYnTL8DIWjuTA0cSeP1TwULEhyIgntuUhRbiFPtfZWWmSo9TNj+YKt15XlayWQx5W9V2sZmKrUmTYCEEu+OSiJkmZqYfis3rodPfv8K7zsWb5DbD7RDsiOApWoiLNDZeiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0oEkVv3Qp5GP1MfcPqvcdNuPJFghY9hqhJQ2bMLAkM=;
 b=poFRPox0fMD200mjsw8hCP1CN0aR53a/MCr4y396sQCr6HXq2OP0qMul0J03CWxXT6joxrXDGTM3nFCD7h/EI5ugs/9aHjO1TBxZUplPrpjG2TPxI6alioxOYC3Q+zbA/7renMyOG2PPW9GLAEOuxJaiid0CQNiczrpJ0dDl+ws=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4235.eurprd04.prod.outlook.com (52.135.128.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 06:25:47 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 06:25:47 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>
CC:     Chuanhua Han <chuanhua.han@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [v2] ACPI: support for NXP i2c controller
Thread-Topic: [v2] ACPI: support for NXP i2c controller
Thread-Index: AQHVZImk5g5PYdwMgEGSUu7QXQNuc6cmCfxA
Date:   Wed, 11 Sep 2019 06:25:47 +0000
Message-ID: <DB7PR04MB4490390AC5331280CDF012E38FB10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190906075319.21244-1-biwen.li@nxp.com>
In-Reply-To: <20190906075319.21244-1-biwen.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e1044cb-a643-4ee0-8314-08d73680e24f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4235;
x-ms-traffictypediagnostic: DB7PR04MB4235:|DB7PR04MB4235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB423549E353D4131150B333E18FB10@DB7PR04MB4235.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:483;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(7696005)(316002)(446003)(11346002)(6116002)(8676002)(81156014)(478600001)(81166006)(5660300002)(66066001)(66476007)(256004)(66946007)(14444005)(7416002)(66446008)(64756008)(66556008)(25786009)(52536014)(7736002)(74316002)(305945005)(71190400001)(71200400001)(6246003)(53936002)(4326008)(8936002)(229853002)(33656002)(6436002)(476003)(54906003)(186003)(3846002)(55016002)(2906002)(9686003)(44832011)(486006)(86362001)(14454004)(102836004)(76116006)(99286004)(2201001)(26005)(110136005)(76176011)(2501003)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4235;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iF2SUKnxSzLiiZskm+ykpukJHTYSSRcZhXEr4bqD1SThDBvevwQLqAiHmtoIvV1A+OO/k4Lxj3lX3rnlVkkTFWiyed16txQj63EBIpg9RFfHo7M3H5wCqENf1o20XlbJ2O3PkClpoZjO6KAh/HhA0xLBLzQ0v9pBBNvSeNTqf3FpmafazzkqLq4eqbFPnXyHPVagI4aaU9X3wx8uNFDijn0wuvvkv4hYS0vAB8biHBYKUFk0X3vb5k9/bOPfz4U49W5JS34pHbBjA0EpfDYAqyPODEWw5Q1SASfeVl3fUnejYQU+P2GBKaRktvG6AA5Nw4M1oSiwoXGonmdXQXntNGJrzaf0DnKk4G+P7ndi5zS2w46uXMdUs1/awj298xhWqYQJy+jEG1bN1pYg7br1y7h9r17WsUKWh6ewyiF3HJA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1044cb-a643-4ee0-8314-08d73680e24f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 06:25:47.5890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7fkQTTbZyXHQTfJ5ixjwBiCwuIcnJP8gXeISo/PaKHH+7GWm1dwZ8Ez3AUfXmH5bv2qIezn3CvzbqGAdwxWhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4235
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi rafael, wolfram
	Any comments about this?
>=20
> Enable NXP i2c controller to boot with ACPI
>=20
> Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
> Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v2:
> 	- Simplify code
> 	- Adjust header file order
> 	- Not use ACPI_PTR()
>=20
>  drivers/acpi/acpi_apd.c      |  7 +++++++
>  drivers/i2c/busses/i2c-imx.c | 17 +++++++++++++----
>  2 files changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c index
> 7cd0c9ac71ea..71511ae2dfcd 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -160,11 +160,17 @@ static const struct apd_device_desc hip08_i2c_desc
> =3D {
>  	.setup =3D acpi_apd_setup,
>  	.fixed_clk_rate =3D 250000000,
>  };
> +
>  static const struct apd_device_desc thunderx2_i2c_desc =3D {
>  	.setup =3D acpi_apd_setup,
>  	.fixed_clk_rate =3D 125000000,
>  };
>=20
> +static const struct apd_device_desc nxp_i2c_desc =3D {
> +	.setup =3D acpi_apd_setup,
> +	.fixed_clk_rate =3D 350000000,
> +};
> +
>  static const struct apd_device_desc hip08_spi_desc =3D {
>  	.setup =3D acpi_apd_setup,
>  	.fixed_clk_rate =3D 250000000,
> @@ -238,6 +244,7 @@ static const struct acpi_device_id acpi_apd_device_id=
s[]
> =3D {
>  	{ "HISI02A1", APD_ADDR(hip07_i2c_desc) },
>  	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
>  	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
> +	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
>  #endif
>  	{ }
>  };
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c =
index
> 15f6cde6452f..a3b61336fe55 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -20,6 +20,7 @@
>   *
>   */
>=20
> +#include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
> @@ -255,6 +256,12 @@ static const struct of_device_id i2c_imx_dt_ids[] =
=3D
> {  };  MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
>=20
> +static const struct acpi_device_id i2c_imx_acpi_ids[] =3D {
> +	{"NXP0001", .driver_data =3D (kernel_ulong_t)&vf610_i2c_hwdata},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, i2c_imx_acpi_ids);
> +
>  static inline int is_imx1_i2c(struct imx_i2c_struct *i2c_imx)  {
>  	return i2c_imx->hwdata->devtype =3D=3D IMX1_I2C; @@ -1048,14 +1055,13
> @@ static const struct i2c_algorithm i2c_imx_algo =3D {
>=20
>  static int i2c_imx_probe(struct platform_device *pdev)  {
> -	const struct of_device_id *of_id =3D of_match_device(i2c_imx_dt_ids,
> -							   &pdev->dev);
>  	struct imx_i2c_struct *i2c_imx;
>  	struct resource *res;
>  	struct imxi2c_platform_data *pdata =3D dev_get_platdata(&pdev->dev);
>  	void __iomem *base;
>  	int irq, ret;
>  	dma_addr_t phy_addr;
> +	const struct imx_i2c_hwdata *match;
>=20
>  	dev_dbg(&pdev->dev, "<%s>\n", __func__);
>=20
> @@ -1075,8 +1081,9 @@ static int i2c_imx_probe(struct platform_device
> *pdev)
>  	if (!i2c_imx)
>  		return -ENOMEM;
>=20
> -	if (of_id)
> -		i2c_imx->hwdata =3D of_id->data;
> +	match =3D device_get_match_data(&pdev->dev);
> +	if (match)
> +		i2c_imx->hwdata =3D match;
>  	else
>  		i2c_imx->hwdata =3D (struct imx_i2c_hwdata *)
>  				platform_get_device_id(pdev)->driver_data;
> @@ -1089,6 +1096,7 @@ static int i2c_imx_probe(struct platform_device
> *pdev)
>  	i2c_imx->adapter.nr		=3D pdev->id;
>  	i2c_imx->adapter.dev.of_node	=3D pdev->dev.of_node;
>  	i2c_imx->base			=3D base;
> +	ACPI_COMPANION_SET(&i2c_imx->adapter.dev,
> ACPI_COMPANION(&pdev->dev));
>=20
>  	/* Get I2C clock */
>  	i2c_imx->clk =3D devm_clk_get(&pdev->dev, NULL); @@ -1247,6 +1255,7
> @@ static struct platform_driver i2c_imx_driver =3D {
>  		.name =3D DRIVER_NAME,
>  		.pm =3D &i2c_imx_pm_ops,
>  		.of_match_table =3D i2c_imx_dt_ids,
> +		.acpi_match_table =3D i2c_imx_acpi_ids,
>  	},
>  	.id_table =3D imx_i2c_devtype,
>  };
> --
> 2.17.1

