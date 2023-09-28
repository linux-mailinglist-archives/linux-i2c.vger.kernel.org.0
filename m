Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C587B1153
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 05:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjI1Dtd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 23:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjI1Dtc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 23:49:32 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BAC10A;
        Wed, 27 Sep 2023 20:49:29 -0700 (PDT)
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RwzsM21YWzMltP;
        Thu, 28 Sep 2023 11:45:43 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm000004.china.huawei.com
 (7.193.23.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 28 Sep
 2023 11:49:26 +0800
Message-ID: <fbc038e3-9719-3f90-0c09-f26318e21f38@huawei.com>
Date:   Thu, 28 Sep 2023 11:49:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] ACPI: PCC: Add PCC shared memory region command and
 status bitfields
To:     Sudeep Holla <sudeep.holla@arm.com>
CC:     <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, <lihuisong@huawei.com>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
 <20230926-pcc_defines-v1-1-0f925a1658fd@arm.com>
 <a89bdd10-9388-01f5-6a7c-894af793e1c1@huawei.com>
 <20230927135909.6rssuywmj4k3odex@bogus>
From:   "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230927135909.6rssuywmj4k3odex@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2023/9/27 21:59, Sudeep Holla 写道:
> On Wed, Sep 27, 2023 at 10:07:15AM +0800, lihuisong (C) wrote:
>> Hi Sudeep,
>>
>> 在 2023/9/26 20:28, Sudeep Holla 写道:
>>> Define the common macros to use when referring to various bitfields in
>>> the PCC generic communications channel command and status fields.
>> Can you define the bit0 macros in the "flags" for Extended PCC Subspace
>> Shared Memory Region?
> Sure I will take a look and include it in v2 if applicable.
Thanks
>
>>> Currently different drivers that need to use these bitfields have defined
>>> these locally. This common macro is intended to consolidate and replace
>>> those.
>>>
>>> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>>> ---
>>>    include/acpi/pcc.h | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
>>> index 73e806fe7ce7..66d9934c2ee4 100644
>>> --- a/include/acpi/pcc.h
>>> +++ b/include/acpi/pcc.h
>>> @@ -18,7 +18,18 @@ struct pcc_mbox_chan {
>>>    	u16 min_turnaround_time;
>>>    };
>>> +/* Generic Communications Channel Shared Memory Region */
>>> +#define PCC_SIGNATURE			0x50424300
>> Why is this signature 0x50424300?
> It is as per the specification.
>
>> In ACPI spec, this signature is all 0x50434303.
> No, not exactly. It is just an example.
> The PCC signature - The signature of a subspace is computed by a bitwise-or
> of the value 0x50434300 with the subspace ID. For example, subspace 3 has
> signature 0x50434303
Sorry for my mistake. I know this.
I mean, why doesn't the following macro follow spec and define this 
signature as 0x504*3*430.
"#define PCC_SIGNATURE **0x504*2*4300*"*
Because it seems that all version of ACPI spec is 0x5043430.
>
> And I see the driver you mentioned(drivers/soc/hisilicon/kunpeng_hccs.c)
> is doing the right thing. I am bit confused as why you being the author
> of the driver are now confused.
I used 0x50424300 instead of 0x50424300 according to the spec.
>
