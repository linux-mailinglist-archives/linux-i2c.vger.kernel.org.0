Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F419463AA52
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 15:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbiK1OCt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 09:02:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbiK1OCs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 09:02:48 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211EFD70;
        Mon, 28 Nov 2022 06:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669644167; x=1701180167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v2DtpUtk4NOuO0Il9gSGoNZtPDWVsv3sJrE6yFYzkO4=;
  b=OR6Jr/9IDcsVbeDUDg5fkXzXbufDGFBaHQCYbiyMO0XuQFUuGtynFseQ
   UJqeE+qo5Ito3wR5I9h22yAFJeR5s+TFX8F65aqmZtUB5OypcZL3fJdDR
   SzE7LhSA6W1d3TI1uC+jHm33G6LVNpddeQp3ZStF8nD53JhY+OY+mY8Vt
   KRU7rYMZVAFO7/7kebPbLrZTHhCrvDSHZ6a2fB9mNhwZKIn4BzPD77qm4
   GMPcRcpy0hb9rRW+YCAtbX+iNWd+4H3mBjcNj9V9YKHUXuEUiN/nihI/W
   vxZ6Kg//RcTrfE2OfLlUic8yB5oaQsNB6W5qWlgzLgBGkXup8aJRMzBoO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="401128019"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="401128019"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 06:02:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="593878827"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="593878827"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 28 Nov 2022 06:02:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ozeiM-001AEF-1E;
        Mon, 28 Nov 2022 16:02:30 +0200
Date:   Mon, 28 Nov 2022 16:02:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: loongson: add bus driver for the loongson
 i2c controller
Message-ID: <Y4S/dh9lztpOHxkD@smile.fi.intel.com>
References: <20221128130025.23184-1-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128130025.23184-1-zhuyinbo@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 28, 2022 at 09:00:24PM +0800, Yinbo Zhu wrote:
> This bus driver supports the Loongson i2c hardware controller in the
> Loongson platforms and supports to use DTS and ACPI framework to
> register i2c adapter device resources.
> 
> The Loongson i2c controller supports operating frequencty is 50MHZ
> and supports the maximum transmission rate is 400kbps.

...

> +static inline u8 i2c_readb(struct loongson_i2c_dev *dev, u8 offset)
> +{
> +	return readb(dev->base + offset);
> +}
> +
> +static inline void i2c_writeb(struct loongson_i2c_dev *dev, u8 val,
> +			      u8 offset)

For this you may turn parameters to be in more intuitive order, i.e.

static inline void i2c_writeb(struct loongson_i2c_dev *dev, u8 offset, u8 val)

(Also, why not on one line? Even with strict 80 it still fits).

> +{
> +	writeb(val, dev->base + offset);
> +}

...

> +static int loongson_i2c_start(struct loongson_i2c_dev *dev, int dev_addr,
> +			      int flags)
> +{
> +	int ret;
> +	unsigned long time_left;
> +	int retry = 5;

> +	unsigned char addr = LOONGSON_I2C_ADDR_A7(dev_addr) << 1;
> +
> +	addr |= (flags & I2C_M_RD) ? 1 : 0;

Why not i2c_8bit_addr_from_msg()?

> +	do {

> +		mdelay(1);

Needs an explanation why.

> +		i2c_writeb(dev, addr, LOONGSON_I2C_TXR_REG);
> +		i2c_writeb(dev, (CR_START | CR_WRITE | CR_IACK),
> +			   LOONGSON_I2C_CR_REG);
> +		time_left = wait_for_completion_timeout(&dev->cmd_complete,
> +							dev->adapter.timeout);
> +		if (!time_left)
> +			return -ETIMEDOUT;
> +
> +		if (i2c_readb(dev, LOONGSON_I2C_SR_REG) & SR_NOACK) {
> +			ret = loongson_i2c_stop(dev);
> +			if (ret)
> +				return ret;
> +		} else
> +			break;
> +	} while (retry--);
> +
> +	return 0;
> +}

...

> +	i2c_writeb(dev, 0xa0, LOONGSON_I2C_CTR_REG);

Magic number.

...

> +	if (!dev->speed_hz) {


Why not positive conditional?

> +		prer_val = 0x12c;
> +	} else {
> +		pclk = 50000000;

50 * HZ_PER_MHZ?

> +		prer_val = pclk / (5 * dev->speed_hz) - 1;
> +	}
> +
> +	i2c_writeb(dev, i2c_readb(dev, LOONGSON_I2C_CR_REG) |
> +		   0x01, LOONGSON_I2C_CR_REG);
> +	i2c_writeb(dev, i2c_readb(dev, LOONGSON_I2C_CTR_REG) & ~0x80,
> +		   LOONGSON_I2C_CTR_REG);

