Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C03B6482D9
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 14:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiLINkQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 08:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiLINkP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 08:40:15 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFBD61753;
        Fri,  9 Dec 2022 05:40:14 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B98wKEn028996;
        Fri, 9 Dec 2022 07:40:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=xPd0NyK9frhII+YGZIo1j7uYwNvRWjApNwDYzQvfo2E=;
 b=J8Tb3b/6leVBuMwOr0UFxgLZbZBwngOb0zn2EzUE3UPxQuXyBo3muYJTRapBHLgo1i5M
 K2m6+erDKMnqrfvFpPtpwO/eLuHcs9boX6kZcm8AZ4LD357c/quL+laSYqLLLQS4Ixwg
 8iO+EjZcynpxcwUlUhhFo+7a3pP0nQGr0F5TaQDt+AyqJsJM1UvZfpVW2JdIJoKkC+Pn
 He+VpQNyX0PHpH0oal9pZhX2wuMpi3HHFs0KXQjFA6hMNQygIqmuFw14Q2+tsZMp6Zud
 dCaCn8Vk+IAsGWZftcGY3VgRvRW7thkq6jqH1CHwWBj6X2mb2VPc0Ygjjwi6CdcgIaSC Vw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3m84r6q0rk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Dec 2022 07:40:09 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 9 Dec
 2022 07:40:07 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 9 Dec 2022 07:40:07 -0600
Received: from [198.61.65.44] (EDIN4L06LR3.ad.cirrus.com [198.61.65.44])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D7B04B0E;
        Fri,  9 Dec 2022 13:40:06 +0000 (UTC)
Message-ID: <98a9b991-634c-f64e-d1c2-9cf92f5fe89f@opensource.cirrus.com>
Date:   Fri, 9 Dec 2022 13:40:06 +0000
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
X-Proofpoint-ORIG-GUID: S50n_Z6jH1QdjkJCtnyM8fW8uT0xJ-yY
X-Proofpoint-GUID: S50n_Z6jH1QdjkJCtnyM8fW8uT0xJ-yY
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
>>

> I'm afraid that this is always going to run now, before this callback gets
> called drivers/base/power/main.c: device_resume_noirq() does:
> 

Ok, what do you suggest as the fix?
If you post an alternate fix I can test it.
