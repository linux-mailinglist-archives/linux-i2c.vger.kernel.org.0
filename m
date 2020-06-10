Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FBD1F5321
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 13:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgFJL1l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 07:27:41 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:56534 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728480AbgFJL1l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 07:27:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591788460; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=dWdoa6IGDMC+hQP5CWL1tHbKfDBsdtRuzoBnhaz53/I=; b=BBdOpuqrF3q/D4ubt6WdWW8CfZ7RN3ngGnc/agyCDvNxrpXCc7SFbNQ/iXtzRdOhwAby4fI8
 RbigeS5gRXdM4nRnvLPNgYJmxDUJOXYvIeWbBy2nkfy66GfQxPkRzJP7ccFPBlH14qRRWG8g
 5z0vuiG3iv3f9q+8WXQV84dpKI8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ee0c3a8117610c7ff02135e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 11:27:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E7277C433A0; Wed, 10 Jun 2020 11:27:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.9] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50705C433CB;
        Wed, 10 Jun 2020 11:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50705C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V7 RESEND 4/7] spi: spi-geni-qcom: Add interconnect
 support
To:     Mark Brown <broonie@kernel.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        msavaliy@codeaurora.org
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
 <1591682194-32388-5-git-send-email-akashast@codeaurora.org>
 <20200609134112.GI4583@sirena.org.uk>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <5a6a25e1-b22d-6960-2377-d7bc32d37b51@codeaurora.org>
Date:   Wed, 10 Jun 2020 16:57:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200609134112.GI4583@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mark,

On 6/9/2020 7:11 PM, Mark Brown wrote:
> On Tue, Jun 09, 2020 at 11:26:31AM +0530, Akash Asthana wrote:
>> Get the interconnect paths for SPI based Serial Engine device
>> and vote according to the current bus speed of the driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
> I've repeatedly acked this patch but my ack never seems to get carried
> forward :(

I carry acks from previous patches if nothing is changed in current 
patch wrt previous version, I did that in 
V6@http://patchwork.ozlabs.org/project/linux-i2c/patch/1590049764-20912-5-git-send-email-akashast@codeaurora.org/

But since there was change from V6 to V7 so, I didn't carried ack from 
V6 to V7, because I thought I'll need your approvals on additional changes.

V7@http://patchwork.ozlabs.org/project/linux-i2c/patch/1590497690-29035-5-git-send-email-akashast@codeaurora.org/

================================================

Changes in V7:
  - As per Matthias's comment removed usage of peak_bw variable because we don't
    have explicit peak requirement, we were voting peak = avg and this can be
    tracked using single variable for avg bw.
==========================================================

>
>> +	/* Set the bus quota to a reasonable value for register access */
>> +	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
>> +	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
> Why are these asymmetric?

These are asymmetric because we want to start by putting minimal vote on 
CPU_TO_GENI path for register access and later based on per transfer's 
need we scale it at runtime.

However, for GENI_TO_CORE path we are trying to keep fixed vote from 
probe itself that can support max bus speed, we are not scaling it per 
transfer's need because FW runs on core clock and core behaves a bit 
different than other NOCs.

We don't have any functional relation which mapping btw actual 
throughput requirement to core frequency need. In the past we have faced 
few latency issues because of core slowness (Although it was running 
much higher than actual throughput requirement). To avoid such scenario 
we are using tested and recommended value from HW team.

Thankyou for review.

regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

