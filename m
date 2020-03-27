Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC62E1950AE
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 06:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgC0Fdr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 01:33:47 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:59208 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725956AbgC0Fdr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 01:33:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585287227; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=V+ERd6fCgQjZF/hnv7fmKN9YfpzFtPi8H3fqR0rE/u0=; b=eNKY14M81SEKPYraXIhcAF3yQgiOMlcw6utiBAyh8s0aiU8Hvi7G2wJfv5Vkf9cpoMU/mhJG
 FmjeEZ/P6u9s+Rjs0qS0GwURXEo5ZVWpG9Eckp22d94BV2igEM3AS2k8/mppWF+UmFMJt2vY
 GVt3RA4VQAMOvjeZ8cw7mjaO52k=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7d9035.7f249cbb05e0-smtp-out-n01;
 Fri, 27 Mar 2020 05:33:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ED29BC4478C; Fri, 27 Mar 2020 05:33:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B442C433F2;
        Fri, 27 Mar 2020 05:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B442C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 2/8] soc: qcom: geni: Support for ICC voting
To:     Evan Green <evgreen@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
 <CAE=gft4_Su4+SXWAW_HWy5BF1mH7QaDHCiwAAhrNaekTeU57rA@mail.gmail.com>
 <74851dda-296d-cdc5-2449-b9ec59bbc057@codeaurora.org>
 <CAE=gft5Uucr83DoQqaE7_8_H=ExnkPBQvRiUK_+LxOMeadam_g@mail.gmail.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <51bdf6b5-28b1-64ca-011d-59990012569f@codeaurora.org>
Date:   Fri, 27 Mar 2020 11:03:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAE=gft5Uucr83DoQqaE7_8_H=ExnkPBQvRiUK_+LxOMeadam_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Evan,

On 3/20/2020 10:15 PM, Evan Green wrote:
> On Fri, Mar 20, 2020 at 4:03 AM Akash Asthana <akashast@codeaurora.org> wrote:
>> Hi Evan,
>>
>> +/* Core 2X clock frequency to BCM threshold mapping */
>> +#define CORE_2X_19_2_MHZ               960
>> +#define CORE_2X_50_MHZ                 2500
>> +#define CORE_2X_100_MHZ                        5000
>> +#define CORE_2X_150_MHZ                        7500
>> +#define CORE_2X_200_MHZ                        10000
>> +#define CORE_2X_236_MHZ                        16383
>>
>> These are all just 50 * clock_rate. Can you instead specify that one
>> define of CLK_TO_BW_RATIO 50, and then use clk_get_rate() to get the
>> input clock frequency. That way, if these end up getting clocked at a
>> different rate, the bandwidth also scales appropriately. Also, can you
>> enumerate why 50 is an appropriate ratio?
>> -Evan
>>
>> -Evan
>>
>> Clock rate for Core 2X is controlled by BW voting only, we don't set clock rate for core 2X clock either by DFS or calling clk_set_rate API like we do for SE clocks from individual driver.
>>
>> In DT node it's not mentioned as clock.
>>
>> As discussed in patch@ https://patchwork.kernel.org/patch/11436897/  We are not scaling Core 2X clock based on dynamic need of driver instead we are putting recommended value from HW team for each driver.
> Oh I get it. This is pretty opaque, since this table is saying "here
> are the bandwidth values that happen to work out to a Core2X clock
> rate of N".

Hmm,  BCM threshold to CORE2X clock rate mapping is exposed to us from 
clock team.

BCM threshold value is internally convert to mentioned clock rate this 
is something internal to board ICC driver.

>   But it's not obvious why setting the Core2X clock rate to
> N is desirable or appropriate. The answer seems to be hardware guys
> told us these thresholds work well in practice.
Yes, this is correct as the core clocks behaves different than any other 
NOC, we rely on the recommendation from VI/HW team.
>   And if I'm reading
> into it more, probably they're saying these bandwidths are too low to
> be worth dynamically managing beyond on/off
I am not sure whether they intend to say this.
> At the very least we should explain some of this in the comment above
> these defines. Something like:
> /* Define bandwidth thresholds that cause the underlying Core 2X
> interconnect clock to run at the named frequency. These baseline
> values are recommended by the hardware team, and are not dynamically
> scaled with GENI bandwidth beyond basic on/off. */
> -Evan

Ok,

regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
