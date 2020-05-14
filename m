Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503B91D281E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 08:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgENGqN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 02:46:13 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:12151 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725878AbgENGqN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 May 2020 02:46:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589438771; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=cKgghdOXnhc+2aVtVa22OYQ1NH4oXGcYByObqibfJT4=; b=Hr2LYpRyMi3DPJ60tR/Z4PWyTEWhoyjAWaD+1pnkqT2Mk+c/plkFTUyO9Zcl3ixCsknNpahw
 lPXG5z4mmq8wvkvAkOxIm3GvGM24Ei0y1meusQcJjP/pUzmCKM80PFPphwGJxibp1XIsV203
 ly4I49cGTEjhbALpo4BlwYIMa7U=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ebce92332b098143c915621 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 May 2020 06:45:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1886DC43636; Thu, 14 May 2020 06:45:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.246] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0AD8C433D2;
        Thu, 14 May 2020 06:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A0AD8C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 2/7] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
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
 <1588919619-21355-3-git-send-email-akashast@codeaurora.org>
 <20200508175938.GB4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <294b33e5-cf5a-8abc-2152-afa01664d962@codeaurora.org>
Date:   Thu, 14 May 2020 12:15:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508175938.GB4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 5/8/2020 11:29 PM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> overall this looks good to me, a few comments inline
>
> On Fri, May 08, 2020 at 12:03:34PM +0530, Akash Asthana wrote:
>> QUP core clock is shared among all the SE drivers present on particular
>> QUP wrapper, the system will reset(unclocked access) if earlycon used after
>> QUP core clock is put to 0 from other SE drivers before real console comes
>> up.
>>
>> As earlycon can't vote for it's QUP core need, to fix this add ICC
>> support to common/QUP wrapper driver and put vote for QUP core from
>> probe on behalf of earlycon and remove vote during earlycon exit call.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> Reported-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>> Change in V3:
>>   - Add geni_remove_earlycon_icc_vote API that will be used by earlycon
>>     exit function to remove ICC vote for earlyconsole.
>>   - Remove suspend/resume hook for geni-se driver as we are no longer
>>     removing earlyconsole ICC vote from system suspend, we are removing
>>     from earlycon exit.
>>
>> Change in V4:
>>   - As per Matthias comment make 'earlycon_wrapper' as static structure.
>>
>> Changes in V5:
>>   - Vote for core path only after checking whether "qcom_geni" earlycon is
>>     actually present or not by traversing over structure "console_drivers".
>>
>>   drivers/soc/qcom/qcom-geni-se.c       | 63 +++++++++++++++++++++++++++++++++++
>>   drivers/tty/serial/qcom_geni_serial.c |  7 ++++
>>   include/linux/qcom-geni-se.h          |  2 ++
>>   3 files changed, 72 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 63403bf..66fe6f2 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -3,6 +3,7 @@
>>   
>>   #include <linux/acpi.h>
>>   #include <linux/clk.h>
>> +#include <linux/console.h>
>>   #include <linux/slab.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/io.h>
>> @@ -90,11 +91,14 @@ struct geni_wrapper {
>>   	struct device *dev;
>>   	void __iomem *base;
>>   	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>> +	struct geni_icc_path to_core;
>>   };
>>   
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>   								"qup-memory"};
>>   
>> +static struct geni_wrapper *earlycon_wrapper;
>> +
>>   #define QUP_HW_VER_REG			0x4
>>   
>>   /* Common SE registers */
>> @@ -812,11 +816,33 @@ int geni_icc_disable(struct geni_se *se)
>>   }
>>   EXPORT_SYMBOL(geni_icc_disable);
>>   
>> +void geni_remove_earlycon_icc_vote(void)
>> +{
>> +	struct geni_wrapper *wrapper = earlycon_wrapper;
>> +	struct device_node *parent = of_get_next_parent(wrapper->dev->of_node);
> Do we need to check that earlycon_wrapper != NULL before dereferencing it?
> In theory this should not happen, but better be safe.
Ok, I will add NULL check.
>
>> +	struct device_node *child;
>> +
>> +	for_each_child_of_node(parent, child) {
>> +		if (of_device_is_compatible(child, "qcom,geni-se-qup")) {
>> +			wrapper = platform_get_drvdata(of_find_device_by_node(
>> +					child));
>> +			icc_put(wrapper->to_core.path);
>> +			wrapper->to_core.path = NULL;
> nit: setting the path to NULL isn't really needed IIUC.
icc_put just free the path and don't reinitialize the path to NULL, if 
the path is used after it is put target will crash. So just for safety I 
am setting this path to NULL.
>
>> +		}
>> +	}
>> +	of_node_put(parent);
>> +
>> +	earlycon_wrapper = NULL;
>> +}
>> +EXPORT_SYMBOL(geni_remove_earlycon_icc_vote);
>> +
>>   static int geni_se_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct resource *res;
>>   	struct geni_wrapper *wrapper;
>> +	struct console *bcon;
>> +	int earlycon_present = 0;
> use bool & true/false
>
> The variable is only used when CONFIG_SERIAL_EARLYCON is set, I think
> you need to add '__maybe_unused' to avoid a compiler warning then earlycon
> support is disabled.
>
> bikeshed: 'has_earlycon' would be slightly more concise (feel free to ignore).
Ok
>
>>   	int ret;
>>   
>>   	wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
>> @@ -839,6 +865,43 @@ static int geni_se_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> +#ifdef CONFIG_SERIAL_EARLYCON
>> +	if (console_drivers)
> The loop should have curly braces ("use braces when a loop contains more than
> a single simple statement"), even though the compiler doesn't need them in
> this case. This is not a loop, but I was told by a maintainer that it equally
> applies, which makes sense.
>
> You could avoid one level of indentation through:
Ok
>
> if (!console_drivers)
> 	goto exit;

I think I can omit this extra check because "for_each_console" will take 
care of this.

>
>> +		for_each_console(bcon)
> ditto (braces)
>
>> +			if (!strcmp(bcon->name, "qcom_geni")) {
>> +				earlycon_present = 1;
>> +				break;
>> +			}
>> +	if (!earlycon_present)
>> +		goto exit;
>> +
>> +	wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
>> +	if (IS_ERR(wrapper->to_core.path))
>> +		return PTR_ERR(wrapper->to_core.path);
>> +	/*
>> +	 * Put minmal BW request on core clocks on behalf of early console.
>> +	 * The vote will be removed earlycon exit function.
>> +	 *
>> +	 * Note: We are putting vote on each QUP wrapper instead only to which
>> +	 * earlycon is connected because QUP core clock of different wrapper
>> +	 * share same voltage domain. If core1 is put to 0, then core2 will
>> +	 * also run at 0, if not voted. Default ICC vote will be removed ASA
>> +	 * we touch any of the core clock.
>> +	 * core1 = core2 = max(core1, core2)
>> +	 */
>> +	ret = icc_set_bw(wrapper->to_core.path, GENI_DEFAULT_BW,
>> +							GENI_DEFAULT_BW);
> nit: the indentation is a bit odd. Align with 'wrapper->to_core.path' or a
> nearby tab stop?

ok


Thanks for providing the feedback.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

