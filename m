Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7331E87567
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 11:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405888AbfHIJR1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 05:17:27 -0400
Received: from mail-eopbgr00125.outbound.protection.outlook.com ([40.107.0.125]:44356
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726091AbfHIJR0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 05:17:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZGes6YkaDA9CxiLIbFpVpnumctNG40kPndcKj8KACoZJ4UkJBiUXRO8+b8X3q0hNJSnS037dTZy8yaHN9ItMwl0qLgpSn6HkrkrmigRvyBvigLRhlfPX6AVzx7pJjixGslccD33bycK8N/GN6Ht22Ij4vZmfRhJ0k7XkWgiSR1s5A9IPETVChF4QboJZ9et8G+nhIUgOwBSvOdX39wrGffYquRIATsHnltOhecUgatItq4oNz1NjC76ANlKIs4EhczDo6I5byVIw30G8xvjIASZsyYM7gGTmXPfwIrKScTl8dk/ZIcva3lpLtMVlOwrI1Lhag6r5qpe6Z0xBdbihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAqRELVB8yT7+7/FZ7mpmGlbX4a1mTNh+VX7hMpZWsY=;
 b=evUwGZcdXPyI5rmRynXk6OgQF1pEaA2lR6BFPrzfMlVGqKA4OwPgLAb8fn/vRRy5DSsagHUd0rFBmkgww37OfY+KuRkkIHAehsX/4vB6LWPSfJZ1MRULOZZND1s+YEEHkQPPE2M+jWTBul223lYWTHDI06wMyvWTYtB0yrcuONhWnAdU6cJukC1mAergL6lNSQ1D/l7+OB0rbvbEszz0OOemX+rQgpBQ1HGY1MZ7QcS+BXjxszZrhQ9APcHs4cw3g2wbiWLja2dTZtb9X3XBRwbLjcGncxvRHHsMt0lUMnwRFfxaO87R8R2Ay7rsqYhbA+rzqHxOp+jVoRnrleY4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAqRELVB8yT7+7/FZ7mpmGlbX4a1mTNh+VX7hMpZWsY=;
 b=I2bEgodK+nicjAcoXyj6kfVyTF825Yb0MJmxVQ/sw3u+s+VKQ7H5HQzQFzyeSlOfYMS47s4Bar66Y0vV4wxlq9dn8aw1kNui475rSh9c14ZqRGFsSItHD7/1Q16vXCUmZubUeH2BJ8lSv5wBepmljIbbqBgQd0DNkJHsShoD/qs=
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com (20.178.107.151) by
 DB7PR07MB6123.eurprd07.prod.outlook.com (20.178.108.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Fri, 9 Aug 2019 09:17:18 +0000
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02]) by DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02%6]) with mapi id 15.20.2157.011; Fri, 9 Aug 2019
 09:17:18 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v2] i2c: axxia: support slave mode
