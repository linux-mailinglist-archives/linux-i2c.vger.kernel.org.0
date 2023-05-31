Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C587717D80
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 13:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjEaLBJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 07:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbjEaLBF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 07:01:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A3712B
        for <linux-i2c@vger.kernel.org>; Wed, 31 May 2023 04:01:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7396A63911
        for <linux-i2c@vger.kernel.org>; Wed, 31 May 2023 11:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B1EC433D2;
        Wed, 31 May 2023 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685530861;
        bh=31+v+iKA1Vars3/7HuTbE0cmr7OcvCbIGJDbKayOcio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ubPXsqsGAVusJcQRV8QKk9ePUAL+PQSntPrCv3yDYZ7RPZLwgddYDz2oLOlHlhbRC
         W65C90TSTGin8QBD/iGvuCJE0TztrLPok7ZruzabeNpJsPl++h0fd+eEJ7mj/LptlK
         qI7C0QHQwzW8tvUP3KkdLtzldk9Oay+G56RXRUQAb6rD+Ifvve7DawDHR9gw5K8uRe
         kW+PTJFnf21XxZBPRGTkp1kQLTHpyDiFBpFEvQ8uIxNaqgCFRO2OLan/hogLQ1Dq5S
         eiBrb9RoFqaVJpZWdXmWHti4z+zPd14h+DSJ8vNWVVXyEnXVh8ps4hp59MbOEVaQKU
         g10WWF8rHVkQA==
Date:   Wed, 31 May 2023 13:00:58 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     jdelvare@suse.com, wsa@kernel.org, linux-i2c@vger.kernel.org,
        cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
Subject: Re: [PATCH v2] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230531110058.n7ubjp2kzlx7tuoc@intel.intel>
References: <20230529073147.12242-1-hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529073147.12242-1-hanshu-oc@zhaoxin.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

On Mon, May 29, 2023 at 03:31:47PM +0800, Hans Hu wrote:
> Add Zhaoxin I2C controller driver. It provides the access to the i2c
> busses, which connects to the touchpad, eeprom, etc.
> 
> Zhaoxin I2C controller have two separate busses, so may accommodate up

/have/has/

> to two I2C adapters. Those adapters are listed in the ACPI namespace
> with the "IIC1D17" HID, and probed by a platform driver.
> 
> The driver works with IRQ mode, and supports basic I2C features. Flags
> I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
> the unsupported access.
> 
> Change since v1:
>   * remove some useless include files and sort the rest.
>   * use mmio bar distinguish host index.
>   * use pci-dev's name and i2c-dev's name rename adapter's name.
>   * remove some debug code, fix some code style issue.
>   Link: https://lore.kernel.org/all/20230504060043.13155-1-hanshu-oc@zhaoxin.com/
> 
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

[...]

> +#define set_byte(r, d)           iowrite8(d, r+IICDATA2IIC)
> +#define get_byte(r)              ioread8(r+IICDATA2CPU)
> +#define is_ready(r)              (ioread8(r+IICSR)&READY)
> +#define is_nack(r)               (ioread8(r+IICSR)&RCV_NACK)
> +#define get_irq_status(r)        ioread8(r+IICISR)
> +#define get_reversion(r)         ioread8(r+IICREV)
> +#define clear_irq_status(r)      iowrite8(IRQ_STS_MASK, r+IICISR)
> +#define set_fifo_byte(r, d)      iowrite8(d, r+IICHTDR)
> +#define get_fifo_byte(r)         ioread8(r+IICHRDR)
> +#define set_fifo_wr_len(r, d)    iowrite8(d, r+IICHTLR)
> +#define set_fifo_rd_len(r, d)    iowrite8(d, r+IICHRLR)
> +#define get_fifo_wr_cnt(r)       ioread8(r+IICHWCNTR)
> +#define get_fifo_rd_cnt(r)       ioread8(r+IICHRCNTR)
> +#define master_regs_reset(r)     iowrite8(MST_RST|0x41, r+IICCR_L)
> +#define set_dynamic_clock(r, d)  iowrite8(d, r+IICMCR)
> +#define get_dynamic_clock(r)     (ioread8(r+IICMCR)&DYCLK_EN)
> +#define stop_write_byte(r)       iowrite8(TX_END|0x41, r+IICCR_L)
> +#define get_fstp_value(r)        ioread8(r+IICTR_FSTP)
> +#define enable_fifo_mode(r)      iowrite8(FIFO_EN, r+IICCR_H)
> +#define enable_byte_mode(r)      iowrite8(0, r+IICCR_H)

I guess checkpatch would give error here, please put some space
between '+'.

