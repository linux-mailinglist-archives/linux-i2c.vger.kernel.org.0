Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF29204F13
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 12:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731158AbgFWKd0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 06:33:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31523 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732213AbgFWKd0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 06:33:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592908405; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lNNnByEug5g2bPYKwn6YK0re+KHJrKIrpbDEXH/HrBY=; b=F5T/khEMafYgjfonXRpqxvuENzOeztq1qYjdzB6LwB1nZ8a+p0gsg4FlACnnnu26Ct2pIVSs
 8vucmGoKee9EF2aQH4/gxmuE99C8Hg0PhLCVKcCWFM9Twp+pP3iok4Vy82pmG0i+DfybthAD
 MC8g5At8wNPEAn2IGIznhqFR9Z0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ef1da73567385e8e7092588 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 10:33:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AB6B2C433A0; Tue, 23 Jun 2020 10:33:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.98] (unknown [157.48.152.150])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26A3BC433CA;
        Tue, 23 Jun 2020 10:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26A3BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V7 RESEND 4/7] spi: spi-geni-qcom: Add interconnect
 support
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi <linux-spi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>, msavaliy@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
 <1591682194-32388-5-git-send-email-akashast@codeaurora.org>
 <CAD=FV=XwV-8J9-j1j2gwQ08oF8izDv=hB9vj_SogbagOBQfN6Q@mail.gmail.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <4160ce9e-ee40-703c-1f13-c20ab90e0a96@codeaurora.org>
Date:   Tue, 23 Jun 2020 16:03:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XwV-8J9-j1j2gwQ08oF8izDv=hB9vj_SogbagOBQfN6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Doug,

On 6/23/2020 10:36 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Jun 8, 2020 at 10:57 PM Akash Asthana <akashast@codeaurora.org> wrote:
>> Get the interconnect paths for SPI based Serial Engine device
>> and vote according to the current bus speed of the driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>> Changes in V2:
>>   - As per Bjorn's comment, removed se == NULL check from geni_spi_icc_get
>>   - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>>     path handle
>>   - As per Matthias comment, added error handling for icc_set_bw call
>>
>> Changes in V3:
>>   - As per Matthias's comment, use helper ICC function from geni-se driver.
>>
>> Changes in V4:
>>   - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
>>     to ICC core.
>>
>> Changes in V5:
>>   - Use icc_enable/disable in power on/off call.
>>   - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>>     from probe so that when resume/icc_enable is called NOC are running at
>>     some non-zero value. No need to call icc_disable after BW vote because
>>     device will resume and suspend before probe return and will leave ICC in
>>     disabled state.
>>
>> Changes in V6:
>>   - No change
>>
>> Changes in V7:
>>   - As per Matthias's comment removed usage of peak_bw variable because we don't
>>     have explicit peak requirement, we were voting peak = avg and this can be
>>     tracked using single variable for avg bw.
>>
>>   drivers/spi/spi-geni-qcom.c | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>> index c397242..2ace5c5 100644
>> --- a/drivers/spi/spi-geni-qcom.c
>> +++ b/drivers/spi/spi-geni-qcom.c
>> @@ -234,6 +234,12 @@ static int setup_fifo_params(struct spi_device *spi_slv,
>>                  return ret;
>>          }
>>
>> +       /* Set BW quota for CPU as driver supports FIFO mode only. */
>> +       se->icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(mas->cur_speed_hz);
>> +       ret = geni_icc_set_bw(se);
>> +       if (ret)
>> +               return ret;
>> +
> I haven't done a deep review of your patch, but a quick drive-by
> review since I happened to notice it while looking at this driver.
> You should probably also update the other path that's adjusting the
> "mas->cur_speed_hz" variable.  Specifically see setup_fifo_xfer().
>
> For bonus points, you could even unify the two paths.  Perhaps you
> could pick <https://crrev.com/c/2259624> and include it in your series
> (remove the WIP if you do).

Yeah, we can adjust ICC vote per transfer like we are doing for clock.

I will include your patch to v8 series.

Thanks for review.

regards,

Akash

>
> -Doug

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

