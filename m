Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDCF377C66
	for <lists+linux-i2c@lfdr.de>; Mon, 10 May 2021 08:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhEJGiv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 May 2021 02:38:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56168 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhEJGiu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 May 2021 02:38:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620628666; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EFrg0Rm2dQilSVOBS+x/LQkRzZDIy/tILQa3waU6VwA=; b=haHPuw6GWdj3uLsIGlDRpW43xQkV5fry6gZw6guBuhXFw8cvZI30N7XssWUn8Szl9yP1RVy1
 xbelcqetYdin0L4WVsKRxTwTSfpCZYcA/xKTm7vWW5OH4EyUVj4ygdxTUh/L9TRfq7a7RUNx
 QzashMj8viWKQpZgO7EKLEzJ/ME=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6098d49f74f773a66494f0b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 May 2021 06:37:19
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 921D5C43148; Mon, 10 May 2021 06:37:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.50.45.159] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A31DC43143;
        Mon, 10 May 2021 06:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A31DC43143
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for
 'assigned-performance-states'
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-4-rojay@codeaurora.org> <YAGqKfDfB7EEuZVn@builder.lan>
 <6bfec3e6-3d26-7ade-d836-032273856ce2@codeaurora.org>
 <CAPDyKFqF0NE3QRAEfiqj5QOXXH2om4CpyyeudeqoovANfvjsaQ@mail.gmail.com>
 <20210429075054.vrotcbldbaivfh2d@vireshk-i7>
 <3743d729-4287-a389-72e2-2201ee59601d@codeaurora.org>
 <CAPDyKFrVcvXvSHrRyJFZUjTXEeOLk2k7G-36pOSWUKhkWRTftA@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <b02be4a9-aae4-62c2-2ef2-5ade683eb1a9@codeaurora.org>
Date:   Mon, 10 May 2021 12:07:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrVcvXvSHrRyJFZUjTXEeOLk2k7G-36pOSWUKhkWRTftA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/7/2021 2:36 PM, Ulf Hansson wrote:
> On Tue, 4 May 2021 at 09:18, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>>
>> []...
>>>>>>
>>>>>> Ulf, Viresh, I think we discussed this at the time of introducing the
>>>>>> performance states.
>>>>>>
>>>>>> The client's state does not affect if its performance_state should
>>>>>> be included in the calculation of the aggregated performance_state, so
>>>>>> each driver that needs to keep some minimum performance state needs to
>>>>>> have these two snippets.
>>>>>>
>>>>>> Would it not make sense to on enable/disable re-evaluate the
>>>>>> performance_state and potentially reconfigure the hardware
>>>>>> automatically?
>>>>>
>>>>> I agree, this will be repeated across multiple drivers which would
>>>>> need some minimal vote while they are active, handling this during
>>>>> genpd enable/disable in genpd core makes sense.
>>>>
>>>> Initially that's what we tried out, but we realized that it was
>>>> difficult to deal with this internally in genpd, but more importantly
>>>> it also removed some flexibility from consumers and providers. See
>>>> commit 68de2fe57a8f ("PM / Domains: Make genpd performance states
>>>> orthogonal to the idlestates").
>>>>
>>>> As a matter of fact this was quite recently discussed [1], which also
>>>> pointed out some issues when using the "required-opps" in combination,
>>>> but perhaps that got resolved? Viresh?
>>>
>>> So I looked again at that thread in detail today. The basic idea was
>>> to enable/disable the genpd from within the OPP core and there were
>>> doubts on how to do that efficiently as there are cases where domains
>>> may be enabled for an OPP, but not for others.. etc. etc.
>>>
>>> I am not sure if I consider that thread as part of the discussion we
>>> are having here, they may be related, but that thread doesn't block
>>> anything to be done in the genpd core.
>>
>> That's true, the 2 threads are different in the sense that one talks
>> about having OPP core managing power on/off along with setting perf state,
>> while the other talks about genpd core managing a default perf state
>> along with power on/off, but they are similar in the sense that both
>> are related to the discussion whether we should treat powering on and off
>> a domain related to setting its performance state or if it should be
>> considered completely orthogonal.
>>
>> I think the clock framework treats setting clock rates and turning
>> on/off a clock orthogonal because there is an inherent assumption that
>> once the clock is turned off, what rate it was set to should not matter,
>> and it can be running at the same rate when we turn the clock back on.
>>
>> I guess we can have the same assumption here that a perf state of a
>> power domain should not matter if the power domain is turned off
>> and hence the perf state need not be dropped explicitly during power off,
>> atleast that should be true for the qcom power domains supporting perf
>> state upstream.
>>
>> Should that be the approach taken here? I guess that would mean the patch
>> I had proposed earlier [1] to manage this in the genpd core would have to set the default
>> perf state at attach and remove it only during a detach of the device to
>> the pm_domain, and not manage it during the runtime_suspend/resume of the device.
> 
> Right, I think this would be a step in the right direction, but it's
> not sufficient to solve the complete problem. As you also point out
> below.
> 
>>
>>>> A consumer driver
>>>> can no longer make its vote for its device to stick around, when the
>>>> device becomes runtime suspended - and how do we know that we never
>>>> need to support such a case?
>>
>> The above approach should take care of this but the down side of it would be,
>> unlike in the case of clocks where the devices assigning a default clock rate
>> might be doing so on a device specific clock (rarely shared with other devices)
>> in case of power domain, and especially in the qcom implementation of these
>> power domains which support perf state, these can be large domains with lots of devices,
>> and any device being active (not necessarily wanting any default perf state) will keep
>> the domain at the default perf state, requested by a device which isn't really active.
> 
> Yep, this certainly sounds suboptimal. To me, this isn't good enough.
> 
>>
>>> What about doing this just for the assigned-performance-state case as
>>> the clients don't want to play with it at all.
>>
>> well, thats possible too, but you obviously can't reuse the same bindings
>> in such cases
> 
> Not sure I understand the issue with the DT binding? Let me elaborate
> on how I think we could move forward.
> 
> It looks like we have two problems to solve:
> 
> *) We need a new DT binding.
> If that becomes a generic property along the lines of the
> "assigned-performance-state" as suggested - or if we decide to add a
> SoC specific binding via using an additional cell in "power-domains"
> (suggested by Rob), doesn't really matter much to me. The arguments
> for the new DT property are very much similar to why we added
> "assigned-clock-rates" for clocks.
> 
> **) We want to avoid boiler-plate code in drivers to manage
> "assigned-performance-state" for their devices.
> No matter what DT property we decide on (generic or SoC specific), we
> should be able to manage this from the PM domain (genpd) layer. No
> changes in the drivers should be needed.
> If a generic binding is used, we could consider to let genpd
> internally manage the whole thing (DT parsing and updating performance
> state votes for assigned-performance-state only).

Sure, so for starters does that mean I should re-spin my series which
adds the generic 'assigned-performance-states' bindings and see if Rob
is OK with that? I am guessing you are OK with the way that binding gets
used within genpd core in that series, or would you want it to be handled
differently?

> If we go for an SoC specific binding, the genpd provider needs to be
> updated. It can manage DT parsing from the ->attach|detach_dev()
> callbacks and update performance votes from the ->start|stop()
> callbacks.
> We could also consider a hybrid of these two solutions.
>>
>> [1] https://lore.kernel.org/patchwork/patch/1284042/
> 
> Kind regards
> Uffe
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
