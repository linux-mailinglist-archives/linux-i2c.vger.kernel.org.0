Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 095701A0A4F
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 11:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgDGJlV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 05:41:21 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33877 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbgDGJlU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 05:41:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586252480; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=++wZMu6+upyOo/X2jGPlQvmS8PlK2mzO0cecdjSV+I8=; b=U21FymACdBhdtWrPj8AOo7++ndhVN1pNXciICYQSUlBzgoJmLIoXIBmd3dm9ddyOrcyMN4hj
 IMoIpKMLPXvOeRkyz/hEaQ/ikGMS+gW7VO2prbHwuWU6q8WbTBMphmH8D3aa0dGE9an1ziXf
 tiW15iJhxXimekVmyVma/1QvAQ8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c4aac.7fcfe2b38298-smtp-out-n03;
 Tue, 07 Apr 2020 09:41:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11AB9C44791; Tue,  7 Apr 2020 09:40:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 39832C43636;
        Tue,  7 Apr 2020 09:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 39832C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 6/8] tty: serial: qcom_geni_serial: Add interconnect
 support
From:   Akash Asthana <akashast@codeaurora.org>
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
 <db7d1369-33aa-b0b3-ec44-2018ea382887@codeaurora.org>
Message-ID: <694f2664-3ef2-b3a6-c447-c33086172b02@codeaurora.org>
Date:   Tue, 7 Apr 2020 15:10:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <db7d1369-33aa-b0b3-ec44-2018ea382887@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,


>>>     static const struct uart_ops qcom_geni_console_pops = {
>>> @@ -1304,6 +1315,17 @@ static int qcom_geni_serial_probe(struct 
>>> platform_device *pdev)
>>>               return -ENOMEM;
>>>       }
>>>   +    ret = geni_icc_get(&port->se, "qup-core", "qup-config", NULL);
>>> +    if (ret)
>>> +        return ret;
>>> +    /* Set the bus quota to a reasonable value */
>>> +    port->se.to_core.avg_bw = console ? GENI_DEFAULT_BW :
>>> +        Bps_to_icc(CORE_2X_50_MHZ);
>>> +    port->se.to_core.peak_bw = console ? GENI_DEFAULT_BW :
>>> +        Bps_to_icc(CORE_2X_100_MHZ);
>> I'm still unconvinced about the setting of the core bandwidth based on
>> whether the port is used as console or not. It could possibly break
>> consoles working at speeds > 115kbs and reserve more bandwidth than
>> necessary for ports with 'slow' devices.
>>
>> Why not scale the core bandwidth dynamically? You said earlier that 
>> there
>> is no clear/linear translation of port speed to bandwidth, but you could
>> use the same logic that is implicitly used here:
>>
>>     if (baudrate <= 115200) {
>>         avg_bw = GENI_DEFAULT_BW;
>>         peak_bw = GENI_DEFAULT_BW;

I will make peak_bw = 2 * DEFAULT  to generalize this logic and will 
factor it out in common driver.

Anyway with  peak_bw = GENI_DEFAULT_BW or 2 * GENI_DEFAULT_BW core clock 
is going to tick at 50 MHz.

9600(19.2 MHz) < GENI_DEFAULT_BW, 2 * GENI_DEFAULT_BW < 2500(50 MHz).


Regards,

Akash

>>     } else {
>>         avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
>>         peak_bw = Bps_to_icc(CORE_2X_100_MHZ);
>>     }
>>
>> This would be more robust, power efficient and future readers of the
>> code don't have to wonder "why is the console special?" when our
>> discussions on this will be long forgotten.
>
> Okay, I will add this piece of code in set_termios call of the driver 
> because I don't have baudrate information during probe. It covers the 
> console case mentioned in probe function.
>
> Regards,
>
> Akash
>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
