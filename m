Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32CC4674F3A
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 09:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjATINi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 03:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjATINi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 03:13:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15BC8535B;
        Fri, 20 Jan 2023 00:13:31 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AA3C501;
        Fri, 20 Jan 2023 09:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674202409;
        bh=GGOIVt1MBkuKlVw4r2Qm7vzcEcRIfY0zMXg7brdmdOQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=k+Cki2xVdSRdNCHNg1nqZk4TWWgFG+XOA1r4uDdGWvb17QVHFO64IY0qS1LSWY6F+
         GgemupKMDxmaPDpZDKChHYF2coQbKmhUn+BQI/6XvGrx/K5QmMxBrZXbSRarljYH68
         PjhcDz17PxnExnyiknPdjAXk0Ta9uu4LGZxaO4SY=
Message-ID: <eab3c178-6a10-e949-ebbc-c45094d4b67a@ideasonboard.com>
Date:   Fri, 20 Jan 2023 10:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 7/7] media: i2c: add DS90UB953 driver
Content-Language: en-US
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
        Marek Vasut <marex@denx.de>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-8-tomi.valkeinen@ideasonboard.com>
 <Y8nhi6N2vTYJ+Vfh@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y8nhi6N2vTYJ+Vfh@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/01/2023 02:34, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Jan 18, 2023 at 02:40:31PM +0200, Tomi Valkeinen wrote:
>> Add driver for TI DS90UB953 FPD-Link III Serializer.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/i2c/Kconfig     |   13 +
>>   drivers/media/i2c/Makefile    |    1 +
>>   drivers/media/i2c/ds90ub953.c | 1576 +++++++++++++++++++++++++++++++++
>>   3 files changed, 1590 insertions(+)
>>   create mode 100644 drivers/media/i2c/ds90ub953.c
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index e0a1c2a5f3bf..0590312ec751 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1614,6 +1614,19 @@ config VIDEO_DS90UB913
>>   	  Device driver for the Texas Instruments DS90UB913
>>   	  FPD-Link III Serializer.
>>   
>> +config VIDEO_DS90UB953
>> +	tristate "TI FPD-Link III/IV CSI-2 Serializers"
>> +	depends on OF && I2C && VIDEO_DEV
>> +	select I2C_ATR
>> +	select MEDIA_CONTROLLER
>> +	select OF_GPIO
>> +	select REGMAP_I2C
>> +	select V4L2_FWNODE
>> +	select VIDEO_V4L2_SUBDEV_API
>> +	help
>> +	  Device driver for the Texas Instruments DS90UB953
>> +	  FPD-Link III Serializer and DS90UB971 FPD-Link IV Serializer.
>> +
>>   config VIDEO_DS90UB960
>>   	tristate "TI FPD-Link III/IV Deserializers"
>>   	depends on OF && I2C && VIDEO_DEV
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index c4875ec8c3b9..efd5f717a5f7 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -143,4 +143,5 @@ obj-$(CONFIG_VIDEO_VS6624) += vs6624.o
>>   obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
>>   obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
>>   obj-$(CONFIG_VIDEO_DS90UB913)	+= ds90ub913.o
>> +obj-$(CONFIG_VIDEO_DS90UB953)	+= ds90ub953.o
>>   obj-$(CONFIG_VIDEO_DS90UB960)	+= ds90ub960.o
>> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
>> new file mode 100644
>> index 000000000000..ec33e16da3d1
>> --- /dev/null
>> +++ b/drivers/media/i2c/ds90ub953.c
>> @@ -0,0 +1,1576 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for the Texas Instruments DS90UB953 video serializer
>> + *
>> + * Based on a driver from Luca Ceresoli <luca@lucaceresoli.net>
>> + *
>> + * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
>> + * Copyright (c) 2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/fwnode.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/i2c-atr.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/math64.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/property.h>
>> +#include <linux/rational.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <media/i2c/ds90ub9xx.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#define UB953_PAD_SINK			0
>> +#define UB953_PAD_SOURCE		1
>> +
>> +#define UB953_NUM_GPIOS			4
>> +
>> +#define UB953_REG_RESET_CTL			0x01
>> +#define UB953_REG_RESET_CTL_DIGITAL_RESET_1	BIT(1)
>> +#define UB953_REG_RESET_CTL_DIGITAL_RESET_0	BIT(0)
>> +
>> +#define UB953_REG_GENERAL_CFG			0x02
>> +#define UB953_REG_GENERAL_CFG_CONT_CLK		BIT(6)
>> +#define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT	4
>> +#define UB953_REG_GENERAL_CFG_CSI_LANE_SEL_MASK	GENMASK(5, 4)
>> +#define UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE	BIT(1)
>> +#define UB953_REG_GENERAL_CFG_I2C_STRAP_MODE	BIT(0)
>> +
>> +#define UB953_REG_MODE_SEL			0x03
>> +#define UB953_REG_MODE_SEL_MODE_DONE		BIT(3)
>> +#define UB953_REG_MODE_SEL_MODE_OVERRIDE	BIT(4)
>> +#define UB953_REG_MODE_SEL_MODE_MASK		GENMASK(2, 0)
>> +
>> +#define UB953_REG_CLKOUT_CTRL0			0x06
>> +#define UB953_REG_CLKOUT_CTRL1			0x07
>> +
>> +#define UB953_REG_SCL_HIGH_TIME			0x0B
>> +#define UB953_REG_SCL_LOW_TIME			0x0C
> 
> You have a mix of uppercase and lowercase hex constants, please
> standardize on one of them. In the media subsystem we usually go for
> lowercase.

Yep.