Thread-Topic: [PATCH v2] i2c: axxia: support slave mode
Thread-Index: AQHVTpM9X4/5goKkcEOQmQztA/8iKw==
Date:   Fri, 9 Aug 2019 09:17:17 +0000
Message-ID: <20190809091709.GA24838@localhost.localdomain>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::28) To DB7PR07MB6042.eurprd07.prod.outlook.com
 (2603:10a6:10:8e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aff8f320-6d7c-4a6f-9d02-08d71caa6017
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR07MB6123;
x-ms-traffictypediagnostic: DB7PR07MB6123:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR07MB6123777D3B114E0763562C2FEFD60@DB7PR07MB6123.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(199004)(189003)(86362001)(256004)(71200400001)(4326008)(1076003)(9686003)(14454004)(66946007)(386003)(5660300002)(71190400001)(6512007)(7736002)(6486002)(6506007)(53936002)(64756008)(66446008)(305945005)(26005)(6916009)(14444005)(52116002)(478600001)(316002)(102836004)(99286004)(486006)(476003)(66556008)(107886003)(54906003)(25786009)(33656002)(8936002)(81156014)(2906002)(66476007)(3846002)(66066001)(6436002)(186003)(8676002)(61506002)(6116002)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:DB7PR07MB6123;H:DB7PR07MB6042.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /QA2uTnAcmNaU3MQY30YjJ5exttbpLXJF3O0of2NbHqcyk0WrZDYnhtchLXZ24RrGV5lOMJp3shRw184YnpmE8AqAosP/F16aZ/9RefpmpYtWj7w/IsCipd2fMMIHOiCEgxWrBIK1do55FeqH0tZTl1UNPwnAkBjpJCnMwoZwXu89NWxR+ss5Q7RSDs1p+QOc3you3r27GvdqPHSYnwn4vRdPrXwJe7e5g6fKw/mPlycV6AEfIUokN+PbX6h+6Lhi91pJ5uZU5Zb+ZbDm9qPQHdKmblqXqOtzmZG0yyUnrDy0KXJitG2KZyZ+BTsTd55JaOy/YVQL943GktrkV8Dub2lsatDUX3MPeUDA8nvuNSl5JFuDqpW2Ir3yoghGqNPZWlkw1bZmBr0rvV7sBG5M8TPhA0u88nAxtMgVuOLPsQ=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3C40C622DCA39749B983F4B3D6D238E4@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff8f320-6d7c-4a6f-9d02-08d71caa6017
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 09:17:17.9901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFYveBSPypvHmlrP5fRIoG5vKzXTdiphilExY95uwzLus+fWVeKaRcjmtWtdZK773QhHm0Xz2w7rJ30gakGKu5mODRUM0Z/rMgXO2nwI+Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB6123
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This device contains both master and slave controllers which can be
enabled simultaneously. Both controllers share the same SDA/SCL lines
and interrupt source but has separate control and status registers.
Controllers also works in loopback mode - slave device can communicate
with its own master controller internally. The controller can handle up
to two addresses, both of which may be 10 bit. Most of the logic
(sending (N)ACK, handling repeated start or switching between
write/read) is handled automatically which makes working with this
controller quite easy.

For simplicity, this patch adds basic support, limiting to only one
slave address. Support for the 2nd device may be added in the future.

Note that synchronize_irq() is used to ensure any running slave interrupt
is finished to make sure slave i2c_client structure can be safely used
by i2c_slave_event.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
Changes in v2:
- Reduced the number of dev_dbg messages.

 drivers/i2c/busses/Kconfig     |   1 +
 drivers/i2c/busses/i2c-axxia.c | 155 +++++++++++++++++++++++++++++++--
 2 files changed, 148 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 69f19312a574..b8262301c86d 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -429,6 +429,7 @@ config I2C_AXXIA
 	tristate "Axxia I2C controller"
 	depends on ARCH_AXXIA || COMPILE_TEST
 	default ARCH_AXXIA
+	select I2C_SLAVE
 	help
 	  Say yes if you want to support the I2C bus on Axxia platforms.
=20
diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.=
c
index ff3142b15cab..5648f554ba49 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -77,6 +77,40 @@
 				 MST_STATUS_IP)
 #define MST_TX_BYTES_XFRD	0x50
 #define MST_RX_BYTES_XFRD	0x54
+#define SLV_ADDR_DEC_CTL	0x58
+#define   SLV_ADDR_DEC_GCE	BIT(0)  /* ACK to General Call Address from own=
 master (loopback) */
+#define   SLV_ADDR_DEC_OGCE	BIT(1)  /* ACK to General Call Address from ex=
ternal masters */
+#define   SLV_ADDR_DEC_SA1E	BIT(2)  /* ACK to addr_1 enabled */
+#define   SLV_ADDR_DEC_SA1M	BIT(3)  /* 10-bit addressing for addr_1 enable=
d */
+#define   SLV_ADDR_DEC_SA2E	BIT(4)  /* ACK to addr_2 enabled */
+#define   SLV_ADDR_DEC_SA2M	BIT(5)  /* 10-bit addressing for addr_2 enable=
d */
+#define SLV_ADDR_1		0x5c
+#define SLV_ADDR_2		0x60
+#define SLV_RX_CTL		0x64
+#define   SLV_RX_ACSA1		BIT(0)  /* Generate ACK for writes to addr_1 */
+#define   SLV_RX_ACSA2		BIT(1)  /* Generate ACK for writes to addr_2 */
+#define   SLV_RX_ACGCA		BIT(2)  /* ACK data phase transfers to General Cal=
l Address */
+#define SLV_DATA		0x68
+#define SLV_RX_FIFO		0x6c
+#define   SLV_FIFO_DV1		BIT(0)  /* Data Valid for addr_1 */
+#define   SLV_FIFO_DV2		BIT(1)  /* Data Valid for addr_2 */
+#define   SLV_FIFO_AS		BIT(2)  /* (N)ACK Sent */
+#define   SLV_FIFO_TNAK		BIT(3)  /* Timeout NACK */
+#define   SLV_FIFO_STRC		BIT(4)  /* First byte after start condition recei=
ved */
+#define   SLV_FIFO_RSC		BIT(5)  /* Repeated Start Condition */
+#define   SLV_FIFO_STPC		BIT(6)  /* Stop Condition */
+#define   SLV_FIFO_DV		(SLV_FIFO_DV1 | SLV_FIFO_DV2)
+#define SLV_INT_ENABLE		0x70
+#define SLV_INT_STATUS		0x74
+#define   SLV_STATUS_RFH	BIT(0)  /* FIFO service */
+#define   SLV_STATUS_WTC	BIT(1)  /* Write transfer complete */
+#define   SLV_STATUS_SRS1	BIT(2)  /* Slave read from addr 1 */
+#define   SLV_STATUS_SRRS1	BIT(3)  /* Repeated start from addr 1 */
+#define   SLV_STATUS_SRND1	BIT(4)  /* Read request not following start con=
dition */
+#define   SLV_STATUS_SRC1	BIT(5)  /* Read canceled */
+#define   SLV_STATUS_SRAT1	BIT(6)  /* Slave Read timed out */
+#define   SLV_STATUS_SRDRE1	BIT(7)  /* Data written after timed out */
+#define SLV_READ_DUMMY		0x78
 #define SCL_HIGH_PERIOD		0x80
 #define SCL_LOW_PERIOD		0x84
 #define SPIKE_FLTR_LEN		0x88
