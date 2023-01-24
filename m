Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7683679C63
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 15:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbjAXOsf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 09:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232952AbjAXOse (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 09:48:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB9C30188;
        Tue, 24 Jan 2023 06:48:28 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7DA88A9;
        Tue, 24 Jan 2023 15:48:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674571706;
        bh=yuoA1ps00Z7pHSGr1F7KvvXffybyFCmuT6ET8nmXfFY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=h1trapc1ggfphQPDd09+FN4tZjLRAMD+kC0uAuZUZnpijH4Hv8S3u+bTj0Wrawt4w
         Tswb83WGNhKPWPDzFW50vy8VD95w/0+NW8IMcqHuKClBJzI/CO6Iq7WhOEbpb+hUZq
         xwqRUIk3Y/mRiRrRPktCGqmCyLQHrcwA7CkMtdOA=
Message-ID: <beaebec6-4ec5-8041-5f70-a974ae417a78@ideasonboard.com>
Date:   Tue, 24 Jan 2023 16:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 5/7] media: i2c: add DS90UB960 driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230120153417.1156207-1-tomi.valkeinen@ideasonboard.com>
 <20230120153417.1156207-6-tomi.valkeinen@ideasonboard.com>
 <Y88EhodG7b+oSvtE@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y88EhodG7b+oSvtE@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent,

On 24/01/2023 00:04, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.

Thank you for the review!

> On Fri, Jan 20, 2023 at 05:34:15PM +0200, Tomi Valkeinen wrote:
>> Add driver for TI DS90UB960 FPD-Link III Deserializer.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   MAINTAINERS                   |    8 +
>>   drivers/media/i2c/Kconfig     |   21 +
>>   drivers/media/i2c/Makefile    |    1 +
>>   drivers/media/i2c/ds90ub960.c | 4278 +++++++++++++++++++++++++++++++++
> 
> Oh my... You're trying to kill reviewers, aren't you ? :-)

No, just trying to tire them out...

>>   include/media/i2c/ds90ub9xx.h |   16 +
>>   5 files changed, 4324 insertions(+)
>>   create mode 100644 drivers/media/i2c/ds90ub960.c
>>   create mode 100644 include/media/i2c/ds90ub9xx.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ba716f2861cf..d0dc8572191d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20626,6 +20626,14 @@ F:	drivers/misc/tifm*
>>   F:	drivers/mmc/host/tifm_sd.c
>>   F:	include/linux/tifm.h
>>   
>> +TI FPD-LINK DRIVERS
>> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/i2c/ti,ds90*
>> +F:	drivers/media/i2c/ds90*
>> +F:	include/media/i2c/ds90*
>> +
>>   TI KEYSTONE MULTICORE NAVIGATOR DRIVERS
>>   M:	Nishanth Menon <nm@ti.com>
>>   M:	Santosh Shilimkar <ssantosh@kernel.org>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 7806d4b81716..dc1c7c80dc1c 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1595,4 +1595,25 @@ config VIDEO_THS7303
>>   
>>   endmenu
>>   
>> +#
>> +# Video serializers and deserializers (e.g. FPD-Link)
>> +#
>> +
>> +menu "Video serializers and deserializers"
>> +
>> +config VIDEO_DS90UB960
>> +	tristate "TI FPD-Link III/IV Deserializers"
>> +	depends on OF && I2C && VIDEO_DEV
>> +	select I2C_ATR
>> +	select MEDIA_CONTROLLER
>> +	select OF_GPIO
>> +	select REGMAP_I2C
>> +	select V4L2_FWNODE
>> +	select VIDEO_V4L2_SUBDEV_API
>> +	help
>> +	  Device driver for the Texas Instruments DS90UB960
>> +	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
>> +
>> +endmenu
>> +
>>   endif # VIDEO_DEV
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index 0a2933103dd9..4cd680f3b953 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -142,3 +142,4 @@ obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
>>   obj-$(CONFIG_VIDEO_VS6624) += vs6624.o
>>   obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
>>   obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
>> +obj-$(CONFIG_VIDEO_DS90UB960)	+= ds90ub960.o
> 
> Alphabetical order, and replace the tab with a space.

Ok.

>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
>> new file mode 100644
>> index 000000000000..eb391f0259b3
>> --- /dev/null
>> +++ b/drivers/media/i2c/ds90ub960.c
>> @@ -0,0 +1,4278 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for the Texas Instruments DS90UB960-Q1 video deserializer
>> + *
>> + * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
>> + * Copyright (c) 2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/fwnode.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c-atr.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/kthread.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/property.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include <media/i2c/ds90ub9xx.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#define MHZ(v) ((u32)((v) * 1000000U))
> 
> This really sounds like a candidate for include/linux/units.h...
> 
>> +
>> +#define UB960_POLL_TIME_MS	500
>> +
>> +#define UB960_MAX_RX_NPORTS	4
>> +#define UB960_MAX_TX_NPORTS	2
>> +#define UB960_MAX_NPORTS	(UB960_MAX_RX_NPORTS + UB960_MAX_TX_NPORTS)
> 
> Is it the maximum number of ports, or just the number of ports ? In the
> latter case, I'd write UB960_NUM_RX_PORTS, UB960_NUM_TX_PORTS and
> UB960_NUM_PORTS.

Maximum number.

>> +
>> +#define UB960_MAX_PORT_ALIASES	8
>> +#define UB960_MAX_POOL_ALIASES	(UB960_MAX_RX_NPORTS * UB960_MAX_PORT_ALIASES)
> 
> Not used.

Right, I think I changed this to a more dynamic alloc at some point.

>> +
>> +#define UB960_NUM_BC_GPIOS		4
>> +
>> +/*
>> + * Register map
>> + *
>> + * 0x00-0x32   Shared (UB960_SR)
>> + * 0x33-0x3A   CSI-2 TX (per-port paged on DS90UB960, shared on 954) (UB960_TR)
>> + * 0x4C        Shared (UB960_SR)
>> + * 0x4D-0x7F   FPD-Link RX, per-port paged (UB960_RR)
>> + * 0xB0-0xBF   Shared (UB960_SR)
>> + * 0xD0-0xDF   FPD-Link RX, per-port paged (UB960_RR)
>> + * 0xF0-0xF5   Shared (UB960_SR)
>> + * 0xF8-0xFB   Shared (UB960_SR)
>> + * All others  Reserved
>> + *
>> + * Register prefixes:
>> + * UB960_SR_* = Shared register
>> + * UB960_RR_* = FPD-Link RX, per-port paged register
>> + * UB960_TR_* = CSI-2 TX, per-port paged register
>> + * UB960_XR_* = Reserved register
>> + * UB960_IR_* = Indirect register
>> + */
>> +
>> +#define UB960_SR_I2C_DEV_ID			0x00
>> +#define UB960_SR_RESET				0x01
>> +#define UB960_SR_RESET_DIGITAL_RESET1		BIT(1)
>> +#define UB960_SR_RESET_DIGITAL_RESET0		BIT(0)
>> +#define UB960_SR_RESET_GPIO_LOCK_RELEASE	BIT(5)
>> +
>> +#define UB960_SR_GEN_CONFIG			0x02
>> +#define UB960_SR_REV_MASK			0x03
>> +#define UB960_SR_DEVICE_STS			0x04
>> +#define UB960_SR_PAR_ERR_THOLD_HI		0x05
>> +#define UB960_SR_PAR_ERR_THOLD_LO		0x06
>> +#define UB960_SR_BCC_WDOG_CTL			0x07
>> +#define UB960_SR_I2C_CTL1			0x08
>> +#define UB960_SR_I2C_CTL2			0x09
>> +#define UB960_SR_SCL_HIGH_TIME			0x0A
> 
> Lowercase hex values, to match the other drivers ?

Ok.

>> +#define UB960_SR_SCL_LOW_TIME			0x0B
>> +#define UB960_SR_RX_PORT_CTL			0x0C
>> +#define UB960_SR_IO_CTL				0x0D
>> +#define UB960_SR_GPIO_PIN_STS			0x0E
>> +#define UB960_SR_GPIO_INPUT_CTL			0x0F
>> +#define UB960_SR_GPIO_PIN_CTL(n)		(0x10 + (n)) /* n < UB960_NUM_GPIOS */
>> +#define UB960_SR_GPIO_PIN_CTL_GPIO_OUT_SEL		5
>> +#define UB960_SR_GPIO_PIN_CTL_GPIO_OUT_SRC_SHIFT	2
>> +#define UB960_SR_GPIO_PIN_CTL_GPIO_OUT_EN		BIT(0)
>> +
>> +#define UB960_SR_FS_CTL				0x18
>> +#define UB960_SR_FS_HIGH_TIME_1			0x19
>> +#define UB960_SR_FS_HIGH_TIME_0			0x1A
>> +#define UB960_SR_FS_LOW_TIME_1			0x1B
>> +#define UB960_SR_FS_LOW_TIME_0			0x1C
>> +#define UB960_SR_MAX_FRM_HI			0x1D
>> +#define UB960_SR_MAX_FRM_LO			0x1E
>> +#define UB960_SR_CSI_PLL_CTL			0x1F
>> +
>> +#define UB960_SR_FWD_CTL1			0x20
>> +#define UB960_SR_FWD_CTL1_PORT_DIS(n)		BIT((n) + 4)
>> +
>> +#define UB960_SR_FWD_CTL2			0x21
>> +#define UB960_SR_FWD_STS			0x22
>> +
>> +#define UB960_SR_INTERRUPT_CTL			0x23
>> +#define UB960_SR_INTERRUPT_CTL_INT_EN		BIT(7)
>> +#define UB960_SR_INTERRUPT_CTL_IE_CSI_TX0	BIT(4)
>> +#define UB960_SR_INTERRUPT_CTL_IE_RX(n)		BIT((n)) /* rxport[n] IRQ */
>> +#define UB960_SR_INTERRUPT_CTL_ALL		0x83 /* TODO 0x93 to enable CSI */
> 
> What is this TODO about ?

Looks like a bitmask of all the irq bits, except CSI. And 0x93 would 
also enable CSI. I have no idea why this define is here, I'll remove it.

>> +
>> +#define UB960_SR_INTERRUPT_STS			0x24
>> +#define UB960_SR_INTERRUPT_STS_INT		BIT(7)
>> +#define UB960_SR_INTERRUPT_STS_IS_CSI_TX(n)	BIT(4 + (n)) /* txport[n] IRQ */
>> +#define UB960_SR_INTERRUPT_STS_IS_RX(n)		BIT((n)) /* rxport[n] IRQ */
>> +
>> +#define UB960_SR_TS_CONFIG			0x25
>> +#define UB960_SR_TS_CONTROL			0x26
>> +#define UB960_SR_TS_LINE_HI			0x27
>> +#define UB960_SR_TS_LINE_LO			0x28
>> +#define UB960_SR_TS_STATUS			0x29
>> +#define UB960_SR_TIMESTAMP_P0_HI		0x2A
>> +#define UB960_SR_TIMESTAMP_P0_LO		0x2B
>> +#define UB960_SR_TIMESTAMP_P1_HI		0x2C
>> +#define UB960_SR_TIMESTAMP_P1_LO		0x2D
>> +
>> +#define UB960_SR_CSI_PORT_SEL			0x32
>> +
>> +#define UB960_TR_CSI_CTL			0x33
>> +#define UB960_TR_CSI_CTL_CSI_CAL_EN		BIT(6)
>> +#define UB960_TR_CSI_CTL_CSI_ENABLE		BIT(0)
>> +
>> +#define UB960_TR_CSI_CTL2			0x34
>> +#define UB960_TR_CSI_STS			0x35
>> +#define UB960_TR_CSI_TX_ICR			0x36
>> +
>> +#define UB960_TR_CSI_TX_ISR			0x37
>> +#define UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR	BIT(3)
>> +#define UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR	BIT(1)
>> +
>> +#define UB960_TR_CSI_TEST_CTL			0x38
>> +#define UB960_TR_CSI_TEST_PATT_HI		0x39
>> +#define UB960_TR_CSI_TEST_PATT_LO		0x3A
>> +
>> +#define UB960_XR_SFILTER_CFG			0x41
>> +#define UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT	4
>> +#define UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT	0
>> +
>> +#define UB960_XR_AEQ_CTL1			0x42
>> +#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_FPD_CLK	BIT(6)
>> +#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_ENCODING	BIT(5)
>> +#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_PARITY	BIT(4)
>> +#define UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_MASK        \
>> +	(UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_FPD_CLK |  \
>> +	 UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_ENCODING | \
>> +	 UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_PARITY)
>> +#define UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN	BIT(0)
>> +
>> +#define UB960_XR_AEQ_ERR_THOLD			0x43
>> +
>> +#define UB960_RR_BCC_ERR_CTL			0x46
>> +#define UB960_RR_BCC_STATUS			0x47
>> +#define UB960_RR_BCC_STATUS_SEQ_ERROR		BIT(5)
>> +#define UB960_RR_BCC_STATUS_MASTER_ERR		BIT(4)
>> +#define UB960_RR_BCC_STATUS_MASTER_TO		BIT(3)
>> +#define UB960_RR_BCC_STATUS_SLAVE_ERR		BIT(2)
>> +#define UB960_RR_BCC_STATUS_SLAVE_TO		BIT(1)
>> +#define UB960_RR_BCC_STATUS_RESP_ERR		BIT(0)
>> +#define UB960_RR_BCC_STATUS_ERROR_MASK                                    \
>> +	(UB960_RR_BCC_STATUS_SEQ_ERROR | UB960_RR_BCC_STATUS_MASTER_ERR | \
>> +	 UB960_RR_BCC_STATUS_MASTER_TO | UB960_RR_BCC_STATUS_SLAVE_ERR |  \
>> +	 UB960_RR_BCC_STATUS_SLAVE_TO | UB960_RR_BCC_STATUS_RESP_ERR)
>> +
>> +#define UB960_RR_FPD3_CAP			0x4A
>> +#define UB960_RR_RAW_EMBED_DTYPE		0x4B
>> +#define UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT	6
>> +
>> +#define UB960_SR_FPD3_PORT_SEL			0x4C
>> +
>> +#define UB960_RR_RX_PORT_STS1			0x4D
>> +#define UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR	BIT(5)
>> +#define UB960_RR_RX_PORT_STS1_LOCK_STS_CHG	BIT(4)
>> +#define UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR	BIT(3)
>> +#define UB960_RR_RX_PORT_STS1_PARITY_ERROR	BIT(2)
>> +#define UB960_RR_RX_PORT_STS1_PORT_PASS		BIT(1)
>> +#define UB960_RR_RX_PORT_STS1_LOCK_STS		BIT(0)
>> +#define UB960_RR_RX_PORT_STS1_ERROR_MASK       \
>> +	(UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR | \
>> +	 UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR | \
>> +	 UB960_RR_RX_PORT_STS1_PARITY_ERROR)
>> +
>> +#define UB960_RR_RX_PORT_STS2			0x4E
>> +#define UB960_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE	BIT(7)
>> +#define UB960_RR_RX_PORT_STS2_LINE_LEN_CHG	BIT(6)
>> +#define UB960_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR	BIT(5)
>> +#define UB960_RR_RX_PORT_STS2_BUFFER_ERROR	BIT(4)
>> +#define UB960_RR_RX_PORT_STS2_CSI_ERROR		BIT(3)
>> +#define UB960_RR_RX_PORT_STS2_FREQ_STABLE	BIT(2)
>> +#define UB960_RR_RX_PORT_STS2_CABLE_FAULT	BIT(1)
>> +#define UB960_RR_RX_PORT_STS2_LINE_CNT_CHG	BIT(0)
>> +#define UB960_RR_RX_PORT_STS2_ERROR_MASK       \
>> +	UB960_RR_RX_PORT_STS2_BUFFER_ERROR
>> +
>> +#define UB960_RR_RX_FREQ_HIGH			0x4F
>> +#define UB960_RR_RX_FREQ_LOW			0x50
>> +#define UB960_RR_SENSOR_STS_0			0x51
>> +#define UB960_RR_SENSOR_STS_1			0x52
>> +#define UB960_RR_SENSOR_STS_2			0x53
>> +#define UB960_RR_SENSOR_STS_3			0x54
>> +#define UB960_RR_RX_PAR_ERR_HI			0x55
>> +#define UB960_RR_RX_PAR_ERR_LO			0x56
>> +#define UB960_RR_BIST_ERR_COUNT			0x57
>> +
>> +#define UB960_RR_BCC_CONFIG			0x58
>> +#define UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH	BIT(6)
>> +#define UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK	GENMASK(2, 0)
>> +
>> +#define UB960_RR_DATAPATH_CTL1			0x59
>> +#define UB960_RR_DATAPATH_CTL2			0x5A
>> +#define UB960_RR_SER_ID				0x5B
>> +#define UB960_RR_SER_ALIAS_ID			0x5C
>> +
>> +/* For these two register sets: n < UB960_MAX_PORT_ALIASES */
>> +#define UB960_RR_SLAVE_ID(n)			(0x5D + (n))
>> +#define UB960_RR_SLAVE_ALIAS(n)			(0x65 + (n))
>> +
>> +#define UB960_RR_PORT_CONFIG			0x6D
>> +#define UB960_RR_PORT_CONFIG_FPD3_MODE_MASK	GENMASK(1, 0)
>> +
>> +#define UB960_RR_BC_GPIO_CTL(n)			(0x6E + (n)) /* n < 2 */
>> +#define UB960_RR_RAW10_ID			0x70
>> +#define UB960_RR_RAW10_ID_VC_SHIFT		6
>> +#define UB960_RR_RAW10_ID_DT_SHIFT		0
>> +
>> +#define UB960_RR_RAW12_ID			0x71
>> +#define UB960_RR_CSI_VC_MAP			0x72
>> +#define UB960_RR_CSI_VC_MAP_SHIFT(x)		((x) * 2)
>> +
>> +#define UB960_RR_LINE_COUNT_HI			0x73
>> +#define UB960_RR_LINE_COUNT_LO			0x74
>> +#define UB960_RR_LINE_LEN_1			0x75
>> +#define UB960_RR_LINE_LEN_0			0x76
>> +#define UB960_RR_FREQ_DET_CTL			0x77
>> +#define UB960_RR_MAILBOX_1			0x78
>> +#define UB960_RR_MAILBOX_2			0x79
>> +
>> +#define UB960_RR_CSI_RX_STS			0x7A
>> +#define UB960_RR_CSI_RX_STS_LENGTH_ERR		BIT(3)
>> +#define UB960_RR_CSI_RX_STS_CKSUM_ERR		BIT(2)
>> +#define UB960_RR_CSI_RX_STS_ECC2_ERR		BIT(1)
>> +#define UB960_RR_CSI_RX_STS_ECC1_ERR		BIT(0)
>> +#define UB960_RR_CSI_RX_STS_ERROR_MASK                                    \
>> +	(UB960_RR_CSI_RX_STS_LENGTH_ERR | UB960_RR_CSI_RX_STS_CKSUM_ERR | \
>> +	 UB960_RR_CSI_RX_STS_ECC2_ERR | UB960_RR_CSI_RX_STS_ECC1_ERR)
>> +
>> +#define UB960_RR_CSI_ERR_COUNTER		0x7B
>> +#define UB960_RR_PORT_CONFIG2			0x7C
>> +#define UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_MASK GENMASK(7, 6)
>> +#define UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_SHIFT 6
>> +
>> +#define UB960_RR_PORT_CONFIG2_LV_POL_LOW	BIT(1)
>> +#define UB960_RR_PORT_CONFIG2_FV_POL_LOW	BIT(0)
>> +
>> +#define UB960_RR_PORT_PASS_CTL			0x7D
>> +#define UB960_RR_SEN_INT_RISE_CTL		0x7E
>> +#define UB960_RR_SEN_INT_FALL_CTL		0x7F
>> +
>> +#define UB960_SR_CSI_FRAME_COUNT_HI(n)		(0x90 + 8 * (n))
>> +#define UB960_SR_CSI_FRAME_COUNT_LO(n)		(0x91 + 8 * (n))
>> +#define UB960_SR_CSI_FRAME_ERR_COUNT_HI(n)	(0x92 + 8 * (n))
>> +#define UB960_SR_CSI_FRAME_ERR_COUNT_LO(n)	(0x93 + 8 * (n))
>> +#define UB960_SR_CSI_LINE_COUNT_HI(n)		(0x94 + 8 * (n))
>> +#define UB960_SR_CSI_LINE_COUNT_LO(n)		(0x95 + 8 * (n))
>> +#define UB960_SR_CSI_LINE_ERR_COUNT_HI(n)	(0x96 + 8 * (n))
>> +#define UB960_SR_CSI_LINE_ERR_COUNT_LO(n)	(0x97 + 8 * (n))
>> +
>> +#define UB960_XR_REFCLK_FREQ			0xA5	/* UB960 */
>> +
>> +#define UB960_RR_VC_ID_MAP(x)			(0xa0 + (x)) /* UB9702 */
>> +
>> +#define UB960_SR_IND_ACC_CTL			0xB0
>> +#define UB960_SR_IND_ACC_CTL_IA_AUTO_INC	BIT(1)
>> +
>> +#define UB960_SR_IND_ACC_ADDR			0xB1
>> +#define UB960_SR_IND_ACC_DATA			0xB2
>> +#define UB960_SR_BIST_CONTROL			0xB3
>> +#define UB960_SR_MODE_IDX_STS			0xB8
>> +#define UB960_SR_LINK_ERROR_COUNT		0xB9
>> +#define UB960_SR_FPD3_ENC_CTL			0xBA
>> +#define UB960_SR_FV_MIN_TIME			0xBC
>> +#define UB960_SR_GPIO_PD_CTL			0xBE
>> +
>> +#define UB960_SR_FPD_RATE_CFG			0xc2	/* UB9702 */
>> +#define UB960_SR_CSI_PLL_DIV			0xc9	/* UB9702 */
>> +
>> +#define UB960_RR_PORT_DEBUG			0xD0
>> +#define UB960_RR_AEQ_CTL2			0xD2
>> +#define UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR		BIT(2)
>> +
>> +#define UB960_RR_AEQ_STATUS			0xD3
>> +#define UB960_RR_AEQ_STATUS_STATUS_2		GENMASK(5, 3)
>> +#define UB960_RR_AEQ_STATUS_STATUS_1		GENMASK(2, 0)
>> +
>> +#define UB960_RR_AEQ_BYPASS			0xD4
>> +#define UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT	5
>> +#define UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK	GENMASK(7, 5)
>> +#define UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT	1
>> +#define UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK	GENMASK(3, 1)
>> +#define UB960_RR_AEQ_BYPASS_ENABLE			BIT(0)
>> +
>> +#define UB960_RR_AEQ_MIN_MAX			0xD5
>> +#define UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT	4
>> +#define UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT	0
>> +
>> +#define UB960_RR_SFILTER_STS_0			0xD6
>> +#define UB960_RR_SFILTER_STS_1			0xD7
>> +#define UB960_RR_PORT_ICR_HI			0xD8
>> +#define UB960_RR_PORT_ICR_LO			0xD9
>> +#define UB960_RR_PORT_ISR_HI			0xDA
>> +#define UB960_RR_PORT_ISR_LO			0xDB
>> +#define UB960_RR_FC_GPIO_STS			0xDC
>> +#define UB960_RR_FC_GPIO_ICR			0xDD
>> +#define UB960_RR_SEN_INT_RISE_STS		0xDE
>> +#define UB960_RR_SEN_INT_FALL_STS		0xDF
>> +
>> +#define UB960_RR_CHANNEL_MODE			0xe4	/* UB9702 */
>> +
>> +#define UB960_SR_FPD3_RX_ID(n)			(0xF0 + (n))
>> +
>> +#define UB960_SR_I2C_RX_ID(n)			(0xF8 + (n)) /* < UB960_FPD_RX_NPORTS */
>> +
>> +/* Indirect register blocks */
>> +#define UB960_IND_TARGET_PAT_GEN		0x00
>> +#define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
>> +#define UB960_IND_TARGET_CSI_CSIPLL_REG_1	0x92	/* UB9702 */
>> +#define UB960_IND_TARGET_CSI_ANA		0x07
>> +
>> +/* UB960_IR_PGEN_*: Indirect Registers for Test Pattern Generator */
>> +
>> +#define UB960_IR_PGEN_CTL			0x01
>> +#define UB960_IR_PGEN_CTL_PGEN_ENABLE		BIT(0)
>> +
>> +#define UB960_IR_PGEN_CFG			0x02
>> +#define UB960_IR_PGEN_CSI_DI			0x03
>> +#define UB960_IR_PGEN_LINE_SIZE1		0x04
>> +#define UB960_IR_PGEN_LINE_SIZE0		0x05
>> +#define UB960_IR_PGEN_BAR_SIZE1			0x06
>> +#define UB960_IR_PGEN_BAR_SIZE0			0x07
>> +#define UB960_IR_PGEN_ACT_LPF1			0x08
>> +#define UB960_IR_PGEN_ACT_LPF0			0x09
>> +#define UB960_IR_PGEN_TOT_LPF1			0x0A
>> +#define UB960_IR_PGEN_TOT_LPF0			0x0B
>> +#define UB960_IR_PGEN_LINE_PD1			0x0C
>> +#define UB960_IR_PGEN_LINE_PD0			0x0D
>> +#define UB960_IR_PGEN_VBP			0x0E
>> +#define UB960_IR_PGEN_VFP			0x0F
>> +#define UB960_IR_PGEN_COLOR(n)			(0x10 + (n)) /* n < 15 */
>> +
>> +#define UB960_IR_RX_ANA_STROBE_SET_CLK		0x08
>> +#define UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
>> +#define UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
>> +
>> +#define UB960_IR_RX_ANA_STROBE_SET_DATA		0x09
>> +#define UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(3)
>> +#define UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(2, 0)
>> +
>> +/* EQ related */
>> +
>> +#define UB960_MIN_AEQ_STROBE_POS -7
>> +#define UB960_MAX_AEQ_STROBE_POS 7
>> +
>> +#define UB960_MANUAL_STROBE_EXTRA_DELAY 6
>> +
>> +#define UB960_MIN_MANUAL_STROBE_POS -(7 + UB960_MANUAL_STROBE_EXTRA_DELAY)
>> +#define UB960_MAX_MANUAL_STROBE_POS (7 + UB960_MANUAL_STROBE_EXTRA_DELAY)
>> +#define UB960_NUM_MANUAL_STROBE_POS (UB960_MAX_MANUAL_STROBE_POS - UB960_MIN_MANUAL_STROBE_POS + 1)
>> +
>> +#define UB960_MIN_EQ_LEVEL 0
>> +#define UB960_MAX_EQ_LEVEL 14
>> +#define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
> 
> I'd align the values, that would be more readable.

