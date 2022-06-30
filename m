Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9651C5616AE
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 11:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbiF3JmA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 05:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbiF3Jlk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 05:41:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E677433B6;
        Thu, 30 Jun 2022 02:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5fr3VkwsBU9tyJS+Ek+2rsuuF3JZLTM8cRe8iV7pKfNb87DvDgVelS42RcFlryd5IuEACJCBG9Kzs2w1X2S2iicf3Hp23xgjUXWNKKvxVx+5Mis5AoaPTr8fld8R9VsCOv5x6j43D+uuPI1kQB6DN6M3PZayU4CTfDEoazkP1QaseDKGh+LQMcPKPWANFAepUxTdcjLndmLFgkdUVOvQviyt5D+Ehviwb7q6a2IEyY3ZdTCCNOmhMhvLj7ABDB4cVmkIpGeDhCv7JrRUiCtjKSJOwpRMXLkEhkMJnu2kvsQUoQ4c03d/dl3+GJtwLOlTmo42f49/uZ2wnYhebkWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E9wUKgrX7p+KaKCIe8u6xHKz1n7Tgc5f42VMUzbCmU=;
 b=X8MFKlDewpuBgQXcs1Dtf8ecxf/MdQ7/bnCk1Z2OOq6sxoxKSjVMDrv89VefVXDZZ2ro9hJi2TwVE56Ah3uLukKGiYq4poEE12Io7YHuxf4Glo7Nn3iGqWwDv2WV8V/xvr1f1YRtlbi4apM78u1AALok6RO1n2fZHiKgzxDoPU/q0zhiQLj8YCYWb7+eKngvsDl1rTiQS26o+HqE2ZWbHbN8fTMGw5r2rZfRa71JaUjpHwdGCkCUXzXAwh+SqpZd2/NNsW6cgiPgLBxbjG5L4Srlnmj8upRA1WSfMzNvgdru9d0beNmql+wvGvQBLDlt/8IDkQChAPrzuHe/p9vg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E9wUKgrX7p+KaKCIe8u6xHKz1n7Tgc5f42VMUzbCmU=;
 b=h1PxdDzoHlH1f6VmQrUsxeZcO2CKLNbZA7m6JSbIx6Fdqeyd7e13cQEVlur77vXH0EC2146H8ajk7KCnTa7YM3q1S0J40aEM9j19Cmpb3AEUE5jYmcHEyGp6Z7LMgPcSb4oCp9hDjltLny7CHnk2XVcYUF3Q2OtWPM724YdnyPU=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS3PR01MB5911.jpnprd01.prod.outlook.com (2603:1096:604:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 09:41:37 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 09:41:37 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Topic: [PATCH v2 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Index: AQHYiye/oSzm38sKL0yQofOmd5Z9f61lUBEAgAJJmLA=
Date:   Thu, 30 Jun 2022 09:41:37 +0000
Message-ID: <TYYPR01MB70862C7983958DE5B327308FF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-3-phil.edworthy@renesas.com>
 <YrttwplV9zEgCFji@smile.fi.intel.com>
In-Reply-To: <YrttwplV9zEgCFji@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5ce07da-b9f1-45d4-82d1-08da5a7cba33
x-ms-traffictypediagnostic: OS3PR01MB5911:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NGlRdTEWC+YwpJBG50JCuQi8VmGAqj4GkMz9xiBSxD5tyzLmVJqed7pthYHFgHbOD9bFIx0lIxCRXz+0suUf/PE/zkHG4Zg+hSTejAZLFGuGaqko2tO7CnXtC9p+J32LrmYhvdYx8hl+5ex20S5fFX5hIiVevsCKtX0Om3M9S0ANUlNYT8rw/KQlk13s17c3S/S+rit0pJkNtBESXuQ2XBQtEb04UeYoLa05QJdSo9v5PzpHQvbb+P3xK+dfF7IY8N+t6wdwoC2XP/qcXOxtBuX82NyR+UpINANnc/6bSoFbniOELc6hXLEaMIknIRzZg39TQ6bw0RtvVlaj/bWg4KMssOwt0hufG6ZdQs4R5/liiEjCZK79k5p/ConyAKLEcexxz4kvx9iCOZxSps3XoVSynHYCbrSP3UuIb7pbfyNxa0CayXpRI0WP+eT4fV8Cxe/UtpSxaUjPA1sR55E8BOWVsWMlalZ79XUVA0gxjPIP1ub0M6EFCREnHii35inZDyINbxCPvExEy0BkRbwX11Wi/paes80n7lz6JTJdGBh1GiD4b38AMso4qHh1TXDLLjVWqW8nL+IuGqSvu9vrAih/d/33Nslxbz/tUIWzJ9BYfWQ158B5MS98NxyxajafTDV1I0GIDWGxtmwsb/LZpQxKVaAer2Smd92sC9fgaEOjOAJkoyeleNiOH1OT0lxmlvqHJ31WoA6Df9lO8B0yjqic8Mbp9/vHyX2ruF1MHF+DZX+gCwsNwdqTvXJhB7QZ0HQNKWsadrQ/uqoNjzNT6HOIaBf0rSUDCLRTzDU05Rv9aJrWAmcYipP/q6VlaVzk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(26005)(71200400001)(64756008)(8676002)(9686003)(66946007)(6506007)(44832011)(66556008)(66476007)(4326008)(33656002)(66446008)(41300700001)(53546011)(38070700005)(55016003)(478600001)(122000001)(86362001)(7696005)(83380400001)(38100700002)(186003)(5660300002)(2906002)(6916009)(54906003)(52536014)(8936002)(316002)(7416002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sqYt9oSsmX+b9VE9lUekdut+f4KSeFtr5XCsKMkmxB/BH20KysdvP900tXND?=
 =?us-ascii?Q?6cXB6CC8YhVCXGI5F/1FLDb2gw82Bcrv8TOZLGKhAEKzjBvv8sX50czUBTR9?=
 =?us-ascii?Q?AduD+VT804faA0IBeErlRO1wpqWELKJptqRP3yaVwL25+wM31OxXez4Rb8i8?=
 =?us-ascii?Q?GZ/Qp9WRLPgGBOBTiuOjOQoGgPPm8lRGWf6j1gLFTDgFwXgjUvCV+AuHTlUT?=
 =?us-ascii?Q?SkDMo5jfBkWA+qwyDqrnpPaomGDBgk9yAWXG1TTejQArQqIdFnQTguJnnpnh?=
 =?us-ascii?Q?z+MoY2a5TykULTTZTXGbsSLy23vCFZcxCgy79kMcyv7KGck4Vj/HxXWC0oCo?=
 =?us-ascii?Q?U/6qBIjhLAaIwGlzWvldBGOJur+syoOFJ1u61FNIG4PUnILjVaftL3hP0JDT?=
 =?us-ascii?Q?ncEPsXS/tcATZR8LkdKT5yfRvX8y5mlKhEmdnG9TZjtGjSJXHTPxE5vw/Pvp?=
 =?us-ascii?Q?LZ8fVlkplR0/8PBQLIo1/EkM9DiD770EsOxin+j+lxwgulfDHhOVVtl+LUlh?=
 =?us-ascii?Q?rqmoKy10Aw7kqp1md6nbp86w6gSArb/3/3Z9i2Jr3m7JeOixasZ+hM+7sKSi?=
 =?us-ascii?Q?y71TCWOcFSphl1lyShChbq2XJVfKehazjGYbrz/btdt8N/wMXU6wkvEW5BaW?=
 =?us-ascii?Q?oyJYeFg4yDRP+g1lVAEOAd8sZytBERvQ7lhby+UaTgL/vcZQ8M2oQWYLp/Nm?=
 =?us-ascii?Q?BPthrG7JHzwqRp/OYynEEw8VXyQWMV/IRybbkZ9rzA4QFpOYVhgHJpM89iUV?=
 =?us-ascii?Q?nSdahrE1FvG9L0iIaH9ikAf2KfJ00mgAxsiJig4VPh/OgZVtGZqslO6Ij1F2?=
 =?us-ascii?Q?7eqKKVB1Tvi1TeKLE/pErk38F3CCUSALP/EgBzL8J9Vr+MdGLU8Zj0Lwu80p?=
 =?us-ascii?Q?9YF0vQhab+6f5j3LGAV7fgE/5CSX+0h8Hq/aF8Ihr0XPsZGEmAttgyquYfUi?=
 =?us-ascii?Q?hjxjypknU1w9FphBAcr+SlNJiavV0MyDDL5BOLPPYmY4rTjUkOK1q1oYp0v/?=
 =?us-ascii?Q?FxTfX7CKiwLvpXNFiKRaaJTCcnCwYyCLiH7QIhWHV+XLH+jgXQVFys1cMA3C?=
 =?us-ascii?Q?f/w4PBtgvaw08tbnfsBnXvk1is7KZFWt+czqVm4z0/x3VA6DxzK0ppFw6uKu?=
 =?us-ascii?Q?wzwN3let5JyX0p1rUTQGq6JMHtT0S+luU7SB8iyAmgqxTm8lEwE2Llj6BDwh?=
 =?us-ascii?Q?bmfAG8w6VohVkbUtHUV+cvVQtQZWeAVgoeEjpUydXkuqKRTZdxB48M1TuzXm?=
 =?us-ascii?Q?YiVOO77em8g+UH7mCqQxPnUgN7OWmsUwz5lZCXTAHBGqz+cBy13FpMt2tyfS?=
 =?us-ascii?Q?mZJTNEQyLKb+k4EwAcBprVMRMBS5WzLIxGMJHIATtrG+9LJ1Ddbb/QFAE82I?=
 =?us-ascii?Q?rSQ3XzsXHGpbmG1RYk3T6Z96RpWdLSOGKSrTMq0t/ppkd1xpQs15PT8XlNAW?=
 =?us-ascii?Q?RniX9m+/BPDMI/t5c9jIRYTNLs7aIe0nJUAGWiHLFo06oMM78HRmDj41I3G/?=
 =?us-ascii?Q?9QKrGqjsO/PJFqw5vrqiJRhjjkZoSPUABxJYDj5lMr578A7R6SSJtFEKpQ1U?=
 =?us-ascii?Q?bpjIqGZE1WW6weC1vx1JGLb676403LeFVB5Erk/k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ce07da-b9f1-45d4-82d1-08da5a7cba33
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 09:41:37.2254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STsAGAiWcoyBtlR+d9W19DSFPGJn2dDKUlsNL3aCoht9rEzYbrAaBWRTrP7t5IjbKGqOcNdh5YhVQt/7+HGHSDSl5+6hqE6023PbQ3OB2mY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5911
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Thanks for your review!

On 28 June 2022 22:08 Andy Shevchenko wrote:
> On Tue, Jun 28, 2022 at 08:45:26PM +0100, Phil Edworthy wrote:
> > Yet another i2c controller from Renesas that is found on the RZ/V2M
> > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
>=20
> ...
>=20
> > +#include <linux/of_device.h>
>=20
> No user of this header.
>=20
> But missed mod_devicetable.h (Okay, for I2C drivers we usually rely on
> i2c.h to
> include it for us, but it's cleaner to include directly).
Ok

> > +#define rzv2m_i2c_priv_to_dev(p)	((p)->adap.dev.parent)
>=20
> It's longer than the actual expression. Why do you need this?!
Ok, no need for it

> > +static const struct bitrate_config bitrate_configs[] =3D {
> > +	[RZV2M_I2C_100K] =3D { 47, 3450 },
> > +	[RZV2M_I2C_400K] =3D { 52, 900},
>=20
> Missed space.
Ok

> > +	if (priv->iicb0wl > 0x3ff)
>=20
> GENMASK() ?
> Or (BIT(x) - 1) in case to tell that there is an HW limitation of x bits?
Ok, BIT makes sense here

> > +	if (priv->iicb0wh > 0x3ff)
>=20
> Ditto.
Ok

> > +	if (!last) {
>=20
> Why not positive conditional?
Ok

> > +static int rzv2m_i2c_send(struct rzv2m_i2c_priv *priv, struct i2c_msg
> *msg,
> > +			  unsigned int *count)
> > +{
> > +	unsigned int i;
> > +	int ret =3D 0;
>=20
> Redundant assignment, you may return 0 directly.
> Ditto for other similar cases in other functions.
Ok

> > +		ret =3D rzv2m_i2c_read_with_ACK(priv, &msg->buf[i],
> > +					      ((msg->len - 1) =3D=3D i));
>=20
> Too many parentheses.
Ok

> > +static int rzv2m_i2c_send_address(struct rzv2m_i2c_priv *priv,
> > +				  struct i2c_msg *msg)
> > +{
> > +	u32 addr;
> > +	int ret;
> > +
> > +	if (msg->flags & I2C_M_TEN) {
> > +		/* 10-bit address
> > +		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> > +		 *   addr_2: addr[7:0]
> > +		 */
> > +		addr =3D 0xf0 | ((msg->addr >> 7) & 0x06);
> > +		addr |=3D !!(msg->flags & I2C_M_RD);
> > +		/* Send 1st address(extend code) */
> > +		ret =3D rzv2m_i2c_write_with_ack(priv, addr);
>=20
> 	if (ret)
> 		return ret;
Ok


> > +	ret =3D rzv2m_i2c_send_address(priv, msg);
> > +	if (ret =3D=3D 0) {
>=20
> This is a bit confusing if it's only comparison with "no error code"
> condition.
> Use if (!ret) if there is no meaning of positive value. Same applies to
> other
> cases in the code.
>=20
> > +		if (read)
> > +			ret =3D rzv2m_i2c_receive(priv, msg, &count);
> > +		else
> > +			ret =3D rzv2m_i2c_send(priv, msg, &count);
> > +
> > +		if ((ret =3D=3D 0) && stop)
>=20
> Like here.
Sorry, I don't follow you. How is (ret =3D=3D 0) any different to (!ret) ?



> > +static const struct of_device_id rzv2m_i2c_ids[] =3D {
> > +	{ .compatible =3D "renesas,rzv2m-i2c", },
>=20
> Inner comma is not needed.
Ok

> > +	priv->clk =3D devm_clk_get(dev, NULL);
> > +	if (IS_ERR(priv->clk)) {
> > +		dev_err_probe(dev, PTR_ERR(priv->clk), "Can't get clock\n");
> > +		return PTR_ERR(priv->clk);
> > +	}
>=20
> Why not
>=20
> 	return dev_err_probe(...);
>=20
> ?
>=20
> Ditto for the rest cases like this.
Ok

> > +	adap->dev.of_node =3D dev->of_node;
>=20
> device_set_node()
Since we don't need to set dev->fwnode, why is device_set_node() any
better?


Thanks
Phil
