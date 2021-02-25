Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8282325143
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 15:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhBYOIO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 09:08:14 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:38669 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232549AbhBYOIN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Feb 2021 09:08:13 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=zhangliguang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UPYfGtW_1614262019;
Received: from 30.39.207.232(mailfrom:zhangliguang@linux.alibaba.com fp:SMTPD_---0UPYfGtW_1614262019)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Feb 2021 22:07:00 +0800
Subject: Re: [PATCH] i2c: designware: Get right data length
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210225023528.121135-1-zhangliguang@linux.alibaba.com>
 <YDeH27Vgble8FetC@smile.fi.intel.com>
From:   =?UTF-8?B?5Lmx55+z?= <zhangliguang@linux.alibaba.com>
Message-ID: <c89a0aa3-b580-7726-e7d7-4b3ce103e90a@linux.alibaba.com>
Date:   Thu, 25 Feb 2021 22:06:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDeH27Vgble8FetC@smile.fi.intel.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,
ÔÚ 2021/2/25 19:19, Andy Shevchenko Ð´µÀ:
> On Thu, Feb 25, 2021 at 10:35:28AM +0800, Liguang Zhang wrote:
>> IC_DATA_CMD[11] indicates the first data byte received after the address
>> phase for receive transfer in Master receiver or Slave receiver mode,
>> this bit was set in some transfer flow. IC_DATA_CMD[7:0] contains the
>> data to be transmitted or received on the I2C bus, so we should use the
>> lower 8 bits to get the right data length.
> Thanks for the report and fix!
> My comments below.

Thanks for your comments. I will optimize my code follow your comments 
and send v2 revision.

Regards,

Liguang

>
>> Signed-off-by: Liguang Zhang <zhangliguang@linux.alibaba.com>
>> ---
>>   drivers/i2c/busses/i2c-designware-master.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>> index d6425ad6e6a3..c3cf76f6c607 100644
>> --- a/drivers/i2c/busses/i2c-designware-master.c
>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>> @@ -432,7 +432,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>>   			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
>>   			/* Ensure length byte is a valid value */
>>   			if (flags & I2C_M_RECV_LEN &&
>> -			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
>> +			    (tmp & 0xff) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
> Can we rather describe this as
>
> #define DW_IC_DATA_CMD_DAT   GENMASK(7, 0)
>
> in *.h file and...
>
> 			    (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
> ...here?
>
>>   				len = i2c_dw_recv_len(dev, tmp);
>>   			}
>>   			*buf++ = tmp;
>> -- 
>> 2.19.1.6.gb485710b
>>
