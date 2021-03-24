Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EDB3474AB
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 10:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbhCXJat (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 05:30:49 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14520 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234912AbhCXJaf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 05:30:35 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F52vw0ZzLzPkFQ;
        Wed, 24 Mar 2021 17:27:56 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 17:30:19 +0800
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
To:     Dmitry Osipenko <digetx@gmail.com>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <andriy.shevchenko@linux.intel.com>, <treding@nvidia.com>,
        <jarkko.nikula@linux.intel.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
 <7801d460-c1f4-5088-0ba0-47a07d187a2a@gmail.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <e18bec78-8913-2d11-00b9-e229688caae6@hisilicon.com>
Date:   Wed, 24 Mar 2021 17:30:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <7801d460-c1f4-5088-0ba0-47a07d187a2a@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dmitry,

Thanks for reviewing this.

On 2021/3/22 23:21, Dmitry Osipenko wrote:
> Hello Yicong,
> 
> 22.03.2021 14:10, Yicong Yang пишет:
>> Add HiSilicon I2C controller driver for the Kunpeng SoC. It provides
>> the access to the i2c busses, which connects to the eeprom, rtc, etc.
>>
>> The driver works with IRQ mode, and supports basic I2C features and 10bit
>> address. The DMA is not supported.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/i2c/busses/Kconfig    |  10 +
>>  drivers/i2c/busses/Makefile   |   1 +
>>  drivers/i2c/busses/i2c-hisi.c | 525 ++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 536 insertions(+)
>>  create mode 100644 drivers/i2c/busses/i2c-hisi.c
> 
> ...
>> +
>> +#define NSEC_TO_CYCLES(ns, clk_rate_khz) (DIV_ROUND_UP_ULL((clk_rate_khz) * (ns), NSEC_PER_MSEC))
> 
> This is a very long line, you should split it into two.

will split.

> 
> Parens around DIV_ROUND_UP_ULL aren't needed.
> 

will drop the parens.

> ...
>> +static void hisi_i2c_enable_int(struct hisi_i2c_controller *ctlr, u32 mask)
>> +{
>> +	writel(mask, ctlr->iobase + HISI_I2C_INT_MASK);
> 
> Why you don't use relaxed versions of readl/writel? Do you really need
> to insert memory barriers?
> 

this will not be used during the transfer process, so a relaxed version of readl/writel
will not have performance enhancement.

the barriers are necessary as i want to make the operations in order to avoid potential
problems caused by reordering.

>> +}
>> +
>> +static void hisi_i2c_disable_int(struct hisi_i2c_controller *ctlr, u32 mask)
>> +{
>> +	writel((~mask) & HISI_I2C_INT_ALL, ctlr->iobase + HISI_I2C_INT_MASK);
>> +}
>> +
>> +static void hisi_i2c_clear_int(struct hisi_i2c_controller *ctlr, u32 mask)
>> +{
>> +	writel(mask, ctlr->iobase + HISI_I2C_INT_CLR);
>> +}
>> +
>> +static void hisi_i2c_handle_errors(struct hisi_i2c_controller *ctlr)
>> +{
>> +	u32 int_err = ctlr->xfer_err, reg;
>> +
>> +	if (int_err & HISI_I2C_INT_FIFO_ERR) {
>> +		reg = readl(ctlr->iobase + HISI_I2C_FIFO_STATE);
>> +
>> +		if (reg & HISI_I2C_FIFO_STATE_RX_RERR)
>> +			dev_err(ctlr->dev, "rx fifo error read.\n");
> 
> The dot "." in the end of error messages is unnecessary.
> 

i'd like to keep this, as i think this is rather driver specific and not
violating any rules.

> ...
>> +/*
>> + * Initialize the transfer information and start the I2C bus transfer.
>> + * We only configure the transfer and do some pre/post works here, and
>> + * wait for the transfer done. The major transfer process is performed
>> + * in the IRQ handler.
>> + */
>> +static int hisi_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>> +				int num)
>> +{
>> +	struct hisi_i2c_controller *ctlr = i2c_get_adapdata(adap);
>> +	DECLARE_COMPLETION_ONSTACK(done);
>> +	int ret = num;
>> +
>> +	hisi_i2c_reset_xfer(ctlr);
>> +	ctlr->completion = &done;
>> +	ctlr->msg_num = num;
>> +	ctlr->msgs = msgs;
>> +
>> +	hisi_i2c_start_xfer(ctlr);
>> +
>> +	if (!wait_for_completion_timeout(ctlr->completion, adap->timeout)) {
>> +		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
> 
> This doesn't save you from racing with the interrupt handler. It looks
> like you need to enable/disable IRQ around the completion, similarly to
> what NVIDIA Tegra I2C driver does.
> 

thanks for suggestion.

the hardware between tegra and this one is a little different as we don't provide
a way to reinit the controller. so {synchronize,disable}_irq() after mask
the interrupt here will avoid the race.

Thanks,
Yicong

> .
> 

