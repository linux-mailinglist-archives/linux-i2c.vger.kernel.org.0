Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59AD718836F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 13:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgCQMNa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 08:13:30 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37542 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbgCQMNa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 08:13:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584447209; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=a1YiAJpWf/Sf823hJI2HWkW5ILCzCOPKtuET3jua5IY=; b=jApspDoC1wcCbdeQTNnGkkvXthJ3+bwsNsFnc9hlf+pUdXykQ4uAGHM4VLa41L6pSP6r5ixJ
 DYDgSdX+pcDG3AfFzxb6E5k6uE3Z9acCuD84pqj1jN/WOeni+wg0quhcgEWTrEn9ky1Xxh7F
 PDXJ2ODQIZ9GP07bCYsWcKbk8OE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70bed6.7f4896cd1308-smtp-out-n01;
 Tue, 17 Mar 2020 12:13:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3ED21C432C2; Tue, 17 Mar 2020 12:13:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 680F7C433D2;
        Tue, 17 Mar 2020 12:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 680F7C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
 <20200314005817.GN144492@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
Date:   Tue, 17 Mar 2020 17:43:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200314005817.GN144492@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 3/14/2020 6:28 AM, Matthias Kaehlcke wrote:
> Hi,
>
> On Fri, Mar 13, 2020 at 06:42:13PM +0530, Akash Asthana wrote:
>> Get the interconnect paths for QSPI device and vote according to the
>> current bus speed of the driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>>     path handle
>>   - As per Matthias comment, added error handling for icc_set_bw call
>>
>>   drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 45 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
>> index 3c4f83b..ad48f43 100644
>> --- a/drivers/spi/spi-qcom-qspi.c
>> +++ b/drivers/spi/spi-qcom-qspi.c
>> @@ -2,6 +2,7 @@
>>   // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>>   
>>   #include <linux/clk.h>
>> +#include <linux/interconnect.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/io.h>
>>   #include <linux/module.h>
>> @@ -139,7 +140,10 @@ struct qcom_qspi {
>>   	struct device *dev;
>>   	struct clk_bulk_data *clks;
>>   	struct qspi_xfer xfer;
>> -	/* Lock to protect xfer and IRQ accessed registers */
>> +	struct icc_path *icc_path_cpu_to_qspi;
>> +	unsigned int avg_bw_cpu;
>> +	unsigned int peak_bw_cpu;
> This triplet is a recurring pattern, and is probably not limited to geni SE/QSPI.
> On https://patchwork.kernel.org/patch/11436889/#23221925 I suggested the creation
> of a geni SE specific struct, however adding a generic convenience struct to
> 'linux/interconnect.h' might be the better solution:
>
> struct icc_client {
> 	struct icc_path *path;
> 	unsigned int avg_bw;
> 	unsigned int peak_bw;
> };
>
> I'm sure there are better names for it, but this would be the idea.

Yeah, I think introducing this to ICC header would be better solution.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
