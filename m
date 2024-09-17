Return-Path: <linux-i2c+bounces-6843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E2697B62F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 01:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728B71F21E7C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 23:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA8A193434;
	Tue, 17 Sep 2024 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="nEgGxKan"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DC8191F95
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 23:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726615790; cv=none; b=NkZpbvIRQvce2jkdF6rakX5e0Y69LC1MVDLMz3rbIggHeaNdsgmwUv6SZhMBOxkyMwEipNCOE62FKGIsRFI4K8svjov52GhbLO5W3TwNUo6TVJqPTGOPr3ZJ3OR6Nl2iGKYHaetdF3/CjqsJUfqC1p3YzPl1I6uGn0pe0ZSC4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726615790; c=relaxed/simple;
	bh=R8vgpwFocTgr2VLRkYvO2Feee8qPVPsrOMT6Jy/NsVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjBq2hyfDTtQpd4pzsg3z4E4E2+BOCY833w1NUy+LeqICxVefLRPUB0xPKv2hss/gn3THYE+ia079xJhbKKIlTu7KzPAwS0qvOhuuWXe71oACftKqyllmOI6KN/slsb0CuuxwSQd1RDdBG08AapNH4EGGn539y2TbyArqjUFla0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=nEgGxKan; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 606AA2C0654;
	Wed, 18 Sep 2024 11:29:37 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726615777;
	bh=hciNQ7JyuCrV8+IFGAGI+LOFvSKN/EA4AgHDtQZ7WFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nEgGxKanHgWXfz0jDzo+IC6/A7RGtMKLRrONGyQRt2vT/Juiin4NJU46Dnq24YWnu
	 w3Hpr8Fyu/7eX+CYLCAmtBYSE21sRHzvfRUR0BOY2TWrZ3u2DXdzqQPGe0kN9z1es5
	 fAxSd9rO2bPU5rAUu2MVMHMsojVr0cKL+KpAbl7F3U5EWCn7l6wLULWBYsW3cw8pOz
	 BCxZXLrVBCtRmiLSQwTMAeWkVLMpG+nKzeXbBz5U6DV2zuPriRX1MZzWXJ3rBsSImA
	 9hcsCWVtUM1gK+/oChZxghEss8e3k5HpGyjPFH6WEN05yJ/6cDPOJwNlwlDli151d8
	 WhjEdQohCty5w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ea10e00005>; Wed, 18 Sep 2024 11:29:36 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 8B18613EE87;
	Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 88203280347; Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 5/5] i2c: rtl9300: Add multiplexing support
Date: Wed, 18 Sep 2024 11:29:32 +1200
Message-ID: <20240917232932.3641992-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ea10e0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=v7xNKfeFtFACfAgD-bQA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The RTL9300 I2C controller can support multiplexing by choosing the SDA
pin to be used dynamically. Add mutliplexing support to the rtl9300
driver.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-rtl9300.c | 168 ++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rt=
l9300.c
index f16e9b6343bf..a934a2526c92 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
=20
 #include <linux/i2c.h>
+#include <linux/i2c-mux.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mutex.h>
@@ -44,6 +45,14 @@ struct rtl9300_i2c {
 #define RTL9300_I2C_STD_FREQ		0
 #define RTL9300_I2C_FAST_FREQ		1
=20
+struct rtl9300_i2c_chan {
+	int parent;
+	const unsigned int *chans;
+	int n_chan;
+};
+
+#define RTL9300_I2C_MUX_NCHAN	8
+
 DEFINE_MUTEX(i2c_lock);
=20
 static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u1=
6 len)
@@ -370,7 +379,164 @@ static struct platform_driver rtl9300_i2c_driver =3D=
 {
 	},
 };
