Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535CA18CBB6
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 11:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbgCTKf1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 06:35:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:12236 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726726AbgCTKf1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Mar 2020 06:35:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584700526; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=MCAHrRWNbzSLU10BfuTuGxSIA19JrHAmyPBXV01gh0I=; b=tnJ2vt5OGO+4nX8rq2tvAEErsn2jwOruy+eIWXvvDZLpXAzUQXdKOY4eVMTF/tRScoIRkNoo
 rhITnod/a8BoNlCUWY1h0xOk5dbboejLFIuFCZIN1T6FnlAWt3rh901pD4NRosWLP9j/sPn5
 JBVIixLtViRWOX7guIOAwvc+1I0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e749c65.7fd88d397378-smtp-out-n04;
 Fri, 20 Mar 2020 10:35:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A5057C432C2; Fri, 20 Mar 2020 10:35:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5CCAC433D2;
        Fri, 20 Mar 2020 10:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5CCAC433D2
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
 <e9293de6-004f-6005-8cb6-66f28c080ebe@codeaurora.org>
 <20200317190804.GS144492@google.com>
 <e95bd6e0-d1fd-9d13-47df-f7d08b443e37@codeaurora.org>
 <20200319204248.GA204494@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <a886cbae-310c-a7d7-7cfc-a693422ce570@codeaurora.org>
