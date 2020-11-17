Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400322B5E9A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Nov 2020 12:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgKQLsf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Nov 2020 06:48:35 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:11161 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728070AbgKQLsf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Nov 2020 06:48:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605613714; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=y77pDpdpA1QJXyGxlUezRqTrE7WX88fLNB+ZhRzRIWw=; b=VA0VVBIxzokrKzIKMdZFTKM+qCMNkw+NuMTuacu951x7DdEJWwQJjXjolVbbMLaYTEGC13NK
 jYkYSTsXZwL1/NYT4g2aIastaUZOwT8M8pIupPZyq75RE5pbU7XelsHelZRdJmmkA5iCmvB5
 JH1XtLVmXCAklUAFvsH/Qw4+hk0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fb3b88f25da3a0fa9083273 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 11:48:31
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E4DD2C433ED; Tue, 17 Nov 2020 11:48:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.98] (unknown [47.9.117.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19D65C433ED;
        Tue, 17 Nov 2020 11:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19D65C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for OnePlus 6
 devices
To:     Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-6-caleb@connolly.tech>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <6efdfe22-ed27-c659-0800-38f6a65813f2@codeaurora.org>
Date:   Tue, 17 Nov 2020 17:17:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201112161920.2671430-6-caleb@connolly.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 11/12/2020 9:52 PM, Caleb Connolly wrote:
> The OnePlus 6/T has the same issue as the Yoga c630 causing a crash when DMA
> is used for i2c, so disable it.
>
> https://patchwork.kernel.org/patch/11133827/
>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by : Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

