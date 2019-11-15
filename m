Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72ECDFDB30
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2019 11:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfKOKVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Nov 2019 05:21:31 -0500
Received: from mail-eopbgr30073.outbound.protection.outlook.com ([40.107.3.73]:60006
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727135AbfKOKVb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 Nov 2019 05:21:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDh7uAwRku4syBmcUrWDViOo868ow6tt1zvmrm3bXIAdQm318X0T9VtKSzH6ne4Eoo4vxEZu54yEivV/p3cb0YVivax4sSIBIwDR80dxna+A1ArdHUGYdBNz2tESbfen0FtZCHbdpLY2TL+J/LY8XGJj0fJMqSIg6EGLddKKamIfHXLATRnAQPKmsh53cSokTlGsELO/BmRf1YKESOqaOzGc5WR580+GhPPzlX/ErWClJFeBwu0CopIjjpPFvwwxIqMPRWvmLQTZdS+1PqcC/Hy2eRdZ03x0pw4q2xPTpO236XXuh0pLO/03baVfT4gZ2ADLWpHqjah9M1colybGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/olkdiVOSfGvZitNrq6UgnMzUimg9aJkhWveDoD8GWU=;
 b=Haj5hRY5JPfWg8OXRDbc+wVH2IOz1+cPjc3WrfpZTCllHkUdaTNT/ZtI2KXOqN6i1P/aYgsUVYdmfqbq7R3AYhYs+RksIrbA4gdaVdo98wBcR9cHPPgaZ1KgsNZRruB6afnaiUWM3iA6FhnC/9wF1kg2oQG8x/M5fnXUq448H1dM/T7T4NKJOU1+zY2r38XSNozGfsGbPNHDu15/iLXyHZA4fBIXc7e1XDg4erTvc6S/9NZNqINyCJ8SrcPGTz1PS2TJrc/DdEUcoNjcC+WiOaSU6iPk/zxDGQU8BvgSJQqwR75wDo8N52W9/dNZICZGNW7w8vWg61DMIRhg2q/j3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/olkdiVOSfGvZitNrq6UgnMzUimg9aJkhWveDoD8GWU=;
 b=nzgjakBFbT6nRoy7upnjC7/kgii2AJXPsC5PfExwkA8xWhDk7J5A8YWJuQcmShlh5u1OK99MhzH5Fqn/WFSLwIJem7SfSIjwAcr0QRAiawflGxxuJeO/qJUvNvvCnuTimAeyaI5GKIB7WRVR+ep7RX37bzcATGy0D8HHPpjrgCs=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5515.eurprd04.prod.outlook.com (20.178.104.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Fri, 15 Nov 2019 10:21:22 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0%6]) with mapi id 15.20.2451.029; Fri, 15 Nov 2019
 10:21:22 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>, "peda@axentia.se" <peda@axentia.se>,
        Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [v5,2/3] i2c: mux: pca954x: support property idle-state
Thread-Topic: [v5,2/3] i2c: mux: pca954x: support property idle-state
Thread-Index: AQHViJBl22hUmzXlbUux/Avv7TBADKeMKw/A
Date:   Fri, 15 Nov 2019 10:21:22 +0000
Message-ID: <DB7PR04MB4490B0121FEED3C74A682C248F700@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191022041152.3663-1-biwen.li@nxp.com>
 <20191022041152.3663-2-biwen.li@nxp.com>
