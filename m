Return-Path: <linux-i2c+bounces-2550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA2886D73
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58E98285F6F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EECC4AEE4;
	Fri, 22 Mar 2024 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j27V4HKx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC469317
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114059; cv=none; b=THkdy0A/gpe3Eyto61eqxJAYeuDAlV61+9Xir0WJFJ6YSU7Ttm2XnNJi5TGZmKhlX0ZtSCIkYqQj1KsxejD971K7IOr5fjA62UI7vpZRaRBxQgT1Ikib2P7ssGUJ+X9toP5/ajWNuqUOzaLAjKIanDHvTiPn4Fh35F5ZhP7W0aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114059; c=relaxed/simple;
	bh=yNIpLOfDxIiTSAsTFqiaOJw6yB4FTUpIKCf3oT9NZzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0FetuhhPt8aIYlTXvHlomjPiR+qoyInYq+lbEfa2bo6oXQ+dyZV0prBJ9LL6gDKqPtB+jqiWMd+7CgekbtNP/Cqs4bMDqzbzNzhns1bosW6Ke4m1nFlBIQ0SXxmOkmq271dBy5l0/2PqnEPx7k0a7QOlcAM/owmYsMOxCctqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j27V4HKx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Ti6AdHy5R1zA41nNzipr+t9xh3GImQtOLYTApON+Q2c=; b=j27V4H
	KxIoXYdsu5hRFQ4CqcnKrQH0oudUDD0KO6oj2ax6Fk6Mdln7q4GGIOGEVy+0fNul
	V7rUEJYdj2aDzQNHA+B27rMrPaL19zMM2k1V0R/HbgIo0bHgTob2eHTotl4fBH3n
	FOtOOb6hxiD04M3EvhmSamdiB9+dYyEnsaMDNrQ0lXyUXkXwcGOjSxGQCFOZU/Ww
	831ovjvSsYRlU2yOrZHH1o215xV2KHVqPCZlV10FNqdRaEgMiD/ZwK8+2C+ne4Ki
	/2FqUSe6u14wfMFgLP+HcLNCi2JRo+Vy2VHbhWY7DQDuhKffqssIHjDj/hvkC/di
	Sd4dQqC44KzIdiYA==
