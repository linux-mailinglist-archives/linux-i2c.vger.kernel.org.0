Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D376034754F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 11:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhCXKHs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 06:07:48 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14574 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbhCXKHk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 06:07:40 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F53lD4WNqz19Fxj;
        Wed, 24 Mar 2021 18:05:28 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 18:07:17 +0800
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <prime.zeng@huawei.com>,
        <linuxarm@huawei.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
 <YFjNAvVTavCRt/C8@smile.fi.intel.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <67500acc-860b-5a00-4c2a-566ee9be4a6a@hisilicon.com>
Date:   Wed, 24 Mar 2021 18:07:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YFjNAvVTavCRt/C8@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Thanks for reviewing this.

On 2021/3/23 0:59, Andy Shevchenko wrote:
> On Mon, Mar 22, 2021 at 07:10:12PM +0800, Yicong Yang wrote:
>> Add HiSilicon I2C controller driver for the Kunpeng SoC. It provides
>> the access to the i2c busses, which connects to the eeprom, rtc, etc.
>>
>> The driver works with IRQ mode, and supports basic I2C features and 10bit
>> address. The DMA is not supported.
> 
> ...
> 
>> +#include <linux/acpi.h>
> 
> Hadn't noticed how you are using this header.

will remove this.

> 
>> +#include <linux/bits.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/completion.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
> 
> Missed mod_devicetable.h.
> Probably missed property.h, but not sure.>

i think this has been included implicitly as the module compilation worked well.


>> +#include <linux/platform_device.h>
> 
> ...
> 
>> +#define HISI_I2C_INT_ALL	0x1f
> 
> GENMASK() ?

will change to that.

> 
> ...
> 
>> +#define HISI_I2C_INT_ERR	(HISI_I2C_INT_TRANS_ERR | \
>> +				 HISI_I2C_INT_FIFO_ERR)
> 
> Either one line, or it will look better like
> #define HISI_I2C_INT_ERR					\
> 	(HISI_I2C_INT_TRANS_ERR | HISI_I2C_INT_FIFO_ERR)
> 

sure. that looks better.

> ...
> 
>> +#define HISI_I2C_STD_SPEED_MODE		0x0
>> +#define HISI_I2C_FAST_SPEED_MODE	0x1
>> +#define HISI_I2C_HIGH_SPEED_MODE	0x2
> 
> Why not plain decimal numbers?
> 

it's something will be written to the register, so i make them
hexadecimal to better corresponding to the register fields.

> ...
> 
>> +struct hisi_i2c_controller {
>> +	struct device *dev;
> 
>> +	struct i2c_adapter adapter;
> 
> If you put this as a first member, the container_of() become a no-op for this.
> But I dunno if it's used against this structure.
> 

the container_of() is not used in this drivers. but it's fine to swap these
two fields. thanks for the information.

>> +	void __iomem *iobase;
>> +	int irq;
>> +
>> +	/* Intermediates for recording the transfer process */
>> +	struct completion *completion;
>> +	struct i2c_msg *msgs;
>> +	int msg_num;
>> +	int msg_tx_idx;
>> +	int buf_tx_idx;
>> +	int msg_rx_idx;
>> +	int buf_rx_idx;
>> +	u16 tar_addr;
>> +	u32 xfer_err;
>> +
>> +	/* I2C bus configuration */
>> +	u32 scl_fall_time;
>> +	u32 scl_rise_time;
>> +	u32 sda_hold_time;
>> +	u64 clk_rate_khz;
>> +	u32 bus_freq_hz;
>> +	u32 spk_len;
>> +};
> 
> ...
> 
>> +	struct i2c_timings t;
>> +
>> +	i2c_parse_fw_timings(ctlr->dev, &t, true);
>> +	ctlr->bus_freq_hz = t.bus_freq_hz;
> 
>> +	ctlr->scl_fall_time = t.scl_fall_ns;
>> +	ctlr->scl_rise_time = t.scl_rise_ns;
>> +	ctlr->sda_hold_time = t.sda_hold_ns;
> 
> Why not simply to have the timings structure embedded into hisi_i2c_controller
> one?
> 

not all the fields of the timing structures are needed to be stored, only three
of them are necessary.

> ...
> 
>> +	ctlr->dev = dev;
> 
> Would it make sense to assign aster getting IRQ resource...
> 
>> +	ctlr->iobase = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(ctlr->iobase))
>> +		return PTR_ERR(ctlr->iobase);
>> +
>> +	ctlr->irq = platform_get_irq(pdev, 0);
>> +	if (ctlr->irq < 0)
>> +		return ctlr->irq;
> 
> ...somewhere here?

i cannot see any differences and some other drivers also assign the 'dev' before getting IRQ
resources.

are there any considerations on this?

> 
>> +	hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
> 
> ...
> 
>> +	ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(ctlr->clk_rate_khz, 1000);
> 
> HZ_PER_KHZ ?

the macro is not public. seems it's redundant to have this macro which
will only be used once.

Thanks,
Yicong

> 

