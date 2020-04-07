Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013DE1A07BB
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 08:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgDGGxa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 02:53:30 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:34084 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727331AbgDGGxa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 02:53:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586242409; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=MM42mk4hxGceNvVymMZohHxg/lrxWGdHHgUgo5ZLcAw=; b=wses0QXQsJvFQF8UoR6taLH9Jsv/Jom32bNLpRYLO1D81Z0MV7Y/HZJbdhlOahb/FU0VZ8Iu
 uq8R1Y5aOrDBuGXkk+xOlc3TEUYql8K0XH2z2onbMuRreyn+w4jX4NCOqfxu7AJAna1Y7TR5
 zjMe+6xIGq1dRgWiN6SAnmCXRbU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c2355.7f4202608ab0-smtp-out-n04;
 Tue, 07 Apr 2020 06:53:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EC920C44792; Tue,  7 Apr 2020 06:53:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 084B5C433F2;
        Tue,  7 Apr 2020 06:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 084B5C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 3/8] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-4-git-send-email-akashast@codeaurora.org>
 <20200331182457.GH199755@google.com> <20200401194648.GM199755@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <1a72df9d-3781-f9e2-a394-3b00774bf935@codeaurora.org>
Date:   Tue, 7 Apr 2020 12:22:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401194648.GM199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias

On 4/2/2020 1:16 AM, Matthias Kaehlcke wrote:
> On Tue, Mar 31, 2020 at 11:24:57AM -0700, Matthias Kaehlcke wrote:
>> Hi Akash,
>>
>> On Tue, Mar 31, 2020 at 04:39:31PM +0530, Akash Asthana wrote:
>>> QUP core clock is shared among all the SE drivers present on particular
>>> QUP wrapper, the system will reset(unclocked access) if earlycon used after
>>> QUP core clock is put to 0 from other SE drivers before real console comes
>>> up.
>>>
>>> As earlycon can't vote for it's QUP core need, to fix this add ICC
>>> support to common/QUP wrapper driver and put vote for QUP core from
>>> probe on behalf of earlycon and remove vote during earlycon exit call.
>>>
>>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>>> Reported-by: Matthias Kaehlcke <mka@chromium.org>
>>> ---
>>> Change is V3:
>>>   - Add geni_remove_earlycon_icc_vote API that will be used by earlycon
>>>     exit function to remove ICC vote for earlyconsole.
>>>   - Remove suspend/resume hook for geni-se driver as we are no longer
>>>     removing earlyconsole ICC vote from system suspend, we are removing
>>>     from earlycon exit.
>>>
>>>   drivers/soc/qcom/qcom-geni-se.c       | 51 +++++++++++++++++++++++++++++++++++
>>>   drivers/tty/serial/qcom_geni_serial.c |  7 +++++
>>>   include/linux/qcom-geni-se.h          |  2 ++
>>>   3 files changed, 60 insertions(+)
>>>
>>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>>> index 9344c14..d30c282 100644
>>> --- a/drivers/soc/qcom/qcom-geni-se.c
>>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>>> @@ -90,8 +90,11 @@ struct geni_wrapper {
>>>   	struct device *dev;
>>>   	void __iomem *base;
>>>   	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>>> +	struct geni_icc_path to_core;
>>>   };
>>>   
>>> +struct geni_wrapper *earlycon_wrapper;
>> should be static
Yeah ok, I missed it.
>>
>>> +
>>>   #define QUP_HW_VER_REG			0x4
>>>   
>>>   /* Common SE registers */
>>> @@ -818,6 +821,26 @@ int geni_icc_vote_off(struct geni_se *se)
>>>   }
>>>   EXPORT_SYMBOL(geni_icc_vote_off);
>>>   
>>> +void geni_remove_earlycon_icc_vote(void)
>>> +{
>>> +	struct geni_wrapper *wrapper = earlycon_wrapper;
>>> +	struct device_node *parent = of_get_next_parent(wrapper->dev->of_node);
>>> +	struct device_node *child;
>>> +
>>> +	for_each_child_of_node(parent, child) {
>>> +		if (of_device_is_compatible(child, "qcom,geni-se-qup")) {
>>> +			wrapper = platform_get_drvdata(of_find_device_by_node(
>>> +					child));
>>> +			icc_put(wrapper->to_core.path);
>>> +			wrapper->to_core.path = NULL;
>>> +		}
>>> +	}
>>> +	of_node_put(parent);
>>> +
>>> +	earlycon_wrapper = NULL;
>>> +}
>>> +EXPORT_SYMBOL(geni_remove_earlycon_icc_vote);
>> I didn't know that consoles have an exit handler, this is way nicer than
>> the miscellaneous triggers we discussed earlier :)
> No wonder I 'missed' this when looking at the console code for possible
> triggers, it is brand new and as of now only exists in -next:
>
> commit ed31685c96e18f773ca11dd1a637974d62130673
> Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date:   Mon Feb 3 15:31:30 2020 +0200
>
>      console: Introduce ->exit() callback
>
>
> sharp timing!

Yeah this is added recently, even I was not aware of it, Bjorn suggested 
me to use this. Indeed sharp timing!  :)

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
