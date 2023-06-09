Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1017299E6
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 14:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjFIM00 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 08:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239554AbjFIM0Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 08:26:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEE435AC
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 05:25:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8051761BD5
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 12:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432A2C433D2;
        Fri,  9 Jun 2023 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686313457;
        bh=NNkRmNCwCXjt/GhLl9qq8Ohr/cHLOocr1UMlv7+LYqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cI8uuuCP1eCMpvLtvA/OXQeMQI73ujb3sn5acRGK4EBylSyBP/EpjzraEfYBu8Nus
         T/QDZBbgwIKoLulHtTqVq/Th/0lCy6qR1TsMU57KwHvekKSs47X6nxWlQi99oiy3D5
         +rbgMtglMvXcp2qFzMmmUztQ6b+Q84sYwg8Z/AWzQ1THCluLv7HboPR9CMgBmLF01O
         vC/m3flTsn/Q4+qqqiwOzlF89om9RaJtJWHUkOQfJ/3XGENFBnYCjI4Lj2NLCvRBgO
         EXOQMpTmljmwYKQEUvhBr/K0BwaCPGtD/kRuJQDOOoj6PKlkUmjNt4KGEop8lN5Yw1
         Mm3oPjn1rN0/A==
Date:   Fri, 9 Jun 2023 14:24:14 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     krzk@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
Subject: Re: [PATCH v4] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230609122414.l2pcuwv5foclkxea@intel.intel>
References: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

> +static int zxi2c_byte_xfer(struct zxi2c *i2c, struct i2c_msg *msgs, int num)
> +{
> +	u16 i, finished;
> +	u8 index;
> +	int ret = 0;
> +	struct i2c_msg *msg;
> +	void __iomem *regs = i2c->regs;
> +
> +	zxi2c_en_byte_mode(regs);
> +	zxi2c_enable_irq(regs, ZXI2C_EN_BYTEEND, true);
> +
> +	for (index = 0; index < num; index++) {
> +		int err = 0;
> +
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
> +				err = zxi2c_wait_event(i2c, ZXI2C_STS_BYTEEND);
> +				if (err)
> +					break;
> +
> +				msg->buf[i - 1] = zxi2c_get_byte(regs);

why don't you start the for loop from '0' to avoid "i - 1"?

> +				if (i2c->byte_left == 0)
> +					break;
> +
> +				zxi2c_prepare_next_read(regs, i2c->byte_left);
> +				zxi2c_continue(i2c);
> +			}
> +		} else {
> +			zxi2c_set_byte(regs, msg->buf[0]);
> +			/* mark whether this is the last msg */
> +			i2c->is_last_msg = index == !!(num - 1);
> +			zxi2c_start(i2c);
> +			/* create restart for non-first msg */
> +			if (index)
> +				zxi2c_continue(i2c);
> +
> +			for (i = 1; i <= msg->len; i++) {
> +				err = zxi2c_wait_event(i2c, ZXI2C_STS_BYTEEND);
> +				if (err)
> +					break;
> +
> +				if (i2c->byte_left == 0)
> +					break;
> +				zxi2c_set_byte(regs, msg->buf[i]);
> +				zxi2c_continue(i2c);
> +			}
> +		}
> +
> +		if (err) {
> +			/* check if NACK during transmitting */
> +			finished = msg->len - i2c->byte_left;
> +			if (finished)
> +				dev_err(i2c->dev,
> +					"%s: %s finished %d bytes: %*ph\n",
> +					__func__,
> +					i2c->is_read ? "read" : "write",
> +					finished, finished, msg->buf);
> +			return err;

do you need to disable irq's here?

> +		}
> +		ret++;
> +	}
> +
> +	zxi2c_enable_irq(regs, ZXI2C_EN_BYTEEND, false);
> +	return ret;
> +}
> +
> +static int zxi2c_fifo_xfer(struct zxi2c *i2c, struct i2c_msg *msgs)
> +{
> +	void __iomem *regs = i2c->regs;
> +	struct i2c_msg *msg = msgs;
> +	int i;
> +	u8 finished;
> +	int err;
> +
> +	i2c->addr = msg->addr;
> +	i2c->is_read = !!(msg->flags & I2C_M_RD);
> +	i2c->len = msg->len;
> +
> +	zxi2c_reset_fifo(i2c);
> +	zxi2c_en_fifo_mode(regs);
> +	zxi2c_enable_irq(regs, ZXI2C_EN_FIFOEND, true);
> +
> +	zxi2c_set_wr(regs, i2c->is_read);
> +	if (i2c->is_read) {
> +		zxi2c_set_fifo_rd_len(regs, msg->len - 1);
> +	} else {
> +		zxi2c_set_fifo_wr_len(regs, msg->len - 1);
> +		for (i = 0; i < msg->len; i++)
> +			zxi2c_set_fifo_byte(regs, msg->buf[i]);
> +	}
> +
> +	zxi2c_start(i2c);
> +	err = zxi2c_wait_event(i2c, ZXI2C_STS_FIFOEND);
> +	if (err)
> +		return err;
> +
> +	if (i2c->is_read) {
> +		finished = zxi2c_get_fifo_rd_cnt(regs);
> +		for (i = 0; i < finished; i++)
> +			msg->buf[i] = zxi2c_get_fifo_byte(regs);
> +	} else {
> +		finished = zxi2c_get_fifo_wr_cnt(regs);
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

do you need to disable irq's here?

> +	}
> +
> +	zxi2c_enable_irq(regs, ZXI2C_EN_FIFOEND, false);
> +	return 1;
> +}
> +
> +static int zxi2c_master_xfer(struct i2c_adapter *adap,
> +			     struct i2c_msg *msgs, int num)
> +{
> +	int err;
> +	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
> +
> +	if (!zxi2c_is_ready(i2c->regs)) {

one question: what are the cases that the controller is not
ready. What might the controller be doing now?

> +		dev_warn(i2c->dev, "controller not ready\n");
> +		zxi2c_module_reset(i2c);
> +		if (!zxi2c_is_ready(i2c->regs)) {
> +			dev_err(i2c->dev, "controller can't reset to ready\n");
> +			return -EBUSY;
> +		}
> +		zxi2c_set_bus_speed(i2c);
> +	}
> +
> +	if (num == 1 && msgs->len <= ZXI2C_FIFO_SIZE && msgs->len >= 3)
> +		err = zxi2c_fifo_xfer(i2c, msgs);
> +	else
> +		err = zxi2c_byte_xfer(i2c, msgs, num);
> +
> +	return err;
> +}
> +
> +static u32 zxi2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm zxi2c_algorithm = {
> +	.master_xfer = zxi2c_master_xfer,
> +	.functionality = zxi2c_func,
> +};
> +
> +static const struct i2c_adapter_quirks zxi2c_quirks = {
> +	.flags = I2C_AQ_NO_ZERO_LEN | I2C_AQ_COMB_WRITE_THEN_READ,
> +};
> +
> +static int zxi2c_parse_resources(struct zxi2c *i2c)
> +{
> +	struct platform_device *pdev = to_platform_device(i2c->dev);
> +	struct resource *res;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	i2c->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(i2c->regs))
> +		return PTR_ERR(i2c->regs);
> +
> +	if (res->start & 0x20)

