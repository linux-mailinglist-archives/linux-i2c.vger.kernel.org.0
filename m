Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3DF748AB1
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 19:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbjGERgI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 13:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjGERgH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 13:36:07 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DE91BEB;
        Wed,  5 Jul 2023 10:35:41 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365FaBp3003086;
        Wed, 5 Jul 2023 19:35:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=shpntqm9Lb88tQ8tlCGuG2FwYoCeA99QpOjJ1mJ95MI=;
 b=B9NUeEVnBg8MdHStPnL4TOmJhyuqDrSpAiTXxO/nPPpzy04upCGkWFZloothm1IsdlaP
 X2dM2UcrLRYot6pDInpUaDfpMw4tRdOgSMjIIUt05sxIHPJTt05NtgJdfiSkjWYJGqQo
 5Qf6gvHVZoCkeCGLEsdD07XE10xUn4T3IucwxfOuRptLSABHo82p+XsFpOmpXmiiGV0P
 XYKMcsbwul2uScBGSCEWMtTWo929/YaPT+Wh3TxrAMZmjHQzF56NlcYYWFxkdKCpyT5u
 NiyW4MLstguYxELgKwv13IwhUcKcDJWT1p8IlKqjWxQyak83KOQne1tFXm8DXME2V55K Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn8c9t3jy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 19:35:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E6D9100057;
        Wed,  5 Jul 2023 19:35:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2427D24C451;
        Wed,  5 Jul 2023 19:35:15 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:35:12 +0200
Message-ID: <f8c6e86d-af6a-b61f-c642-c23cb3cfb015@foss.st.com>
Date:   Wed, 5 Jul 2023 19:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/6] Introduce STM32 system bus
Content-Language: en-US
To:     <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <alexandre.torgue@foss.st.com>, <vkoul@kernel.org>,
        <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>
CC:     <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_09,2023-07-05_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all,

I'm abandoning this series for:
https://lore.kernel.org/lkml/20230705172759.1610753

Sorry for the noise.

Best regards,
Gatien

On 1/27/23 17:40, Gatien Chevallier wrote:
> Document STM32 System Bus. This bus is intended to control firewall
> access for the peripherals connected to it.
> 
> For every peripheral, the bus checks the firewall registers to see
> if the peripheral is configured as non-secure. If the peripheral
> is configured as secure, the node is marked populated, so the
> device won't be probed.
> 
> This is useful as a firewall configuration sanity check and avoid
> platform crashes in case peripherals are incorrectly configured.
> 
> The STM32 System Bus implements the feature-domain-controller
> bindings. It is used by peripherals to reference a domain
> controller, in this case the firewall feature domain.
> The bus uses the ID referenced by the feature-domains property to
> know where to look in the firewall to get the security configuration
> for the peripheral. This allows a device tree description rather
> than a hardcoded peripheral table in the bus driver.
> 
> On STM32MP13/15 platforms, the firewall bus is represented by the
> ETZPC node, which is responsible for the securing / MCU isolating
> the capable peripherals.
> 
> STM32MP13/15 device trees are updated in this series to implement
> the bus. All peripherals that are securable or MCU isolation capable
> by the ETZPC are connected to the bus.
> 
> Changes in V2:
> 	- Corrected YAMLS errors highlighted by Rob's robot
> 	- Re-ordered Signed-off-by tags in two patches
> 
> Changes in V3:
> 	- Document feature-domains property in YAML documentation for
> 	concerned periperals under the System Bus
> 	- Fix STM32 System Bus YAML documentation
> 	- Remove STM32 System bus bindings that were currently used
> 	as helpers for device tree
> 	- Correct few errors in driver
> 	- Add missing peripherals under the System Bus that were in
> 	SoC variation device tree files
> 	- Fix node names
> 
> Gatien Chevallier (5):
>    dt-bindings: treewide: add feature-domains description in binding
>      files
>    dt-bindings: bus: add STM32 System Bus
>    bus: stm32_sys_bus: add support for STM32MP15 and STM32MP13 system bus
>    ARM: dts: stm32: add ETZPC as a system bus for STM32MP15x boards
>    ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards
> 
> Oleksii Moisieiev (1):
>    dt-bindings: Document common device controller bindings
> 
>   .../devicetree/bindings/bus/st,sys-bus.yaml   |  127 +
>   .../bindings/crypto/st,stm32-hash.yaml        |    5 +
>   .../devicetree/bindings/dma/st,stm32-dma.yaml |    5 +
>   .../bindings/dma/st,stm32-dmamux.yaml         |    5 +
>   .../feature-domain-controller.yaml            |   84 +
>   .../devicetree/bindings/i2c/st,stm32-i2c.yaml |    5 +
>   .../bindings/iio/adc/st,stm32-adc.yaml        |    5 +
>   .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |    5 +
>   .../bindings/iio/dac/st,stm32-dac.yaml        |    5 +
>   .../bindings/media/st,stm32-cec.yaml          |    5 +
>   .../bindings/media/st,stm32-dcmi.yaml         |    5 +
>   .../memory-controllers/st,stm32-fmc2-ebi.yaml |    5 +
>   .../bindings/mfd/st,stm32-lptimer.yaml        |    5 +
>   .../bindings/mfd/st,stm32-timers.yaml         |    6 +
>   .../devicetree/bindings/mmc/arm,pl18x.yaml    |    5 +
>   .../devicetree/bindings/net/stm32-dwmac.yaml  |    5 +
>   .../bindings/phy/phy-stm32-usbphyc.yaml       |    5 +
>   .../bindings/regulator/st,stm32-vrefbuf.yaml  |    5 +
>   .../devicetree/bindings/rng/st,stm32-rng.yaml |    5 +
>   .../bindings/serial/st,stm32-uart.yaml        |    5 +
>   .../bindings/sound/st,stm32-i2s.yaml          |    5 +
>   .../bindings/sound/st,stm32-sai.yaml          |    5 +
>   .../bindings/sound/st,stm32-spdifrx.yaml      |    5 +
>   .../bindings/spi/st,stm32-qspi.yaml           |    5 +
>   .../devicetree/bindings/spi/st,stm32-spi.yaml |    5 +
>   .../devicetree/bindings/usb/dwc2.yaml         |    5 +
>   MAINTAINERS                                   |    6 +
>   arch/arm/boot/dts/stm32mp131.dtsi             |  407 +--
>   arch/arm/boot/dts/stm32mp133.dtsi             |   51 +-
>   arch/arm/boot/dts/stm32mp13xc.dtsi            |   19 +-
>   arch/arm/boot/dts/stm32mp13xf.dtsi            |   18 +-
>   arch/arm/boot/dts/stm32mp151.dtsi             | 2722 +++++++++--------
>   arch/arm/boot/dts/stm32mp153.dtsi             |   52 +-
>   arch/arm/boot/dts/stm32mp15xc.dtsi            |   19 +-
>   drivers/bus/Kconfig                           |    9 +
>   drivers/bus/Makefile                          |    1 +
>   drivers/bus/stm32_sys_bus.c                   |  168 +
>   37 files changed, 2208 insertions(+), 1596 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/bus/st,sys-bus.yaml
>   create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
>   create mode 100644 drivers/bus/stm32_sys_bus.c
> 
