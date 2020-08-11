Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E1A241D98
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Aug 2020 17:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgHKPwJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Aug 2020 11:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgHKPwH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Aug 2020 11:52:07 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C100FC061787
        for <linux-i2c@vger.kernel.org>; Tue, 11 Aug 2020 08:52:06 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a14so11952783wra.5
        for <linux-i2c@vger.kernel.org>; Tue, 11 Aug 2020 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9aCeAHh+tJpUW3mQW2V6JCgolza+sh48fpnGnwOnipk=;
        b=IlWKI/fa9axZFDtAyM+nbd8f8M6K6q2uI3EF+7Oij+ty6MQl2FpMDa0V56rCfcgYJy
         GPFbmS/eqnvpQSjFeoIcz9CErIRegacw40Q38xrhFAYWhY4mFO/HZNSKVvHM/38DuLVR
         /Y9NCD0WavOjw+F1n4x5M61a2yLf6j0ZpAg4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9aCeAHh+tJpUW3mQW2V6JCgolza+sh48fpnGnwOnipk=;
        b=NFo0eipNEfmKu/2d7hTSssF9eA59ohtApCSqVO4s/0sFDrNmicZbUGPQIX088g+hk8
         pL5c/Aof0JK1NGS+qIOisidPMyxaQ+mEEq4DCHK9GimETdLq0O+5GV4AQL63xETpOFmk
         d7jRZAmnQa4f9nqp1jFJ0+6z7SI9Pi+ywyBMj+RSVRetqh//ECn7Otn8fjqNaTq81iMH
         /SOjp1gliX7A2VhaaIPRT/k5QltF5UOOH3mWmah53B+1PnsH9ElX1PrnszrqY+zF53uk
         sg84aHYq8D39I+blEsPyEAzMqNPm76X62bnZcTvpx+j3lqn2+mxZrXe3nI9qF/83zfo6
         ns9Q==
X-Gm-Message-State: AOAM532hcsg+FCxauilVxCFs8RYbI1B1R8JJMAye491d77mTrJcEXI5P
        KiFUAndckzFimdAxjfswFnHIvw==
X-Google-Smtp-Source: ABdhPJwmQ09pbVIsm5G6JWGLVVkrdVRK9rctTlUrcLL274znvsX2IIRJ6wCEsi6XW2KeK56vvoHHtw==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr31876509wrs.124.1597161125115;
        Tue, 11 Aug 2020 08:52:05 -0700 (PDT)
Received: from [10.230.0.249] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id b203sm6013680wmc.22.2020.08.11.08.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 08:52:04 -0700 (PDT)
Subject: Re: [PATCH v3] i2c: iproc: fix race between client unreg and isr
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ray Jui <rjui@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <c7ef0a9e-e3c1-abcf-160b-4df4f523fa04@broadcom.com>
Date:   Tue, 11 Aug 2020 08:52:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/10/2020 5:42 PM, Dhananjay Phadke wrote:
> When i2c client unregisters, synchronize irq before setting
> iproc_i2c->slave to NULL.
> 
> (1) disable_irq()
> (2) Mask event enable bits in control reg
> (3) Erase slave address (avoid further writes to rx fifo)
> (4) Flush tx and rx FIFOs
> (5) Clear pending event (interrupt) bits in status reg
> (6) enable_irq()
> (7) Set client pointer to NULL
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
> 
> Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 8a3c98866fb7..688e92818821 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -1078,7 +1078,7 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
>  	if (!iproc_i2c->slave)
>  		return -EINVAL;
>  
> -	iproc_i2c->slave = NULL;
> +	disable_irq(iproc_i2c->irq);
>  
>  	/* disable all slave interrupts */
>  	tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> @@ -1091,6 +1091,17 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
>  	iproc_i2c_wr_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET, tmp);
>  
> +	/* flush TX/RX FIFOs */
> +	tmp = (BIT(S_FIFO_RX_FLUSH_SHIFT) | BIT(S_FIFO_TX_FLUSH_SHIFT));
> +	iproc_i2c_wr_reg(iproc_i2c, S_FIFO_CTRL_OFFSET, tmp);
> +
> +	/* clear all pending slave interrupts */
> +	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
> +
> +	iproc_i2c->slave = NULL;
> +
> +	enable_irq(iproc_i2c->irq);
> +
>  	return 0;
>  }
>  
> 

Thanks again, Dhananjay! Looks good to me.

Acked-by: Ray Jui <ray.jui@broadcom.com>
