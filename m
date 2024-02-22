Return-Path: <linux-i2c+bounces-1924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAEE85FFEC
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 18:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC171C25F39
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 17:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D295C156963;
	Thu, 22 Feb 2024 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhPuhD8h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7191534F8;
	Thu, 22 Feb 2024 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623897; cv=none; b=I76gDHnLL5M3s6aK76RsQPCSpfN8bfrcdBdO1W5tkd5pDZb+HJ9hhcKsVOZSBWnA/BJXZ2gselq4iMHZJJBYsmV5oriJmQHPjww5nBg2/Z6loDf4+E0QzNp6ljzEKh86UvyP6TnprdYLNsf8i6Bv9346X/OWobWx/Px/QYce+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623897; c=relaxed/simple;
	bh=7BNl0V7JZ8ZTvufEz+lXYL9lojiWbKA/DEhMbabZlLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuG5EwkAp/lR7+rVt1wmw9GghqMjFWYR/jiDrmY9D5bIo4TFhjv06r1OjyW/pXko2a3e/bilZhl2QFJ5i1/OOF3huE2zqdQ1ZNN5ZT/4zgTI1YaJnhFnEpnudZAi0401Cs0zsLYV6CHAnV8jgAN+v8ViXcVYqSlMvocpdOfYoMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhPuhD8h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98844C433C7;
	Thu, 22 Feb 2024 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708623897;
	bh=7BNl0V7JZ8ZTvufEz+lXYL9lojiWbKA/DEhMbabZlLo=;
	h=From:To:Cc:Subject:Date:From;
	b=RhPuhD8hNzl4pDDmJJaR9Z7BJhNWOlZjOsKhFiA64srC8v6z8YYIfy7R4+vzXS1Sz
	 Ph4pAm1bTtt3yhZKNBh5ZqfmI5Zjh1UsoXhQPgIsrgvRQSkvh34EDsSNRbfzosV13q
	 Im3QGBJXoPyGWTg2MQ/u5jERtY3+aMzNdvKajsfqal9EDskAZbVOHBpbwsDaPxUedy
	 BJqNm/uO8MSmHEC7JL8tQ02rRJCOktX/XPDvQsApcSoJ6jvvVmKXwZ+hXcBKyt3wAW
	 +adsFhYtBAA2Y8HAbsTVnebSqS/tL7QCf4VneCErtuNwuSHI8f44bJB9ImnjfpQn+b
	 10SJr0PvNMPeA==
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
Date: Thu, 22 Feb 2024 10:43:42 -0700
Message-ID: <20240222174343.3482354-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Everything in i2c.txt is covered by schemas/i2c/i2c-controller.yaml in
dtschema project, so remove i2c.txt and update links to it in the tree.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Wolfram, you can take it or I can.

 .../bindings/gpio/gateworks,pld-gpio.txt      |   3 +-
 Documentation/devicetree/bindings/i2c/i2c.txt | 151 ------------------
 .../i2c/nvidia,tegra186-bpmp-i2c.yaml         |   3 +-
 .../devicetree/bindings/i3c/i3c.yaml          |   2 +-
 .../devicetree/bindings/sound/cs4341.txt      |   2 +-
 MAINTAINERS                                   |   1 -
 6 files changed, 4 insertions(+), 158 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c.txt

diff --git a/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt b/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
index 6e81f8b755c5..d543fd1b8b23 100644
--- a/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
@@ -1,7 +1,6 @@
 Gateworks PLD GPIO controller bindings
 
-The GPIO controller should be a child node on an I2C bus,
-see: i2c/i2c.txt for details.
+The GPIO controller should be a child node on an I2C bus.
 
 Required properties:
 - compatible: Should be "gateworks,pld-gpio"
diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
deleted file mode 100644
index fc3dd7ec0445..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ /dev/null
@@ -1,151 +0,0 @@
-Generic device tree bindings for I2C busses
-===========================================
-
-This document describes generic bindings which can be used to describe I2C
-busses and their child devices in a device tree.
-
-Required properties (per bus)
------------------------------
-
-- #address-cells  - should be <1>. Read more about addresses below.
-- #size-cells     - should be <0>.
-- compatible      - name of I2C bus controller
-
-For other required properties e.g. to describe register sets,
-clocks, etc. check the binding documentation of the specific driver.
-
-The cells properties above define that an address of children of an I2C bus
-are described by a single value.
-
-Optional properties (per bus)
------------------------------
-
-These properties may not be supported by all drivers. However, if a driver
-wants to support one of the below features, it should adapt these bindings.
-
-- clock-frequency
-	frequency of bus clock in Hz.
-
-- i2c-bus
-	For I2C adapters that have child nodes that are a mixture of both I2C
-	devices and non-I2C devices, the 'i2c-bus' subnode can be used for
-	populating I2C devices. If the 'i2c-bus' subnode is present, only
-	subnodes of this will be considered as I2C slaves. The properties,
-	'#address-cells' and '#size-cells' must be defined under this subnode
-	if present.
-
-- i2c-scl-falling-time-ns
-	Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
-	specification.
-
-- i2c-scl-internal-delay-ns
-	Number of nanoseconds the IP core additionally needs to setup SCL.
-
-- i2c-scl-rising-time-ns
-	Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
-	specification.
-
-- i2c-sda-falling-time-ns
-	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
-	specification.
-
-- i2c-analog-filter
-	Enable analog filter for i2c lines.
-
-- i2c-digital-filter
-	Enable digital filter for i2c lines.
-
-- i2c-digital-filter-width-ns
-	Width of spikes which can be filtered by digital filter
-	(i2c-digital-filter). This width is specified in nanoseconds.
-
-- i2c-analog-filter-cutoff-frequency
-	Frequency that the analog filter (i2c-analog-filter) uses to distinguish
-	which signal to filter. Signal with higher frequency than specified will
-	be filtered out. Only lower frequency will pass (this is applicable to
-	a low-pass analog filter). Typical value should be above the normal
-	i2c bus clock frequency (clock-frequency).
-	Specified in Hz.
-
-- multi-master
-	states that there is another master active on this bus. The OS can use
-	this information to adapt power management to keep the arbitration awake
-	all the time, for example. Can not be combined with 'single-master'.
-
-- pinctrl
-	add extra pinctrl to configure SCL/SDA pins to GPIO function for bus
-	recovery, call it "gpio" or "recovery" (deprecated) state
-
-- scl-gpios
-	specify the gpio related to SCL pin. Used for GPIO bus recovery.
-
-- sda-gpios
-	specify the gpio related to SDA pin. Optional for GPIO bus recovery.
-
-- single-master
-	states that there is no other master active on this bus. The OS can use
-	this information to detect a stalled bus more reliably, for example.
-	Can not be combined with 'multi-master'.
-
-- smbus
-	states that additional SMBus restrictions and features apply to this bus.
-	An example of feature is SMBusHostNotify. Examples of restrictions are
-	more reserved addresses and timeout definitions.
-
-- smbus-alert
-	states that the optional SMBus-Alert feature apply to this bus.
-
-- mctp-controller
-	indicates that the system is accessible via this bus as an endpoint for
-	MCTP over I2C transport.
-
-Required properties (per child device)
---------------------------------------
-
-- compatible
-	name of I2C slave device
-
-- reg
-	One or many I2C slave addresses. These are usually a 7 bit addresses.
-	However, flags can be attached to an address. I2C_TEN_BIT_ADDRESS is
-	used to mark a 10 bit address. It is needed to avoid the ambiguity
-	between e.g. a 7 bit address of 0x50 and a 10 bit address of 0x050
-	which, in theory, can be on the same bus.
-	Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we
-	listen to be devices ourselves.
-
-Optional properties (per child device)
---------------------------------------
-
-These properties may not be supported by all drivers. However, if a driver
-wants to support one of the below features, it should adapt these bindings.
-
-- host-notify
-	device uses SMBus host notify protocol instead of interrupt line.
-
-- interrupts
-	interrupts used by the device.
-
-- interrupt-names
-	"irq", "wakeup" and "smbus_alert" names are recognized by I2C core,
-	other names are	left to individual drivers.
-
-- reg-names
-	Names of map programmable addresses.
-	It can contain any map needing another address than default one.
-
-- wakeup-source
-	device can be used as a wakeup source.
-
-Binding may contain optional "interrupts" property, describing interrupts
-used by the device. I2C core will assign "irq" interrupt (or the very first
-interrupt if not using interrupt names) as primary interrupt for the slave.
-
-Alternatively, devices supporting SMBus Host Notify, and connected to
-adapters that support this feature, may use "host-notify" property. I2C
-core will create a virtual interrupt for Host Notify and assign it as
-primary interrupt for the slave.
-
-Also, if device is marked as a wakeup source, I2C core will set up "wakeup"
-interrupt for the device. If "wakeup" interrupt name is not present in the
-binding, then primary interrupt will be used as wakeup interrupt.
diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
index b8319dcf3d8a..8676335e9e94 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
@@ -21,8 +21,7 @@ description: |
   See ../firmware/nvidia,tegra186-bpmp.yaml for details of the BPMP
   binding.
 
-  This node represents an I2C controller. See ../i2c/i2c.txt for details
-  of the core I2C binding.
+  This node represents an I2C controller.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index c816e295d565..87cadbcdc61c 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -71,7 +71,7 @@ patternProperties:
     description: |
       I2C child, should be named: <device-type>@<i2c-address>
 
-      All properties described in Documentation/devicetree/bindings/i2c/i2c.txt
+      All properties described in dtschema schemas/i2c/i2c-controller.yaml
       are valid here, except the reg property whose content is changed.
 
     properties:
diff --git a/Documentation/devicetree/bindings/sound/cs4341.txt b/Documentation/devicetree/bindings/sound/cs4341.txt
index 12b4aa8ef0db..c1d5c8ad1a36 100644
--- a/Documentation/devicetree/bindings/sound/cs4341.txt
+++ b/Documentation/devicetree/bindings/sound/cs4341.txt
@@ -9,7 +9,7 @@ Required properties:
           number for SPI.
 
 For required properties on I2C-bus, please consult
-Documentation/devicetree/bindings/i2c/i2c.txt
+dtschema schemas/i2c/i2c-controller.yaml
 For required properties on SPI-bus, please consult
 Documentation/devicetree/bindings/spi/spi-bus.txt
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 45c6c13b4edf..50a906eb8dfd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10074,7 +10074,6 @@ S:	Maintained
 W:	https://i2c.wiki.kernel.org/
 Q:	https://patchwork.ozlabs.org/project/linux-i2c/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
-F:	Documentation/devicetree/bindings/i2c/i2c.txt
 F:	Documentation/i2c/
 F:	drivers/i2c/*
 F:	include/dt-bindings/i2c/i2c.h
-- 
2.43.0


