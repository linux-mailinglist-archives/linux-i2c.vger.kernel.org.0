Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A211E2219
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 14:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388497AbgEZMmF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 08:42:05 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:39877 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389224AbgEZMmE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 08:42:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590496923; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3YELMVf9xcJ/2QcH8NbwFghCdLwvN8U//nrtWkkfUQ0=; b=GcPHw8kke2BtfMaA7JCNK0OlDEXWD/pqzhFi7hreASwgWnOBeNzDovwAVCmzH2A6eCINJQ6a
 XyrUyQKfprkJnVDAZj/h5nLuD2mY4ad4rS6T6sl9JLsSGZHJAthg2XKo0TT+/+5Pgp3GRsGc
 9pDCwpyEHMuVmlKkvP3Ob5hAc1o=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ecd0e8f50867324811c06ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 May 2020 12:41:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8FA93C433A1; Tue, 26 May 2020 12:41:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16F7FC433C6;
        Tue, 26 May 2020 12:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 16F7FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V6 1/7] soc: qcom: geni: Support for ICC voting
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        msavaliy@codeaurora.org, evgreen@chromium.org
References: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
 <1590049764-20912-2-git-send-email-akashast@codeaurora.org>
 <20200521155009.GA4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <4d56790d-b8ac-6ae3-1e6e-df84fe2010ae@codeaurora.org>
Date:   Tue, 26 May 2020 18:11:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521155009.GA4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 5/21/2020 9:20 PM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Thu, May 21, 2020 at 01:59:18PM +0530, Akash Asthana wrote:
>> Add necessary macros and structure variables to support ICC BW
>> voting from individual SE drivers.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
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
>> Changes in V5:
>>   - As per Matthias's comment defined enums for ICC paths.
>>   - Integrate icc_enable/disable with power on/off call for driver.
>>   - As per Matthias's comment added icc_path_names array to print icc path name
>>     in failure case.
>>   - As per Georgi's suggestion assume peak_bw = avg_bw if not mentioned.
>>
>> Changes in V6:
>>   - Addressed nitpicks from Matthias.
>>
>> Note: I have ignored below check patch suggestion because it was throwing
>>        compilation error as 'icc_ddr' is not compile time comstant.
>>
>> WARNING: char * array declaration might be better as static const
>>   - FILE: drivers/soc/qcom/qcom-geni-se.c:726:
>>   - const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
>>
>>   drivers/soc/qcom/qcom-geni-se.c | 92 +++++++++++++++++++++++++++++++++++++++++
>>   include/linux/qcom-geni-se.h    | 42 +++++++++++++++++++
>>   2 files changed, 134 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 7d622ea..0b2526d 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -92,6 +92,9 @@ struct geni_wrapper {
>>   	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>>   };
>>   
>> +static const char * const icc_path_names[] = {"qup-core", "qup-config",
>> +						"qup-memory"};
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
>> +	int i, err;
>> +	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
>> +
>> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>> +		if (!icc_names[i])
>> +			continue;
>> +
>> +		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
>> +		if (IS_ERR(se->icc_paths[i].path))
>> +			goto err;
>> +	}
>> +
>> +	return 0;
>> +
>> +err:
>> +	err = PTR_ERR(se->icc_paths[i].path);
>> +	if (err != -EPROBE_DEFER)
>> +		dev_err_ratelimited(se->dev, "Failed to get ICC path:%s :%d\n",
> That's still an odd format, especially the colon before the error code. My
> suggestion was "... path 'qup-core': 42" i.e. "... path '%s': %d".
Sorry about it, I will correct this everywhere.
> I don't want to stall the series on nits though, if there is no need for
> a respin for other reasons this can be also fixed with a patch after this
> has landed.
>
> I'm still not overly convinced about having two bandwidth values for what
> might happen in the future (or not). Typically unused functions or struct
> members that are added just in case tend to be rejected, since they can be
> added when the need actually arises. Anyway, as long as maintainers are
> happy with it I won't object.

Okay, I am removing peak_bw variable and tracking BW request just with 
avg_bw, if need I will add this back in future.

Thanks for reviewing

regards,

Akash


>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>
>
>
>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

