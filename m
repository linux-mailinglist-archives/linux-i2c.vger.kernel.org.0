Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 075ED7229F9
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 16:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbjFEO4R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 10:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjFEO4R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 10:56:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4327BF4
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jun 2023 07:56:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D4E4D61565
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jun 2023 14:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75D8C433EF;
        Mon,  5 Jun 2023 14:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685976972;
        bh=2rbW8OMp81OXumDP7Yv/LWrvcYODTaTWKEWuxk7GSAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hh82GYGZuAUdfibco4ZBlBo/UTAdFhUpAoeVD493FyaJPBGDy0jmQ0qyIzPA/ZuEe
         7rsbudhPkXb+HetOG8VPsnx3qf/XbLQndFncOYJmew0C4EYIIop4XezCwP4VLABfDA
         72I/ybd2BziNCI4uuMx59CXnyO3XpEg1L6aTxiiSzozmuyGmioCeLL/EdTooDKVtsP
         F3m9xnhJdf4UC4qRBY8QIcAN0qLjYD5XBQiTxnXXumtKPrqtKNlJm7iueMrabSqMzH
         y9af9fnG7rCy3wSoG3OnP0girEP5wh+U6oCYDRqW6V4z/ihx71AQFN5X2Q8QDCaxp/
         mlU0R4sJVdK0w==
Date:   Mon, 5 Jun 2023 16:56:09 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
Subject: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230605145609.5ixdgf6fivcpt47s@intel.intel>
References: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

[...]

> +#define IICCR_L                  0x00
> +#define   MST_RST          BIT(7)
> +#define   MST_RST_PATCH    BIT(6)
> +#define   CPU_RDY          BIT(3)
> +#define   TX_END           BIT(2)
> +#define   RX_ACK           BIT(1)
> +#define IICCR_H                  0x01
> +#define   FIFO_EN          BIT(6)
> +#define IICSLVADDR               0x02
> +#define IICTCR                   0x03
> +#define   FAST_SEL         BIT(7)
> +#define   MASTER_RECV      BIT(6)
> +#define   HS_SEL           BIT(5)
> +#define IICSR                    0x04
> +#define   SDA_I            BIT(3)
> +#define   SCL_I            BIT(2)
> +#define   READY            BIT(1)
> +#define   RCV_NACK         BIT(0)
> +#define IICISR                   0x06
> +#define   IRQ_STS_BYTENACK BIT(5)
> +#define   IRQ_STS_FIFONACK BIT(4)
> +#define   IRQ_STS_FIFOEND  BIT(3)
> +#define   IRQ_SCL_TIMEOUT  BIT(2)
> +#define   IRQ_STS_BYTEEND  BIT(1)
> +#define   IRQ_STS_ADDRNACK BIT(0)
> +#define   IRQ_STS_MASK     GENMASK(3, 0)
> +#define IICIMR                   0x08
> +#define   IRQ_EN_FIFOEND   BIT(3)
> +#define   IRQ_EN_TIMEOUT   BIT(2)
> +#define   IRQ_EN_BYTEEND   BIT(1)
> +#define   IRQ_EN_ADDRNACK  BIT(0)
> +#define IICDATA2IIC              0x0A
> +#define IICDATA2CPU              0x0B
> +#define IICTR_FSTP               0x0C
> +#define IICTR_SCLTP              0x0D
> +#define IICMCR                   0x0E
> +#define   DYCLK_EN         BIT(0)
> +#define IIC_MST_CODE             0x0F
> +#define IICCS                    0x10
> +#define   CLKSEL_50M       BIT(0)
> +#define IICREV                   0x11
> +#define IICHCR                   0x12
> +#define   FIFO_RST         GENMASK(1, 0)
> +#define IICHTDR                  0x13
> +#define IICHRDR                  0x14
> +#define IICHTLR                  0x15
> +#define IICHRLR                  0x16
> +#define IICHWCNTR                0x18
> +#define IICHRCNTR                0x19

IIC is not a prefix of this driver. Below you have used ZXI2C (or
even ZX), can we use that as prefix?

> +#define FIFO_SIZE       32
> +#define ZXI2C_TIMEOUT   1000

[...]