Ok.

>> +
>> +struct ub960_hw_data {
>> +	const char *model;
>> +	u8 num_rxports;
>> +	u8 num_txports;
>> +	bool is_ub9702;
>> +	bool is_fpdlink4;
>> +};
>> +
>> +enum ub960_rxport_mode {
>> +	RXPORT_MODE_RAW10 = 0,
>> +	RXPORT_MODE_RAW12_HF = 1,
>> +	RXPORT_MODE_RAW12_LF = 2,
>> +	RXPORT_MODE_CSI2_SYNC = 3,
>> +	RXPORT_MODE_CSI2_ASYNC = 4,
>> +	RXPORT_MODE_LAST = RXPORT_MODE_CSI2_ASYNC,
>> +};
>> +
>> +enum ub960_rxport_cdr {
>> +	RXPORT_CDR_FPD3 = 0,
>> +	RXPORT_CDR_FPD4 = 1,
>> +	RXPORT_CDR_LAST = RXPORT_CDR_FPD4,
>> +};
>> +
>> +struct ub960_rxport {
>> +	struct ub960_data      *priv;
>> +	u8                      nport;	/* RX port number, and index in priv->rxport[] */
>> +
>> +	struct v4l2_subdev     *source_sd;	/* Connected subdev */
>> +	u16			source_sd_pad;
>> +	struct fwnode_handle   *source_ep_fwnode;
> 
> 	struct {
> 		struct v4l2_subdev *sd;
> 		u16 pad;
> 		struct fwnode_handler *ep;
> 	} source;
> 
> would make the code more readable I think.

Looks fine to me.

>> +
>> +	enum ub960_rxport_mode  rx_mode;
>> +	enum ub960_rxport_cdr	cdr_mode;
>> +
>> +	struct fwnode_handle   *remote_fwnode;	/* 'serializer' fwnode */
>> +	struct i2c_client      *ser_client;	/* Serializer */
>> +	unsigned short          ser_alias;	/* Serializer i2c alias (lower 7 bits) */
> 
> And here,
> 
> 	/* Serializer */
> 	struct {
> 		struct fwnode_handle *fwnode;
> 		struct i2c_client *client;
> 		unsigned short alias;	/* I2C alias (lower 7 bits) */
> 		struct ds90ub9xx_platform_data pdata;
> 	} ser;

Sure.

>> +
>> +	u8			lv_fv_pol;	/* LV and FV polarities */
>> +
>> +	struct regulator	*vpoc;
>> +
>> +	/* EQ settings */
>> +	struct {
>> +		bool manual_eq;
>> +
>> +		s8 strobe_pos;
>> +
>> +		union {
>> +			struct {
>> +				u8 eq_level_min;
>> +				u8 eq_level_max;
>> +			} aeq;
>> +
>> +			struct {
>> +				u8 eq_level;
>> +			} manual;
>> +		};
>> +	} eq;
>> +
>> +	struct ds90ub9xx_platform_data ser_platform_data;
>> +};
>> +
>> +struct ub960_asd {
>> +	struct v4l2_async_subdev base;
>> +	struct ub960_rxport *rxport;
>> +};
>> +
>> +static inline struct ub960_asd *to_ub960_asd(struct v4l2_async_subdev *asd)
>> +{
>> +	return container_of(asd, struct ub960_asd, base);
>> +}
>> +
>> +struct ub960_txport {
>> +	struct ub960_data      *priv;
>> +	u8                      nport;	/* TX port number, and index in priv->txport[] */
>> +
>> +	u32 num_data_lanes;
>> +};
>> +
>> +struct atr_alias_table_entry {
>> +	u16 alias_id;	/* Alias ID from DT */
>> +
>> +	bool reserved;
> 
> I initially wondered why you added a reserved field to a structure that
> isn't part of any ABI :-) You could rename this to in_use to avoid
> confusion.

Ok =).

>> +	u8 nport;
>> +	u8 slave_id;	/* i2c client's local i2c address */
>> +	u8 port_reg_idx;
>> +};
>> +
>> +struct atr_alias_table {
>> +	/* Protects fields in this struct */
>> +	struct mutex lock;
>> +
>> +	size_t num_entries;
>> +	struct atr_alias_table_entry *entries;
>> +};
>> +
>> +struct ub960_data {
>> +	const struct ub960_hw_data	*hw_data;
>> +	struct i2c_client	*client; /* for shared local registers */
>> +	struct regmap		*regmap;
>> +
>> +	/* lock for register access */
>> +	struct mutex		reg_lock;
>> +
>> +	struct clk		*refclk;
>> +
>> +	struct regulator	*vddio;
>> +
>> +	struct gpio_desc	*pd_gpio;
>> +	struct delayed_work	poll_work;
>> +	struct i2c_atr		*atr;
>> +	struct ub960_rxport	*rxports[UB960_MAX_RX_NPORTS];
>> +	struct ub960_txport	*txports[UB960_MAX_TX_NPORTS];
> 
> How about turning these two into arrays of structures to avoid dynamic
> allocations ? That will simplify the driver, and while it may consume a
> bit extra memory for uv960_data, you'll save extra dynamic allocations.
> Up to you.

Not all of these are allocated, a NULL in a port means that port is not 
in use. We could add a field in the rxport and txport for that, of 
course. It's also a good sanity check to see that we're not trying to 
access ports that are not in use (as that would crash).

So, I'd rather keep it like this.

>> +
>> +	struct v4l2_subdev	sd;
>> +	struct media_pad	pads[UB960_MAX_NPORTS];
>> +
>> +	struct v4l2_ctrl_handler   ctrl_handler;
>> +	struct v4l2_async_notifier notifier;
>> +
>> +	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
>> +	s64 tx_link_freq[1];
>> +
>> +	struct atr_alias_table	atr_alias_table;
> 
> I'd have written
> 
> 	struct {
> 		struct i2c_atr *atr;
> 
> 		/* Protects fields in this struct */
> 		struct mutex lock;
> 		size_t num_aliases;
> 		struct atr_alias_table_entry *aliases;
> 	} atr;
> 
> to shorten lines. Up to you.

Looks good to me.

>> +
>> +	u8 current_read_rxport;
>> +	u8 current_write_rxport_mask;
>> +
>> +	u8 current_read_csiport;
>> +	u8 current_write_csiport_mask;
>> +
>> +	u8 current_indirect_target;
> 
> I'll continue :-)
> 
> 	struct {
> 		u8 read_rxport;
> 		u8 write_rxport_mask;
> 
> 		u8 read_csiport;
> 		u8 write_csiport_mask;
> 
> 		u8 indirect_target;
> 	} regs;
> 
> and it looks like (based on the code below) that you could simplify it
> as
> 
> 	struct {
> 		u8 rxport;
> 		u8 csiport;
> 		u8 indirect_target;
> 	} regs;

Yes, you're right.

>> +
>> +	bool streaming;
>> +
>> +	u8 stored_fwd_ctl;
>> +
>> +	u64 stream_enable_mask[UB960_MAX_NPORTS];
>> +
>> +	/* These are common to all ports */
>> +	struct {
>> +		bool manual;
>> +
>> +		s8 min;
>> +		s8 max;
>> +	} strobe;
>> +};
>> +
>> +static void ub960_reset(struct ub960_data *priv, bool reset_regs);
> 
> No need for a forward declaration.

Yep.

>> +
>> +static inline struct ub960_data *sd_to_ub960(struct v4l2_subdev *sd)
>> +{
>> +	return container_of(sd, struct ub960_data, sd);
>> +}
>> +
>> +enum {
>> +	TEST_PATTERN_DISABLED = 0,
>> +	TEST_PATTERN_V_COLOR_BARS_1,
>> +	TEST_PATTERN_V_COLOR_BARS_2,
>> +	TEST_PATTERN_V_COLOR_BARS_4,
>> +	TEST_PATTERN_V_COLOR_BARS_8,
>> +};
>> +
>> +static const char *const ub960_tpg_qmenu[] = {
>> +	"Disabled",
>> +	"1 vertical color bar",
>> +	"2 vertical color bars",
>> +	"4 vertical color bars",
>> +	"8 vertical color bars",
>> +};
>> +
>> +static inline bool ub960_pad_is_sink(struct ub960_data *priv, u32 pad)
>> +{
>> +	return pad < priv->hw_data->num_rxports;
>> +}
>> +
>> +static inline bool ub960_pad_is_source(struct ub960_data *priv, u32 pad)
>> +{
>> +	return pad >= priv->hw_data->num_rxports &&
>> +	       pad < (priv->hw_data->num_rxports + priv->hw_data->num_txports);
> 
> Can the second condition occur ?

It's an invalid pad if it happens. This is used only in a few places. 
Probably the v4l2 framework ensures that only valid pads are passed in 
the calls? If so, I could drop the second condition.

>> +}
>> +
>> +static inline unsigned int ub960_pad_to_port(struct ub960_data *priv, u32 pad)
>> +{
>> +	if (ub960_pad_is_sink(priv, pad))
>> +		return pad;
>> +	else
>> +		return pad - priv->hw_data->num_rxports;
>> +}
>> +
>> +struct ub960_format_info {
>> +	u32 code;
>> +	u32 bpp;
>> +	u8 datatype;
>> +	bool meta;
>> +};
>> +
>> +static const struct ub960_format_info ub960_formats[] = {
>> +	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, .datatype = 0x1e, },
> 
> Include include/media/mipi-csi2.h and use the macros for the data type.

Ok.

>> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, .datatype = 0x1e, },
>> +	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, .datatype = 0x1e, },
>> +	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, .datatype = 0x1e, },
>> +
>> +	/* Legacy */
>> +	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .bpp = 16, .datatype = 0x1e, },
>> +	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .bpp = 16, .datatype = 0x1e, },
>> +	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .bpp = 16, .datatype = 0x1e, },
>> +	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .bpp = 16, .datatype = 0x1e, },
> 
> I'd prefer dropping this and requiring drivers to use the 1X16 media bus
> types. This is a new driver, we don't have to care about backward
> compatibility.

I have, as I use it with other old drivers (CAL) =). I can look at that, 
maybe I'll be able to fix it. But if I recall right, it wasn't very trivial.

>> +
>> +	/* RAW */
>> +	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, .datatype = 0x2c, },
>> +	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, .datatype = 0x2c, },
> 
> Can you add the GBRG and GRBG media bus codes too ?

Ok.

