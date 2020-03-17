Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E2C187D9D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgCQJ7K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:59:10 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32195 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725916AbgCQJ7K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 05:59:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584439149; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zk0/3MnwTvjKwUaJCc0k9Bn95kVQ4cS9R+JoWid1pcA=; b=ZvJ5gETVyXD0t3EEBoSp5DAusMkO7LbordCHempCAeLJD0TI6EnjRu8f+AVMrzyE2xAUUfiL
 nf7HwwJqAN9dURqOYujkg8pXs2d1dKH6f98dV/udDzPvaB1FVm1FCWSqrdlLVRVQ0hL9FaDD
 /h3icoLU6SPLGVyhqAxUunVcWO8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e709f6c.7f870a93b378-smtp-out-n03;
 Tue, 17 Mar 2020 09:59:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E8EBC43636; Tue, 17 Mar 2020 09:59:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C64CFC433D2;
        Tue, 17 Mar 2020 09:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C64CFC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 2/8] soc: qcom: geni: Support for ICC voting
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
 <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
 <20200313164207.GH144492@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <faf3cbea-bce7-3592-cfae-93613a8c7e26@codeaurora.org>
Date:   Tue, 17 Mar 2020 15:28:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313164207.GH144492@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 3/13/2020 10:12 PM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Fri, Mar 13, 2020 at 06:42:08PM +0530, Akash Asthana wrote:
>> Add necessary macros and structure variables to support ICC BW
>> voting from individual SE drivers.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V2:
>>   - As per Bjorn's comment dropped enums for ICC paths, given the three
>>     paths individual members
>>
>>   include/linux/qcom-geni-se.h | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
>> index dd46494..eaae16e 100644
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
>> @@ -33,6 +35,15 @@ struct clk;
>>    * @clk:		Handle to the core serial engine clock
>>    * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>>    * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
>> + * @icc_path_geni_to_core:	ICC path handle for geni to core
>> + * @icc_path_cpu_to_geni:	ICC path handle for cpu to geni
>> + * @icc_path_geni_to_ddr:	ICC path handle for geni to ddr
>> + * @avg_bw_core:	Average bus bandwidth value for QUP core 2x clock
>> + * @peak_bw_core:	Peak bus bandwidth value for QUP core 2x clock
>> + * @avg_bw_cpu:		Average bus bandwidth value for CPU
>> + * @peak_bw_cpu:	Peak bus bandwidth value for CPU
>> + * @avg_bw_ddr:		Average bus bandwidth value for DDR
>> + * @peak_bw_ddr:	Peak bus bandwidth value for DDR
>>    */
>>   struct geni_se {
>>   	void __iomem *base;
>> @@ -41,6 +52,15 @@ struct geni_se {
>>   	struct clk *clk;
>>   	unsigned int num_clk_levels;
>>   	unsigned long *clk_perf_tbl;
>> +	struct icc_path *icc_path_geni_to_core;
>> +	struct icc_path *icc_path_cpu_to_geni;
>> +	struct icc_path *icc_path_geni_to_ddr;
>> +	unsigned int avg_bw_core;
>> +	unsigned int peak_bw_core;
>> +	unsigned int avg_bw_cpu;
>> +	unsigned int peak_bw_cpu;
>> +	unsigned int avg_bw_ddr;
>> +	unsigned int peak_bw_ddr;
> Those are a lot of new individual struct members. How about clustering
> them, e.g.:
>
> struct geni_icc_path {
> 	struct icc_path *path;
> 	unsigned int avg_bw;
> 	unsigned int peak_bw;
> };
I guess it would be better to add this structure  ICC driver as you 
suggested@https://patchwork.kernel.org/patch/11436905/.
> struct geni_iccs_paths {
> 	struct geni_icc_path to_core;
> 	struct geni_icc_path from_cpu;
> 	struct geni_icc_path to_ddr;
> };
>
> And 'struct geni_se' just gets this entry:
>
> 	struct geni_icc_paths icc;
>
> or alternatively three 'struct geni_icc_path' entries.

ok

Thanks for reviewing.

Regards

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
