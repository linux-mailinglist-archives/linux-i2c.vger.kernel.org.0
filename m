Return-Path: <linux-i2c+bounces-6260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A87DA96DE98
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 17:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAF0B1C23314
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AAC19DF70;
	Thu,  5 Sep 2024 15:41:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B519DF5B;
	Thu,  5 Sep 2024 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725550910; cv=none; b=h2fsyLWoLLDNLzrdE/nmRWeVv+TSHUGeveb8yQyxKDFldJFmj+u/i5b/PqGOc5bXfLUUwtsh4aZBuZOcpj9k1wR95xeKiw9O0FJ0GMf+KxMtT04/s81WdOMS3l8aVwzB+xLzHfaAsRgTQD5C19NkNAiIG+glDPvwLRkTgBkQo8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725550910; c=relaxed/simple;
	bh=YIJ6MhYRjD6g1JCNkHKfJvDZMhV8UYORDEJN9WsK2ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aHugZZwc/43pS8WyAc1vfssjkyoU0GDkdcxXvqkU4JwywraZ7P2pI/sfZYGPofaF04D7s5Qvd4MCB428XvyVSZDVQcyqj44V7A3QNaqB0yGknK4zEwoxi8GILnMdTbenVCgiS3t3S4aVmCf77BSBVCLx9Ts8ZUxQmgXfGiz9/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X03Sn0XRFzfbkb;
	Thu,  5 Sep 2024 23:39:37 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id D57401800CF;
	Thu,  5 Sep 2024 23:41:44 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 5 Sep 2024 23:41:44 +0800
Message-ID: <a38bb4ef-2943-4c66-bb5e-22b142356642@huawei.com>
Date: Thu, 5 Sep 2024 23:41:43 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 01/19] HID: core: Use devm_add_action_or_reset
 helper to manage hid resources
To: Benjamin Tissoires <bentiss@kernel.org>
CC: <jikos@kernel.org>, <michael.zaidman@gmail.com>, <gupt21@gmail.com>,
	<djogorchock@gmail.com>, <rrameshbabu@nvidia.com>,
	<bonbons@linux-vserver.org>, <roderick.colenbrander@sony.com>,
	<david@readahead.eu>, <savicaleksa83@gmail.com>, <me@jackdoan.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <mail@mariuszachmann.de>,
	<wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-2-lizetao1@huawei.com>
 <cyils23bh4xaiw7bydlpapz4ngqpya3c4kesifrdpnme2t4bib@6elk7u3wvhh2>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <cyils23bh4xaiw7bydlpapz4ngqpya3c4kesifrdpnme2t4bib@6elk7u3wvhh2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggpeml500017.china.huawei.com (7.185.36.243) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Hi,

在 2024/9/5 20:53, Benjamin Tissoires 写道:
> On Sep 04 2024, Li Zetao wrote:
>> By adding a custom action to the device, it can bind the hid resource
>> to the hid_device life cycle. The framework automatically close and stop
>> the hid resources before hid_device is released, and the users do not
>> need to pay attention to the timing of hid resource release.
>>
>> Signed-off-by: Li Zetao <lizetao1@huawei.com>
>> ---
>>   drivers/hid/hid-core.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>   include/linux/hid.h    |  2 ++
>>   2 files changed, 42 insertions(+)
>>
>> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
>> index 30de92d0bf0f..71143c0a4a02 100644
>> --- a/drivers/hid/hid-core.c
>> +++ b/drivers/hid/hid-core.c
>> @@ -2416,6 +2416,46 @@ void hid_hw_close(struct hid_device *hdev)
>>   }
>>   EXPORT_SYMBOL_GPL(hid_hw_close);
>>   
>> +static void hid_hw_close_and_stop(void *data)
>> +{
>> +	struct hid_device *hdev = data;
>> +
>> +	hid_hw_close(hdev);
>> +	hid_hw_stop(hdev);
>> +}
>> +
>> +/**
>> + * devm_hid_hw_start_and_open - manage hid resources through custom action
>> + *
>> + * @hdev: hid device
>> + * @connect_mask: which outputs to connect, see HID_CONNECT_*
>> + *
>> + * Bind the hid resource to the hid_device life cycle and register
>> + * an action to release the hid resource. The users do not need to
>> + * pay attention to the release of hid.
> 
> The only problem I see here is that this API is not completely "safe",
> in the sense that a driver using it can not use manual kzalloc/kfree.
> It is obvious, but probably not so much while looking at the comments
> from Guenter where he asked you to also remove the .remove() callback.
> 
> So in the docs, we should probably state that if the .remove() is any
> different than "hid_hw_close(hdev);hid_hw_stop(hdev);", care should be
> use with that function.I'll add some comments to illustrate a scenario like this.

> 
> Cheers,
> Benjamin
> 
>> + */
>> +
>> +int devm_hid_hw_start_and_open(struct hid_device *hdev, unsigned int connect_mask)
>> +{
>> +	int ret;
>> +
>> +	ret = hid_hw_start(hdev, connect_mask);
>> +	if (ret) {
>> +		hid_err(hdev, "hw start failed with %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = hid_hw_open(hdev);
>> +	if (ret) {
>> +		hid_err(hdev, "hw open failed with %d\n", ret);
>> +		hid_hw_stop(hdev);
>> +		return ret;
>> +	}
>> +
>> +	return devm_add_action_or_reset(&hdev->dev, hid_hw_close_and_stop, hdev);
>> +}
>> +EXPORT_SYMBOL_GPL(devm_hid_hw_start_and_open);
>> +
>>   /**
>>    * hid_hw_request - send report request to device
>>    *
>> diff --git a/include/linux/hid.h b/include/linux/hid.h
>> index 121d5b8bc867..0ce217aa5f62 100644
>> --- a/include/linux/hid.h
>> +++ b/include/linux/hid.h
>> @@ -1125,6 +1125,8 @@ int __must_check hid_hw_start(struct hid_device *hdev,
>>   void hid_hw_stop(struct hid_device *hdev);
>>   int __must_check hid_hw_open(struct hid_device *hdev);
>>   void hid_hw_close(struct hid_device *hdev);
>> +int __must_check devm_hid_hw_start_and_open(struct hid_device *hdev,
>> +					    unsigned int connect_mask);
>>   void hid_hw_request(struct hid_device *hdev,
>>   		    struct hid_report *report, enum hid_class_request reqtype);
>>   int __hid_hw_raw_request(struct hid_device *hdev,
>> -- 
>> 2.34.1
>>

Thanks,
Li Zetao.

