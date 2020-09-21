Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AE8272316
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgIULul (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:50:41 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:57136 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbgIULuk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 07:50:40 -0400
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 07:50:39 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600689040; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=u4Z+XoZMH7rS4HZ2AhmWXEKDfVhLbPPjNUMsiTu8wuY=; b=eemjFo0NiKp0BIeqJRe4tYhlnsHvnLSSSsqTC+GPLNKxvxhLbsvdO2Kp8N+h22p8nWqTeuTy
 ISZRLRvck5obFY2BPjdUm0n1QwcGsJ1Wyu3Hj4Sll7m4MMb7FGJmqwqgyQOpN2zBSPy5sw7O
 BSEEc7Os9no5KUtVMb6emG9l41U=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f68924c6b1937bb6501ddbb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Sep 2020 11:45:16
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0E8DC433CB; Mon, 21 Sep 2020 11:45:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [47.8.50.111])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BAB23C433CA;
        Mon, 21 Sep 2020 11:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BAB23C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH] i2c: busses: replace spin_lock_irqsave by spin_lock in
 hard IRQ
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Barry Song <song.bao.hua@hisilicon.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200909041001.5612-1-song.bao.hua@hisilicon.com>
 <24424594-963c-c744-846f-cf79b6024b1c@codeaurora.org>
 <20200921093433.GH1840@ninjato>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <5b1ee0bb-c496-fe48-e7ea-7d89377ae60d@codeaurora.org>
Date:   Mon, 21 Sep 2020 17:14:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921093433.GH1840@ninjato>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 9/21/2020 3:04 PM, Wolfram Sang wrote:
> On Thu, Sep 10, 2020 at 05:10:20PM +0530, Akash Asthana wrote:
>> On 9/9/2020 9:40 AM, Barry Song wrote:
>>> The code has been in a irq-disabled context since it is hard IRQ. There
>>> is no necessity to do it again.
>>>
>>> Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
>>> Cc: "Andreas Färber" <afaerber@suse.de>
>>> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> Cc: Akash Asthana <akashast@codeaurora.org>
>>> Cc: Mukesh Savaliya <msavaliy@codeaurora.org>
>>> Cc: Andy Gross <agross@kernel.org>
>>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
>>> ---
>> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> Thanks! Did you review the whole patch or only the qcom-geni part?
I reviewed the whole patch.
> (and please don't include the full message when you only reply to a part
> of it).

Sure thanks.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

