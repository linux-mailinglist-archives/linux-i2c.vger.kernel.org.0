Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B0337266C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 09:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhEDHTE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 03:19:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:46464 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhEDHTC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 03:19:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620112688; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TsMhsAMBfekY2yWXOVe1AQY3Oqamcr2Lta84s5f3TX8=; b=O4CYnrr1ZKiLClbxBw+0azBr21Wg65K4p4EjrSqLIeJx+1BVZkxNtT08mAO/e2PafrkokqFL
 I2r4g2ZeAOZmJJcT/zm50fcsQLpeue2dsKvKzHd07PQFdmmqLclGpoXFN21llLaVdOubr2oj
 CVef8alkAkaesR9ts7ssi3P3cUw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6090f53055b14811b4217fd1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 May 2021 07:18:08
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0743C433F1; Tue,  4 May 2021 07:18:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.50.40.171] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66BB7C433F1;
        Tue,  4 May 2021 07:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66BB7C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for
 'assigned-performance-states'
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
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
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <3743d729-4287-a389-72e2-2201ee59601d@codeaurora.org>
Date:   Tue, 4 May 2021 12:47:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429075054.vrotcbldbaivfh2d@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


[]...
>>>>
>>>> Ulf, Viresh, I think we discussed this at the time of introducing the
>>>> performance states.
>>>>
>>>> The client's state does not affect if its performance_state should
>>>> be included in the calculation of the aggregated performance_state, so
>>>> each driver that needs to keep some minimum performance state needs to
>>>> have these two snippets.
>>>>
>>>> Would it not make sense to on enable/disable re-evaluate the
>>>> performance_state and potentially reconfigure the hardware
>>>> automatically?
>>>
>>> I agree, this will be repeated across multiple drivers which would
>>> need some minimal vote while they are active, handling this during
>>> genpd enable/disable in genpd core makes sense.
>>
>> Initially that's what we tried out, but we realized that it was
>> difficult to deal with this internally in genpd, but more importantly
>> it also removed some flexibility from consumers and providers. See
>> commit 68de2fe57a8f ("PM / Domains: Make genpd performance states
>> orthogonal to the idlestates").
>>
>> As a matter of fact this was quite recently discussed [1], which also
>> pointed out some issues when using the "required-opps" in combination,
>> but perhaps that got resolved? Viresh?
> 
> So I looked again at that thread in detail today. The basic idea was
> to enable/disable the genpd from within the OPP core and there were
> doubts on how to do that efficiently as there are cases where domains
> may be enabled for an OPP, but not for others.. etc. etc.
> 
> I am not sure if I consider that thread as part of the discussion we
> are having here, they may be related, but that thread doesn't block
> anything to be done in the genpd core.

That's true, the 2 threads are different in the sense that one talks
about having OPP core managing power on/off along with setting perf state,
while the other talks about genpd core managing a default perf state
along with power on/off, but they are similar in the sense that both
are related to the discussion whether we should treat powering on and off
a domain related to setting its performance state or if it should be
considered completely orthogonal.

I think the clock framework treats setting clock rates and turning
on/off a clock orthogonal because there is an inherent assumption that
once the clock is turned off, what rate it was set to should not matter,
and it can be running at the same rate when we turn the clock back on.

I guess we can have the same assumption here that a perf state of a
power domain should not matter if the power domain is turned off
and hence the perf state need not be dropped explicitly during power off,
atleast that should be true for the qcom power domains supporting perf
state upstream.

Should that be the approach taken here? I guess that would mean the patch
I had proposed earlier [1] to manage this in the genpd core would have to set the default
perf state at attach and remove it only during a detach of the device to
the pm_domain, and not manage it during the runtime_suspend/resume of the device.

>> A consumer driver
>> can no longer make its vote for its device to stick around, when the
>> device becomes runtime suspended - and how do we know that we never
>> need to support such a case?

The above approach should take care of this but the down side of it would be,
unlike in the case of clocks where the devices assigning a default clock rate
might be doing so on a device specific clock (rarely shared with other devices)
in case of power domain, and especially in the qcom implementation of these
power domains which support perf state, these can be large domains with lots of devices,
and any device being active (not necessarily wanting any default perf state) will keep
the domain at the default perf state, requested by a device which isn't really active.

> What about doing this just for the assigned-performance-state case as
> the clients don't want to play with it at all.

well, thats possible too, but you obviously can't reuse the same bindings
in such cases

[1] https://lore.kernel.org/patchwork/patch/1284042/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