@@ -111,6 +145,8 @@ struct axxia_i2c_dev {
 	struct clk *i2c_clk;
 	u32 bus_clk_rate;
 	bool last;
+	struct i2c_client *slave;
+	int irq;
 };
=20
 static void i2c_int_disable(struct axxia_i2c_dev *idev, u32 mask)
@@ -276,13 +312,68 @@ static int axxia_i2c_fill_tx_fifo(struct axxia_i2c_de=
v *idev)
 	return ret;
 }
=20
+static void axxia_i2c_slv_fifo_event(struct axxia_i2c_dev *idev)
+{
+	u32 fifo_status =3D readl(idev->base + SLV_RX_FIFO);
+	u8 val;
+
+	dev_dbg(idev->dev, "slave irq fifo_status=3D0x%x\n", fifo_status);
+
+	if (fifo_status & SLV_FIFO_DV1) {
+		if (fifo_status & SLV_FIFO_STRC) {
+			i2c_slave_event(idev->slave,
+					I2C_SLAVE_WRITE_REQUESTED, &val);
+		}
+
+		val =3D readl(idev->base + SLV_DATA);
+		i2c_slave_event(idev->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
+	}
+	if (fifo_status & SLV_FIFO_STPC) {
+		readl(idev->base + SLV_DATA); /* dummy read */
+		i2c_slave_event(idev->slave, I2C_SLAVE_STOP, &val);
+	}
+	if (fifo_status & SLV_FIFO_RSC) {
+		readl(idev->base + SLV_DATA); /* dummy read */
+	}
+}
+
+static irqreturn_t axxia_i2c_slv_isr(struct axxia_i2c_dev *idev)
+{
+	u32 status =3D readl(idev->base + SLV_INT_STATUS);
+	u8 val;
+
+	dev_dbg(idev->dev, "slave irq status=3D0x%x\n", status);
+
+	if (status & SLV_STATUS_RFH)
+		axxia_i2c_slv_fifo_event(idev);
+	if (status & SLV_STATUS_SRS1) {
+		i2c_slave_event(idev->slave, I2C_SLAVE_READ_REQUESTED, &val);
+		writel(val, idev->base + SLV_DATA);
+	}
+	if (status & SLV_STATUS_SRND1) {
+		i2c_slave_event(idev->slave, I2C_SLAVE_READ_PROCESSED, &val);
+		writel(val, idev->base + SLV_DATA);
+	}
+	if (status & SLV_STATUS_SRC1) {
+		i2c_slave_event(idev->slave, I2C_SLAVE_STOP, &val);
+	}
+
+	writel(INT_SLV, idev->base + INTERRUPT_STATUS);
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t axxia_i2c_isr(int irq, void *_dev)
 {
 	struct axxia_i2c_dev *idev =3D _dev;
+	irqreturn_t ret =3D IRQ_NONE;
 	u32 status;
=20
-	if (!(readl(idev->base + INTERRUPT_STATUS) & INT_MST))
-		return IRQ_NONE;
+	status =3D readl(idev->base + INTERRUPT_STATUS);
+
+	if (status & INT_SLV)
+		ret =3D axxia_i2c_slv_isr(idev);
+	if (!(status & INT_MST))
+		return ret;
=20
 	/* Read interrupt status bits */
 	status =3D readl(idev->base + MST_INT_STATUS);
@@ -583,9 +674,58 @@ static u32 axxia_i2c_func(struct i2c_adapter *adap)
 	return caps;
 }
=20
+static int axxia_i2c_reg_slave(struct i2c_client *slave)
+{
+	struct axxia_i2c_dev *idev =3D i2c_get_adapdata(slave->adapter);
+	u32 slv_int_mask =3D SLV_STATUS_RFH;
+	u32 dec_ctl;
+
+	if (idev->slave)
+		return -EBUSY;
+
+	idev->slave =3D slave;
+
+	/* Enable slave mode as well */
+	writel(GLOBAL_MST_EN | GLOBAL_SLV_EN, idev->base + GLOBAL_CONTROL);
+	writel(INT_MST | INT_SLV, idev->base + INTERRUPT_ENABLE);
+
+	/* Set slave address */
+	dec_ctl =3D SLV_ADDR_DEC_SA1E;
+	if (slave->flags & I2C_CLIENT_TEN)
+		dec_ctl |=3D SLV_ADDR_DEC_SA1M;
+
+	writel(SLV_RX_ACSA1, idev->base + SLV_RX_CTL);
+	writel(dec_ctl, idev->base + SLV_ADDR_DEC_CTL);
+	writel(slave->addr, idev->base + SLV_ADDR_1);
+
+	/* Enable interrupts */
+	slv_int_mask |=3D SLV_STATUS_SRS1 | SLV_STATUS_SRRS1 | SLV_STATUS_SRND1;
+	slv_int_mask |=3D SLV_STATUS_SRC1;
+	writel(slv_int_mask, idev->base + SLV_INT_ENABLE);
+
+	return 0;
+}
+
+static int axxia_i2c_unreg_slave(struct i2c_client *slave)
+{
+	struct axxia_i2c_dev *idev =3D i2c_get_adapdata(slave->adapter);
+
+	/* Disable slave mode */
+	writel(GLOBAL_MST_EN, idev->base + GLOBAL_CONTROL);
+	writel(INT_MST, idev->base + INTERRUPT_ENABLE);
+
+	synchronize_irq(idev->irq);
+
+	idev->slave =3D NULL;
+
+	return 0;
+}
+
 static const struct i2c_algorithm axxia_i2c_algo =3D {
 	.master_xfer =3D axxia_i2c_xfer,
 	.functionality =3D axxia_i2c_func,
+	.reg_slave =3D axxia_i2c_reg_slave,
+	.unreg_slave =3D axxia_i2c_unreg_slave,
 };
=20
 static const struct i2c_adapter_quirks axxia_i2c_quirks =3D {
@@ -599,7 +739,6 @@ static int axxia_i2c_probe(struct platform_device *pdev=
)
 	struct axxia_i2c_dev *idev =3D NULL;
 	struct resource *res;
 	void __iomem *base;
-	int irq;
 	int ret =3D 0;
=20
 	idev =3D devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
@@ -611,10 +750,10 @@ static int axxia_i2c_probe(struct platform_device *pd=
ev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
=20
-	irq =3D platform_get_irq(pdev, 0);
-	if (irq < 0) {
+	idev->irq =3D platform_get_irq(pdev, 0);
+	if (idev->irq < 0) {
 		dev_err(&pdev->dev, "missing interrupt resource\n");
-		return irq;
+		return idev->irq;
 	}
=20
 	idev->i2c_clk =3D devm_clk_get(&pdev->dev, "i2c");
@@ -643,10 +782,10 @@ static int axxia_i2c_probe(struct platform_device *pd=
ev)
 		goto error_disable_clk;
 	}
=20
-	ret =3D devm_request_irq(&pdev->dev, irq, axxia_i2c_isr, 0,
+	ret =3D devm_request_irq(&pdev->dev, idev->irq, axxia_i2c_isr, 0,
 			       pdev->name, idev);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to claim IRQ%d\n", irq);
+		dev_err(&pdev->dev, "failed to claim IRQ%d\n", idev->irq);
 		goto error_disable_clk;
 	}
=20
--=20
2.21.0

