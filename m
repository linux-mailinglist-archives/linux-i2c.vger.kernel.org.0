Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B86857DC72
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 15:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730769AbfHANVu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 09:21:50 -0400
Received: from mail-eopbgr00096.outbound.protection.outlook.com ([40.107.0.96]:2677
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730091AbfHANVu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 09:21:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqmiV571NUz6qHT/dKb5L8Pflnv2SFIh+0RB2Zh/emyZSaG9O1/ppaoo7CzFJRabITlejVQ4z7M6Z6sz8DSLuHdLsl9BdErCn3fOPUDxFfo2JaloJN4lucAJF+TKA9IDr7sPd9y72UMjsUjQw7zHb+dvNJBXvdjqBO5rEAnhszxFnJN5zlGgxsJ9vTzXknJ9gxcUhNaeupMEnEiuSQ9PXVCT6iFiS5LwhEA9dGpJsBd/bw82e+56A6LUXqLQAmLjvw/xF4YXdIVrKklETp7ADCQnBB5T2PxHagImWgEXlEJieIwEcxK1dvjFfeJ4lDgFPCAXhAh65652PurSrzdLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl2pj3WvPLLwL2vL3q8mPyQJTPL4z2qGRFOm+i0hCeY=;
 b=NQEzk4tbcOv3CSWsRK+SEDZzbP+3kPJFrRxGHbmEqhLXtRfOsiZNbJ5zT9/gLYq0cqBNP4ZTReV3uOH9eajGD6Yn6zQwRwfZ+50srKVg7LVb0Ls1JEgSIGH+EWYlny/UfMjp5Vca2RfZFu0vYm4rBhmjE/up1PhpUdOD1OV0KS+0PwPTdZNedVsCU6mgKk0NeGMdW7+IfflhBqio4RqORTqUVtbjMJzXrLlnD92O+HeTvuuclCVyVaR6FyXGGsPOxpxQ46AV3B0DOJftPKifwhMlEjP84uM2YEPfOQLtOLq+1X1kDd9zhDe3DFXrZImdWkyGi5eBSo2S2PzuivgPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nokia.com;dmarc=pass action=none
 header.from=nokia.com;dkim=pass header.d=nokia.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl2pj3WvPLLwL2vL3q8mPyQJTPL4z2qGRFOm+i0hCeY=;
 b=X3tusxgsIr7ey5klPDQ/uCViY33eOPgVJKCsK257mXkMBQXFCW5kTUYmgpX21dtdoxT0fJBfy6Tj+ocZWq3HocXa+9qT9k2HRNAsvCKXRT2SijOHQ2Q6H7WgFMLl/cW8RnY7uUvvbop9mFqGDJWAOvJo6BvQlBYdm7FajvLwc1A=
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com (20.178.107.151) by
 DB7PR07MB4901.eurprd07.prod.outlook.com (20.177.123.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Thu, 1 Aug 2019 13:21:41 +0000
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02]) by DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02%6]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 13:21:41 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH] i2c-axxia: support slave mode
Thread-Topic: [PATCH] i2c-axxia: support slave mode
Thread-Index: AQHVSGwOk+MxAclOz0u7iP5t8pKxww==
Date:   Thu, 1 Aug 2019 13:21:41 +0000
Message-ID: <20190801132129.GA5550@localhost.localdomain>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P189CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::23)
 To DB7PR07MB6042.eurprd07.prod.outlook.com (2603:10a6:10:8e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd0e19e7-d652-46f6-26ce-08d7168330fa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR07MB4901;
x-ms-traffictypediagnostic: DB7PR07MB4901:
x-microsoft-antispam-prvs: <DB7PR07MB4901309AC8DF6C623D2483FAEFDE0@DB7PR07MB4901.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(199004)(189003)(4326008)(316002)(54906003)(8936002)(66556008)(64756008)(66446008)(25786009)(66946007)(107886003)(486006)(66476007)(6436002)(9686003)(6512007)(53936002)(478600001)(6486002)(14454004)(6506007)(386003)(5660300002)(305945005)(3846002)(102836004)(6116002)(99286004)(6916009)(2906002)(86362001)(7736002)(186003)(33656002)(71200400001)(71190400001)(26005)(61506002)(68736007)(14444005)(81156014)(8676002)(52116002)(1076003)(476003)(66066001)(256004)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:DB7PR07MB4901;H:DB7PR07MB6042.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rdi6LMn9YXfSt6pPqsco7fWdzPrZIbJvLhEtSy4m3Rt2Wr4vpIkSW4IpaXQdem4nkLDbDWxccz9rE32vSSzsCwGeD3LmNjsq188VmXnlQyKNzF7S/PYPvO9fAUZLyTY0TCYefUOWfNb35RkdxioxMO1JTd32bmMEkOXKmMeHQObVCLYZ9HU8nkAHCmPWAUGGrFOUGKSWEWDPKD/KmEUwEdi4UNYqQVzDv2QSvs0xtE1kYTVOhmgUz3LFW55eh7JDpiuyzp0W9Mkb4cATD/QiWg8XQEVAUext2QqRfniVhTzIQ7+XMVofqIF/n+gXmAZ8mdWBkVVB7pG3SCIzwrVKtJmuM8Af4dO3j9Uk/w00Wj1hXPovHHds6MXIQKGQBDkuEOHekpxlhWYBYVf7SFgYBB1lS+WJyk3QYujCrg5t1Og=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5F5AFA7D2DBF5243AE1B11261B128227@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0e19e7-d652-46f6-26ce-08d7168330fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 13:21:41.5720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krzysztof.adamski@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB4901
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

Note that checkpatch shows warnings about "line over 80 characters" for
some of those register definitions added but I personally think
splitting those comments would decrease readability, not increase it. I
can do that, however, if you think otherwise.

---
 drivers/i2c/busses/Kconfig     |   1 +
 drivers/i2c/busses/i2c-axxia.c | 160 +++++++++++++++++++++++++++++++--
 2 files changed, 153 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 09367fc014c3..3e1d196fce2e 100644
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
index ff3142b15cab..9095b9cf5963 100644
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
@@ -276,13 +312,73 @@ static int axxia_i2c_fill_tx_fifo(struct axxia_i2c_de=
v *idev)
 	return ret;
 }