>> +};
>> +
>> +static const struct ub960_format_info *ub960_find_format(u32 code)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(ub960_formats); ++i) {
>> +		if (ub960_formats[i].code == code)
>> +			return &ub960_formats[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +/* -----------------------------------------------------------------------------
>> + * Basic device access
>> + */
>> +
>> +static int ub960_read(struct ub960_data *priv, u8 reg, u8 *val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int v;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = regmap_read(priv->regmap, reg, &v);
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
> 
> As you use dev here only, I would have written
> 
> 		dev_err(&priv->client->dev,
> 			"%s: cannot read register 0x%02x (%d)!\n",
> 			__func__, reg, ret);
> 
> Same below, and up to you.
> 
>> +			__func__, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	*val = v;
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_write(struct ub960_data *priv, u8 reg, u8 val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = regmap_write(priv->regmap, reg, val);
>> +	if (ret)
>> +		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = regmap_update_bits(priv->regmap, reg, mask, val);
>> +	if (ret)
>> +		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int _ub960_rxport_select(struct ub960_data *priv, u8 nport)
> 
> No need for the leading _.

There was another case like this that you or someone else commented. Now 
I remember why I added the _. These functions expect the mutex to be 
held, whereas the others take the mutex.

But I'll drop the _, and add an assert for the lock.

> 'nport' makes me think about "number of ports", I'd have s/nport/port/.
> Up to you.

And port makes me think it's a pointer to a port struct. port_idx would 
perhaps be better (although variables without _ always look better...), 
but "nport" is used all around and replacing it is probably a good 
amount of work (with indenting etc). I'll look at it.

>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	if (priv->current_read_rxport == nport &&
>> +	    priv->current_write_rxport_mask == BIT(nport))
> 
> Why is current_read_rxport a port number and current_write_rxport_mask a
> bitmask ? It looks like you could simplify this by merging the two
> fields into a current_rxport.

Because in the hardware the read port is a port number and the write 
port is a bit mask. The HW can read only from a single port's register 
set (obviously), but it can write to multiple ports in one go.

But you're right, at the moment we only use a single port as a target. 
So I could simplify it.

>> +		return 0;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_FPD3_PORT_SEL,
>> +			   (nport << 4) | BIT(nport));
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot select rxport %d (%d)!\n", __func__,
>> +			nport, ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->current_read_rxport = nport;
>> +	priv->current_write_rxport_mask = BIT(nport);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_rxport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int v;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	_ub960_rxport_select(priv, nport);
> 
> Missing error check. Same below.

Yep.

>> +
>> +	ret = regmap_read(priv->regmap, reg, &v);
>> +	if (ret) {
>> +
>> +	ret = regmap_read(priv->regmap, reg, &v);
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	*val = v;
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_rxport_write(struct ub960_data *priv, u8 nport, u8 reg, u8 val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	_ub960_rxport_select(priv, nport);
>> +
>> +	ret = regmap_write(priv->regmap, reg, val);
>> +	if (ret)
>> +		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_rxport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
>> +				    u8 mask, u8 val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	_ub960_rxport_select(priv, nport);
>> +
>> +	ret = regmap_update_bits(priv->regmap, reg, mask, val);
>> +	if (ret)
>> +		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int _ub960_csiport_select(struct ub960_data *priv, u8 nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	if (priv->current_read_csiport == nport &&
>> +	    priv->current_write_csiport_mask == BIT(nport))
> 
> Same question as for the current_*_rxport
> 
>> +		return 0;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_CSI_PORT_SEL,
>> +			   (nport << 4) | BIT(nport));
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot select csi port %d (%d)!\n", __func__,
>> +			nport, ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->current_read_csiport = nport;
>> +	priv->current_write_csiport_mask = BIT(nport);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_csiport_read(struct ub960_data *priv, u8 nport, u8 reg,
>> +			      u8 *val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int v;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	_ub960_csiport_select(priv, nport);
> 
> Missing error check. Same below.

Yep.

>> +
>> +	ret = regmap_read(priv->regmap, reg, &v);
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	*val = v;
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_csiport_write(struct ub960_data *priv, u8 nport, u8 reg,
>> +			       u8 val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	_ub960_csiport_select(priv, nport);
>> +
>> +	ret = regmap_write(priv->regmap, reg, val);
>> +	if (ret)
>> +		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_csiport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
>> +				     u8 mask, u8 val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	_ub960_csiport_select(priv, nport);
>> +
>> +	ret = regmap_update_bits(priv->regmap, reg, mask, val);
>> +	if (ret)
>> +		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int _ub960_select_ind_reg_block(struct ub960_data *priv, u8 block)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	if (priv->current_indirect_target == block)
>> +		return 0;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_CTL, block << 2);
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot select indirect target %u (%d)!\n",
>> +			__func__, block, ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->current_indirect_target = block;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
>> +{
>> +	unsigned int v;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = _ub960_select_ind_reg_block(priv, block);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
>> +			block, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	ret = regmap_read(priv->regmap, UB960_SR_IND_ACC_DATA, &v);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
>> +			block, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	*val = v;
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = _ub960_select_ind_reg_block(priv, block);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
>> +			block, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_DATA failed when writing %u:%x02x\n: %d\n",
> 
> Extra \n in the middle of the string.

Yep.

>> +			block, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_write_ind16(struct ub960_data *priv, u8 block, u8 reg, u16 val)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = _ub960_select_ind_reg_block(priv, block);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val >> 8);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg + 1);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val & 0xff);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
>> +				 u8 mask, u8 val)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = _ub960_select_ind_reg_block(priv, block);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_ADDR failed when updating %u:%x02x: %d\n",
>> +			block, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	ret = regmap_update_bits(priv->regmap, UB960_SR_IND_ACC_DATA, mask,
>> +				 val);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_DATA failed when updating %u:%x02x: %d\n",
>> +			block, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +/* -----------------------------------------------------------------------------
>> + * I2C-ATR (address translator)
>> + */
>> +
>> +static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
>> +				   const struct i2c_client *client,
>> +				   u16 *alias_id)
>> +{
>> +	struct ub960_data *priv = i2c_atr_get_driver_data(atr);
>> +	struct ub960_rxport *rxport = priv->rxports[chan_id];
>> +	struct device *dev = &priv->client->dev;
>> +	struct atr_alias_table_entry *entry = NULL;
>> +	unsigned int reg_idx;
>> +	unsigned int pool_idx;
>> +	u16 alias;
>> +	int ret = 0;
>> +	u8 port_reg_idx_mask = 0;
>> +
>> +	dev_dbg(dev, "rx%u: %s\n", chan_id, __func__);
>> +
>> +	mutex_lock(&priv->atr_alias_table.lock);
>> +
>> +	/*
>> +	 * Go through the alias table and:
>> +	 *	1. Look for an unreserved entry
>> +	 *	2. Construct a bitmask of port's used alias entries
>> +	 */
>> +
>> +	for (pool_idx = 0; pool_idx < priv->atr_alias_table.num_entries; pool_idx++) {
>> +		struct atr_alias_table_entry *e;
>> +
>> +		e = &priv->atr_alias_table.entries[pool_idx];
>> +
>> +		if (!entry && !e->reserved)
>> +			entry = e;
>> +
>> +		if (e->reserved && e->nport == rxport->nport)
>> +			port_reg_idx_mask |= BIT(e->port_reg_idx);
> 
> This could be done on top, but wouldn't it be more efficient to use the
> bitmap API to allocate an unused entry ? The IDR API could be used too,
> but is possibly overkill. As for the per-port index mask, it could be
> cached in the rxport structure, so you wouldn't have to recompute it
> every time.

Yes, this could be optimized. We usually have just a few entries, so I 
don't think it really matters in real life, though. But perhaps caching 
the per-port mask would make the code a bit more readable.

>> +	}
>> +
>> +	if (!entry) {
>> +		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
>> +		ret = -EADDRNOTAVAIL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (port_reg_idx_mask == GENMASK(UB960_MAX_PORT_ALIASES - 1, 0)) {
>> +		dev_err(dev, "rx%u: all aliases in use\n", rxport->nport);
>> +		ret = -EADDRNOTAVAIL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	alias = entry->alias_id;
>> +
>> +	reg_idx = ffz(port_reg_idx_mask);
>> +
>> +	entry->reserved = true;
>> +	entry->nport = rxport->nport;
>> +	entry->slave_id = client->addr;
>> +	entry->port_reg_idx = reg_idx;
>> +
>> +	/* Map alias to slave */
>> +
>> +	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
>> +			   client->addr << 1);
>> +	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
>> +			   alias << 1);
>> +
>> +	*alias_id = alias; /* tell the atr which alias we chose */
>> +
>> +	dev_dbg(dev, "rx%u: client 0x%02x mapped at alias 0x%02x (%s)\n",
>> +		rxport->nport, client->addr, alias, client->name);
> 
> How about printing this message, as well as the one at the beginning of
> the function, in the ATR core ? Same below.

Yes, I think that makes sense.

>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->atr_alias_table.lock);
>> +	return ret;
>> +}
>> +
>> +static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
>> +				    const struct i2c_client *client)
>> +{
>> +	struct ub960_data *priv = i2c_atr_get_driver_data(atr);
>> +	struct ub960_rxport *rxport = priv->rxports[chan_id];
>> +	struct device *dev = &priv->client->dev;
>> +	struct atr_alias_table_entry *entry;
>> +	unsigned int reg_idx;
>> +	unsigned int pool_idx;
>> +	u16 alias = 0;
>> +
>> +	dev_dbg(dev, "rx%u: %s\n", chan_id, __func__);
>> +
>> +	mutex_lock(&priv->atr_alias_table.lock);
>> +
>> +	/* Find alias mapped to this client */
>> +
>> +	for (pool_idx = 0; pool_idx < priv->atr_alias_table.num_entries; pool_idx++) {
>> +		entry = &priv->atr_alias_table.entries[pool_idx];
>> +
>> +		if (entry->reserved && entry->nport == rxport->nport &&
>> +		    entry->slave_id == client->addr)
>> +			break;
>> +	}
>> +
>> +	if (pool_idx == priv->atr_alias_table.num_entries) {
>> +		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
>> +			rxport->nport, client->addr);
>> +		goto out_unlock;
>> +	}
>> +
>> +	alias = entry->alias_id;
>> +
>> +	reg_idx = entry->port_reg_idx;
>> +
>> +	/* Unmap */
>> +
>> +	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
>> +
>> +	entry->reserved = false;
>> +
>> +	dev_dbg(dev, "rx%u: client 0x%02x unmapped from alias 0x%02x (%s)\n",
>> +		rxport->nport, client->addr, alias, client->name);
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->atr_alias_table.lock);
>> +}
>> +
>> +static const struct i2c_atr_ops ub960_atr_ops = {
>> +	.attach_client = ub960_atr_attach_client,
>> +	.detach_client = ub960_atr_detach_client,
>> +};
>> +
>> +/* -----------------------------------------------------------------------------
>> + * CSI ports
>> + */
>> +
>> +static int ub960_parse_dt_txport(struct ub960_data *priv,
>> +				 const struct fwnode_handle *ep_fwnode,
>> +				 u8 nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct ub960_txport *txport;
>> +	int ret;
>> +	u64 freq;
>> +
>> +	txport = kzalloc(sizeof(*txport), GFP_KERNEL);
>> +	if (!txport)
>> +		return -ENOMEM;
>> +
>> +	txport->priv = priv;
>> +	txport->nport = nport;
>> +
>> +	priv->txports[nport] = txport;
>> +
>> +	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
>> +	if (ret < 0) {
>> +		dev_err(dev, "tx%u: failed to parse 'data-lanes': %d\n", nport,
>> +			ret);
>> +		goto err_free_txport;
>> +	}
>> +
>> +	txport->num_data_lanes = ret;
>> +
>> +	ret = fwnode_property_read_u64(ep_fwnode, "link-frequencies", &freq);
>> +	if (ret) {
>> +		dev_err(dev, "tx%u: failed to read 'link-frequencies': %d\n",
>> +			nport, ret);
>> +		goto err_free_txport;
>> +	}
> 
> Could you use the V4L2 endpoint parsing helper instead of implementing
> this manually ?

I'll add a todo.

>> +
>> +	priv->tx_link_freq[0] = freq;
>> +	priv->tx_data_rate = freq * 2;
>> +
>> +	if (priv->tx_data_rate != MHZ(1600) &&
>> +	    priv->tx_data_rate != MHZ(1200) &&
>> +	    priv->tx_data_rate != MHZ(800) &&
>> +	    priv->tx_data_rate != MHZ(400)) {
>> +		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev_dbg(dev, "tx%u: nominal data rate: %u", nport, priv->tx_data_rate);
>> +
>> +	return 0;
>> +
>> +err_free_txport:
>> +	kfree(txport);
> 
> Set priv->txports[nport] to NULL. Or move the line that sets it to
> txport just before returning.

Yes, good idea.

>> +
>> +	return ret;
>> +}
>> +
>> +static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	u8 csi_tx_isr;
>> +	int ret;
>> +
>> +	ret = ub960_csiport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr);
>> +	if (ret)
>> +		return;
>> +
>> +	if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
>> +		dev_warn(dev, "TX%u: CSI_SYNC_ERROR\n", nport);
>> +
>> +	if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
>> +		dev_warn(dev, "TX%u: CSI_PASS_ERROR\n", nport);
>> +}
>> +
>> +/* -----------------------------------------------------------------------------
>> + * RX ports
>> + */
>> +
>> +static int ub960_rxport_enable_vpocs(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +	int ret;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport || !rxport->vpoc)
>> +			continue;
>> +
>> +		ret = regulator_enable(rxport->vpoc);
>> +		if (ret)
>> +			goto err_disable_vpocs;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_disable_vpocs:
>> +	while (nport--) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport || !rxport->vpoc)
>> +			continue;
>> +
>> +		regulator_disable(rxport->vpoc);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void ub960_rxport_disable_vpocs(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport || !rxport->vpoc)
>> +			continue;
>> +
>> +		regulator_disable(rxport->vpoc);
>> +	}
>> +}
>> +
>> +static void ub960_rxport_clear_errors(struct ub960_data *priv,
>> +				      unsigned int nport)
>> +{
>> +	u8 v;
>> +
>> +	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v);
>> +	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
>> +	ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &v);
>> +	ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &v);
>> +
>> +	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v);
>> +	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v);
>> +
>> +	ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
>> +}
>> +
>> +static void ub960_clear_rx_errors(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport)
>> +		ub960_rxport_clear_errors(priv, nport);
>> +}
>> +
>> +static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
>> +				       unsigned int nport, s8 *strobe_pos)
>> +{
>> +	u8 v;
>> +	u8 clk_delay, data_delay;
>> +	int ret;
>> +
>> +	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +		       UB960_IR_RX_ANA_STROBE_SET_CLK, &v);
> 
> No error checking ? Same wherever applicable.
> 
>> +
>> +	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
>> +			    0 :
>> +			    UB960_MANUAL_STROBE_EXTRA_DELAY;
> 
> Are you trying to draw shapes through artistic code formatting ? :-)

Just using clang-format with the format configuration in the kernel.

> 	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY)
> 		  ? 0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
> 
> or if you dislike the ? at the beginning of a line,
> 
> 	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
> 		    0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
> Same below.
> 
>> +
>> +	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +		       UB960_IR_RX_ANA_STROBE_SET_DATA, &v);
>> +
>> +	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
>> +			     0 :
>> +			     UB960_MANUAL_STROBE_EXTRA_DELAY;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v);
>> +	if (ret)
>> +		return ret;
>> +
>> +	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
>> +
>> +	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
>> +	if (ret)
>> +		return ret;
>> +
>> +	data_delay += v & UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK;
>> +
>> +	*strobe_pos = data_delay - clk_delay;
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
>> +					unsigned int nport, s8 strobe_pos)
>> +{
>> +	u8 clk_delay, data_delay;
>> +
>> +	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>> +	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>> +
>> +	if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
>> +		clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
>> +	else if (strobe_pos > UB960_MAX_AEQ_STROBE_POS)
>> +		data_delay = strobe_pos - UB960_MANUAL_STROBE_EXTRA_DELAY;
>> +	else if (strobe_pos < 0)
>> +		clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
> 
> So you wrap lines that don't need to be wrapped, but keep this one
> intact. Interesting :-)

It looked cleaner to me to have each if-else block as a single line.

>> +	else if (strobe_pos > 0)
>> +		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>> +
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay);
>> +
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay);
>> +}
>> +
>> +static void ub960_rxport_set_strobe_range(struct ub960_data *priv,
>> +					  s8 strobe_min, s8 strobe_max)
>> +{
>> +	/* Convert the signed strobe pos to positive zero based value */
>> +	strobe_min -= UB960_MIN_AEQ_STROBE_POS;
>> +	strobe_max -= UB960_MIN_AEQ_STROBE_POS;
>> +
>> +	ub960_write(priv, UB960_XR_SFILTER_CFG,
>> +		    ((u8)strobe_min << UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) |
>> +		    ((u8)strobe_max << UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT));
>> +}
>> +
>> +static int ub960_rxport_get_eq_level(struct ub960_data *priv,
>> +				     unsigned int nport, u8 *eq_level)
>> +{
>> +	int ret;
>> +	u8 v;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_STATUS, &v);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*eq_level = (v & UB960_RR_AEQ_STATUS_STATUS_1) +
>> +		    (v & UB960_RR_AEQ_STATUS_STATUS_2);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_rxport_set_eq_level(struct ub960_data *priv,
>> +				      unsigned int nport, u8 eq_level)
>> +{
>> +	u8 eq_stage_1_select_value, eq_stage_2_select_value;
>> +	const unsigned int eq_stage_max = 7;
>> +	u8 v;
>> +
>> +	if (eq_level <= eq_stage_max) {
>> +		eq_stage_1_select_value = eq_level;
>> +		eq_stage_2_select_value = 0;
>> +	} else {
>> +		eq_stage_1_select_value = eq_stage_max;
>> +		eq_stage_2_select_value = eq_level - eq_stage_max;
>> +	}
>> +
>> +	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
>> +
>> +	v &= ~(UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
>> +	       UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK);
>> +	v |= eq_stage_1_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT;
>> +	v |= eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT;
>> +	v |= UB960_RR_AEQ_BYPASS_ENABLE;
>> +
>> +	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v);
>> +}
>> +
>> +static void ub960_rxport_set_eq_range(struct ub960_data *priv,
>> +				      unsigned int nport, u8 eq_min, u8 eq_max)
>> +{
>> +	ub960_rxport_write(priv, nport, UB960_RR_AEQ_MIN_MAX,
>> +			   (eq_min << UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) |
>> +			   (eq_max << UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT));
>> +
>> +	/* Enable AEQ min setting */
>> +	ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_CTL2,
>> +				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR,
>> +				 UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR);
>> +}
>> +
>> +static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
>> +{
>> +	struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +	/* We also set common settings here. Should be moved elsewhere. */
>> +
>> +	if (priv->strobe.manual) {
>> +		/* Disable AEQ_SFILTER_EN */
>> +		ub960_update_bits(priv, UB960_XR_AEQ_CTL1,
>> +				  UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN, 0);
>> +	} else {
>> +		/* Enable SFILTER and error control */
>> +		ub960_write(priv, UB960_XR_AEQ_CTL1,
>> +			    UB960_XR_AEQ_CTL1_AEQ_ERR_CTL_MASK |
>> +				    UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN);
>> +
>> +		/* Set AEQ strobe range */
>> +		ub960_rxport_set_strobe_range(priv, priv->strobe.min,
>> +					      priv->strobe.max);
>> +	}
>> +
>> +	/* The rest are port specific */
>> +
>> +	if (priv->strobe.manual)
>> +		ub960_rxport_set_strobe_pos(priv, nport, rxport->eq.strobe_pos);
>> +	else
>> +		ub960_rxport_set_strobe_pos(priv, nport, 0);
>> +
>> +	if (rxport->eq.manual_eq) {
>> +		ub960_rxport_set_eq_level(priv, nport,
>> +					  rxport->eq.manual.eq_level);
>> +
>> +		/* Enable AEQ Bypass */
>> +		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
>> +					 UB960_RR_AEQ_BYPASS_ENABLE,
>> +					 UB960_RR_AEQ_BYPASS_ENABLE);
>> +	} else {
>> +		ub960_rxport_set_eq_range(priv, nport,
>> +					  rxport->eq.aeq.eq_level_min,
>> +					  rxport->eq.aeq.eq_level_max);
>> +
>> +		/* Disable AEQ Bypass */
>> +		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
>> +					 UB960_RR_AEQ_BYPASS_ENABLE, 0);
>> +	}
>> +}
>> +
>> +static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
>> +				bool *ok)
>> +{
>> +	u8 rx_port_sts1, rx_port_sts2;
>> +	unsigned int parity_errors;
>> +	u8 csi_rx_sts;
>> +	u8 csi_err_cnt;
>> +	u8 v1, v2;
>> +	u8 bcc_sts;
>> +	int ret;
>> +	bool errors;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
>> +				&rx_port_sts1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!(rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS)) {
>> +		*ok = false;
>> +		return 0;
>> +	}
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2,
>> +				&rx_port_sts2);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &csi_rx_sts);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER,
>> +				&csi_err_cnt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &bcc_sts);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
>> +	if (ret)
>> +		return ret;
>> +
>> +	parity_errors = (v1 << 8) | v2;
>> +
>> +	errors = (rx_port_sts1 & UB960_RR_RX_PORT_STS1_ERROR_MASK) ||
>> +		 (rx_port_sts2 & UB960_RR_RX_PORT_STS2_ERROR_MASK) ||
>> +		 (bcc_sts & UB960_RR_BCC_STATUS_ERROR_MASK) ||
>> +		 (csi_rx_sts & UB960_RR_CSI_RX_STS_ERROR_MASK) || csi_err_cnt ||
>> +		 parity_errors;
>> +
>> +	*ok = !errors;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Wait for the RX ports to lock, have no errors and have stable strobe position
>> + * and EQ level.
>> + */
>> +static int ub960_rxport_wait_locks(struct ub960_data *priv,
>> +				   unsigned long port_mask,
>> +				   unsigned int *lock_mask)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned long timeout;
>> +	unsigned int link_ok_mask;
>> +	unsigned int missing;
>> +	unsigned int loops;
>> +	u8 nport;
>> +	int ret;
>> +
>> +	if (port_mask == 0)
>> +		return 0;
>> +
>> +	if (port_mask >= BIT(priv->hw_data->num_rxports))
>> +		return -EINVAL;
> 
> The port_mask argument is hardcoded to GENMASK(3, 0) in the caller, does
> that mean some things could be simplified ?

