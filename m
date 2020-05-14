Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1257A1D2864
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 09:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgENHDd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 03:03:33 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:16097 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726004AbgENHDd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 May 2020 03:03:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589439813; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mD6zwcTcSV2rURIM5M2MgMVSc+SPDGYA1hmogi2AOqw=; b=xE6djdmWSTfm74opQzo4K1xJCdqjxXcFC6TlGsFrsQzSfWfYiEXxLNHUOFWx2YtYviNeLRPp
 7OgpbRVuXrTDLXwASidQOnlUhYWV5lfIMsG/WTGKbqWmfwov+uy7iz64ahN6fwfS0boWYcuX
 3Pv2H6vIjVqCA61XvsGMsHGl9a8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebced3f.7fd5c3656f80-smtp-out-n03;
 Thu, 14 May 2020 07:03:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 999D5C43636; Thu, 14 May 2020 07:03:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.246] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D00DC433F2;
        Thu, 14 May 2020 07:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D00DC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 2/7] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org, georgi.djakov@linaro.org
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-3-git-send-email-akashast@codeaurora.org>
 <20200508175938.GB4525@google.com> <20200508191454.GH4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <a261dfa3-2435-ab79-e7fc-29e5df107757@codeaurora.org>
Date:   Thu, 14 May 2020 12:33:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508191454.GH4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,


>> The loop should have curly braces ("use braces when a loop contains more than
>> a single simple statement"), even though the compiler doesn't need them in
>> this case. This is not a loop, but I was told by a maintainer that it equally
>> applies, which makes sense.
>>
>> You could avoid one level of indentation through:
>>
>> if (!console_drivers)
>> 	goto exit;
>>
>>> +		for_each_console(bcon)
> Actually the NULL check of 'console_drivers' is not needed:
>
> #define for_each_console(con) \
>          for (con = console_drivers; con != NULL; con = con->next)

Ok, I will remove this check.


Regards,

Akash

>
> see also:
>
> commit caa72c3bc584bc28b557bcf1a47532a7a6f37e6f
> Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date:   Mon Feb 3 15:31:25 2020 +0200
>
>      console: Drop double check for console_drivers being non-NULL

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
