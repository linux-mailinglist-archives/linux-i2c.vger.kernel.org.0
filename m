Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 440826163C6
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbiKBNXE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbiKBNXC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:23:02 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527E521820
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:23:01 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N2SDP3flHzJnK2;
        Wed,  2 Nov 2022 21:20:05 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:22:59 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:22:59 +0800
Subject: Re: [PATCH] Documentation: devres: add missing I2C helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, <yangyingliang@huawei.com>
References: <20221102034053.1708845-1-yangyingliang@huawei.com>
 <Y2JIpwqDinm5N1T2@smile.fi.intel.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <83ce64b4-1ece-64eb-eedd-b0e5ba06ac46@huawei.com>
Date:   Wed, 2 Nov 2022 21:22:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y2JIpwqDinm5N1T2@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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


On 2022/11/2 18:38, Andy Shevchenko wrote:
> On Wed, Nov 02, 2022 at 11:40:53AM +0800, Yang Yingliang wrote:
>> Add missing devm_i2c_add_adapter() to devres.rst. It's introduced by
>> commit 07740c92ae57 ("i2c: core: add managed function for adding i2c
>> adapters").
> Okay,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
>> Fixes: 07740c92ae57 ("i2c: core: add managed function for adding i2c adapters")
>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Dmitry Osipenko <digetx@gmail.com>
>> Cc: Wolfram Sang <wsa@kernel.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
> Next time, please use --cc when sending patches, instead of Cc'ing explicitly
> in the body of the message. The rationale is that we have this email in the
> archives anyway and every additional byte in the commit message is a waste of
> resources (storage, energy and as a result not so environment friendly).
OK, thanks for your advice.
>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   Documentation/driver-api/driver-model/devres.rst | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
>> index 853396d19419..ec97261530da 100644
>> --- a/Documentation/driver-api/driver-model/devres.rst
>> +++ b/Documentation/driver-api/driver-model/devres.rst
>> @@ -280,6 +280,7 @@ GPIO
>>   
>>   I2C
>>     devm_i2c_new_dummy_device()
>> +  devm_i2c_add_adapter()
> Perhaps keep this list ordered?
OK, I will send a v2 to change it with your review tag.

Thanks,
Yang
>
