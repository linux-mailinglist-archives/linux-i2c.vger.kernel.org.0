Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5BA022507C
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jul 2020 09:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgGSH7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jul 2020 03:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgGSH7g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Jul 2020 03:59:36 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2057C0619D4
        for <linux-i2c@vger.kernel.org>; Sun, 19 Jul 2020 00:59:35 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id j21so8181047lfe.6
        for <linux-i2c@vger.kernel.org>; Sun, 19 Jul 2020 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uA/tElCwH30ICqo0HsDr0006JRE1RTl1ltyIJoP+IYs=;
        b=JLodqvhRJryKw7MP1WebX9TWzZO9Cyyuo5zWsJSM/ZaXprHq5Z8tnfMFPb5hnsPN+f
         wXXHDogN7+7v8xTzjoDtfE/UsCgeYj6MjompG0DFTCSQ6arvkeZFM5OyxLKXFq5qtK6V
         zHOtlFj9p6gAU3lE8fcEyi8929tq0xVpGJfBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uA/tElCwH30ICqo0HsDr0006JRE1RTl1ltyIJoP+IYs=;
        b=cD0xstg68neFqqog7bHnjLrixEPyvzqp506GU3mCiqTQRSxdME77HMXNUoM6ni279y
         BKuHToyC0n1jeVyWsXyYtfH0y3I/yxoT3JYzx7i3Er4G/DaETB1Z4bA2RI/N3b3CDfE0
         9YJ2i32iM/gwSKLFOlMVEA5TZ47g/sOQ3G33hcgAX2BSgJomlUtxe1SL4XSL9it9XBK2
         KUVEFpkhGRXC8PDed3077eAqHCYvQGMYWluM5+5A0jOVVf5AmIt7kKb71DIr5jUSwPmx
         PaqsDZ7enxZENStkK02iDoNbn7hdoRIInEEjuVQvAi/X7pRBixBD4nKOrCZ9r0QnR66p
         uxoA==
X-Gm-Message-State: AOAM532263jRDF3UYqzzCXR9vMKKx/VW9PyHdW78n2MBw3fnr+qPXic0
        b93bXVs/ykt0qlSIRKz2NbVzRaOhMjJ43BbHs0sNtw==
X-Google-Smtp-Source: ABdhPJwPQScejqOcNk37vjQoYZiYu9cG/oplCTLUp7LUHByI5OAlsR9eWwwDdsRm0CdypE/Fwft/tJHaTL+P6CmCMxg=
X-Received: by 2002:a19:fc14:: with SMTP id a20mr429329lfi.0.1595145573696;
 Sun, 19 Jul 2020 00:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
In-Reply-To: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Sun, 19 Jul 2020 13:29:21 +0530
Message-ID: <CAHO=5PFGqyacnneCp76brDymyZK0axG+4n3RPThFp6w=-xP7hA@mail.gmail.com>
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Ray Jui <rjui@broadcom.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jul 19, 2020 at 5:10 AM Dhananjay Phadke
<dphadke@linux.microsoft.com> wrote:
>
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
>         if (!iproc_i2c->slave)
>                 return -EINVAL;
>
> -       iproc_i2c->slave = NULL;
> -
>         /* disable all slave interrupts */
>         tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
>         tmp &= ~(IE_S_ALL_INTERRUPT_MASK <<
>                         IE_S_ALL_INTERRUPT_SHIFT);
>         iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
>
> +       synchronize_irq(iproc_i2c->irq);
> +       iproc_i2c->slave = NULL;
> +
>         /* Erase the slave address programmed */
>         tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
>         tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);

Looks good to me. Thank you for the patch.
Reviewed-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Regards,
Rayagonda
