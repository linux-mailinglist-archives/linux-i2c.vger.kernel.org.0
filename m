Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12546482D3
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 14:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiLINgT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 08:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLINgS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 08:36:18 -0500
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BAB1C925;
        Fri,  9 Dec 2022 05:36:16 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B9Covgb017285;
        Fri, 9 Dec 2022 07:36:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=JDDhfRPCulDaOnhemyJ6yfUpKVtJKrsDBP+FxmOJD8M=;
 b=jYvSUpxt+Qt6u40vZvSnjwwkCTP1OVxxRdJPhQ5WYpICnHyDuwJHY3/XWpixtYpFUwP4
 vyBdKPUayodcYCDNA6WMtVOZTkL4tV9PWzsU6o1Ln7KHBmDHPsrAng0bl4wGoRMcLtFe
 VQxSPdsqbgZGH9Fv11Wow6U6SE7DYIJb0yhyXCLcfDhAoKMMO9sCVlwTn+zPlB9Qavs5
 roOKPhNVNgCaVGH6BMBOerMzPPH9Cef06GwZe00aCMb85DUz/wVxDyZStho6ZRkE0Sz3
 9Adj1YsEDGUIjqFHulX3d8IS3p2LSb1rfFR6cnPcnHCaabGxYaje/ZsSEzPdBi5tddgz pQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3matyutjgf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Dec 2022 07:36:09 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 9 Dec
 2022 07:36:08 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 9 Dec 2022 07:36:08 -0600
Received: from [198.61.65.44] (EDIN4L06LR3.ad.cirrus.com [198.61.65.44])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D3A8DB0E;
        Fri,  9 Dec 2022 13:36:07 +0000 (UTC)
Message-ID: <e8b6733c-33b8-cb28-a62b-21dad9bd6466@opensource.cirrus.com>
Date:   Fri, 9 Dec 2022 13:36:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] i2c: designware: Fix unbalanced suspended flag
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, <wsa@kernel.org>,
        <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20221209114034.18025-1-rf@opensource.cirrus.com>
 <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ecPXIxk8avJiXEUx7JF1gn6x33M6WQZD
X-Proofpoint-GUID: ecPXIxk8avJiXEUx7JF1gn6x33M6WQZD
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/12/22 12:15, Hans de Goede wrote:
> Hi Richard,
> 
> On 12/9/22 12:40, Richard Fitzgerald wrote:
>> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
>> i2c_mark_adapter_resumed().

<snip>

> 
> It is not entirely clear to me where the unbalance you claim to see comes
> from? When runtime-suspended SMART_SUSPEND should keep it suspended at which point
> the system suspend callback will never run ?
> 
> Are you sure that you are not maybe seeing a suspend/resume ordering issue?
> 
> Did you add printk messages to the suspend/resume callbacks of
> i2c-designware-platdrv.c which show the system suspend callback
> being called but not the system resume one ?
> 

With messages in strategic places.

[  169.607358] i2c_designware i2c_designware.2: PM: dev_pm_skip_suspend: 
SMART_SUSPEND=0 pm_runtime_status_suspended=1
[  169.607361] i2c_designware i2c_designware.2: PM: 
__device_suspend_late: dev_pm_skip_suspend:false
[  169.607364] i2c_designware i2c_designware.2: dw_i2c_plat_suspend
...
[  169.702511] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 
1 because !power.must_resume
[  169.706241] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 
1 because !power.must_resume
[  169.706244] i2c_designware i2c_designware.2: PM: device_resume_early: 
dev_pm_skip_resume:true
...
[  175.254832] i2c i2c-2: Transfer while suspended

(Just to prove my logging isn't lying, for i2c3 it reports
SMART_SUSPEND=1)

So it can skip the resume even if it didn't skip the suspend.
The SMART_SUSPEND flag is not set on i2c2 and the driver core can
skip resume even if it didn't skip suspend.
