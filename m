Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02621CF713
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 16:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbgELO0s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 10:26:48 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:59329 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728283AbgELO0r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 May 2020 10:26:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589293605; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=17JUrE+s/QDDXy89Jqf85KXy7LcDgoEQ+zmjSMMCUz8=; b=gCrDH4C6/Jn+3/IlQDkbFvmvUIidBYX+OJAfb3rK396m/bEsy+kCzBJioqF95N0nsKB6Di2c
 VC9YJ6cmMlH9K2tS9PyxPNbRojTjk28BwfoQ+PCElBXFejdI9me3Gx9M6sZxptZ/xt6f0OTr
 tvHpit8uiQFKELDmq+aZfVhoTnw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebab208.7f67daffad88-smtp-out-n04;
 Tue, 12 May 2020 14:26:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B923CC43637; Tue, 12 May 2020 14:26:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [27.59.216.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FCE1C433F2;
        Tue, 12 May 2020 14:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4FCE1C433F2
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
 <20200508190301.GG4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <adacee1f-41b3-140a-d72a-4df3c42dd2fa@codeaurora.org>
Date:   Tue, 12 May 2020 19:56:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508190301.GG4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 5/9/2020 12:33 AM, Matthias Kaehlcke wrote:
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
>> +	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
>> +
>> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>> +		if (!icc_names[i])
>> +			continue;
>> +
>> +		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
>> +		if (IS_ERR(se->icc_paths[i].path))
>> +			goto icc_get_failure;
>> +	}
>> +
>> +	return 0;
>> +
>> +icc_get_failure:
>> +	icc_err = PTR_ERR(se->icc_paths[i].path);
>> +	if (icc_err != -EPROBE_DEFER)
>> +		dev_err_ratelimited(se->dev, "Failed to get ICC path:%s, ret:%d\n",
>> +					icc_names[i], icc_err);
>> +	return icc_err;
>> +
>> +}
>> +EXPORT_SYMBOL(geni_icc_get);
>> +
>> +void geni_icc_bw_init(struct geni_icc_path *icc_paths, unsigned int avg_bw,
>> +			unsigned int peak_bw)
> I noticed that all callers of geni_icc_bw_init() pass 0 as
> 'peak_pw' (aka peak == avg). Unless there are plans to use other
> values for the peak bandwidth in the future it is pointless to
> track the bandwidth(s) in two variables. And if the bandwidth is
> tracked in a single variable this function is not needed.

As of now we are not aware of our peak requirement(avg requirement works 
good for us) so I am passing (peak = avg) as per Georgi's suggestion.

But I wanted to make this feature more generic and keeping the 
possibilty open that we might have to use other peak(!=0) value in future.

Regards,

Akash

>
>> +{
>> +	if (!peak_bw)
>> +		peak_bw = avg_bw;
>> +	icc_paths->avg_bw = avg_bw;
>> +	icc_paths->peak_bw = peak_bw;
>> +}
>> +EXPORT_SYMBOL(geni_icc_bw_init);

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
