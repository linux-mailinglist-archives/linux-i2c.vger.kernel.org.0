Return-Path: <linux-i2c+bounces-2341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC21879CB2
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 21:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2A321F22226
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 20:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C92C142908;
	Tue, 12 Mar 2024 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="2bEa4WDs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9D91428F6
	for <linux-i2c@vger.kernel.org>; Tue, 12 Mar 2024 20:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710274455; cv=none; b=vDEdXg5f1mRUjrpaEZPEBlrQRX3XtrjDgz+oq4p/I8ezx6Ld2/WoGiVHN0cbFl48WZE0fXEINytw8heEg2fAXklgygT+WgTyEghjZIEOTlPgiM7V8GfVv5wbjuqjLgYYIrhhamaTBxCRbPU+HiiEI4Bwn4jN/8XrUxF0T9wk/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710274455; c=relaxed/simple;
	bh=mdyuCZu15UoqvZX7Ih2uZJNlFt34vlSHVfkPnSEv6l0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alB6np1iSYARFYXaeCYVyYKGtT1Hb7O4rLnvnAGBkoagQRs1Zk0PRU9FUEhxYcBp9XTMZZtZc5qo4yp/WkS8RA56f/+CvPYstajzPl7yy7+xzV+vQVbFG6kfIj6rsLJSJAjgWj19h0e0arBchDGze5QdgGkcWKOtSMEiOBS8jvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=2bEa4WDs; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 08D152C02AF;
	Wed, 13 Mar 2024 09:14:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1710274443;
	bh=3/geXx7OKR72SZa1sQd2oAiIDMVfXSWEXFrEmU/jdWo=;
	h=From:To:Cc:Subject:Date:From;
	b=2bEa4WDsVabLKxz2Ya2ruZZbFvlGlXPnu1SLNlttgLvXUwa0KKjJOCO0mHhyvSkVf
	 9NJw83HyjrEFsD3AQP+de4TMXaLnMryo4ekInjGG+gIJaZcihbVjCknk+cJO6jGRug
	 MCpB8goc3+ksDjgcCaCJFsBHXUxny94BjE8UYMxKpmtMj8HXvOuf6c5/j5I+8fsdnh
	 5M5uVVPOfBLJ5ucspoklOdtbfNfWmTMXGnypcMAHzVUcoUAoWU26qikzpfbcIjNyi6
	 L7WMtbQ/u1lSKAsRegSLgEduozPU9ESbORYbZMIr1TkWoIAf7dqnVfKuAuqAFdvgbz
	 aGI7LscdONJPA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65f0b78a0000>; Wed, 13 Mar 2024 09:14:02 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 6E5F513ED56;
	Wed, 13 Mar 2024 09:14:02 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 68F122803F8; Wed, 13 Mar 2024 09:14:02 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: peda@axentia.se,
	p.zabel@pengutronix.de,
	krzysztof.kozlowski@linaro.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4] i2c: muxes: pca954x: Allow sharing reset GPIO
Date: Wed, 13 Mar 2024 09:14:00 +1300
Message-ID: <20240312201400.716009-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65f0b78a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=K6JAEmCyrfEA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=x-TO_WfDdbTQ6qBZJcYA:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Some hardware designs with multiple PCA954x devices use a reset GPIO
connected to all the muxes. Support this configuration by making use of
the reset controller framework which can deal with the shared reset
GPIOs. Fall back to the old GPIO descriptor method if the reset
controller framework is not enabled.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    This patch goes on top of Krzysztof's series adding the GPIO based re=
set
    controller[1] which will be in linux-6.9. With this I'm able to
    correctly describe my hardware platform in the DTS and have the reset=
s
    appropriately controlled.
   =20
    [1] - https://lore.kernel.org/all/20240129115216.96479-1-krzysztof.ko=
zlowski@linaro.org/
   =20
    I caused a bit of confusion and send this as a new patch without any
    reference to the earlier versions. It is a bit complicated as I sent =
v1
    which Krzysztof included in v3 of his series but then dropped before =
the
    series landed. The content hasn't changed since v1 but tags have been
    added in the latest version.
   =20
    Changes in v4:
    - Add Ack and R-by from Peter and Krzysztof
   =20
    v3 resend: https://lore.kernel.org/all/20240311041412.3858710-1-chris=
.packham@alliedtelesis.co.nz/
   =20
    v3: https://lore.kernel.org/lkml/20240112163608.528453-6-krzysztof.ko=
zlowski@linaro.org/
   =20
    v1: https://lore.kernel.org/all/20240108041913.7078-1-chris.packham@a=
lliedtelesis.co.nz/

 drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-=
mux-pca954x.c
index f5dfc33b97c0..c3f4ff08ac38 100644
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
@@ -116,6 +117,9 @@ struct pca954x {
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
@@ -518,6 +522,35 @@ static int pca954x_init(struct i2c_client *client, s=
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
@@ -526,7 +559,6 @@ static int pca954x_probe(struct i2c_client *client)
 	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
 	struct i2c_adapter *adap =3D client->adapter;
 	struct device *dev =3D &client->dev;
-	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
 	int num;
@@ -554,15 +586,13 @@ static int pca954x_probe(struct i2c_client *client)
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
2.43.2


