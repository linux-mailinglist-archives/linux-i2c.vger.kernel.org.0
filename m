Return-Path: <linux-i2c+bounces-6259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172F96DE8B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 17:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2D7DB22623
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C32319E80F;
	Thu,  5 Sep 2024 15:40:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3D19E7F6;
	Thu,  5 Sep 2024 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725550806; cv=none; b=l0HULVZ+/Plj/M0mPdlB30hnOzKw/t6TjlEQCzP4QSKgNuPzcjOZ6LvllhIviGH1BOaH4GPegBwWTZHh4eQMipuiaL7bKi8bytWkxW1hnZ3WnJ4K7bY9gfVxDe7/k7dRAGD7HvIDoUjl5dioFGfEyXeO54jef97l173PGOi7QAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725550806; c=relaxed/simple;
	bh=EPTiZwhQ37GUa+OpUKm+nEhH6DWaqYgDjs99p9Cje+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qLRtOrqzBEU1NBEPk0s3FhPso4qwnN4CMFat28Xl0nsRNnriljprPVLNVJy09w+B+QsxayiBOhLg6zVUlWWFvlS578hMDvlPzFzphYaMqZ/F3cIOw2syNpiU/t/2DCUyn0i/fw7VYUS/j0kSqD3ZuHSC7cf6QrXGQBtGAo1eVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X03S511L5zyR9y;
	Thu,  5 Sep 2024 23:39:01 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 609C11800CF;
	Thu,  5 Sep 2024 23:40:00 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 5 Sep 2024 23:39:59 +0800
Message-ID: <0915517c-50ff-4867-9b6d-e55357d0ed0f@huawei.com>
Date: Thu, 5 Sep 2024 23:39:58 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 19/19] hwmon: (nzxt-smart2) Use
 devm_hid_hw_start_and_open in nzxt_smart2_hid_probe()
To: Guenter Roeck <linux@roeck-us.net>, <jikos@kernel.org>,
	<bentiss@kernel.org>, <michael.zaidman@gmail.com>, <gupt21@gmail.com>,
	<djogorchock@gmail.com>, <rrameshbabu@nvidia.com>,
	<bonbons@linux-vserver.org>, <roderick.colenbrander@sony.com>,
	<david@readahead.eu>, <savicaleksa83@gmail.com>, <me@jackdoan.com>,
	<jdelvare@suse.com>, <mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>,
	<jonas@protocubo.io>, <mezin.alexander@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-20-lizetao1@huawei.com>
 <eb7ffcbb-1e6c-448b-a09f-e10fd187a1ef@roeck-us.net>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <eb7ffcbb-1e6c-448b-a09f-e10fd187a1ef@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggpeml500017.china.huawei.com (7.185.36.243) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Hi,

在 2024/9/4 22:14, Guenter Roeck 写道:
> On 9/4/24 05:36, Li Zetao wrote:
>> Currently, the nzxt-smart2 module needs to maintain hid resources
>> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> 
> For all patches:
> 
> s/Consider using/Use/
ok
> 
>> that hid resources are consistent with the device life cycle, and release
>> hid resources before device is released. At the same time, it can avoid
>> the goto-release encoding, drop the out_hw_close and out_hw_stop
>> lables, and directly return the error code when an error occurs.
>>
>> Signed-off-by: Li Zetao <lizetao1@huawei.com>
>> ---
>>   drivers/hwmon/nzxt-smart2.c | 22 +++-------------------
>>   1 file changed, 3 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
>> index df6fa72a6b59..b5721a42c0d3 100644
>> --- a/drivers/hwmon/nzxt-smart2.c
>> +++ b/drivers/hwmon/nzxt-smart2.c
>> @@ -750,14 +750,10 @@ static int nzxt_smart2_hid_probe(struct 
>> hid_device *hdev,
>>       if (ret)
>>           return ret;
>> -    ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
>> +    ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
>>       if (ret)
>>           return ret;
>> -    ret = hid_hw_open(hdev);
>> -    if (ret)
>> -        goto out_hw_stop;
>> -
>>       hid_device_io_start(hdev);
>>       init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
>> @@ -765,19 +761,10 @@ static int nzxt_smart2_hid_probe(struct 
>> hid_device *hdev,
>>       drvdata->hwmon =
>>           hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", 
>> drvdata,
>>                           &nzxt_smart2_chip_info, NULL);
>> -    if (IS_ERR(drvdata->hwmon)) {
>> -        ret = PTR_ERR(drvdata->hwmon);
>> -        goto out_hw_close;
>> -    }
>> +    if (IS_ERR(drvdata->hwmon))
>> +        return PTR_ERR(drvdata->hwmon);
>>       return 0;
> 
>      return PTR_ERR_OR_ZERO(drvdata->hwmon);
> 
> Also, this can be optimized further.
> 
>      struct device *hwmon;    // and drop from struct drvdata
>      ...
>      hwmon = devm_hwmon_device_register_with_info(&hdev->dev, 
> "nzxtsmart2", drvdata,
>                               &nzxt_smart2_chip_info, NULL);
> 
>      return PTR_ERR_OR_ZERO(hwmon);
> 
> and drop the remove function entirely.
Benjamin mentioned that there are unsafe scenarios in 
hid_hw_close_and_stop, and it is necessary to ensure that the driver can 
not use manual kzalloc/kfree. So, to be extra safe, I would delete 
.remove in v2.
> 
> Thanks,
> Guenter
> 
>> -
>> -out_hw_close:
>> -    hid_hw_close(hdev);
>> -
>> -out_hw_stop:
>> -    hid_hw_stop(hdev);
>> -    return ret;
>>   }
>>   static void nzxt_smart2_hid_remove(struct hid_device *hdev)
>> @@ -785,9 +772,6 @@ static void nzxt_smart2_hid_remove(struct 
>> hid_device *hdev)
>>       struct drvdata *drvdata = hid_get_drvdata(hdev);
>>       hwmon_device_unregister(drvdata->hwmon);
>> -
>> -    hid_hw_close(hdev);
>> -    hid_hw_stop(hdev);
>>   }
>>   static const struct hid_device_id nzxt_smart2_hid_id_table[] = {
> 

