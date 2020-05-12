Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B541CF66A
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 16:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbgELOE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 10:04:58 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:57771 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728085AbgELOE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 May 2020 10:04:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589292296; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=InNQndDpm42OcpQN7tWNfV3b6ZrAOQwNSMr11BkCV6A=; b=t44INrTPz8uhmGruJYN5xxQfu4uQlvMx+vZPVmpS2pgHupQJirdTTuysR+Q3ro5cMKdN+P8K
 j7EMauCUH/22eAAMOT7ughxKQ7XLoeNmg4NcYLCdc0lLeGpSQNIhXVeU9qnd4W6xCD8qL7w+
 ceravU1TgQL2rX7ANVxPygBXrg0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebaacb1.7f7d5de420d8-smtp-out-n01;
 Tue, 12 May 2020 14:03:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D8B1C43636; Tue, 12 May 2020 14:03:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [27.59.216.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD951C43637;
        Tue, 12 May 2020 14:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD951C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 1/7] soc: qcom: geni: Support for ICC voting
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
 <1588919619-21355-2-git-send-email-akashast@codeaurora.org>
 <20200508171352.GA4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <88ac8c5c-d3fe-103e-af0a-0e4a96f4c7db@codeaurora.org>
Date:   Tue, 12 May 2020 19:32:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508171352.GA4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 5/8/2020 10:43 PM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> note: my comments below are clearly entering bikeshed territory. Please
> take what you agree with and feel free to ignore the rest.
>
> On Fri, May 08, 2020 at 12:03:33PM +0530, Akash Asthana wrote:
>> Add necessary macros and structure variables to support ICC BW
>> voting from individual SE drivers.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V2:
>>   - As per Bjorn's comment dropped enums for ICC paths, given the three
>>     paths individual members
>>
>> Changes in V3:
>>   - Add geni_icc_get, geni_icc_vote_on and geni_icc_vote_off as helper API.
>>   - Add geni_icc_path structure in common header
>>
>> Changes in V4:
>>   - As per Bjorn's comment print error message in geni_icc_get if return
>>     value is not -EPROBE_DEFER.
>>   - As per Bjorn's comment remove NULL on path before calling icc_set_bw
>>     API.
>>   - As per Bjorn's comment drop __func__ print.
>>   - As per Matthias's comment, make ICC path a array instead of individual
>>     member entry in geni_se struct.
>>
>> Note: I have ignored below check patch suggestion because it was throwing
>>        compilation error as 'icc_ddr' is not compile time comstant.
>>
>> WARNING: char * array declaration might be better as static const
>>   - FILE: drivers/soc/qcom/qcom-geni-se.c:726:
>>   - const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
>>
>> Changes in V5:
>>   - As per Matthias's comment defined enums for ICC paths.
>>   - Integrate icc_enable/disable with power on/off call for driver.
>>   - As per Matthias's comment added icc_path_names array to print icc path name
>>     in failure case.
>>   - As per Georgi's suggestion assume peak_bw = avg_bw if not mentioned.
>>
>>   drivers/soc/qcom/qcom-geni-se.c | 92 +++++++++++++++++++++++++++++++++++++++++
>>   include/linux/qcom-geni-se.h    | 42 +++++++++++++++++++
>>   2 files changed, 134 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 7d622ea..63403bf 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -92,6 +92,9 @@ struct geni_wrapper {
>>   	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>>   };
>>   
>> +static const char * const icc_path_names[] = {"qup-core", "qup-config",
>> +								"qup-memory"};
> nit: the indentation is a bit odd. I would align it either with "qup-core" or
> at a tab stop nearby.
ok
>
>> +
>>   #define QUP_HW_VER_REG			0x4
>>   
>>   /* Common SE registers */
>> @@ -720,6 +723,95 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
>>   }
>>   EXPORT_SYMBOL(geni_se_rx_dma_unprep);
>>   
>> +int geni_icc_get(struct geni_se *se, const char *icc_ddr)
>> +{
>> +	int i, icc_err;
> nit: the 'icc_' prefix doesn't add value here, just 'err' would be less
> 'noisy' IMO.
ok
>
>> +	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
> nit: you could avoid repeating the first to strings by referencing
> icc_path_names[GENI_TO_CORE] and icc_path_names[CPU_TO_GENI]. Not sure
> if it's really better, it avoids the redundant names, but is slightly
> less readable.
I thought of that but current implementation looks neater to me.
>
>> +
>> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>> +		if (!icc_names[i])
>> +			continue;
>> +
>> +		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
>> +		if (IS_ERR(se->icc_paths[i].path))
>> +			goto icc_get_failure;
> nit: since there is only a single label it isn't really necessary to be so
> precise. 'goto err' is very common in the kernel, 'err_icc_get' would be
> another alternative.
okay
>
>> +	}
>> +
>> +	return 0;
>> +
>> +icc_get_failure:
>> +	icc_err = PTR_ERR(se->icc_paths[i].path);
>> +	if (icc_err != -EPROBE_DEFER)
>> +		dev_err_ratelimited(se->dev, "Failed to get ICC path:%s, ret:%d\n",
> All the logs in this patch result in something like "... path:qup-core, ret:42".
> For humans I think it is more intuitive to parse "... path 'qup-core': 42".

ok

Thanks for review and feedback

Regards,

Akash

>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
