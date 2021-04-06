Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A847935527C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242018AbhDFLlU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:41:20 -0400
Received: from mail-vi1eur05on2087.outbound.protection.outlook.com ([40.107.21.87]:39972
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237938AbhDFLlU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:41:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nozUuHukmtNA5mujxEMO5d2Hw/iqZanhVgy0xsmpzbvPWgJT2j4dxev3NTfUebS/gnfaDCYaLaO9Ts5kE07+xk7d3cLi6Vr70pVw8sr3FFh+MGi2N1cZhxy1cy1v2416Vlh6dos3HVruvN8ymjQZUCyvrfALMCY1EUyR9WpIQWqKo3JV1G8Upv9QxjQTPO9V1u9HjIUvFzUZHHOl9DjYu6w72FwS7Sf06rR2NeWlpE1DiPeSjvOP2wPHylG+ZhAS5kwAPl+zY29BhlBFPUdih84uR8GYoUS6RaVPATIY1I8aFuhF3xB/h54IgbcNfHeM/lIYaQ4bW8kLRIMrZM9xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec8CVVVvwRgbkTIaFcCo+SuP95T4bELlc1P+PvKBTx4=;
 b=PkK448SteWsvM/hFD5tQ+iLEh2dZDriRKzb8obbvUuEx656ZVRMyeanPs3ayqnJHTYRNYZb6hoY6ReWVE0r6HUbFzIpEu7pm4pdqK6hII+p6YBnWleHke1IwJGCFiUC/PRYrqKyU1/M91UvDUxSCGqx09FfMaNz/rXFPeSDD4IGwN1ecgcgvwrt+z7EveIFXmaSJ7t3I+AuWidn6+aFJhV/TVQ5TcOiKhnOXTemm8GGVqmcvh4HrcQvM/GEAW9eLY0koKlTCKmuen25gu83y5ELLdPXh+EVup6EBFnvO5EkkGB5T7D4JTUaI+ZFB/UVi2Z9eQjBgQFdUNkBRCPJHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec8CVVVvwRgbkTIaFcCo+SuP95T4bELlc1P+PvKBTx4=;
 b=TMpOWi2FElSqa5HaqAKSNceS+Q2uVnMz8ur9zt0KIiMQbgKqbltC0e22cuK91UmbjtlpNZ7H+4vhFbmb7IfkmhdfH6ZRRSDd8uSfEcGHH4C7ErhQjGcVskJfaXhgXMEZT+iVoOPgB/Wj/XiYd/N6DYlQMKryYGnWDhnZ41XguMY=
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR04MB6677.eurprd04.prod.outlook.com (2603:10a6:20b:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 11:41:09 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:41:09 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2 14/18] i2c: imx-lpi2c: add edma mode support
Thread-Topic: [PATCH V2 14/18] i2c: imx-lpi2c: add edma mode support
Thread-Index: AQHXKti1TIPixlOVok2NxPlLHwmUeKqnXOoA
Date:   Tue, 6 Apr 2021 11:41:09 +0000
Message-ID: <AM6PR04MB5623BD8E4658926876EB8A74F3769@AM6PR04MB5623.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-15-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-15-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb306eb0-34f4-462b-630f-08d8f8f0df47
x-ms-traffictypediagnostic: AM6PR04MB6677:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB66778053E334E9B7A89196D3F3769@AM6PR04MB6677.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AAuZFj/vqOQxguF86hyMQxDYp21lcGqLyvzrCT+ObJk4jRilY/uznfFe0/zn5+GC6iYWI4tyBn58WH7K7/I3orAbhceWlcCbJd45WAZYx8RjjeMWV1oewuG0qiG4YQzVm4xxQdgPzqjg2avCgUNHytu/NpPNTNoiTBwp3Q0F2PUWJqwrPtl90PlPiht/SLJduixNG2Rl0oTNPmy+ge2EUtXBFfs2H1rcIonpjPrhPuc04DIATNgijwerZQrW44HX+VJkR5z9vUrgIM/xRTSDMhMw55vPmig8bdnJzppPFgKkm0ENfbENlvA0EhaeJkiFv/0Dyjqm0lQ9hKXIXPOV+zSb1kzbFQ8/Ur8QDXmmHIbH1Pw2fnQqQBUkNFqcQdDafK7qSy2z47zhTANB4cKG5FFNEDU05NW6/4QoNbT4zXJeAoRVl9rpPhitQm5IA12hn3mGciVKOjzu1v4pKVusbrMH+OaQ/xxr0p2p4leH1ymAPnLYmRRmR7G9eIgtuhA6H2El0csx0MC0GOuEaCjOv+mynr4J++u9/kIMoN5i/tMJWrqMPrW5yU5iGDN/1RzYDAtXxcyMG94cAsXpC5lk5n1Qb9t4Ue3L6u3oKq6erCFLqvDJQOWpFLWzLtMWcs3Yo2/VJwnnuA0rqT/gtG+oxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(498600001)(99936003)(26005)(6506007)(53546011)(83380400001)(33656002)(54906003)(86362001)(4326008)(38100700001)(8936002)(66556008)(30864003)(110136005)(8676002)(55016002)(9686003)(66616009)(66446008)(66476007)(76116006)(2906002)(64756008)(52536014)(66946007)(5660300002)(7696005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?uZB0mpyO8Q/FShAkE8dzm/UK4ljbEu2y3sc6ow49vI9dX+5qc0Cd0toK2xI2?=
 =?us-ascii?Q?KBl+2ScWtcgzXcO5hZ9TFo1pnspq2JFrRA94L9BoUea5bGCZAHAQA+e7oGME?=
 =?us-ascii?Q?Zo+rDk8+sh+3RpxKQZTsVetmMQhwOY7bUIHohRoYZwO3JnIYH+2zevLWtgqM?=
 =?us-ascii?Q?tPQCr6Ia94HcSN6GxmcAej2OtxnBwFGH9Po4jEklrP9EgjDr9ZXLUf2aQOLq?=
 =?us-ascii?Q?yM1UgOUEkRptLexc3hBJ0b1xu49RpBsq2092OFoa6cSO7oyrBzgjrlMSUF5G?=
 =?us-ascii?Q?wOLxccGaJcAmVS90uhVj1DGZgSwvsLUYUqPvkZCfHE0p9WHlC6+y8E3XeBgy?=
 =?us-ascii?Q?6t+9tcUEn4vec0XNZ1mmYagI/bPDkfcxWt9DyqUEIfzAw2qoIyj9WS3SP/DX?=
 =?us-ascii?Q?iKVJyZqTIrPmlfSszgCJAttsutssZZsYhcSzRdtN4m1K6ZFw7C7ppNr7XBkm?=
 =?us-ascii?Q?PS0qf9n5U9uktAaF/K+WIND6ZRaGpHJ6YIk5VDCuj7k2+SIrlTWr2304B3kt?=
 =?us-ascii?Q?YujPJGfaM7CWRB6XIY+duVcEsh/PJWZHB+wELTetz16GR37IUwUAewIphbJn?=
 =?us-ascii?Q?ENSEzUmCqNKII3BcbfXg3iFCeFirlV8r3JlvwptvVGIjvri18Dywf0f8tKxA?=
 =?us-ascii?Q?w4LE9Wv+o8AB8/12Qm9yRPGoBH1aa2yQfN4tMue6mohp38/SnKLldQcFA3o8?=
 =?us-ascii?Q?5LqaZRsGhdWZXrcHTAbn6R3nv4CI8lep0G4Fnj8Y82w5LIxMO9FWwmiSxBE/?=
 =?us-ascii?Q?iYl85fyOt9s6ac+WDSaDwOnjD1I7vjFtCMfBiR+bA/lk+OegmLmk/Svv8woL?=
 =?us-ascii?Q?skyjrDCVwkcZtghVl3tiSCGoxFYqba4b9TFti3GAlldoJZEbY0GAVJKEzWUa?=
 =?us-ascii?Q?QprkXHnOvk1Uyl3lxxC7DVTvLsLadnxIFrtFXxmdHFg+Ks3V5lwWC61gbmHg?=
 =?us-ascii?Q?4QEtpr6p4bckw1uCHk/UNqey3lvPp6yDvLRxth15ZrLHksz68j8QAmW3YMqa?=
 =?us-ascii?Q?jI7GbO1JjIXRb49KeCPjrpH3aIbJ9rPBqplS66xGqIkrDmDbFOQ3zbj/Q64E?=
 =?us-ascii?Q?IAYxCyFFc5/kQGqwozvlXKjgZum3nJmV4LO1JCt0qRZwCAaywkylOlFyPLiq?=
 =?us-ascii?Q?X3wEPYkvzhYurNQfZvLA3YOGN+OhmiVV90xSvI+QuDjjNT8F1gIR7JHSwMdo?=
 =?us-ascii?Q?Zsz3LqSg44cA5LzxPvW690rTeT4LAYbpbtdrFNHng7ihZRzZ5SgaXQXJTZbf?=
 =?us-ascii?Q?8JQHcCQwT5WicLUnOZq2ZJYWpWZztM62TrDYNiUQHBczISdy+q06AcyerSVt?=
 =?us-ascii?Q?ukI=3D?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_010A_01D72B1C.C8B961B0"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb306eb0-34f4-462b-630f-08d8f8f0df47
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 11:41:09.4142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVcHL/4ylg+XhMVuBrGMTGi9TldTibzt17c/mDXFzPeXkywbPq5C/ABI237zRkm3a0BpHAGuFin1VxeugEzGIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6677
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

------=_NextPart_000_010A_01D72B1C.C8B961B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Clark Wang <xiaoning.wang@nxp.com>
> Sent: Tuesday, April 6, 2021 19:33
> To: Aisheng Dong <aisheng.dong@nxp.com>; robh+dt@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com
> Cc: kernel@pengutronix.de; dl-linux-imx <linux-imx@nxp.com>; linux-
> i2c@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [PATCH V2 14/18] i2c: imx-lpi2c: add edma mode support
> 
> Add eDMA receive and send mode support.
> Support to read and write data larger than 256 bytes in one frame.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Reviewed-by: Li Jun <jun.li@nxp.com>
> ---
> V2 changes:
>  - change marco I2C_USE_PIO to DMA_ERR_I2C_USE_PIO. It is a error code
> defined
>    in this driver to

It is an error code defined in this driver to identify the DMA sending
error, then driver will try to use PIO to send data.

Best Regards,
Clark Wang
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 290 ++++++++++++++++++++++++++++-
>  1 file changed, 288 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
b/drivers/i2c/busses/i2c-imx-
> lpi2c.c
> index c2f8e49660ea..d1a56d52f19f 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -8,6 +8,8 @@
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/i2c.h>
> @@ -31,6 +33,7 @@
>  #define LPI2C_MCR	0x10	/* i2c contrl register */
>  #define LPI2C_MSR	0x14	/* i2c status register */
>  #define LPI2C_MIER	0x18	/* i2c interrupt enable */
> +#define LPI2C_MDER	0x1C	/* i2c DMA enable */
>  #define LPI2C_MCFGR0	0x20	/* i2c master configuration */
>  #define LPI2C_MCFGR1	0x24	/* i2c master configuration */
>  #define LPI2C_MCFGR2	0x28	/* i2c master configuration */
> @@ -72,11 +75,15 @@
>  #define MCFGR1_AUTOSTOP	BIT(8)
>  #define MCFGR1_IGNACK	BIT(9)
>  #define MRDR_RXEMPTY	BIT(14)
> +#define MDER_TDDE	BIT(0)
> +#define MDER_RDDE	BIT(1)
> 
>  #define I2C_CLK_RATIO	24 / 59
>  #define CHUNK_DATA	256
> 
>  #define I2C_PM_TIMEOUT		1000 /* ms */
> +#define I2C_DMA_THRESHOLD	16 /* bytes */
> +#define DMA_ERR_I2C_USE_PIO	(-150)
> 
>  enum lpi2c_imx_mode {
>  	STANDARD,	/* <=100Kbps */
> @@ -95,6 +102,7 @@ enum lpi2c_imx_pincfg {
> 
>  struct lpi2c_imx_struct {
>  	struct i2c_adapter	adapter;
> +	resource_size_t		phy_addr;
>  	int			irq;
>  	struct clk		*clk_per;
>  	struct clk		*clk_ipg;
> @@ -114,6 +122,17 @@ struct lpi2c_imx_struct {
>  	struct pinctrl *pinctrl;
>  	struct pinctrl_state *pinctrl_pins_default;
>  	struct pinctrl_state *pinctrl_pins_gpio;
> +
> +	bool			can_use_dma;
> +	bool			using_dma;
> +	bool			xferred;
> +	struct i2c_msg		*msg;
> +	dma_addr_t		dma_addr;
> +	struct dma_chan		*dma_tx;
> +	struct dma_chan		*dma_rx;
> +	enum dma_data_direction dma_direction;
> +	u8			*dma_buf;
> +	unsigned int		dma_len;
>  };
> 
>  static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx, @@
-289,6
> +308,9 @@ static int lpi2c_imx_master_enable(struct lpi2c_imx_struct
> *lpi2c_imx)
>  	if (ret)
>  		goto rpm_put;
> 
> +	if (lpi2c_imx->can_use_dma)
> +		writel(MDER_TDDE | MDER_RDDE, lpi2c_imx->base +
> LPI2C_MDER);
> +
>  	temp = readl(lpi2c_imx->base + LPI2C_MCR);
>  	temp |= MCR_MEN;
>  	writel(temp, lpi2c_imx->base + LPI2C_MCR); @@ -462,6 +484,154 @@
> static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
>  	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);  }
> 
> +static void lpi2c_dma_unmap(struct lpi2c_imx_struct *lpi2c_imx) {
> +	struct dma_chan *chan = lpi2c_imx->dma_direction ==
> DMA_FROM_DEVICE
> +				? lpi2c_imx->dma_rx : lpi2c_imx->dma_tx;
> +
> +	dma_unmap_single(chan->device->dev, lpi2c_imx->dma_addr,
> +			 lpi2c_imx->dma_len, lpi2c_imx->dma_direction);
> +
> +	lpi2c_imx->dma_direction = DMA_NONE;
> +}
> +
> +static void lpi2c_cleanup_dma(struct lpi2c_imx_struct *lpi2c_imx) {
> +	if (lpi2c_imx->dma_direction == DMA_NONE)
> +		return;
> +	else if (lpi2c_imx->dma_direction == DMA_FROM_DEVICE)
> +		dmaengine_terminate_all(lpi2c_imx->dma_rx);
> +	else if (lpi2c_imx->dma_direction == DMA_TO_DEVICE)
> +		dmaengine_terminate_all(lpi2c_imx->dma_tx);
> +
> +	lpi2c_dma_unmap(lpi2c_imx);
> +}
> +
> +static void lpi2c_dma_callback(void *data) {
> +	struct lpi2c_imx_struct *lpi2c_imx = (struct lpi2c_imx_struct
*)data;
> +
> +	lpi2c_dma_unmap(lpi2c_imx);
> +	writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
> +	lpi2c_imx->xferred = true;
> +
> +	complete(&lpi2c_imx->complete);
> +}
> +
> +static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx,
> +			   struct i2c_msg *msg)
> +{
> +	bool read = msg->flags & I2C_M_RD;
> +	enum dma_data_direction dir = read ? DMA_FROM_DEVICE :
> DMA_TO_DEVICE;
> +	struct dma_chan *chan = read ? lpi2c_imx->dma_rx :
lpi2c_imx->dma_tx;
> +	struct dma_async_tx_descriptor *txdesc;
> +	dma_cookie_t cookie;
> +
> +	lpi2c_imx->dma_len = read ? msg->len - 1 : msg->len;
> +	lpi2c_imx->msg = msg;
> +	lpi2c_imx->dma_direction = dir;
> +
> +	if (IS_ERR(chan))
> +		return PTR_ERR(chan);
> +
> +	lpi2c_imx->dma_addr = dma_map_single(chan->device->dev,
> +					     lpi2c_imx->dma_buf,
> +					     lpi2c_imx->dma_len, dir);
> +	if (dma_mapping_error(chan->device->dev, lpi2c_imx->dma_addr)) {
> +		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use
pio\n");
> +		return -EINVAL;
> +	}
> +
> +	txdesc = dmaengine_prep_slave_single(chan, lpi2c_imx->dma_addr,
> +					lpi2c_imx->dma_len, read ?
> +					DMA_DEV_TO_MEM :
> DMA_MEM_TO_DEV,
> +					DMA_PREP_INTERRUPT |
> DMA_CTRL_ACK);
> +	if (!txdesc) {
> +		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed,
> use pio\n");
> +		lpi2c_cleanup_dma(lpi2c_imx);
> +		return -EINVAL;
> +	}
> +
> +	reinit_completion(&lpi2c_imx->complete);
> +	txdesc->callback = lpi2c_dma_callback;
> +	txdesc->callback_param = (void *)lpi2c_imx;
> +
> +	cookie = dmaengine_submit(txdesc);
> +	if (dma_submit_error(cookie)) {
> +		dev_err(&lpi2c_imx->adapter.dev, "submitting dma failed, use
> pio\n");
> +		lpi2c_cleanup_dma(lpi2c_imx);
> +		return -EINVAL;
> +	}
> +
> +	lpi2c_imx_intctrl(lpi2c_imx, MIER_NDIE);
> +
> +	dma_async_issue_pending(chan);
> +
> +	return 0;
> +}
> +
> +static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct
> +i2c_msg *msg) {
> +	if (!lpi2c_imx->can_use_dma)
> +		return false;
> +
> +	if (msg->len < I2C_DMA_THRESHOLD)
> +		return false;
> +
> +	return true;
> +}
> +
> +static int lpi2c_imx_dma_push_rx_cmd(struct lpi2c_imx_struct *lpi2c_imx,
> +				 struct i2c_msg *msg)
> +{
> +	unsigned int temp, rx_remain;
> +	unsigned long orig_jiffies = jiffies;
> +
> +	if ((msg->flags & I2C_M_RD)) {
> +		rx_remain = msg->len;
> +		do {
> +			temp = rx_remain > CHUNK_DATA ?
> +				CHUNK_DATA - 1 : rx_remain - 1;
> +			temp |= (RECV_DATA << 8);
> +			while ((readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff)
>
> (lpi2c_imx->rxfifosize >> 1)) {
> +				if (time_after(jiffies, orig_jiffies +
> msecs_to_jiffies(1000))) {
> +					dev_dbg(&lpi2c_imx->adapter.dev,
> "txfifo empty timeout\n");
> +					if (lpi2c_imx-
> >adapter.bus_recovery_info)
> +						i2c_recover_bus(&lpi2c_imx-
> >adapter);
> +					return -ETIMEDOUT;
> +				}
> +				schedule();
> +			}
> +			writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> +			rx_remain = rx_remain - (temp & 0xff) - 1;
> +		} while (rx_remain > 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int lpi2c_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
> +			   struct i2c_msg *msg)
> +{
> +	int result;
> +
> +	result = lpi2c_dma_submit(lpi2c_imx, msg);
> +	if (!result) {
> +		result = lpi2c_imx_dma_push_rx_cmd(lpi2c_imx, msg);
> +		if (result)
> +			return result;
> +		result = lpi2c_imx_msg_complete(lpi2c_imx);
> +		return result;
> +	}
> +
> +	/* DMA xfer failed, try to use PIO, clean up dma things */
> +	i2c_put_dma_safe_msg_buf(lpi2c_imx->dma_buf, lpi2c_imx->msg,
> +				 lpi2c_imx->xferred);
> +	lpi2c_cleanup_dma(lpi2c_imx);
> +
> +	return DMA_ERR_I2C_USE_PIO;
> +}
> +
>  static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>  			  struct i2c_msg *msgs, int num)
>  {
> @@ -474,6 +644,9 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>  		return result;
> 
>  	for (i = 0; i < num; i++) {
> +		lpi2c_imx->xferred = false;
> +		lpi2c_imx->using_dma = false;
> +
>  		result = lpi2c_imx_start(lpi2c_imx, &msgs[i]);
>  		if (result)
>  			goto disable;
> @@ -482,9 +655,24 @@ static int lpi2c_imx_xfer(struct i2c_adapter
*adapter,
>  		if (num == 1 && msgs[0].len == 0)
>  			goto stop;
> 
> +		if (is_use_dma(lpi2c_imx, &msgs[i])) {
> +			lpi2c_imx->using_dma = true;
> +
> +			writel(0x1, lpi2c_imx->base + LPI2C_MFCR);
> +
> +			lpi2c_imx->dma_buf =
> i2c_get_dma_safe_msg_buf(&msgs[i],
> +
> I2C_DMA_THRESHOLD);
> +			if (lpi2c_imx->dma_buf) {
> +				result = lpi2c_dma_xfer(lpi2c_imx,
&msgs[i]);
> +				if (result != DMA_ERR_I2C_USE_PIO)
> +					goto stop;
> +			}
> +		}
> +
> +		lpi2c_imx->using_dma = false;
>  		lpi2c_imx->delivered = 0;
>  		lpi2c_imx->msglen = msgs[i].len;
> -		init_completion(&lpi2c_imx->complete);
> +		reinit_completion(&lpi2c_imx->complete);
> 
>  		if (msgs[i].flags & I2C_M_RD)
>  			lpi2c_imx_read(lpi2c_imx, &msgs[i]); @@ -503,7
> +691,16 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>  	}
> 
>  stop:
> -	lpi2c_imx_stop(lpi2c_imx);
> +	if (!lpi2c_imx->using_dma)
> +		lpi2c_imx_stop(lpi2c_imx);
> +	else {
> +		i2c_put_dma_safe_msg_buf(lpi2c_imx->dma_buf, lpi2c_imx-
> >msg,
> +					 lpi2c_imx->xferred);
> +		if (result) {
> +			lpi2c_cleanup_dma(lpi2c_imx);
> +			writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
> +		}
> +	}
> 
>  	temp = readl(lpi2c_imx->base + LPI2C_MSR);
>  	if ((temp & MSR_NDF) && !result)
> @@ -528,6 +725,10 @@ static irqreturn_t lpi2c_imx_isr(int irq, void
*dev_id)
>  	temp = readl(lpi2c_imx->base + LPI2C_MSR);
> 
>  	if (temp & MSR_NDF) {
> +		if (lpi2c_imx->using_dma) {
> +			lpi2c_cleanup_dma(lpi2c_imx);
> +			writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
> +		}
>  		complete(&lpi2c_imx->complete);
>  		goto ret;
>  	}
> @@ -623,6 +824,77 @@ static const struct of_device_id lpi2c_imx_of_match[]
> = {  };  MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
> 
> +static void lpi2c_dma_exit(struct lpi2c_imx_struct *lpi2c_imx) {
> +	if (lpi2c_imx->dma_rx) {
> +		dma_release_channel(lpi2c_imx->dma_rx);
> +		lpi2c_imx->dma_rx = NULL;
> +	}
> +
> +	if (lpi2c_imx->dma_tx) {
> +		dma_release_channel(lpi2c_imx->dma_tx);
> +		lpi2c_imx->dma_tx = NULL;
> +	}
> +}
> +
> +static int lpi2c_dma_init(struct device *dev,
> +			  struct lpi2c_imx_struct *lpi2c_imx) {
> +	int ret;
> +	struct dma_slave_config dma_sconfig;
> +
> +	/* Prepare for TX DMA: */
> +	lpi2c_imx->dma_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(lpi2c_imx->dma_tx)) {
> +		ret = PTR_ERR(lpi2c_imx->dma_tx);
> +		dev_err(dev, "can't get the TX DMA channel, error %d!\n",
ret);
> +		lpi2c_imx->dma_tx = NULL;
> +		goto err;
> +	}
> +
> +	dma_sconfig.dst_addr = lpi2c_imx->phy_addr + LPI2C_MTDR;
> +	dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
> +	dma_sconfig.dst_maxburst = 1;
> +	dma_sconfig.direction = DMA_MEM_TO_DEV;
> +	ret = dmaengine_slave_config(lpi2c_imx->dma_tx, &dma_sconfig);
> +	if (ret < 0) {
> +		dev_err(dev, "can't configure tx channel (%d)\n", ret);
> +		goto fail_tx;
> +	}
> +
> +	/* Prepare for RX DMA: */
> +	lpi2c_imx->dma_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(lpi2c_imx->dma_rx)) {
> +		ret = PTR_ERR(lpi2c_imx->dma_rx);
> +		dev_err(dev, "can't get the RX DMA channel, error %d\n",
ret);
> +		lpi2c_imx->dma_rx = NULL;
> +		goto fail_tx;
> +	}
> +
> +	dma_sconfig.src_addr = lpi2c_imx->phy_addr + LPI2C_MRDR;
> +	dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
> +	dma_sconfig.src_maxburst = 1;
> +	dma_sconfig.direction = DMA_DEV_TO_MEM;
> +	ret = dmaengine_slave_config(lpi2c_imx->dma_rx, &dma_sconfig);
> +	if (ret < 0) {
> +		dev_err(dev, "can't configure rx channel (%d)\n", ret);
> +		goto fail_rx;
> +	}
> +
> +	lpi2c_imx->can_use_dma = true;
> +	lpi2c_imx->using_dma = false;
> +
> +	return 0;
> +fail_rx:
> +	dma_release_channel(lpi2c_imx->dma_rx);
> +fail_tx:
> +	dma_release_channel(lpi2c_imx->dma_tx);
> +err:
> +	lpi2c_dma_exit(lpi2c_imx);
> +	lpi2c_imx->can_use_dma = false;
> +	return ret;
> +}
> +
>  static int lpi2c_imx_clocks_prepare(struct lpi2c_imx_struct *lpi2c_imx)
{
>  	int ret = 0;
> @@ -656,15 +928,18 @@ static int lpi2c_imx_probe(struct platform_device
> *pdev)
>  	struct lpi2c_imx_struct *lpi2c_imx;
>  	unsigned int temp;
>  	int ret;
> +	struct resource *res;
> 
>  	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx),
GFP_KERNEL);
>  	if (!lpi2c_imx)
>  		return -ENOMEM;
> 
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	lpi2c_imx->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(lpi2c_imx->base))
>  		return PTR_ERR(lpi2c_imx->base);
> 
> +	lpi2c_imx->phy_addr = (dma_addr_t)res->start;
>  	lpi2c_imx->irq = platform_get_irq(pdev, 0);
>  	if (lpi2c_imx->irq < 0)
>  		return lpi2c_imx->irq;
> @@ -716,6 +991,17 @@ static int lpi2c_imx_probe(struct platform_device
> *pdev)
>  	if (ret == -EPROBE_DEFER)
>  		goto rpm_disable;
> 
> +	/* Init DMA */
> +	lpi2c_imx->dma_direction = DMA_NONE;
> +	ret = lpi2c_dma_init(&pdev->dev, lpi2c_imx);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "dma setup error %d, use
> pio\n", ret);
> +		if (ret == -EPROBE_DEFER)
> +			goto rpm_disable;
> +	}
> +
> +	init_completion(&lpi2c_imx->complete);
> +
>  	ret = i2c_add_adapter(&lpi2c_imx->adapter);
>  	if (ret)
>  		goto rpm_disable;
> --
> 2.25.1


