Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A51F1A09F2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 11:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbgDGJTz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 05:19:55 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:12075 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728075AbgDGJTz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 05:19:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586251194; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JkT2sTUJ8FGclBebPphK1ZlCoEL/hiXwiZW3sDem2YU=; b=qhYPqTFqPrG9SQpb86ucsZoUZtS43ZIOcdOrXdqqnVfN+ds35eN0KTbmuOXRJVCI3Y6jgTn1
 DcQZhwDwMG3nZeoESMbzmhIO1C/BA7toB4Ie7HP0uK49flOZ6yTr+sr6EGoUIP2ei0HqJrOw
 Pj5XmJIP0jiIP5pjXx5pkeALPyY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c45a9.7fb55a6fa688-smtp-out-n03;
 Tue, 07 Apr 2020 09:19:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B635FC4478C; Tue,  7 Apr 2020 09:19:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26D7AC433F2;
        Tue,  7 Apr 2020 09:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26D7AC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 6/8] tty: serial: qcom_geni_serial: Add interconnect
 support
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
 <1585652976-17481-7-git-send-email-akashast@codeaurora.org>
 <20200331193949.GK199755@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <db7d1369-33aa-b0b3-ec44-2018ea382887@codeaurora.org>
Date:   Tue, 7 Apr 2020 14:49:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331193949.GK199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 4/1/2020 1:09 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Tue, Mar 31, 2020 at 04:39:34PM +0530, Akash Asthana wrote:
>> Get the interconnect paths for Uart based Serial Engine device
>> and vote according to the baud rate requirement of the driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V2:
>>   - As per Bjorn's comment, removed se == NULL check from geni_serial_icc_get
>>   - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>>     path handle
>>   - As per Matthias comment, added error handling for icc_set_bw call
>>
>> Changes in V3:
>>   - As per Matthias comment, use common library APIs defined in geni-se
>>     driver for ICC functionality.
>>
>>   drivers/tty/serial/qcom_geni_serial.c | 28 +++++++++++++++++++++++++---
>>   1 file changed, 25 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 8c5d97c..2befe72 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -965,6 +965,14 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>   	ser_clk_cfg = SER_CLK_EN;
>>   	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>>   
>> +	/*
>> +	 * Bump up BW vote on CPU path as driver supports FIFO mode only.
>> +	 * Assume peak_bw as twice of avg_bw.
>> +	 */
>> +	port->se.from_cpu.avg_bw = Bps_to_icc(baud);
>> +	port->se.from_cpu.peak_bw = Bps_to_icc(2 * baud);
>> +	geni_icc_vote_on(&port->se);
>> +
>>   	/* parity */
>>   	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>>   	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
>> @@ -1202,11 +1210,14 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>>   	if (old_state == UART_PM_STATE_UNDEFINED)
>>   		old_state = UART_PM_STATE_OFF;
>>   
>> -	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>> +	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
>> +		geni_icc_vote_on(&port->se);
>>   		geni_se_resources_on(&port->se);
>> -	else if (new_state == UART_PM_STATE_OFF &&
>> -			old_state == UART_PM_STATE_ON)
>> +	} else if (new_state == UART_PM_STATE_OFF &&
>> +			old_state == UART_PM_STATE_ON) {
>>   		geni_se_resources_off(&port->se);
>> +		geni_icc_vote_off(&port->se);
>> +	}
>>   }
>>   
>>   static const struct uart_ops qcom_geni_console_pops = {
>> @@ -1304,6 +1315,17 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   			return -ENOMEM;
>>   	}
>>   
>> +	ret = geni_icc_get(&port->se, "qup-core", "qup-config", NULL);
>> +	if (ret)
>> +		return ret;
>> +	/* Set the bus quota to a reasonable value */
>> +	port->se.to_core.avg_bw = console ? GENI_DEFAULT_BW :
>> +		Bps_to_icc(CORE_2X_50_MHZ);
>> +	port->se.to_core.peak_bw = console ? GENI_DEFAULT_BW :
>> +		Bps_to_icc(CORE_2X_100_MHZ);
> I'm still unconvinced about the setting of the core bandwidth based on
> whether the port is used as console or not. It could possibly break
> consoles working at speeds > 115kbs and reserve more bandwidth than
> necessary for ports with 'slow' devices.
>
> Why not scale the core bandwidth dynamically? You said earlier that there
> is no clear/linear translation of port speed to bandwidth, but you could
> use the same logic that is implicitly used here:
>
> 	if (baudrate <= 115200) {
> 		avg_bw = GENI_DEFAULT_BW;
> 		peak_bw = GENI_DEFAULT_BW;
> 	} else {
> 		avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
> 		peak_bw = Bps_to_icc(CORE_2X_100_MHZ);
> 	}
>
> This would be more robust, power efficient and future readers of the
> code don't have to wonder "why is the console special?" when our
> discussions on this will be long forgotten.

Okay, I will add this piece of code in set_termios call of the driver 
because I don't have baudrate information during probe. It covers the 
console case mentioned in probe function.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
