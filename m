Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B5A181911
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Mar 2020 14:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgCKNDC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Mar 2020 09:03:02 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:34781 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729442AbgCKNDC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Mar 2020 09:03:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583931781; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=f7e0eWxDfW7nEaHlYSKRi90iftgXxefmOtrDot6oFE0=; b=OzyT8G5maR+SLIXpWDtc/taW8IjnZTtT+Nv8bvH2N3NpMZPVCP8V5EcfYSdOxCSBdzEivnwk
 X8I5aGLD7SDml3pAn6pGtAvOVo9Z2tpKccS2v27NPlzXM+eMB8EgoVNr7ZDBUdteITPAurps
 dMEp8MdBCCli2J2LbBPHAgl/aiY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e68e184.7f6a583953e8-smtp-out-n02;
 Wed, 11 Mar 2020 13:03:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8C30AC433CB; Wed, 11 Mar 2020 13:02:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28AAFC433D2;
        Wed, 11 Mar 2020 13:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28AAFC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 0/6] Add interconnect support to UART, I2C, SPI and QSPI
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <20200309175954.GX24720@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <9e0afe90-5480-2db5-48fb-39cd8db6e8d1@codeaurora.org>
Date:   Wed, 11 Mar 2020 18:32:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309175954.GX24720@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 3/9/2020 11:29 PM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> do you plan to re-spin this series in the near future?
>
> Thanks
>
> Matthias

Hi  Matthias,

I will re-spin the series by 3/13.

Regards,

Akash

>
> On Mon, Feb 17, 2020 at 06:59:59PM +0530, Akash Asthana wrote:
>> dt-binding patch for UART, I2C and SPI.
>>   - https://patchwork.kernel.org/patch/11385965/ [Convert QUP bindings
>> 	to YAML and add ICC, pin swap doc]
>>
>> dt-binding patch for QSPI.
>>   - https://patchwork.kernel.org/cover/11386003/ [Convert QSPI binding
>> 	to YAML and add interconnect doc]
>>
>> Akash Asthana (6):
>>    soc: qcom: geni: Support for ICC voting
>>    tty: serial: qcom_geni_serial: Add interconnect support
>>    i2c: i2c-qcom-geni: Add interconnect support
>>    spi: spi-geni-qcom: Add interconnect support
>>    spi: spi-qcom-qspi: Add interconnect support
>>    arm64: dts: sc7180: Add interconnect for QUP and QSPI
>>
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi  | 199 ++++++++++++++++++++++++++++++++++
>>   drivers/i2c/busses/i2c-qcom-geni.c    |  84 +++++++++++++-
>>   drivers/spi/spi-geni-qcom.c           |  65 ++++++++++-
>>   drivers/spi/spi-qcom-qspi.c           |  38 ++++++-
>>   drivers/tty/serial/qcom_geni_serial.c |  84 ++++++++++++--
>>   include/linux/qcom-geni-se.h          |  31 ++++++
>>   6 files changed, 481 insertions(+), 20 deletions(-)
>>
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
