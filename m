Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C821D7963
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 15:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgERNLF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 09:11:05 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:12143 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727020AbgERNLE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 09:11:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589807463; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yesEOQOsZepZE5D6yg40ImK6nzOuLsRg9Xtx8I3BpvI=; b=HF1NLobQBhueBO9zoyoa2gc7pyaQ1WPb6VdwlNmNksQS8k+gzUbL+ty5+KXmkffl9UvQq1ff
 Wz4YE6KgpVryglJzBsnA+PvwCyni83fNHf6kt0WbtiOANU1FAlybuKeQh8GZVOYHQFyqHW+l
 eT4NSzwfb9hEnIbYNGA15Pkje+4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec28965.7ff19f3df148-smtp-out-n04;
 Mon, 18 May 2020 13:11:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93227C433F2; Mon, 18 May 2020 13:11:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.11] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EFFFC44BC3;
        Mon, 18 May 2020 13:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EFFFC44BC3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 6/7] spi: spi-qcom-qspi: Add interconnect support
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
 <1588919619-21355-7-git-send-email-akashast@codeaurora.org>
 <20200508185310.GF4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <679435ec-612e-2ff7-0edc-deac549a93ce@codeaurora.org>
Date:   Mon, 18 May 2020 18:40:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508185310.GF4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 5/9/2020 12:23 AM, Matthias Kaehlcke wrote:
> On Fri, May 08, 2020 at 12:03:38PM +0530, Akash Asthana wrote:
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
>>   drivers/spi/spi-qcom-qspi.c | 59 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
>> index 3c4f83b..6e299f4 100644
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
> There is no point in having two fields, 'peak_bw_cpu' is always assigned
> to 'avg_bw_cpu' and passed to icc_set_bw(). Just make it a single field
> 'icc_bw_cpu'.
Agree that we are not using peak_bw voting as of now but probably we may 
use it in future, currently we are using only avg_bw for our need but if 
in future power team shares some data or ask us to reduce our power 
consumption, then with help of peak_bw we can tune ICC voting where 
power and performance both can be met as per requirement.
>
>> +	/* Lock to protect data accessed by IRQs */
>>   	spinlock_t lock;
>>   };
>>   
>> @@ -241,6 +245,20 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
>>   		return ret;
>>   	}
>>   
>> +	/*
>> +	 * Set BW quota for CPU as driver supports FIFO mode only.
>> +	 * We don't have explicit peak requirement so keep it equal to avg_bw.
>> +	 */
>> +	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
>> +	ctrl->peak_bw_cpu = ctrl->avg_bw_cpu;
>> +	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, ctrl->avg_bw_cpu,
>> +		ctrl->peak_bw_cpu);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu\n",
>> +			__func__);
> the logging in this patch is inconsistent. Here the error is not printed,
> at all, in other cases it's "<error>, ret:-42" or "<error> ret:-42".
> Please stick to a common format (unless there is no error). My
> suggestion would be "<error>: -42", in my perception "ret:" just adds
> noise.

Okay.

Regards,

Akash

>
>> +		return ret;
>> +	}
>> +
>>   	spin_lock_irqsave(&ctrl->lock, flags);
>>   
>>   	/* We are half duplex, so either rx or tx will be set */
>> @@ -458,6 +476,29 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto exit_probe_master_put;
>>   
>> +	ctrl->icc_path_cpu_to_qspi = devm_of_icc_get(dev, "qspi-config");
>> +	if (IS_ERR(ctrl->icc_path_cpu_to_qspi)) {
>> +		ret = PTR_ERR(ctrl->icc_path_cpu_to_qspi);
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dev, "Failed to get cpu path, ret:%d\n", ret);
>> +		goto exit_probe_master_put;
>> +	}
>> +	/* Set BW vote for register access */
>> +	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, Bps_to_icc(1000),
>> +				Bps_to_icc(1000));
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu ret:%d\n",
>> +				__func__, ret);
>> +		goto exit_probe_master_put;
>> +	}
>> +
>> +	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "%s: ICC disable failed for cpu ret:%d\n",
>> +				__func__, ret);
>> +		goto exit_probe_master_put;
>> +	}
>> +
>>   	ret = platform_get_irq(pdev, 0);
>>   	if (ret < 0)
>>   		goto exit_probe_master_put;
>> @@ -511,9 +552,17 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
>>   {
>>   	struct spi_master *master = dev_get_drvdata(dev);
>>   	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
>> +	int ret;
>>   
>>   	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
>>   
>> +	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
>> +	if (ret) {
>> +		dev_err_ratelimited(ctrl->dev, "%s: ICC disable failed for cpu ret:%d\n",
>> +			__func__, ret);
>> +		return ret;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -521,6 +570,14 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
>>   {
>>   	struct spi_master *master = dev_get_drvdata(dev);
>>   	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
>> +	int ret;
>> +
>> +	ret = icc_enable(ctrl->icc_path_cpu_to_qspi);
>> +	if (ret) {
>> +		dev_err_ratelimited(ctrl->dev, "%s: ICC enable failed for cpu ret:%d\n",
>> +			__func__, ret);
>> +		return ret;
>> +	}
>>   
>>   	return clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
>>   }

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
