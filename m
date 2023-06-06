Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD90723720
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 08:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbjFFGFN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 02:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbjFFGEy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 02:04:54 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347B21703
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jun 2023 23:04:39 -0700 (PDT)
X-ASG-Debug-ID: 1686031476-1eb14e2b47081f0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id Ud1lbGTIkslKiYpR (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Tue, 06 Jun 2023 14:04:36 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 6 Jun
 2023 14:04:35 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 6 Jun
 2023 14:04:35 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <2078b4c8-0c10-27b3-583c-ac38d9582668@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Tue, 6 Jun 2023 14:04:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>,
        <TonyWWang@zhaoxin.com>
References: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
 <20230605145609.5ixdgf6fivcpt47s@intel.intel>
Reply-To: <20230605145609.5ixdgf6fivcpt47s@intel.intel>
From:   Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <20230605145609.5ixdgf6fivcpt47s@intel.intel>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1686031476
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 11991
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.109667
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


On 2023/6/5 22:56, Andi Shyti wrote:
> Hi Hans,
>
> [...]
>
>> +#define IICCR_L                  0x00
>> +#define   MST_RST          BIT(7)
>> +#define   MST_RST_PATCH    BIT(6)
>> +#define   CPU_RDY          BIT(3)
>> +#define   TX_END           BIT(2)
>> +#define   RX_ACK           BIT(1)
>> +#define IICCR_H                  0x01
>> +#define   FIFO_EN          BIT(6)
>> +#define IICSLVADDR               0x02
>> +#define IICTCR                   0x03
>> +#define   FAST_SEL         BIT(7)
>> +#define   MASTER_RECV      BIT(6)
>> +#define   HS_SEL           BIT(5)
>> +#define IICSR                    0x04
>> +#define   SDA_I            BIT(3)
>> +#define   SCL_I            BIT(2)
>> +#define   READY            BIT(1)
>> +#define   RCV_NACK         BIT(0)
>> +#define IICISR                   0x06
>> +#define   IRQ_STS_BYTENACK BIT(5)
>> +#define   IRQ_STS_FIFONACK BIT(4)
>> +#define   IRQ_STS_FIFOEND  BIT(3)
>> +#define   IRQ_SCL_TIMEOUT  BIT(2)
>> +#define   IRQ_STS_BYTEEND  BIT(1)
>> +#define   IRQ_STS_ADDRNACK BIT(0)
>> +#define   IRQ_STS_MASK     GENMASK(3, 0)
>> +#define IICIMR                   0x08
>> +#define   IRQ_EN_FIFOEND   BIT(3)
>> +#define   IRQ_EN_TIMEOUT   BIT(2)
>> +#define   IRQ_EN_BYTEEND   BIT(1)
>> +#define   IRQ_EN_ADDRNACK  BIT(0)
>> +#define IICDATA2IIC              0x0A
>> +#define IICDATA2CPU              0x0B
>> +#define IICTR_FSTP               0x0C
>> +#define IICTR_SCLTP              0x0D
>> +#define IICMCR                   0x0E
>> +#define   DYCLK_EN         BIT(0)
>> +#define IIC_MST_CODE             0x0F
>> +#define IICCS                    0x10
>> +#define   CLKSEL_50M       BIT(0)
>> +#define IICREV                   0x11
>> +#define IICHCR                   0x12
>> +#define   FIFO_RST         GENMASK(1, 0)
>> +#define IICHTDR                  0x13
>> +#define IICHRDR                  0x14
>> +#define IICHTLR                  0x15
>> +#define IICHRLR                  0x16
>> +#define IICHWCNTR                0x18
>> +#define IICHRCNTR                0x19
> IIC is not a prefix of this driver. Below you have used ZXI2C (or
> even ZX), can we use that as prefix?


I will fix them with prefix ZXI2C


>> +#define FIFO_SIZE       32
>> +#define ZXI2C_TIMEOUT   1000
> [...]
>
>> +#define set_byte(r, d)           iowrite8(d, r + IICDATA2IIC)
>> +#define get_byte(r)              ioread8(r + IICDATA2CPU)
>> +#define is_ready(r)              (ioread8(r + IICSR) & READY)
>> +#define is_nack(r)               (ioread8(r + IICSR) & RCV_NACK)
>> +#define get_irq_status(r)        ioread8(r + IICISR)
>> +#define get_reversion(r)         ioread8(r + IICREV)
>> +#define clear_irq_status(r)      iowrite8(IRQ_STS_MASK, r + IICISR)
>> +#define set_fifo_byte(r, d)      iowrite8(d, r + IICHTDR)
>> +#define get_fifo_byte(r)         ioread8(r + IICHRDR)
>> +#define set_fifo_wr_len(r, d)    iowrite8(d, r + IICHTLR)
>> +#define set_fifo_rd_len(r, d)    iowrite8(d, r + IICHRLR)
>> +#define get_fifo_wr_cnt(r)       ioread8(r + IICHWCNTR)
>> +#define get_fifo_rd_cnt(r)       ioread8(r + IICHRCNTR)
>> +#define master_regs_reset(r)     iowrite8(MST_RST | 0x41, r + IICCR_L)
>> +#define set_dynamic_clock(r, d)  iowrite8(d, r + IICMCR)
>> +#define get_dynamic_clock(r)     (ioread8(r + IICMCR) & DYCLK_EN)
>> +#define stop_write_byte(r)       iowrite8(TX_END | 0x41, r + IICCR_L)
>> +#define get_fstp_value(r)        ioread8(r + IICTR_FSTP)
>> +#define enable_fifo_mode(r)      iowrite8(FIFO_EN, r + IICCR_H)
>> +#define enable_byte_mode(r)      iowrite8(0, r + IICCR_H)
> same here set_byte/get_byte/is_ready/is_nack/... can we have a
> prefix for them, as well?
> zxi2c_set_byte/zxi2c_get_byte/zxi2c_is_read/zxi2c_is_nack/... (or
> just zx_set_byte/zx_get_byte/zx_is_read/zx_is_nack/...  as long
> as you are consistent)


will fix them with prefix zxi2c


> [...]
>
>> +static void zxi2c_reset_fifo(struct zxi2c *i2c)
>> +{
>> +	u8 tmp;
>> +	u8 count;
>> +	void __iomem *regs = i2c->regs;
>> +
>> +	tmp = ioread8(regs + IICHCR);
>> +	iowrite8(tmp | FIFO_RST, regs + IICHCR);
>> +	for (count = 0; count < 50; count++)
>> +		if (!(ioread8(regs + IICHCR) & FIFO_RST))
>> +			break;
>> +	if (count >= 50)
>> +		dev_warn(i2c->dev, "%s failed\n", __func__);
> are you sure you want to try 50 times? Is it expected to fail
> resetting this many times? Besides, how long does it take? don't
> we want to have exclusive access during this period?
>

This code is used to fix bugs in the HW design phase.
The bug has been fixed. So the code it's no longer needed.
I'll fix it, only 1 time check reserved.


>> +}
> [...]
>
>> +static const u32 speed_params_table[][3] = {
>> +	/* speed, IICTCR, IICTR_FSTP, IICCS, IICTR_SCLTP */
>> +	{I2C_MAX_STANDARD_MODE_FREQ, 0, 0xF3},
>> +	{I2C_MAX_FAST_MODE_FREQ, FAST_SEL, 0x38},
>> +	{I2C_MAX_FAST_MODE_PLUS_FREQ, FAST_SEL, 0x13},
>> +	{I2C_MAX_HIGH_SPEED_MODE_FREQ, HS_SEL, 0x37},
>> +};
> what are the third values? Maybe we want to define them, as well?


Third value is the golden value of frequency time parameter(FSTP).
Will define them such like ZXI2C_GOLD_FSTP_100K/400K/1M/3400K


>> +
>> +static void zxi2c_set_bus_speed(struct zxi2c *i2c)
>> +{
>> +	u8 i, count;
>> +	const u32 *params = NULL;
>> +
>> +	count = ARRAY_SIZE(speed_params_table);
>> +	for (i = 0; i < count; i++) {
>> +		if (speed_params_table[i][0] == i2c->speed) {
>> +			params = speed_params_table[i];
>> +			break;
>> +		}
>> +	}
>> +
>> +	iowrite8(params[1], i2c->regs + IICTCR);
>> +	if (abs(i2c->fstp - params[2]) > 0x10) {
>> +		/* if BIOS setting value far from golden value,
>> +		 * use golden value and warn user
>> +		 */
> 0x10 is the golden value... can you please explain what does it
> stand for?


Different motherboard circuit designs may require slightly adjusted FSTP 
value.
We reserve interfaces in the BIOS for designers to adjust FSTP value.
0x10 is a reference value representing the maximum allowable difference
between the golden FSTP value and the BIOS setting value.
If the difference is greater than 0x10, means the BIOS may have written 
incorrectly.


>> +		dev_warn_once(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
>> +				i2c->speed, i2c->fstp, params[2]);
>> +		iowrite8(params[2], i2c->regs + IICTR_FSTP);
>> +	} else {
>> +		iowrite8(i2c->fstp, i2c->regs + IICTR_FSTP);
>> +	}
>> +
>> +	iowrite8(CLKSEL_50M, i2c->regs + IICCS);
>> +	iowrite8(0xff, i2c->regs + IICTR_SCLTP);
>> +
>> +	/* for Hs-mode, use 0000 1000 as master code */
>> +	if (i2c->speed == I2C_MAX_HIGH_SPEED_MODE_FREQ)
>> +		iowrite8(0x08, i2c->regs + IIC_MST_CODE);
> you have defined all the registers and masks above so clearly,
> can define 0x08, as well?


will define it as ZXI2C_HS_MASTER_CODE.


>> +}
> [...]
>
>> +static int zxi2c_wait_event(struct zxi2c *i2c, u8 event)
>> +{
>> +	int timeout;
>> +
>> +	timeout = wait_event_interruptible_timeout(i2c->waitq,
>> +			i2c->event != 0,
>> +			msecs_to_jiffies(ZXI2C_TIMEOUT));
>> +
>> +	if (timeout == 0) {
>> +		dev_err(i2c->dev, "timeout(SW), ID: 0x%X\n", i2c->addr);
>> +		/* Clock streching timeout, do recovery */
>> +		if (!is_nack(i2c->regs))
>> +			dev_err(i2c->dev, "device hang? reset, ID: 0x%X\n",
>> +				i2c->addr);
>> +
>> +		master_regs_reset(i2c->regs);
>> +		zxi2c_set_bus_speed(i2c);
>> +
>> +		return -EIO;
>> +	}
>> +
>> +	if (i2c->event & event) {
>> +		if (timeout == 1)
>> +			dev_warn(i2c->dev, "thread may be blocked\n");
>> +		return 0;
>> +	}
> thanks!
>
>> +	return -EIO;
>> +}
>> +
>> +static int zxi2c_byte_xfer(struct zxi2c *i2c, struct i2c_msg *msgs, int num)
>> +{
>> +	u16 i, finished;
>> +	u8 index;
>> +	int ret = 0;
>> +	struct i2c_msg *msg;
>> +	void __iomem *regs = i2c->regs;
>> +
>> +	clear_irq_status(regs);
> why do we need to clear the irq_status for each transfer? In this
> device isn't it enough to do it in the irq handler?


It was for safety reasons. It's redundant code now, will remove it.


>> +	enable_byte_mode(regs);
>> +	zxi2c_enable_irq(regs, IRQ_EN_BYTEEND, true);
> [...]
>
>> +static int zxi2c_fifo_xfer(struct zxi2c *i2c, struct i2c_msg *msgs)
>> +{
>> +	void __iomem *regs = i2c->regs;
>> +	struct i2c_msg *msg = msgs;
>> +	int i;
>> +	u8 finished;
>> +
>> +	i2c->addr = msg->addr;
>> +	i2c->is_read = !!(msg->flags & I2C_M_RD);
>> +	i2c->len = msg->len;
>> +
>> +	zxi2c_reset_fifo(i2c);
> this means that at every fifo_xfer we are going to try resetting
> up to 50 times, right?


Yes, will fix as above.


>> +	enable_fifo_mode(regs);
>> +
>> +	clear_irq_status(regs);
>> +	zxi2c_enable_irq(regs, IRQ_EN_FIFOEND, true);
>> +
>> +	zxi2c_set_wr(regs, i2c->is_read);
>> +	if (i2c->is_read) {
>> +		set_fifo_rd_len(regs, msg->len - 1);
>> +	} else {
>> +		set_fifo_wr_len(regs, msg->len - 1);
>> +		for (i = 0; i < msg->len; i++)
>> +			set_fifo_byte(regs, msg->buf[i]);
>> +	}
>> +
>> +	zxi2c_start(i2c);
>> +	if (zxi2c_wait_event(i2c, IRQ_STS_FIFOEND))
>> +		return -ENODEV;
>> +
>> +	if (i2c->is_read) {
>> +		finished = get_fifo_rd_cnt(regs);
>> +		for (i = 0; i < finished; i++)
>> +			msg->buf[i] = get_fifo_byte(regs);
>> +	} else {
>> +		finished = get_fifo_wr_cnt(regs);
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
>> +	}
>> +
>> +	zxi2c_enable_irq(regs, IRQ_EN_FIFOEND, false);
>> +	return 1;
>> +}
>> +
>> +static int zxi2c_master_xfer(struct i2c_adapter *adap,
>> +			     struct i2c_msg *msgs, int num)
>> +{
>> +	int error;
>> +	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
>> +
>> +	if (!is_ready(i2c->regs)) {
>> +		zxi2c_module_reset(i2c);
>> +		zxi2c_set_bus_speed(i2c);
>> +		dev_err(i2c->dev, "controller busy, reset try again\n");
>> +
>> +		return -EAGAIN;
> before returning we could eventually try checking again whether
> the controller is ready:
>
> 	if (!is_ready(i2c->regs)) {
> 		dev_warn("device not ready\n");
>
> 		module_reset();
> 		set_bus_speed();
>
> 		if (!is_ready(i2c->regs)) {
> 			dev_err()
> 			return -EBUSY;
> 		}
> 	}


Thank you, this is the better way, will take it.


>> +	}
>> +
>> +	if (num == 1 && msgs->len <= FIFO_SIZE && msgs->len >= 3)
>> +		error = zxi2c_fifo_xfer(i2c, msgs);
>> +	else
>> +		error = zxi2c_byte_xfer(i2c, msgs, num);
>> +
>> +	return error;
>> +}
>> +
>> +static u32 zxi2c_func(struct i2c_adapter *adap)
>> +{
>> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> how is smbus supported here?
>

Sorry, I'm not sure about your question. I thought it could support by
i2c_smbus_xfer_emulated() -> ... -> master_xfer() ?


>> +}
> [...]
>
>> +static int zxi2c_probe(struct platform_device *pdev)
>> +{
>> +	int error;
>> +	struct zxi2c *i2c;
>> +	struct pci_dev *pci;
>> +	struct device *dev;
>> +
>> +	/* make sure this is zhaoxin platform */
>> +	dev = pdev->dev.parent;
>> +	if (dev && dev_is_pci(dev)) {
>> +		pci = to_pci_dev(dev);
>> +		if (pci->vendor != 0x1d17 || pci->device != 0x1001)
> let's define vendor and device values?
>

will define them


>> +			return -ENODEV;
>> +	} else {
>> +		return -ENODEV;
>> +	}
>> +
>> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
>> +	if (IS_ERR(i2c)) {
>> +		return dev_err_probe(&pdev->dev, -ENOMEM,
>> +				"devm_kzalloc failed\n");
>> +	}
> no need for brackets here

will fix it


Thank you,

Hans

> Looks good!
>
> Thanks,
> Andi
>
>> +
>> +	i2c->pci = pci;
>> +	i2c->dev = &pdev->dev;
>> +	error = zxi2c_parse_resources(i2c);
>> +	if (error)
>> +		return error;
