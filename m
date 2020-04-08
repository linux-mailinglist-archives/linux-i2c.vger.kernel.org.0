Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037F91A1FF4
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 13:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgDHLib (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 07:38:31 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:27629 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728497AbgDHLib (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 07:38:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586345910; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hB+Rd4GlJbIiaitUMKZYiV6l9cOrq/VA33e0iAC+6sM=; b=MTs9whi0qnh+hlASGxeT6wYcNjItCv4bRAbOLu6dTcYqV7d3tmDqdwaWnmP4YldeLKHg8YiC
 5J1UMSCL8/qbpgLP4DdJD+GOOObKapvcpe34pyb4+RXm2YCgvEHvHv1IOysVxMcVzz82BVxk
 wjCOGnZkiHgxpALorM8PjyOeb2g=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8db7a4.7f727d34d618-smtp-out-n03;
 Wed, 08 Apr 2020 11:38:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 34A3AC433F2; Wed,  8 Apr 2020 11:38:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A453C433BA;
        Wed,  8 Apr 2020 11:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A453C433BA
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
 <20200331182457.GH199755@google.com>
 <7a4e13bf-a4b7-d75b-df42-bf5e4125258a@codeaurora.org>
 <20200407172604.GQ199755@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <9e91aaa8-88f0-656f-b9f5-7e64014bad7a@codeaurora.org>
Date:   Wed, 8 Apr 2020 17:08:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407172604.GQ199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 4/7/2020 10:56 PM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Tue, Apr 07, 2020 at 05:04:17PM +0530, Akash Asthana wrote:
>> Hi Matthias,
>>
>>
>>>>    static int geni_se_probe(struct platform_device *pdev)
>>>>    {
>>>>    	struct device *dev = &pdev->dev;
>>>> @@ -845,6 +868,34 @@ static int geni_se_probe(struct platform_device *pdev)
>>>>    		}
>>>>    	}
>>>> +#ifdef CONFIG_SERIAL_EARLYCON
>>>> +	wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
>>>> +	if (IS_ERR(wrapper->to_core.path))
>>>> +		return PTR_ERR(wrapper->to_core.path);
>>>> +	/*
>>>> +	 * Put minmal BW request on core clocks on behalf of early console.
>>>> +	 * The vote will be removed earlycon exit function.
>>>> +	 *
>>>> +	 * Note: We are putting vote on each QUP wrapper instead only to which
>>>> +	 * earlycon is connected because QUP core clock of different wrapper
>>>> +	 * share same voltage domain. If core1 is put to 0, then core2 will
>>>> +	 * also run at 0, if not voted. Default ICC vote will be removed ASA
>>>> +	 * we touch any of the core clock.
>>>> +	 * core1 = core2 = max(core1, core2)
>>>> +	 */
>>> I don't really understand this part. According to the comment if we vote
>>> (let's say) for core2 but not for core1 then:
>>>
>>> core1: 0
>>> core2: GENI_DEFAULT_BW
>>>
>>> core1 = core2 = max(core1, core2)
>>>     or
>>> core1 = core2 = max(0, GENI_DEFAULT_BW)
>>>
>>> hence
>>>
>>> core1 = core2 = GENI_DEFAULT_BW
>>>
>>> What am I missing, why is it necessary to vote for both/all?
>> say core1 is for earlycon usecase
>>
>> There is common switch to control both the QUP core clock. I guess most
>> appropriate description would be     switch = max(vote_on_core1,
>> vote_on_core2) + default_vote.
>>
>> During early bootup, vote_on_core1 = 0, vote_on_core2 = 0;
>>
>> As earlycon was working even without voting it's core need because there was
>> some default vote present on the core switch by ICC during bootup.
>>
>> So if any child(say SPI) of other QUP wrapper resumed and suspended before
>> earlycon wrapper comes up. This will make core clock to run at zero and will
>> cause NOC issue because vote_on_core1 = 0, vote_on_core2 = 0; and it seems
>> default votes from core switch is removed  ASA it's voted on any core.
> Thanks for the explication!
>
> You are probably totally right, but for some reason my brain still resists
> to get it ...
>
> With the above my current interpretation is (assuming earlycon only votes on
> core1):
>
>                        core1   core2  default  switch
> early boot              0       0        1       1
> SPI resume (core2)      0       1        0       1
> SPI suspend (core2)     0       0        0       0
> earlycon init 		1	0        0       1
>
>
> What is wrong in the above table?
>
> Thanks for bearing with me :)
NP :)

I guess you meant QUP WRAPPER 1 probe by "earlycon init".

                       core1   core2  default  switch	Time
early boot              0       0        1       1	0s
SPI resume (core2)      0       1        0       1	3.2s
SPI suspend (core2)     0       0        0       0	3.3s
QUP WRAPPER 1(probe)	1	0        0       1	5s (say)

So switch is at 0 in time interval [3.3, 5] that will make core clock to run at 0.
If we use earlycon during this time interval it will reset the board.

Did above answered the query?

Regards,
Akash

>
> Matthias

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