>> +
>> +#define UB953_REG_LOCAL_GPIO_DATA		0x0d
>> +#define UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(n)		BIT(4 + (n))
>> +#define UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(n)	BIT(0 + (n))
>> +
>> +#define UB953_REG_GPIO_INPUT_CTRL		0x0e
>> +#define UB953_REG_GPIO_INPUT_CTRL_OUT_EN(n)	BIT(4 + (n))
>> +#define UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(n)	BIT(0 + (n))
>> +
>> +#define UB953_REG_REV_MASK_ID			0x50
>> +#define UB953_REG_GENERAL_STATUS		0x52
>> +
>> +#define UB953_REG_GPIO_PIN_STS			0x53
>> +#define UB953_REG_GPIO_PIN_STS_GPIO_STS(n)	BIT(0 + (n))
>> +
>> +#define UB953_REG_BIST_ERR_CNT			0x54
>> +#define UB953_REG_CRC_ERR_CNT1			0x55
>> +#define UB953_REG_CRC_ERR_CNT2			0x56
>> +
>> +#define UB953_REG_CSI_ERR_CNT			0x5c
>> +#define UB953_REG_CSI_ERR_STATUS		0x5D
>> +#define UB953_REG_CSI_ERR_DLANE01		0x5E
>> +#define UB953_REG_CSI_ERR_DLANE23		0x5F
>> +#define UB953_REG_CSI_ERR_CLK_LANE		0x60
>> +#define UB953_REG_CSI_PKT_HDR_VC_ID		0x61
>> +#define UB953_REG_PKT_HDR_WC_LSB		0x62
>> +#define UB953_REG_PKT_HDR_WC_MSB		0x63
>> +#define UB953_REG_CSI_ECC			0x64
>> +
>> +#define UB953_REG_IND_ACC_CTL			0xb0
>> +#define UB953_REG_IND_ACC_ADDR			0xb1
>> +#define UB953_REG_IND_ACC_DATA			0xb2
>> +
>> +#define UB953_REG_FPD3_RX_ID(n)			(0xf0 + (n))
>> +
>> +/* Indirect register blocks */
>> +#define UB953_IND_TARGET_PAT_GEN		0x00
>> +#define UB953_IND_TARGET_FPD3_TX		0x01
>> +#define UB953_IND_TARGET_DIE_ID			0x02
>> +
>> +#define UB953_IND_PGEN_CTL			0x01
>> +#define UB953_IND_PGEN_CTL_PGEN_ENABLE		BIT(0)
>> +#define UB953_IND_PGEN_CFG			0x02
>> +#define UB953_IND_PGEN_CSI_DI			0x03
>> +#define UB953_IND_PGEN_LINE_SIZE1		0x04
>> +#define UB953_IND_PGEN_LINE_SIZE0		0x05
>> +#define UB953_IND_PGEN_BAR_SIZE1		0x06
>> +#define UB953_IND_PGEN_BAR_SIZE0		0x07
>> +#define UB953_IND_PGEN_ACT_LPF1			0x08
>> +#define UB953_IND_PGEN_ACT_LPF0			0x09
>> +#define UB953_IND_PGEN_TOT_LPF1			0x0A
>> +#define UB953_IND_PGEN_TOT_LPF0			0x0B
>> +#define UB953_IND_PGEN_LINE_PD1			0x0C
>> +#define UB953_IND_PGEN_LINE_PD0			0x0D
>> +#define UB953_IND_PGEN_VBP			0x0E
>> +#define UB953_IND_PGEN_VFP			0x0F
>> +#define UB953_IND_PGEN_COLOR(n)			(0x10 + (n)) /* n <= 15 */
>> +
>> +/* Note: Only sync mode supported for now */
>> +enum ub953_mode {
>> +	/* FPD-Link III CSI-2 synchronous mode */
>> +	UB953_MODE_SYNC,
>> +	/* FPD-Link III CSI-2 non-synchronous mode, external ref clock */
>> +	UB953_MODE_NONSYNC_EXT,
>> +	/* FPD-Link III CSI-2 non-synchronous mode, internal ref clock */
>> +	UB953_MODE_NONSYNC_INT,
>> +	/* FPD-Link III DVP mode */
>> +	UB953_MODE_DVP,
>> +};
>> +
>> +struct ub953_hw_data {
>> +	const char *model;
>> +	bool is_ub971;
>> +};
>> +
>> +struct ub953_data {
>> +	const struct ub953_hw_data	*hw_data;
>> +
>> +	struct i2c_client	*client;
>> +	struct regmap		*regmap;
>> +
>> +	u32			num_data_lanes;
>> +
>> +	struct gpio_chip	gpio_chip;
>> +
>> +	struct v4l2_subdev	sd;
>> +	struct media_pad	pads[2];
>> +
>> +	struct v4l2_async_notifier	notifier;
>> +
>> +	struct v4l2_subdev	*source_sd;
>> +	u16			source_sd_pad;
>> +
>> +	struct v4l2_ctrl_handler   ctrl_handler;
>> +
>> +	u64			enabled_source_streams;
>> +
>> +	/* lock for register access */
>> +	struct mutex		reg_lock;
>> +
>> +	u8			current_indirect_target;
>> +
>> +	struct clk_hw		clkout_clk_hw;
>> +
>> +	enum ub953_mode		mode;
>> +
>> +	struct ds90ub9xx_platform_data *plat_data;
> 
> const.

Ok.

>> +};
>> +
>> +static inline struct ub953_data *sd_to_ub953(struct v4l2_subdev *sd)
>> +{
>> +	return container_of(sd, struct ub953_data, sd);
>> +}
>> +
>> +/*
>> + * HW Access
>> + */
>> +
>> +static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val)
>> +{
>> +	unsigned int v;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = regmap_read(priv->regmap, reg, &v);
>> +	if (ret)
>> +		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
>> +			reg, ret);
>> +	else
>> +		*val = v;
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub953_write(struct ub953_data *priv, u8 reg, u8 val)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = regmap_write(priv->regmap, reg, val);
>> +	if (ret)
>> +		dev_err(&priv->client->dev,
>> +			"Cannot write register 0x%02x: %d\n", reg, ret);
>> +
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int _ub953_select_ind_reg_block(struct ub953_data *priv, u8 block)
> 
> Is the leading _ needed ?

No. I'm not sure why I added that...