[...]

> +static void zxi2c_set_bus_speed(struct zxi2c *i2c)
> +{
> +	u8 i, count;
> +	const u32 *params = NULL;
> +
> +	count = ARRAY_SIZE(speed_params_table);
> +	for (i = 0; i < count; i++) {
> +		if (speed_params_table[i][0] == i2c->speed) {
> +			params = speed_params_table[i];
> +			break;
> +		}
> +	}
> +
> +	iowrite8(params[1], i2c->regs + IICTCR);
> +	if (abs(i2c->fstp - params[2]) > 0x10) {
> +		/* if BIOS setting value far from golden value,
> +		 * use golden value and warn user
> +		 */
> +		dev_warn_once(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
> +				i2c->speed, i2c->fstp, params[2]);
> +		iowrite8(params[2], i2c->regs + IICTR_FSTP);
> +	} else
> +		iowrite8(i2c->fstp, i2c->regs + IICTR_FSTP);

please use checkpatch.pl before sending the patch, you're missing
the brackets here.

> +	iowrite8(CLKSEL_50M, i2c->regs + IICCS);
> +	iowrite8(0xff, i2c->regs + IICTR_SCLTP);
> +
> +	/* for Hs-mode, use 0000 1000 as master code */
> +	if (i2c->speed == I2C_MAX_HIGH_SPEED_MODE_FREQ)
> +		iowrite8(0x08, i2c->regs + IIC_MST_CODE);
> +}

[...]

