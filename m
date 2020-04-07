Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8F41A078E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 08:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgDGGp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 02:45:57 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:41930 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726901AbgDGGp4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 02:45:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586241955; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zIGJkTFk+A1yVQgUJUnGZJR/z1wDuOGHghX531ajZuM=; b=amyO11R1VmYyfot4dBsglL7Fg435HQXxicrMnNfnSRk+uoNVrjuKJr6d8PVp1bP2K3Q0FZG4
 +fMF28rcovR89bb93KyhtJiIVYZEOGVUXsZ2s2U3C5S2Wk54K7FVDrm4HK3hL3gv65Ilhsj0
 2v/KXYjYycgWf9ZiJ7XCVtdJBlc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c2194.7f9bea75cd18-smtp-out-n05;
 Tue, 07 Apr 2020 06:45:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EAA51C4478C; Tue,  7 Apr 2020 06:45:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8556DC433BA;
        Tue,  7 Apr 2020 06:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8556DC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 2/8] soc: qcom: geni: Support for ICC voting
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        georgi.djakov@linaro.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, dianders@chromium.org, evgreen@chromium.org
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-3-git-send-email-akashast@codeaurora.org>
 <20200331233209.GF254911@minitux>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <45191b98-60fa-cd49-3067-d58c128d2c9c@codeaurora.org>
Date:   Tue, 7 Apr 2020 12:15:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331233209.GF254911@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bjorn,

On 4/1/2020 5:02 AM, Bjorn Andersson wrote:
> On Tue 31 Mar 04:09 PDT 2020, Akash Asthana wrote:
>
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
> Afaict it's only this that might be passed as NULL, so please drop these
> conditionals (keep the last one).
IIUC you're suggesting to drop if (icc_core/cpu) but keep if (icc_ddr) ?
>
>> +		se->to_core.path = devm_of_icc_get(se->dev, "qup-core");
>> +		if (IS_ERR(se->to_core.path))
> It would be useful to print an error message here (if PTR_ERR(path) !=
> -EPROBE_DEFER).
okay
>
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
> icc_set_bw(NULL, ...) is valid and will return 0, so these checks
> doesn't add any value.
Yeah, ok
>
>> +		ret = icc_set_bw(se->to_core.path, se->to_core.avg_bw,
>> +			se->to_core.peak_bw);
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "%s: ICC BW voting failed for core\n",
>> +						__func__);
> Please drop the __func__, the message is specific enough.

ok

Regards,

Akash

>
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
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(geni_icc_vote_on);
>> +
>> +int geni_icc_vote_off(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	if (se->to_core.path) {
>> +		ret = icc_set_bw(se->to_core.path, 0, 0);
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "%s: ICC BW remove failed for core\n",
>> +						__func__);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (se->from_cpu.path) {
>> +		ret = icc_set_bw(se->from_cpu.path, 0, 0);
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "%s: ICC BW remove failed for cpu\n",
>> +						__func__);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (se->to_ddr.path) {
>> +		ret = icc_set_bw(se->to_ddr.path, 0, 0);
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "%s: ICC BW remove failed for ddr\n",
>> +						__func__);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(geni_icc_vote_off);
> Given that these two functions only switch the bandwidth request between
> some value and 0, I really think we should carry a "bool enabled" on the
> path and replace these two functions with
> icc_bulk_enable()/icc_bulk_disable().
>
> The added benefit of this would be that you call icc_set_bw() instead of
> changing the geni_icc_path->{avg_bw,peak_bw} and don't need to keep
> track of them here.
>
> Regards,
> Bjorn
>> +
>>   static int geni_se_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
>> index dd46494..a83c86b 100644
>> --- a/include/linux/qcom-geni-se.h
>> +++ b/include/linux/qcom-geni-se.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _LINUX_QCOM_GENI_SE
>>   #define _LINUX_QCOM_GENI_SE
>>   
>> +#include <linux/interconnect.h>
>> +
>>   /* Transfer mode supported by GENI Serial Engines */
>>   enum geni_se_xfer_mode {
>>   	GENI_SE_INVALID,
>> @@ -25,6 +27,12 @@ enum geni_se_protocol_type {
>>   struct geni_wrapper;
>>   struct clk;
>>   
>> +struct geni_icc_path {
>> +	struct icc_path *path;
>> +	unsigned int avg_bw;
>> +	unsigned int peak_bw;
>> +};
>> +
>>   /**
>>    * struct geni_se - GENI Serial Engine
>>    * @base:		Base Address of the Serial Engine's register block
>> @@ -33,6 +41,9 @@ struct clk;
>>    * @clk:		Handle to the core serial engine clock
>>    * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>>    * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
>> + * @to_core:	ICC path structure for geni to core
>> + * @from_cpu:	ICC path structure for cpu to geni
>> + * @to_ddr:	ICC path structure for geni to ddr
>>    */
>>   struct geni_se {
>>   	void __iomem *base;
>> @@ -41,6 +52,9 @@ struct geni_se {
>>   	struct clk *clk;
>>   	unsigned int num_clk_levels;
>>   	unsigned long *clk_perf_tbl;
>> +	struct geni_icc_path to_core;
>> +	struct geni_icc_path from_cpu;
>> +	struct geni_icc_path to_ddr;
>>   };
>>   
>>   /* Common SE registers */
>> @@ -229,6 +243,21 @@ struct geni_se {
>>   #define GENI_SE_VERSION_MINOR(ver) ((ver & HW_VER_MINOR_MASK) >> HW_VER_MINOR_SHFT)
>>   #define GENI_SE_VERSION_STEP(ver) (ver & HW_VER_STEP_MASK)
>>   
>> +/*
>> + * Define bandwidth thresholds that cause the underlying Core 2X interconnect
>> + * clock to run at the named frequency. These baseline values are recommended
>> + * by the hardware team, and are not dynamically scaled with GENI bandwidth
>> + * beyond basic on/off.
>> + */
>> +#define CORE_2X_19_2_MHZ		960
>> +#define CORE_2X_50_MHZ			2500
>> +#define CORE_2X_100_MHZ			5000
>> +#define CORE_2X_150_MHZ			7500
>> +#define CORE_2X_200_MHZ			10000
>> +#define CORE_2X_236_MHZ			16383
>> +
>> +#define GENI_DEFAULT_BW			Bps_to_icc(1000)
>> +
>>   #if IS_ENABLED(CONFIG_QCOM_GENI_SE)
>>   
>>   u32 geni_se_get_qup_hw_version(struct geni_se *se);
>> @@ -416,5 +445,12 @@ int geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len,
>>   void geni_se_tx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
>>   
>>   void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
>> +
>> +int geni_icc_get(struct geni_se *se, const char *icc_core, const char *icc_cpu,
>> +		const char *icc_ddr);
>> +
>> +int geni_icc_vote_on(struct geni_se *se);
>> +
>> +int geni_icc_vote_off(struct geni_se *se);
>>   #endif
>>   #endif
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
