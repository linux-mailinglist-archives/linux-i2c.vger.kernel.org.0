Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5D70609CE9
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 10:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiJXIik (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 04:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiJXIij (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 04:38:39 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDAA6704C
        for <linux-i2c@vger.kernel.org>; Mon, 24 Oct 2022 01:38:35 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MwpLX5ynxzJn9f;
        Mon, 24 Oct 2022 16:35:48 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 16:38:33 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 16:38:32 +0800
Subject: Re: [PATCH v2] i2c: core: Fix possible memleak in
 i2c_new_client_device()
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <yangyingliang@huawei.com>, <wsa@kernel.org>
References: <20220511012738.3031346-1-yangyingliang@huawei.com>
Message-ID: <b69133e9-5c36-a6c9-bde5-5844ebd979b0@huawei.com>
Date:   Mon, 24 Oct 2022 16:38:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220511012738.3031346-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Sang

According the document of device_register(), it shouldn't free @dev after
calling this function, even if it returned an error, always use 
put_device() to
give up the reference initialized in this function instead.
It will cleanup the name of device. Is this patch good to you ?

Thanks,
Yang
On 2022/5/11 9:27, Yang Yingliang wrote:
> I got memory leak as follows when doing fault injection test:
>
> unreferenced object 0xffff888014aec078 (size 8):
>    comm "xrun", pid 356, jiffies 4294910619 (age 16.332s)
>    hex dump (first 8 bytes):
>      31 2d 30 30 31 63 00 00                          1-001c..
>    backtrace:
>      [<00000000eb56c0a9>] __kmalloc_track_caller+0x1a6/0x300
>      [<000000000b220ea3>] kvasprintf+0xad/0x140
>      [<00000000b83203e5>] kvasprintf_const+0x62/0x190
>      [<000000002a5eab37>] kobject_set_name_vargs+0x56/0x140
>      [<00000000300ac279>] dev_set_name+0xb0/0xe0
>      [<00000000b66ebd6f>] i2c_new_client_device+0x7e4/0x9a0
>
> In error path after calling dev_set_name() which called by
> i2c_dev_set_name(), the put_device() should be used to give up
> the device reference, then the name allocated in dev_set_name()
> will be freed in kobject_cleanup().
> In this patch, I splited device_register() into device_initialize()
> and device_add() to make the code more clear.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2:
>    split device_register() into device_initialize() and device_add()
> ---
>   drivers/i2c/i2c-core-base.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index d43db2c3876e..e7dded8b037b 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -928,6 +928,11 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>   	client->flags = info->flags;
>   	client->addr = info->addr;
>   
> +	client->dev.parent = &client->adapter->dev;
> +	client->dev.bus = &i2c_bus_type;
> +	client->dev.type = &i2c_client_type;
> +	device_initialize(&client->dev);
> +
>   	client->init_irq = info->irq;
>   	if (!client->init_irq)
>   		client->init_irq = i2c_dev_irq_from_resources(info->resources,
> @@ -947,9 +952,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>   	if (status)
>   		goto out_err;
>   
> -	client->dev.parent = &client->adapter->dev;
> -	client->dev.bus = &i2c_bus_type;
> -	client->dev.type = &i2c_client_type;
>   	client->dev.of_node = of_node_get(info->of_node);
>   	client->dev.fwnode = info->fwnode;
>   
> @@ -966,7 +968,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>   		}
>   	}
>   
> -	status = device_register(&client->dev);
> +	status = device_add(&client->dev);
>   	if (status)
>   		goto out_remove_swnode;
>   
> @@ -984,7 +986,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>   		"Failed to register i2c client %s at 0x%02x (%d)\n",
>   		client->name, client->addr, status);
>   out_err_silent:
> -	kfree(client);
> +	put_device(&client->dev);
>   	return ERR_PTR(status);
>   }
>   EXPORT_SYMBOL_GPL(i2c_new_client_device);
