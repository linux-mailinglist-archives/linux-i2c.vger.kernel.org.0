Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85321BBA34
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 11:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgD1Jqg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 05:46:36 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:50750 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727096AbgD1Jqg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 05:46:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588067196; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SYneJt2s6AGtNS7/rM4TXAHvpd3iuzSFax4dKDwNdEQ=; b=JV1+Zdy0TEygw5V/Mh2w9a3KIpLrKV/Iw9bNMqlsfcm83uEn/p8xEgR47fp5pEbm/EQRgpsO
 EJA5Z2+B6saGVKN9eRAkb6xltyPWqFvYmJHI6PHkDCzW7DoWjo+/i3YpJWsKAG9bu9t1Nk2f
 60Jsvumfo3PlkPAXVtuMLjNXTaM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7fb7b.7fdbc1a78ce0-smtp-out-n03;
 Tue, 28 Apr 2020 09:46:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3289C43637; Tue, 28 Apr 2020 09:46:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.98] (unknown [157.48.58.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E83EBC433F2;
        Tue, 28 Apr 2020 09:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E83EBC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V4 2/9] interconnect: Set peak requirement as twice of
 average
To:     Georgi Djakov <georgi.djakov@linaro.org>, broonie@kernel.org
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        Linux PM list <linux-pm@vger.kernel.org>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-3-git-send-email-akashast@codeaurora.org>
 <58b91dc1-6ce3-49b8-88c8-259be9af1dbd@linaro.org>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <7a79688c-3b9b-c7c1-2973-fca0c4b2c78b@codeaurora.org>
Date:   Tue, 28 Apr 2020 15:16:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <58b91dc1-6ce3-49b8-88c8-259be9af1dbd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Georgi,

On 4/23/2020 3:01 PM, Georgi Djakov wrote:
> Hi Akash,
>
> On 4/15/20 13:23, Akash Asthana wrote:
>> Lot of ICC clients are not aware of their actual peak requirement,
>> most commonly they tend to guess their peak requirement as
>> (some factor) * avg_bw.
>>
>> Centralize random peak guess as twice of average, out into the core
>> to maintain consistency across the clients. Client can always
>> override this setting if they got a better idea.
> I am still not convinced that this is a good idea. If the factor is a random
> value, then i think that the default factor should be 1.
>
> According to your previous reply, it seems that from geni we are requesting
> double peak bandwidth to compensate for other clients which are not requesting
> bandwidth for themselves. IMO, this is a bit hacky.
>
> Instead of requesting double peak bandwidth, IIUC the correct thing to do here
> is to request peak_bw = avg_bw for geni. And instead of trying to compensate for
> other clients "stealing" bandwidth, can't we make these clients vote for their
> own bandwidth? Or if they really can't, this should be handled elsewhere - maybe
> in the interconnect platform driver we can reserve some amount of minimum
> bandwidth for such cases?

Okay, probably we can correct clients vote for their own bandwidth or 
reserve some minimum BW from interconnect platform driver is case of any 
latency issue observed.

I will drop this change in next version.

Will it create any difference if  peak_bw = 0 instead of peak_bw = 
avg_bw? In my understanding peak_bw <= avg_bw is no-ops, it won't impact 
the NOC speed.


Regards,

Akash

>
> Thanks,
> Georgi

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
