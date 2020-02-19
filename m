Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD93216457D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2020 14:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgBSN2j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Feb 2020 08:28:39 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:21030 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727108AbgBSN2j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Feb 2020 08:28:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582118919; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RiBbYZsBtdtuA9D5hCAmezC67/UMmEJUN5xIPHqAbR4=; b=aOfiNtkTN6wsYCsRqcGAfIdWDRwvynM5+NaOaXW30HAIMIaLXwWL0N+WnD6GeFK/rho0EvRh
 XUM5K0NUx5Jkf8jPXz/VECWxF9Spbn6/k6WCbM6/B9HQ1VeKGSltl5tGx0BCpTxKnEK0qQyT
 0mR5Gbu1vy5GXKWhTAZqzvgh0Zg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4d37fa.7f1091276e68-smtp-out-n02;
 Wed, 19 Feb 2020 13:28:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 91CFBC4479D; Wed, 19 Feb 2020 13:28:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CDCFFC43383;
        Wed, 19 Feb 2020 13:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CDCFFC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 2/6] tty: serial: qcom_geni_serial: Add interconnect
 support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-3-git-send-email-akashast@codeaurora.org>
 <20200218031552.GW955802@ripper>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <89eac104-3912-5947-48bf-8f204aae5628@codeaurora.org>
