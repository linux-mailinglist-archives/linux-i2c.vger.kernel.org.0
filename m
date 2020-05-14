Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E43D1D28D3
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 09:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgENHe7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 03:34:59 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:16345 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725972AbgENHe7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 May 2020 03:34:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589441698; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=cTY3pvzI77KJ5Z/we/c4X1UOa6Y2/VYnrojkOWwC9X4=; b=HLDa+N0ifqyMjwMNVUqT1R/xb7oCbcuyytWs5JSE7eWkmLDbQMd8yyJUNMBqCDfV6Q71sEfR
 OTRuv/1SYZ2Z8Or+ZURffREoQ4Oq+FvZymUWAFi1Gp0mfGv7pyp0vofAK/vUmE6eIFOLUvf2
 U2NnsUAe8Mw4KA1WyA5WDQN3YZ0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebcf496.7f98084e52d0-smtp-out-n01;
 Thu, 14 May 2020 07:34:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C7C4C44788; Thu, 14 May 2020 07:34:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.246] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD2E9C433D2;
        Thu, 14 May 2020 07:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD2E9C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 2/7] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-3-git-send-email-akashast@codeaurora.org>
 <CAHp75Vdjz7RBbyPwZwvNq5njwb_Jc76U=3pDpswmoFCFaGtNAQ@mail.gmail.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <b4c03f46-e991-4a3a-8059-9924b8d6ace4@codeaurora.org>
Date:   Thu, 14 May 2020 13:04:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vdjz7RBbyPwZwvNq5njwb_Jc76U=3pDpswmoFCFaGtNAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 5/9/2020 5:41 PM, Andy Shevchenko wrote:
> On Fri, May 8, 2020 at 9:34 AM Akash Asthana <akashast@codeaurora.org> wrote:
>> QUP core clock is shared among all the SE drivers present on particular
>> QUP wrapper, the system will reset(unclocked access) if earlycon used after
>> QUP core clock is put to 0 from other SE drivers before real console comes
>> up.
>>
>> As earlycon can't vote for it's QUP core need, to fix this add ICC
>> support to common/QUP wrapper driver and put vote for QUP core from
>> probe on behalf of earlycon and remove vote during earlycon exit call.
> ...
>
>> +       for_each_child_of_node(parent, child) {
>> +               if (of_device_is_compatible(child, "qcom,geni-se-qup")) {
> if (!...)
>   continue;
> will save you a readability of the loop body.
>
> Or...
Ok.
>
>> +                       wrapper = platform_get_drvdata(of_find_device_by_node(
>> +                                       child));
> ...leave this on one line
ok
>
>> +                       icc_put(wrapper->to_core.path);
>> +                       wrapper->to_core.path = NULL;
>> +               }
> And here is the question, what do you want to do if you find more
> devices with the same compatible string?

We are voting on core path (from probe *geni_se_probe*) for all the 
devices which are compatible to string "qcom,geni-se-qup" so, here we'll 
remove those vote and release the icc_path for all the those devices

We have to vote on each qup device instead ones to which console is 
connected because all the qup shares the same core clocks. You may refer 
previous thread@ https://www.spinics.net/lists/linux-spi/msg21000.html 
for more info on this limitation.

Thankyou for taking time out and reviewing the patch.

Regards,

Akash

>
>> +       }

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
