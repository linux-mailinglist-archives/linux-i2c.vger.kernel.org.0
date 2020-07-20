Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7083226D85
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jul 2020 19:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730372AbgGTRtO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 13:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728571AbgGTRtN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jul 2020 13:49:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D9AC0619D2
        for <linux-i2c@vger.kernel.org>; Mon, 20 Jul 2020 10:49:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w3so347414wmi.4
        for <linux-i2c@vger.kernel.org>; Mon, 20 Jul 2020 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dHGb/SpCGr7LJoGHyEMXrvxy1/3cgQI+BwLHtPx8ztY=;
        b=J/HE6FTppGwiK3cGRV8XmKQpMaqC49zVxWuYF7d5shgDI/H/123csQWqM48Bmrcsl7
         p5cIf3WJeukPwjcXWMNBfvh7jsT9vM4+FpSE9zs9wiA0fWpn52OEOZezEnbZmQaAP8c+
         IHnQVc8OFDw5QOyw7Vpd4Q5cg6ui1FvltX6hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dHGb/SpCGr7LJoGHyEMXrvxy1/3cgQI+BwLHtPx8ztY=;
        b=Hd71tJ4TtGZh7Hqz4r9aNOw0gWQMipoPX17WigkUp3itS3C+BdCkWWg3VmyaOOiOh3
         Yptu5tsX5m6GfezT9GgLSyqbjDeuxuTM0V84mFanGFP0xJFFLXs76SnF8kAp6RoV7AuZ
         cFSvYPWFnwXJ0LLEcW4uW9uU22rrh19XBy9zkEOb4RGkuYQwFO92a2O7JkuD5KOBgWhe
         IXKJWAxyIKgQLAW7zZ4idTVREDfies4wCNFdzPwS9sKsqDkksw18dSVupiohryNjH/n8
         7i9ooyRZKodbqjmfiyoN15KNSwqjouDPXwcharDhQ/CNVkNv8BvXeGpoqwQcvPWNJcg7
         ynTA==
X-Gm-Message-State: AOAM530JZIsqclOUXLhwQW00JJsN49+arsX12dsVGhyjSC1ebIfT5cF5
        HE0Zhtn5xUffxsDDGb14WuKJGQ==
X-Google-Smtp-Source: ABdhPJxmGe7qRWDzUpGNJ5e168Fd+vcelswyQ/kv7bMS8mjdZOMqqqGGUiZ7Qgz0uB93WeAl44OTgg==
X-Received: by 2002:a05:600c:218f:: with SMTP id e15mr377219wme.187.1595267351324;
        Mon, 20 Jul 2020 10:49:11 -0700 (PDT)
Received: from [10.136.8.242] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id k14sm33356834wrn.76.2020.07.20.10.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2020 10:49:10 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
Date:   Mon, 20 Jul 2020 10:49:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/18/2020 4:39 PM, Dhananjay Phadke wrote:
> When i2c client unregisters, synchronize irq before setting
> iproc_i2c->slave to NULL.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000318
> 
> [  371.020421] pc : bcm_iproc_i2c_isr+0x530/0x11f0
> [  371.025098] lr : __handle_irq_event_percpu+0x6c/0x170
> [  371.030309] sp : ffff800010003e40
> [  371.033727] x29: ffff800010003e40 x28: 0000000000000060
> [  371.039206] x27: ffff800010ca9de0 x26: ffff800010f895df
> [  371.044686] x25: ffff800010f18888 x24: ffff0008f7ff3600
> [  371.050165] x23: 0000000000000003 x22: 0000000001600000
> [  371.055645] x21: ffff800010f18888 x20: 0000000001600000
> [  371.061124] x19: ffff0008f726f080 x18: 0000000000000000
> [  371.066603] x17: 0000000000000000 x16: 0000000000000000
> [  371.072082] x15: 0000000000000000 x14: 0000000000000000
> [  371.077561] x13: 0000000000000000 x12: 0000000000000001
> [  371.083040] x11: 0000000000000000 x10: 0000000000000040
> [  371.088519] x9 : ffff800010f317c8 x8 : ffff800010f317c0
> [  371.093999] x7 : ffff0008f805b3b0 x6 : 0000000000000000
> [  371.099478] x5 : ffff0008f7ff36a4 x4 : ffff8008ee43d000
> [  371.104957] x3 : 0000000000000000 x2 : ffff8000107d64c0
> [  371.110436] x1 : 00000000c00000af x0 : 0000000000000000
> 
> [  371.115916] Call trace:
> [  371.118439]  bcm_iproc_i2c_isr+0x530/0x11f0
> [  371.122754]  __handle_irq_event_percpu+0x6c/0x170
> [  371.127606]  handle_irq_event_percpu+0x34/0x88
> [  371.132189]  handle_irq_event+0x40/0x120
> [  371.136234]  handle_fasteoi_irq+0xcc/0x1a0
> [  371.140459]  generic_handle_irq+0x24/0x38
> [  371.144594]  __handle_domain_irq+0x60/0xb8
> [  371.148820]  gic_handle_irq+0xc0/0x158
> [  371.152687]  el1_irq+0xb8/0x140
> [  371.155927]  arch_cpu_idle+0x10/0x18
> [  371.159615]  do_idle+0x204/0x290
> [  371.162943]  cpu_startup_entry+0x24/0x60
> [  371.166990]  rest_init+0xb0/0xbc
> [  371.170322]  arch_call_rest_init+0xc/0x14
> [  371.174458]  start_kernel+0x404/0x430
> 
> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
> Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index b58224b7b..37d2a79e7 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -1074,14 +1074,15 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
>  	if (!iproc_i2c->slave)
>  		return -EINVAL;
>  
> -	iproc_i2c->slave = NULL;
> -
>  	/* disable all slave interrupts */
>  	tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
>  	tmp &= ~(IE_S_ALL_INTERRUPT_MASK <<
>  			IE_S_ALL_INTERRUPT_SHIFT);
>  	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
>  
> +	synchronize_irq(iproc_i2c->irq);

If one takes a look at the I2C slave ISR routine, there are places where
IRQ can be re-enabled in the ISR itself. What happens after we mask all
slave interrupt and when 'synchronize_irq' is called, which I suppose is
meant to wait for inflight interrupt to finish where there's a chance
the interrupt can be re-enable again? How is one supposed to deal with that?

Thanks,

Ray

> +	iproc_i2c->slave = NULL;
> +
>  	/* Erase the slave address programmed */
>  	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
> 
