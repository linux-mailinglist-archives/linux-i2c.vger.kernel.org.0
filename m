Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEB819ACF
	for <lists+linux-i2c@lfdr.de>; Fri, 10 May 2019 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfEJJhw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 May 2019 05:37:52 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7189 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727066AbfEJJhw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 May 2019 05:37:52 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E318B66D1C6EAE652223;
        Fri, 10 May 2019 17:37:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.180) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 10 May 2019
 17:37:43 +0800
Subject: Re: [PATCH 3/3] i2c: i801: avoid panic if ioreamp fails
To:     Jean Delvare <jdelvare@suse.de>
CC:     <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
References: <20190510030320.109154-1-wangkefeng.wang@huawei.com>
 <20190510030320.109154-3-wangkefeng.wang@huawei.com>
 <20190510100955.497a1a57@endymion>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <164bb498-35dc-b226-4adb-3d743f4790a1@huawei.com>
Date:   Fri, 10 May 2019 17:35:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190510100955.497a1a57@endymion>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.177.19.180]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2019/5/10 16:09, Jean Delvare wrote:
> Hi Kefeng,
>
> On Fri, 10 May 2019 11:03:20 +0800, Kefeng Wang wrote:
>> If ioremap fails, NULL pointer dereference will happen and
>> leading to a kernel panic when access the virtual address
>> in check_signature().
>>
>> Fix it by check the return value of ioremap.
>>
>> Cc: Jean Delvare <jdelvare@suse.com>
>> Cc: Wolfram Sang <wsa@the-dreams.de>
>> Cc: linux-i2c@vger.kernel.org
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 679c6c41f64b..fc6ccb8aba17 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1068,7 +1068,10 @@ static void __init input_apanel_init(void)
>>  	void __iomem *bios;
>>  	const void __iomem *p;
>>  
>> -	bios = ioremap(0xF0000, 0x10000); /* Can't fail */
>> +	bios = ioremap(0xF0000, 0x10000);
>> +	if (!base)
> That would be "if (!bios)". Please don't send patches without at least
> test-building the result.
sorry,  copy error.

> We don't need this anyway. The comment says it can't fail, so why
> bother checking for a condition which will never happen?

The ioremap could fails due to no memory, our inner test robot(enable FAULT_INJECTION)

find this issue.


>
>> +		return -ENOMEM;
>> +
>>  	p = bios_signature(bios);
>>  	if (p) {
>>  		/* just use the first address */
>

