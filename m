Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8329E748A1E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 19:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbjGER3K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 13:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjGER3J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 13:29:09 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72E3188;
        Wed,  5 Jul 2023 10:29:07 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365FWsxt003059;
        Wed, 5 Jul 2023 19:28:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=MIhovnbgvnMdNtHNxjg0wEK4d4BXCh9D4rqEom4bNLc=;
 b=O/EQFxcpOihBGN4SRp2i4E0s5PwExEVaYYg33yZifbN58K9wNb75zntBCBYIp8VzHAuL
 zIdKiETDjlsJsnfX6JYP3z5zxsommrO+m34V9Ip2dVf4weVqMjOB5/EVtgSVZ9uNovMi
 T2IZ1XXDOW6kPHcfw+R4EX/XtvrwuhZWClNKnmfY88jwMyj8HM7gOSdho01gDK3J6cUT
 8WfZEsDQS/raoTmbzo+KGxiu7Cm1tNT1+epmyaLA41Feszf5s0z2I6bCeBKN1st7h/4M
 hkVzC2Sp7tM3vNaQ9fJKbVk4LqXMie3tTC8KirRfrbnonMIierq+tjMwPTssjQf/ntUs Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn8c9t2d3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 19:28:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86C91100057;
        Wed,  5 Jul 2023 19:28:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D30824C42F;
        Wed,  5 Jul 2023 19:28:30 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:28:29 +0200
From:   Gatien Chevallier <gatien.chevallier@foss.st.com>
To:     <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>
CC:     <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH 00/10] Introduce STM32 Firewall framework
Date:   Wed, 5 Jul 2023 19:27:49 +0200
Message-ID: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_09,2023-07-05_01,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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

The firewall framework relies on the feature-domain-controller device
tree bindings: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b.
It is used by peripherals to reference a domain controller, in this
case a firewall feature domain. The bus uses the ID referenced by
the feature-domains property to know where to look in the firewall
to get the security configuration for the peripheral. This allows
a device tree description rather than a hardcoded peripheral table
in the bus driver.

The STM32 ETZPC device is responsible for filtering accesses based on
security level, or co-processor isolation for any resource connected
to it.

The RIFSC is responsible for filtering accesses based on Compartment
ID / security level / privilege level for any resource connected to
it.

STM32MP13/15/25 SoC device tree files are updated in this series to
implement this mecanism.

Oleksii Moisieiev (1):
  dt-bindings: Document common device controller bindings

Gatien Chevallier (9):
  dt-bindings: bus: add device tree bindings for RIFSC
  dt-bindings: bus: add device tree bindings for ETZPC
  dt-bindings: treewide: add feature-domains description in binding
    files
  firewall: introduce stm32_firewall framework
  bus: rifsc: introduce RIFSC firewall controller driver
  arm64: dts: st: add RIFSC as a domain controller for STM32MP25x boards
  bus: etzpc: introduce ETZPC firewall controller driver
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP15x boards
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards

 .../bindings/bus/st,stm32-etzpc.yaml          |   90 +
 .../bindings/bus/st,stm32-rifsc.yaml          |  101 +
 .../bindings/crypto/st,stm32-hash.yaml        |    4 +
 .../devicetree/bindings/dma/st,stm32-dma.yaml |    4 +
 .../bindings/dma/st,stm32-dmamux.yaml         |    4 +
 .../feature-domain-controller.yaml            |   84 +
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |    4 +
 .../bindings/iio/adc/st,stm32-adc.yaml        |    4 +
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |    4 +
 .../bindings/iio/dac/st,stm32-dac.yaml        |    4 +
 .../bindings/media/cec/st,stm32-cec.yaml      |    4 +
 .../bindings/media/st,stm32-dcmi.yaml         |    4 +
 .../memory-controllers/st,stm32-fmc2-ebi.yaml |    4 +
 .../bindings/mfd/st,stm32-lptimer.yaml        |    4 +
 .../bindings/mfd/st,stm32-timers.yaml         |    5 +
 .../devicetree/bindings/mmc/arm,pl18x.yaml    |    4 +
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
 arch/arm/boot/dts/st/stm32mp131.dtsi          | 1027 +++---
 arch/arm/boot/dts/st/stm32mp133.dtsi          |   51 +-
 arch/arm/boot/dts/st/stm32mp13xc.dtsi         |   19 +-
 arch/arm/boot/dts/st/stm32mp13xf.dtsi         |   19 +-
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 2757 +++++++++--------
 arch/arm/boot/dts/st/stm32mp153.dtsi          |   52 +-
 arch/arm/boot/dts/st/stm32mp15xc.dtsi         |   19 +-
 arch/arm64/Kconfig.platforms                  |    1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |    5 +-
 drivers/bus/Kconfig                           |   10 +
 drivers/bus/Makefile                          |    1 +
 drivers/bus/stm32_etzpc.c                     |  137 +
 drivers/bus/stm32_firewall.c                  |  252 ++
 drivers/bus/stm32_firewall.h                  |   83 +
 drivers/bus/stm32_rifsc.c                     |  248 ++
 include/linux/bus/stm32_firewall_device.h     |  134 +
 44 files changed, 3276 insertions(+), 1918 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml
 create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
 create mode 100644 drivers/bus/stm32_etzpc.c
 create mode 100644 drivers/bus/stm32_firewall.c
 create mode 100644 drivers/bus/stm32_firewall.h
 create mode 100644 drivers/bus/stm32_rifsc.c
 create mode 100644 include/linux/bus/stm32_firewall_device.h

-- 
2.25.1

