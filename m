Return-Path: <linux-i2c+bounces-1199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F045826793
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 05:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 659301C216F6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 04:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E84E79EE;
	Mon,  8 Jan 2024 04:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ognd4N7d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D66FB9
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jan 2024 04:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 832862C03C7;
	Mon,  8 Jan 2024 17:19:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1704687559;
	bh=6Do2x9DDn0JcnO2x8tiIauxm3a6XuafqPzj8c5YiWQg=;
	h=From:To:Cc:Subject:Date:From;
	b=ognd4N7dN2vmJ54v05sIMYu7xidOhJwxxxs6nqO2VQsMqFyve3ET2tJjpnXBTVmEY
	 n1ZHA5aQMMmH6viV20QCrcI7zMAYWV+HM9dwwtc0EVfitlaPdov+R9UG7UcLPphCOW
	 Gq/Hh8Q99JdSdBXdaIKpdrxqvWDHxcTu78h47VxgLjGPgyYnQEExNRaq11Ed6kbKjQ
	 HB6RXgFhPzs+gIEaaeZ57yp3xrs6iWLIMvs7UTQFuxI9ZKLKmGYYX4VRl6YvQUPNO6
	 Ijelp43uCcHdfpxGOt+qkpQeBf377adDFUdYRcXIpkweq+jV25gIzBLUcEwqxQktDF
	 +wxZrstuPtD9g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B659b77c70000>; Mon, 08 Jan 2024 17:19:19 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 20AD613ED5A;
	Mon,  8 Jan 2024 17:19:19 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 1C327280974; Mon,  8 Jan 2024 17:19:19 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: krzysztof.kozlowski@linaro.org,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] i2c: muxes: pca954x: Allow sharing reset GPIO
Date: Mon,  8 Jan 2024 17:19:13 +1300
Message-ID: <20240108041913.7078-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=CYB2G4jl c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dEuoMetlWLkA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=H3RM6WYtTQQ9Ov2Cx3cA:9 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Some hardware designs with multiple PCA954x devices use a reset GPIO
connected to all the muxes. Support this configuration by making use of
the reset controller framework which can deal with the shared reset
GPIOs. Fall back to the old GPIO descriptor method if the reset
controller framework is not enabled.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This patch goes on top of Krzysztof's series adding the GPIO based re=
set
    controller[1]. With this I'm able to correctly describe my hardware
    platform in the DTS and have the resets appropriately controlled.
   =20
    Krzysztof, I'd be really happy if you included this in your series (i=
f
    there is another round) but I'd also be OK with waiting until your
    series is in and re-sending this after.
   =20
    [1] - https://lore.kernel.org/lkml/20240105155918.279657-1-krzysztof.=
kozlowski@linaro.org/

 drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-=
mux-pca954x.c
index 2219062104fb..1702e8d49b91 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -49,6 +49,7 @@
 #include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/mux/mux.h>
@@ -102,6 +103,9 @@ struct pca954x {
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
 	struct regulator *supply;
+
+	struct gpio_desc *reset_gpio;
+	struct reset_control *reset_cont;
 };
=20
 /* Provide specs for the MAX735x, PCA954x and PCA984x types we know abou=
t */
@@ -477,6 +481,35 @@ static int pca954x_init(struct i2c_client *client, s=
truct pca954x *data)
 	return ret;
 }
=20
+static int pca954x_get_reset(struct device *dev, struct pca954x *data)
+{
+	data->reset_cont =3D devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(data->reset_cont))
+		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
+				     "Failed to get reset\n");
+	else if (data->reset_cont)
+		return 0;
+
+	/*
+	 * fallback to legacy reset-gpios
+	 */
+	data->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HI=
GH);
+	if (IS_ERR(data->reset_gpio)) {
+		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
+				     "Failed to get reset gpio");
+	}
+
+	return 0;
+}
+
+static void pca954x_reset_deassert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_deassert(data->reset_cont);
+	else
+		gpiod_set_value_cansleep(data->reset_gpio, 0);
+}
+
 /*
  * I2C init/probing/exit functions
  */
@@ -485,7 +518,6 @@ static int pca954x_probe(struct i2c_client *client)
 	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
 	struct i2c_adapter *adap =3D client->adapter;
 	struct device *dev =3D &client->dev;
-	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
 	int num;
@@ -513,15 +545,13 @@ static int pca954x_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret,
 				     "Failed to enable vdd supply\n");
=20
-	/* Reset the mux if a reset GPIO is specified. */
-	gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio)) {
-		ret =3D PTR_ERR(gpio);
+	ret =3D pca954x_get_reset(dev, data);
+	if (ret)
 		goto fail_cleanup;
-	}
-	if (gpio) {
+
+	if (data->reset_cont || data->reset_gpio) {
 		udelay(1);
-		gpiod_set_value_cansleep(gpio, 0);
+		pca954x_reset_deassert(data);
 		/* Give the chip some time to recover. */
 		udelay(1);
 	}
--=20
2.43.0


