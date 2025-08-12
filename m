Return-Path: <linux-i2c+bounces-12255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E88B23AE7
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Aug 2025 23:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93E28687D5A
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Aug 2025 21:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9303D2D73BF;
	Tue, 12 Aug 2025 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mVHi2x74"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3E2D73AD;
	Tue, 12 Aug 2025 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035204; cv=none; b=JVOhx5PAjduHuNQJZDqAfYFHXPhejiChIYUmxb0PMh+3oIawq2q39/bVynx7dsq59P58htUIcD1mPSeRoLzVq2qZT8TtiGfhn2Jrx7FayAebWkwhwtCul3n4HNfJQxBxK0g6Id44yg8RtD1Mq0aGzXV89H0Vni2rUsc4GCZ146s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035204; c=relaxed/simple;
	bh=7gpWSRbyCFguR0cN0gCHP58CnaXzilv4VTdVRMlONpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPE5OBhyEPJEmmUi2eVBNfQauKHYpcO/LLwZdTqDYNNIQLIAlRXqV2pnWDO1QtCfW/ldO0vHlnd6qtzrMutYdh1LwjCfRMo7JC+pyS7YUYKD7/kTptsFxCM9EEEhsCfELiKYhUCLsuZHx1FKgxGcJscTucjUqfdZXQSmukR5Hmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mVHi2x74; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EE8814A4;
	Tue, 12 Aug 2025 23:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035146;
	bh=7gpWSRbyCFguR0cN0gCHP58CnaXzilv4VTdVRMlONpQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mVHi2x74YGEA8rZGGL12uSQ9e+tkp67w/WAOQZmOYE8WMR+sPion+w4E5dUJwPTG5
	 Aw2XS8K14VzPuGRW/ewGsSKo9MVAodf/PTJZCNJ/CEvhX3Kb9jd9hRuGYNSd30XJW/
	 xSee7XyxJYHFX1qyWwd+fp5OxrvERRWXBweFSFPg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	devicetree@vger.kernel.org,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	imx@lists.linux.dev,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jason Chen <jason.z.chen@intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Todor Tomov <todor.too@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tony Lindgren <tony@atomide.com>,
	Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH v2 00/72] media: i2c: Reduce cargo-cult
Date: Wed, 13 Aug 2025 00:45:08 +0300
Message-ID: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series builds on top of Mehdi's introduction of the
devm_v4l2_sensor_clk_get() helper (see [1] for the patches and [2] for
the pull request) to drastically reduce cargo-cult in camera sensor
drivers.

A large number of camera sensor drivers directly use the
"clock-frequency" property to retrieve the effective or desired external
clock rate. This is standard behaviour on ACPI platforms that don't
implement MIPI DisCo for Imaging, but usage of the property has leaked
to OF-based platforms, due to a combination of historical reasons (using
"clock-frequency" was initially considered right until before the
introduction of "assigned-clock-rates") and plain cargo-cult.

A large number of camera sensor drivers also set the rate of the
external clock with clk_set_rate(). This behaviour is also fine on ACPI
platforms, and has also leaked to OF-based platforms for the same
reasons.

Mehdi's "[PATCH v2 00/48] media: Add a helper for obtaining the clock
producer" series improves the situation by centralizing clock handling
for camera sensor in one helper function that implements the correct
behaviour for all types of platforms (and should later allow support of
MIPI DisCo for Imaging transparently for camera sensor drivers). It
doesn't however address direct access of the "clock-frequency" property
or direct calls to clk_set_rate() in drivers.

This series builds on top of the new helper to replace manual handling
of the clock frequency in camera sensor drivers. It starts by addressing
the DT bindings and reprecating the clock-frequency property for camera
sensor drivers in all YAML bindings (01/72) and in the et8ek8 text
bindings (02/72). After that, patches 03/72 and 04/72 make the clocks
property mandatory in the two camera sensor DT bindings that specified
it as optional.

