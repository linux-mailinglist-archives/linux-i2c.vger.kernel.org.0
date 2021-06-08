Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2F639F4FD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 13:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbhFHLcj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 07:32:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3471 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbhFHLcj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 07:32:39 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fznz20fLnz6tv8;
        Tue,  8 Jun 2021 19:27:42 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 19:30:45 +0800
Received: from [10.174.178.208] (10.174.178.208) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 8 Jun 2021 19:30:38 +0800
Subject: Re: [PATCH -next] i2c: Fix missing pci_disable_device() on error in
 ali1535_setup()
To:     Jean Delvare <jdelvare@suse.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1623036068-30668-1-git-send-email-zou_wei@huawei.com>
 <20210608114636.65512e28@endymion>
From:   Samuel Zou <zou_wei@huawei.com>
Message-ID: <f88681e2-8156-5824-8d03-f5004dc489f3@huawei.com>
Date:   Tue, 8 Jun 2021 19:30:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210608114636.65512e28@endymion>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

Thanks for your review and detailed explanation.

On 2021/6/8 17:46, Jean Delvare wrote:
> Hi Wei,
> 
> On Mon, 07 Jun 2021 11:21:08 +0800, Zou Wei wrote:
>> Fix the missing pci_disable_device() before return
>> from ali1535_setup() in the error handling case.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
>> ---
>>   drivers/i2c/busses/i2c-ali1535.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
>> index fb93152..bdbaf79 100644
>> --- a/drivers/i2c/busses/i2c-ali1535.c
>> +++ b/drivers/i2c/busses/i2c-ali1535.c
>> @@ -206,6 +206,7 @@ static int ali1535_setup(struct pci_dev *dev)
>>   exit_free:
>>   	release_region(ali1535_smba, ALI1535_SMB_IOSIZE);
>>   exit:
>> +	pci_disable_device(dev);
>>   	return retval;
>>   }
>>   
> 
> We don't actually want to disable the PCI device. Maybe it was already
> enabled before the driver was loaded, and maybe the BIOS needs the
> device when the system is being shut down. You'll notice that we do not
> call pci_disable_device(dev) in ali1535_remove(), so there's no reason
> to do it in the error path.
> 
> As a matter of fact the i2c-i801 driver, which is used on the same kind
> of hardware, has the following note in its remove function:
> 
> 	/*
> 	 * do not call pci_disable_device(dev) since it can cause hard hangs on
> 	 * some systems during power-off (eg. Fujitsu-Siemens Lifebook E8010)
> 	 */
> 
> So this is a nack from me, sorry.
> 
