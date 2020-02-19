Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5288D164545
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2020 14:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgBSNZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Feb 2020 08:25:18 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:43783 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726671AbgBSNZS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Feb 2020 08:25:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582118718; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3pi37aeFdTc9ux6KC9TCHBTlXPkIAjY1jTiCkjuxmZg=; b=azybGwCb2V9EYm7T/afroWgIwFyX7e+uvKWUUNSfKfbNiK6TGUfJBvFnNh1wqXzZp5+rP99d
 RFsGrfQn5lEevAo8cKXlai2RPgybJ5evOCIwlmUf4G79K0FJ3bODmbXmhMzQi0ct3DlL5t0s
 c/u8CXYiXLic1O178GLYL2h75Qg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4d3737.7ff8267be490-smtp-out-n03;
 Wed, 19 Feb 2020 13:25:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DA75DC447A3; Wed, 19 Feb 2020 13:25:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E2DEC433A2;
        Wed, 19 Feb 2020 13:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E2DEC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 1/6] soc: qcom: geni: Support for ICC voting
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-2-git-send-email-akashast@codeaurora.org>
 <20200218030310.GV955802@ripper>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <65e59f55-4c84-d73b-10b5-be11fb7293be@codeaurora.org>
Date:   Wed, 19 Feb 2020 18:55:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218030310.GV955802@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bjorn,

>>   	struct clk *clk;
>>   	unsigned int num_clk_levels;
>>   	unsigned long *clk_perf_tbl;
>> +	struct icc_path *icc_path[3];
> In all cases you refer to icc_path[IDENIFIER], so just give the three
> paths individual members and drop the enum above.
>
> Reards,
> Bjorn

Ok

Thanks for reviewing.

Regards,

Akash

>
>> +	unsigned int avg_bw_core;
>> Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