Received: (qmail 3872506 invoked from network); 22 Mar 2024 14:27:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:18 +0100
X-UD-Smtp-Session: l3s3148p1@wmtsyD8UpIVehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Robert Richter <rric@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Vignesh R <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to newest specification
Date: Fri, 22 Mar 2024 14:25:57 +0100
Message-ID: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
appropriate terms. For some drivers, this means no more conversions are
needed. For the others more work needs to be done but this will be
performed incrementally along with API changes/improvements. All these
changes here are simple search/replace results.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-amd-mp2-plat.c      |  2 +-
 drivers/i2c/busses/i2c-at91-master.c       |  2 +-
 drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----
 drivers/i2c/busses/i2c-axxia.c             | 10 +++++-----
 drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  2 +-
 drivers/i2c/busses/i2c-designware-master.c |  2 +-
 drivers/i2c/busses/i2c-designware-slave.c  |  8 ++++----
 drivers/i2c/busses/i2c-diolan-u2c.c        |  2 +-
 drivers/i2c/busses/i2c-exynos5.c           |  4 ++--
 drivers/i2c/busses/i2c-gxp.c               | 12 ++++++------
 drivers/i2c/busses/i2c-hisi.c              |  4 ++--
 drivers/i2c/busses/i2c-img-scb.c           |  2 +-
 drivers/i2c/busses/i2c-imx.c               | 12 ++++++------
 drivers/i2c/busses/i2c-jz4780.c            |  2 +-
 drivers/i2c/busses/i2c-kempld.c            |  2 +-
 drivers/i2c/busses/i2c-meson.c             |  4 ++--
 drivers/i2c/busses/i2c-mlxbf.c             |  8 ++++----
 drivers/i2c/busses/i2c-mt65xx.c            |  2 +-
 drivers/i2c/busses/i2c-mxs.c               |  2 +-
 drivers/i2c/busses/i2c-nomadik.c           |  2 +-
 drivers/i2c/busses/i2c-npcm7xx.c           | 12 ++++++------
 drivers/i2c/busses/i2c-nvidia-gpu.c        |  4 ++--
 drivers/i2c/busses/i2c-ocores.c            |  8 ++++----
 drivers/i2c/busses/i2c-octeon-platdrv.c    |  2 +-
 drivers/i2c/busses/i2c-omap.c              |  4 ++--
 drivers/i2c/busses/i2c-opal.c              |  4 ++--
 drivers/i2c/busses/i2c-pasemi-core.c       |  2 +-
 drivers/i2c/busses/i2c-pnx.c               |  2 +-
 drivers/i2c/busses/i2c-pxa.c               | 12 ++++++------
 drivers/i2c/busses/i2c-qcom-cci.c          |  2 +-
 drivers/i2c/busses/i2c-qcom-geni.c         |  2 +-
 drivers/i2c/busses/i2c-robotfuzz-osif.c    |  2 +-
 drivers/i2c/busses/i2c-rzv2m.c             |  8 ++++----
 drivers/i2c/busses/i2c-s3c2410.c           |  4 ++--
 drivers/i2c/busses/i2c-stm32f7.c           | 14 +++++++-------
 drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 ++--
 drivers/i2c/busses/i2c-tegra.c             |  4 ++--
 drivers/i2c/busses/i2c-thunderx-pcidrv.c   |  2 +-
 drivers/i2c/busses/i2c-virtio.c            |  2 +-
 drivers/i2c/busses/i2c-wmt.c               |  2 +-
 drivers/i2c/busses/i2c-xiic.c              |  2 +-
 41 files changed, 95 insertions(+), 95 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 112fe2bc5662..eb47de29ec90 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -179,7 +179,7 @@ static u32 i2c_amd_func(struct i2c_adapter *a)
 }
 
 static const struct i2c_algorithm i2c_amd_algorithm = {
-	.master_xfer = i2c_amd_xfer,
+	.xfer = i2c_amd_xfer,
 	.functionality = i2c_amd_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index d311981d3e60..56223eee7755 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -739,7 +739,7 @@ static u32 at91_twi_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm at91_twi_algorithm = {
-	.master_xfer	= at91_twi_xfer,
+	.xfer	= at91_twi_xfer,
 	.functionality	= at91_twi_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-at91-slave.c b/drivers/i2c/busses/i2c-at91-slave.c
index d6eeea5166c0..00234bf776ab 100644
--- a/drivers/i2c/busses/i2c-at91-slave.c
+++ b/drivers/i2c/busses/i2c-at91-slave.c
@@ -62,7 +62,7 @@ static irqreturn_t atmel_twi_interrupt_slave(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int at91_reg_slave(struct i2c_client *slave)
+static int at91_reg_target(struct i2c_client *slave)
 {
 	struct at91_twi_dev *dev = i2c_get_adapdata(slave->adapter);
 
@@ -86,7 +86,7 @@ static int at91_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int at91_unreg_slave(struct i2c_client *slave)
+static int at91_unreg_target(struct i2c_client *slave)
 {
 	struct at91_twi_dev *dev = i2c_get_adapdata(slave->adapter);
 
@@ -111,8 +111,8 @@ static u32 at91_twi_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm at91_twi_algorithm_slave = {
-	.reg_slave	= at91_reg_slave,
-	.unreg_slave	= at91_unreg_slave,
+	.reg_target	= at91_reg_target,
+	.unreg_target	= at91_unreg_target,
 	.functionality	= at91_twi_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index a66f7f67b3b8..19545a44dbc9 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -673,7 +673,7 @@ static u32 axxia_i2c_func(struct i2c_adapter *adap)
 	return caps;
 }
 
-static int axxia_i2c_reg_slave(struct i2c_client *slave)
+static int axxia_i2c_reg_target(struct i2c_client *slave)
 {
 	struct axxia_i2c_dev *idev = i2c_get_adapdata(slave->adapter);
 	u32 slv_int_mask = SLV_STATUS_RFH;
@@ -705,7 +705,7 @@ static int axxia_i2c_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int axxia_i2c_unreg_slave(struct i2c_client *slave)
+static int axxia_i2c_unreg_target(struct i2c_client *slave)
 {
 	struct axxia_i2c_dev *idev = i2c_get_adapdata(slave->adapter);
 
@@ -721,10 +721,10 @@ static int axxia_i2c_unreg_slave(struct i2c_client *slave)
 }
 
 static const struct i2c_algorithm axxia_i2c_algo = {
-	.master_xfer = axxia_i2c_xfer,
+	.xfer = axxia_i2c_xfer,
 	.functionality = axxia_i2c_func,
-	.reg_slave = axxia_i2c_reg_slave,
-	.unreg_slave = axxia_i2c_unreg_slave,
+	.reg_target = axxia_i2c_reg_target,
+	.unreg_target = axxia_i2c_unreg_target,
 };
 
 static const struct i2c_adapter_quirks axxia_i2c_quirks = {
diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 2737fd8abd32..4cd6a364aa3b 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -235,7 +235,7 @@ static u32 ec_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm ec_i2c_algorithm = {
-	.master_xfer	= ec_i2c_xfer,
+	.xfer	= ec_i2c_xfer,
 	.functionality	= ec_i2c_functionality,
 };
 
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7e56002809a..14c61b31f877 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -832,7 +832,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 }
 
 static const struct i2c_algorithm i2c_dw_algo = {
-	.master_xfer = i2c_dw_xfer,
+	.xfer = i2c_dw_xfer,
 	.functionality = i2c_dw_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 2e079cf20bb5..b47ad6b16814 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -58,7 +58,7 @@ static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int i2c_dw_reg_slave(struct i2c_client *slave)
+static int i2c_dw_reg_target(struct i2c_client *slave)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
 
@@ -83,7 +83,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int i2c_dw_unreg_slave(struct i2c_client *slave)
+static int i2c_dw_unreg_target(struct i2c_client *slave)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
 
@@ -214,8 +214,8 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 
 static const struct i2c_algorithm i2c_dw_algo = {
 	.functionality = i2c_dw_func,
-	.reg_slave = i2c_dw_reg_slave,
-	.unreg_slave = i2c_dw_unreg_slave,
+	.reg_target = i2c_dw_reg_target,
+	.unreg_target = i2c_dw_unreg_target,
 };
 
 void i2c_dw_configure_slave(struct dw_i2c_dev *dev)
diff --git a/drivers/i2c/busses/i2c-diolan-u2c.c b/drivers/i2c/busses/i2c-diolan-u2c.c
index b48b7888936f..c02459405b26 100644
--- a/drivers/i2c/busses/i2c-diolan-u2c.c
+++ b/drivers/i2c/busses/i2c-diolan-u2c.c
@@ -414,7 +414,7 @@ static u32 diolan_usb_func(struct i2c_adapter *a)
 }
 
 static const struct i2c_algorithm diolan_usb_algorithm = {
-	.master_xfer = diolan_usb_xfer,
+	.xfer = diolan_usb_xfer,
 	.functionality = diolan_usb_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 385ef9d9e4d4..eda5f06b158d 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -852,8 +852,8 @@ static u32 exynos5_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm exynos5_i2c_algorithm = {
-	.master_xfer		= exynos5_i2c_xfer,
-	.master_xfer_atomic	= exynos5_i2c_xfer_atomic,
+	.xfer		= exynos5_i2c_xfer,
+	.xfer_atomic	= exynos5_i2c_xfer_atomic,
 	.functionality		= exynos5_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
index efafc0528c44..9cd29c096fe4 100644
--- a/drivers/i2c/busses/i2c-gxp.c
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -110,7 +110,7 @@ static void gxp_i2c_start(struct gxp_i2c_drvdata *drvdata)
 	writew(value, drvdata->base + GXP_I2CMCMD);
 }
 
-static int gxp_i2c_master_xfer(struct i2c_adapter *adapter,
+static int gxp_i2c_xfer(struct i2c_adapter *adapter,
 			       struct i2c_msg *msgs, int num)
 {
 	int ret;
@@ -148,7 +148,7 @@ static u32 gxp_i2c_func(struct i2c_adapter *adap)
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-static int gxp_i2c_reg_slave(struct i2c_client *slave)
+static int gxp_i2c_reg_target(struct i2c_client *slave)
 {
 	struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(slave->adapter);
 
@@ -167,7 +167,7 @@ static int gxp_i2c_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int gxp_i2c_unreg_slave(struct i2c_client *slave)
+static int gxp_i2c_unreg_target(struct i2c_client *slave)
 {
 	struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(slave->adapter);
 
@@ -184,11 +184,11 @@ static int gxp_i2c_unreg_slave(struct i2c_client *slave)
 #endif
 
 static const struct i2c_algorithm gxp_i2c_algo = {
-	.master_xfer   = gxp_i2c_master_xfer,
+	.xfer   = gxp_i2c_xfer,
 	.functionality = gxp_i2c_func,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	.reg_slave     = gxp_i2c_reg_slave,
-	.unreg_slave   = gxp_i2c_unreg_slave,
+	.reg_target     = gxp_i2c_reg_target,
+	.unreg_target   = gxp_i2c_unreg_target,
 #endif
 };
 
diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index 975c0b1c44de..26072cef8e6e 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -197,7 +197,7 @@ static void hisi_i2c_reset_xfer(struct hisi_i2c_controller *ctlr)
  * wait for the transfer done. The major transfer process is performed
  * in the IRQ handler.
  */
-static int hisi_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+static int hisi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				int num)
 {
 	struct hisi_i2c_controller *ctlr = i2c_get_adapdata(adap);
@@ -236,7 +236,7 @@ static u32 hisi_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm hisi_i2c_algo = {
-	.master_xfer	= hisi_i2c_master_xfer,
+	.xfer	= hisi_i2c_xfer,
 	.functionality	= hisi_i2c_functionality,
 };
 
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index f9d4bfef511c..89833330ec25 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1146,7 +1146,7 @@ static u32 img_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm img_i2c_algo = {
-	.master_xfer = img_i2c_xfer,
+	.xfer = img_i2c_xfer,
 	.functionality = img_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3842e527116b..3609d9889304 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -857,7 +857,7 @@ static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
 	i2c_imx_enable_bus_idle(i2c_imx);
 }
 
-static int i2c_imx_reg_slave(struct i2c_client *client)
+static int i2c_imx_reg_target(struct i2c_client *client)
 {
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
 	int ret;
@@ -880,7 +880,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	return 0;
 }
 
-static int i2c_imx_unreg_slave(struct i2c_client *client)
+static int i2c_imx_unreg_target(struct i2c_client *client)
 {
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
 	int ret;
@@ -1386,11 +1386,11 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
-	.reg_slave	= i2c_imx_reg_slave,
-	.unreg_slave	= i2c_imx_unreg_slave,
+	.reg_target	= i2c_imx_reg_target,
+	.unreg_target	= i2c_imx_unreg_target,
 };
 
 static int i2c_imx_probe(struct platform_device *pdev)
diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 55035cca0ae5..6d2c54982bca 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -730,7 +730,7 @@ static u32 jz4780_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm jz4780_i2c_algorithm = {
-	.master_xfer	= jz4780_i2c_xfer,
+	.xfer	= jz4780_i2c_xfer,
 	.functionality	= jz4780_i2c_functionality,
 };
 
diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index c3a529a73b5b..4fd799740242 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -276,7 +276,7 @@ static u32 kempld_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm kempld_i2c_algorithm = {
-	.master_xfer	= kempld_i2c_xfer,
+	.xfer	= kempld_i2c_xfer,
 	.functionality	= kempld_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index c7b203cc4434..f5505904aa23 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -448,8 +448,8 @@ static u32 meson_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm meson_i2c_algorithm = {
-	.master_xfer = meson_i2c_xfer,
-	.master_xfer_atomic = meson_i2c_xfer_atomic,
+	.xfer = meson_i2c_xfer,
+	.xfer_atomic = meson_i2c_xfer_atomic,
 	.functionality = meson_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index b3a73921ab69..cbf5e87ce6e8 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2152,7 +2152,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	return mlxbf_i2c_smbus_start_transaction(priv, &request);
 }
 
-static int mlxbf_i2c_reg_slave(struct i2c_client *slave)
+static int mlxbf_i2c_reg_target(struct i2c_client *slave)
 {
 	struct mlxbf_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
 	struct device *dev = &slave->dev;
@@ -2174,7 +2174,7 @@ static int mlxbf_i2c_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int mlxbf_i2c_unreg_slave(struct i2c_client *slave)
+static int mlxbf_i2c_unreg_target(struct i2c_client *slave)
 {
 	struct mlxbf_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
 	struct device *dev = &slave->dev;
@@ -2232,8 +2232,8 @@ static struct mlxbf_i2c_chip_info mlxbf_i2c_chip[] = {
 static const struct i2c_algorithm mlxbf_i2c_algo = {
 	.smbus_xfer = mlxbf_i2c_smbus_xfer,
 	.functionality = mlxbf_i2c_functionality,
-	.reg_slave = mlxbf_i2c_reg_slave,
-	.unreg_slave = mlxbf_i2c_unreg_slave,
+	.reg_target = mlxbf_i2c_reg_target,
+	.unreg_target = mlxbf_i2c_unreg_target,
 };
 
 static struct i2c_adapter_quirks mlxbf_i2c_quirks = {
diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a8b5719c3372..4c67f5f94f11 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1345,7 +1345,7 @@ static u32 mtk_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm mtk_i2c_algorithm = {
-	.master_xfer = mtk_i2c_transfer,
+	.xfer = mtk_i2c_transfer,
 	.functionality = mtk_i2c_functionality,
 };
 
diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 36def0a9c95c..955d275676d1 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -687,7 +687,7 @@ static irqreturn_t mxs_i2c_isr(int this_irq, void *dev_id)
 }
 
 static const struct i2c_algorithm mxs_i2c_algo = {
-	.master_xfer = mxs_i2c_xfer,
+	.xfer = mxs_i2c_xfer,
 	.functionality = mxs_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b10574d42b7a..41cded3b017e 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -934,7 +934,7 @@ static unsigned int nmk_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm nmk_i2c_algo = {
-	.master_xfer	= nmk_i2c_xfer,
+	.xfer	= nmk_i2c_xfer,
 	.functionality	= nmk_i2c_functionality
 };
 
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2fe68615942e..6259cd70939e 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1257,7 +1257,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 	return IRQ_HANDLED;
 }
 
-static int npcm_i2c_reg_slave(struct i2c_client *client)
+static int npcm_i2c_reg_target(struct i2c_client *client)
 {
 	unsigned long lock_flags;
 	struct npcm_i2c *bus = i2c_get_adapdata(client->adapter);
@@ -1290,7 +1290,7 @@ static int npcm_i2c_reg_slave(struct i2c_client *client)
 	return 0;
 }
 
-static int npcm_i2c_unreg_slave(struct i2c_client *client)
+static int npcm_i2c_unreg_target(struct i2c_client *client)
 {
 	struct npcm_i2c *bus = client->adapter->algo_data;
 	unsigned long lock_flags;
@@ -2075,7 +2075,7 @@ static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
 	return true;
 }
 
-static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+static int npcm_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				int num)
 {
 	struct npcm_i2c *bus = container_of(adap, struct npcm_i2c, adap);
@@ -2238,11 +2238,11 @@ static const struct i2c_adapter_quirks npcm_i2c_quirks = {
 };
 
 static const struct i2c_algorithm npcm_i2c_algo = {
-	.master_xfer = npcm_i2c_master_xfer,
+	.xfer = npcm_i2c_xfer,
 	.functionality = npcm_i2c_functionality,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	.reg_slave	= npcm_i2c_reg_slave,
-	.unreg_slave	= npcm_i2c_unreg_slave,
+	.reg_target	= npcm_i2c_reg_target,
+	.unreg_target	= npcm_i2c_unreg_target,
 #endif
 };
 
diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 26622d24bb1b..6d5329d6ddd8 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -163,7 +163,7 @@ static int gpu_i2c_write(struct gpu_i2c_dev *i2cd, u8 data)
 	return gpu_i2c_check_status(i2cd);
 }
 
-static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
+static int gpu_i2c_xfer(struct i2c_adapter *adap,
 			       struct i2c_msg *msgs, int num)
 {
 	struct gpu_i2c_dev *i2cd = i2c_get_adapdata(adap);
@@ -234,7 +234,7 @@ static u32 gpu_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm gpu_i2c_algorithm = {
-	.master_xfer	= gpu_i2c_master_xfer,
+	.xfer	= gpu_i2c_xfer,
 	.functionality	= gpu_i2c_functionality,
 };
 
diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index e106af83cef4..17551d33d5b0 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -455,8 +455,8 @@ static u32 ocores_func(struct i2c_adapter *adap)
 }
 
 static struct i2c_algorithm ocores_algorithm = {
-	.master_xfer = ocores_xfer,
-	.master_xfer_atomic = ocores_xfer_polling,
+	.xfer = ocores_xfer,
+	.xfer_atomic = ocores_xfer_polling,
 	.functionality = ocores_func,
 };
 
@@ -689,13 +689,13 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	}
 
 	if (irq == -ENXIO) {
-		ocores_algorithm.master_xfer = ocores_xfer_polling;
+		ocores_algorithm.xfer = ocores_xfer_polling;
 	} else {
 		if (irq < 0)
 			return irq;
 	}
 
-	if (ocores_algorithm.master_xfer != ocores_xfer_polling) {
+	if (ocores_algorithm.xfer != ocores_xfer_polling) {
 		ret = devm_request_any_context_irq(&pdev->dev, irq,
 						   ocores_isr, 0,
 						   pdev->name, i2c);
diff --git a/drivers/i2c/busses/i2c-octeon-platdrv.c b/drivers/i2c/busses/i2c-octeon-platdrv.c
index 7d54b3203f71..dc6dff95c68c 100644
--- a/drivers/i2c/busses/i2c-octeon-platdrv.c
+++ b/drivers/i2c/busses/i2c-octeon-platdrv.c
@@ -122,7 +122,7 @@ static u32 octeon_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm octeon_i2c_algo = {
-	.master_xfer = octeon_i2c_xfer,
+	.xfer = octeon_i2c_xfer,
 	.functionality = octeon_i2c_functionality,
 };
 
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 42165ef57946..3b9ae8e522e2 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1212,8 +1212,8 @@ omap_i2c_isr_thread(int this_irq, void *dev_id)
 }
 
 static const struct i2c_algorithm omap_i2c_algo = {
-	.master_xfer	= omap_i2c_xfer_irq,
-	.master_xfer_atomic	= omap_i2c_xfer_polling,
+	.xfer	= omap_i2c_xfer_irq,
+	.xfer_atomic	= omap_i2c_xfer_polling,
 	.functionality	= omap_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index 17ef87d50f7c..b6640d8e77af 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -70,7 +70,7 @@ static int i2c_opal_send_request(u32 bus_id, struct opal_i2c_request *req)
 	return rc;
 }
 
-static int i2c_opal_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+static int i2c_opal_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				int num)
 {
 	unsigned long opal_id = (unsigned long)adap->algo_data;
@@ -179,7 +179,7 @@ static u32 i2c_opal_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_opal_algo = {
-	.master_xfer	= i2c_opal_master_xfer,
+	.xfer	= i2c_opal_xfer,
 	.smbus_xfer	= i2c_opal_smbus_xfer,
 	.functionality	= i2c_opal_func,
 };
diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd8becbdeeb2..b07bf8286a47 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -336,7 +336,7 @@ static u32 pasemi_smb_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm smbus_algorithm = {
-	.master_xfer	= pasemi_i2c_xfer,
+	.xfer	= pasemi_i2c_xfer,
 	.smbus_xfer	= pasemi_smb_xfer,
 	.functionality	= pasemi_smb_func,
 };
diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index a12525b3186b..e31ac2dbbd7b 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -609,7 +609,7 @@ static u32 i2c_pnx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm pnx_algorithm = {
-	.master_xfer = i2c_pnx_xfer,
+	.xfer = i2c_pnx_xfer,
 	.functionality = i2c_pnx_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 76f79b68cef8..474abc4f5784 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1154,11 +1154,11 @@ static u32 i2c_pxa_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm i2c_pxa_algorithm = {
-	.master_xfer	= i2c_pxa_xfer,
+	.xfer	= i2c_pxa_xfer,
 	.functionality	= i2c_pxa_functionality,
 #ifdef CONFIG_I2C_PXA_SLAVE
-	.reg_slave	= i2c_pxa_slave_reg,
-	.unreg_slave	= i2c_pxa_slave_unreg,
+	.reg_target	= i2c_pxa_slave_reg,
+	.unreg_target	= i2c_pxa_slave_unreg,
 #endif
 };
 
@@ -1244,11 +1244,11 @@ static int i2c_pxa_pio_xfer(struct i2c_adapter *adap,
 }
 
 static const struct i2c_algorithm i2c_pxa_pio_algorithm = {
-	.master_xfer	= i2c_pxa_pio_xfer,
+	.xfer	= i2c_pxa_pio_xfer,
 	.functionality	= i2c_pxa_functionality,
 #ifdef CONFIG_I2C_PXA_SLAVE
-	.reg_slave	= i2c_pxa_slave_reg,
-	.unreg_slave	= i2c_pxa_slave_unreg,
+	.reg_target	= i2c_pxa_slave_reg,
+	.unreg_target	= i2c_pxa_slave_unreg,
 #endif
 };
 
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 414882c57d7f..d8d6d99dd4e7 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -463,7 +463,7 @@ static u32 cci_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm cci_algo = {
-	.master_xfer	= cci_xfer,
+	.xfer	= cci_xfer,
 	.functionality	= cci_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index da94df466e83..337a80089f43 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -715,7 +715,7 @@ static u32 geni_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm geni_i2c_algo = {
-	.master_xfer	= geni_i2c_xfer,
+	.xfer	= geni_i2c_xfer,
 	.functionality	= geni_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-robotfuzz-osif.c b/drivers/i2c/busses/i2c-robotfuzz-osif.c
index 66dfa211e736..40985a38bec0 100644
--- a/drivers/i2c/busses/i2c-robotfuzz-osif.c
+++ b/drivers/i2c/busses/i2c-robotfuzz-osif.c
@@ -112,7 +112,7 @@ static u32 osif_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm osif_algorithm = {
-	.master_xfer	= osif_xfer,
+	.xfer	= osif_xfer,
 	.functionality	= osif_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index b0bfc96b9ede..60aa0a4e4247 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -321,7 +321,7 @@ static int rzv2m_i2c_stop_condition(struct rzv2m_i2c_priv *priv)
 				  100, jiffies_to_usecs(priv->adap.timeout));
 }
 
-static int rzv2m_i2c_master_xfer_msg(struct rzv2m_i2c_priv *priv,
+static int rzv2m_i2c_xfer_msg(struct rzv2m_i2c_priv *priv,
 				  struct i2c_msg *msg, int stop)
 {
 	unsigned int count = 0;
@@ -351,7 +351,7 @@ static int rzv2m_i2c_master_xfer_msg(struct rzv2m_i2c_priv *priv,
 	return ret;
 }
 
-static int rzv2m_i2c_master_xfer(struct i2c_adapter *adap,
+static int rzv2m_i2c_xfer(struct i2c_adapter *adap,
 				 struct i2c_msg *msgs, int num)
 {
 	struct rzv2m_i2c_priv *priv = i2c_get_adapdata(adap);
@@ -370,7 +370,7 @@ static int rzv2m_i2c_master_xfer(struct i2c_adapter *adap,
 
 	/* I2C main transfer */
 	for (i = 0; i < num; i++) {
-		ret = rzv2m_i2c_master_xfer_msg(priv, &msgs[i], i == (num - 1));
+		ret = rzv2m_i2c_xfer_msg(priv, &msgs[i], i == (num - 1));
 		if (ret < 0)
 			goto out;
 	}
@@ -408,7 +408,7 @@ static const struct i2c_adapter_quirks rzv2m_i2c_quirks = {
 };
 
 static struct i2c_algorithm rzv2m_i2c_algo = {
-	.master_xfer = rzv2m_i2c_master_xfer,
+	.xfer = rzv2m_i2c_xfer,
 	.functionality = rzv2m_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 275f7c42165c..29f5fef39b54 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -800,8 +800,8 @@ static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
 
 /* i2c bus registration info */
 static const struct i2c_algorithm s3c24xx_i2c_algorithm = {
-	.master_xfer		= s3c24xx_i2c_xfer,
-	.master_xfer_atomic     = s3c24xx_i2c_xfer_atomic,
+	.xfer		= s3c24xx_i2c_xfer,
+	.xfer_atomic     = s3c24xx_i2c_xfer_atomic,
 	.functionality		= s3c24xx_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 01210452216b..6ecaafc700bc 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1065,7 +1065,7 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 		f7_msg->read_write = I2C_SMBUS_READ;
 		break;
 	case I2C_SMBUS_I2C_BLOCK_DATA:
-		/* Rely on emulated i2c transfer (through master_xfer) */
+		/* Rely on emulated i2c transfer (through xfer) */
 		return -EOPNOTSUPP;
 	default:
 		dev_err(dev, "Unsupported smbus protocol %d\n", f7_msg->size);
@@ -1888,7 +1888,7 @@ static void stm32f7_i2c_enable_wakeup(struct stm32f7_i2c_dev *i2c_dev,
 	}
 }
 
-static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
+static int stm32f7_i2c_reg_target(struct i2c_client *slave)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(slave->adapter);
 	void __iomem *base = i2c_dev->base;
@@ -1978,7 +1978,7 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
 	return ret;
 }
 
-static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
+static int stm32f7_i2c_unreg_target(struct i2c_client *slave)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(slave->adapter);
 	void __iomem *base = i2c_dev->base;
@@ -2151,12 +2151,12 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm stm32f7_i2c_algo = {
-	.master_xfer = stm32f7_i2c_xfer,
-	.master_xfer_atomic = stm32f7_i2c_xfer_atomic,
+	.xfer = stm32f7_i2c_xfer,
+	.xfer_atomic = stm32f7_i2c_xfer_atomic,
 	.smbus_xfer = stm32f7_i2c_smbus_xfer,
 	.functionality = stm32f7_i2c_func,
-	.reg_slave = stm32f7_i2c_reg_slave,
-	.unreg_slave = stm32f7_i2c_unreg_slave,
+	.reg_target = stm32f7_i2c_reg_target,
+	.unreg_target = stm32f7_i2c_unreg_target,
 };
 
 static int stm32f7_i2c_probe(struct platform_device *pdev)
diff --git a/drivers/i2c/busses/i2c-tegra-bpmp.c b/drivers/i2c/busses/i2c-tegra-bpmp.c
index b0840fa0f53e..dabadbcc6d6a 100644
--- a/drivers/i2c/busses/i2c-tegra-bpmp.c
+++ b/drivers/i2c/busses/i2c-tegra-bpmp.c
@@ -275,8 +275,8 @@ static u32 tegra_bpmp_i2c_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm tegra_bpmp_i2c_algo = {
-	.master_xfer = tegra_bpmp_i2c_xfer,
-	.master_xfer_atomic = tegra_bpmp_i2c_xfer_atomic,
+	.xfer = tegra_bpmp_i2c_xfer,
+	.xfer_atomic = tegra_bpmp_i2c_xfer_atomic,
 	.functionality = tegra_bpmp_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 920d5a8cbf4c..861b1c9e2627 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1437,8 +1437,8 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
-	.master_xfer		= tegra_i2c_xfer,
-	.master_xfer_atomic	= tegra_i2c_xfer_atomic,
+	.xfer		= tegra_i2c_xfer,
+	.xfer_atomic	= tegra_i2c_xfer_atomic,
 	.functionality		= tegra_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index a77cd86fe75e..de325c8e18f3 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -71,7 +71,7 @@ static u32 thunderx_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm thunderx_i2c_algo = {
-	.master_xfer = octeon_i2c_xfer,
+	.xfer = octeon_i2c_xfer,
 	.functionality = thunderx_i2c_functionality,
 };
 
diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index c60ae531ba57..52ba1e0845ca 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -183,7 +183,7 @@ static u32 virtio_i2c_func(struct i2c_adapter *adap)
 }
 
 static struct i2c_algorithm virtio_algorithm = {
-	.master_xfer = virtio_i2c_xfer,
+	.xfer = virtio_i2c_xfer,
 	.functionality = virtio_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 198afee5233c..05ff6228c2dd 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -269,7 +269,7 @@ static u32 wmt_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm wmt_i2c_algo = {
-	.master_xfer	= wmt_i2c_xfer,
+	.xfer	= wmt_i2c_xfer,
 	.functionality	= wmt_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 71391b590ada..7ff36df7319e 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1193,7 +1193,7 @@ static u32 xiic_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm xiic_algorithm = {
-	.master_xfer = xiic_xfer,
+	.xfer = xiic_xfer,
 	.functionality = xiic_func,
 };
 
-- 
2.43.0


