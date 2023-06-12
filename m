Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FE272BA69
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 10:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjFLI0E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 04:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbjFLIZY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 04:25:24 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C9D198A
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 01:24:31 -0700 (PDT)
X-ASG-Debug-ID: 1686558268-1eb14e2b470e6f0001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id QIPLcTg5vf6YYDr9 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 12 Jun 2023 16:24:28 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 12 Jun
 2023 16:24:28 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 12 Jun
 2023 16:24:26 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <51aab637-919c-460f-529b-92d015e67708@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Mon, 12 Jun 2023 16:24:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Hans Hu <HansHu-oc@zhaoxin.com>
Subject: Re: [PATCH v4] i2c: add support for Zhaoxin I2C controller
Reply-To: <20230609122414.l2pcuwv5foclkxea@intel.intel>
X-ASG-Orig-Subj: Re: [PATCH v4] i2c: add support for Zhaoxin I2C controller
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     <krzk@kernel.org>, <linux-i2c@vger.kernel.org>,
        <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
References: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
 <20230609122414.l2pcuwv5foclkxea@intel.intel>
Content-Language: en-US
In-Reply-To: <20230609122414.l2pcuwv5foclkxea@intel.intel>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1686558268
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 9575
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.109941
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,


On 2023/6/9 20:24, Andi Shyti wrote:
> Hi Hans,
>
>> +static int zxi2c_byte_xfer(struct zxi2c *i2c, struct i2c_msg *msgs, int num)
>> +{
>> +	u16 i, finished;
>> +	u8 index;
>> +	int ret = 0;
>> +	struct i2c_msg *msg;
>> +	void __iomem *regs = i2c->regs;
>> +
>> +	zxi2c_en_byte_mode(regs);
>> +	zxi2c_enable_irq(regs, ZXI2C_EN_BYTEEND, true);
>> +
>> +	for (index = 0; index < num; index++) {
>> +		int err = 0;
>> +
>> +		msg = msgs + index;
>> +		i2c->addr = msg->addr;
>> +		i2c->is_read = !!(msg->flags & I2C_M_RD);
>> +		i2c->byte_left = i2c->len = msg->len;
>> +
>> +		zxi2c_set_wr(regs, i2c->is_read);
>> +		if (i2c->is_read) {
>> +			zxi2c_prepare_next_read(regs, i2c->byte_left);
>> +			zxi2c_start(i2c);
>> +			/* create restart for non-first msg */
>> +			if (index)
>> +				zxi2c_continue(i2c);
>> +
>> +			for (i = 1; i <= msg->len; i++) {
>> +				err = zxi2c_wait_event(i2c, ZXI2C_STS_BYTEEND);
>> +				if (err)
>> +					break;
>> +
>> +				msg->buf[i - 1] = zxi2c_get_byte(regs);
> why don't you start the for loop from '0' to avoid "i - 1"?


Introduced during early debugging, will change in v5


>> +				if (i2c->byte_left == 0)
>> +					break;
>> +
>> +				zxi2c_prepare_next_read(regs, i2c->byte_left);
>> +				zxi2c_continue(i2c);
>> +			}
>> +		} else {
>> +			zxi2c_set_byte(regs, msg->buf[0]);
>> +			/* mark whether this is the last msg */
>> +			i2c->is_last_msg = index == !!(num - 1);
>> +			zxi2c_start(i2c);
>> +			/* create restart for non-first msg */
>> +			if (index)
>> +				zxi2c_continue(i2c);
>> +
>> +			for (i = 1; i <= msg->len; i++) {
>> +				err = zxi2c_wait_event(i2c, ZXI2C_STS_BYTEEND);
>> +				if (err)
>> +					break;
>> +
>> +				if (i2c->byte_left == 0)
>> +					break;
>> +				zxi2c_set_byte(regs, msg->buf[i]);
>> +				zxi2c_continue(i2c);
>> +			}
>> +		}
>> +
>> +		if (err) {
>> +			/* check if NACK during transmitting */
>> +			finished = msg->len - i2c->byte_left;
>> +			if (finished)
>> +				dev_err(i2c->dev,
>> +					"%s: %s finished %d bytes: %*ph\n",
>> +					__func__,
>> +					i2c->is_read ? "read" : "write",
>> +					finished, finished, msg->buf);
>> +			return err;
> do you need to disable irq's here?
>

will change in v5


>> +		}
>> +		ret++;
>> +	}
>> +
>> +	zxi2c_enable_irq(regs, ZXI2C_EN_BYTEEND, false);
>> +	return ret;
>> +}
>> +
>> +static int zxi2c_fifo_xfer(struct zxi2c *i2c, struct i2c_msg *msgs)
>> +{
>> +	void __iomem *regs = i2c->regs;
>> +	struct i2c_msg *msg = msgs;
>> +	int i;
>> +	u8 finished;
>> +	int err;
>> +
>> +	i2c->addr = msg->addr;
>> +	i2c->is_read = !!(msg->flags & I2C_M_RD);
>> +	i2c->len = msg->len;
>> +
>> +	zxi2c_reset_fifo(i2c);
>> +	zxi2c_en_fifo_mode(regs);
>> +	zxi2c_enable_irq(regs, ZXI2C_EN_FIFOEND, true);
>> +
>> +	zxi2c_set_wr(regs, i2c->is_read);
>> +	if (i2c->is_read) {
>> +		zxi2c_set_fifo_rd_len(regs, msg->len - 1);
>> +	} else {
>> +		zxi2c_set_fifo_wr_len(regs, msg->len - 1);
>> +		for (i = 0; i < msg->len; i++)
>> +			zxi2c_set_fifo_byte(regs, msg->buf[i]);
>> +	}
>> +
>> +	zxi2c_start(i2c);
>> +	err = zxi2c_wait_event(i2c, ZXI2C_STS_FIFOEND);
>> +	if (err)
>> +		return err;
>> +
>> +	if (i2c->is_read) {
>> +		finished = zxi2c_get_fifo_rd_cnt(regs);
>> +		for (i = 0; i < finished; i++)
>> +			msg->buf[i] = zxi2c_get_fifo_byte(regs);
>> +	} else {
>> +		finished = zxi2c_get_fifo_wr_cnt(regs);
>> +	}
>> +
>> +	/* check if NACK during transmitting */
>> +	if (finished != msg->len) {
>> +		if (finished)
>> +			dev_err(i2c->dev,
>> +				"%s: %s only finished %d/%d bytes: %*ph\n",
>> +				__func__, i2c->is_read ? "read" : "write",
>> +				finished, msg->len, finished, msg->buf);
>> +		return -EAGAIN;
> do you need to disable irq's here?


will change in v5


>> +	}
>> +
>> +	zxi2c_enable_irq(regs, ZXI2C_EN_FIFOEND, false);
>> +	return 1;
>> +}
>> +
>> +static int zxi2c_master_xfer(struct i2c_adapter *adap,
>> +			     struct i2c_msg *msgs, int num)
>> +{
>> +	int err;
>> +	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
>> +
>> +	if (!zxi2c_is_ready(i2c->regs)) {
> one question: what are the cases that the controller is not
> ready. What might the controller be doing now?


I am worried that the hardware state machine may make errors under the 
influence
of the device. I hope to solve this possible problem through a reset 
mechanism.
In fact, I have not come across such a case.


>> +		dev_warn(i2c->dev, "controller not ready\n");
>> +		zxi2c_module_reset(i2c);
>> +		if (!zxi2c_is_ready(i2c->regs)) {
>> +			dev_err(i2c->dev, "controller can't reset to ready\n");
>> +			return -EBUSY;
>> +		}
>> +		zxi2c_set_bus_speed(i2c);
>> +	}
>> +
>> +	if (num == 1 && msgs->len <= ZXI2C_FIFO_SIZE && msgs->len >= 3)
>> +		err = zxi2c_fifo_xfer(i2c, msgs);
>> +	else
>> +		err = zxi2c_byte_xfer(i2c, msgs, num);
>> +
>> +	return err;
>> +}
>> +
>> +static u32 zxi2c_func(struct i2c_adapter *adap)
>> +{
>> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>> +}
>> +
>> +static const struct i2c_algorithm zxi2c_algorithm = {
>> +	.master_xfer = zxi2c_master_xfer,
>> +	.functionality = zxi2c_func,
>> +};
>> +
>> +static const struct i2c_adapter_quirks zxi2c_quirks = {
>> +	.flags = I2C_AQ_NO_ZERO_LEN | I2C_AQ_COMB_WRITE_THEN_READ,
>> +};
>> +
>> +static int zxi2c_parse_resources(struct zxi2c *i2c)
>> +{
>> +	struct platform_device *pdev = to_platform_device(i2c->dev);
>> +	struct resource *res;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	i2c->regs = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(i2c->regs))
>> +		return PTR_ERR(i2c->regs);
>> +
>> +	if (res->start & 0x20)
> do you mind giving this 0x20 a define?


