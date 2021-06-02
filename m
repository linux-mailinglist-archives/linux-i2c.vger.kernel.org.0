Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A1639808F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 07:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhFBFJM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 01:09:12 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:47906 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhFBFJK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Jun 2021 01:09:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622610448; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FkvZYbRbC/cAozRjP4BPGysEfk7mZXUuzUP30C8/JvY=;
 b=h1uVrM6GMHr2pUzreugYpqY/5tmacvBf1X6zxeA8IXDAWeZTZZ4kFeQq9t++AgD8U3K2IW6K
 Bc82bLJ7SBv13KXrE4VYTasPtuy+ac+6vycDTHYAJ51LeJ/aPTBUF/U2TiOas9rYJOkdUXhc
 yYe9qCUbgC09UhFj03knQ7KpQJw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60b7120f6ddc3305c4ccc9d3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 05:07:27
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95E2AC4323A; Wed,  2 Jun 2021 05:07:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC05FC433F1;
        Wed,  2 Jun 2021 05:07:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 02 Jun 2021 10:37:25 +0530
From:   rojay@codeaurora.org
To:     wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V11 1/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Mail-Followup-To: wsa@kernel.org, swboyd@chromium.org,
 dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
 gregkh@linuxfoundation.org, mka@chromium.org, skananth@codeaurora.org,
 msavaliy@qti.qualcomm.com, skakit@codeaurora.org, rnayak@codeaurora.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
In-Reply-To: <YLClq6hZKUA1Y4ZW@kunai>
References: <20210525131051.31250-1-rojay@codeaurora.org>
 <20210525131051.31250-2-rojay@codeaurora.org> <YLClq6hZKUA1Y4ZW@kunai>
Message-ID: <f0b92d196a92201696b7f8984ab34523@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-05-28 13:41, Wolfram Sang wrote:
> On Tue, May 25, 2021 at 06:40:50PM +0530, Roja Rani Yarubandi wrote:
>> If the hardware is still accessing memory after SMMU translation
>> is disabled (as part of smmu shutdown callback), then the
>> IOVAs (I/O virtual address) which it was using will go on the bus
>> as the physical addresses which will result in unknown crashes
>> like NoC/interconnect errors.
>> 
>> So, implement shutdown callback for i2c driver to suspend the bus
>> during system "reboot" or "shutdown".
>> 
>> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the 
>> Qualcomm GENI I2C controller")
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Do we need patch 1 after patch 2 was applied? I always thought all
> devices are suspended before shutdown/reboot?
> 

Yes, both patch 1 and patch 2 are required.
Devices are not suspended during shutdown/reboot.

> Nice to see that 'mark_adapter_suspended' becomes useful again!

Thanks,
Roja
