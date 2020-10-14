Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F8F28DC9E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 11:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgJNJRL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 05:17:11 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:30557 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728184AbgJNJRL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 05:17:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602667030; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wlKCgSDPNjIWu6V9NAf13pQ5o5l1qmNNLLlSVijYfUI=; b=wbgLxeftnQx7O/mA4Z3sbMifmrxeDfn6ZVjJ+Q4llViDCBk+pLWk8wrwpPbGwKjqONA1Su3E
 cYb9Ws1GPMOsaTDb4EVM3prlBk7PSQlOAZirsrDrK54TE+DLYUZkdSh5u7Tz6y58QKUkbVho
 f4mq3tjpu2aw7FiI/dlGWGDfxEo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f86c216319d4e9cb57a93b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 09:17:10
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2C00C433C9; Wed, 14 Oct 2020 09:17:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [47.8.241.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 663C1C433C9;
        Wed, 14 Oct 2020 09:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 663C1C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v2 3/3] soc: qcom: geni: Optimize/comment select fifo/dma
 mode
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20201013212531.428538-1-dianders@chromium.org>
 <20201013142448.v2.3.I646736d3969dc47de8daceb379c6ba85993de9f4@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <4aa43d91-b470-afae-bb1c-3955136fb969@codeaurora.org>
Date:   Wed, 14 Oct 2020 14:47:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201013142448.v2.3.I646736d3969dc47de8daceb379c6ba85993de9f4@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/14/2020 2:55 AM, Douglas Anderson wrote:
> The functions geni_se_select_fifo_mode() and
> geni_se_select_fifo_mode() are a little funny.  They read/write a
> bunch of memory mapped registers even if they don't change or aren't
> relevant for the current protocol.  Let's make them a little more
> sane.  We'll also add a comment explaining why we don't do some of the
> operations for UART.
>
> NOTE: there is no evidence at all that this makes any performance
> difference and it fixes no bugs.  However, it seems (to me) like it
> makes the functions a little easier to understand.  Decreasing the
> amount of times we read/write memory mapped registers is also nice,
> even if we are using "relaxed" variants.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>

The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

