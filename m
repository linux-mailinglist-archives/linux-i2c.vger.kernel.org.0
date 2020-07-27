Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC2E22E704
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 09:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgG0Hzy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 03:55:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17049 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbgG0Hzy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jul 2020 03:55:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595836553; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gUQnuzeMx0G2OHWIdwKvAsh0TfCZ+tz43jXXFrsOTLU=; b=TKFlbEvXUBUGHbZZdjQb1a1fp3s7M6lOleE9RQuaaKuJqTPlcRIdze5Er1EEv51WgVm0sBFB
 nOEhebR//FQNwpztAh7pBH3TPUBX3P6H8rnf0bqqdBD4lBXkWGqTud52cXg7EoZwLYNtQQZY
 7UGnlAVO/HIRDEWvPD3ECWKaTPQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f1e88701db0b33fd8c326a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 07:55:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3D55BC433C6; Mon, 27 Jul 2020 07:55:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC1A1C433CA;
        Mon, 27 Jul 2020 07:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC1A1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH] i2c: qcom-geni: fix spelling mistake "unepxected" ->
 "unexpected"
To:     Colin King <colin.king@canonical.com>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191103212204.13606-1-colin.king@canonical.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <74e71d14-9f27-6a44-f253-4756ba124695@codeaurora.org>
Date:   Mon, 27 Jul 2020 13:25:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20191103212204.13606-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 11/4/2019 2:52 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in an error message string, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 17abf60c94ae..387fb5a83471 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -98,7 +98,7 @@ static const struct geni_i2c_err_log gi2c_log[] = {
>   	[GP_IRQ0] = {-EIO, "Unknown I2C err GP_IRQ0"},
>   	[NACK] = {-ENXIO, "NACK: slv unresponsive, check its power/reset-ln"},
>   	[GP_IRQ2] = {-EIO, "Unknown I2C err GP IRQ2"},
> -	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unepxected start/stop"},
> +	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unexpected start/stop"},
>   	[ARB_LOST] = {-EAGAIN, "Bus arbitration lost, clock line undriveable"},
>   	[GP_IRQ5] = {-EIO, "Unknown I2C err GP IRQ5"},
>   	[GENI_OVERRUN] = {-EIO, "Cmd overrun, check GENI cmd-state machine"},

The patch is still applying cleanly on tip.

Reviewed-by: Akash Asthana <akashast@codeauror.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