I have off-the-series patches that use this to wait for a single (or a 
set of ports).

>> +
>> +	timeout = jiffies + msecs_to_jiffies(1000);
>> +	loops = 0;
>> +	link_ok_mask = 0;
>> +
>> +	while (time_before(jiffies, timeout)) {
>> +		missing = 0;
> 
> Do you have to restart from scratch in every iteration, or could you
> only test the links that haven't been tested ?

Probably, but it would make the code a bit more complex, and this also 
lets us see if a lock happens to drop. ub960_rxport_link_ok() does read 
a bunch of registers via i2c, so I guess one could argue it creates an 
overhead. But is that relevant?

>> +
>> +		for_each_set_bit(nport, &port_mask,
>> +				 priv->hw_data->num_rxports) {
>> +			struct ub960_rxport *rxport = priv->rxports[nport];
>> +			bool ok;
>> +
>> +			if (!rxport)
>> +				continue;
>> +
>> +			ret = ub960_rxport_link_ok(priv, nport, &ok);
>> +			if (ret)
>> +				return ret;
>> +
>> +			if (!ok || !(link_ok_mask & BIT(nport)))
>> +				missing++;
> 
> Why the second part of the condition ? Do you want to test every link at
> least twice ? A comment to explain this would be nice.

Yes, we want to see that a link has been ok for two loops. E.g. the 
adaptive EQ might get a lock only temporarily, and then the lock drops 
and AEQ continues looking.

>> +
>> +			if (ok)
>> +				link_ok_mask |= BIT(nport);
>> +			else
>> +				link_ok_mask &= ~BIT(nport);
>> +		}
>> +
>> +		loops++;
>> +
>> +		if (missing == 0)
>> +			break;
>> +
>> +		msleep(50);
>> +	}
>> +
>> +	if (lock_mask)
>> +		*lock_mask = link_ok_mask;
>> +
>> +	dev_dbg(dev, "Wait locks done in %u loops\n", loops);
> 
> Shouldn't you return an error in case of a timeout ?

This returns an error if something goes wrong. It's not an error that we 
don't get the locks.

However, when we call this at probe time, we should check that the ports 
actually locked. I'll add that.

>> +	for_each_set_bit(nport, &port_mask, priv->hw_data->num_rxports) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +		s8 strobe_pos, eq_level;
>> +		u8 v1, v2;
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		if (!(link_ok_mask & BIT(nport))) {
>> +			dev_dbg(dev, "\trx%u: not locked\n", nport);
>> +			continue;
>> +		}
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
>> +
>> +		ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
>> +		if (ret)
>> +			return ret;
>> +
>> +		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %u Hz\n",
>> +			nport, strobe_pos, eq_level,
>> +			v1 * 1000000 + v2 * 1000000 / 256);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_init_atr(struct ub960_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct i2c_adapter *parent_adap = priv->client->adapter;
>> +
>> +	priv->atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
>> +				priv->hw_data->num_rxports);
>> +	if (IS_ERR(priv->atr))
>> +		return PTR_ERR(priv->atr);
>> +
>> +	i2c_atr_set_driver_data(priv->atr, priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_uninit_atr(struct ub960_data *priv)
>> +{
>> +	i2c_atr_delete(priv->atr);
>> +	priv->atr = NULL;
>> +}
> 
> I'd move those two functions just after &ub960_atr_ops

Ok.

>> +
>> +static unsigned long ub960_calc_bc_clk_rate_ub960(struct ub960_data *priv,
>> +						  struct ub960_rxport *rxport)
>> +{
>> +	unsigned int mult;
>> +	unsigned int div;
>> +
>> +	switch (rxport->rx_mode) {
>> +	case RXPORT_MODE_RAW10:
>> +	case RXPORT_MODE_RAW12_HF:
>> +	case RXPORT_MODE_RAW12_LF:
>> +		mult = 1;
>> +		div = 10;
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_SYNC:
>> +		mult = 2;
>> +		div = 1;
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_ASYNC:
>> +		mult = 2;
>> +		div = 5;
>> +		break;
>> +
>> +	default:
>> +		return 0;
>> +	}
>> +
>> +	return clk_get_rate(priv->refclk) * mult / div;
> 
> The rate could be retrieved once and cached. Not a very important
> optimization I suppose, but it would be nice.

We call it only a few times. Do you expect clk_get_rate to be 
exceptionally slow? All my platforms have just a fixed clock there.

>> +}
>> +
>> +static unsigned long ub960_calc_bc_clk_rate_ub9702(struct ub960_data *priv,
>> +						   struct ub960_rxport *rxport)
>> +{
>> +	switch (rxport->rx_mode) {
>> +	case RXPORT_MODE_RAW10:
>> +	case RXPORT_MODE_RAW12_HF:
>> +	case RXPORT_MODE_RAW12_LF:
>> +		return 2359400;
>> +
>> +	case RXPORT_MODE_CSI2_SYNC:
>> +		return 47187500;
>> +
>> +	case RXPORT_MODE_CSI2_ASYNC:
>> +		return 9437500;
>> +
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
>> +{
>> +	struct ub960_rxport *rxport = priv->rxports[nport];
>> +	struct device *dev = &priv->client->dev;
>> +	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser_platform_data;
>> +	struct i2c_board_info ser_info = {
>> +		.of_node = to_of_node(rxport->remote_fwnode),
>> +		.fwnode = rxport->remote_fwnode,
>> +		.platform_data = ser_pdata,
>> +	};
>> +
>> +	ser_pdata->port = nport;
>> +	ser_pdata->atr = priv->atr;
>> +	if (priv->hw_data->is_ub9702)
>> +		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
>> +	else
>> +		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
>> +
>> +	/*
>> +	 * Adding the serializer under rxport->adap would be cleaner, but it
>> +	 * would need tweaks to bypass the alias table. Adding to the
>> +	 * upstream adapter is way simpler.
>> +	 */
> 
> Are you sure it will not cause any issue in the future ? The device
> topology is visible to userspace, so it can't be changed later.

Well, there's no rxport->adap any more, and the serializer shouldn't be 
under the rxport->adap even if we still had the old code, so I'll just 
remove the comment.

Possibly we might add a new comment, though. What should the serializer 
be under? It is currently an i2c device, under the same i2c bus as the 
deserializer. Which is nice, as the deserializer HW automatically 
forwards the i2c transactions to the serializer, so all the i2c tools 
work out of th ebox.

But it's not really i2c device, but an fpdlink device. Changing this 
would mean creating an fpdlink-bus, I believe, and then I guess we would 
need some custom way to read/write the registers of the serializer...

Or we could create i2c-adapters for the fpdlinks, kind of 1-to-1 virtual 
i2c bus, one for each serializer. Then the serializers would be under 
the deserializer, although the bus wouldn't really be right. Then we 
would somehow need to forward the transactions sent to the virtual 
adapter to the actual i2c adapter, and back (somewhat like the atr, but 
no need for translation).

I can't say I'm very familiar with linux bus design, so if you or anyone 
has any good ideas here, I'd appreciate =).

>> +	ser_info.addr = rxport->ser_alias;
>> +	rxport->ser_client =
>> +		i2c_new_client_device(priv->client->adapter, &ser_info);
>> +	if (!rxport->ser_client) {
>> +		dev_err(dev, "rx%u: cannot add %s i2c device", nport,
>> +			ser_info.type);
>> +		return -EIO;
>> +	}
>> +
>> +	dev_dbg(dev, "rx%u: remote serializer at alias 0x%02x (%u-%04x)\n",
>> +		nport, rxport->ser_client->addr,
>> +		rxport->ser_client->adapter->nr, rxport->ser_client->addr);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_rxport_remove_serializer(struct ub960_data *priv, u8 nport)
>> +{
>> +	struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +	i2c_unregister_device(rxport->ser_client);
>> +	rxport->ser_client = NULL;
>> +}
>> +
>> +/* Add serializer i2c devices for all initialized ports */
>> +static int ub960_rxport_add_serializers(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +	int ret;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		ret = ub960_rxport_add_serializer(priv, nport);
>> +		if (ret)
>> +			goto err_remove_sers;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_remove_sers:
>> +	while (nport--) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		rxport = priv->rxports[nport];
>> +		if (!rxport)
>> +			continue;
> 
> This is redundant.

Oops.

>> +
>> +		ub960_rxport_remove_serializer(priv, nport);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void ub960_rxport_remove_serializers(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		ub960_rxport_remove_serializer(priv, nport);
>> +	}
>> +}
>> +
>> +static void ub960_init_tx_port(struct ub960_data *priv,
>> +			       struct ub960_txport *txport)
>> +{
>> +	unsigned int nport = txport->nport;
>> +	u8 csi_ctl = 0;
>> +
>> +	/*
>> +	 * From the datasheet: "initial CSI Skew-Calibration
>> +	 * sequence [...] should be set when operating at 1.6 Gbps"
>> +	 */
>> +	if (priv->tx_data_rate == MHZ(1600))
>> +		csi_ctl |= UB960_TR_CSI_CTL_CSI_CAL_EN;
>> +
>> +	csi_ctl |= (4 - txport->num_data_lanes) << 4;
>> +
>> +	ub960_csiport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl);
>> +}
>> +
>> +static int ub960_init_tx_ports(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +	u8 speed_select;
>> +	u8 pll_div;
>> +
>> +	/* TX ports */
>> +
>> +	switch (priv->tx_data_rate) {
>> +	case MHZ(1600):
>> +	default:
>> +		speed_select = 0;
>> +		pll_div = 0x10;
>> +		break;
>> +	case MHZ(1200):
>> +		speed_select = 1;
>> +		break;
>> +	case MHZ(800):
>> +		speed_select = 2;
>> +		pll_div = 0x10;
>> +		break;
>> +	case MHZ(400):
>> +		speed_select = 3;
>> +		pll_div = 0x10;
>> +		break;
>> +	}
>> +
>> +	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select);
>> +
>> +	if (priv->hw_data->is_ub9702) {
>> +		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
>> +
>> +		switch (priv->tx_data_rate) {
>> +		case MHZ(1600):
>> +		default:
>> +			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80);
>> +			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4B, 0x2A);
>> +			break;
>> +		case MHZ(800):
>> +			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90);
>> +			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4F, 0x2A);
>> +			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4B, 0x2A);
>> +			break;
>> +		case MHZ(400):
>> +			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xA0);
>> +			break;
>> +		}
>> +	}
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
>> +		struct ub960_txport *txport = priv->txports[nport];
>> +
>> +		if (!txport)
>> +			continue;
>> +
>> +		ub960_init_tx_port(priv, txport);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_init_rx_port_ub960(struct ub960_data *priv,
>> +				     struct ub960_rxport *rxport)
>> +{
>> +	unsigned int nport = rxport->nport;
>> +	u32 bc_freq_val;
>> +
>> +	/*
>> +	 * Back channel frequency select.
>> +	 * Override FREQ_SELECT from the strap.
>> +	 * 0 - 2.5 Mbps (DS90UB913A-Q1 / DS90UB933-Q1)
>> +	 * 2 - 10 Mbps
>> +	 * 6 - 50 Mbps (DS90UB953-Q1)
>> +	 *
>> +	 * Note that changing this setting will result in some errors on the back
>> +	 * channel for a short period of time.
>> +	 */
>> +
>> +	switch (rxport->rx_mode) {
>> +	case RXPORT_MODE_RAW10:
>> +	case RXPORT_MODE_RAW12_HF:
>> +	case RXPORT_MODE_RAW12_LF:
>> +		bc_freq_val = 0;
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_ASYNC:
>> +		bc_freq_val = 2;
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_SYNC:
>> +		bc_freq_val = 6;
>> +		break;
>> +
>> +	default:
>> +		return;
>> +	}
>> +
>> +	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
>> +				 UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK,
>> +				 bc_freq_val);
>> +
>> +	switch (rxport->rx_mode) {
>> +	case RXPORT_MODE_RAW10:
>> +		/* FPD3_MODE = RAW10 Mode (DS90UB913A-Q1 / DS90UB933-Q1 compatible) */
>> +		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG,
>> +					 UB960_RR_PORT_CONFIG_FPD3_MODE_MASK,
>> +					 0x3);
>> +
>> +		/*
>> +		 * RAW10_8BIT_CTL = 0b10 : 8-bit processing using upper 8 bits
>> +		 */
>> +		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
>> +			UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_MASK,
>> +			0x2 << UB960_RR_PORT_CONFIG2_RAW10_8BIT_CTL_SHIFT);
>> +
>> +		break;
>> +
>> +	case RXPORT_MODE_RAW12_HF:
>> +	case RXPORT_MODE_RAW12_LF:
>> +		/* Not implemented */
>> +		return;
> 
> Isn't that a fatal error ? Maybe it's caught earlier on during the probe
> sequence in a place I have missed.

I had a WARN here before, but removed it due to review comments. It 
shouldn't happen, we should check at probe time that we only allow 
implemented ones (which we don't, so I'll add...).

>> +
>> +	case RXPORT_MODE_CSI2_SYNC:
>> +	case RXPORT_MODE_CSI2_ASYNC:
>> +		/* CSI-2 Mode (DS90UB953-Q1 compatible) */
>> +		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG, 0x3,
>> +					 0x0);
>> +
>> +		break;
>> +	}
>> +
>> +	/* LV_POLARITY & FV_POLARITY */
>> +	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
>> +				 rxport->lv_fv_pol);
>> +
>> +	/* Enable all interrupt sources from this port */
>> +	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07);
>> +	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f);
>> +
>> +	/* Enable I2C_PASS_THROUGH */
>> +	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
>> +				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
>> +				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH);
>> +
>> +	/* Enable I2C communication to the serializer via the alias addr */
>> +	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
>> +			   rxport->ser_alias << 1);
>> +
>> +	/* Configure EQ related settings */
>> +	ub960_rxport_config_eq(priv, nport);
>> +
>> +	/* Enable RX port */
>> +	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport));
>> +}
>> +
>> +static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
>> +					   struct ub960_rxport *rxport)
>> +{
>> +	unsigned int nport = rxport->nport;
>> +	u8 bc_freq_val;
>> +	u8 fpd_func_mode;
>> +
>> +	switch (rxport->rx_mode) {
>> +	case RXPORT_MODE_RAW10:
>> +		bc_freq_val = 0;
>> +		fpd_func_mode = 5;
>> +		break;
>> +
>> +	case RXPORT_MODE_RAW12_HF:
>> +		bc_freq_val = 0;
>> +		fpd_func_mode = 4;
>> +		break;
>> +
>> +	case RXPORT_MODE_RAW12_LF:
>> +		bc_freq_val = 0;
>> +		fpd_func_mode = 6;
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_SYNC:
>> +		bc_freq_val = 6;
>> +		fpd_func_mode = 2;
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_ASYNC:
>> +		bc_freq_val = 2;
>> +		fpd_func_mode = 2;
>> +		break;
>> +
>> +	default:
>> +		return;
>> +	}
>> +
>> +	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
>> +				 bc_freq_val);
>> +	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, fpd_func_mode);
>> +
>> +	/* set serdes_eq_mode = 1 */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xA8, 0x80);
>> +
>> +	/* enable serdes driver */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0D, 0x7F);
>> +
>> +	/* set serdes_eq_offset=4 */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x04);
>> +
>> +	/* init default serdes_eq_max in 0xA9 */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xA9, 0x23);
>> +
>> +	/* init serdes_eq_min in 0xAA */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xAA, 0);
>> +
>> +	/* serdes_driver_ctl2 control: DS90UB953-Q1/DS90UB933-Q1/DS90UB913A-Q1 */
>> +	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b,
>> +			      BIT(3), BIT(3));
>> +
>> +	/* RX port to half-rate */
>> +	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
>> +			  BIT(nport * 2));
>> +}
>> +
>> +static void ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
>> +					       struct ub960_rxport *rxport)
>> +{
>> +	unsigned int nport = rxport->nport;
>> +	bool first_time_power_up = true;
>> +
>> +	if (first_time_power_up) {
>> +		u8 v;
>> +
>> +		/* AEQ init */
>> +		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2C, &v);
>> +
>> +		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, v);
>> +		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, v + 1);
>> +
>> +		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x00);
>> +	}
>> +
>> +	/* enable serdes_eq_ctl2 */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9E, 0x00);
>> +
>> +	/* enable serdes_eq_ctl1 */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x90, 0x40);
>> +
>> +	/* enable serdes_eq_en */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2E, 0x40);
>> +
>> +	/* disable serdes_eq_override */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xF0, 0x00);
>> +
>> +	/* disable serdes_gain_override */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x71, 0x00);
>> +}
>> +
>> +static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
>> +					   struct ub960_rxport *rxport)
>> +{
>> +	unsigned int nport = rxport->nport;
>> +	u8 bc_freq_val;
>> +
>> +	switch (rxport->rx_mode) {
>> +	case RXPORT_MODE_RAW10:
>> +		bc_freq_val = 0;
>> +		break;
>> +
>> +	case RXPORT_MODE_RAW12_HF:
>> +		bc_freq_val = 0;
>> +		break;
>> +
>> +	case RXPORT_MODE_RAW12_LF:
>> +		bc_freq_val = 0;
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_SYNC:
>> +		bc_freq_val = 6;
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_ASYNC:
>> +		bc_freq_val = 2;
>> +		break;
>> +
>> +	default:
>> +		return;
>> +	}
>> +
>> +	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
>> +				 bc_freq_val);
>> +
>> +	/* FPD4 Sync Mode */
>> +	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, 0);
>> +
>> +	/* add serdes_eq_offset of 4 */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x04);
>> +
>> +	/* FPD4 serdes_start_eq in 0x27: assign default */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0);
>> +	/* FPD4 serdes_end_eq in 0x28: assign default */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, 0x23);
>> +
>> +	/* set serdes_driver_mode into FPD IV mode */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x04, 0x00);
>> +	/* set FPD PBC drv into FPD IV mode */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1B, 0x00);
>> +
>> +	/* set serdes_system_init to 0x2f */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x21, 0x2f);
>> +	/* set serdes_system_rst in reset mode */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xC1);
>> +
>> +	/* RX port to 7.55G mode */
>> +	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
>> +			  0 << (nport * 2));
>> +
>> +	ub960_init_rx_port_ub9702_fpd4_aeq(priv, rxport);
>> +}
>> +
>> +static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
>> +				      struct ub960_rxport *rxport)
>> +{
>> +	unsigned int nport = rxport->nport;
>> +
>> +	if (rxport->cdr_mode == RXPORT_CDR_FPD3)
>> +		ub960_init_rx_port_ub9702_fpd3(priv, rxport);
>> +	else /* RXPORT_CDR_FPD4 */
>> +		ub960_init_rx_port_ub9702_fpd4(priv, rxport);
>> +
>> +	switch (rxport->rx_mode) {
>> +	case RXPORT_MODE_RAW10:
>> +		/*
>> +		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
>> +		 * 0b10 : 8-bit processing using upper 8 bits
>> +		 */
>> +		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
>> +					 0x3 << 6, 0x2 << 6);
>> +
>> +		break;
>> +
>> +	case RXPORT_MODE_RAW12_HF:
>> +	case RXPORT_MODE_RAW12_LF:
>> +		/* Not implemented */
>> +		return;
>> +
>> +	case RXPORT_MODE_CSI2_SYNC:
>> +	case RXPORT_MODE_CSI2_ASYNC:
>> +
>> +		break;
>> +	}
>> +
>> +	/* LV_POLARITY & FV_POLARITY */
>> +	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3, 0x1);
>> +
>> +	/* Enable all interrupt sources from this port */
>> +	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07);
>> +	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f);
>> +
>> +	/* Enable I2C_PASS_THROUGH */
>> +	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
>> +				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
>> +				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH);
>> +
>> +	/* Enable I2C communication to the serializer via the alias addr */
>> +	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
>> +			   rxport->ser_alias << 1);
>> +
>> +	/* Enable RX port */
>> +	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport));
>> +
>> +	if (rxport->cdr_mode == RXPORT_CDR_FPD4) {
>> +		/* unreset 960 AEQ */
>> +		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0x41);
>> +	}
>> +}
>> +
>> +static int ub960_init_rx_ports(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		if (priv->hw_data->is_ub9702)
>> +			ub960_init_rx_port_ub9702(priv, rxport);
>> +		else
>> +			ub960_init_rx_port_ub960(priv, rxport);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	u8 rx_port_sts1;
>> +	u8 rx_port_sts2;
>> +	u8 csi_rx_sts;
>> +	u8 bcc_sts;
>> +	int ret = 0;
>> +
>> +	/* Read interrupts (also clears most of them) */
>> +	if (!ret)
>> +		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
>> +					&rx_port_sts1);
>> +	if (!ret)
>> +		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2,
>> +					&rx_port_sts2);
>> +	if (!ret)
>> +		ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS,
>> +					&csi_rx_sts);
>> +	if (!ret)
>> +		ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS,
>> +					&bcc_sts);
>> +
>> +	if (ret)
>> +		return;
>> +
>> +	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_PARITY_ERROR) {
>> +		u8 v1, v2;
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
> 
> 16-bit register access would be nice. This can be done on top. Please
> record all future tasks in a todo list btw :-)