In-Reply-To: <20191022041152.3663-2-biwen.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c060d2c2-23b5-4bf7-f452-08d769b59057
x-ms-traffictypediagnostic: DB7PR04MB5515:|DB7PR04MB5515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB55158E3D9C783380866925798F700@DB7PR04MB5515.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(199004)(189003)(486006)(229853002)(76116006)(5660300002)(6246003)(44832011)(81166006)(74316002)(8676002)(7736002)(81156014)(8936002)(316002)(6436002)(305945005)(66066001)(26005)(33656002)(2501003)(4326008)(9686003)(186003)(52536014)(66556008)(54906003)(110136005)(66446008)(71200400001)(71190400001)(14454004)(478600001)(66476007)(66946007)(64756008)(76176011)(6506007)(55016002)(2906002)(25786009)(446003)(102836004)(7696005)(99286004)(86362001)(11346002)(3846002)(6116002)(476003)(256004)(14444005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5515;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7b2iNhwPsLiblKtRL8HGl1D7krgTEfLRjifgiFvb3cGqVCKUTWQLvwc/ttnvZeskSY6QIyi9mC38zaprKPEhAbWd5zIH+2bLO7kc6Gnw+t/f3SDpLOOTUVHgvZApXn/s56KABdkz4X4pLO47JjSbphKEQaBh1Q4q3Wjr5waeXTdtntAxtgwv2wxoFDzq4baJPSlVDWoIZD/w8Dch56ttruDqkoXaXD3DMh8TS9yLBWFPxp0NPTUfo9dRp1P1GHb6FNkfOOKRd8+x6QlxBpca+57ye9WF7elpgtZwOGAXmMDv6IE046n0uWiR4oqh93eh7JwGQgh/Fn6442SqIIbLANnAhEKBl5pBw0P7HDRH84NklFODbxB4q4kYqBEOczN9gIJttKlz3NVYwpyuurQn6Vol2h2klQITC9vM0yediHFt5ZaWzwSuxeVGHq68wi3V
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c060d2c2-23b5-4bf7-f452-08d769b59057
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 10:21:22.6715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NaRxiWymgGvSLe3c721bEAyScOZE2VFxmdFzqqI6IwN05OLEtfNGnvoi0gz7UEsciaLg+RS7I/OiGl8/4MwQqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5515
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

Any comments?
If no comments, could you give me a reviewed-by?

Best Regards,
Biwen Li
> This supports property idle-state,if present, overrides i2c-mux-idle-disc=
onnect.
>=20
> My use cases:
> 	- Use the property idle-state to fix
> 	  an errata on LS2085ARDB and LS2088ARDB.
> 	- Errata id: E-00013(board LS2085ARDB and
> 	  LS2088ARDB revision on Rev.B, Rev.C and Rev.D).
> 	- About E-00013:
> 	  - Description: I2C1 and I2C3 buses
> 	    are missing pull-up.
> 	  - Impact: When the PCA954x device is tri-stated, the I2C bus
> 	    will float. This makes the I2C bus and its associated
> 	    downstream devices inaccessible.
> 	  - Hardware fix: Populate resistors R189 and R190 for I2C1
> 	    and resistors R228 and R229 for I2C3.
> 	  - Software fix: Remove the tri-state option from the PCA954x
> 	    driver(PCA954x always on enable status, specify a
> 	    channel zero in dts to fix the errata E-00013).
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
> 	- add extra precaution for pca954x_init
>=20
> Change in v4:
> 	- rename function
> 	  pca954x_calculate_chan -> pca954x_regval
>=20
> Change in v3:
> 	- update subject and description
> 	- add a helper function pca954x_calculate_chan()
>=20
> Change in v2:
> 	- update subject and description
> 	- add property idle-state
>=20
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 67 +++++++++++++++++++----------
>  1 file changed, 44 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
> b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 923aa3a5a3dc..218ba1a5ed7e 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -86,7 +86,7 @@ struct pca954x {
>=20
>  	u8 last_chan;		/* last register value */
>  	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >=3D 0 for channel */
> -	s8 idle_state;
> +	s32 idle_state;
>=20
>  	struct i2c_client *client;
>=20
> @@ -229,20 +229,23 @@ static int pca954x_reg_write(struct i2c_adapter
> *adap,
>  				I2C_SMBUS_BYTE, &dummy);
>  }
>=20
> +static u8 pca954x_regval(struct pca954x *data, u8 chan) {
> +	/* We make switches look like muxes, not sure how to be smarter. */
> +	if (data->chip->muxtype =3D=3D pca954x_ismux)
> +		return chan | data->chip->enable;
> +	else
> +		return 1 << chan;
> +}
> +
>  static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)  {
>  	struct pca954x *data =3D i2c_mux_priv(muxc);
>  	struct i2c_client *client =3D data->client;
> -	const struct chip_desc *chip =3D data->chip;
>  	u8 regval;
>  	int ret =3D 0;
>=20
> -	/* we make switches look like muxes, not sure how to be smarter */
> -	if (chip->muxtype =3D=3D pca954x_ismux)
> -		regval =3D chan | chip->enable;
> -	else
> -		regval =3D 1 << chan;
> -
> +	regval =3D pca954x_regval(data, chan);
>  	/* Only select the channel if its different from the last channel */
>  	if (data->last_chan !=3D regval) {
>  		ret =3D pca954x_reg_write(muxc->parent, client, regval); @@ -256,7
> +259,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32
> chan)  {
>  	struct pca954x *data =3D i2c_mux_priv(muxc);
>  	struct i2c_client *client =3D data->client;
> -	s8 idle_state;
> +	s32 idle_state;
>=20
>  	idle_state =3D READ_ONCE(data->idle_state);
>  	if (idle_state >=3D 0)
> @@ -402,6 +405,25 @@ static void pca954x_cleanup(struct i2c_mux_core
> *muxc)
>  	i2c_mux_del_adapters(muxc);
>  }
>=20
> +static int pca954x_init(struct i2c_client *client, struct pca954x
> +*data) {
> +	int ret;
> +	if (data->idle_state >=3D 0) {
> +		data->last_chan =3D pca954x_regval(data, data->idle_state);
> +	} else {
> +		/* Disconnect multiplexer */
> +		data->last_chan =3D 0;
> +	}
> +	ret =3D i2c_smbus_write_byte(client, data->last_chan);
> +	if (ret < 0) {
> +		data->last_chan =3D 0;
> +		dev_err(&client->dev, "failed to verify the mux, \
> +			the mux maybe not present in fact\n");
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * I2C init/probing/exit functions
>   */
> @@ -411,7 +433,6 @@ static int pca954x_probe(struct i2c_client *client,
>  	struct i2c_adapter *adap =3D client->adapter;
>  	struct device *dev =3D &client->dev;
>  	struct device_node *np =3D dev->of_node;
> -	bool idle_disconnect_dt;
>  	struct gpio_desc *gpio;
>  	struct i2c_mux_core *muxc;
>  	struct pca954x *data;
> @@ -462,23 +483,24 @@ static int pca954x_probe(struct i2c_client *client,
>  		}
>  	}
>=20
> -	/* Write the mux register at addr to verify
> +	data->idle_state =3D MUX_IDLE_AS_IS;
> +	if (of_property_read_u32(np, "idle-state", &data->idle_state)) {
> +		if (np && of_property_read_bool(np, "i2c-mux-idle-disconnect"))
> +			data->idle_state =3D MUX_IDLE_DISCONNECT;
> +	}
> +
> +	/*
> +	 * Write the mux register at addr to verify
>  	 * that the mux is in fact present. This also
> -	 * initializes the mux to disconnected state.
> +	 * initializes the mux to a channel
> +	 * or disconnected state.
>  	 */
> -	if (i2c_smbus_write_byte(client, 0) < 0) {
> +	ret =3D pca954x_init(client, data);
> +	if (ret < 0) {
>  		dev_warn(dev, "probe failed\n");
>  		return -ENODEV;
>  	}
>=20
> -	data->last_chan =3D 0;		   /* force the first selection */
> -	data->idle_state =3D MUX_IDLE_AS_IS;
> -
> -	idle_disconnect_dt =3D np &&
> -		of_property_read_bool(np, "i2c-mux-idle-disconnect");
> -	if (idle_disconnect_dt)
> -		data->idle_state =3D MUX_IDLE_DISCONNECT;
> -
>  	ret =3D pca954x_irq_setup(muxc);
>  	if (ret)
>  		goto fail_cleanup;
> @@ -531,8 +553,7 @@ static int pca954x_resume(struct device *dev)
>  	struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
>  	struct pca954x *data =3D i2c_mux_priv(muxc);
>=20
> -	data->last_chan =3D 0;
> -	return i2c_smbus_write_byte(client, 0);
> +	return pca954x_init(client, data);
>  }
>  #endif
>=20
> --
> 2.17.1

