Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1D66483B1
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 15:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiLIOX0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 09:23:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbiLIOXB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 09:23:01 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1243879C3C;
        Fri,  9 Dec 2022 06:22:23 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B9BV0sL002223;
        Fri, 9 Dec 2022 08:22:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=7Vf/NnD5hqlYQ4HFLY1/bMAp98qvmD/6f8WHOuGA/vI=;
 b=CIEH0F47CrqsMIppF+49tkG6phkANjPb9umP93SH+sZXt3aBqwrWkSz4Oq8r1YXBJlO4
 dmczxRgwU4Ig9jvNG9URUoxoaugoLyVHHEc7g24gAHQI+N3w+3MpMnWHB5Xak562y6eF
 OP8xXY+qbhHfj7VMlsdzbozpLDHpQa1XXpsmBZZ+vbp4mjC4eMuivWwVf4dRw+wjBG9J
 yFbHqHeaXyQDn3eyBixmYtRm3XcNzDRDXA5em/fHPeoAq7WEy6yGsDZXKXcw5GjDTZ1E
 th3XMAw0PUhyg8M99MT5yr2xgjKJH29Zb6R9fLc0MO85sUSyIedJxYLVJ1uecTl4Ezjj nQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3m84r6q21c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Dec 2022 08:22:17 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 9 Dec
 2022 08:22:15 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 9 Dec 2022 08:22:15 -0600
Received: from [198.61.65.44] (EDIN4L06LR3.ad.cirrus.com [198.61.65.44])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ED683B0E;
        Fri,  9 Dec 2022 14:22:14 +0000 (UTC)
Message-ID: <c210c1d6-7327-d377-22e7-b5a123de5cbb@opensource.cirrus.com>
Date:   Fri, 9 Dec 2022 14:22:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] i2c: designware: Fix unbalanced suspended flag
Content-Language: en-US
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
To:     Hans de Goede <hdegoede@redhat.com>, <wsa@kernel.org>,
        <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20221209114034.18025-1-rf@opensource.cirrus.com>
 <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
 <e8b6733c-33b8-cb28-a62b-21dad9bd6466@opensource.cirrus.com>
In-Reply-To: <e8b6733c-33b8-cb28-a62b-21dad9bd6466@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q7pN0TG89CDntNMOvXzFoLWqHK0zlIL1
X-Proofpoint-GUID: Q7pN0TG89CDntNMOvXzFoLWqHK0zlIL1
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/12/22 13:36, Richard Fitzgerald wrote:
> On 9/12/22 12:15, Hans de Goede wrote:
>> Hi Richard,
>>
>> On 12/9/22 12:40, Richard Fitzgerald wrote:
>>> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
>>> i2c_mark_adapter_resumed().
> 
> <snip>
> 
>>
>> It is not entirely clear to me where the unbalance you claim to see comes
>> from? When runtime-suspended SMART_SUSPEND should keep it suspended at 
>> which point
>> the system suspend callback will never run ?
>>
>> Are you sure that you are not maybe seeing a suspend/resume ordering 
>> issue?
>>
>> Did you add printk messages to the suspend/resume callbacks of
>> i2c-designware-platdrv.c which show the system suspend callback
>> being called but not the system resume one ?
>>
> 
> With messages in strategic places.
> 
> [  169.607358] i2c_designware i2c_designware.2: PM: dev_pm_skip_suspend: 
> SMART_SUSPEND=0 pm_runtime_status_suspended=1
> [  169.607361] i2c_designware i2c_designware.2: PM: 
> __device_suspend_late: dev_pm_skip_suspend:false
> [  169.607364] i2c_designware i2c_designware.2: dw_i2c_plat_suspend
> ...
> [  169.702511] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 
> 1 because !power.must_resume
> [  169.706241] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 
> 1 because !power.must_resume
> [  169.706244] i2c_designware i2c_designware.2: PM: device_resume_early: 
> dev_pm_skip_resume:true
> ...
> [  175.254832] i2c i2c-2: Transfer while suspended
> 
> (Just to prove my logging isn't lying, for i2c3 it reports
> SMART_SUSPEND=1)
> 

Oh, that's embarrassing. After confidently telling you my logging
is perfect, actually there was a bug in it...

New log summary:

[  162.253431] i2c_designware i2c_designware.2: PM: dev_pm_skip_suspend: 
SMART_SUSPEND=1 pm_runtime_status_suspended=0
[  162.253438] i2c_designware i2c_designware.2: PM: 
__device_suspend_late: dev_pm_skip_suspend:false
[  162.253445] i2c_designware i2c_designware.2: dw_i2c_plat_suspend
[  162.273115] i2c_designware i2c_designware.2: PM: dev_pm_skip_suspend: 
SMART_SUSPEND=1 pm_runtime_status_suspended=0
[  162.362547] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 
1 because !power.must_resume
[  162.369216] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 
1 because !power.must_resume
[  162.369220] i2c_designware i2c_designware.2: PM: device_resume_early: 
dev_pm_skip_resume:true
[  167.901269] i2c i2c-2: Transfer while suspended

Same result that it doesn't skip suspend but does skip resume.
