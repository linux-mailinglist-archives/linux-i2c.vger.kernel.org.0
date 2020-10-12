Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE9128AFBF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 10:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgJLIMw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 04:12:52 -0400
Received: from z5.mailgun.us ([104.130.96.5]:43852 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728980AbgJLIMv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Oct 2020 04:12:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602490371; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZdYt0V+ek+lUsTG/U7btUuWQIE4tVBcsgYxjl1/Sw9w=; b=UfnwsxaDwKtr7yPoYgVRXpT0sDeKqmJ5HrWNxCvebLzHxU1Kv1E/YeuoPq3ZvT95n13k7ZoJ
 zwoVj1q7wziLciG8eFGN1EqyeOezda0NCP1VQyfxFrf1YbXYVy7BPzDA8YM+mR5z5nF67WAB
 QJPqvP4KVcpBe9YopdyOz/vaTCE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f841002e9e942744c470bb0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Oct 2020 08:12:50
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4AD9CC43382; Mon, 12 Oct 2020 08:12:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.98] (unknown [47.9.68.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CC6BC433F1;
        Mon, 12 Oct 2020 08:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3CC6BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20201008225235.2035820-1-dianders@chromium.org>
 <20201008155154.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <9bd20b68-1466-ea3d-2ba3-1b35d9b324ab@codeaurora.org>
Date:   Mon, 12 Oct 2020 13:42:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201008155154.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/9/2020 4:22 AM, Douglas Anderson wrote:
> This reverts commit 02b9aec59243c6240fc42884acc958602146ddf6.
>
> As talked about in the patch ("soc: qcom: geni: More properly switch
> to DMA mode"), swapping the order of geni_se_setup_m_cmd() and
> geni_se_xx_dma_prep() can sometimes cause corrupted transfers.  Thus
> we traded one problem for another.  Now that we've debugged the
> problem further and fixed the geni helper functions to more disable
> FIFO interrupts when we move to DMA mode we can revert it and end up
> with (hopefully) zero problems!
>
> To be explicit, the patch ("soc: qcom: geni: More properly switch
> to DMA mode") is a prerequisite for this one.
>
> Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

