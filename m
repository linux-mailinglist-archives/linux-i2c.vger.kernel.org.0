Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4F7187F0D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 11:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgCQK6K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 06:58:10 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:55037 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727137AbgCQK6H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 06:58:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584442685; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=cQuV8le5zJMXEg6Nx5zOixnWj9Q+mZRhKelZQ5b1wgI=; b=YTRSMtReZTeldRRQ/s+W10XDi07BysWPzT2aYGaTjvR7rO140fzBNLLKKhnYPL931DqAjY57
 weK7E2EpzlnvljP/4FyesPVBU3jJtxh3kY5nP7D6DbtSRuia90ovHiK2ZQuOHzAQd/1+t1Pp
 4Tsi3POQGO3lYbPu7+WNUEkwhUc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70ad36.7f29df409538-smtp-out-n03;
 Tue, 17 Mar 2020 10:57:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 99225C4478C; Tue, 17 Mar 2020 10:57:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1FF87C43636;
        Tue, 17 Mar 2020 10:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1FF87C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 3/8] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
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
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
Date:   Tue, 17 Mar 2020 16:27:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313204441.GJ144492@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 3/14/2020 2:14 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Fri, Mar 13, 2020 at 06:42:09PM +0530, Akash Asthana wrote:
>> V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
>> to reset at boot time.
> The v1 patch isn't relevant in the commit message, please just describe the
> problem. Also the crash only occurs when earlycon is used.
ok
>
>> As QUP core clock is shared among all the SE drivers present on particular
>> QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
>> is put to 0 from other SE drivers before real console comes up.
>>
>> As earlycon can't vote for it's QUP core need, to fix this add ICC
>> support to common/QUP wrapper driver and put vote for QUP core from
>> probe on behalf of earlycon and remove vote during sys suspend.
> Only removing the vote on suspend isn't ideal, the system might never get
> suspended. That said I don't have a really good alternative suggestion.
>
> One thing you could possibly do is to launch a delayed work, check
> console_device() every second or so and remove the vote when it returns
> non-NULL. Not claiming this would be a great solution ...
>
> The cleanest solution might be a notifier when the early console is
> unregistered, it seems somewhat over-engineered though ... Then again
> other (future) uart drivers with interconnect support might run into
> the same problem.

We are hitting this problem because QUP core clocks are shared among all 
the SE driver present in particular QUP wrapper, if other HW controllers 
has similar architecture we will hit this issue.

How about if we expose an API from common driver(geni-se) for putting 
QUP core BW vote to 0.

We call this from console probe just after uart_add_one_port call 
(console resources are enabled as part of this call) to put core quota 
to 0 on behalf of earlyconsole?

>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> Reported-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 7d622ea..d244dfc 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -90,6 +90,7 @@ struct geni_wrapper {
>>   	struct device *dev;
>>   	void __iomem *base;
>>   	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>> +	struct icc_path *icc_path_geni_to_core;
>>   };
>>   
>>   #define QUP_HW_VER_REG			0x4
>> @@ -747,11 +748,50 @@ static int geni_se_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> +#ifdef CONFIG_SERIAL_EARLYCON
>> +	wrapper->icc_path_geni_to_core = devm_of_icc_get(dev, "qup-core");
>> +	if (IS_ERR(wrapper->icc_path_geni_to_core))
>> +		return PTR_ERR(wrapper->icc_path_geni_to_core);
>> +	/*
>> +	 * Put minmal BW request on core clocks on behalf of early console.
>> +	 * The vote will be removed in suspend call.
>> +	 */
>> +	ret = icc_set_bw(wrapper->icc_path_geni_to_core, Bps_to_icc(1000),
>> +			Bps_to_icc(1000));
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
>> +			__func__);
>> +		return ret;
>> +	}
> What is ugly about this is that it's done for every QUP, not only the one
> with the early console. Again, I don't have a good solution for it, maybe
> it's a limitation we have to live with :(

There is one more limitation from QUP core side. Core clocks for both 
the QUP wrapper runs at same speed.

core2x_1 = core2x_2 = max(core2x_1, core2x_2);

So with above limitation and if we are removing early con vote from Core 
when real console comes up. It doesn't matter whether it's done for 
every QUP or the only with early console.

>
>> +#endif
>> +
>>   	dev_set_drvdata(dev, wrapper);
>>   	dev_dbg(dev, "GENI SE Driver probed\n");
>>   	return devm_of_platform_populate(dev);
>>   }
>>   
>> +static int __maybe_unused geni_se_sys_suspend(struct device *dev)
>> +{
>> +	struct geni_wrapper *wrapper = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +#ifdef CONFIG_SERIAL_EARLYCON
>> +	ret = icc_set_bw(wrapper->icc_path_geni_to_core, 0, 0);
> I think you only want to do this on the first suspend.
Ok, I can add that logic using global variable.
>
> Do we need to handle the case where no 'real' console is configured?
> In this case the early console would be active forever and setting
> the bandwidths to 0 might cause a similar crash than the one you are
> trying to fix. Not sure if that's a real world use case, but wanted to
> mention it. Maybe this is an argument of the notifier approach?
We can't support earlycon without real console.

As earlyconsole doesn't do any kind of resource enablement(SE clocks, 
pinctrl, etc) it assumes that resources are already enabled from 
previous stages.

So if real console doesn't come up no one will vote for that SE clock, 
and it will be disabled from clk late_init call which will result into 
un-clocked access.


>
>> +	if (ret) {
>> +		dev_err(dev, "%s: ICC BW remove failed for core\n",
>> +			__func__);
>> +		return ret;
> Aborting suspend seems too harsh since the QUP should still be fully
> functional unless there is a general problem with the interconnects.
>
> I would suggest to change the log to dev_warn() and return 0.

Ok

Thanks for reviewing the patch.

regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