Date:   Fri, 20 Mar 2020 16:05:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319204248.GA204494@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 3/20/2020 2:12 AM, Matthias Kaehlcke wrote:
> On Wed, Mar 18, 2020 at 05:53:22PM +0530, Akash Asthana wrote:
>> Hi Matthias,
>>
>> On 3/18/2020 12:38 AM, Matthias Kaehlcke wrote:
>>> On Tue, Mar 17, 2020 at 05:18:34PM +0530, Akash Asthana wrote:
>>>> Hi Matthias,
>>>>
>>>> On 3/14/2020 2:58 AM, Matthias Kaehlcke wrote:
>>>>> Hi Akash,
>>>>>
>>>>> On Fri, Mar 13, 2020 at 06:42:10PM +0530, Akash Asthana wrote:
>>>>>> Get the interconnect paths for Uart based Serial Engine device
>>>>>> and vote according to the baud rate requirement of the driver.
>>>>>>
>>>>>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>>>>>> ---
>>>>>> Changes in V2:
>>>>>>     - As per Bjorn's comment, removed se == NULL check from geni_serial_icc_get
>>>>>>     - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>>>>>>     - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>>>>>>       path handle
>>>>>>     - As per Matthias comment, added error handling for icc_set_bw call
>>>>>>
>>>>>>     drivers/tty/serial/qcom_geni_serial.c | 69 +++++++++++++++++++++++++++++++++--
>>>>>>     1 file changed, 65 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>>>>>> index 272bae0..c8ad7e9 100644
>>>>>> --- a/drivers/tty/serial/qcom_geni_serial.c
>>>>>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>     static int qcom_geni_serial_request_port(struct uart_port *uport)
>>>>>>     {
>>>>>>     	struct platform_device *pdev = to_platform_device(uport->dev);
>>>>>> @@ -962,6 +975,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>>>>>     	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>>>>>>     	unsigned long clk_rate;
>>>>>>     	u32 ver, sampling_rate;
>>>>>> +	int ret;
>>>>>>     	qcom_geni_serial_stop_rx(uport);
>>>>>>     	/* baud rate */
>>>>>> @@ -983,6 +997,18 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>>>>>     	ser_clk_cfg = SER_CLK_EN;
>>>>>>     	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>>>>>> +	/*
>>>>>> +	 * Put BW vote only on CPU path as driver supports FIFO mode only.
>>>>>> +	 * Assume peak_bw as twice of avg_bw.
>>>>>> +	 */
>>>>>> +	port->se.avg_bw_cpu = Bps_to_icc(baud);
>>>>>> +	port->se.peak_bw_cpu = Bps_to_icc(2 * baud);
>>>>>> +	ret = icc_set_bw(port->se.icc_path_cpu_to_geni, port->se.avg_bw_cpu,
>>>>>> +			port->se.peak_bw_cpu);
>>>>>> +	if (ret)
>>>>>> +		dev_err(uport->dev, "%s: ICC BW voting failed for cpu\n",
>>>>>> +			__func__);
>>>>> Should this return an error? The port might not operate properly if the ICC
>>>>> bandwidth couldn't be configured
>>>> This is void function we can't return error from here. I guess it would be
>>>> somewhat okay if BW voting failed for CPU path but clk_set_rate failure is
>>>> more serious which is called from this function, I don't think it can be
>>>> move to somewhere else.
>>> ok, I missed that _set_termios() is void.
>>>
>>>>>>     static const struct uart_ops qcom_geni_console_pops = {
>>>>>> @@ -1308,6 +1358,17 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>>>>>     	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>>>>>>     	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>>>>>> +	ret = geni_serial_icc_get(&port->se);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +	/* Set the bus quota to a reasonable value */
>>>>>> +	port->se.avg_bw_core = console ? Bps_to_icc(1000) :
>>>>>> +		Bps_to_icc(CORE_2X_50_MHZ);
>>>>> Why different settings for console vs. non-console?
>>>> QUP FW runs on core clock. To support higher throughput we want FW to run at
>>>> higher speed.
>>>>
>>>> Since Console operate at 115200bps and BT operate at 3.2Mbps baud. We are
>>>> voting higher on core for BT usecase.
>>>>
>>>> These value are recommended from HW team.
>>> IIUC none of the values you mention are set in stone. 115200bps seems to be a
>>> 'standard' value for the serial console, but it could be a different baudrate.
>>> I guess you are referring to Qualcomm Bluetooth controllers, which are only one
>>> of many things that could be connected to the port. And what happens when a
>>> QCA BT controller is connected to a non-geni/QCA port, which doesn't know about
>>> its 'requirements'? The answer is that both the BT controller and the serial
>>> console configure the baudrate they need, hence using different values in
>>> _probe() is pointless.
>> Are you refering other UART drivers(not based on geni HW) as non-geni/QCA
>> port?
>>
>> We are not scaling core BW request based on real time need like we are doing
>> for other paths(CPU/DDR) instead we are using some fail proof value because,
>> FW runs on core clock and core behaves a bit different than other NOCs.
>>
>> We don't have any functional relation which maps actual throughput
>> requirement to core frequency need. In the past we faced few latency issues
>> because of core slowness (Although it was running much higher than actual
>> throughput requirement). To avoid such scenario we are using recommend value
>> from HW team. These fix value can support SE drivers operating at their max
>> possible speed(4Mbps in case of non-console).
> ok, I missed that the core clocks aren't scaled based on the configured
> baudrate. Apparently experience shows that it is not practical due to the
> latency issues you mention.
Yeah That is correct.
>> I agree that 115200bps seems to be a 'standard' value for the serial
>> console, but it could be a different baudrate.
>>
>> We are voting 1000 in case of console because it  has low power mode
>> use-case in android, where voting CORE_2X_50_MHZ can be reported as a power
>> issue.
>>
>> Actually we wanted to vote 960 for console but that is not possible with
>> current ICC design where the minimum value is 1000bps.  So any way core is
>> running at 50 MHz as 1000 crosses the threshold for 19.2 MHz (960)
>>
>> only with console.
> Thanks for the clarification. So if a board wanted to use a higher baudrate
> for the console it (currently) shouldn't be a problem. While it would be nice
> to have uniform settings for all UARTs it's also not a big deal to have two
> values, just wanted to make sure it's needed

Okay, but I would like to keep as it is with above mentioned reason.


Thanks,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