Ok.

>> +		dev_err(dev, "rx%u parity errors: %u\n", nport, (v1 << 8) | v2);
> 
> Do any of these errors need to be rate-limited ?

We only support polling, so they won't spam too much. I don't know if we 
even want this kind of printing. It has been useful during development, 
for sure, but possibly in a production device many of these don't 
warrant a print, but rather some other means for the userspace to fetch 
e.g. the number of parity errors.

It's a bit difficult to say, as I don't have a product for these.

These prints could be easily hidden behind a module/compilation 
parameter if needed.

>> +	}
>> +
>> +	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR)
>> +		dev_err(dev, "rx%u BCC CRC error\n", nport);
>> +
>> +	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR)
>> +		dev_err(dev, "rx%u BCC SEQ error\n", nport);
>> +
>> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE)
>> +		dev_err(dev, "rx%u line length unstable\n", nport);
>> +
>> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR)
>> +		dev_err(dev, "rx%u FPD3 encode error\n", nport);
>> +
>> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_BUFFER_ERROR)
>> +		dev_err(dev, "rx%u buffer error\n", nport);
>> +
>> +	if (csi_rx_sts)
>> +		dev_err(dev, "rx%u CSI error: %#02x\n", nport, csi_rx_sts);
>> +
>> +	if (csi_rx_sts & UB960_RR_CSI_RX_STS_ECC1_ERR)
>> +		dev_err(dev, "rx%u CSI ECC1 error\n", nport);
>> +
>> +	if (csi_rx_sts & UB960_RR_CSI_RX_STS_ECC2_ERR)
>> +		dev_err(dev, "rx%u CSI ECC2 error\n", nport);
>> +
>> +	if (csi_rx_sts & UB960_RR_CSI_RX_STS_CKSUM_ERR)
>> +		dev_err(dev, "rx%u CSI checksum error\n", nport);
>> +
>> +	if (csi_rx_sts & UB960_RR_CSI_RX_STS_LENGTH_ERR)
>> +		dev_err(dev, "rx%u CSI length error\n", nport);
>> +
>> +	if (bcc_sts)
>> +		dev_err(dev, "rx%u BCC error: %#02x\n", nport, bcc_sts);
>> +
>> +	if (bcc_sts & UB960_RR_BCC_STATUS_RESP_ERR)
>> +		dev_err(dev, "rx%u BCC response error", nport);
>> +
>> +	if (bcc_sts & UB960_RR_BCC_STATUS_SLAVE_TO)
>> +		dev_err(dev, "rx%u BCC slave timeout", nport);
>> +
>> +	if (bcc_sts & UB960_RR_BCC_STATUS_SLAVE_ERR)
>> +		dev_err(dev, "rx%u BCC slave error", nport);
>> +
>> +	if (bcc_sts & UB960_RR_BCC_STATUS_MASTER_TO)
>> +		dev_err(dev, "rx%u BCC master timeout", nport);
>> +
>> +	if (bcc_sts & UB960_RR_BCC_STATUS_MASTER_ERR)
>> +		dev_err(dev, "rx%u BCC master error", nport);
>> +
>> +	if (bcc_sts & UB960_RR_BCC_STATUS_SEQ_ERROR)
>> +		dev_err(dev, "rx%u BCC sequence error", nport);
>> +
>> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_CHG) {
>> +		u8 v1, v2;
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_1, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_0, &v2);
>> +		dev_dbg(dev, "rx%u line len changed: %u\n", nport,
>> +			(v1 << 8) | v2);
>> +	}
>> +
>> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_CNT_CHG) {
>> +		u8 v1, v2;
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_HI, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_LO, &v2);
>> +		dev_dbg(dev, "rx%u line count changed: %u\n", nport,
>> +			(v1 << 8) | v2);
>> +	}
>> +
>> +	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS_CHG) {
>> +		dev_dbg(dev, "rx%u: %s, %s, %s, %s\n", nport,
>> +			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS) ?
>> +				"locked" :
>> +				"unlocked",
>> +			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_PORT_PASS) ?
>> +				"passed" :
>> +				"not passed",
>> +			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_CABLE_FAULT) ?
>> +				"no clock" :
>> +				"clock ok",
>> +			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_FREQ_STABLE) ?
>> +				"stable freq" :
>> +				"unstable freq");
>> +	}
>> +}
>> +
>> +/* -----------------------------------------------------------------------------
>> + * V4L2
>> + */
>> +
>> +static void ub960_get_vc_maps(struct ub960_data *priv,
>> +			      struct v4l2_subdev_state *state, u8 *vc)
>> +{
>> +	const struct v4l2_subdev_krouting *routing = &state->routing;
>> +	u8 cur_vc[UB960_MAX_TX_NPORTS] = { };
>> +	u8 handled_mask = 0;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
> 
> for_each_active_route()

Ok.

>> +		unsigned int rx, tx;
>> +
>> +		rx = ub960_pad_to_port(priv, route->sink_pad);
>> +		if (BIT(rx) & handled_mask)
>> +			continue;
>> +
>> +		tx = ub960_pad_to_port(priv, route->source_pad);
>> +
>> +		vc[rx] = cur_vc[tx]++;
>> +		handled_mask |= BIT(rx);
> 
> This isn't straightforward, so a comment on top of the function that
> explains what it does would be useful.

Sure. I just need to figure out what it does, first ;).

>> +	}
>> +}
>> +
>> +static int ub960_enable_tx_port(struct ub960_data *priv, unsigned int nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	dev_dbg(dev, "enable TX port %u\n", nport);
> 
> I wonder if this comment and the ones below are still useful for
> debugging.

You never know, but I can go through the debug prints and drop a bunch 
of them. I personally do like to have rather a bit more than a bit less 
of them (as long as they don't spam). These port enable/disable prints 
I'd rather keep, as it's not the most straightforward operation to 
manage the streams.

>> +
>> +	ub960_csiport_update_bits(priv, nport, UB960_TR_CSI_CTL,
>> +				  UB960_TR_CSI_CTL_CSI_ENABLE,
>> +				  UB960_TR_CSI_CTL_CSI_ENABLE);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_disable_tx_port(struct ub960_data *priv, unsigned int nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	dev_dbg(dev, "disable TX port %u\n", nport);
>> +
>> +	ub960_csiport_update_bits(priv, nport, UB960_TR_CSI_CTL,
>> +				  UB960_TR_CSI_CTL_CSI_ENABLE, 0);
>> +}
>> +
>> +static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	dev_dbg(dev, "enable RX port %u\n", nport);
>> +
>> +	/* Enable forwarding */
>> +	ub960_update_bits(priv, UB960_SR_FWD_CTL1, BIT(4 + nport), 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	dev_dbg(dev, "disable RX port %u\n", nport);
>> +
>> +	/* Disable forwarding */
>> +	ub960_update_bits(priv, UB960_SR_FWD_CTL1, BIT(4 + nport),
>> +			  BIT(4 + nport));
>> +}
>> +
>> +static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>> +					       struct v4l2_subdev_state *state)
>> +{
>> +	const struct v4l2_subdev_krouting *routing = &state->routing;
>> +	u8 fwd_ctl;
>> +	struct {
>> +		u32 num_streams;
>> +		u8 pixel_dt;
>> +		u8 meta_dt;
>> +		u32 meta_lines;
>> +		u32 tx_port;
>> +	} rx_data[UB960_MAX_RX_NPORTS] = { };
>> +	u8 vc_map[UB960_MAX_RX_NPORTS] = { };
>> +
>> +	ub960_get_vc_maps(priv, state, vc_map);
>> +
>> +	for (unsigned int i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
> 
> for_each_active_route()

Ok.

>> +		struct ub960_rxport *rxport;
>> +		struct ub960_txport *txport;
>> +		struct v4l2_mbus_framefmt *fmt;
>> +		const struct ub960_format_info *ub960_fmt;
>> +		unsigned int nport;
>> +
>> +		nport = ub960_pad_to_port(priv, route->sink_pad);
>> +
>> +		rxport = priv->rxports[nport];
>> +		if (!rxport)
>> +			return -EINVAL;
>> +
>> +		txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
>> +		if (!txport)
>> +			return -EINVAL;
>> +
>> +		rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
>> +
>> +		rx_data[nport].num_streams++;
>> +
>> +		/* For the rest, we are only interested in parallel busses */
>> +		if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
>> +		    rxport->rx_mode == RXPORT_MODE_CSI2_ASYNC)
>> +			continue;
>> +
>> +		if (rx_data[nport].num_streams > 2)
>> +			return -EPIPE;
>> +
>> +		fmt = v4l2_subdev_state_get_stream_format(state,
>> +							  route->sink_pad,
>> +							  route->sink_stream);
>> +		if (!fmt)
>> +			return -EPIPE;
>> +
>> +		ub960_fmt = ub960_find_format(fmt->code);
>> +		if (!ub960_fmt)
>> +			return -EPIPE;
>> +
>> +		if (ub960_fmt->meta) {
>> +			if (fmt->height > 3) {
>> +				dev_err(&priv->client->dev,
>> +					"rx%u: unsupported metadata height %u\n",
>> +					nport, fmt->height);
>> +				return -EPIPE;
>> +			}
>> +
>> +			rx_data[nport].meta_dt = ub960_fmt->datatype;
>> +			rx_data[nport].meta_lines = fmt->height;
>> +		} else {
>> +			rx_data[nport].pixel_dt = ub960_fmt->datatype;
>> +		}
>> +	}
>> +
>> +	/* Configure RX ports */
>> +
>> +	fwd_ctl = 0;
>> +
>> +	for (unsigned int nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +		u8 vc = vc_map[nport];
>> +
>> +		if (rx_data[nport].num_streams == 0)
>> +			continue;
>> +
>> +		switch (rxport->rx_mode) {
>> +		case RXPORT_MODE_RAW10:
>> +			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
>> +				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT));
>> +
>> +			ub960_rxport_write(priv, rxport->nport,
>> +				UB960_RR_RAW_EMBED_DTYPE,
>> +				(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
>> +					rx_data[nport].meta_dt);
>> +
>> +			break;
>> +
>> +		case RXPORT_MODE_RAW12_HF:
>> +		case RXPORT_MODE_RAW12_LF:
>> +			/* Not implemented */
>> +			break;
>> +
>> +		case RXPORT_MODE_CSI2_SYNC:
>> +		case RXPORT_MODE_CSI2_ASYNC:
>> +			if (!priv->hw_data->is_ub9702) {
>> +				/* Map all VCs from this port to the same VC */
> 
> Does this mean that a camera that sends data over multiple virtual
> channels will see all its VCs merged into one ? That doesn't sound good.

Yes. I don't know how to implement a configurable mapping. The driver 
could always manage the mapping itself, I think, but that might not work 
if the receiver expects certain VCs (say, on an FPGA platform).

> You don't have to fix it to get this patch merged, but I think it should
> be flagged as a fatal error.

Yes, I can add code to validate that the source subdevices only provide 
streams using a single VC.

>> +				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
>> +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
>> +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
>> +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
>> +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)));
>> +			} else {
>> +				unsigned int i;
>> +
>> +				/* Map all VCs from this port to VC(nport) */
>> +				for (i = 0; i < 8; ++i)
>> +					ub960_rxport_write(priv, nport,
>> +							   UB960_RR_VC_ID_MAP(i),
>> +							   nport);
>> +			}
>> +
>> +			break;
>> +		}
>> +
>> +		/* Forwarding */
>> +
>> +		fwd_ctl |= BIT(4 + nport); /* forward disable */
>> +
>> +		if (rx_data[nport].tx_port == 1)
>> +			fwd_ctl |= BIT(nport); /* forward to TX1 */
>> +		else
>> +			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
>> +	}
>> +
>> +	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_update_streaming_status(struct ub960_data *priv)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < UB960_MAX_NPORTS; ++i) {
>> +		if (priv->stream_enable_mask[i])
>> +			break;
>> +	}
>> +
>> +	priv->streaming = i < UB960_MAX_NPORTS;
> 
> priv->streaming is a boolean, is this really what you intended ?

What do you mean? "i < UB960_MAX_NPORTS" is boolean too.

>> +}
>> +
>> +static int ub960_enable_streams(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *state, u32 source_pad,
>> +				u64 source_streams_mask)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +	struct device *dev = &priv->client->dev;
>> +	const struct v4l2_subdev_krouting *routing;
>> +	unsigned int source_stream;
>> +	int ret;
>> +	u64 sink_streams[UB960_MAX_RX_NPORTS] = { };
>> +	unsigned int nport;
>> +	unsigned int failed_port;
>> +
>> +	dev_dbg(dev, "Enable streams %u:%#llx\n", source_pad,
>> +		source_streams_mask);
> 
> I'd move this to v4l2_subdev_enable_streams() if you want to keep it.

Hmm... I'll have to think about this. At the moment my debugging is 
easy, I use "dyndbg=+p" when I load the ub960 module, and I get a 
relatively short debug log of the important events happening wrt. ub960. 
Scattering the debug prints into other modules will make that more 
difficult.

>> +
>> +	if (priv->stream_enable_mask[source_pad] & source_streams_mask) {
>> +		dev_err(dev,
>> +			"cannot enable already enabled streams on pad %u mask %#llx\n",
>> +			source_pad, source_streams_mask);
>> +		return -EBUSY;
>> +	}
> 
> Isn't this caught by v4l2_subdev_enable_streams() already ?

Yes, I'll drop this.