> +	i2c_writeb(dev, prer_val & GENMASK(7, 0), LOONGSON_I2C_PRER_LO_REG);
> +	i2c_writeb(dev, (prer_val & GENMASK(15, 8)) >> 8,

Why do you need GENMASK() parts?

> +		   LOONGSON_I2C_PRER_HI_REG);
> +	i2c_writeb(dev, i2c_readb(dev, LOONGSON_I2C_CTR_REG) |
> +		   0xe0, LOONGSON_I2C_CTR_REG);

A lot of magic numbers...

...

> +static int loongson_i2c_read(struct loongson_i2c_dev *dev, unsigned char *buf,
> +			     int count)
> +{
> +	int i;
> +	unsigned long time_left;
> +
> +	for (i = 0; i < count; i++) {

> +		i2c_writeb(dev, (i == count - 1) ?
> +			(CR_READ | CR_IACK | CR_ACK) : (CR_READ | CR_IACK),
> +			LOONGSON_I2C_CR_REG);

With temporary variable this will look better.

	u8 val = CR_READ | CR_IACK;
	...

		i2c_writeb(dev, (i == count - 1) ? val | CR_ACK : val,
			   LOONGSON_I2C_CR_REG);


Also fix wrong indentation.

> +		time_left = wait_for_completion_timeout(&dev->cmd_complete,
> +							dev->adapter.timeout);
> +		if (!time_left)
> +			return -ETIMEDOUT;
> +
> +		buf[i] = i2c_readb(dev, LOONGSON_I2C_RXR_REG);
> +	}
> +
> +	return i;
> +}

...

> +static int loongson_i2c_write(struct loongson_i2c_dev *dev, unsigned char *buf,
> +			      int count)
> +{
> +	int i;
> +	int ret;
> +	unsigned long time_left;
> +
> +	for (i = 0; i < count; i++) {
> +		i2c_writeb(dev, buf[i], LOONGSON_I2C_TXR_REG);
> +		i2c_writeb(dev, CR_WRITE | CR_IACK, LOONGSON_I2C_CR_REG);
> +		time_left = wait_for_completion_timeout(&dev->cmd_complete,
> +							dev->adapter.timeout);
> +		if (!time_left)
> +			return -ETIMEDOUT;
> +
> +		if (i2c_readb(dev, LOONGSON_I2C_SR_REG) & SR_NOACK) {
> +			ret = loongson_i2c_stop(dev);
> +			if (ret)
> +				return ret;
> +			return 0;
> +		}
> +	}
> +
> +	return i;

Can i be not equal to count here?

> +}

...

> +static int loongson_i2c_doxfer(struct loongson_i2c_dev *dev, struct i2c_msg *msgs,
> +			       int num)
> +{
> +	int i, ret;
> +	struct i2c_msg *m = msgs;
> +
> +	for (i = 0; i < num; i++) {
> +		reinit_completion(&dev->cmd_complete);
> +		ret = loongson_i2c_start(dev, m->addr, m->flags);
> +		if (ret)
> +			return ret;
> +
> +		if (m->flags & I2C_M_RD) {
> +			ret = loongson_i2c_read(dev, m->buf, m->len);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (!(m->flags & I2C_M_RD)) {
> +			ret = loongson_i2c_write(dev, m->buf, m->len);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		++m;
> +	}
> +
> +	ret = loongson_i2c_stop(dev);
> +	if (ret)
> +		return ret;
> +
> +	return i;

Can i be not equal to num here?

> +}

...

> +static int loongson_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			     int num)
> +{
> +	int ret;
> +	int retry;
> +	struct loongson_i2c_dev *dev;
> +
> +	dev = i2c_get_adapdata(adap);
> +	for (retry = 0; retry < adap->retries; retry++) {
> +		ret = loongson_i2c_doxfer(dev, msgs, num);
> +		if (ret != -EAGAIN)
> +			return ret;
> +
> +		udelay(100);
> +	}

Why udelay() and not usleep_range() ?
Why so long?

All these at least have to be explained.

> +	return -EREMOTEIO;
> +}

Why not utilizing something from iopoll.h?

...

> +	if (dev->slave_state == LOONGSON_I2C_SLAVE_START)
> +		if (stat & SR_SLAVE_RW)
> +			dev->slave_state =
> +				LOONGSON_I2C_SLAVE_READ_REQUESTED;
> +		else
> +			dev->slave_state =
> +				LOONGSON_I2C_SLAVE_WRITE_REQUESTED;

Even with strict 80 rule, these are fine to be on one line.

I suggest you to go through the code and shrink it by 20-30 LoCs. It seems
feasible taking into account this kind of indentation.

...

> +static irqreturn_t loongson_i2c_isr(int this_irq, void *dev_id)
> +{
> +	unsigned char iflag;
> +	struct loongson_i2c_dev *dev = dev_id;
> +
> +	iflag = i2c_readb(dev, LOONGSON_I2C_SR_REG);

> +	if (iflag & SR_IF) {


Why not using the usual pattern, i.e.

	if (!(...))
		return IRQ_NONE;

?

It seems you ignored some of my comments...
I stopped here, please check what was given against v1 and try again.

-- 
With Best Regards,
Andy Shevchenko