Next, we follow with 5 assorted drive-by changes. Patch 05/72 drops an
unused header the belonged to a long gone driver, and patch 07/72 drops
unusued support for platform data in the mt9v032 driver. Patch 08/72 is
the first that addresses clock rate handling by dropping unneeded clock
rate setting in the mt9v111 driver. Patch 09/72 takes a harsher approach
for the ov6650 by dropping the driver completely as the driver hasn't
been used since v5.9.

The next part of the series replaces manual clock rate handling with
usage of the devm_v4l2_sensor_clk_get() helper in a large number of
camera sensor drivers that implement clock rate handling in a standard
way. This is done in patches 10/72 to 44/72. This interleaves the clock
rate handling changes with drive-by refactoring (in separate patches) to
make the code easier to deal with.

The final part of the changes to drivers addresses the remaining drivers that
implement non-standard behaviours. It starts in 45/72 by adding a new
devm_v4l2_sensor_clk_get_legacy() helper function for those drivers,
similar to devm_v4l2_sensor_clk_get() but with a few more quirks. This
function should not be used in any new driver. The remaining patches,
from 46/72 to 62/72, use the new helper in drivers, interleaved with
drive-by refactoring similarly to the previous part.

Finally, patches 63/72 to 72/72 cleans up the DT side and replace
clock-frequency with assigned-clock-rates, or drops the property
altogether when the source clock has a fixed rate. This aligns the DT
bindings and device tree sources to the current recommended practice.
Some of those DT patches depend on driver changes, this is indicates in
each patch.

Before this series, with Mehdi's series applied, 29 drivers read the
"clock-frequency" property and 18 drivers set the external clock rate.
With these series we go down to 1 and 3 respectively, namely the ccs,
mt9p031 and mt9v032 drivers. Clock handling in the CCS driver is a bit
more convoluted so I will leave to Sakari the honour of dropping the
last direct user of "clock-frequency" :-) As for the mt9p031 and mt9v032
driver, addressing the issue there is more difficult and likely not
worth it.

Compared to v1, this version addresses all review comments. It also
moves the DT patches to the end, as some of them depend on driver
changes. Please see individual patches for details.

[1] https://lore.kernel.org/linux-media/cover.1750942967.git.mehdi.djait@linux.intel.com
[2] https://lore.kernel.org/linux-media/aJsrtbv16Th9yAEB@valkosipuli.retiisi.eu

