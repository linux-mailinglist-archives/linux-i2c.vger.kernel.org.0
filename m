Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 507201A0A82
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 11:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgDGJzG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 05:55:06 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37711 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728176AbgDGJzG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 05:55:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586253306; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=82g7s3h7enEh+MnyvkTIef7YuXwt3pby8b9ZJPdxNEc=; b=vVcSsUsUPLHiI5YL3hcDFCJgeR2oydA3WQddJywRLogVhtOhgVme/pczj691Z8b6rveDQcJc
 anE/QQ0LgwkMNVxgdepwmV423WuS23zYfPHQzGE6f4Wd4XxGmw2iFxL017SzZvMDreq5QnAT
 56SQwPLWVg49/d4V8AtXG/11Kvs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c4dec.7fe852937340-smtp-out-n04;
 Tue, 07 Apr 2020 09:54:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E95CFC43636; Tue,  7 Apr 2020 09:54:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9E4AC433D2;
        Tue,  7 Apr 2020 09:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9E4AC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Mark Brown <broonie@kernel.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
 <20200331112352.GB4802@sirena.org.uk>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <f896d6e4-cc86-db46-a9b9-d7c98071b524@codeaurora.org>
Date:   Tue, 7 Apr 2020 15:24:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331112352.GB4802@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mark,

On 3/31/2020 4:53 PM, Mark Brown wrote:
> On Tue, Mar 31, 2020 at 04:39:35PM +0530, Akash Asthana wrote:
>
>> +	/*
>> +	 * Set BW quota for CPU as driver supports FIFO mode only.
>> +	 * Assume peak bw as twice of avg bw.
>> +	 */
>> +	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
>> +	ctrl->peak_bw_cpu = Bps_to_icc(2 * speed_hz);
> I thought you were going to factor this best guess handling of peak
> bandwidth out into the core?

I can centralize this for SPI, I2C and UART  in Common driver(QUP 
wrapper) but still for QSPI I have to keep this piece of code as is 
because It is not child of QUP wrapper(it doesn't use common code).

I am not sure whether I can move this " Assume peak_bw as twice of 
avg_bw if nothing is mentioned explicitly" to ICC core because the 
factor of 2 is chosen randomly by me.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