>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	if (priv->current_indirect_target == block)
>> +		return 0;
>> +
>> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_CTL, block << 2);
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot select indirect target %u (%d)\n",
>> +			__func__, block, ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->current_indirect_target = block;
>> +
>> +	return 0;
>> +}
>> +
>> +__maybe_unused static int ub953_read_ind(struct ub953_data *priv, u8 block,
>> +					 u8 reg, u8 *val)
> 
> I'd still prefer dropping this function, but I won't insist.
> 
>> +{
>> +	unsigned int v;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = _ub953_select_ind_reg_block(priv, block);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
>> +			block, reg, ret);
>> +		goto out;
>> +	}
> 
> Would it make sense to cache the address as you do with
> current_indirect_block, and skip this write if the address is correct
> already ? If the device implements auto-increment of the address (I
> haven't checked), this could save quite a few I2C writes.

Yes, there's auto increment for these indirect register accesses 
(IA_AUTO_INC). There's also IA_READ bit, but I don't understand what it 
does:

Indirect Access Read:
Setting this allows generation of a read strobe to the selected register 
block upon setting of the IND_ACC_ADDR register. In auto-increment mode, 
read strobes are also asserted following a read of the IND_ACC_DATA 
register. This function is only required for blocks that need to 
pre-fetch register data.

In any case, the indirect accesses are only used when configuring the 
TPG. I'm sure this can be optimized, but I question the need to do this 
optimization.

The UB960 driver uses indirect accesses more often. There it might make 
a bit more sense, although, again, I don't really see why it matters in 
practice.

It doesn't sound like a complex optimization, so maybe it wouldn't 
increase the chances of bugs much, but... still. Maybe something for later?

>> +
>> +	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
>> +			block, reg, ret);
>> +		goto out;
>> +	}
>> +
>> +	*val = v;
>> +
>> +out:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = _ub953_select_ind_reg_block(priv, block);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
>> +			block, reg, ret);
>> +		goto out;
>> +	}
>> +
>> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev,
>> +			"Write to IND_ACC_DATA failed when writing %u:%x02x\n: %d\n",
>> +			block, reg, ret);
>> +	}
>> +
>> +out:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub953_write_ind16(struct ub953_data *priv, u8 block, u8 reg, u16 val)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = _ub953_select_ind_reg_block(priv, block);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val >> 8);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg + 1);
>> +	if (ret)
>> +		goto out;
> 
> Does the device auto-increment the address ? If so you could skip this.

Yes. As mentioned above, I can look at this if you think it's relevant, 
but maybe this can be done after the series has been merged?