Laurent Pinchart (72):
  dt-bindings: media: Deprecate clock-frequency property for camera
    sensors
  dt-bindings: media: et8ek8: Deprecate clock-frequency property
  dt-bindings: media: imx258: Make clocks property required
  dt-bindings: media: imx274: Make clocks property required
  media: i2c: mt9v022: Drop unused mt9v022.h header
  media: i2c: mt9v032: Replace client->dev usage
  media: i2c: mt9v032: Drop support for platform data
  media: i2c: mt9v111: Do not set clock rate manually
  media: i2c: ov6650: Drop unused driver
  media: i2c: hi556: Replace client->dev usage
  media: i2c: hi556: Use V4L2 sensor clock helper
  media: i2c: hi847: Replace client->dev usage
  media: i2c: hi847: Use V4L2 sensor clock helper
  media: i2c: imx208: Replace client->dev usage
  media: i2c: imx208: Use V4L2 sensor clock helper
  media: i2c: imx319: Replace client->dev usage
  media: i2c: imx319: Use V4L2 sensor clock helper
  media: i2c: imx355: Replace client->dev usage
  media: i2c: imx335: Use V4L2 sensor clock helper
  media: i2c: og01a1b: Replace client->dev usage
  media: i2c: og01a1b: Use V4L2 sensor clock helper
  media: i2c: ov02c10: Replace client->dev usage
  media: i2c: ov02c10: Use V4L2 sensor clock helper
  media: i2c: ov02e10: Replace client->dev usage
  media: i2c: ov02e10: Use V4L2 sensor clock helper
  media: i2c: ov08d10: Replace client->dev usage
  media: i2c: ov08d10: Use V4L2 sensor clock helper
  media: i2c: ov08x40: Replace client->dev usage
  media: i2c: ov08x40: Use V4L2 sensor clock helper
  media: i2c: ov13858: Replace client->dev usage
  media: i2c: ov13858: Use V4L2 sensor clock helper
  media: i2c: ov13b10: Replace client->dev usage
  media: i2c: ov13b10: Use V4L2 sensor clock helper
  media: i2c: ov2740: Replace client->dev usage
  media: i2c: ov2740: Use V4L2 sensor clock helper
  media: i2c: ov4689: Use V4L2 sensor clock helper
  media: i2c: ov5670: Replace client->dev usage
  media: i2c: ov5670: Use V4L2 sensor clock helper
  media: i2c: ov5675: Replace client->dev usage
  media: i2c: ov5675: Use V4L2 sensor clock helper
  media: i2c: ov5693: Use V4L2 sensor clock helper
  media: i2c: ov7251: Use V4L2 sensor clock helper
  media: i2c: ov9734: Replace client->dev usage
  media: i2c: ov9734: Use V4L2 sensor clock helper
  media: v4l2-common: Add legacy camera sensor clock helper
  media: i2c: et8ek8: Drop support for per-mode external clock frequency
  media: i2c: et8ek8: Use V4L2 legacy sensor clock helper
  media: i2c: gc05a2: Use V4L2 legacy sensor clock helper
  media: i2c: gc08a3: Use V4L2 legacy sensor clock helper
  media: i2c: imx258: Replace client->dev usage
  media: i2c: imx258: Use V4L2 legacy sensor clock helper
  media: i2c: imx290: Use V4L2 legacy sensor clock helper
  media: i2c: ov02a10: Replace client->dev usage
  media: i2c: ov02a10: Use V4L2 legacy sensor clock helper
  media: i2c: ov2685: Use V4L2 legacy sensor clock helper
  media: i2c: ov5645: Use V4L2 legacy sensor clock helper
  media: i2c: ov5695: Use V4L2 legacy sensor clock helper
  media: i2c: ov8856: Replace client->dev usage
  media: i2c: ov8856: Use V4L2 legacy sensor clock helper
  media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper
  media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper
  media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper
  ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera
    sensor node
  ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera
    sensor node
  ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor
    node
  ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
  ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor
    node
  ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor
    node
  ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera
    sensor node
  arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace
    clock-frequency in camera sensor node
  arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop
    clock-frequency from camera sensor node
  arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera
    sensor node

 .../admin-guide/media/i2c-cardlist.rst        |    1 -
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |    6 +-
 .../bindings/media/i2c/mipi-ccs.yaml          |    7 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml      |    3 +-
 .../bindings/media/i2c/ovti,ov5645.yaml       |    6 +-
 .../bindings/media/i2c/ovti,ov7251.yaml       |    6 +-
 .../bindings/media/i2c/ovti,ov8856.yaml       |    3 +-
 .../bindings/media/i2c/samsung,s5k5baf.yaml   |    6 +-
 .../bindings/media/i2c/samsung,s5k6a3.yaml    |    6 +-
 .../bindings/media/i2c/sony,imx258.yaml       |    1 +
 .../bindings/media/i2c/sony,imx274.yaml       |    4 +
 .../bindings/media/i2c/sony,imx290.yaml       |    5 +-
 .../bindings/media/i2c/ti,ds90ub960.yaml      |    3 +
 .../bindings/media/i2c/toshiba,et8ek8.txt     |    8 +-
 .../media/samsung,exynos4212-fimc-is.yaml     |    4 +-
 .../bindings/media/samsung,fimc.yaml          |    3 +-
 MAINTAINERS                                   |    1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi   |    4 +-
 .../boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   |    4 +-
 .../arm/boot/dts/samsung/exynos4210-i9100.dts |    5 +-
 .../boot/dts/samsung/exynos4412-midas.dtsi    |    5 +-
 arch/arm/boot/dts/ti/omap/omap3-n9.dts        |    5 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts      |    3 +-
 arch/arm/boot/dts/ti/omap/omap3-n950.dts      |    5 +-
 .../sdm845-db845c-navigation-mezzanine.dtso   |    3 +-
 .../aistarvision-mipi-adapter-2.1.dtsi        |    1 -
 .../dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |    1 -
 drivers/media/i2c/Kconfig                     |   10 +-
 drivers/media/i2c/Makefile                    |    1 -
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |   27 +-
 drivers/media/i2c/et8ek8/et8ek8_mode.c        |    9 -
 drivers/media/i2c/et8ek8/et8ek8_reg.h         |    1 -
 drivers/media/i2c/gc05a2.c                    |    8 +-
 drivers/media/i2c/gc08a3.c                    |    8 +-
 drivers/media/i2c/hi556.c                     |   92 +-
 drivers/media/i2c/hi847.c                     |   84 +-
 drivers/media/i2c/imx208.c                    |   91 +-
 drivers/media/i2c/imx258.c                    |  105 +-
 drivers/media/i2c/imx290.c                    |   27 +-
 drivers/media/i2c/imx319.c                    |   92 +-
 drivers/media/i2c/imx355.c                    |   90 +-
 drivers/media/i2c/mt9v032.c                   |  104 +-
 drivers/media/i2c/mt9v111.c                   |    2 -
 drivers/media/i2c/og01a1b.c                   |  109 +-
 drivers/media/i2c/ov02a10.c                   |   45 +-
 drivers/media/i2c/ov02c10.c                   |  107 +-
 drivers/media/i2c/ov02e10.c                   |  105 +-
 drivers/media/i2c/ov08d10.c                   |   82 +-
 drivers/media/i2c/ov08x40.c                   |   95 +-
 drivers/media/i2c/ov13858.c                   |   69 +-
 drivers/media/i2c/ov13b10.c                   |  110 +-
 drivers/media/i2c/ov2685.c                    |    8 +-
 drivers/media/i2c/ov2740.c                    |   91 +-
 drivers/media/i2c/ov4689.c                    |   12 +-
 drivers/media/i2c/ov5645.c                    |   13 +-
 drivers/media/i2c/ov5670.c                    |  105 +-
 drivers/media/i2c/ov5675.c                    |   89 +-
 drivers/media/i2c/ov5693.c                    |   16 +-
 drivers/media/i2c/ov5695.c                    |    8 +-
 drivers/media/i2c/ov6650.c                    | 1147 -----------------
 drivers/media/i2c/ov7251.c                    |   26 +-
 drivers/media/i2c/ov8856.c                    |   93 +-
 drivers/media/i2c/ov9734.c                    |   82 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |   15 +-
 drivers/media/i2c/s5c73m3/s5c73m3.h           |    2 -
 drivers/media/i2c/s5k5baf.c                   |   21 +-
 drivers/media/i2c/s5k6a3.c                    |   17 +-
 drivers/media/v4l2-core/v4l2-common.c         |   39 +-
 include/media/i2c/mt9v022.h                   |   13 -
 include/media/i2c/mt9v032.h                   |   12 -
 include/media/v4l2-common.h                   |   41 +-
 71 files changed, 1043 insertions(+), 2389 deletions(-)
 delete mode 100644 drivers/media/i2c/ov6650.c
 delete mode 100644 include/media/i2c/mt9v022.h
 delete mode 100644 include/media/i2c/mt9v032.h


base-commit: dee0ecc9eb7ccf7aa6c2e384f6fc8bd7ee252808
-- 
Regards,

Laurent Pinchart


