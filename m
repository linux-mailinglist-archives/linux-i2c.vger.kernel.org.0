Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E892EF049
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 10:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbhAHJ5n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 04:57:43 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:51350 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbhAHJ5n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jan 2021 04:57:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610099842; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rGYMlvx+81LgALQ6E4x5ySpL+k2I8nl0X8pOs7NL20U=;
 b=MwiKTNFWRRYlCX3V1OgX4bDhFXMSW4+OQCXzhB0lxgKFclb/ZzBZhAsL8oM9SFCMcw2QGpP4
 AjTFgeInWcSiyDM6WvHAMf1y6GTof9v/77YwAyosdcjQnIRhO4LeD01NI8U1g25vha14TI1M
 +//eAJA8qQ1WuFYY0lq4IYHsPAk=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ff82c5f922ae55531d57c13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Jan 2021 09:56:47
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 23B17C43463; Fri,  8 Jan 2021 09:56:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96026C433C6;
        Fri,  8 Jan 2021 09:56:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 08 Jan 2021 15:26:46 +0530
From:   rojay@codeaurora.org
To:     Wolfram Sang <wsa@kernel.org>
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        pyarlaga@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V7 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <20210105152747.GB1842@ninjato>
References: <20201221123801.26643-1-rojay@codeaurora.org>
 <20201221123801.26643-3-rojay@codeaurora.org>
 <20210105152747.GB1842@ninjato>
Message-ID: <d3e53aabf39e888d8184faa2981f7837@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 2021-01-05 20:57, Wolfram Sang wrote:
>> +	geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
>> +	if (!(geni_status & M_GENI_CMD_ACTIVE))
>> +		goto out;
>> +
>> +	cur = gi2c->cur;
>> +	geni_i2c_abort_xfer(gi2c);
>> +	if (cur->flags & I2C_M_RD)
>> +		geni_i2c_rx_msg_cleanup(gi2c, cur);
>> +	else
>> +		geni_i2c_tx_msg_cleanup(gi2c, cur);
>> +out:
>> +	pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
> 
> The use of 'goto' is not needed here IMHO. I think:
> 
> 	if (geni_status & M_GENI_CMD_ACTIVE) {
> 		do_the_stuff
> 	}
> 
> 	pm_runtime_put_sync_suspend(...);
> 
> is more readable, in fact.
> 

In context to the previous comment [1], I have implemented this way.
But, yeah anything is fine for me.

> Also, I don't think we really need the 'cur'
> variable and just use 'gi2c->cur' but that's very minor and you can 
> keep
> it if you like it.
> 

In geni_i2c_abort_xfer() function gi2c->cur will be made NULL, so 
copying it before to "cur" is needed here.

> Reset looks good!

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20200820103522.26242-3-rojay@codeaurora.org/#23560541

Thanks,
Roja
