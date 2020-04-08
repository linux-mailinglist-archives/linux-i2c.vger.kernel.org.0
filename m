Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 572D91A1FA6
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 13:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgDHLOH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 07:14:07 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19396 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728371AbgDHLOG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 07:14:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586344446; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=dNLnnym4VtOUg1n6xG1Oo6xj/LOdUkzfToVq8XZ0xqo=; b=ZnsyiF1ivTO6PAvsQdI4dsrv1D3c4AtIBlqDinYtAn9NFgTQb0S/YuECik3TEQCFCbfdKcID
 4G+fdpGH3X5khls0RGkpxofGFPTjafeNlo0K9FUJ5WHOaTm70efOCXHs6QTjBRQvaWNjkWYX
 YKMadafIE9azJXQD0aps/nwapag=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8db1e6.7f04e41d63e8-smtp-out-n02;
 Wed, 08 Apr 2020 11:13:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 572C3C44791; Wed,  8 Apr 2020 11:13:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E552BC433F2;
        Wed,  8 Apr 2020 11:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E552BC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 2/8] soc: qcom: geni: Support for ICC voting
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>, wsa@the-dreams.de,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-3-git-send-email-akashast@codeaurora.org>
 <20200331233209.GF254911@minitux>
 <CAE=gft6B2UCBVaKVCJXED8waFWci8WJ+sTM3CT+3e_eYS=-BDQ@mail.gmail.com>
 <66da4cc6-3873-1d39-ecb7-e9866320c469@codeaurora.org>
 <866a5cac-9f05-703e-8c3c-168d8f219c4d@linaro.org>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <6f738ea2-d50c-3524-798c-b60e982f2c25@codeaurora.org>
Date:   Wed, 8 Apr 2020 16:43:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <866a5cac-9f05-703e-8c3c-168d8f219c4d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Georgi, Bjorn, Evan,

On 4/7/2020 3:28 PM, Georgi Djakov wrote:
> Hi,
>
> On 4/7/20 09:46, Akash Asthana wrote:
>> Hi Bjorn, Evan,
>>
>>>> Given that these two functions only switch the bandwidth request between
>>>> some value and 0, I really think we should carry a "bool enabled" on the
>>>> path and replace these two functions with
>>>> icc_bulk_enable()/icc_bulk_disable().
>> So, if above is implementation "bool enabled" on path can be used directly in
>> aggregation of ICC votes on particular node without using icc_set_bw call, if
>> yes then I am not aware how? or we'll be using icc_set_bw API indirectly inside
>> icc_bulk APIs?
> If there is a repeated pattern to switch between some bandwidth value and zero,
> it really makes sense to introduce such functions in the framework core. I think
> that this might be very useful especially for suspend and resume cases.
> Something like icc_{enable,disable}(struct icc_path *path) functions and also
> the bulk versions, that will flag the path as disabled, re-aggregate and do
> icc_set_bw().

This appears to be a non-trivial change to ICC core, as my understanding 
of ICC core is limited as of now hence, I am not very clear of the 
implementation of icc_bulk APIs.

Will it be okay if I keep geni_icc_vote_on/off API as 
is@https://patchwork.kernel.org/patch/11467511/ for now and later will 
switch to icc_bulk once it's introduced in ICC core.

Regards,

Akash

>>>> The added benefit of this would be that you call icc_set_bw() instead of
>>>> changing the geni_icc_path->{avg_bw,peak_bw} and don't need to keep
>>>> track of them here.
>> Ok IIUC, we need to call icc_set_bw() from GENI driver only if we change (avg_bw
>> | peak_bw)?
> Yes, exactly.
>
> Thanks,
> Georgi
>
>> Regards,
>>
>> Akash
>>
>>> Yes yes! I had the same thought here [1].
>>>
>>> Georgi, what do you think?
>>> -Evan
>>>
>>> [1]
>>> https://lore.kernel.org/linux-arm-msm/CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com/
>>>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
