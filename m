Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE2D1BBA43
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 11:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgD1Js0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 05:48:26 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48223 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727053AbgD1Js0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 05:48:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588067305; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Xw4ZVugAhdVxw4oBomLW5BANY7Myju4oY0KQjPwaKq8=; b=MVMliwenbn3MGii853PkAH8Vl8ygTd4YCp0ea7NBZVMpzTwnvag08lLcsSQMPkqhwKxm7VSh
 a08Ysti6PQ4AvnJORnAKsTcmCK8r5Hkosct5gkBz1hl/qbc4uxwxaPWaZ8EcvuEw2VF+ZXik
 i6gw7GW+D5E+yb7J/iqxyOjvtyY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7fbe8.7f38d42d0538-smtp-out-n01;
 Tue, 28 Apr 2020 09:48:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 943B6C433CB; Tue, 28 Apr 2020 09:48:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.98] (unknown [157.48.58.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 095C8C433D2;
        Tue, 28 Apr 2020 09:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 095C8C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V4 3/9] soc: qcom: geni: Support for ICC voting
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-4-git-send-email-akashast@codeaurora.org>
 <20200415233603.GZ199755@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <d0170d64-cde6-896c-5165-9d4cae37a574@codeaurora.org>
Date:   Tue, 28 Apr 2020 15:18:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415233603.GZ199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 4/16/2020 5:06 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Wed, Apr 15, 2020 at 03:53:12PM +0530, Akash Asthana wrote:
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
>>
>>   drivers/soc/qcom/qcom-geni-se.c | 61 +++++++++++++++++++++++++++++++++++++++++
>>   include/linux/qcom-geni-se.h    | 31 +++++++++++++++++++++
>>   2 files changed, 92 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 7d622ea..1527bc4 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -720,6 +720,67 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
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
>> +		dev_err_ratelimited(se->dev, "Failed to get path:%d, ret:%d\n",
> Better be explicit that it's an ICC path and log icc_names[i] instead of i.
>
>> +					i, icc_err);
>> +	return icc_err;
>> +
>> +}
>> +EXPORT_SYMBOL(geni_icc_get);
>> +
>> +int geni_icc_vote_on(struct geni_se *se)
>> +{
>> +	int i, ret;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>> +		ret = icc_set_bw(se->icc_paths[i].path,
>> +			se->icc_paths[i].avg_bw, se->icc_paths[i].peak_bw);
> I'll leave it to others to decide whether it's ok to leave the
> implementation of the icc_enable/disable() APIs suggested on
> https://patchwork.kernel.org/patch/11467511/#23269555 for later.
>
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "ICC BW voting failed on path:%d, ret:%d\n",
>> +					i, ret);
> Instead of logging the index, which isn't very expressive, you could have
> a static string array of the path names ({"core", "config", "ddr"} or
> similar) that is used when logging errors in _vote_on/off().
>
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
>> +	int i, ret;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>> +		ret = icc_set_bw(se->icc_paths[i].path, 0, 0);
>> +		if (ret) {
>> +			dev_err_ratelimited(se->dev, "ICC BW remove failed on path:%d, ret:%d\n",
>> +					i, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(geni_icc_vote_off);
>> +
>>   static int geni_se_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
>> index dd46494..b5b9316 100644
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
>> @@ -33,6 +41,7 @@ struct clk;
>>    * @clk:		Handle to the core serial engine clock
>>    * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>>    * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
>> + * @icc_paths:		Array of ICC paths for SE
>>    */
>>   struct geni_se {
>>   	void __iomem *base;
>> @@ -41,6 +50,7 @@ struct geni_se {
>>   	struct clk *clk;
>>   	unsigned int num_clk_levels;
>>   	unsigned long *clk_perf_tbl;
>> +	struct geni_icc_path icc_paths[3];
> You also need enums for the paths, otherwise you end up with code like
> this, which isn't really self-explanatory:
>
>    gi2c->se.icc_paths[0].avg_bw = GENI_DEFAULT_BW;
>    gi2c->se.icc_paths[1].avg_bw = GENI_DEFAULT_BW;
>    gi2c->se.icc_paths[2].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
>
>    (from "[V4,5/9] i2c: i2c-qcom-geni: Add interconnect support")
>
> I know Bjorn asked in v1 to remove the enums you had, however it was
> a slightly different context. If we are sticking to use an array of
> 'struct geni_icc_path' (which reduces redundant code) the enums are
> 'needed'.

Ok

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
