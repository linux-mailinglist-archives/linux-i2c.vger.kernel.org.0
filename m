Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 491B2187C1E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgCQJfc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:35:32 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61705 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725872AbgCQJfc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 05:35:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584437731; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=dWslmfFJwyoLLIjetdrb1GRyg2NP/CSxii4Vm8lMPvs=; b=ihHgPiahyI6J7SEjoP8rEd5zTrWcENBBJJ1yFoX5BnVntv+81dNgFLmJH8cUZ4zE87mGkJ2o
 a5gWRSOc1mGGvOj/gRIqP8/16UGbhRv49QoyqNDlLjk9k5UsPucpAMBuTVxskYY1p6kqLsoa
 6KDTouLwGVbGATkEz/tZP5mlnrU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7099e3.7f212343bce0-smtp-out-n03;
 Tue, 17 Mar 2020 09:35:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 157DCC433BA; Tue, 17 Mar 2020 09:35:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE460C433CB;
        Tue, 17 Mar 2020 09:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE460C433CB
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
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <aa197568-3bac-6962-d39d-3261f68c0514@codeaurora.org>
Date:   Tue, 17 Mar 2020 15:05:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313131603.GG5528@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 3/13/2020 6:46 PM, Mark Brown wrote:
> On Fri, Mar 13, 2020 at 06:42:12PM +0530, Akash Asthana wrote:
>
>> +	se->avg_bw_cpu = Bps_to_icc(mas->cur_speed_hz);
>> +	se->peak_bw_cpu = Bps_to_icc(2 * mas->cur_speed_hz);
> As I commented on the previous version to no reply there seem to be a
> lot of cases where the peak bandwidth is just set to double the normal
> bandwidth without obvious analysis.  Should this default be centralized?

Hi Mark,

I misunderstood previous comment on V1 
patch@https://patchwork.kernel.org/patch/11386479/ as a suggestion to 
mention comment for peak BW choice if nothing mentioned explicitly (in 
this case I mentioned assume peak BW twice as average).

I understand in any case I should have ack'ed the comment atleast by 
replying "ok". I am sorry about it.


We are taking care of actual throughput requirement in avg_bw vote and 
the intention of putting peak as twice of avg is to ensure that if high 
speed peripherals(ex:USB) removes their votes, we shouldn't see any 
latency issue because of other ICC client who don't vote for their BW 
requirement or *actual* BW requirement. Factor of 2 is chosen randomly. 
Please correct/improve me if this is not okay.

If this is okay, I will centralize this design for SPI QUP, I2C and UART 
driver.

Regards,

Akash



-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