Date:   Wed, 19 Feb 2020 18:58:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218031552.GW955802@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/18/2020 8:45 AM, Bjorn Andersson wrote:
> On Mon 17 Feb 05:30 PST 2020, Akash Asthana wrote:
>
>> Get the interconnect paths for Uart based Serial Engine device
>> and vote according to the baud rate requirement of the driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 84 ++++++++++++++++++++++++++++++-----
>>   1 file changed, 74 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 191abb1..a8fb2b7 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -174,6 +174,35 @@ static struct qcom_geni_serial_port qcom_geni_console_port = {
>>   	},
>>   };
>>   
>> +static int geni_serial_icc_get(struct geni_se *se)
>> +{
>> +	if (!se)
> If se == NULL the kernel has already oopsed as it dereferenced port->se
> a few lines before calling this function.
Ok, I will remove this check.
>> +		return -EINVAL;
>> +
>> +	se->icc_path[GENI_TO_CORE] = of_icc_get(se->dev, "qup-core");
>> +	if (IS_ERR(se->icc_path[GENI_TO_CORE]))
>> +		return PTR_ERR(se->icc_path[GENI_TO_CORE]);
>> +
>> +	se->icc_path[CPU_TO_GENI] = of_icc_get(se->dev, "qup-config");
>> +	if (IS_ERR(se->icc_path[CPU_TO_GENI])) {
>> +		icc_put(se->icc_path[GENI_TO_CORE]);
>> +		se->icc_path[GENI_TO_CORE] = NULL;
> You're going to fail probe when this happens, so why the need to reset
> this path?
Ok, I will remove this
>> +		return PTR_ERR(se->icc_path[CPU_TO_GENI]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void geni_serial_icc_put(struct geni_se *se)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(se->icc_path); i++) {
>> +		icc_put(se->icc_path[i]);
> In geni_serial_icc_get() you hard open code this loop, so why not do the
> same here, to maintain some symmetry.
Ok
>
>> +		se->icc_path[i] = NULL;
> Again, what's the purpose of this clear?
Will remove this
>
>> +	}
>> +}
>> +
>>   static int qcom_geni_serial_request_port(struct uart_port *uport)
>>   {
>>   	struct platform_device *pdev = to_platform_device(uport->dev);
>> @@ -949,6 +978,12 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>   	ser_clk_cfg = SER_CLK_EN;
>>   	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>>   
>> +	/* Put BW vote only on CPU path as driver supports FIFO mode only */
>> +	port->se.avg_bw_cpu = Bps_to_icc(baud);
>> +	port->se.peak_bw_cpu = Bps_to_icc(2 * baud);
>> +	icc_set_bw(port->se.icc_path[CPU_TO_GENI], port->se.avg_bw_cpu,
>> +			port->se.peak_bw_cpu);
>> +
>>   	/* parity */
>>   	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>>   	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
>> @@ -1179,11 +1214,20 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>>   	if (old_state == UART_PM_STATE_UNDEFINED)
>>   		old_state = UART_PM_STATE_OFF;
>>   
>> -	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>> +	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
>> +		/* Put BW vote for core clocks and CPU */
>> +		icc_set_bw(port->se.icc_path[GENI_TO_CORE],
>> +			port->se.avg_bw_core, port->se.peak_bw_core);
>> +		icc_set_bw(port->se.icc_path[CPU_TO_GENI], port->se.avg_bw_cpu,
>> +			port->se.peak_bw_cpu);
>>   		geni_se_resources_on(&port->se);
>> -	else if (new_state == UART_PM_STATE_OFF &&
>> -			old_state == UART_PM_STATE_ON)
>> +	} else if (new_state == UART_PM_STATE_OFF &&
>> +			old_state == UART_PM_STATE_ON) {
>>   		geni_se_resources_off(&port->se);
>> +		/* Remove BW vote from core clocks and CPU */
>> +		icc_set_bw(port->se.icc_path[GENI_TO_CORE], 0, 0);
>> +		icc_set_bw(port->se.icc_path[CPU_TO_GENI], 0, 0);
>> +	}
>>   }
>>   
>>   static const struct uart_ops qcom_geni_console_pops = {
>> @@ -1274,15 +1318,30 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>>   	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>>   
>> +	ret = geni_serial_icc_get(&port->se);
>> +	if (ret)
>> +		return ret;
>> +	/* Set the bus quota to a reasonable value */
>> +	port->se.avg_bw_core = console ? Bps_to_icc(1000) :
>> +		Bps_to_icc(CORE_2X_50_MHZ);
>> +	port->se.peak_bw_core = console ? Bps_to_icc(1000) :
>> +		Bps_to_icc(CORE_2X_100_MHZ);
>> +	port->se.avg_bw_cpu = Bps_to_icc(1000);
>> +	port->se.avg_bw_cpu = Bps_to_icc(1000);
>> +
>>   	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
>>   			"qcom_geni_serial_%s%d",
>>   			uart_console(uport) ? "console" : "uart", uport->line);
>> -	if (!port->name)
>> -		return -ENOMEM;
>> +	if (!port->name) {
>> +		ret = -ENOMEM;
>> +		goto geni_serial_put_icc;
> Rather than reworking the error handling like this, please introduce a
> devm_icc_get() function in the interconnect API.
>
> Regards,
> Bjorn

Ok will introduce devm_icc_get API.

Regards,

Akash

>> +	}
>>   
>>   	irq = platform_get_irq(pdev, 0);
>> -	if (irq < 0)
>> -		return irq;
>> +	if (irq < 0) {
>> +		ret = irq;
>> +		goto geni_serial_put_icc;
>> +	}
>>   	uport->irq = irq;
>>   	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
>>   
>> @@ -1295,7 +1354,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   
>>   	ret = uart_add_one_port(drv, uport);
>>   	if (ret)
>> -		return ret;
>> +		goto geni_serial_put_icc;
>>   
>>   	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>>   	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
>> @@ -1303,7 +1362,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	if (ret) {
>>   		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>>   		uart_remove_one_port(drv, uport);
>> -		return ret;
>> +		goto geni_serial_put_icc;
>>   	}
>>   
>>   	/*
>> @@ -1320,11 +1379,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   		if (ret) {
>>   			device_init_wakeup(&pdev->dev, false);
>>   			uart_remove_one_port(drv, uport);
>> -			return ret;
>> +			goto geni_serial_put_icc;
>>   		}
>>   	}
>>   
>>   	return 0;
>> +
>> +geni_serial_put_icc:
>> +	geni_serial_icc_put(&port->se);
>> +	return ret;
>>   }
>>   
>>   static int qcom_geni_serial_remove(struct platform_device *pdev)
>> @@ -1335,6 +1398,7 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
>>   	dev_pm_clear_wake_irq(&pdev->dev);
>>   	device_init_wakeup(&pdev->dev, false);
>>   	uart_remove_one_port(drv, &port->uport);
>> +	geni_serial_icc_put(&port->se);
>>   
>>   	return 0;
>>   }
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