will change in v5


>> +		i2c->reset_bitmask = BIT(4);
>> +	else
>> +		i2c->reset_bitmask = BIT(5);
> I'm not strong on these, but would be nice to have also these two
> bits defined, as well.


will change in v5.


>> +
>> +	i2c->irq = platform_get_irq(pdev, 0);
>> +	if (i2c->irq < 0)
>> +		return i2c->irq;
>> +
>> +	i2c->hrv = zxi2c_get_revison(i2c->regs);
>> +	i2c->dynamic = zxi2c_get_dyn_clk(i2c->regs);
>> +
>> +	i2c->fstp = zxi2c_get_fstp_value(i2c->regs);
>> +	zxi2c_get_bus_speed(i2c);
>> +	zxi2c_set_bus_speed(i2c);
>> +
>> +	return 0;
>> +}
>> +
>> +static int zxi2c_probe(struct platform_device *pdev)
>> +{
>> +	int err = 0;
>> +	struct zxi2c *i2c;
>> +	struct pci_dev *pci;
>> +	struct device *dev;
>> +
>> +	/* make sure this is zhaoxin platform */
> Krzysztof is asking what does this mean? I guess here you are
> checking if the device connected is really the zhaixin plaform of
> this driver. Makes sense. Just to avoid misunderstandings we
> could rephrase this with something like:
>
> 	/*
> 	 * Check if vendor and device ID match the expected
> 	 * values for the zhaoxin platform
> 	 */
>
> would it work?


will drop this as Krzysztof suggested. In fact, it is almost impossible
for a non-ZXI2C device to report the HID name IIC1D17 through ACPI.


>> +	dev = pdev->dev.parent;
>> +	if (dev && dev_is_pci(dev)) {
>> +		pci = to_pci_dev(dev);
>> +		if (pci->vendor != PCI_VENDOR_ID_ZHAOXIN ||
>> +		    pci->device != ZXI2C_PARENT_PCI_DID)
>> +			return -ENODEV;
>> +	} else {
>> +		return -ENODEV;
>> +	}
>> +
>> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
>> +	if (IS_ERR(i2c))
> devm_kzalloc doesn't report an error, just check for NULL if (!i2c)


will change in v5.

will use dev_***_ratelimit() replace dev_***() in zxi2c_irq_handle() in v5


Thank you,
Hans

> Rest looks good.
>
> Thanks,
> Andi
>
>> +		return -ENOMEM;
>> +
>> +	i2c->pci = pci;
>> +	i2c->dev = &pdev->dev;
>> +	err = zxi2c_parse_resources(i2c);
>> +	if (err)
>> +		return err;
>> +
>> +	platform_set_drvdata(pdev, (void *)i2c);
>> +
>> +	err = devm_request_irq(&pdev->dev, i2c->irq, zxi2c_irq_handle,
>> +			     IRQF_SHARED, pdev->name, i2c);
>> +	if (err)
>> +		return err;
>> +
>> +	init_waitqueue_head(&i2c->waitq);
>> +
>> +	i2c->adap.owner = THIS_MODULE;
>> +	i2c->adap.algo = &zxi2c_algorithm;
>> +	i2c->adap.retries = 2;
>> +	i2c->adap.quirks = &zxi2c_quirks;
>> +	i2c->adap.dev.parent = &pdev->dev;
>> +	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
>> +	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "%s-%s-%s",
>> +			ZXI2C_NAME, dev_name(&pci->dev), dev_name(i2c->dev));
>> +	i2c_set_adapdata(&i2c->adap, i2c);
>> +
>> +	return devm_i2c_add_adapter(&pdev->dev, &i2c->adap);
>> +}
>> +
>> +static int zxi2c_resume(struct device *dev)
>> +{
>> +	struct zxi2c *i2c = dev_get_drvdata(dev);
>> +
>> +	zxi2c_module_reset(i2c);
>> +	zxi2c_set_bus_speed(i2c);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops zxi2c_pm = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, zxi2c_resume)
>> +};
>> +
>> +static const struct acpi_device_id zxi2c_acpi_match[] = {
>> +	{"IIC1D17", 0},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(acpi, zxi2c_acpi_match);
>> +
>> +static struct platform_driver zxi2c_driver = {
>> +	.probe = zxi2c_probe,
>> +	.driver = {
>> +		.name = ZXI2C_NAME,
>> +		.acpi_match_table = zxi2c_acpi_match,
>> +		.pm = &zxi2c_pm,
>> +	},
>> +};
>> +module_platform_driver(zxi2c_driver);
>> +
>> +MODULE_AUTHOR("HansHu@zhaoxin.com");
>> +MODULE_DESCRIPTION("Shanghai Zhaoxin IIC driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.17.1
>>
