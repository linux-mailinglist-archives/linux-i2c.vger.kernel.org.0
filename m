Return-Path: <linux-i2c+bounces-1142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF6825394
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 14:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60631C22E89
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 13:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5342D63E;
	Fri,  5 Jan 2024 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6g+wCJRY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B832D615;
	Fri,  5 Jan 2024 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 405A7t5b024370;
	Fri, 5 Jan 2024 14:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=+rXwIBo
	z3uZBmfT+N70oY/eRCTxAPAlCqTTaF22kiWk=; b=6g+wCJRY9JbxywFG800+3wC
	T8asHbgfwlTZ41ArGagJtkPbZxpXDmZp2ELUZv4Uzym/ajTvEWw4o7JzS0ts4HbI
	VaWHq7nw3BimIMdRGdlxMEaAuZK1wJG80tvy/oE70WL85HAFTaSxU5YYRfZ0aTdb
	dNpTIVwcJUp4Wt3GXxIDrBowOhbdwsb832fjKCXtEmBXojub35zlPLoBSi4uuwWq
	pA0uerUnbkWiIAEP8K9HTol/1ujHaGWRGpfS+lj/B1ssCWPZOj3RYDxwLb1/rsnX
	jsBb8k1m3OKVFkN1TiZ2b388671XTBS5MxEVQovHSlkbQAz8TV2goVWvVboDCQA=
	=
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ve9h0j5k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 14:04:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB4DF10002A;
	Fri,  5 Jan 2024 14:04:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A03D229A8D;
	Fri,  5 Jan 2024 14:04:33 +0100 (CET)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 14:04:32 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v9 00/13] Introduce STM32 Firewall framework
Date: Fri, 5 Jan 2024 14:03:51 +0100
Message-ID: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_06,2024-01-05_01,2023-05-22_02

Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
register to the framework to offer firewall services such as access
granting.

This series of patches is a new approach on the previous STM32 system
bus, history is available here:
https://lore.kernel.org/lkml/20230127164040.1047583/

The need for such framework arises from the fact that there are now
multiple hardware firewalls implemented across multiple products.
Drivers are shared between different products, using the same code.
When it comes to firewalls, the purpose mostly stays the same: Protect
hardware resources. But the implementation differs, and there are
multiple types of firewalls: peripheral, memory, ... 

Some hardware firewall controllers such as the RIFSC implemented on
STM32MP2x platforms may require to take ownership of a resource before
being able to use it, hence the requirement for firewall services to
take/release the ownership of such resources.

On the other hand, hardware firewall configurations are becoming
more and more complex. These mecanisms prevent platform crashes
or other firewall-related incoveniences by denying access to some
resources.

The stm32 firewall framework offers an API that is defined in
firewall controllers drivers to best fit the specificity of each
firewall.

For every peripherals protected by either the ETZPC or the RIFSC, the
firewall framework checks the firewall controlelr registers to see if
the peripheral's access is granted to the Linux kernel. If not, the
peripheral is configured as secure, the node is marked populated,
so that the driver is not probed for that device.

The firewall framework relies on the access-controller device tree
binding. It is used by peripherals to reference a domain access
controller. In this case a firewall controller. The bus uses the ID
referenced by the access-controller property to know where to look
in the firewall to get the security configuration for the peripheral.
This allows a device tree description rather than a hardcoded peripheral
table in the bus driver.

The STM32 ETZPC device is responsible for filtering accesses based on
security level, or co-processor isolation for any resource connected
to it.

The RIFSC is responsible for filtering accesses based on Compartment
ID / security level / privilege level for any resource connected to
it.

STM32MP13/15/25 SoC device tree files are updated in this series to
implement this mecanism.

Changes in V9:
	- Added Rob's reviews tags on bindings/of files
	- Added "simple-bus" to RIFSC/ETZPC compatible item list
	
Changes in V8:
	- Add missing "simple-bus" compatible in STM32MP13/25 SoC
	  device tree files for the ETZPC/RIFSC nodes
	- Add missing dependency on OF for OF_DYNAMIC that is selected
	  by STM32_FIREWALL

Changes in V7:
	- Separate indentation changes from access-controllers changes
	  in the device tree file commits
	- Select OF_DYNAMIC when STM32_FIREWALL is set in order to use
	  of_detach_node() in the firewall framework
	- Handle previously non-present RNG and HASH nodes in the
	  STM32MP13 device tree file

Changes in V6:
	- Rename access-controller to access-controllers
	- Remove access-controller-provider
	- Update device trees and other bindings accordingly
	- Rework ETZPC/RIFSC bindings to define what access-controllers
	  cells contain inside #access-controller-cells
	- Some other minor fixes

Changes in V5:
	- Integrate and rework the "feature-domains" binding patch in
	  this patchset. The binding is renamed to "access-controller"
	- Rename every feature-domain* reference to access-control*
	  ones
	- Correct loop bug and missing select STM32_FIREWALL in 32-bit
	  platform Kconfig
	

Changes in V4:
	- Fix typo in commit message and YAML check errors in
	  "dt-bindings: Document common device controller bindings"
	  Note: This patch should be ignored as stated in the cover
	  letter. I've done this to avoid errors on this series of
	  patch
	- Correct code syntax/style issues reported by Simon Horman
	- Added Jonathan's tag for IIO on the treewide patch

Changes in V3:

	Change incorrect ordering for bindings commits leading
	to an error while running
	"make DT_CHECKER_FLAGS=-m dt_binding_check"

