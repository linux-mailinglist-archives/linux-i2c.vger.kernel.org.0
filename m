Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15FE5430E01
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 05:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhJRDFi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Oct 2021 23:05:38 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:25161 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhJRDFh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Oct 2021 23:05:37 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HXhVG25CFz1DHhB;
        Mon, 18 Oct 2021 11:01:42 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 18 Oct 2021 11:03:25 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 18 Oct 2021 11:03:25 +0800
Subject: Re: [PATCH] i2c: core: Fix possible memleak in
 i2c_new_client_device()
To:     Wolfram Sang <wsa@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <20211015095541.3611223-1-yangyingliang@huawei.com>
 <YWxA1nyTdFbwFD4N@ninjato>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <f2ae728a-d816-02d3-cefd-500a74f08003@huawei.com>
Date:   Mon, 18 Oct 2021 11:03:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YWxA1nyTdFbwFD4N@ninjato>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 2021/10/17 23:27, Wolfram Sang wrote:
>> In error path after calling i2c_dev_set_name(), the put_device()
>> should be used to give up the device reference, then the name
>> allocated in dev_set_name() will be freed in kobject_cleanup().
> I don't see it. dev_set_name does not call device_get, so why should we
> call device_put on failure? No other user of dev_set_name seems to do
> this. So, if this is an imbalance, where does the unmatched get_device
> really come from?
The reference is initialized in device_initialize() called in 
device_register(), if device_register()
fails, the 'kobj->name' is leaked.

Thanks,
Yang
>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/i2c/i2c-core-base.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 54964fbe3f03..190d4fd5e594 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -1047,8 +1047,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>>   	client->dev.of_node = of_node_get(info->of_node);
>>   	client->dev.fwnode = info->fwnode;
>>   
>> -	i2c_dev_set_name(adap, client, info);
>> -
>>   	if (info->swnode) {
>>   		status = device_add_software_node(&client->dev, info->swnode);
>>   		if (status) {
>> @@ -1059,17 +1057,20 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>>   		}
>>   	}
>>   
>> +	i2c_dev_set_name(adap, client, info);
>>   	status = device_register(&client->dev);
>> -	if (status)
>> -		goto out_remove_swnode;
>> +	if (status) {
>> +		device_remove_software_node(&client->dev);
>> +		of_node_put(info->of_node);
>> +		put_device(&client->dev);
>> +		return ERR_PTR(status);
>> +	}
>>   
>>   	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
>>   		client->name, dev_name(&client->dev));
>>   
>>   	return client;
>>   
>> -out_remove_swnode:
>> -	device_remove_software_node(&client->dev);
>>   out_err_put_of_node:
>>   	of_node_put(info->of_node);
>>   out_err:
>> -- 
>> 2.25.1
>>
