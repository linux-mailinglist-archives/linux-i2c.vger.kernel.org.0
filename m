Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97E860F701
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Oct 2022 14:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbiJ0MSr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Oct 2022 08:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiJ0MSo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Oct 2022 08:18:44 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6542B13331B;
        Thu, 27 Oct 2022 05:18:42 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Myl2f1twcz15MC7;
        Thu, 27 Oct 2022 20:13:46 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 20:18:40 +0800
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 20:18:40 +0800
Message-ID: <4c9fba3b-2650-7bdc-91a8-75f01de4856a@huawei.com>
Date:   Thu, 27 Oct 2022 20:18:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH] i2c: piix4: Fix adapter not be removed in piix4_remove()
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
CC:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <wsa@kernel.org>
References: <20221025024456.110090-1-chenzhongjin@huawei.com>
 <20221027131051.796d6a36@endymion.delvare>
From:   Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <20221027131051.796d6a36@endymion.delvare>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On 2022/10/27 19:10, Jean Delvare wrote:
> Hi Chen,
>
> On Tue, 25 Oct 2022 10:44:56 +0800, Chen Zhongjin wrote:
>> In piix4_probe(), the piix4 adapter will be registered in:
>>
>>     piix4_probe()
>>       piix4_add_adapters_sb800() / piix4_add_adapter()
>>         i2c_add_adapter()
>>
>> Based on the probed device type, piix4_add_adapters_sb800() or single
>> piix4_add_adapter() will be called.
>> For the former case, piix4_adapter_count is set as the number of adapters,
>> while for antoher case it is not set and kept default *zero*.
>>
>> When piix4 is removed, piix4_remove() removes the adapters added in
>> piix4_probe(), basing on the piix4_adapter_count value.
>> Because the count is zero for the single adapter case, the adapter won't
>> be removed and makes the sources allocated for adapter leaked, such as
>> the i2c client and device.
>>
>> These sources can still be accessed by i2c or bus and cause problems.
>> An easily reproduced case is that if a new adapter is registered, i2c
>> will get the leaked adapter and try to call smbus_algorithm, which was
>> already freed:
>>
>> Triggered by: rmmod i2c_piix4 & modprobe max31730
>>
>>   BUG: unable to handle page fault for address: ffffffffc053d860
>>   #PF: supervisor read access in kernel mode
>>   #PF: error_code(0x0000) - not-present page
>>   Oops: 0000 [#1] PREEMPT SMP KASAN
>>   CPU: 0 PID: 3752 Comm: modprobe Tainted: G
>>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>>   RIP: 0010:i2c_default_probe (drivers/i2c/i2c-core-base.c:2259) i2c_core
>>   RSP: 0018:ffff888107477710 EFLAGS: 00000246
>>   ...
>>   <TASK>
>>    i2c_detect (drivers/i2c/i2c-core-base.c:2302) i2c_core
>>    __process_new_driver (drivers/i2c/i2c-core-base.c:1336) i2c_core
>>    bus_for_each_dev (drivers/base/bus.c:301)
>>    i2c_for_each_dev (drivers/i2c/i2c-core-base.c:1823) i2c_core
>>    i2c_register_driver (drivers/i2c/i2c-core-base.c:1861) i2c_core
>>    do_one_initcall (init/main.c:1296)
>>    do_init_module (kernel/module/main.c:2455)
>>    ...
>>   </TASK>
>>   ---[ end trace 0000000000000000 ]---
>>
>> Fix this problem by correctly set piix4_adapter_count for the single
>> adapter path so the adapter can be normally removed in piix4_remove().
>>
>> Fixes: 528d53a1592b ("i2c: piix4: Fix probing of reserved ports on AMD Family 16h Model 30h")
>> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> Nice catch, and sorry for introducing this bug in the first place.
>
> I'm not fully happy with your fix though.
>
>> ---
>>   drivers/i2c/busses/i2c-piix4.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
>> index 39cb1b7bb865..125646fd36dc 100644
>> --- a/drivers/i2c/busses/i2c-piix4.c
>> +++ b/drivers/i2c/busses/i2c-piix4.c
>> @@ -1080,6 +1080,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>   					   "", &piix4_main_adapters[0]);
>>   		if (retval < 0)
>>   			return retval;
>> +		piix4_adapter_count++;
>>   	}
>>   
>>   	/* Check for auxiliary SMBus on some AMD chipsets */
> Fundamentally, you want to set piix4_adapter_count to 1. You use ++
> based on the assumption that piix4_adapter_count is 0 initially. While
> this is true upon loading the driver, it would no longer be true is an
> adapter has already been registered and then unregistered without
> unloading the driver. This could happen if the SMBus controller is
> hot-plugged/unplugged (I am not aware of this happening in the real
> world, to be honest) or if the system owner manually unbinds then
> rebinds the device to the i2c-piix4 driver (something a kernel
> developer could legitimately do to exercise or otherwise test the
> probing and removal code paths of the driver).

Thanks for your review and advice!

You are right that piix4_adapter_count should be set to 1.

Had sent v2 to fix it.


Best,

Chen

> So I think that the following sequence would cause piix4_adapter_count
> to grow beyond PIIX4_MAX_ADAPTERS with your patch applied (adjust the
> PCI device bus location according to your system), which in turn would
> result in an array overrun in piix4_remove():
>
> # for n in `seq 1 8` ; do echo "0000:00:14.0" > /sys/bus/pci/drivers/piix4_smbus/unbind ; echo "0000:00:14.0" > /sys/bus/pci/drivers/piix4_smbus/bind ; done
>
> For this reason, I am asking that you explicitly set
> piix4_adapter_count to 1 instead of incrementing it.
>
> Thanks,