>> +
>> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val & 0xff);
>> +	if (ret)
>> +		goto out;
>> +
>> +out:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * GPIO chip
>> + */
>> +static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	struct ub953_data *priv = gpiochip_get_data(gc);
>> +	int ret;
>> +	u8 v;
>> +
>> +	ret = ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &v);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (v & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset))
>> +		return GPIO_LINE_DIRECTION_IN;
>> +	else
>> +		return GPIO_LINE_DIRECTION_OUT;
>> +}
>> +
>> +static int ub953_gpio_direction_in(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	struct ub953_data *priv = gpiochip_get_data(gc);
>> +
>> +	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
>> +				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
>> +					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
> 
> Weird indentation.

It's clang-format, and I think it makes sense to indent a line after |, 
to separate the parameters to the function.

>> +				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset));
>> +}
>> +
>> +static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
>> +				    int value)
>> +{
>> +	struct ub953_data *priv = gpiochip_get_data(gc);
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
>> +				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
>> +				 value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
>> +					 0);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
>> +				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
>> +					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
>> +				  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset));
>> +}
>> +
>> +static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	struct ub953_data *priv = gpiochip_get_data(gc);
>> +	int ret;
>> +	u8 v;
>> +
>> +	ret = ub953_read(priv, UB953_REG_GPIO_PIN_STS, &v);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS(offset));
>> +}
>> +
>> +static void ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
>> +{
>> +	struct ub953_data *priv = gpiochip_get_data(gc);
>> +
>> +	regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
>> +			   UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
>> +			   value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
>> +				   0);
>> +}
>> +
>> +static int ub953_gpio_of_xlate(struct gpio_chip *gc,
>> +			       const struct of_phandle_args *gpiospec,
>> +			       u32 *flags)
>> +{
>> +	if (flags)
>> +		*flags = gpiospec->args[1];
>> +
>> +	return gpiospec->args[0];
>> +}
>> +
>> +static int ub953_gpiochip_probe(struct ub953_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct gpio_chip *gc = &priv->gpio_chip;
>> +	int ret;
>> +
>> +	/* Set all GPIOs to local input mode */
>> +	ub953_write(priv, UB953_REG_LOCAL_GPIO_DATA, 0);
>> +	ub953_write(priv, UB953_REG_GPIO_INPUT_CTRL, 0xf);
>> +
>> +	gc->label = dev_name(dev);
>> +	gc->parent = dev;
>> +	gc->owner = THIS_MODULE;
>> +	gc->base = -1;
>> +	gc->can_sleep = true;
>> +	gc->ngpio = UB953_NUM_GPIOS;
>> +	gc->get_direction = ub953_gpio_get_direction;
>> +	gc->direction_input = ub953_gpio_direction_in;
>> +	gc->direction_output = ub953_gpio_direction_out;
>> +	gc->get = ub953_gpio_get;
>> +	gc->set = ub953_gpio_set;
>> +	gc->of_xlate = ub953_gpio_of_xlate;
>> +	gc->of_gpio_n_cells = 2;
>> +
>> +	ret = gpiochip_add_data(gc, priv);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to add GPIOs: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub953_gpiochip_remove(struct ub953_data *priv)
>> +{
>> +	gpiochip_remove(&priv->gpio_chip);
>> +}
>> +
>> +/*
>> + * V4L2
>> + */
>> +
>> +static int _ub953_set_routing(struct v4l2_subdev *sd,
>> +			      struct v4l2_subdev_state *state,
>> +			      struct v4l2_subdev_krouting *routing)
>> +{
>> +	static const struct v4l2_mbus_framefmt format = {
>> +		.width = 640,
>> +		.height = 480,
>> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
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
>> +		return -EINVAL;
>> +
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
>> +static int ub953_set_routing(struct v4l2_subdev *sd,
>> +			     struct v4l2_subdev_state *state,
>> +			     enum v4l2_subdev_format_whence which,
>> +			     struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct ub953_data *priv = sd_to_ub953(sd);
>> +
>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_streams)
>> +		return -EBUSY;
>> +
>> +	return _ub953_set_routing(sd, state, routing);
>> +}
>> +
>> +static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>> +				struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct ub953_data *priv = sd_to_ub953(sd);
>> +	const struct v4l2_subdev_krouting *routing;
>> +	struct v4l2_mbus_frame_desc source_fd;
>> +	struct v4l2_subdev_route *route;
>> +	struct v4l2_subdev_state *state;
>> +	int ret;
>> +
>> +	if (pad != UB953_PAD_SOURCE)
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
>> +			       priv->source_sd_pad, &source_fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	memset(fd, 0, sizeof(*fd));
>> +
>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +
>> +	routing = &state->routing;
>> +
>> +	for_each_active_route(routing, route) {
> 
> I'd write
> 
> 	for_each_active_route(&state->routing, route) {
> 
> and drop the routing local variable.

Ok.

>> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
>> +		unsigned int i;
>> +
>> +		if (route->source_pad != pad)
>> +			continue;
>> +
>> +		for (i = 0; i < source_fd.num_entries; ++i) {
>> +			if (source_fd.entry[i].stream == route->sink_stream) {
>> +				source_entry = &source_fd.entry[i];
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!source_entry) {
>> +			dev_err(&priv->client->dev,
>> +				"Failed to find stream from source frame desc\n");
>> +			ret = -EPIPE;
>> +			goto out;
>> +		}
>> +
>> +		fd->entry[fd->num_entries].stream = route->source_stream;
>> +		fd->entry[fd->num_entries].flags = source_entry->flags;
>> +		fd->entry[fd->num_entries].length = source_entry->length;
>> +		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
>> +		fd->entry[fd->num_entries].bus.csi2.vc =
>> +			source_entry->bus.csi2.vc;
>> +		fd->entry[fd->num_entries].bus.csi2.dt =
>> +			source_entry->bus.csi2.dt;
>> +
>> +		fd->num_entries++;
>> +	}
>> +
>> +out:
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ub953_set_fmt(struct v4l2_subdev *sd,
>> +			 struct v4l2_subdev_state *state,
>> +			 struct v4l2_subdev_format *format)
>> +{
>> +	struct ub953_data *priv = sd_to_ub953(sd);
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
>> +	    priv->enabled_source_streams)
>> +		return -EBUSY;
>> +
>> +	/* No transcoding, source and sink formats must match. */
>> +	if (format->pad == UB953_PAD_SOURCE)
>> +		return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +	/* Set sink format */
>> +	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
>> +						  format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	*fmt = format->format;
>> +
>> +	/* Propagate to source format */
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
>> +static int ub953_init_cfg(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_subdev_route routes[] = {
>> +		{
>> +			.sink_pad = UB953_PAD_SINK,
>> +			.sink_stream = 0,
>> +			.source_pad = UB953_PAD_SOURCE,
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
>> +	return _ub953_set_routing(sd, state, &routing);
>> +}
>> +
>> +static int ub953_log_status(struct v4l2_subdev *sd)
>> +{
>> +	struct ub953_data *priv = sd_to_ub953(sd);
>> +	struct device *dev = &priv->client->dev;
>> +	u8 v = 0, v1 = 0, v2 = 0;
>> +	unsigned int i;
>> +	char id[7];
>> +	u8 gpio_local_data;
>> +	u8 gpio_input_ctrl;
>> +	u8 gpio_pin_sts;
>> +
>> +	for (i = 0; i < 6; ++i)
>> +		ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i]);
>> +	id[6] = 0;
>> +
>> +	dev_info(dev, "ID '%s'\n", id);
>> +
>> +	ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
>> +	dev_info(dev, "GENERAL_STATUS %#02x\n", v);
>> +
>> +	ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1);
>> +	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
>> +	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
>> +
>> +	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
>> +	dev_info(dev, "CSI error count %u\n", v);
>> +
>> +	ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v);
>> +	dev_info(dev, "CSI_ERR_STATUS %#02x\n", v);
>> +
>> +	ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v);
>> +	dev_info(dev, "CSI_ERR_DLANE01 %#02x\n", v);
>> +
>> +	ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v);
>> +	dev_info(dev, "CSI_ERR_DLANE23 %#02x\n", v);
>> +
>> +	ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v);
>> +	dev_info(dev, "CSI_ERR_CLK_LANE %#02x\n", v);
>> +
>> +	ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v);
>> +	dev_info(dev, "CSI packet header VC %u ID %u\n", v >> 6, v & 0x3f);
>> +
>> +	ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1);
>> +	ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2);
>> +	dev_info(dev, "CSI packet header WC %u\n", (v2 << 8) | v1);
>> +
>> +	ub953_read(priv, UB953_REG_CSI_ECC, &v);
>> +	dev_info(dev, "CSI ECC %#02x\n", v);
>> +
>> +	ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data);
>> +	ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl);
>> +	ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts);
>> +
>> +	for (i = 0; i < UB953_NUM_GPIOS; ++i) {
>> +		dev_info(dev,
>> +			 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
>> +			 i,
>> +			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(i)),
>> +			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(i)),
>> +			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_OUT_EN(i)),
>> +			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(i)),
>> +			 !!(gpio_pin_sts & UB953_REG_GPIO_PIN_STS_GPIO_STS(i)));
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub953_enable_streams(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *state, u32 pad,
>> +				u64 streams_mask)
>> +{
>> +	struct ub953_data *priv = sd_to_ub953(sd);
>> +	u64 sink_streams;
>> +	int ret;
>> +
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
>> +						       UB953_PAD_SINK,
>> +						       &streams_mask);
>> +
>> +	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
>> +					 sink_streams);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->enabled_source_streams |= streams_mask;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub953_disable_streams(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_state *state, u32 pad,
>> +				 u64 streams_mask)
>> +{
>> +	struct ub953_data *priv = sd_to_ub953(sd);
>> +	u64 sink_streams;
>> +	int ret;
>> +
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
>> +						       UB953_PAD_SINK,
>> +						       &streams_mask);
>> +
>> +	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
>> +					  sink_streams);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->enabled_source_streams &= ~streams_mask;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
>> +	.enable_streams = ub953_enable_streams,
>> +	.disable_streams = ub953_disable_streams,
>> +	.set_routing = ub953_set_routing,
>> +	.get_frame_desc = ub953_get_frame_desc,
>> +	.get_fmt = v4l2_subdev_get_fmt,
>> +	.set_fmt = ub953_set_fmt,
>> +	.init_cfg = ub953_init_cfg,
>> +};
>> +
>> +static const struct v4l2_subdev_core_ops ub953_subdev_core_ops = {
>> +	.log_status = ub953_log_status,
>> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>> +};
>> +
>> +static const struct v4l2_subdev_ops ub953_subdev_ops = {
>> +	.core = &ub953_subdev_core_ops,
>> +	.pad = &ub953_pad_ops,
>> +};
>> +
>> +static const struct media_entity_operations ub953_entity_ops = {
>> +	.link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +enum {
>> +	TEST_PATTERN_DISABLED = 0,
>> +	TEST_PATTERN_V_COLOR_BARS_1,
>> +	TEST_PATTERN_V_COLOR_BARS_2,
>> +	TEST_PATTERN_V_COLOR_BARS_4,
>> +	TEST_PATTERN_V_COLOR_BARS_8,
>> +};
>> +
>> +static const char *const ub953_tpg_qmenu[] = {
>> +	"Disabled",
>> +	"1 vertical color bar",
>> +	"2 vertical color bars",
>> +	"4 vertical color bars",
>> +	"8 vertical color bars",
>> +};
>> +
>> +static int ub953_enable_tpg(struct ub953_data *priv, int tpg_num)
>> +{
>> +	struct v4l2_subdev *sd = &priv->sd;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	u8 vbp, vfp;
>> +	u16 blank_lines;
>> +	u16 width;
>> +	u16 height;
>> +
>> +	u16 bytespp = 2; /* For MEDIA_BUS_FMT_UYVY8_1X16 */
>> +	u8 cbars_idx = tpg_num - TEST_PATTERN_V_COLOR_BARS_1;
>> +	u8 num_cbars = 1 << cbars_idx;
>> +
>> +	u16 line_size; /* Line size [bytes] */
>> +	u16 bar_size; /* cbar size [bytes] */
>> +	u16 act_lpf; /* active lines/frame */
>> +	u16 tot_lpf; /* tot lines/frame */
>> +	u16 line_pd; /* Line period in 10-ns units */
>> +
>> +	u16 fps = 30;
>> +
>> +	vbp = 33;
>> +	vfp = 10;
>> +	blank_lines = vbp + vfp + 2; /* total blanking lines */
>> +
>> +	state = v4l2_subdev_get_locked_active_state(sd);
>> +
>> +	if (state->routing.num_routes != 1)
>> +		return -EINVAL;
>> +
>> +	fmt = v4l2_subdev_state_get_stream_format(state, UB953_PAD_SOURCE, 0);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	if (fmt->code != MEDIA_BUS_FMT_UYVY8_1X16)
>> +		return -EINVAL;
>> +
>> +	width = fmt->width;
>> +	height = fmt->height;
>> +
>> +	line_size = width * bytespp;
>> +	bar_size = line_size / num_cbars;
>> +	act_lpf = height;
>> +	tot_lpf = act_lpf + blank_lines;
>> +	line_pd = 100000000 / fps / tot_lpf;
>> +
>> +	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
>> +			UB953_IND_PGEN_CTL_PGEN_ENABLE);
>> +
>> +	/* YUV422 8bit: 2 bytes/block, CSI-2 data type 0x1e */
>> +	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CFG,
>> +			cbars_idx << 4 | 0x2);
>> +	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CSI_DI,
>> +			0x1e);
>> +
>> +	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
>> +			  UB953_IND_PGEN_LINE_SIZE1, line_size);
>> +	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
>> +			  UB953_IND_PGEN_BAR_SIZE1, bar_size);
>> +	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
>> +			  UB953_IND_PGEN_ACT_LPF1, act_lpf);
>> +	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
>> +			  UB953_IND_PGEN_TOT_LPF1, tot_lpf);
>> +	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
>> +			  UB953_IND_PGEN_LINE_PD1, line_pd);
>> +	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VBP,
>> +			vbp);
>> +	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VFP,
>> +			vfp);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ub953_disable_tpg(struct ub953_data *priv)
>> +{
>> +	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
>> +			0x0);
>> +}
>> +
>> +static int ub953_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ub953_data *priv =
>> +		container_of(ctrl->handler, struct ub953_data, ctrl_handler);
>> +	int ret = 0;
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEST_PATTERN:
>> +		if (ctrl->val == 0)
>> +			ub953_disable_tpg(priv);
>> +		else
>> +			ret = ub953_enable_tpg(priv, ctrl->val);
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops ub953_ctrl_ops = {
>> +	.s_ctrl = ub953_s_ctrl,
>> +};
>> +
>> +static int ub953_notify_bound(struct v4l2_async_notifier *notifier,
>> +			      struct v4l2_subdev *source_subdev,
>> +			      struct v4l2_async_subdev *asd)
>> +{
>> +	struct ub953_data *priv = sd_to_ub953(notifier->sd);
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
>> +					  source_subdev->fwnode,
>> +					  MEDIA_PAD_FL_SOURCE);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to find pad for %s\n",
>> +			source_subdev->name);
>> +		return ret;
>> +	}
>> +
>> +	priv->source_sd = source_subdev;
>> +	priv->source_sd_pad = ret;
>> +
>> +	ret = media_create_pad_link(&source_subdev->entity, priv->source_sd_pad,
>> +				    &priv->sd.entity, 0,
>> +				    MEDIA_LNK_FL_ENABLED |
>> +					    MEDIA_LNK_FL_IMMUTABLE);
>> +	if (ret) {
>> +		dev_err(dev, "Unable to link %s:%u -> %s:0\n",
>> +			source_subdev->name, priv->source_sd_pad,
>> +			priv->sd.name);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations ub953_notify_ops = {
>> +	.bound = ub953_notify_bound,
>> +};
>> +
>> +static int ub953_v4l2_notifier_register(struct ub953_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct v4l2_async_subdev *asd;
>> +	struct fwnode_handle *ep_fwnode;
>> +	int ret;
>> +
>> +	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
>> +						    UB953_PAD_SINK, 0, 0);
>> +	if (!ep_fwnode) {
>> +		dev_err(dev, "No graph endpoint\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	v4l2_async_nf_init(&priv->notifier);
>> +
>> +	asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier, ep_fwnode,
>> +					      struct v4l2_async_subdev);
>> +
>> +	fwnode_handle_put(ep_fwnode);
>> +
>> +	if (IS_ERR(asd)) {
>> +		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
>> +		v4l2_async_nf_cleanup(&priv->notifier);
>> +		return PTR_ERR(asd);
>> +	}
>> +
>> +	priv->notifier.ops = &ub953_notify_ops;
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
>> +static void ub953_v4l2_notifier_unregister(struct ub953_data *priv)
>> +{
>> +	v4l2_async_nf_unregister(&priv->notifier);
>> +	v4l2_async_nf_cleanup(&priv->notifier);
>> +}
>> +
>> +/*
>> + * Probing
>> + */
>> +
>> +static int ub953_i2c_master_init(struct ub953_data *priv)
>> +{
>> +	/* i2c fast mode */
>> +	u32 ref = 26250000;
>> +	u32 scl_high = 915; /* ns */
>> +	u32 scl_low = 1641; /* ns */
>> +	int ret;
>> +
>> +	scl_high = div64_u64((u64)scl_high * ref, 1000000000) - 5;
>> +	scl_low = div64_u64((u64)scl_low * ref, 1000000000) - 5;
>> +
>> +	ret = ub953_write(priv, UB953_REG_SCL_HIGH_TIME, scl_high);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub953_write(priv, UB953_REG_SCL_LOW_TIME, scl_low);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 ub953_get_fc_rate(struct ub953_data *priv)
>> +{
>> +	if (priv->mode != UB953_MODE_SYNC) {
>> +		/* Not supported */
>> +		return 0;
>> +	}
>> +
>> +	if (priv->hw_data->is_ub971)
>> +		return priv->plat_data->bc_rate * 160ull;
>> +	else
>> +		return priv->plat_data->bc_rate / 2 * 160ull;
>> +}
>> +
>> +static unsigned long ub953_calc_clkout_ub953(struct ub953_data *priv,
>> +					     unsigned long target, u64 fc,
>> +					     u8 *hs_div, u8 *m, u8 *n)
>> +{
>> +	/*
>> +	 * We always use 4 as a pre-divider (HS_CLK_DIV = 2).
>> +	 *
>> +	 * According to the datasheet:
>> +	 * - "HS_CLK_DIV typically should be set to either 16, 8, or 4 (default)."
>> +	 * - "if it is not possible to have an integer ratio of N/M, it is best to
>> +	 *    select a smaller value for HS_CLK_DIV.
>> +	 *
>> +	 * For above reasons the default HS_CLK_DIV seems the best in the average
>> +	 * case. Use always that value to keep the code simple.
>> +	 */
>> +	static const unsigned long hs_clk_div = 4;
>> +
>> +	u64 fc_divided;
>> +	unsigned long mul, div;
>> +	unsigned long res;
>> +
>> +	/* clkout = fc / hs_clk_div * m / n */
>> +
>> +	fc_divided = div_u64(fc, hs_clk_div);
>> +
>> +	rational_best_approximation(target, fc_divided, (1 << 5) - 1,
>> +				    (1 << 8) - 1, &mul, &div);
>> +
>> +	res = div_u64(fc_divided * mul, div);
>> +
>> +	*hs_div = hs_clk_div;
>> +	*m = mul;
>> +	*n = div;
>> +
>> +	return res;
>> +}
>> +
>> +static unsigned long ub953_calc_clkout_ub971(struct ub953_data *priv,
>> +					     unsigned long target, u64 fc,
>> +					     u8 *m, u8 *n)
>> +{
>> +	u64 fc_divided;
>> +	unsigned long mul, div;
>> +	unsigned long res;
>> +
>> +	/* clkout = fc * m / (8 * n) */
>> +
>> +	fc_divided = div_u64(fc, 8);
>> +
>> +	rational_best_approximation(target, fc_divided, (1 << 5) - 1,
>> +				    (1 << 8) - 1, &mul, &div);
>> +
>> +	res = div_u64(fc_divided * mul, div);
>> +
>> +	*m = mul;
>> +	*n = div;
>> +
>> +	return res;
>> +}
>> +
>> +static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
>> +					      unsigned long parent_rate)
>> +{
>> +	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
>> +	struct device *dev = &priv->client->dev;
>> +	u8 ctrl0, ctrl1;
>> +	u32 mul, div;
>> +	u64 fc_rate;
>> +	u32 hs_clk_div;
>> +	u64 rate;
>> +	int ret;
>> +
>> +	ret = ub953_read(priv, UB953_REG_CLKOUT_CTRL0, &ctrl0);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to read CLKOUT_CTRL0: %d\n", ret);
>> +		return 0;
>> +	}
>> +
>> +	ret = ub953_read(priv, UB953_REG_CLKOUT_CTRL1, &ctrl1);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to read CLKOUT_CTRL1: %d\n", ret);
>> +		return 0;
>> +	}
>> +
>> +	fc_rate = ub953_get_fc_rate(priv);
>> +
>> +	if (priv->hw_data->is_ub971) {
>> +		mul = ctrl0 & 0x1f;
>> +		div = ctrl1;
>> +
>> +		if (div == 0)
>> +			return 0;
>> +
>> +		rate = div_u64(fc_rate * mul, 8 * div);
>> +
>> +		dev_dbg(dev, "clkout: fc rate %llu, mul %u, div %u = %llu\n",
>> +			fc_rate, mul, div, rate);
>> +	} else {
>> +		mul = ctrl0 & 0x1f;
>> +		hs_clk_div = 1 << (ctrl0 >> 5);
>> +		div = ctrl1;
>> +
>> +		if (div == 0)
>> +			return 0;
>> +
>> +		rate = div_u64(div_u64(fc_rate, hs_clk_div) * mul, div);
>> +
>> +		dev_dbg(dev,
>> +			"clkout: fc rate %llu, hs_clk_div %u, mul %u, div %u = %llu\n",
>> +			fc_rate, hs_clk_div, mul, div, rate);
>> +	}
>> +
>> +	return rate;
>> +}
>> +
>> +static long ub953_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
>> +				    unsigned long *parent_rate)
>> +{
>> +	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned long res;
>> +	u64 fc_rate;
>> +	u8 hs_div, m, n;
>> +
>> +	fc_rate = ub953_get_fc_rate(priv);
>> +
>> +	if (priv->hw_data->is_ub971) {
>> +		res = ub953_calc_clkout_ub971(priv, rate, fc_rate, &m, &n);
>> +
>> +		dev_dbg(dev, "%s %llu * %u / (8 * %u) = %lu (requested %lu)",
>> +			__func__, fc_rate, m, n, res, rate);
>> +	} else {
>> +		res = ub953_calc_clkout_ub953(priv, rate, fc_rate, &hs_div, &m, &n);
>> +
>> +		dev_dbg(dev, "%s %llu / %u * %u / %u = %lu (requested %lu)",
>> +			__func__, fc_rate, hs_div, m, n, res, rate);
>> +	}
>> +
>> +	return res;
>> +}
>> +
>> +static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
>> +				 unsigned long parent_rate)
>> +{
>> +	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
>> +	u64 fc_rate;
>> +	u8 hs_div, m, n;
>> +	unsigned long res;
>> +
>> +	fc_rate = ub953_get_fc_rate(priv);
>> +
>> +	if (priv->hw_data->is_ub971) {
>> +		res = ub953_calc_clkout_ub971(priv, rate, fc_rate, &m, &n);
>> +
>> +		ub953_write(priv, UB953_REG_CLKOUT_CTRL0, m);
>> +		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
>> +	} else {
>> +		res = ub953_calc_clkout_ub953(priv, rate, fc_rate, &hs_div, &m, &n);
>> +
>> +		ub953_write(priv, UB953_REG_CLKOUT_CTRL0, (__ffs(hs_div) << 5) | m);
>> +		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
>> +	}
>> +
>> +	dev_dbg(&priv->client->dev, "%s %lu (requested %lu)\n", __func__, res,
>> +		rate);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct clk_ops ub953_clkout_ops = {
>> +	.recalc_rate	= ub953_clkout_recalc_rate,
>> +	.round_rate	= ub953_clkout_round_rate,
>> +	.set_rate	= ub953_clkout_set_rate,
>> +};
>> +
>> +static void ub953_init_clkout_ub953(struct ub953_data *priv)
>> +{
>> +	u64 fc_rate;
>> +	u8 hs_div, m, n;
>> +
>> +	fc_rate = ub953_get_fc_rate(priv);
>> +
>> +	ub953_calc_clkout_ub953(priv, 25000000, fc_rate, &hs_div, &m, &n);
>> +
>> +	ub953_write(priv, UB953_REG_CLKOUT_CTRL0, (__ffs(hs_div) << 5) | m);
>> +	ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
>> +}
>> +
>> +static void ub953_init_clkout_ub971(struct ub953_data *priv)
>> +{
>> +	u64 fc_rate;
>> +	u8 m, n;
>> +
>> +	fc_rate = ub953_get_fc_rate(priv);
>> +
>> +	ub953_calc_clkout_ub971(priv, 25000000, fc_rate, &m, &n);
>> +
>> +	ub953_write(priv, UB953_REG_CLKOUT_CTRL0, m);
>> +	ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
>> +}
>> +
>> +static int ub953_register_clkout(struct ub953_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	const struct clk_init_data init = {
>> +		.name = kasprintf(GFP_KERNEL, "ds90%s.%s.clk_out",
>> +				  priv->hw_data->model, dev_name(dev)),
>> +		.ops = &ub953_clkout_ops,
>> +	};
>> +	int ret;
>> +
>> +	if (!init.name)
>> +		return -ENOMEM;
>> +
>> +	/* Initialize clkout to 25MHz by default */
>> +	if (priv->hw_data->is_ub971)
>> +		ub953_init_clkout_ub971(priv);
>> +	else
>> +		ub953_init_clkout_ub953(priv);
>> +
>> +	priv->clkout_clk_hw.init = &init;
>> +
>> +	ret = devm_clk_hw_register(dev, &priv->clkout_clk_hw);
>> +	kfree(init.name);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Cannot register clock HW\n");
>> +
>> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
>> +					  &priv->clkout_clk_hw);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Cannot add OF clock provider\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub953_add_i2c_adapter(struct ub953_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct fwnode_handle *i2c_handle;
>> +	int ret;
>> +
>> +	i2c_handle = device_get_named_child_node(dev, "i2c");
>> +	if (!i2c_handle)
>> +		return 0;
>> +
>> +	ret = i2c_atr_add_adapter(priv->plat_data->atr, priv->plat_data->port,
>> +				  i2c_handle);
>> +
>> +	fwnode_handle_put(i2c_handle);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct regmap_config ub953_regmap_config = {
>> +	.name = "ds90ub953",
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.reg_format_endian = REGMAP_ENDIAN_DEFAULT,
>> +	.val_format_endian = REGMAP_ENDIAN_DEFAULT,
>> +};
>> +
>> +static int ub953_parse_dt(struct ub953_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct fwnode_handle *ep_fwnode;
>> +	int ret;
>> +
>> +	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
>> +						    UB953_PAD_SINK, 0, 0);
>> +	if (!ep_fwnode) {
>> +		dev_err(dev, "OF: no endpoint\n");
> 
> dev_err_probe() ? Same below.

Ok.

>> +		return -ENOENT;
>> +	}
>> +
>> +	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
>> +
>> +	fwnode_handle_put(ep_fwnode);
>> +
>> +	if (ret <= 0) {
>> +		dev_err(dev, "failed to parse property 'data-lanes': %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	if (ret != 1 && ret != 2 && ret != 4) {
>> +		dev_err(dev, "bad number of data-lanes: %d\n", ret);
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv->num_data_lanes = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub953_hw_init(struct ub953_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	bool mode_override;
>> +	int ret;
>> +	u8 v;
>> +
>> +	ret = ub953_read(priv, UB953_REG_MODE_SEL, &v);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!(v & UB953_REG_MODE_SEL_MODE_DONE))
>> +		return dev_err_probe(dev, -EIO, "Mode value not stabilized\n");
>> +
>> +	mode_override = v & UB953_REG_MODE_SEL_MODE_OVERRIDE;
>> +
>> +	switch (v & UB953_REG_MODE_SEL_MODE_MASK) {
>> +	case 0:
>> +		priv->mode = UB953_MODE_SYNC;
>> +		break;
>> +	case 2:
>> +		priv->mode = UB953_MODE_NONSYNC_EXT;
>> +		break;
>> +	case 3:
>> +		priv->mode = UB953_MODE_NONSYNC_INT;
>> +		break;
>> +	case 5:
>> +		priv->mode = UB953_MODE_DVP;
>> +		break;
>> +	default:
>> +		return dev_err_probe(dev, -EIO,
>> +				     "Illegal mode in mode register\n");
> 
> s/Illegal/Invalid/
> 
> Nobody will come to arrest you if this happens :-)

You've commented on this earlier too. I think "illegal" is commonly 
used, like "illegal instruction" etc. But I can change it to make you 
happy =).

>> +	}
>> +
>> +	dev_dbg(dev, "mode from %s: %#x\n", mode_override ? "reg" : "strap",
>> +		priv->mode);
>> +
>> +	if (priv->mode != UB953_MODE_SYNC)
>> +		return dev_err_probe(dev, -ENODEV,
>> +				     "Only synchronous mode supported\n");
>> +
>> +	ret = ub953_read(priv, UB953_REG_REV_MASK_ID, &v);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to read revision");
>> +
>> +	dev_info(dev, "Found %s rev/mask %#04x\n", priv->hw_data->model, v);
>> +
>> +	ret = ub953_read(priv, UB953_REG_GENERAL_CFG, &v);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(dev, "i2c strap setting %s V\n",
>> +		(v & UB953_REG_GENERAL_CFG_I2C_STRAP_MODE) ? "1.8" : "3.3");
>> +
>> +	ret = ub953_i2c_master_init(priv);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "i2c init failed\n");
>> +
>> +	ub953_write(priv, UB953_REG_GENERAL_CFG,
>> +		    UB953_REG_GENERAL_CFG_CONT_CLK |
>> +		    ((priv->num_data_lanes - 1) << UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT) |
>> +		    UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ub953_subdev_init(struct ub953_data *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub953_subdev_ops);
>> +
>> +	v4l2_ctrl_handler_init(&priv->ctrl_handler,
>> +			       ARRAY_SIZE(ub953_tpg_qmenu) - 1);
> 
> The last argument to v4l2_ctrl_handler_init() should be the number of
> controls you will create, so 1.

Hmm, right... I have the same in ub960.

>> +	priv->sd.ctrl_handler = &priv->ctrl_handler;
>> +
>> +	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub953_ctrl_ops,
>> +				     V4L2_CID_TEST_PATTERN,
>> +				     ARRAY_SIZE(ub953_tpg_qmenu) - 1, 0, 0,
>> +				     ub953_tpg_qmenu);
>> +
>> +	if (priv->ctrl_handler.error)
>> +		return dev_err_probe(dev, priv->ctrl_handler.error,
>> +				     "Failed to set up v4l2 controls\n");
> 
> You need to goto err_remove_ctrls.

Indeed.

>> +
>> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>> +			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
>> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +	priv->sd.entity.ops = &ub953_entity_ops;
>> +
>> +	priv->pads[0].flags = MEDIA_PAD_FL_SINK;
>> +	priv->pads[1].flags = MEDIA_PAD_FL_SOURCE;
>> +
>> +	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "Failed to init pads\n");
>> +		goto err_remove_ctrls;
>> +	}
>> +
>> +	priv->sd.fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
>> +							  UB953_PAD_SOURCE, 0,
>> +							  0);
>> +	if (!priv->sd.fwnode) {
>> +		ret = -ENODEV;
>> +		dev_err_probe(dev, ret, "Missing TX endpoint\n");
>> +		goto err_entity_cleanup;
>> +	}
>> +
>> +	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
>> +
>> +	ret = v4l2_subdev_init_finalize(&priv->sd);
>> +	if (ret)
>> +		goto err_entity_cleanup;
> 
> You're leaking prev->sd.fwnode. Same in ub953_subdev_uninit().