>> +
>> +	routing = &state->routing;
>> +
>> +	if (!priv->streaming) {
>> +		dev_dbg(dev, "Prepare for streaming\n");
>> +		ret = ub960_configure_ports_for_streaming(priv, state);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	/* Enable TX port if not yet enabled */
>> +	if (!priv->stream_enable_mask[source_pad]) {
>> +		ret = ub960_enable_tx_port(priv,
>> +					   ub960_pad_to_port(priv, source_pad));
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	priv->stream_enable_mask[source_pad] |= source_streams_mask;
>> +
>> +	/* Collect sink streams per pad which we need to enable */
>> +	for (source_stream = 0; source_stream < sizeof(source_streams_mask) * 8;
>> +	     ++source_stream) {
>> +		struct v4l2_subdev_route *route;
>> +
>> +		if (!(source_streams_mask & BIT_ULL(source_stream)))
>> +			continue;
> 
> I would have sworn some kind of for_each_bit_set() macro existed.

I used that earlier. I changed it due to Sakari's comments:

>>> Does this work as expected? The second argument is expected to be unsigned
>>> long (or an array of two of them) whereas you have a u64.
>>
>> Where do you see that? I thought find_next_bit (used by for_each_set_bit) is
>> given a start address and arbitrarily large bit-size number.
> 
> sink_streams_mask is a u64 while for_each_set_bit() expects an array of
> unsigned longs. Endianness matters.

I couldn't quite figure out how they work, as there's no clear 
documentation and the calls quickly scatter to arch specific and asm 
code. So I just open wrote it, to be on the safe side.

>> +
>> +		for_each_active_route(routing, route) {
> 
> Use &state->routing here and drop the local routing variable.

Ok.

>> +			if (!(route->source_pad == source_pad) ||
>> +			    !(route->source_stream == source_stream))
>> +				continue;
>> +
>> +			nport = ub960_pad_to_port(priv, route->sink_pad);
>> +
>> +			sink_streams[nport] |= BIT_ULL(route->sink_stream);
>> +		}
>> +	}
> 
> I think it would be more efficient to swap the loops:
> 
> 	/* Collect sink streams per pad which we need to enable */
> 	for_each_active_route(&state->routing, route) {
> 		if (route->source_pad != source_pad ||
> 		    !(source_streams_mask & BIT_ULL(route->source_stream)))
> 			continue;
> 
> 		nport = ub960_pad_to_port(priv, route->sink_pad);
> 
> 		sink_streams[nport] |= BIT_ULL(route->sink_stream);
> 	}
> 
> Same below.

Yes, that is simpler.

>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		if (!sink_streams[nport])
>> +			continue;
>> +
>> +		/* Enable the RX port if not yet enabled */
>> +		if (!priv->stream_enable_mask[nport]) {
>> +			ret = ub960_enable_rx_port(priv, nport);
>> +			if (ret) {
>> +				failed_port = nport;
>> +				goto err;
>> +			}
>> +		}
>> +
>> +		priv->stream_enable_mask[nport] |= sink_streams[nport];
>> +
>> +		dev_dbg(dev, "Enable RX port %u streams %#llx\n", nport,
>> +			sink_streams[nport]);
>> +
>> +		ret = v4l2_subdev_enable_streams(
>> +			priv->rxports[nport]->source_sd,
>> +			priv->rxports[nport]->source_sd_pad,
>> +			sink_streams[nport]);
>> +		if (ret) {
>> +			priv->stream_enable_mask[nport] &= ~sink_streams[nport];
>> +
>> +			if (!priv->stream_enable_mask[nport])
>> +				ub960_disable_rx_port(priv, nport);
>> +
>> +			failed_port = nport;
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	priv->streaming = true;
>> +
>> +	return 0;
>> +
>> +err:
>> +	for (nport = 0; nport < failed_port; ++nport) {
>> +		if (!sink_streams[nport])
>> +			continue;
>> +
>> +		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
>> +			sink_streams[nport]);
>> +
>> +		ret = v4l2_subdev_disable_streams(
>> +			priv->rxports[nport]->source_sd,
>> +			priv->rxports[nport]->source_sd_pad,
>> +			sink_streams[nport]);
>> +		if (ret)
>> +			dev_err(dev, "Failed to disable streams: %d\n", ret);
>> +
>> +		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
>> +
>> +		/* Disable RX port if no active streams */
>> +		if (!priv->stream_enable_mask[nport])
>> +			ub960_disable_rx_port(priv, nport);
>> +	}
>> +
>> +	priv->stream_enable_mask[source_pad] &= ~source_streams_mask;
>> +
>> +	if (!priv->stream_enable_mask[source_pad])
>> +		ub960_disable_tx_port(priv,
>> +				      ub960_pad_to_port(priv, source_pad));
>> +
>> +	ub960_update_streaming_status(priv);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_disable_streams(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_state *state,
>> +				 u32 source_pad, u64 source_streams_mask)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +	struct device *dev = &priv->client->dev;
>> +	const struct v4l2_subdev_krouting *routing;
>> +	int ret;
>> +	unsigned int source_stream;
>> +	u64 sink_streams[UB960_MAX_RX_NPORTS] = { };
>> +	unsigned int nport;
>> +
>> +	dev_dbg(dev, "Disable streams %u:%#llx\n", source_pad,
>> +		source_streams_mask);
>> +
>> +	if ((priv->stream_enable_mask[source_pad] & source_streams_mask) != source_streams_mask) {
>> +		dev_err(dev,
>> +			"cannot disable already disabled streams on pad %u mask %#llx\n",
>> +			source_pad, source_streams_mask);
>> +		return -EBUSY;
>> +	}
>> +
>> +	routing = &state->routing;
>> +
>> +	/* Collect sink streams per pad which we need to disable */
>> +	for (source_stream = 0; source_stream < sizeof(source_streams_mask) * 8;
>> +	     ++source_stream) {
>> +		struct v4l2_subdev_route *route;
>> +
>> +		if (!(source_streams_mask & BIT_ULL(source_stream)))
>> +			continue;
>> +
>> +		for_each_active_route(routing, route) {
>> +			if (!(route->source_pad == source_pad) ||
>> +			    !(route->source_stream == source_stream))
>> +				continue;
>> +
>> +			nport = ub960_pad_to_port(priv, route->sink_pad);
>> +
>> +			sink_streams[nport] |= BIT_ULL(route->sink_stream);
>> +		}
>> +	}
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		if (!sink_streams[nport])
>> +			continue;
>> +
>> +		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
>> +			sink_streams[nport]);
>> +
>> +		ret = v4l2_subdev_disable_streams(
>> +			priv->rxports[nport]->source_sd,
>> +			priv->rxports[nport]->source_sd_pad,
>> +			sink_streams[nport]);
>> +		if (ret)
>> +			dev_err(dev, "Failed to disable streams: %d\n", ret);
>> +
>> +		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
>> +
>> +		/* Disable RX port if no active streams */
>> +		if (!priv->stream_enable_mask[nport])
>> +			ub960_disable_rx_port(priv, nport);
>> +	}
>> +
>> +	/* Disable TX port if no active streams */
>> +
>> +	priv->stream_enable_mask[source_pad] &= ~source_streams_mask;
>> +
>> +	if (!priv->stream_enable_mask[source_pad])
>> +		ub960_disable_tx_port(priv,
>> +				      ub960_pad_to_port(priv, source_pad));
>> +
>> +	ub960_update_streaming_status(priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +	const struct v4l2_subdev_krouting *routing;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_subdev_route *route;
>> +	u64 pad_stream_masks[UB960_MAX_TX_NPORTS] = { };
>> +	unsigned int nport;
>> +	int ret = 0;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +
>> +	routing = &state->routing;
>> +
>> +	for_each_active_route(routing, route)
>> +		pad_stream_masks[ub960_pad_to_port(priv, route->source_pad)] |=
>> +			BIT_ULL(route->source_stream);
>> +
>> +	if (enable) {
>> +		for (nport = 0; nport < UB960_MAX_TX_NPORTS; ++nport) {
>> +			if (pad_stream_masks[nport] == 0)
>> +				continue;
>> +
>> +			ret = ub960_enable_streams(
>> +				sd, state, priv->hw_data->num_rxports + nport,
>> +				pad_stream_masks[nport]);
>> +
>> +			if (ret) {
>> +				while (nport--) {
>> +					if (pad_stream_masks[nport] == 0)
>> +						continue;
>> +
>> +					ub960_disable_streams(
>> +						sd, state,
>> +						priv->hw_data->num_rxports +
>> +							nport,
>> +						pad_stream_masks[nport]);
>> +				}
>> +
>> +				break;
>> +			}
>> +		}
>> +	} else {
>> +		for (nport = 0; nport < UB960_MAX_TX_NPORTS; ++nport) {
>> +			if (pad_stream_masks[nport] == 0)
>> +				continue;
>> +
>> +			ub960_disable_streams(sd, state,
>> +					      priv->hw_data->num_rxports + nport,
>> +					      pad_stream_masks[nport]);
>> +		}
>> +	}
>> +
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_subdev_video_ops ub960_video_ops = {
>> +	.s_stream = ub960_s_stream,
>> +};
> 
> Can we drop this legacy helper ?

I think we can.

>> +
>> +static int _ub960_set_routing(struct v4l2_subdev *sd,
>> +			      struct v4l2_subdev_state *state,
>> +			      struct v4l2_subdev_krouting *routing)
>> +{
>> +	const struct v4l2_mbus_framefmt format = {
> 
> static const

Ok.

>> +		.width = 640,
>> +		.height = 480,
>> +		.code = MEDIA_BUS_FMT_UYVY8_2X8,
>> +		.field = V4L2_FIELD_NONE,
>> +		.colorspace = V4L2_COLORSPACE_SRGB,
>> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	};
>> +	int ret;
>> +
>> +	/*
>> +	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
>> +	 * frame desc is made dynamically allocated.
>> +	 */
>> +
>> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
>> +		return -E2BIG;
>> +
>> +	/*
>> +	 * TODO: We need a new flag to validate that all streams from a sink pad
>> +	 * go to a single source pad.
>> +	 */
> 
> Something like V4L2_SUBDEV_ROUTING_NO_STREAM_MIX, but still allowing N:1
> routing ? That would make sense, maybe as a rework for NO_STREAM_MIX.

Yes, something like that.

>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_set_routing(struct v4l2_subdev *sd,
>> +			     struct v4l2_subdev_state *state,
>> +			     enum v4l2_subdev_format_whence which,
>> +			     struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +
>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
>> +		return -EBUSY;
>> +
>> +	return _ub960_set_routing(sd, state, routing);
>> +}
>> +
>> +static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>> +				struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +	const struct v4l2_subdev_krouting *routing;
>> +	struct v4l2_subdev_route *route;
>> +	struct v4l2_subdev_state *state;
>> +	int ret = 0;
>> +	struct device *dev = &priv->client->dev;
>> +	u8 vc_map[UB960_MAX_RX_NPORTS] = { };
>> +
>> +	if (!ub960_pad_is_source(priv, pad))
>> +		return -EINVAL;
>> +
>> +	memset(fd, 0, sizeof(*fd));
>> +
>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
>> +
>> +	ub960_get_vc_maps(priv, state, vc_map);
>> +
>> +	routing = &state->routing;
>> +
>> +	for_each_active_route(routing, route) {
>> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
>> +		struct v4l2_mbus_frame_desc source_fd;
>> +		unsigned int nport;
>> +		unsigned int i;
>> +
>> +		if (route->source_pad != pad)
>> +			continue;
>> +
>> +		nport = ub960_pad_to_port(priv, route->sink_pad);
>> +
>> +		ret = v4l2_subdev_call(priv->rxports[nport]->source_sd, pad,
>> +				       get_frame_desc,
>> +				       priv->rxports[nport]->source_sd_pad,
>> +				       &source_fd);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"Failed to get source frame desc for pad %u\n",
>> +				route->sink_pad);
>> +			goto out_unlock;
>> +		}
>> +
>> +		for (i = 0; i < source_fd.num_entries; ++i)
>> +			if (source_fd.entry[i].stream == route->sink_stream) {
>> +				source_entry = &source_fd.entry[i];
>> +				break;
>> +			}
> 
> Curly braces for the for loop.

Ok.

>> +
>> +		if (!source_entry) {
>> +			dev_err(dev,
>> +				"Failed to find stream from source frame desc\n");
>> +			ret = -EPIPE;
>> +			goto out_unlock;
>> +		}
>> +
>> +		fd->entry[fd->num_entries].stream = route->source_stream;
>> +		fd->entry[fd->num_entries].flags = source_entry->flags;
>> +		fd->entry[fd->num_entries].length = source_entry->length;
>> +		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
>> +
>> +		fd->entry[fd->num_entries].bus.csi2.vc = vc_map[nport];
>> +
>> +		if (source_fd.type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>> +			fd->entry[fd->num_entries].bus.csi2.dt =
>> +				source_entry->bus.csi2.dt;
>> +		} else {
>> +			const struct ub960_format_info *ub960_fmt;
>> +			struct v4l2_mbus_framefmt *fmt;
>> +
>> +			fmt = v4l2_subdev_state_get_stream_format(state, pad,
>> +								  route->source_stream);
>> +
>> +			if (!fmt) {
>> +				ret = -EINVAL;
>> +				goto out_unlock;
>> +			}
>> +
>> +			ub960_fmt = ub960_find_format(fmt->code);
>> +			if (!ub960_fmt) {
>> +				dev_err(dev, "Unable to find format\n");
>> +				ret = -EINVAL;
>> +				goto out_unlock;
>> +			}
>> +
>> +			fd->entry[fd->num_entries].bus.csi2.dt =
>> +				ub960_fmt->datatype;
>> +		}
>> +
>> +		fd->num_entries++;
>> +	}
>> +
>> +out_unlock:
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_set_fmt(struct v4l2_subdev *sd,
>> +			 struct v4l2_subdev_state *state,
>> +			 struct v4l2_subdev_format *format)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
>> +		return -EBUSY;
>> +
>> +	/* No transcoding, source and sink formats must match. */
>> +	if (ub960_pad_is_source(priv, format->pad))
>> +		return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +	/* TODO: implement fmt validation */
> 
> Looks like something that should be done sooner than later :-)

First you ask for a TODO list. Then when I have TODO items, that's not 
good either!

