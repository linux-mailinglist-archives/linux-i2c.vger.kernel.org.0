Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FDD1E281B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 19:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729965AbgEZRNz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 13:13:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49574 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbgEZRNy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 13:13:54 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QHDUvn063142;
        Tue, 26 May 2020 12:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590513210;
        bh=ejlDgcPP3cXkKRJfCcQk8SnvedIMryuVsn7rTYr6g6A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rX7IYOaiZRS795auwmZ93DPJry/1eKaDZtP+TGY07q0yt3Bq7GMsbZpzUi9q2jND2
         NB9OkVGNTr3/qYWGV2IKhHEwLZz4aanUsBhfIwEusBOl8udEaYBDpPt4bpoBuVwYl8
         28sTfFmw6IIyOfSOyzpPdPKk6d3EFpxolD+Egeoo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QHDUuE077132
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 May 2020 12:13:30 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 12:13:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 12:13:30 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QHDP4q025611;
        Tue, 26 May 2020 12:13:26 -0500
Subject: Re: [PATCH v2 0/2] drivers: provide devm_platform_request_irq()
To:     Michal Simek <michal.simek@xilinx.com>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <baruch@tkos.co.il>,
        <paul@crapouillou.net>, <khilman@baylibre.com>,
        <shawnguo@kernel.org>, <festevam@gmail.com>, <vz@mleia.com>,
        <heiko@sntech.de>, <linus.walleij@linaro.org>, <baohua@kernel.org>,
        <ardb@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200523145157.16257-1-zhengdejin5@gmail.com>
 <20200523160828.GE3459@ninjato> <20200523170933.GA16771@nuc8i5>
 <ad90d9b5-5906-fef3-85b8-00c7eff70e61@xilinx.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <52fdb5f6-2108-4857-8d0f-3f17ee863781@ti.com>
Date:   Tue, 26 May 2020 20:13:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ad90d9b5-5906-fef3-85b8-00c7eff70e61@xilinx.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 25/05/2020 10:05, Michal Simek wrote:
> On 23. 05. 20 19:09, Dejin Zheng wrote:
>> On Sat, May 23, 2020 at 06:08:29PM +0200, Wolfram Sang wrote:
>>> On Sat, May 23, 2020 at 10:51:55PM +0800, Dejin Zheng wrote:
>>>> It will call devm_request_irq() after platform_get_irq() function
>>>> in many drivers, sometimes, it is not right for the error handling
>>>> of these two functions in some drivers. so provide this function
>>>> to simplify the driver.
>>>>
>>>> the first patch will provide devm_platform_request_irq(), and the
>>>> other patch will convert to devm_platform_request_irq() in some
>>>> i2c bus dirver.
>>>>
>>>> v1 -> v2:
>>>> 	- I give up this series of patches in v1 version. I resend this
>>>> 	  patches v2 by that discussion:
>>>> 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
>>>> 	  The patch content has not changed.
>>>
>>> I don't understand. v1 has been nacked because of technical reasons. How
>>> did the discussion above change the situation? Am I missing something?
>>>
>> No, you are not missing something. Maybe I did not explain clearly.
>>
>> The v1 has been nacked because Grygorii told me that the
>> function platform_get_irq() should be done as early as possible to avoid
>> unnecessary initialization steps, and the function devm_request_irq()
>> should be done late in probe when driver and HW are actually ready to
>> handle IRQs. It can do the other things between the two funtions. I agree
>> with him that it may be necessary in some complex drives. So abandon the
>> patch v1.
>>
>> Base on the discussion of you and Michal, I think maybe this patch is also
>> needed for the simple driver or the driver of already use it like that:
>> 	
>> 	irq = platform_get_irq(pdev, 0);
>> 	if (irq < 0)
>> 		return irq;
>> 	ret = devm_request_irq()
>>
>> It provides a common error handling and reduce one function call for each
>> drivers, more easier to use and simplify code. So resend it.
>>
>> BR,
>> Dejin
>>
>>>>
>>>> Dejin Zheng (2):
>>>>    drivers: provide devm_platform_request_irq()
>>>>    i2c: busses: convert to devm_platform_request_irq()
>>>>
>>>>   drivers/base/platform.c            | 33 ++++++++++++++++++++++++++++++
>>>>   drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++------------
>>>>   drivers/i2c/busses/i2c-cadence.c   | 10 +++------
>>>>   drivers/i2c/busses/i2c-digicolor.c | 10 +++------
>>>>   drivers/i2c/busses/i2c-emev2.c     |  5 ++---
>>>>   drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
>>>>   drivers/i2c/busses/i2c-meson.c     | 13 ++++--------
>>>>   drivers/i2c/busses/i2c-mxs.c       |  9 +++-----
>>>>   drivers/i2c/busses/i2c-pnx.c       |  9 ++------
>>>>   drivers/i2c/busses/i2c-rcar.c      |  9 +++-----
>>>>   drivers/i2c/busses/i2c-rk3x.c      | 14 +++----------
>>>>   drivers/i2c/busses/i2c-sirf.c      | 10 ++-------
>>>>   drivers/i2c/busses/i2c-stu300.c    |  4 ++--
>>>>   drivers/i2c/busses/i2c-synquacer.c | 12 +++--------
>>>>   include/linux/platform_device.h    |  4 ++++
>>>>   15 files changed, 72 insertions(+), 91 deletions(-)
> 
> If you look at all driver except for cadence one it doesn't do any
> change and I can't see any issue with it because sequences are the same
> as were before.
> 
> Regarding Cadence and Grygorii's comments:
> We are not checking that id->irq is valid that's why even if that fails
> driver continues to work. Which means that this change doesn't increase
> boot time or change code flow.
> On Xilinx devices cadence i2c is connected to ARM GIC which is
> initialized very early and IRC controller should be up and running all
> the time.
> That's why I can't see any issue which this change on Cadence driver too.


My main point was to pay attention on changes, which may be risky
especially when they are part of bulk changes (such optimization tend to spread
fast and all over the kernel without proper review).

Sry, if i introduced some misunderstanding, but it seems worked and this patch has got more attention.
There are no objection from my side to use devm_platform_get_and_ioremap_resource() if driver
owners find it acceptable.

-- 
Best regards,
grygorii
