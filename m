Return-Path: <linux-i2c+bounces-161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A927EBC77
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 04:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D2F0281317
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 03:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE9C23D0;
	Wed, 15 Nov 2023 03:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ntLv+Dz8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1B210FF
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 03:58:06 +0000 (UTC)
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15619EB
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 19:58:03 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C1B3D2C055C;
	Wed, 15 Nov 2023 16:58:01 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1700020681;
	bh=E87HizE9/9FKT3+PRq4a/YTBi7Vqzm0FPPXc+Gzrz9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ntLv+Dz878py+2soWrYS51MmXx2ooRk1pH7DoEiAWVaPIa9Ksg80P8NmPMUY8APJl
	 TDnMXpBmi/f46b7g/Y0zAiuMgTZnNszq6fNUSU1PspkvpgMFqJE4kvM1r3jo0nsGQx
	 +trrUw9Bk9qDbPf0MTq37VhuevSHv5Vq4qu7IeO0b6QFR5rNVQ0SD1/pyca06z+qxa
	 fDY0yUMsGQzrSlby3BA5T4UsotAsWyrv62gy747En72ZavE2lpMDXxLHgemDYxy3My
	 ZH/NgHaYhOgc7esBnueZ4JwigFmVT369rORg1l2q5hvAj6eDXSy+DfmSnHqKM3UZVN
	 qoCuz2+5cSi1A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B655441c90000>; Wed, 15 Nov 2023 16:58:01 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 9A27413EE3F;
	Wed, 15 Nov 2023 16:58:01 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 975F0280590; Wed, 15 Nov 2023 16:58:01 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: wsa@kernel.org,
	andi.shyti@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6 2/2] i2c: add an optional bus-reset-gpios property
Date: Wed, 15 Nov 2023 16:57:53 +1300
Message-ID: <20231115035753.925534-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=BNY50KLci1gA:10 a=O0QBSH250_l-ktZWyFgA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Some hardware designs have a GPIO used to control the reset of all the
devices on and I2C bus. It's not possible for every child node to
declare a reset-gpios property as only the first device probed would be
able to successfully request it. Represent this kind of hardware design
by associating the bus-reset-gpios with the parent I2C bus. The reset
line will be released prior to the child I2C devices being probed.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v6:
    - Retarget changes at the i2c core instead of an individual driver
    Changes in v5:
    - Rename reset-gpios and reset-duration-us to bus-reset-gpios and
      bus-reset-duration-us as requested by Wolfram
    Changes in v4:
    - Add missing gpio/consumer.h
    - use fsleep() for enforcing reset-duration
    Changes in v3:
    - Rename reset-delay to reset-duration
    - Use reset-duration-us property to control the reset pulse rather th=
an
      delaying after the reset
    Changes in v2:
    - Add a property to cover the length of delay after releasing the res=
et
      GPIO
    - Use dev_err_probe() when requesing the GPIO fails

 drivers/i2c/i2c-core-base.c | 39 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  3 +++
 2 files changed, 42 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..d7f53272487b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1468,6 +1468,39 @@ int i2c_handle_smbus_host_notify(struct i2c_adapte=
r *adap, unsigned short addr)
 }
 EXPORT_SYMBOL_GPL(i2c_handle_smbus_host_notify);
=20
+static int i2c_setup_bus_reset_gpio(struct i2c_adapter *adap)
+{
+	int res;
+
+	adap->reset_gpios =3D devm_gpiod_get_array_optional(&adap->dev, "bus-re=
set", GPIOD_OUT_HIGH);
+	if (IS_ERR(adap->reset_gpios))
+		return dev_err_probe(&adap->dev, PTR_ERR(adap->reset_gpios),
+				     "Cannot get reset gpio\n");
+	res =3D device_property_read_u32(&adap->dev, "bus-reset-duration-us", &=
adap->reset_duration);
+	if (res)
+		adap->reset_duration =3D 1;
+
+	return 0;
+}
+
+static void i2c_deassert_bus_reset_gpio(struct i2c_adapter *adap)
+{
+	unsigned long *values;
+
+	if (!adap->reset_gpios)
+		return;
+
+	values =3D bitmap_zalloc(adap->reset_gpios->ndescs, GFP_KERNEL);
+	if (!values)
+		return;
+
+	gpiod_set_array_value_cansleep(adap->reset_gpios->ndescs,
+			adap->reset_gpios->desc, adap->reset_gpios->info,
+			values);
+
+	bitmap_free(values);
+}
+
 static int i2c_register_adapter(struct i2c_adapter *adap)
 {
 	int res =3D -EINVAL;
@@ -1521,6 +1554,10 @@ static int i2c_register_adapter(struct i2c_adapter=
 *adap)
 	if (res)
 		goto out_reg;
=20
+	res =3D i2c_setup_bus_reset_gpio(adap);
+	if (res)
+		goto out_reg;
+
 	device_enable_async_suspend(&adap->dev);
 	pm_runtime_no_callbacks(&adap->dev);
 	pm_suspend_ignore_children(&adap->dev, true);
@@ -1539,6 +1576,8 @@ static int i2c_register_adapter(struct i2c_adapter =
*adap)
 		dev_warn(&adap->dev,
 			 "Failed to create compatibility class link\n");
 #endif
+	/* bring downstream devices out of reset */
+	i2c_deassert_bus_reset_gpio(adap);
=20
 	/* create pre-declared device nodes */
 	of_i2c_register_devices(adap);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 0dae9db27538..1110a49dcdaf 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -746,6 +746,9 @@ struct i2c_adapter {
=20
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
+
+	struct gpio_descs *reset_gpios;
+	u32 reset_duration;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
=20
--=20
2.42.0