>> +
>> +	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
>> +						  format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	*fmt = format->format;
>> +
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	*fmt = format->format;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_init_cfg(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_state *state)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +
>> +	struct v4l2_subdev_route routes[] = {
>> +		{
>> +			.sink_pad = 0,
>> +			.sink_stream = 0,
>> +			.source_pad = priv->hw_data->num_rxports,
>> +			.source_stream = 0,
>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>> +		},
>> +	};
>> +
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = ARRAY_SIZE(routes),
>> +		.routes = routes,
>> +	};
>> +
>> +	return _ub960_set_routing(sd, state, &routing);
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
>> +	.enable_streams = ub960_enable_streams,
>> +	.disable_streams = ub960_disable_streams,
>> +
>> +	.set_routing = ub960_set_routing,
>> +	.get_frame_desc = ub960_get_frame_desc,
>> +
>> +	.get_fmt = v4l2_subdev_get_fmt,
>> +	.set_fmt = ub960_set_fmt,
>> +
>> +	.init_cfg = ub960_init_cfg,
>> +};
>> +
>> +static int ub960_log_status(struct v4l2_subdev *sd)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +	struct device *dev = &priv->client->dev;
>> +	struct v4l2_subdev_state *state;
>> +	unsigned int nport;
>> +	u8 v = 0, v1 = 0, v2 = 0;
>> +	u8 id[7];
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +
>> +	for (unsigned int i = 0; i < 6; ++i)
>> +		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
>> +	id[6] = 0;
>> +
>> +	dev_info(dev, "ID '%s'\n", id);
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
>> +		struct ub960_txport *txport = priv->txports[nport];
>> +
>> +		dev_info(dev, "TX %u\n", nport);
>> +
>> +		if (!txport) {
>> +			dev_info(dev, "\tNot initialized\n");
>> +			continue;
>> +		}
>> +
>> +		ub960_csiport_read(priv, nport, UB960_TR_CSI_STS, &v);
>> +		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
>> +			 v & (u8)BIT(0));
>> +
>> +		ub960_read(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v1);
>> +		ub960_read(priv, UB960_SR_CSI_FRAME_COUNT_LO(nport), &v2);
>> +		dev_info(dev, "\tframe counter %u\n", (v1 << 8) | v2);
>> +
>> +		ub960_read(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport), &v1);
>> +		ub960_read(priv, UB960_SR_CSI_FRAME_ERR_COUNT_LO(nport), &v2);
>> +		dev_info(dev, "\tframe error counter %u\n", (v1 << 8) | v2);
>> +
>> +		ub960_read(priv, UB960_SR_CSI_LINE_COUNT_HI(nport), &v1);
>> +		ub960_read(priv, UB960_SR_CSI_LINE_COUNT_LO(nport), &v2);
>> +		dev_info(dev, "\tline counter %u\n", (v1 << 8) | v2);
>> +
>> +		ub960_read(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport), &v1);
>> +		ub960_read(priv, UB960_SR_CSI_LINE_ERR_COUNT_LO(nport), &v2);
>> +		dev_info(dev, "\tline error counter %u\n", (v1 << 8) | v2);
>> +	}
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +		u8 eq_level;
>> +		s8 strobe_pos;
>> +		unsigned int i;
>> +
>> +		dev_info(dev, "RX %u\n", nport);
>> +
>> +		if (!rxport) {
>> +			dev_info(dev, "\tNot initialized\n");
>> +			continue;
>> +		}
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v);
>> +
>> +		if (v & UB960_RR_RX_PORT_STS1_LOCK_STS)
>> +			dev_info(dev, "\tLocked\n");
>> +		else
>> +			dev_info(dev, "\tNot locked\n");
>> +
>> +		dev_info(dev, "\trx_port_sts1 %#02x\n", v);
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
>> +		dev_info(dev, "\trx_port_sts2 %#02x\n", v);
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
>> +		dev_info(dev, "\tlink freq %u MHz\n",
>> +			 v1 * 1000000 + v2 * 1000000 / 256);
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
>> +		dev_info(dev, "\tparity errors %u\n", (v1 << 8) | v2);
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_HI, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_LO, &v2);
>> +		dev_info(dev, "\tlines per frame %u\n", (v1 << 8) | v2);
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_1, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_0, &v2);
>> +		dev_info(dev, "\tbytes per line %u\n", (v1 << 8) | v2);
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
>> +		dev_info(dev, "\tcsi_err_counter %u\n", v);
>> +
>> +		/* Strobe */
>> +
>> +		ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
>> +
>> +		dev_info(dev, "\t%s strobe\n",
>> +			 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
>> +								  "Manual");
>> +
>> +		if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
>> +			ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
>> +
>> +			dev_info(dev, "\tStrobe range [%d, %d]\n",
>> +				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
>> +				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
>> +		}
>> +
>> +		ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
>> +
>> +		dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
>> +
>> +		/* EQ */
>> +
>> +		ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
>> +
>> +		dev_info(dev, "\t%s EQ\n",
>> +			 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
>> +							    "Adaptive");
>> +
>> +		if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
>> +			ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
>> +
>> +			dev_info(dev, "\tEQ range [%u, %u]\n",
>> +				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
>> +				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
>> +		}
>> +
>> +		if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
>> +			dev_info(dev, "\tEQ level %u\n", eq_level);
>> +
>> +		/* GPIOs */
>> +		for (i = 0; i < UB960_NUM_BC_GPIOS; ++i) {
>> +			u8 ctl_reg;
>> +			u8 ctl_shift;
>> +
>> +			ctl_reg = UB960_RR_BC_GPIO_CTL(i / 2);
>> +			ctl_shift = (i % 2) * 4;
>> +
>> +			ub960_rxport_read(priv, nport, ctl_reg, &v);
>> +
>> +			dev_info(dev, "\tGPIO%u: mode %u\n", i,
>> +				 (v >> ctl_shift) & 0xf);
>> +		}
>> +	}
>> +
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_core_ops ub960_subdev_core_ops = {
>> +	.log_status = ub960_log_status,
>> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>> +};
>> +
>> +static const struct v4l2_subdev_ops ub960_subdev_ops = {
>> +	.core = &ub960_subdev_core_ops,
>> +	.video = &ub960_video_ops,
>> +	.pad = &ub960_pad_ops,
>> +};
>> +
>> +static const struct media_entity_operations ub960_entity_ops = {
>> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
>> +	.link_validate = v4l2_subdev_link_validate,
>> +	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
>> +};
>> +
>> +static void ub960_enable_tpg(struct ub960_data *priv, int tpg_num)
>> +{
>> +	/*
>> +	 * Note: no need to write UB960_REG_IND_ACC_CTL: the only indirect
>> +	 * registers target we use is "CSI-2 Pattern Generator & Timing
>> +	 * Registers", which is the default
>> +	 */
> 
> You use ub960_write_ind() and ub960_write_ind16() below, so I don't
> think this is accurate anymore.

Indeed.

>> +
>> +	/*
>> +	 * TPG can only provide a single stream per CSI TX port. If
>> +	 * multiple streams are currently enabled, only the first
>> +	 * one will use the TPG, other streams will be halted.
>> +	 */
> 
> Hmmm... This feels a bit like a hack, especially given that you only
> support a single source port here, and hardcode the format to YUYV. I'm
> tempted to leave TPG support out, to add it on top in a cleaner way.

Yes, I can drop TPG.

>> +
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	u8 vbp, vfp;
>> +	u16 blank_lines;
>> +	u16 width;
>> +	u16 height;
>> +
>> +	u16 bytespp = 2; /* For MEDIA_BUS_FMT_UYVY8_1X16 */
> 
> const if it doesn't change.
> 
>> +	u8 cbars_idx = tpg_num - TEST_PATTERN_V_COLOR_BARS_1;
>> +	u8 num_cbars = 1 << cbars_idx;
>> +
>> +	u16 line_size;	/* Line size [bytes] */
>> +	u16 bar_size;	/* cbar size [bytes] */
>> +	u16 act_lpf;	/* active lines/frame */
>> +	u16 tot_lpf;	/* tot lines/frame */
>> +	u16 line_pd;	/* Line period in 10-ns units */
>> +
>> +	struct v4l2_subdev_state *state;
>> +
>> +	state = v4l2_subdev_get_locked_active_state(&priv->sd);
>> +
>> +	vbp = 33;
>> +	vfp = 10;
>> +	blank_lines = vbp + vfp + 2; /* total blanking lines */
> 
> Set all these variables when declaring them, and make them const.
> 
>> +
>> +	fmt = v4l2_subdev_state_get_stream_format(state, 4, 0);
> 
> A macro would be nice for the pad number.
> 
>> +	if (!fmt) {
>> +		dev_err(&priv->client->dev, "failed to enable TPG\n");
>> +		return;
>> +	}
>> +
>> +	width = fmt->width;
>> +	height = fmt->height;
> 
> Use fmt->width and fmt->height directly.
> 
>> +
>> +	line_size = width * bytespp;
>> +	bar_size = line_size / num_cbars;
>> +	act_lpf = height;
>> +	tot_lpf = act_lpf + blank_lines;
>> +	line_pd = 100000000 / 60 / tot_lpf;
>> +
>> +	/* Disable forwarding from FPD-3 RX ports */
>> +	ub960_read(priv, UB960_SR_FWD_CTL1, &priv->stored_fwd_ctl);
>> +	ub960_write(priv, UB960_SR_FWD_CTL1, 0xf << 4);
>> +
>> +	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CTL,
>> +			UB960_IR_PGEN_CTL_PGEN_ENABLE);
>> +
>> +	/* YUV422 8bit: 2 bytes/block, CSI-2 data type 0x1e */
>> +	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CFG,
>> +			cbars_idx << 4 | 0x2);
>> +	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CSI_DI,
>> +			0x1e);
>> +
>> +	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
>> +			  UB960_IR_PGEN_LINE_SIZE1, line_size);
>> +	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
>> +			  UB960_IR_PGEN_BAR_SIZE1, bar_size);
>> +	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
>> +			  UB960_IR_PGEN_ACT_LPF1, act_lpf);
>> +	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
>> +			  UB960_IR_PGEN_TOT_LPF1, tot_lpf);
>> +	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
>> +			  UB960_IR_PGEN_LINE_PD1, line_pd);
>> +	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_VBP, vbp);
>> +	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_VFP, vfp);
>> +}
>> +
>> +static void ub960_disable_tpg(struct ub960_data *priv)
>> +{
>> +	/* TPG off, enable forwarding from FPD-3 RX ports */
>> +	ub960_write(priv, UB960_SR_FWD_CTL1, priv->stored_fwd_ctl);
>> +
>> +	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CTL, 0x00);
>> +}
>> +
>> +static int ub960_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ub960_data *priv =
>> +		container_of(ctrl->handler, struct ub960_data, ctrl_handler);
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEST_PATTERN:
>> +		if (ctrl->val == 0)
>> +			ub960_disable_tpg(priv);
>> +		else
>> +			ub960_enable_tpg(priv, ctrl->val);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops ub960_ctrl_ops = {
>> +	.s_ctrl = ub960_s_ctrl,
>> +};
>> +
>> +/* -----------------------------------------------------------------------------
>> + * Core
>> + */
>> +
>> +static irqreturn_t ub960_handle_events(int irq, void *arg)
>> +{
>> +	struct ub960_data *priv = arg;
>> +	unsigned int i;
>> +	u8 int_sts;
>> +	u8 fwd_sts;
>> +	int ret;
>> +
>> +	ret = ub960_read(priv, UB960_SR_INTERRUPT_STS, &int_sts);
>> +	if (ret || !int_sts)
>> +		return IRQ_NONE;
>> +
>> +	dev_dbg(&priv->client->dev, "INTERRUPT_STS %x\n", int_sts);
>> +
>> +	ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
>> +
>> +	dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
>> +
>> +	for (i = 0; i < priv->hw_data->num_txports; ++i) {
>> +		if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
>> +			ub960_csi_handle_events(priv, i);
>> +	}
>> +
>> +	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
>> +		if (!priv->rxports[i])
>> +			continue;
>> +
>> +		if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i))
>> +			ub960_rxport_handle_events(priv, i);
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void ub960_handler_work(struct work_struct *work)
>> +{
>> +	struct delayed_work *dwork = to_delayed_work(work);
>> +	struct ub960_data *priv =
>> +		container_of(dwork, struct ub960_data, poll_work);
>> +
>> +	ub960_handle_events(0, priv);
>> +
>> +	schedule_delayed_work(&priv->poll_work,
>> +			      msecs_to_jiffies(UB960_POLL_TIME_MS));
>> +}
>> +
>> +static void ub960_txport_free_ports(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
>> +		struct ub960_txport *txport = priv->txports[nport];
>> +
>> +		if (!txport)
>> +			continue;
>> +
>> +		kfree(txport);
>> +		priv->txports[nport] = NULL;
>> +	}
>> +}
>> +
>> +static void ub960_rxport_free_ports(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		fwnode_handle_put(rxport->source_ep_fwnode);
>> +		fwnode_handle_put(rxport->remote_fwnode);
>> +
>> +		kfree(rxport);
>> +		priv->rxports[nport] = NULL;
>> +	}
>> +}
>> +
>> +static int ub960_parse_dt_base(struct ub960_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	size_t table_size;
>> +	u16 *aliases;
>> +	int ret;
>> +
>> +	ret = fwnode_property_count_u16(dev_fwnode(dev), "i2c-alias-pool");
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	table_size = ret;
>> +	priv->atr_alias_table.num_entries = ret;
>> +
>> +	if (!table_size)
>> +		return 0;
>> +
>> +	priv->atr_alias_table.entries =
>> +		devm_kcalloc(dev, table_size,
>> +			     sizeof(struct atr_alias_table_entry), GFP_KERNEL);
> 
> 			     sizeof(*priv->atr_alias_table.entries)
> 
> But what's the maximum number of aliases the device supports ? If it's
> small, we could allocate the maximum number of entries statically.

8 per port, so 32. I presume often we'll only need 1 alias per port, so 
we'd allocate 4.

>> +	if (!priv->atr_alias_table.entries)
>> +		return -ENOMEM;
>> +
>> +	aliases = kcalloc(table_size, sizeof(u16), GFP_KERNEL);
>> +	if (!aliases)
>> +		return -ENOMEM;
>> +
>> +	ret = fwnode_property_read_u16_array(dev_fwnode(dev), "i2c-alias-pool",
>> +					     aliases, table_size);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to read 'i2c-alias-pool' property: %d\n",
>> +			ret);
>> +		kfree(aliases);
>> +		return ret;
>> +	}
>> +
>> +	for (unsigned int i = 0; i < table_size; ++i)
>> +		priv->atr_alias_table.entries[i].alias_id = aliases[i];
>> +
>> +	kfree(aliases);
>> +
>> +	dev_dbg(dev, "i2c-alias-pool has %zu aliases", table_size);
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
>> +				      struct fwnode_handle *link_fwnode,
>> +				      struct ub960_rxport *rxport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int nport = rxport->nport;
>> +	u32 rx_mode;
>> +	u32 cdr_mode;
>> +	s32 strobe_pos;
>> +	u32 eq_level;
>> +	u32 ser_i2c_alias;
>> +	int ret;
>> +
>> +	ret = fwnode_property_read_u32(link_fwnode, "ti,cdr-mode", &cdr_mode);
>> +	if (ret == -EINVAL) {
>> +		cdr_mode = RXPORT_CDR_FPD3;
> 
> You could also initialize the variable to RXPORT_CDR_FDP3, and only
> check for
> 
> 	if (ret < 0 && ret != -EINVAL) {
> 		...
> 	}
> 
> Up to you. Similar refactorings can be done below, I think they would
> make the code simpler.

A bit shorter, at least. I like it.

But what other similar places did you see?

>> +	} else if (ret < 0) {
>> +		dev_err(dev, "rx%u: failed to read 'ti,cdr-mode': %d\n", nport,
> 
> If you moved the "ti,cdr-mode" to an argument, printed with %s, the same
> format string would be used for the other properties below, and should
> thus be de-duplicated by the compiler.

I'm not quite sure if this is a sensible optimization or not, but I did 
it so that I introduce:

const char *read_err_str = "rx%u: failed to read '%s': %d\n";

and then use that in the function, which makes the lines much shorter 
and, I think, a bit more readable.

>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	if (cdr_mode > RXPORT_CDR_LAST) {
>> +		dev_err(dev, "rx%u: bad 'ti,cdr-mode' %u\n", nport, cdr_mode);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
>> +		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
>> +		return -EINVAL;
>> +	}
>> +
>> +	rxport->cdr_mode = cdr_mode;
>> +
>> +	ret = fwnode_property_read_u32(link_fwnode, "ti,rx-mode", &rx_mode);
>> +	if (ret < 0) {
>> +		dev_err(dev, "rx%u: failed to read 'ti,rx-mode': %d\n", nport,
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rx_mode > RXPORT_MODE_LAST) {
>> +		dev_err(dev, "rx%u: bad 'ti,rx-mode' %u\n", nport, rx_mode);
>> +		return -EINVAL;
>> +	}
>> +
>> +	rxport->rx_mode = rx_mode;
>> +
>> +	/* EQ & Strobe related */
>> +
>> +	/* Defaults */
>> +	rxport->eq.manual_eq = false;
>> +	rxport->eq.aeq.eq_level_min = UB960_MIN_EQ_LEVEL;
>> +	rxport->eq.aeq.eq_level_max = UB960_MAX_EQ_LEVEL;
>> +
>> +	ret = fwnode_property_read_u32(link_fwnode, "ti,strobe-pos",
>> +				       &strobe_pos);
>> +	if (ret) {
>> +		if (ret != -EINVAL) {
>> +			dev_err(dev,
>> +				"rx%u: failed to read 'ti,strobe-pos': %d\n",
>> +				nport, ret);
>> +			return ret;
>> +		}
>> +	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
>> +		   strobe_pos > UB960_MAX_MANUAL_STROBE_POS) {
>> +		dev_err(dev, "rx%u: illegal 'strobe-pos' value: %d\n", nport,
>> +			strobe_pos);
>> +	} else {
>> +		/* NOTE: ignored unless global manual strobe pos is set */
>> +		rxport->eq.strobe_pos = strobe_pos;
>> +		if (!priv->strobe.manual)
>> +			dev_warn(dev,
>> +				 "rx%u: 'ti,strobe-pos' ignored as 'ti,manual-strobe' not set\n",
>> +				 nport);
>> +	}
>> +
>> +	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
>> +	if (ret) {
>> +		if (ret != -EINVAL) {
>> +			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
>> +				nport, ret);
>> +			return ret;
>> +		}
>> +	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
>> +		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
>> +			eq_level);
>> +	} else {
>> +		rxport->eq.manual_eq = true;
>> +		rxport->eq.manual.eq_level = eq_level;
>> +	}
>> +
>> +	ret = fwnode_property_read_u32(link_fwnode, "i2c-alias",
>> +				       &ser_i2c_alias);
>> +	if (ret) {
>> +		dev_err(dev, "rx%u: failed to read 'i2c-alias': %d\n", nport,
>> +			ret);
>> +		return ret;
>> +	}
>> +	rxport->ser_alias = ser_i2c_alias;
>> +
>> +	rxport->remote_fwnode = fwnode_get_named_child_node(link_fwnode, "serializer");
>> +	if (!rxport->remote_fwnode) {
>> +		dev_err(dev, "rx%u: missing 'serializer' node\n", nport);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_parse_dt_rxport_ep_properties(struct ub960_data *priv,
>> +					       struct fwnode_handle *ep_fwnode,
>> +					       struct ub960_rxport *rxport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int nport = rxport->nport;
>> +	int ret;
>> +	u32 v;
>> +
>> +	rxport->source_ep_fwnode = fwnode_graph_get_remote_endpoint(ep_fwnode);
>> +	if (!rxport->source_ep_fwnode) {
>> +		dev_err(dev, "rx%u: no remote endpoint\n", nport);
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* We currently have properties only for RAW modes */
>> +
>> +	switch (rxport->rx_mode) {
>> +	case RXPORT_MODE_RAW10:
>> +	case RXPORT_MODE_RAW12_HF:
>> +	case RXPORT_MODE_RAW12_LF:
>> +		break;
>> +	default:
>> +		return 0;
>> +	}
>> +
>> +	ret = fwnode_property_read_u32(ep_fwnode, "hsync-active", &v);
>> +	if (ret) {
>> +		dev_err(dev, "rx%u: failed to parse 'hsync-active': %d\n",
>> +			nport, ret);
>> +		goto err_put_source_ep_fwnode;
>> +	}
>> +
>> +	rxport->lv_fv_pol |= v ? UB960_RR_PORT_CONFIG2_LV_POL_LOW : 0;
>> +
>> +	ret = fwnode_property_read_u32(ep_fwnode, "vsync-active", &v);
>> +	if (ret) {
>> +		dev_err(dev, "rx%u: failed to parse 'vsync-active': %d\n",
>> +			nport, ret);
>> +		goto err_put_source_ep_fwnode;
>> +	}
>> +
>> +	rxport->lv_fv_pol |= v ? UB960_RR_PORT_CONFIG2_FV_POL_LOW : 0;
> 
> Can you use the V4L2 endpoint parsing helper ?

I'll add a todo.

>> +
>> +	return 0;
>> +
>> +err_put_source_ep_fwnode:
>> +	fwnode_handle_put(rxport->source_ep_fwnode);
>> +	return ret;
>> +}
>> +
>> +static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
>> +				 struct fwnode_handle *link_fwnode,
>> +				 struct fwnode_handle *ep_fwnode)
>> +{
>> +	const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
>> +							"vpoc2", "vpoc3" };
> 
> static

Ok.

>> +	struct device *dev = &priv->client->dev;
>> +	struct ub960_rxport *rxport;
>> +	int ret;
>> +
>> +	rxport = kzalloc(sizeof(*rxport), GFP_KERNEL);
>> +	if (!rxport)
>> +		return -ENOMEM;
>> +
>> +	priv->rxports[nport] = rxport;
>> +
>> +	rxport->nport = nport;
>> +	rxport->priv = priv;
>> +
>> +	ret = ub960_parse_dt_rxport_link_properties(priv, link_fwnode, rxport);
>> +	if (ret)
>> +		goto err_free_rxport;
>> +
>> +	rxport->vpoc = devm_regulator_get_optional(dev, vpoc_names[nport]);
>> +	if (IS_ERR(rxport->vpoc)) {
>> +		ret = PTR_ERR(rxport->vpoc);
>> +		if (ret == -ENODEV) {
>> +			rxport->vpoc = NULL;
>> +		} else {
>> +			dev_err(dev, "rx%u: failed to get VPOC supply: %d\n",
>> +				nport, ret);
>> +			goto err_put_remote_fwnode;
>> +		}
>> +	}
>> +
>> +	ret = ub960_parse_dt_rxport_ep_properties(priv, ep_fwnode, rxport);
>> +	if (ret)
>> +		goto err_put_remote_fwnode;
>> +
>> +	return 0;
>> +
>> +err_put_remote_fwnode:
>> +	fwnode_handle_put(rxport->remote_fwnode);
>> +err_free_rxport:
>> +	priv->rxports[nport] = NULL;
>> +	kfree(rxport);
>> +	return ret;
>> +}
>> +
>> +static struct fwnode_handle *
>> +ub960_fwnode_get_link_by_regs(struct fwnode_handle *links_fwnode,
>> +			      unsigned int nport)
>> +{
>> +	struct fwnode_handle *link_fwnode;
>> +	int ret;
>> +
>> +	fwnode_for_each_child_node(links_fwnode, link_fwnode) {
>> +		u32 link_num;
>> +
>> +		if (!str_has_prefix(fwnode_get_name(link_fwnode), "link@"))
>> +			continue;
>> +
>> +		ret = fwnode_property_read_u32(link_fwnode, "reg", &link_num);
>> +		if (ret) {
>> +			fwnode_handle_put(link_fwnode);
>> +			return NULL;
>> +		}
>> +
>> +		if (nport == link_num) {
>> +			fwnode_handle_put(link_fwnode);
> 
> You shouldn't drop the reference here as you're returning it from this
> function.

Yep.

>> +			return link_fwnode;
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int ub960_parse_dt_rxports(struct ub960_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct fwnode_handle *links_fwnode;
>> +	unsigned int nport;
>> +	int ret;
>> +
>> +	links_fwnode = fwnode_get_named_child_node(dev_fwnode(dev), "links");
>> +	if (!links_fwnode) {
>> +		dev_err(dev, "'links' node missing\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* Defaults, recommended by TI */
>> +	priv->strobe.min = 2;
>> +	priv->strobe.max = 3;
>> +
>> +	priv->strobe.manual = fwnode_property_read_bool(links_fwnode, "ti,manual-strobe");
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>> +		struct fwnode_handle *link_fwnode;
>> +		struct fwnode_handle *ep_fwnode;
>> +
>> +		link_fwnode = ub960_fwnode_get_link_by_regs(links_fwnode, nport);
>> +		if (!link_fwnode)
>> +			continue;
>> +
>> +		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
>> +							    nport, 0, 0);
>> +		if (!ep_fwnode) {
>> +			fwnode_handle_put(link_fwnode);
>> +			continue;
>> +		}
>> +
>> +		ret = ub960_parse_dt_rxport(priv, nport, link_fwnode,
>> +					    ep_fwnode);
>> +
>> +		fwnode_handle_put(link_fwnode);
>> +		fwnode_handle_put(ep_fwnode);
>> +
>> +		if (ret) {
>> +			dev_err(dev, "rx%u: failed to parse RX port\n", nport);
>> +			goto err_put_links;
>> +		}
>> +	}
>> +
>> +	fwnode_handle_put(links_fwnode);
>> +
>> +	return 0;
>> +
>> +err_put_links:
>> +	fwnode_handle_put(links_fwnode);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_parse_dt_txports(struct ub960_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	u32 nport;
>> +	int ret;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
>> +		struct fwnode_handle *ep_fwnode;
>> +
>> +		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
>> +			nport + priv->hw_data->num_rxports, 0, 0);
> 
> 		unsigned int port = nport + priv->hw_data->num_rxports;
> 
> 		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> 							    port, 0, 0);

Ok.

>> +		if (!ep_fwnode)
>> +			continue;
>> +
>> +		ret = ub960_parse_dt_txport(priv, ep_fwnode, nport);
>> +
>> +		fwnode_handle_put(ep_fwnode);
>> +
>> +		if (ret)
>> +			break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_parse_dt(struct ub960_data *priv)
>> +{
>> +	int ret;
>> +
>> +	ret = ub960_parse_dt_base(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub960_parse_dt_rxports(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub960_parse_dt_txports(priv);
>> +	if (ret)
>> +		goto err_free_rxports;
>> +
>> +	return 0;
>> +
>> +err_free_rxports:
>> +	ub960_rxport_free_ports(priv);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub960_notify_bound(struct v4l2_async_notifier *notifier,
>> +			      struct v4l2_subdev *subdev,
>> +			      struct v4l2_async_subdev *asd)
>> +{
>> +	struct ub960_data *priv = sd_to_ub960(notifier->sd);
>> +	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
>> +	struct device *dev = &priv->client->dev;
>> +	u8 nport = rxport->nport;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ret = media_entity_get_fwnode_pad(&subdev->entity,
>> +					  rxport->source_ep_fwnode,
>> +					  MEDIA_PAD_FL_SOURCE);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to find pad for %s\n", subdev->name);
>> +		return ret;
>> +	}
>> +
>> +	rxport->source_sd = subdev;
>> +	rxport->source_sd_pad = ret;
>> +
>> +	ret = media_create_pad_link(&rxport->source_sd->entity,
>> +				    rxport->source_sd_pad, &priv->sd.entity,
>> +				    nport,
>> +				    MEDIA_LNK_FL_ENABLED |
>> +					    MEDIA_LNK_FL_IMMUTABLE);
>> +	if (ret) {
>> +		dev_err(dev, "Unable to link %s:%u -> %s:%u\n",
>> +			rxport->source_sd->name, rxport->source_sd_pad,
>> +			priv->sd.name, nport);
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(dev, "Bound %s pad: %u on index %u\n", subdev->name,
>> +		rxport->source_sd_pad, nport);
>> +
>> +	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
>> +		if (priv->rxports[i] && !priv->rxports[i]->source_sd) {
>> +			dev_dbg(dev, "Waiting for more subdevs to be bound\n");
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	dev_dbg(dev, "All subdevs bound\n");
> 
> I'd drop these two debug messages. v4l2-async exposes the subdevs that
> are still needed in debugfs, so the information can be accessed there.

Ok.

>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_notify_unbind(struct v4l2_async_notifier *notifier,
>> +				struct v4l2_subdev *subdev,
>> +				struct v4l2_async_subdev *asd)
>> +{
>> +	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
>> +
>> +	rxport->source_sd = NULL;
> 
> Does this serve any purpose ? If not, I'd drop the unbind handler.

It makes sure we don't access the source subdev after it has been 
unbound. I don't see much harm with this function, but can catch cleanup 
errors.

>> +}
>> +
>> +static const struct v4l2_async_notifier_operations ub960_notify_ops = {
>> +	.bound = ub960_notify_bound,
>> +	.unbind = ub960_notify_unbind,
>> +};
>> +
>> +static int ub960_v4l2_notifier_register(struct ub960_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	v4l2_async_nf_init(&priv->notifier);
>> +
>> +	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
>> +		struct ub960_rxport *rxport = priv->rxports[i];
>> +		struct ub960_asd *asd;
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		asd = v4l2_async_nf_add_fwnode(&priv->notifier,
>> +					       rxport->source_ep_fwnode,
>> +					       struct ub960_asd);
>> +		if (IS_ERR(asd)) {
>> +			dev_err(dev, "Failed to add subdev for source %u: %pe",
>> +				i, asd);
>> +			v4l2_async_nf_cleanup(&priv->notifier);
>> +			return PTR_ERR(asd);
>> +		}
>> +
>> +		asd->rxport = rxport;
>> +	}
>> +
>> +	priv->notifier.ops = &ub960_notify_ops;
>> +
>> +	ret = v4l2_async_subdev_nf_register(&priv->sd, &priv->notifier);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register subdev_notifier");
>> +		v4l2_async_nf_cleanup(&priv->notifier);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub960_v4l2_notifier_unregister(struct ub960_data *priv)
>> +{
>> +	v4l2_async_nf_unregister(&priv->notifier);
>> +	v4l2_async_nf_cleanup(&priv->notifier);
>> +}
>> +
>> +static int ub960_create_subdev(struct ub960_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub960_subdev_ops);
> 
> A blank line would be nice.

Ok.

>> +	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
> 
> You create two controls.

Yep. Although I dropped TPG, so only one again.

>> +	priv->sd.ctrl_handler = &priv->ctrl_handler;
>> +
>> +	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub960_ctrl_ops,
>> +				     V4L2_CID_TEST_PATTERN,
>> +				     ARRAY_SIZE(ub960_tpg_qmenu) - 1, 0, 0,
>> +				     ub960_tpg_qmenu);
>> +
>> +	v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
>> +			       ARRAY_SIZE(priv->tx_link_freq) - 1, 0,
>> +			       priv->tx_link_freq);
>> +
>> +	if (priv->ctrl_handler.error) {
>> +		ret = priv->ctrl_handler.error;
>> +		goto err_free_ctrl;
>> +	}
>> +
>> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>> +			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
>> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +	priv->sd.entity.ops = &ub960_entity_ops;
>> +
>> +	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; i++) {
>> +		priv->pads[i].flags = ub960_pad_is_sink(priv, i) ?
>> +					      MEDIA_PAD_FL_SINK :
>> +					      MEDIA_PAD_FL_SOURCE;
>> +	}
>> +
>> +	ret = media_entity_pads_init(&priv->sd.entity,
>> +				     priv->hw_data->num_rxports +
>> +					     priv->hw_data->num_txports,
> 
> :-(

I don't have strong opinion on this, but don't you find it a bit 
confusing if a single argument spans multiple lines but without any indent?

With a quick look, this looks like a call with 4 arguments:

ret = media_entity_pads_init(&priv->sd.entity,
			     priv->hw_data->num_rxports +
			     priv->hw_data->num_txports,
			     priv->pads);

>> +				     priv->pads);
>> +	if (ret)
>> +		goto err_free_ctrl;
>> +
>> +	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
>> +
>> +	ret = v4l2_subdev_init_finalize(&priv->sd);
>> +	if (ret)
>> +		goto err_entity_cleanup;
>> +
>> +	ret = ub960_v4l2_notifier_register(priv);
>> +	if (ret) {
>> +		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
>> +		goto err_free_state;
>> +	}
>> +
>> +	ret = v4l2_async_register_subdev(&priv->sd);
>> +	if (ret) {
>> +		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
>> +		goto err_unreg_notif;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_unreg_notif:
>> +	ub960_v4l2_notifier_unregister(priv);
>> +err_free_state:
> 
> err_subdev_cleanup:

Yep.

>> +	v4l2_subdev_cleanup(&priv->sd);
>> +err_entity_cleanup:
>> +	media_entity_cleanup(&priv->sd.entity);
>> +err_free_ctrl:
>> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>> +
>> +	return ret;
>> +}
>> +
>> +static void ub960_destroy_subdev(struct ub960_data *priv)
>> +{
>> +	ub960_v4l2_notifier_unregister(priv);
>> +	v4l2_async_unregister_subdev(&priv->sd);
>> +
>> +	v4l2_subdev_cleanup(&priv->sd);
>> +
>> +	media_entity_cleanup(&priv->sd.entity);
>> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>> +}
>> +
>> +static const struct regmap_config ub960_regmap_config = {
>> +	.name = "ds90ub960",
>> +
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +
>> +	.max_register = 0xff,
>> +
>> +	/*
>> +	 * We do locking in the driver to cover the TX/RX port selection and the
>> +	 * indirect register access.
>> +	 */
>> +	.disable_locking = true,
>> +};
>> +
>> +static void ub960_reset(struct ub960_data *priv, bool reset_regs)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int v;
>> +	int ret;
>> +	u8 bit;
>> +
>> +	bit = reset_regs ? UB960_SR_RESET_DIGITAL_RESET1 :
>> +			   UB960_SR_RESET_DIGITAL_RESET0;
>> +
>> +	ub960_write(priv, UB960_SR_RESET, bit);
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = regmap_read_poll_timeout(priv->regmap, UB960_SR_RESET, v,
>> +				       (v & bit) == 0, 2000, 100000);
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	if (ret)
>> +		dev_err(dev, "reset failed: %d\n", ret);
>> +}
>> +
>> +static int ub960_get_hw_resources(struct ub960_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	priv->regmap = devm_regmap_init_i2c(priv->client, &ub960_regmap_config);
>> +	if (IS_ERR(priv->regmap))
>> +		return PTR_ERR(priv->regmap);
>> +
>> +	priv->vddio = devm_regulator_get(dev, "vddio");
>> +	if (IS_ERR(priv->vddio))
>> +		return dev_err_probe(dev, PTR_ERR(priv->vddio),
>> +				     "cannot get VDDIO regulator\n");
>> +
>> +	/* get power-down pin from DT */
>> +	priv->pd_gpio =
>> +		devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(priv->pd_gpio))
>> +		return dev_err_probe(dev, PTR_ERR(priv->pd_gpio),
>> +				     "Cannot get powerdown GPIO\n");
>> +
>> +	priv->refclk = devm_clk_get(dev, "refclk");
>> +	if (IS_ERR(priv->refclk))
>> +		return dev_err_probe(dev, PTR_ERR(priv->refclk),
>> +				     "Cannot get REFCLK\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub960_enable_core_hw(struct ub960_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	u8 rev_mask;
>> +	int ret;
>> +	u8 dev_sts;
>> +	u8 refclk_freq;
>> +
>> +	ret = regulator_enable(priv->vddio);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to enable VDDIO regulator\n");
>> +
>> +	ret = clk_prepare_enable(priv->refclk);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "Failed to enable refclk\n");
>> +		goto err_disable_vddio;
>> +	}
>> +
>> +	if (priv->pd_gpio) {
>> +		gpiod_set_value_cansleep(priv->pd_gpio, 1);
>> +		/* wait min 2 ms for reset to complete */
>> +		usleep_range(2000, 5000);
>> +		gpiod_set_value_cansleep(priv->pd_gpio, 0);
>> +		/* wait min 2 ms for power up to finish */
>> +		usleep_range(2000, 5000);
> 
> You could use fsleep().

Yep, thanks for introducing it to me =).

>> +	}
>> +
>> +	ub960_reset(priv, true);
>> +
>> +	/* Runtime check register accessibility */
>> +	ret = ub960_read(priv, UB960_SR_REV_MASK, &rev_mask);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "Cannot read first register, abort\n");
>> +		goto err_pd_gpio;
>> +	}
>> +
>> +	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
>> +		rev_mask);
>> +
>> +	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts);
>> +	if (ret)
>> +		goto err_pd_gpio;
>> +
>> +	ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
>> +	if (ret)
>> +		goto err_pd_gpio;
>> +
>> +	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
>> +		!!(dev_sts & BIT(4)), refclk_freq,
>> +		clk_get_rate(priv->refclk) / 1000000);
>> +
>> +	/* Disable all RX ports by default */
>> +	ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);
>> +
>> +	return 0;
>> +
>> +err_pd_gpio:
>> +	gpiod_set_value_cansleep(priv->pd_gpio, 1);
>> +	clk_disable_unprepare(priv->refclk);
>> +err_disable_vddio:
>> +	regulator_disable(priv->vddio);
>> +
>> +	return ret;
>> +}
>> +
>> +static void ub960_disable_core_hw(struct ub960_data *priv)
>> +{
>> +	gpiod_set_value_cansleep(priv->pd_gpio, 1);
>> +	clk_disable_unprepare(priv->refclk);
>> +	regulator_disable(priv->vddio);
>> +}
>> +
>> +static int ub960_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct ub960_data *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->client = client;
>> +
>> +	priv->hw_data = device_get_match_data(dev);
>> +
>> +	mutex_init(&priv->reg_lock);
>> +	mutex_init(&priv->atr_alias_table.lock);
>> +
>> +	INIT_DELAYED_WORK(&priv->poll_work, ub960_handler_work);
>> +
>> +	/*
>> +	 * Initialize these to invalid values so that the first reg writes will
>> +	 * configure the target.
>> +	 */
>> +	priv->current_indirect_target = 0xff;
>> +	priv->current_read_rxport = 0xff;
>> +	priv->current_write_rxport_mask = 0xff;
>> +	priv->current_read_csiport = 0xff;
>> +	priv->current_write_csiport_mask = 0xff;
>> +
>> +	ret = ub960_get_hw_resources(priv);
>> +	if (ret)
>> +		goto err_mutex_destroy;
>> +
>> +	ret = ub960_enable_core_hw(priv);
>> +	if (ret)
>> +		goto err_mutex_destroy;
>> +
>> +	/* release GPIO lock */
>> +	if (priv->hw_data->is_ub9702)
>> +		ub960_update_bits(priv, UB960_SR_RESET,
>> +				  UB960_SR_RESET_GPIO_LOCK_RELEASE,
>> +				  UB960_SR_RESET_GPIO_LOCK_RELEASE);
> 
> Could this be moved to ub960_enable_core_hw() ?

