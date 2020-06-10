Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDA71F53C5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 13:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgFJLrV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 07:47:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14877 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728468AbgFJLrV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Jun 2020 07:47:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591789639; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=P6IvvgfhO1WLSM0phj/YTWH+58FwnIzn495ez/bhLdU=; b=KrB0NXZLz/HrWdy/tGOJuM1jREqHsp+DUN/y/GVRNxZibEg9uWfapppmWzJB0+jQsmLpcaLi
 s7VMHhq6wZL1hdW7RJXVtZmn50YJrGBUiU3ukNpJQtLNnfeNqL9qUNQKi5+S3Xij7/Ie7CbA
 o7d09JnoA/RkRa9xs0rtOgkZPjY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ee0c83ea3d8a44743fc4079 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 11:47:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 80A5DC433A1; Wed, 10 Jun 2020 11:47:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.9] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA58AC433CB;
        Wed, 10 Jun 2020 11:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA58AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V7 RESEND 0/7] Add interconnect support to QSPI and QUP
 drivers
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org, msavaliy@codeaurora.org
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
 <20200609153802.GS4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <24d41d90-9bb8-28ec-e6b5-0b5a770bba21@codeaurora.org>
Date:   Wed, 10 Jun 2020 17:16:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200609153802.GS4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On 6/9/2020 9:08 PM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Tue, Jun 09, 2020 at 11:26:27AM +0530, Akash Asthana wrote:
>> This patch series is based on tag "next-20200608" of linux-next tree.
> Great, I was concerned there would be conflicts without a rebase.
>
>> Resending V7 patch with minor change in patch 6/7 (QSPI).
> It's not a pure resend, since it has changes in "spi:
> spi-qcom-qspi: Add interconnect support":
>
>    Changes in Resend V7:
>     - As per Matthias comment removed "unsigned int avg_bw_cpu" from
>        struct qcom_qspi as we are using that variable only once.
>
> Please increase the version number whenever you make changes or rebase.
Ok sure.
>
> Maintainers tend to be busy, before doing actual resends folks often
> send a ping/inquiry on the original patch/series, and only resend it when
> they didn't receive a response after some time.

Ok, I was under impression that resending patches is always a better 
approach@https://lore.kernel.org/patchwork/patch/1235198/.

Although it vary for every subsystem, I resend the series here to get 
approvals on SPI patches.

Regards,

Akash

>
> Thanks
>
> Matthias
>
>> dt-binding patch for QUP drivers.
>>   - https://patchwork.kernel.org/patch/11534149/ [Convert QUP bindings
>>          to YAML and add ICC, pin swap doc]
>>
>> High level design:
>>   - QUP wrapper/common driver.
>>     Vote for QUP core on behalf of earlycon from probe.
>>     Remove BW vote during earlycon exit call
>>
>>   - SERIAL driver.
>>     Vote only for CPU/CORE path because driver is in FIFO mode only
>>     Vote/unvote from qcom_geni_serial_pm func.
>>     Bump up the CPU vote from set_termios call based on real time need
>>
>>   - I2C driver.
>>     Vote for CORE/CPU/DDR path
>>     Vote/unvote from runtime resume/suspend callback
>>     As bus speed for I2C is fixed from probe itself no need for bump up.
>>
>>   - SPI QUP driver.
>>     Vote only for CPU/CORE path because driver is in FIFO mode only
>>     Vote/unvote from runtime resume/suspend callback
>>     Bump up CPU vote based on real time need per transfer.
>>
>>   - QSPI driver.
>>     Vote only for CPU path
>>     Vote/unvote from runtime resume/suspend callback
>>     Bump up CPU vote based on real time need per transfer.
>>
>> Changes in V2:
>>   - Add devm_of_icc_get() API interconnect core.
>>   - Add ICC support to common driver to fix earlyconsole crash.
>>
>> Changes in V3:
>>   - Define common ICC APIs in geni-se driver and use it across geni based
>>     I2C,SPI and UART driver.
>>
>> Changes in V4:
>>   - Add a patch to ICC core to scale peak requirement
>>     as twice of average if it is not mentioned explicilty.
>>
>> Changes in V5:
>>   - As per Georgi's suggestion removed patch from ICC core for assuming
>>     peak_bw as twice of average when it's not mentioned, instead assume it
>>     equall to avg_bw and keep this assumption in ICC client itself.
>>   - As per Matthias suggestion use enum for GENI QUP ICC paths.
>>
>> Changes in V6:
>>   - No Major change
>>
>> Changes in V7:
>>   - As per Matthias's comment removed usage of peak_bw variable because we don't
>>     have explicit peak requirement, we were voting peak = avg and this can be
>>     tracked using single variable for avg bw.
>>   - As per Matthias's comment improved print log.
>>
>> Akash Asthana (7):
>>    soc: qcom: geni: Support for ICC voting
>>    soc: qcom-geni-se: Add interconnect support to fix earlycon crash
>>    i2c: i2c-qcom-geni: Add interconnect support
>>    spi: spi-geni-qcom: Add interconnect support
>>    tty: serial: qcom_geni_serial: Add interconnect support
>>    spi: spi-qcom-qspi: Add interconnect support
>>    arm64: dts: sc7180: Add interconnect for QUP and QSPI
>>
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi  | 127 ++++++++++++++++++++++++++++
>>   drivers/i2c/busses/i2c-qcom-geni.c    |  26 +++++-
>>   drivers/soc/qcom/qcom-geni-se.c       | 150 ++++++++++++++++++++++++++++++++++
>>   drivers/spi/spi-geni-qcom.c           |  29 ++++++-
>>   drivers/spi/spi-qcom-qspi.c           |  56 ++++++++++++-
>>   drivers/tty/serial/qcom_geni_serial.c |  38 ++++++++-
>>   include/linux/qcom-geni-se.h          |  40 +++++++++
>>   7 files changed, 460 insertions(+), 6 deletions(-)
>>
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
>>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

