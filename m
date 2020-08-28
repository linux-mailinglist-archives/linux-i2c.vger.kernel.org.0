Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677A7255995
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 13:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbgH1Lp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 07:45:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17370 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729028AbgH1Lpy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 07:45:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598615153; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sNWgcqQR+6QhQGkc4LU06y2pSDolaw9TtjGFrjyf1bY=;
 b=auyb5gIuQ1czI+quCjcZl+seR16VGGaRLxtqWzWFUzW5hQpUuhqER4atajN16pXH5lk8omrK
 BQvAqd+T3FdJ79N4JyQU9NZVy2T66WoRz5GgOdVk6s7Th82K+MrMuIh3tb2wIW2dqNpcY90L
 AL3jNTgEfJ+CEqmDRNMbdCafPzI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f48ee694b620c27d3639dba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 Aug 2020 11:45:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9A37C4339C; Fri, 28 Aug 2020 11:45:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B36EC433C6;
        Fri, 28 Aug 2020 11:45:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 Aug 2020 17:15:44 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH V2 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in
 geni_i2c_dev struct
In-Reply-To: <159796912574.334488.10846610259602895929@swboyd.mtv.corp.google.com>
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-2-rojay@codeaurora.org>
 <159796912574.334488.10846610259602895929@swboyd.mtv.corp.google.com>
Message-ID: <fe91d99821775d82c3bd8de9d0988548@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-08-21 05:48, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2020-08-20 03:35:21)
>> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
>> data scope. For example during shutdown callback to unmap DMA mapping,
>> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
>> and geni_se_rx_dma_unprep functions.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
> 
> Can this be squashed with the next patch? I don't see how this stands 
> on
> its own.

Okay.