Yes.

>> +
>> +	ret = ub960_parse_dt(priv);
>> +	if (ret)
>> +		goto err_disable_core_hw;
>> +
>> +	ret = ub960_init_tx_ports(priv);
>> +	if (ret)
>> +		goto err_free_ports;
>> +
>> +	ret = ub960_rxport_enable_vpocs(priv);
>> +	if (ret)
>> +		goto err_free_ports;
>> +
>> +	ret = ub960_init_rx_ports(priv);
>> +	if (ret)
>> +		goto err_disable_vpocs;
>> +
>> +	ub960_reset(priv, false);
>> +
>> +	ub960_rxport_wait_locks(priv, GENMASK(3, 0), NULL);
>> +
>> +	/*
>> +	 * Clear any errors caused by switching the RX port settings while
>> +	 * probing.
>> +	 */
>> +	ub960_clear_rx_errors(priv);
>> +
>> +	ret = ub960_init_atr(priv);
>> +	if (ret)
>> +		goto err_disable_vpocs;
>> +
>> +	ret = ub960_rxport_add_serializers(priv);
>> +	if (ret)
>> +		goto err_uninit_atr;
>> +
>> +	ret = ub960_create_subdev(priv);
>> +	if (ret)
>> +		goto err_free_sers;
>> +
>> +	if (client->irq)
>> +		dev_warn(dev, "irq support not implemented, using polling\n");
> 
> That's not nice :-( Can it be fixed ? I'm OK if you do so on top.

Fixed? You mean implemented? I don't have HW, so I'd rather leave it to 
someone who has.

>> +
>> +	schedule_delayed_work(&priv->poll_work,
>> +			      msecs_to_jiffies(UB960_POLL_TIME_MS));
>> +
>> +	return 0;
>> +
>> +err_free_sers:
>> +	ub960_rxport_remove_serializers(priv);
>> +err_uninit_atr:
>> +	ub960_uninit_atr(priv);
>> +err_disable_vpocs:
>> +	ub960_rxport_disable_vpocs(priv);
>> +err_free_ports:
>> +	ub960_rxport_free_ports(priv);
>> +	ub960_txport_free_ports(priv);
>> +err_disable_core_hw:
>> +	ub960_disable_core_hw(priv);
>> +err_mutex_destroy:
>> +	mutex_destroy(&priv->atr_alias_table.lock);
>> +	mutex_destroy(&priv->reg_lock);
>> +	return ret;
>> +}
>> +
>> +static void ub960_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct ub960_data *priv = sd_to_ub960(sd);
>> +
>> +	cancel_delayed_work_sync(&priv->poll_work);
>> +
>> +	ub960_destroy_subdev(priv);
>> +	ub960_rxport_remove_serializers(priv);
>> +	ub960_uninit_atr(priv);
>> +	ub960_rxport_disable_vpocs(priv);
>> +	ub960_rxport_free_ports(priv);
>> +	ub960_txport_free_ports(priv);
>> +	ub960_disable_core_hw(priv);
>> +	mutex_destroy(&priv->atr_alias_table.lock);
>> +	mutex_destroy(&priv->reg_lock);
>> +}
>> +
>> +static const struct ub960_hw_data ds90ub960_hw = {
>> +	.model = "ub960",
>> +	.num_rxports = 4,
>> +	.num_txports = 2,
>> +};
>> +
>> +static const struct ub960_hw_data ds90ub9702_hw = {
>> +	.model = "ub9702",
>> +	.num_rxports = 4,
>> +	.num_txports = 2,
>> +	.is_ub9702 = true,
>> +	.is_fpdlink4 = true,
>> +};
>> +
>> +static const struct i2c_device_id ub960_id[] = {
>> +	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
>> +	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ub960_id);
>> +
>> +static const struct of_device_id ub960_dt_ids[] = {
>> +	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
>> +	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, ub960_dt_ids);
>> +
>> +static struct i2c_driver ds90ub960_driver = {
>> +	.probe_new	= ub960_probe,
>> +	.remove		= ub960_remove,
>> +	.id_table	= ub960_id,
>> +	.driver = {
>> +		.name	= "ds90ub960",
>> +		.of_match_table = ub960_dt_ids,
>> +	},
>> +};
>> +module_i2c_driver(ds90ub960_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Texas Instruments FPD-Link III/IV Deserializers Driver");
>> +MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
>> +MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
>> +MODULE_IMPORT_NS(I2C_ATR);
>> diff --git a/include/media/i2c/ds90ub9xx.h b/include/media/i2c/ds90ub9xx.h
>> new file mode 100644
>> index 000000000000..42d47d732c03
>> --- /dev/null
>> +++ b/include/media/i2c/ds90ub9xx.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __MEDIA_I2C_DS90UB9XX_H__
>> +#define __MEDIA_I2C_DS90UB9XX_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct i2c_atr;
>> +
> 
> As this is a cross-driver API, kerneldoc would be nice.

Ok.

>> +struct ds90ub9xx_platform_data {
>> +	u32 port;
>> +	struct i2c_atr *atr;
>> +	unsigned long bc_rate;
>> +};
>> +
>> +#endif /* __MEDIA_I2C_DS90UB9XX_H__ */
> 

I hope I caught all the review comments. I have addressed many of them 
already in my branch, and I have this todo. I'll implement at least some 
of those before sending a new version:

- move MHZ()  to units.h
- implement fmt validation
- use the V4L2 endpoint parsing helper (for tx port and also for rx port)
- "nport" -> "port_idx"? maybe not...
- ub960_pad_is_source(): can the second condition occur? not if v4l2 
makes sure we don't get bad pads.
- error checking on i2c reads/writes
- 16-bit register access
- drop legacy bus formats. Check CAL.
- ub960_atr_attach_client(): cache per-port mask
- New route validation flag. Something like 
V4L2_SUBDEV_ROUTING_NO_STREAM_MIX, but still allowing N:1 routing ? That 
would make sense, maybe as a rework for NO_STREAM_MIX.
- check for removable debug prints

  Tomi

