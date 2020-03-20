Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7229618CF78
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 14:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgCTNw2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 09:52:28 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:54828 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726851AbgCTNw2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Mar 2020 09:52:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584712347; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=asVXwuIl1gP5wCzIA2Kf9ocQuAN/2qFIJy7nJb+pgio=; b=qtr7JOY3ZkdQ2QKLjU1R59Rs+IHW55tjtIBgbhCzKa1REvC2AmUuVl60VS2kfNMo7BZw7LGU
 yHriz5egFby8cPBLmrmB9xhj1JAfwM1S8CMz678bRKZpM7DO2rjeSYfY8Ek7mX5MLzOOd6/B
 NfmUtINqbG+zgSZ6Al0DYuKCu0Q=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e74ca9a.7f6912d3a500-smtp-out-n05;
 Fri, 20 Mar 2020 13:52:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 71283C4478C; Fri, 20 Mar 2020 13:52:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33635C433CB;
        Fri, 20 Mar 2020 13:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33635C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 6/8] spi: spi-geni-qcom: Add interconnect support
To:     Mark Brown <broonie@kernel.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-7-git-send-email-akashast@codeaurora.org>
 <20200313131603.GG5528@sirena.org.uk>
 <aa197568-3bac-6962-d39d-3261f68c0514@codeaurora.org>
 <20200317130616.GE3971@sirena.org.uk>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <58116473-1d9e-d08a-8839-a39dd0ee32bf@codeaurora.org>
Date:   Fri, 20 Mar 2020 19:22:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317130616.GE3971@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mark,

On 3/17/2020 6:36 PM, Mark Brown wrote:
> On Tue, Mar 17, 2020 at 03:05:21PM +0530, Akash Asthana wrote:
>
>> We are taking care of actual throughput requirement in avg_bw vote and the
>> intention of putting peak as twice of avg is to ensure that if high speed
>> peripherals(ex:USB) removes their votes, we shouldn't see any latency issue
>> because of other ICC client who don't vote for their BW requirement or
>> *actual* BW requirement. Factor of 2 is chosen randomly. Please
>> correct/improve me if this is not okay.
>> If this is okay, I will centralize this design for SPI QUP, I2C and UART
>> driver.
> That seems reasonable to me, it was just the fact that every driver
> seemed to be doing the same thing that I was noticing - what was being
> done seemed OK.

Okay, thanks for confirming I will keep as is.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
