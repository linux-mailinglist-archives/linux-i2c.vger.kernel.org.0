Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0901F33A9
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 07:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgFIFz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 01:55:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36711 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727118AbgFIFz1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Jun 2020 01:55:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591682126; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lHjRLmr48blxmZp5pC92pn0zhADcIvEhpmaowHJ/1Qo=; b=ZIto3/qksJUFfw4bjgHWXhTFObSUfdSYwER1ot8cvEBXjnkMlUo42oaYPQWDfYrA6zZstISz
 B4vtAKUsHsYS8BdN7TNMwDVX9ahABlXgrv3VfYF8sH2vu1f0hOt9DIx/v8UTcpoTGwWEjW5Z
 3eKWdBA+rWC+xadTahabZhfz7Pg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5edf24378cb42f3a2cdfd521 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 05:55:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76DDFC43387; Tue,  9 Jun 2020 05:55:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.98] (unknown [157.44.16.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64FA7C433CA;
        Tue,  9 Jun 2020 05:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64FA7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V7 6/7] spi: spi-qcom-qspi: Add interconnect support
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        msavaliy@codeaurora.org, evgreen@chromium.org
References: <1590497690-29035-1-git-send-email-akashast@codeaurora.org>
 <1590497690-29035-7-git-send-email-akashast@codeaurora.org>
 <20200526173613.GF4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <6905b55b-772d-e027-0675-e1467445f40b@codeaurora.org>
Date:   Tue, 9 Jun 2020 11:24:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526173613.GF4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 5/26/2020 11:06 PM, Matthias Kaehlcke wrote:
> On Tue, May 26, 2020 at 06:24:49PM +0530, Akash Asthana wrote:
>> Get the interconnect paths for QSPI device and vote according to the
>> current bus speed of the driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V2:
>>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>>     path handle
>>   - As per Matthias comment, added error handling for icc_set_bw call
>>
>> Changes in V3:
>>   - No Change.
>>
>> Changes in V4:
>>   - As per Mark's comment move peak_bw guess as twice of avg_bw if
>>     nothing mentioned explicitly to ICC core.
>>
>> Changes in V5:
>>   - Add icc_enable/disable to power on/off call.
>>   - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>>     from probe so that when resume/icc_enable is called NOC are running at
>>     some non-zero value.
>>
>> Changes in V6:
>>   - As per Matthias's comment made print statement consistent across driver
>>
>> Changes in V7:
>>   - As per Matthias's comment removed usage of peak_bw variable because we don't
>>     have explicit peak requirement, we were voting peak = avg and this can be
>>     tracked using single variable for avg bw.
>>   - As per Matthias's comment improved print log.
>>
>>   drivers/spi/spi-qcom-qspi.c | 57 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 56 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
>> index 3c4f83b..092ac27 100644
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
>> @@ -139,7 +140,9 @@ struct qcom_qspi {
>>   	struct device *dev;
>>   	struct clk_bulk_data *clks;
>>   	struct qspi_xfer xfer;
>> -	/* Lock to protect xfer and IRQ accessed registers */
>> +	struct icc_path *icc_path_cpu_to_qspi;
>> +	unsigned int avg_bw_cpu;
> I should have noticed this earlier, but the field isn't needed now that
> we have icc_enable/disable(). The bandwidth is set in
> qcom_qspi_transfer_one() and that's it.
>
>  From my side it would be fine to remove the field in a follow up patch,
> to avoid respinning the series yet another time just for this.
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

I will resend patch V7 with the suggested change.

Thankyou for reviewing

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

