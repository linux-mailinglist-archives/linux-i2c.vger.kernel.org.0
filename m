Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C34E19C2F3
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Apr 2020 15:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731861AbgDBNrF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Apr 2020 09:47:05 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:55986 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731839AbgDBNrF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Apr 2020 09:47:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585835224; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=AuXWxacFMiwuBdrXF2wpRouR9O53pMajubgraeN7JGs=; b=G1Qxr1q2Klp0vAIpmNK7bnr/r9XpYziK8+eGXOM1e596i2K9idyBMX4EzwPUoFBfhPPEK4SF
 +y9ScUxcmdnlNpN31AnaM2JW36SN3wNnL2G+lhtGxvdWJ2F8bQucyvGrGwj7UI0aLyUaFQG6
 iPSYo309PpXSemVj2Uxz9kcavOs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e85ecbf.7f9fd0586998-smtp-out-n05;
 Thu, 02 Apr 2020 13:46:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E933FC44791; Thu,  2 Apr 2020 13:46:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E822EC433D2;
        Thu,  2 Apr 2020 13:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E822EC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 2/8] soc: qcom: geni: Support for ICC voting
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
 <1585652976-17481-3-git-send-email-akashast@codeaurora.org>
 <20200331175207.GG199755@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <759e50d2-7938-75b6-ee0b-a9ea3722ea54@codeaurora.org>
Date:   Thu, 2 Apr 2020 19:16:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331175207.GG199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 3/31/2020 11:22 PM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Tue, Mar 31, 2020 at 04:39:30PM +0530, Akash Asthana wrote:
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
>>   drivers/soc/qcom/qcom-geni-se.c | 98 +++++++++++++++++++++++++++++++++++++++++
>>   include/linux/qcom-geni-se.h    | 36 +++++++++++++++
>>   2 files changed, 134 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 7d622ea..9344c14 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -720,6 +720,104 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
>>   }
>>   EXPORT_SYMBOL(geni_se_rx_dma_unprep);
>>   
>> +int geni_icc_get(struct geni_se *se, const char *icc_core, const char *icc_cpu,
>> +		const char *icc_ddr)
>> +{
>> +	if (icc_core) {
>> +		se->to_core.path = devm_of_icc_get(se->dev, "qup-core");
>> +		if (IS_ERR(se->to_core.path))
>> +			return PTR_ERR(se->to_core.path);
>> +	}
>> +
>> +	if (icc_cpu) {
>> +		se->from_cpu.path = devm_of_icc_get(se->dev, "qup-config");
>> +		if (IS_ERR(se->from_cpu.path))
>> +			return PTR_ERR(se->from_cpu.path);
>> +	}
>> +
>> +	if (icc_ddr) {
>> +		se->to_ddr.path = devm_of_icc_get(se->dev, "qup-memory");
>> +		if (IS_ERR(se->to_ddr.path))
>> +			return PTR_ERR(se->to_ddr.path);
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(geni_icc_get);
>> +
>> +int geni_icc_vote_on(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	if (se->to_core.path) {
>> +		ret = icc_set_bw(se->to_core.path, se->to_core.avg_bw,
>> +			se->to_core.peak_bw);
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "%s: ICC BW voting failed for core\n",
>> +						__func__);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (se->from_cpu.path) {
>> +		ret = icc_set_bw(se->from_cpu.path, se->from_cpu.avg_bw,
>> +			se->from_cpu.peak_bw);
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "%s: ICC BW voting failed for cpu\n",
>> +						__func__);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (se->to_ddr.path) {
>> +		ret = icc_set_bw(se->to_ddr.path, se->to_ddr.avg_bw,
>> +			se->to_ddr.peak_bw);
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "%s: ICC BW voting failed for ddr\n",
>> +						__func__);
>> +			return ret;
>> +		}
>> +	}
>
> With an array of 'struct geni_icc_path' pointers the above could be
> reduced to:
>
> 	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
> 		if (!se->icc_paths[i])
> 			continue;
>
> 		ret = icc_set_bw(se->icc_paths[i]->path, se->icc_paths[i]->avg_bw,
> 			se->icc_paths[i]->peak_bw);
> 		if (ret) {
> 			dev_err_ratelimited(se->dev, "%s: ICC BW voting failed\n",
> 						__func__);
> 			return ret;
> 		}
> 	}
>
> similar for geni_icc_vote_off()
>
> It's just a suggestion, looks also good to me as is.

I thought giving individual path name will increase readability. But 
that doesn't seems to be adding much value on cost of repeated code.

So, I will make the suggested change in next version.

Thanks,

Akash

>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