> +#define set_byte(r, d)           iowrite8(d, r + IICDATA2IIC)
> +#define get_byte(r)              ioread8(r + IICDATA2CPU)
> +#define is_ready(r)              (ioread8(r + IICSR) & READY)
> +#define is_nack(r)               (ioread8(r + IICSR) & RCV_NACK)
> +#define get_irq_status(r)        ioread8(r + IICISR)
> +#define get_reversion(r)         ioread8(r + IICREV)
> +#define clear_irq_status(r)      iowrite8(IRQ_STS_MASK, r + IICISR)
> +#define set_fifo_byte(r, d)      iowrite8(d, r + IICHTDR)
> +#define get_fifo_byte(r)         ioread8(r + IICHRDR)
> +#define set_fifo_wr_len(r, d)    iowrite8(d, r + IICHTLR)
> +#define set_fifo_rd_len(r, d)    iowrite8(d, r + IICHRLR)
> +#define get_fifo_wr_cnt(r)       ioread8(r + IICHWCNTR)
> +#define get_fifo_rd_cnt(r)       ioread8(r + IICHRCNTR)
> +#define master_regs_reset(r)     iowrite8(MST_RST | 0x41, r + IICCR_L)
> +#define set_dynamic_clock(r, d)  iowrite8(d, r + IICMCR)
> +#define get_dynamic_clock(r)     (ioread8(r + IICMCR) & DYCLK_EN)
> +#define stop_write_byte(r)       iowrite8(TX_END | 0x41, r + IICCR_L)
> +#define get_fstp_value(r)        ioread8(r + IICTR_FSTP)
> +#define enable_fifo_mode(r)      iowrite8(FIFO_EN, r + IICCR_H)
> +#define enable_byte_mode(r)      iowrite8(0, r + IICCR_H)

same here set_byte/get_byte/is_ready/is_nack/... can we have a
prefix for them, as well?
zxi2c_set_byte/zxi2c_get_byte/zxi2c_is_read/zxi2c_is_nack/... (or
just zx_set_byte/zx_get_byte/zx_is_read/zx_is_nack/...  as long
as you are consistent)

[...]

> +static void zxi2c_reset_fifo(struct zxi2c *i2c)
> +{
> +	u8 tmp;
> +	u8 count;
> +	void __iomem *regs = i2c->regs;
> +
> +	tmp = ioread8(regs + IICHCR);
> +	iowrite8(tmp | FIFO_RST, regs + IICHCR);
> +	for (count = 0; count < 50; count++)
> +		if (!(ioread8(regs + IICHCR) & FIFO_RST))
> +			break;
> +	if (count >= 50)
> +		dev_warn(i2c->dev, "%s failed\n", __func__);

are you sure you want to try 50 times? Is it expected to fail
resetting this many times? Besides, how long does it take? don't
we want to have exclusive access during this period?

> +}

[...]

> +static const u32 speed_params_table[][3] = {
> +	/* speed, IICTCR, IICTR_FSTP, IICCS, IICTR_SCLTP */
> +	{I2C_MAX_STANDARD_MODE_FREQ, 0, 0xF3},
> +	{I2C_MAX_FAST_MODE_FREQ, FAST_SEL, 0x38},
> +	{I2C_MAX_FAST_MODE_PLUS_FREQ, FAST_SEL, 0x13},
> +	{I2C_MAX_HIGH_SPEED_MODE_FREQ, HS_SEL, 0x37},
> +};

what are the third values? Maybe we want to define them, as well?

> +
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

0x10 is the golden value... can you please explain what does it
stand for?

> +		dev_warn_once(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
> +				i2c->speed, i2c->fstp, params[2]);
> +		iowrite8(params[2], i2c->regs + IICTR_FSTP);
> +	} else {
> +		iowrite8(i2c->fstp, i2c->regs + IICTR_FSTP);
> +	}
> +
> +	iowrite8(CLKSEL_50M, i2c->regs + IICCS);
> +	iowrite8(0xff, i2c->regs + IICTR_SCLTP);
> +
> +	/* for Hs-mode, use 0000 1000 as master code */
> +	if (i2c->speed == I2C_MAX_HIGH_SPEED_MODE_FREQ)
> +		iowrite8(0x08, i2c->regs + IIC_MST_CODE);

you have defined all the registers and masks above so clearly,
can define 0x08, as well?

> +}

[...]