=20
+static void axxia_i2c_slv_fifo_event(struct axxia_i2c_dev *idev)
+{
+	u32 fifo_status =3D readl(idev->base + SLV_RX_FIFO);
+	struct device *dev =3D idev->dev;
+	u8 val;
+
+	if (fifo_status & SLV_FIFO_DV1) {
+		if (fifo_status & SLV_FIFO_STRC) {
+			dev_dbg(dev, "First data byte sent\n");
+			i2c_slave_event(idev->slave,
+					I2C_SLAVE_WRITE_REQUESTED, &val);
+		}
+
+		val =3D readl(idev->base + SLV_DATA);
+		dev_dbg(dev, "Received byte - 0x%x\n", val);
+		i2c_slave_event(idev->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
+	}
+	if (fifo_status & SLV_FIFO_STPC) {
+		dev_dbg(dev, "Stop condition received\n");
+		readl(idev->base + SLV_DATA); /* dummy read */
+		i2c_slave_event(idev->slave, I2C_SLAVE_STOP, &val);
+	}
+	if (fifo_status & SLV_FIFO_RSC) {
+		dev_dbg(dev, "Receved byte after repeated start\n");
+		readl(idev->base + SLV_DATA); /* dummy read */
+	}
+}
+
+static irqreturn_t axxia_i2c_slv_isr(struct axxia_i2c_dev *idev)
+{
+	u32 status =3D readl(idev->base + SLV_INT_STATUS);
+	u8 val;
+
+	if (status & SLV_STATUS_RFH)
+		axxia_i2c_slv_fifo_event(idev);
+	if (status & SLV_STATUS_SRS1) {
+		i2c_slave_event(idev->slave, I2C_SLAVE_READ_REQUESTED, &val);
+		dev_dbg(idev->dev, "First byte requested RS=3D%d, response=3D%x\n",
+			!!(status & SLV_STATUS_SRRS1), val);
+		writel(val, idev->base + SLV_DATA);
+	}
+	if (status & SLV_STATUS_SRND1) {
+		dev_dbg(idev->dev, "Read request not after start condition\n");
+		i2c_slave_event(idev->slave, I2C_SLAVE_READ_PROCESSED, &val);
+		writel(val, idev->base + SLV_DATA);
+	}
+	if (status & SLV_STATUS_SRC1) {
+		dev_dbg(idev->dev, "Slave read terminated\n");
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
@@ -583,9 +679,58 @@ static u32 axxia_i2c_func(struct i2c_adapter *adap)
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
@@ -599,7 +744,6 @@ static int axxia_i2c_probe(struct platform_device *pdev=
)
 	struct axxia_i2c_dev *idev =3D NULL;
 	struct resource *res;
 	void __iomem *base;
-	int irq;
 	int ret =3D 0;
=20
 	idev =3D devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
@@ -611,10 +755,10 @@ static int axxia_i2c_probe(struct platform_device *pd=
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
@@ -643,10 +787,10 @@ static int axxia_i2c_probe(struct platform_device *pd=
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

