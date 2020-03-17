Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E852D188286
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 12:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCQLtA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 07:49:00 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:12716 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726651AbgCQLs6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 07:48:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584445737; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ImsMLANJyyqAqzFibO+23o+qzgL8L6airh8AGaF0dic=; b=QCsJcv3wsAEJpvjoCwM9cVH+rCGTgbh/UyeogFuu7sSnx2+0V4ityQZQGvdQA44YQVhXDohe
 xoj4Rtn1Q/ARyfJwC6c5YtERn35TkNP9rE24dFD1HfJud9CzVs3JqDarvyNOr86hxq23Bn+g
 nbBKzO5XpdlzjotCkwi3D6sODdE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70b91b.7f82f2be4d50-smtp-out-n03;
 Tue, 17 Mar 2020 11:48:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D6DFC43636; Tue, 17 Mar 2020 11:48:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50122C433D2;
        Tue, 17 Mar 2020 11:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50122C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 4/8] tty: serial: qcom_geni_serial: Add interconnect
 support
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
 <1584105134-13583-5-git-send-email-akashast@codeaurora.org>
 <20200313212833.GK144492@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <e9293de6-004f-6005-8cb6-66f28c080ebe@codeaurora.org>
Date:   Tue, 17 Mar 2020 17:18:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313212833.GK144492@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 3/14/2020 2:58 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Fri, Mar 13, 2020 at 06:42:10PM +0530, Akash Asthana wrote:
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
>>   drivers/tty/serial/qcom_geni_serial.c | 69 +++++++++++++++++++++++++++++++++--
>>   1 file changed, 65 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 272bae0..c8ad7e9 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -184,6 +184,19 @@ static struct qcom_geni_serial_port qcom_geni_console_port = {
>>   	},
>>   };
>>   
>> +static int geni_serial_icc_get(struct geni_se *se)
>> +{
>> +	se->icc_path_geni_to_core = devm_of_icc_get(se->dev, "qup-core");
>> +	if (IS_ERR(se->icc_path_geni_to_core))
>> +		return PTR_ERR(se->icc_path_geni_to_core);
>> +
>> +	se->icc_path_cpu_to_geni = devm_of_icc_get(se->dev, "qup-config");
>> +	if (IS_ERR(se->icc_path_cpu_to_geni))
>> +		return PTR_ERR(se->icc_path_cpu_to_geni);
>> +
>> +	return 0;
>> +}
>> +
>>   static int qcom_geni_serial_request_port(struct uart_port *uport)
>>   {
>>   	struct platform_device *pdev = to_platform_device(uport->dev);
>> @@ -962,6 +975,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>   	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>>   	unsigned long clk_rate;
>>   	u32 ver, sampling_rate;
>> +	int ret;
>>   
>>   	qcom_geni_serial_stop_rx(uport);
>>   	/* baud rate */
>> @@ -983,6 +997,18 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>   	ser_clk_cfg = SER_CLK_EN;
>>   	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>>   
>> +	/*
>> +	 * Put BW vote only on CPU path as driver supports FIFO mode only.
>> +	 * Assume peak_bw as twice of avg_bw.
>> +	 */
>> +	port->se.avg_bw_cpu = Bps_to_icc(baud);
>> +	port->se.peak_bw_cpu = Bps_to_icc(2 * baud);
>> +	ret = icc_set_bw(port->se.icc_path_cpu_to_geni, port->se.avg_bw_cpu,
>> +			port->se.peak_bw_cpu);
>> +	if (ret)
>> +		dev_err(uport->dev, "%s: ICC BW voting failed for cpu\n",
>> +			__func__);
> Should this return an error? The port might not operate properly if the ICC
> bandwidth couldn't be configured

This is void function we can't return error from here. I guess it would 
be somewhat okay if BW voting failed for CPU path but clk_set_rate 
failure is more serious which is called from this function, I don't 
think it can be move to somewhere else.

>
>
>> +
>>   	/* parity */
>>   	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>>   	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
>> @@ -1208,16 +1234,40 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>>   		unsigned int new_state, unsigned int old_state)
>>   {
>>   	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>> -
>> +	int ret;
>>   	/* If we've never been called, treat it as off */
>>   	if (old_state == UART_PM_STATE_UNDEFINED)
>>   		old_state = UART_PM_STATE_OFF;
>>   
>> -	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>> +	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
>> +		/* Put BW vote for core clocks and CPU */
>> +		ret = icc_set_bw(port->se.icc_path_geni_to_core,
>> +			port->se.avg_bw_core, port->se.peak_bw_core);
>> +		if (ret)
>> +			dev_err(uport->dev, "%s: ICC BW voting failed for core\n",
>> +				__func__);
>> +
>> +		ret = icc_set_bw(port->se.icc_path_cpu_to_geni,
>> +			port->se.avg_bw_cpu, port->se.peak_bw_cpu);
>> +		if (ret)
>> +			dev_err(uport->dev, "%s: ICC BW voting failed for cpu\n",
>> +				__func__);
>> +
>>   		geni_se_resources_on(&port->se);
>> -	else if (new_state == UART_PM_STATE_OFF &&
>> -			old_state == UART_PM_STATE_ON)
>> +	} else if (new_state == UART_PM_STATE_OFF &&
>> +			old_state == UART_PM_STATE_ON) {
>>   		geni_se_resources_off(&port->se);
>> +		/* Remove BW vote from core clocks and CPU */
>> +		ret = icc_set_bw(port->se.icc_path_geni_to_core, 0, 0);
>> +		if (ret)
>> +			dev_err(uport->dev, "%s: ICC BW remove failed for core\n",
>> +				__func__);
>> +
>> +		ret = icc_set_bw(port->se.icc_path_cpu_to_geni, 0, 0);
>> +		if (ret)
>> +			dev_err(uport->dev, "%s: ICC BW remove failed for cpu\n",
>> +				__func__);
>> +	}
>>   }
>>   
>>   static const struct uart_ops qcom_geni_console_pops = {
>> @@ -1308,6 +1358,17 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>>   	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>>   
>> +	ret = geni_serial_icc_get(&port->se);
>> +	if (ret)
>> +		return ret;
>> +	/* Set the bus quota to a reasonable value */
>> +	port->se.avg_bw_core = console ? Bps_to_icc(1000) :
>> +		Bps_to_icc(CORE_2X_50_MHZ);
> Why different settings for console vs. non-console?

QUP FW runs on core clock. To support higher throughput we want FW to 
run at higher speed.

Since Console operate at 115200bps and BT operate at 3.2Mbps baud. We 
are voting higher on core for BT usecase.

These value are recommended from HW team.

>
>> +	port->se.peak_bw_core = console ? Bps_to_icc(1000) :
>> +		Bps_to_icc(CORE_2X_100_MHZ);
>> +	port->se.avg_bw_cpu = Bps_to_icc(1000);
>> +	port->se.peak_bw_cpu = Bps_to_icc(1000);
> 'Bps_to_icc(1000)' is a recurring theme in this series, could it be worth
> to have a constant for that? Could be GENI_DEFAULT_BW or similar.

ok

Thanks for reviewing the patch.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