> +static int zxi2c_wait_event(struct zxi2c *i2c, u8 event)
> +{
> +	int timeout;
> +
> +	timeout = wait_event_interruptible_timeout(i2c->waitq,
> +			i2c->event != 0,
> +			msecs_to_jiffies(ZXI2C_TIMEOUT));
> +
> +	if (timeout == 0) {
> +		dev_err(i2c->dev, "timeout(SW), ID: 0x%X\n", i2c->addr);
> +		/* Clock streching timeout, do recovery */
> +		if (!is_nack(i2c->regs))
> +			dev_err(i2c->dev, "device hang? reset, ID: 0x%X\n",
> +				i2c->addr);
> +
> +		master_regs_reset(i2c->regs);
> +		zxi2c_set_bus_speed(i2c);
> +
> +		return -EIO;
> +	}
> +
> +	if (i2c->event & event) {
> +		if (timeout == 1)
> +			dev_warn(i2c->dev, "thread may be blocked\n");
> +		return 0;
> +	}

thanks!

> +	return -EIO;
> +}
> +
> +static int zxi2c_byte_xfer(struct zxi2c *i2c, struct i2c_msg *msgs, int num)
> +{
> +	u16 i, finished;
> +	u8 index;
> +	int ret = 0;
> +	struct i2c_msg *msg;
> +	void __iomem *regs = i2c->regs;
> +
> +	clear_irq_status(regs);

why do we need to clear the irq_status for each transfer? In this
device isn't it enough to do it in the irq handler?

> +	enable_byte_mode(regs);
> +	zxi2c_enable_irq(regs, IRQ_EN_BYTEEND, true);

[...]

> +static int zxi2c_fifo_xfer(struct zxi2c *i2c, struct i2c_msg *msgs)
> +{
> +	void __iomem *regs = i2c->regs;
> +	struct i2c_msg *msg = msgs;
> +	int i;
> +	u8 finished;
> +
> +	i2c->addr = msg->addr;
> +	i2c->is_read = !!(msg->flags & I2C_M_RD);
> +	i2c->len = msg->len;
> +
> +	zxi2c_reset_fifo(i2c);

this means that at every fifo_xfer we are going to try resetting
up to 50 times, right?

> +	enable_fifo_mode(regs);
> +
> +	clear_irq_status(regs);
> +	zxi2c_enable_irq(regs, IRQ_EN_FIFOEND, true);
> +
> +	zxi2c_set_wr(regs, i2c->is_read);
> +	if (i2c->is_read) {
> +		set_fifo_rd_len(regs, msg->len - 1);
> +	} else {
> +		set_fifo_wr_len(regs, msg->len - 1);
> +		for (i = 0; i < msg->len; i++)
> +			set_fifo_byte(regs, msg->buf[i]);
> +	}
> +
> +	zxi2c_start(i2c);
> +	if (zxi2c_wait_event(i2c, IRQ_STS_FIFOEND))
> +		return -ENODEV;
> +
> +	if (i2c->is_read) {
> +		finished = get_fifo_rd_cnt(regs);
> +		for (i = 0; i < finished; i++)
> +			msg->buf[i] = get_fifo_byte(regs);
> +	} else {
> +		finished = get_fifo_wr_cnt(regs);
> +	}
> +
> +	/* check if NACK during transmitting */
> +	if (finished != msg->len) {
> +		if (finished)
> +			dev_err(i2c->dev,
> +				"%s: %s only finished %d/%d bytes: %*ph\n",
> +				__func__, i2c->is_read ? "read" : "write",
> +				finished, msg->len, finished, msg->buf);
> +		return -EAGAIN;
> +	}
> +
> +	zxi2c_enable_irq(regs, IRQ_EN_FIFOEND, false);
> +	return 1;
> +}
> +
> +static int zxi2c_master_xfer(struct i2c_adapter *adap,
> +			     struct i2c_msg *msgs, int num)
> +{
> +	int error;
> +	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
> +
> +	if (!is_ready(i2c->regs)) {
> +		zxi2c_module_reset(i2c);
> +		zxi2c_set_bus_speed(i2c);
> +		dev_err(i2c->dev, "controller busy, reset try again\n");
> +
> +		return -EAGAIN;

before returning we could eventually try checking again whether
the controller is ready:

	if (!is_ready(i2c->regs)) {
		dev_warn("device not ready\n");

		module_reset();
		set_bus_speed();

		if (!is_ready(i2c->regs)) {
			dev_err()
			return -EBUSY;
		}
	}

> +	}
> +
> +	if (num == 1 && msgs->len <= FIFO_SIZE && msgs->len >= 3)
> +		error = zxi2c_fifo_xfer(i2c, msgs);
> +	else
> +		error = zxi2c_byte_xfer(i2c, msgs, num);
> +
> +	return error;
> +}
> +
> +static u32 zxi2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;

how is smbus supported here?

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

let's define vendor and device values?

> +			return -ENODEV;
> +	} else {
> +		return -ENODEV;
> +	}
> +
> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> +	if (IS_ERR(i2c)) {
> +		return dev_err_probe(&pdev->dev, -ENOMEM,
> +				"devm_kzalloc failed\n");
> +	}

no need for brackets here

Looks good!

Thanks,
Andi

> +
> +	i2c->pci = pci;
> +	i2c->dev = &pdev->dev;
> +	error = zxi2c_parse_resources(i2c);
> +	if (error)
> +		return error;