> +static irqreturn_t zxi2c_irq_handle(int irq, void *dev_id)
> +{
> +	struct zxi2c *i2c = (struct zxi2c *)dev_id;
> +	void __iomem *regs = i2c->regs;
> +	u8 status = get_irq_status(regs);
> +
> +	if ((status & IRQ_STS_MASK) == 0)
> +		return IRQ_NONE;

unlikely?

> +	if (status & IRQ_SCL_TIMEOUT)
> +		dev_warn(i2c->dev, "timeout(HW), ID: 0x%X\n", i2c->addr);
> +
> +	if (status & IRQ_STS_ADDRNACK) {
> +		dev_dbg(i2c->dev, "addr NACK, ID: 0x%X\n", i2c->addr);
> +	} else if (status & IRQ_STS_BYTEEND) {
> +		i2c->byte_left--;
> +		if (!i2c->is_read) {
> +			if (is_nack(regs)) {
> +				status = IRQ_STS_BYTENACK;
> +				i2c->byte_left++;
> +				dev_err(i2c->dev, "data NACK, ID: 0x%X\n",
> +					i2c->addr);
> +			} else if (i2c->byte_left == 0 && i2c->is_last_msg) {
> +				stop_write_byte(regs);
> +			}
> +		}
> +	}
> +
> +	i2c->event = status;
> +	clear_irq_status(regs);
> +	wake_up(&i2c->waitq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int zxi2c_wait_event(struct zxi2c *i2c, u8 event)
> +{
> +	int timeout;
> +
> +	timeout = wait_event_interruptible_timeout(i2c->waitq,
> +			i2c->event != 0,
> +			msecs_to_jiffies(ZXI2C_TIMEOUT));
> +
> +	if (i2c->event & event)
> +		return 0;

is this valid even when "timeout == 0"?

> +	if (timeout == 0) {
> +		dev_err(i2c->dev, "timeout(SW), ID: 0x%X\n", i2c->addr);
> +		/* Clock streching timeout, do recovery */
> +		if (!is_nack(i2c->regs))
> +			dev_err(i2c->dev, "device hang? reset, ID: 0x%X\n",
> +				i2c->addr);
> +
> +		master_regs_reset(i2c->regs);
> +		zxi2c_set_bus_speed(i2c);
> +	}
> +	return -ENODEV;

is ENODEV the right error code? Maybe -EIO?

> +}
> +
> +static int zxi2c_byte_xfer(struct zxi2c *i2c, struct i2c_msg *msgs, int num)
> +{
> +	u16 i, finished;
> +	int error;

please move this error declaration inside the for() to make it
clear where it's used (and possibly all the variables used only
inside the for()).

> +	u8 index, ret = 0;

this function returns an integer, but ret is u8. Please, declare
ret as int.

> +	struct i2c_msg *msg;
> +	void __iomem *regs = i2c->regs;
> +
> +	clear_irq_status(regs);
> +	enable_byte_mode(regs);
> +	zxi2c_enable_irq(regs, IRQ_EN_BYTEEND, true);
> +
> +	for (index = 0; index < num; index++) {
> +		msg = msgs + index;
> +		i2c->addr = msg->addr;
> +		i2c->is_read = !!(msg->flags & I2C_M_RD);
> +		i2c->byte_left = i2c->len = msg->len;
> +
> +		zxi2c_set_wr(regs, i2c->is_read);
> +		if (i2c->is_read) {
> +			zxi2c_prepare_next_read(regs, i2c->byte_left);
> +			zxi2c_start(i2c);
> +			/* create restart for non-first msg */
> +			if (index)
> +				zxi2c_continue(i2c);
> +
> +			for (i = 1; i <= msg->len; i++) {
> +				error = zxi2c_wait_event(i2c, IRQ_STS_BYTEEND);
> +				if (error)
> +					break;
> +
> +				msg->buf[i - 1] = get_byte(regs);
> +				if (i2c->byte_left == 0)
> +					break;
> +
> +				zxi2c_prepare_next_read(regs, i2c->byte_left);
> +				zxi2c_continue(i2c);
> +			}
> +		} else {
> +			set_byte(regs, msg->buf[0]);
> +			/* mark whether this is the last msg */
> +			i2c->is_last_msg = index == !!(num - 1);
> +			zxi2c_start(i2c);
> +			/* create restart for non-first msg */
> +			if (index)
> +				zxi2c_continue(i2c);
> +
> +			for (i = 1; i <= msg->len; i++) {
> +				error = zxi2c_wait_event(i2c, IRQ_STS_BYTEEND);
> +				if (error)
> +					break;
> +
> +				if (i2c->byte_left == 0)
> +					break;
> +				set_byte(regs, msg->buf[i]);
> +				zxi2c_continue(i2c);
> +			}
> +		}
> +
> +		if (error) {
> +			/* check if NACK during transmitting */
> +			finished = msg->len - i2c->byte_left;
> +			if (finished)
> +				dev_err(i2c->dev,
> +					"%s: %s finished %d bytes: %*ph\n",
> +					__func__,
> +					i2c->is_read ? "read" : "write",
> +					finished, finished, msg->buf);
> +			return error;
> +		}
> +		ret++;
> +	}
> +
> +	zxi2c_enable_irq(regs, IRQ_EN_BYTEEND, false);
> +	return ret;
> +}

[...]

> +static int zxi2c_probe(struct platform_device *pdev)
> +{
> +	int error;
> +	struct zxi2c *i2c;
> +	struct pci_dev *pci;
> +	struct device *dev;
> +
> +	/* make sure this is zhaoxin platform */
> +	dev = pdev->dev.parent;
> +	if (dev && dev_is_pci(dev)) {
> +		pci = to_pci_dev(dev);
> +		if (pci->vendor != 0x1d17 || pci->device != 0x1001)
> +			return -ENODEV;
> +	} else
> +		return -ENODEV;

please use brackets here (and checkpatch.pl before sending the
patch).

> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> +	if (IS_ERR(i2c)) {
> +		dev_err(&pdev->dev, "devm_kzalloc failed\n");
> +		return -ENOMEM;

please use dev_err_probe() here and everywhere you are printing
and returning an error.

> +	}
> +
> +	i2c->pci = pci;
> +	i2c->dev = &pdev->dev;
> +	error = zxi2c_parse_resources(i2c);
> +	if (error)
> +		return error;
> +
> +	platform_set_drvdata(pdev, (void *)i2c);
> +
> +	if (devm_request_irq(&pdev->dev, i2c->irq, zxi2c_irq_handle,
> +			     IRQF_SHARED, pdev->name, i2c)) {
> +		dev_err(i2c->dev, "IRQ%d request failed\n", i2c->irq);
> +		return -ENODEV;

dev_err_probe()

> +	}
> +
> +	init_waitqueue_head(&i2c->waitq);
> +
> +	i2c->adap.owner = THIS_MODULE;
> +	i2c->adap.algo = &zxi2c_algorithm;
> +	i2c->adap.retries = 2;
> +	i2c->adap.quirks = &zxi2c_quirks;
> +	i2c->adap.dev.parent = &pdev->dev;
> +	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
> +	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
> +		 "%s-%s", dev_name(&pci->dev), dev_name(i2c->dev));
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	error = i2c_add_adapter(&i2c->adap);
> +	if (unlikely(error)) {
> +		dev_err(i2c->dev, "failed to register, %d\n", error);
> +		return error;

dev_err_probe()

Andi

> +	}
> +
> +	dev_info(i2c->dev, "adapter /dev/i2c-%d registered. hw version %x\n",
> +		 i2c->adap.nr, i2c->hrv);
> +
> +	return 0;
> +}