do you mind giving this 0x20 a define?

> +		i2c->reset_bitmask = BIT(4);
> +	else
> +		i2c->reset_bitmask = BIT(5);

I'm not strong on these, but would be nice to have also these two
bits defined, as well.

> +
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return i2c->irq;
> +
> +	i2c->hrv = zxi2c_get_revison(i2c->regs);
> +	i2c->dynamic = zxi2c_get_dyn_clk(i2c->regs);
> +
> +	i2c->fstp = zxi2c_get_fstp_value(i2c->regs);
> +	zxi2c_get_bus_speed(i2c);
> +	zxi2c_set_bus_speed(i2c);
> +
> +	return 0;
> +}
> +
> +static int zxi2c_probe(struct platform_device *pdev)
> +{
> +	int err = 0;
> +	struct zxi2c *i2c;
> +	struct pci_dev *pci;
> +	struct device *dev;
> +
> +	/* make sure this is zhaoxin platform */

Krzysztof is asking what does this mean? I guess here you are
checking if the device connected is really the zhaixin plaform of
this driver. Makes sense. Just to avoid misunderstandings we
could rephrase this with something like:

	/*
	 * Check if vendor and device ID match the expected
	 * values for the zhaoxin platform
	 */

would it work?

> +	dev = pdev->dev.parent;
> +	if (dev && dev_is_pci(dev)) {
> +		pci = to_pci_dev(dev);
> +		if (pci->vendor != PCI_VENDOR_ID_ZHAOXIN ||
> +		    pci->device != ZXI2C_PARENT_PCI_DID)
> +			return -ENODEV;
> +	} else {
> +		return -ENODEV;
> +	}
> +
> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> +	if (IS_ERR(i2c))

devm_kzalloc doesn't report an error, just check for NULL if (!i2c)

Rest looks good.

Thanks,
Andi

> +		return -ENOMEM;
> +
> +	i2c->pci = pci;
> +	i2c->dev = &pdev->dev;
> +	err = zxi2c_parse_resources(i2c);
> +	if (err)
> +		return err;
> +
> +	platform_set_drvdata(pdev, (void *)i2c);
> +
> +	err = devm_request_irq(&pdev->dev, i2c->irq, zxi2c_irq_handle,
> +			     IRQF_SHARED, pdev->name, i2c);
> +	if (err)
> +		return err;
> +
> +	init_waitqueue_head(&i2c->waitq);
> +
> +	i2c->adap.owner = THIS_MODULE;
> +	i2c->adap.algo = &zxi2c_algorithm;
> +	i2c->adap.retries = 2;
> +	i2c->adap.quirks = &zxi2c_quirks;
> +	i2c->adap.dev.parent = &pdev->dev;
> +	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
> +	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "%s-%s-%s",
> +			ZXI2C_NAME, dev_name(&pci->dev), dev_name(i2c->dev));
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	return devm_i2c_add_adapter(&pdev->dev, &i2c->adap);
> +}
> +
> +static int zxi2c_resume(struct device *dev)
> +{
> +	struct zxi2c *i2c = dev_get_drvdata(dev);
> +
> +	zxi2c_module_reset(i2c);
> +	zxi2c_set_bus_speed(i2c);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops zxi2c_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, zxi2c_resume)
> +};
> +
> +static const struct acpi_device_id zxi2c_acpi_match[] = {
> +	{"IIC1D17", 0},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, zxi2c_acpi_match);
> +
> +static struct platform_driver zxi2c_driver = {
> +	.probe = zxi2c_probe,
> +	.driver = {
> +		.name = ZXI2C_NAME,
> +		.acpi_match_table = zxi2c_acpi_match,
> +		.pm = &zxi2c_pm,
> +	},
> +};
> +module_platform_driver(zxi2c_driver);
> +
> +MODULE_AUTHOR("HansHu@zhaoxin.com");
> +MODULE_DESCRIPTION("Shanghai Zhaoxin IIC driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.17.1
> 