Yep.

>> +
>> +	ret = ub953_v4l2_notifier_register(priv);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret,
>> +			      "v4l2 subdev notifier register failed\n");
>> +		goto err_free_state;
>> +	}
>> +
>> +	ret = v4l2_async_register_subdev(&priv->sd);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "v4l2_async_register_subdev error\n");
>> +		goto err_unreg_notif;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_unreg_notif:
>> +	ub953_v4l2_notifier_unregister(priv);
>> +err_free_state:
>> +	v4l2_subdev_cleanup(&priv->sd);
>> +err_entity_cleanup:
>> +	media_entity_cleanup(&priv->sd.entity);
>> +err_remove_ctrls:
>> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>> +
>> +	return ret;
>> +}
>> +
>> +static void ub953_subdev_uninit(struct ub953_data *priv)
>> +{
>> +	v4l2_async_unregister_subdev(&priv->sd);
>> +	ub953_v4l2_notifier_unregister(priv);
>> +	v4l2_subdev_cleanup(&priv->sd);
>> +	media_entity_cleanup(&priv->sd.entity);
>> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>> +}
>> +
>> +static int ub953_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct ub953_data *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->client = client;
>> +
>> +	priv->hw_data = of_device_get_match_data(dev);
>> +	if (!priv->hw_data)
>> +		return -ENODEV;
> 
> Can this happen ?

I don't know. Probably not.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

