Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FDF1BBB21
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 12:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgD1KWD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 06:22:03 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:54531 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727771AbgD1KWC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 06:22:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588069322; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EMcwWVpuTkQ0cpuqYpXFbzPZiEdvxpXwtQZJuGAwl6o=; b=jvnMpYc0CWdcporg9etlOx3/FZ6Fmccblpip1CfAv2uTktaA/4KsAqIRiL+SEzGvYsOXtSJH
 HzlEfyqgPC49ta5897TnztMN/j8ZU7lFJkaa8cS8bR3dw6BLPhJLpxenBoe2q5OboEOPnwf2
 zsGVajz3NFAua/AMrLvvYVdCnpY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea803c9.7fbb858dddc0-smtp-out-n04;
 Tue, 28 Apr 2020 10:22:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 519CBC432C2; Tue, 28 Apr 2020 10:22:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.98] (unknown [157.48.58.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34FE7C433CB;
        Tue, 28 Apr 2020 10:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34FE7C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V4 4/9] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
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
 <1586946198-13912-5-git-send-email-akashast@codeaurora.org>
 <20200416003112.GA199755@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <146cf8db-3c09-39a6-2886-bec0db289948@codeaurora.org>
Date:   Tue, 28 Apr 2020 15:51:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416003112.GA199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 4/16/2020 6:01 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Wed, Apr 15, 2020 at 03:53:13PM +0530, Akash Asthana wrote:
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
>>   drivers/soc/qcom/qcom-geni-se.c       | 50 +++++++++++++++++++++++++++++++++++
>>   drivers/tty/serial/qcom_geni_serial.c |  7 +++++
>>   include/linux/qcom-geni-se.h          |  2 ++
>>   3 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 1527bc4..727ad2e 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -90,8 +90,11 @@ struct geni_wrapper {
>>   	struct device *dev;
>>   	void __iomem *base;
>>   	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>> +	struct geni_icc_path to_core;
>>   };
>>   
>> +static struct geni_wrapper *earlycon_wrapper;
>> +
>>   #define QUP_HW_VER_REG			0x4
>>   
>>   /* Common SE registers */
>> @@ -781,6 +784,26 @@ int geni_icc_vote_off(struct geni_se *se)
>>   }
>>   EXPORT_SYMBOL(geni_icc_vote_off);
>>   
>> +void geni_remove_earlycon_icc_vote(void)
>> +{
>> +	struct geni_wrapper *wrapper = earlycon_wrapper;
>> +	struct device_node *parent = of_get_next_parent(wrapper->dev->of_node);
>> +	struct device_node *child;
>> +
>> +	for_each_child_of_node(parent, child) {
>> +		if (of_device_is_compatible(child, "qcom,geni-se-qup")) {
>> +			wrapper = platform_get_drvdata(of_find_device_by_node(
>> +					child));
>> +			icc_put(wrapper->to_core.path);
>> +			wrapper->to_core.path = NULL;
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
>> @@ -808,6 +831,33 @@ static int geni_se_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> +#ifdef CONFIG_SERIAL_EARLYCON
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
>> +	ret = icc_set_bw(wrapper->to_core.path, GENI_DEFAULT_BW, 0);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
>> +			__func__);
>> +		return ret;
>> +	}
>> +
>> +	if (of_get_compatible_child(pdev->dev.of_node, "qcom,geni-debug-uart"))
>> +		earlycon_wrapper = wrapper;
>> +	of_node_put(pdev->dev.of_node);
>> +#endif
>> +
>>   	dev_set_drvdata(dev, wrapper);
>>   	dev_dbg(dev, "GENI SE Driver probed\n");
>>   	return devm_of_platform_populate(dev);
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 6119090..8c5d97c 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1090,6 +1090,12 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
>>   	__qcom_geni_serial_console_write(&dev->port, s, n);
>>   }
>>   
>> +static int qcom_geni_serial_earlycon_exit(struct console *con)
>> +{
>> +	geni_remove_earlycon_icc_vote();
>> +	return 0;
>> +}
>> +
>>   static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
>>   								const char *opt)
>>   {
>> @@ -1135,6 +1141,7 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
>>   	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
>>   
>>   	dev->con->write = qcom_geni_serial_earlycon_write;
>> +	dev->con->exit = qcom_geni_serial_earlycon_exit;
> The idea of using the exit handler of the early console to remove the
> votes seemed appealing at first, however it has a drawback: the bandwidth
> requests in geni_se_probe() are always made when CONFIG_SERIAL_EARLYCON=y,
> also when the system doesn't actually use an early console. On such a
> system the votes would never be removed.
>
> A possible alternative could seem to remove the vote at the end of
> qcom_geni_serial_probe() of the 'normal' console, but it has a similar
> problem: the system could not even have a normal console. One could
> possibly argue that CONFIG_SERIAL_QCOM_GENI_CONSOLE shouldn't be set
> on such a system, however it could be enabled to have a console for
> development, and in production the same kernel config is used, but
> with the console disabled through the device tree.
>
> I don't really have a good idea at this point, maybe we just need
> something as ugly as a delayed work to remove the votes. Other
> suggestions are welcome :)

I think we can do something like below. Before voting we are checking 
whether earlyconsole ("qcom_geni") exits or not.  The name is fixed from 
earlycon declaration file@drivers/tty/serial/qcom_geni_serial.c

OF_EARLYCON_DECLARE(qcom_geni, "qcom,geni-debug-uart",
                                 qcom_geni_serial_earlycon_setup);

====================================================================================

@@ -809,6 +809,8 @@ static int geni_se_probe(struct platform_device *pdev)
         struct device *dev = &pdev->dev;
         struct resource *res;
         struct geni_wrapper *wrapper;
+       struct console *bcon = NULL;
+       int earlycon_present = 0;
         int ret;

         wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
@@ -832,6 +834,15 @@ static int geni_se_probe(struct platform_device *pdev)
         }

  #ifdef CONFIG_SERIAL_EARLYCON
+       if (console_drivers)
+               for_each_console(bcon)
+                       if (!strcmp(bcon->name, "qcom_geni")) {
+                               earlycon_present = 1;
+                               break;
+                       }
+       if(!earlycon_present)
+               goto exit;
+
         wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
         if (IS_ERR(wrapper->to_core.path))
                 return PTR_ERR(wrapper->to_core.path);
@@ -858,6 +869,7 @@ static int geni_se_probe(struct platform_device *pdev)
         of_node_put(pdev->dev.of_node);
  #endif

+exit:
         dev_set_drvdata(dev, wrapper);
         dev_dbg(dev, "GENI SE Driver probed\n");
         return devm_of_platform_populate(dev);

======================================================================================

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
