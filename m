Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C7A22E724
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 09:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgG0H7M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 03:59:12 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:12310 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726183AbgG0H7L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 03:59:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595836751; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=+PV/mgFmHCpT1iOt87TCKArIUd/iWarn9UzS13Yi6VE=; b=eUnVBcO7/N5WpmSaJi0RoRIICnLK17B4xi+roY5Ix9S+3sb2ByyVtTpqgvXH0Q2dbb2ddOT+
 p3Y25SZhHuMGS0qJee5OLxJsvOpagUzCGSd4WkvNo1SBlVCV/v+GHQ2zwnQnIquam2hqUCSb
 1vmTntbxgwpwvTKdto9qEKFIfpw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f1e8947bd0c3f02968c294a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 07:59:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26DF1C433CA; Mon, 27 Jul 2020 07:59:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72632C433C6;
        Mon, 27 Jul 2020 07:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72632C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH] i2c: qcom-geni: fix spelling mistake "unepxected" ->
 "unexpected"
From:   Akash Asthana <akashast@codeaurora.org>
To:     Colin King <colin.king@canonical.com>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191103212204.13606-1-colin.king@canonical.com>
 <74e71d14-9f27-6a44-f253-4756ba124695@codeaurora.org>
Message-ID: <ee839cf4-6310-aa4e-6ed2-322f20343953@codeaurora.org>
Date:   Mon, 27 Jul 2020 13:28:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74e71d14-9f27-6a44-f253-4756ba124695@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/27/2020 1:25 PM, Akash Asthana wrote:
>
> On 11/4/2019 2:52 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a spelling mistake in an error message string, fix it.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 17abf60c94ae..387fb5a83471 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -98,7 +98,7 @@ static const struct geni_i2c_err_log gi2c_log[] = {
>>       [GP_IRQ0] = {-EIO, "Unknown I2C err GP_IRQ0"},
>>       [NACK] = {-ENXIO, "NACK: slv unresponsive, check its 
>> power/reset-ln"},
>>       [GP_IRQ2] = {-EIO, "Unknown I2C err GP IRQ2"},
>> -    [BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unepxected 
>> start/stop"},
>> +    [BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unexpected 
>> start/stop"},
>>       [ARB_LOST] = {-EAGAIN, "Bus arbitration lost, clock line 
>> undriveable"},
>>       [GP_IRQ5] = {-EIO, "Unknown I2C err GP IRQ5"},
>>       [GENI_OVERRUN] = {-EIO, "Cmd overrun, check GENI cmd-state 
>> machine"},
>
> The patch is still applying cleanly on tip.
>
> Reviewed-by: Akash Asthana <akashast@codeauror.org>
Correct tag

Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