------=_NextPart_000_010A_01D72B1C.C8B961B0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
U2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNv
bT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0
aW9uUG9pbnSGL2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Js
hi9odHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsG
AQUFBwEBBIIBAjCB/zCBuwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2Ul
MjBDQSUyMDUsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENO
PUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29i
amVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cu
cGtpLm54cC5jb20vY2VydHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDBHBgNVHREEQDA+oCUGCisG
AQQBgjcUAgOgFwwVeGlhb25pbmcud2FuZ0BueHAuY29tgRV4aWFvbmluZy53YW5nQG54cC5jb20w
DQYJKoZIhvcNAQELBQADggEBAK4JPoIkTbfuhwLtQ9Fm320K9JnOD+UvIk7UY5A58pq540ABcjCz
LggHvY+pE9m6IdsLfPL0lj4rrK660DRFM7k6XQEoJXjOBlZ+FGi7oTGL+VVi4+TYQzwPUMr8Ukg1
EBMzKb84Kh3oA96THluC3OFR3DbU/3NJsMYI6hIpvL4G+MQS0NZiEOf0CW73kreekaWUzCcnDbjr
9c8a1dI966lFSHr+2MAjj1iiNou1MXi3YA0jTy2qW78wdbtk/UbWkFIp11SyqA6Va6i96c7WgohG
zzxofRhw1yf5mb0SSjrbcFvLWRyx5iVZIhapdbztkYGYJiroxzI+ndpbztisjkYwggfxMIIG2aAD
AgECAhMtAABZfNGGA83aLDAMAAAAAFl8MA0GCSqGSIb3DQEBCwUAMIG2MRwwGgYDVQQDDBNOWFAg
RW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcM
CUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTET
MBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwwHhcN
MTkxMDI5MTM1MDU4WhcNMjExMDI4MTM1MDU4WjCBmjETMBEGCgmSJomT8ixkARkWA2NvbTETMBEG
CgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA3diaTEMMAoGA1UECxMDTlhQMQswCQYD
VQQLEwJDTjEWMBQGA1UECxMNTWFuYWdlZCBVc2VyczETMBEGA1UECxMKRGV2ZWxvcGVyczERMA8G
A1UEAxMIbnhmNDc3NDkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZY70u6L2tkQw7
9PyXIwnCQZGWP+8gSezFvuegmg10bDVMZux1jQKY48+p9oQeUBOfM9652qP5o4VTqDCR4MBxbtB7
CXxyjzKOdVxraRqx+xibX12lcs4LmCtz3JeEduJkKJ7W+QJtTbqtF6okCUCQRT/vF/BqUyfNyVs6
Mexrp1Lj4Yv841rbsVKC6k3jdt1pqi/0YZscxs7rqP5VsvFcK1der8zrQ/98AbMMjoagsu+nq64x
xPly7BcBfjUMTlw2PsL5viDocyLeVtW22VInObVN2bvFKdtkQEliZtoBKVwevOx1UMYis/yAbqhE
x+7g2Z/59jqDaZSy7SOxigvhAgMBAAGjggQQMIIEDDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3
FQiFgsB+gY70VYbthTiC65lLmpJWP4Xmim6EteF+AgFkAgE6MBMGA1UdJQQMMAoGCCsGAQUFBwME
MA4GA1UdDwEB/wQEAwIFIDAMBgNVHRMBAf8EAjAAMBsGCSsGAQQBgjcVCgQOMAwwCgYIKwYBBQUH
AwQwgZQGCSqGSIb3DQEJDwSBhjCBgzALBglghkgBZQMEASowCwYJYIZIAWUDBAEtMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEARkwCwYJYIZIAWUDBAECMAsGCWCGSAFlAwQBBTAKBggqhkiG9w0DBzAH
BgUrDgMCBzAOBggqhkiG9w0DAgICAIAwDgYIKoZIhvcNAwQCAgIAMB0GA1UdDgQWBBSZJY1p6Y56
X4YAWIozHW4aGPBzZDAfBgNVHSMEGDAWgBRYlWDuTnTvZSKqve0ZqSt6jhedBzCCAUYGA1UdHwSC
AT0wggE5MIIBNaCCATGgggEthoHIbGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1
LENOPW5sYW1zcGtpMDAwNSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2Vy
dmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jZXJ0aWZpY2F0ZVJl
dm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSGL2h0dHA6
Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Jshi9odHRwOi8vd3d3LnBr
aS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsGAQUFBwEBBIIBAjCB/zCB
uwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2UlMjBDQSUyMDUsQ049QUlB
LENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24s
REM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNzPWNlcnRp
ZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY2Vy
dHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDBHBgNVHREEQDA+oCUGCisGAQQBgjcUAgOgFwwVeGlh
b25pbmcud2FuZ0BueHAuY29tgRV4aWFvbmluZy53YW5nQG54cC5jb20wDQYJKoZIhvcNAQELBQAD
ggEBAEH+a5BarGYCUuH4P4sFJkrA7Y1U1aWb2nxNOPDARJLTwdEyMP6pPY0Bm7AyypW60HlI3Z4I
eP6NiMibW55/xz5EEcHxOrbYFmPyLY9twXLluCHnpZYT3NrDCD9dbOhUeZbDB1FXG93zfMJ8zzL4
9njRn5J6mcLiHkUpVRacp9susO1zN3uzp8TXCHy/y483CE6g1qUijUyiTPlAT9gz7xvyxAhTmrhH
8Fue00PWfK0B7zzjd1b0Da2nWFZXk4IsYJeyt+RTWC07VscWFiJ3avbgN0kaCswkvB1f6DVOqDRx
r5hHoNADBEcsMNdQNRVu2ospazEVq8wtXPTB7Ihf564xggTDMIIEvwIBATCBzjCBtjEcMBoGA1UE
AwwTTlhQIEVudGVycHJpc2UgQ0EgNTELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIw
EAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZ
FgN3YmkxEzARBgoJkiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYT
Ak5MAhMtAABZfUBCujlfjY1jAAAAAFl9MA0GCWCGSAFlAwQCAQUAoIICxTAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTA0MDYxMTQxMDVaMC8GCSqGSIb3DQEJBDEi
BCC801do4kSUgpPv4ZEW80whOvWbyNDtG4r1uwvJ6hZq2TCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
CWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDALBglghkgBZQMEAgEwCwYJYIZIAWUDBAIDMAsGCWCGSAFl
AwQCAjAHBgUrDgMCGjCB3wYJKwYBBAGCNxAEMYHRMIHOMIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJw
cmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRo
b3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTETMBEGCgmS
JomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0AAFl80YYD
zdosMAwAAAAAWXwwgeEGCyqGSIb3DQEJEAILMYHRoIHOMIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJw
cmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRo
b3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTETMBEGCgmS
JomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0AAFl80YYD
zdosMAwAAAAAWXwwDQYJKoZIhvcNAQEBBQAEggEAgo5+29Xsa5gf/pXraHSAvIqvSbstgK7GEn2a
Qr1GKkPfQ/C3u2iLYlFihMTdPanNm1gTdUYgsDNiVMgbt41q5tHZgv6N7J2HclhATnhFDQeLvGU8
hrc0aB7fY/EjUNmhoCN6+GJE1J+9nGtXe71EBOCRwKwRPsD/m1fA+FdXDZK57YswmDg9Xx1DyI6o
1Hf0zwwG9fV3JnSKIRFJICyNw11BXMd9fGByqv6JGLilo6S2zpizF3vWZRy1N6hg4pFDmAOChNhs
aaIivfH0G7Jy2UcBEhaOv4VsqyLT9l5exyajPKK7Nb2kHwlAqs+NTlQb7bpitFAC1JZXQo4cPhJ7
swAAAAAAAA==

------=_NextPart_000_010A_01D72B1C.C8B961B0--