=20
-module_platform_driver(rtl9300_i2c_driver);
+static int rtl9300_i2c_select_chan(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct i2c_adapter *adap =3D muxc->parent;
+	struct rtl9300_i2c *i2c =3D i2c_get_adapdata(adap);
+	int ret;
+
+	ret =3D rtl9300_i2c_config_io(i2c, chan);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rtl9300_i2c_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct i2c_adapter *adap =3D muxc->parent;
+	struct rtl9300_i2c *i2c =3D i2c_get_adapdata(adap);
+	int ret;
+
+	ret =3D rtl9300_i2c_config_io(i2c, i2c->sda_pin);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rtl9300_i2c_mux_probe_fw(struct rtl9300_i2c_chan *mux, struct=
 platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
+	struct device_node *np =3D dev->of_node;
+	struct device_node *adap_np;
+	struct i2c_adapter *adap =3D NULL;
+	struct fwnode_handle *child;
+	unsigned int *chans;
+	int i =3D 0;
+
+	if (!is_of_node(fwnode))
+		return -EOPNOTSUPP;
+
+	if (!np)
+		return -ENODEV;
+
+	adap_np =3D of_parse_phandle(np, "i2c-parent", 0);
+	if (!adap_np) {
+		dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
+		return -ENODEV;
+	}
+	adap =3D of_find_i2c_adapter_by_node(adap_np);
+	of_node_put(adap_np);
+
+	if (!adap)
+		return -EPROBE_DEFER;
+
+	mux->parent =3D i2c_adapter_id(adap);
+	put_device(&adap->dev);
+
+	mux->n_chan =3D device_get_child_node_count(dev);
+	if (mux->n_chan >=3D RTL9300_I2C_MUX_NCHAN)
+		return -EINVAL;
+
+	chans =3D devm_kcalloc(dev, mux->n_chan, sizeof(*mux->chans), GFP_KERNE=
L);
+	if (!chans)
+		return -ENOMEM;
+
+	device_for_each_child_node(dev, child) {
+		fwnode_property_read_u32(child, "reg", chans + i);
+		i++;
+	}
+	mux->chans =3D chans;
+
+	return 0;
+}
+
+static int rtl9300_i2c_mux_probe(struct platform_device *pdev)
+{
+	struct i2c_mux_core *muxc;
+	struct i2c_adapter *adap;
+	struct rtl9300_i2c_chan *mux;
+	int ret, i;
+
+	mux =3D devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	ret =3D rtl9300_i2c_mux_probe_fw(mux, pdev);
+	if (ret)
+		return ret;
+
+	adap =3D i2c_get_adapter(mux->parent);
+	if (!adap)
+		return -EPROBE_DEFER;
+
+	muxc =3D i2c_mux_alloc(adap, &pdev->dev, mux->n_chan, 0, 0,
+			     rtl9300_i2c_select_chan, rtl9300_i2c_deselect_mux);
+	if (!muxc) {
+		ret =3D -ENOMEM;
+		goto err_alloc;
+	}
+	muxc->priv =3D mux;
+
+	platform_set_drvdata(pdev, muxc);
+
+	for (i =3D 0; i < mux->n_chan; i++) {
+		ret =3D i2c_mux_add_adapter(muxc, 0, mux->chans[i]);
+		if (ret)
+			goto err_del_adapters;
+	}
+
+	return 0;
+
+err_del_adapters:
+	i2c_mux_del_adapters(muxc);
+err_alloc:
+	i2c_put_adapter(adap);
+
+	return ret;
+}
+
+static void rtl9300_i2c_mux_remove(struct platform_device *pdev)
+{
+	struct i2c_mux_core *muxc =3D platform_get_drvdata(pdev);
+
+	i2c_mux_del_adapters(muxc);
+	i2c_put_adapter(muxc->parent);
+}
+
+static const struct of_device_id i2c_rtl9300_mux_dt_ids[] =3D {
+	{ .compatible =3D "realtek,rtl9300-i2c-mux" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, i2c_rtl9300_mux_dt_ids);
+
+static struct platform_driver rtl9300_i2c_mux_driver =3D {
+	.probe =3D rtl9300_i2c_mux_probe,
+	.remove =3D rtl9300_i2c_mux_remove,
+	.driver =3D {
+		.name =3D "i2c-mux-rtl9300",
+		.of_match_table =3D i2c_rtl9300_mux_dt_ids,
+	},
+};
+
+static struct platform_driver * const drivers[] =3D {
+	&rtl9300_i2c_driver,
+	&rtl9300_i2c_mux_driver,
+};
+
+static int __init rtl9300_i2c_init(void)
+{
+	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
+}
+module_init(rtl9300_i2c_init);
+
+static void __exit rtl9300_i2c_exit(void)
+{
+	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
+}
+module_exit(rtl9300_i2c_exit);
=20
 MODULE_DESCRIPTION("RTL9300 I2C controller driver");
 MODULE_LICENSE("GPL");
--=20
2.46.1