Changes in V2:

	generic:
		- Add fw_devlink dependency for "feature-domains"
		  property.

	bindings:
		- Corrected YAMLS errors highlighted by Rob's robot
		- Firewall controllers YAMLs no longer define the
		  maxItems for the "feature-domains" property
		- Renamed st,stm32-rifsc.yaml to
		  st,stm32mp25-rifsc.yaml
		- Fix examples in YAML files
		- Change feature-domains maxItems to 2 in firewall
		  consumer files as there should not be more than
		  2 entries for now
		- Declare "feature-domain-names" as an optional
		  property for firewall controllers child nodes.
		- Add missing "feature-domains" property declaration
		  in bosch,m_can.yaml and st,stm32-cryp.yaml files

	firewall framework:
		- Support multiple entries for "feature-domains"
		  property
		- Better handle the device-tree parsing using
		  phandle+args APIs
		- Remove "resource firewall" type
		- Add a field for the name of the firewall entry
		- Fix licenses
	
	RIFSC:
		- Add controller name
		- Driver is now a module_platform_driver
		- Fix license

	ETZPC:
		- Add controller name
		- Driver is now a module_platform_driver
		- Fix license

	Device trees:
		- Fix rifsc node name
		- Move the "ranges" property under the
		  "feature-domains" one

Gatien Chevallier (12):
  dt-bindings: treewide: add access-controllers description
  dt-bindings: bus: document RIFSC
  dt-bindings: bus: document ETZPC
  firewall: introduce stm32_firewall framework
  of: property: fw_devlink: Add support for "access-controller"
  bus: rifsc: introduce RIFSC firewall controller driver
  arm64: dts: st: add RIFSC as an access controller for STM32MP25x
    boards
  bus: etzpc: introduce ETZPC firewall controller driver
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP15x boards
  ARM: dts: stm32: put ETZPC as an access controller for STM32MP15x
    boards
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards
  ARM: dts: stm32: put ETZPC as an access controller for STM32MP13x
    boards

Oleksii Moisieiev (1):
  dt-bindings: document generic access controllers

 .../access-controllers.yaml                   |   84 +
 .../bindings/bus/st,stm32-etzpc.yaml          |   96 +
 .../bindings/bus/st,stm32mp25-rifsc.yaml      |  105 +
 .../bindings/crypto/st,stm32-cryp.yaml        |    4 +
 .../bindings/crypto/st,stm32-hash.yaml        |    4 +
 .../devicetree/bindings/dma/st,stm32-dma.yaml |    4 +
 .../bindings/dma/st,stm32-dmamux.yaml         |    4 +
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |    4 +
 .../bindings/iio/adc/st,stm32-adc.yaml        |    4 +
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |    4 +
 .../bindings/iio/dac/st,stm32-dac.yaml        |    4 +
 .../bindings/media/cec/st,stm32-cec.yaml      |    4 +
 .../bindings/media/st,stm32-dcmi.yaml         |    4 +
 .../memory-controllers/st,stm32-fmc2-ebi.yaml |    4 +
 .../bindings/mfd/st,stm32-lptimer.yaml        |    4 +
 .../bindings/mfd/st,stm32-timers.yaml         |    4 +
 .../devicetree/bindings/mmc/arm,pl18x.yaml    |    4 +
 .../bindings/net/can/bosch,m_can.yaml         |    4 +
 .../devicetree/bindings/net/stm32-dwmac.yaml  |    4 +
 .../bindings/phy/phy-stm32-usbphyc.yaml       |    4 +
 .../bindings/regulator/st,stm32-vrefbuf.yaml  |    4 +
 .../devicetree/bindings/rng/st,stm32-rng.yaml |    4 +
 .../bindings/serial/st,stm32-uart.yaml        |    4 +
 .../bindings/sound/st,stm32-i2s.yaml          |    4 +
 .../bindings/sound/st,stm32-sai.yaml          |    4 +
 .../bindings/sound/st,stm32-spdifrx.yaml      |    4 +
 .../bindings/spi/st,stm32-qspi.yaml           |    4 +
 .../devicetree/bindings/spi/st,stm32-spi.yaml |    4 +
 .../devicetree/bindings/usb/dwc2.yaml         |    4 +
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/st/stm32mp131.dtsi          | 1063 ++++---
 arch/arm/boot/dts/st/stm32mp133.dtsi          |   51 +-
 arch/arm/boot/dts/st/stm32mp13xc.dtsi         |   19 +-
 arch/arm/boot/dts/st/stm32mp13xf.dtsi         |   19 +-
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 2756 +++++++++--------
 arch/arm/boot/dts/st/stm32mp153.dtsi          |   52 +-
 arch/arm/boot/dts/st/stm32mp15xc.dtsi         |   19 +-
 arch/arm/mach-stm32/Kconfig                   |    1 +
 arch/arm64/Kconfig.platforms                  |    1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |    7 +-
 drivers/bus/Kconfig                           |   10 +
 drivers/bus/Makefile                          |    1 +
 drivers/bus/stm32_etzpc.c                     |  141 +
 drivers/bus/stm32_firewall.c                  |  294 ++
 drivers/bus/stm32_firewall.h                  |   83 +
 drivers/bus/stm32_rifsc.c                     |  252 ++
 drivers/of/property.c                         |    2 +
 include/linux/bus/stm32_firewall_device.h     |  141 +
 48 files changed, 3370 insertions(+), 1938 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
 create mode 100644 drivers/bus/stm32_etzpc.c
 create mode 100644 drivers/bus/stm32_firewall.c
 create mode 100644 drivers/bus/stm32_firewall.h
 create mode 100644 drivers/bus/stm32_rifsc.c
 create mode 100644 include/linux/bus/stm32_firewall_device.h

-- 
2.35.3


