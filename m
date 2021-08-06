Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF9C3E2E8C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 18:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236641AbhHFQtt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 12:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237231AbhHFQtp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 12:49:45 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E329CC0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 09:49:28 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t3so7838664plg.9
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 09:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=hsXYfXev+EqG1OUWJKEs5sHe1TgXnAhwK+kH81Aibro=;
        b=BAEOiu8xYGf/bkzLUN7W+XLpBQqt1hjvqMBbvo/WBhWV3nSdkMR39dk1JexVlw3GtK
         XXPuBJoZoZgliQUMkkYbCIadWXXcI2XMOf7AMHdsNw06BBtOvLVMe/rJjfYZHBVf4rDh
         z4pzY5fuuoBAlpT4vm87cgpn7I8byL3GGfoZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=hsXYfXev+EqG1OUWJKEs5sHe1TgXnAhwK+kH81Aibro=;
        b=C5yzx1Ykzv+cYP3WtgydsQh3eRLQqy5p46u4w++8+gUcl6tY2t3hvazYgFEkjyn7iI
         Q8XAmrTU3Scllyezhf1FDBQWij8seIigbHtRRfgBZwC8PjKqLtTIiZxviBpRjVzrrrin
         CA+hRsPw290NyPspqngm0qCfV4dGCL7IFIUrSfmALaKutR4p2mZjvlTFGONMPs6bCEy9
         2cw5RpLHi4NdFDqZP/0+XtdAlYKVW9jHUZCQX90WeKEAncZIKzMsf2O6erENOQmUseea
         mVg+9rMYYTXYmi3HnQa1OMqnhnqslOryUJC64NY3X5lQ/PnYnAWAAlFJn7g3mg/vvM8F
         wjsQ==
X-Gm-Message-State: AOAM5310xE1jg7PAuv3GOstFaMquNSVfGNtu8BGXRIVyZecpfLk/rVGs
        ZVI8asNV7uSHz7FCPOuQYVHziQ==
X-Google-Smtp-Source: ABdhPJx1G+Q4NisyvXKUvUBEEvCi4gO7RD6erMHbltn/tq9kx23x9wmjBt2/hxFXE51Eq4yxMWy7cQ==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr82261pgq.81.1628268568151;
        Fri, 06 Aug 2021 09:49:28 -0700 (PDT)
Received: from [192.168.1.240] (d64-180-180-231.bchsia.telus.net. [64.180.180.231])
        by smtp.gmail.com with ESMTPSA id l12sm10845398pff.182.2021.08.06.09.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 09:49:27 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and tasklet
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
References: <1628200145-4962-1-git-send-email-dphadke@linux.microsoft.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <501dc915-e958-32d9-b2de-f6ffc227ab17@broadcom.com>
Date:   Fri, 6 Aug 2021 09:49:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628200145-4962-1-git-send-email-dphadke@linux.microsoft.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000a2ca0205c8e6d1c2"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000a2ca0205c8e6d1c2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/5/2021 2:49 PM, Dhananjay Phadke wrote:
> Similar NULL deref was originally fixed by graceful teardown sequence -
> 
> https://lore.kernel.org/linux-i2c/1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com
> 
> After this, a tasklet was added to take care of FIFO full condition for large i2c
> transaction.
> 
> https://lore.kernel.org/linux-arm-kernel/20201102035433.6774-1-rayagonda.kokatanur@broadcom.com/
> 
> This introduced regression, a new race condition between tasklet enabling
> interrupts and client unreg teardown sequence.
> 
> Kill tasklet before unreg_slave() masks bits in IE_OFFSET.
> Updated teardown sequence -
> (1) disable_irq()
> (2) Kill tasklet
> (3) Mask event enable bits in control reg
> (4) Erase slave address (avoid further writes to rx fifo)
> (5) Flush tx and rx FIFOs
> (6) Clear pending event (interrupt) bits in status reg
> (7) Set client pointer to NULL
> (8) enable_irq()
> 
>  --
> 
>  Unable to handle kernel read from unreadable memory at virtual address 0000000000000320
>  Mem abort info:
>    ESR = 0x96000004
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>  Data abort info:
>    ISV = 0, ISS = 0x00000004
>    CM = 0, WnR = 0
>  user pgtable: 4k pages, 48-bit VAs, pgdp=000000009212a000
>  [0000000000000320] pgd=0000000000000000, p4d=0000000000000000
>  Internal error: Oops: 96000004 [#1] SMP
>  CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
>  Hardware name: Overlake (DT)
>  pstate: 40400085 (nZcv daIf +PAN -UAO -TCO BTYPE=--)
>  pc : bcm_iproc_i2c_slave_isr+0x2b8/0x8e4
>  lr : bcm_iproc_i2c_slave_isr+0x1c8/0x8e4
>  sp : ffff800010003e70
>  x29: ffff800010003e80 x28: ffffda017acdc000
>  x27: ffffda017b0ae000 x26: ffff800010004000
>  x25: ffff800010000000 x24: ffffda017af4a168
>  x23: 0000000000000073 x22: 0000000000000000
>  x21: 0000000001400000 x20: 0000000001000000
>  x19: ffff06f09583f880 x18: 00000000fa83b2da
>  x17: 000000000000b67e x16: 0000000002edb2f3
>  x15: 00000000000002c7 x14: 00000000000002c7
>  x13: 0000000000000006 x12: 0000000000000033
>  x11: 0000000000000000 x10: 0000000001000000
>  x9 : 0000000003289312 x8 : 0000000003289311
>  x7 : 02d0cd03a303adbc x6 : 02d18e7f0a4dfc6c
>  x5 : 02edb2f33f76ea68 x4 : 00000000fa83b2da
>  x3 : ffffda017af43cd0 x2 : ffff800010003e74
>  x1 : 0000000001400000 x0 : 0000000000000000
>  Call trace:
>   bcm_iproc_i2c_slave_isr+0x2b8/0x8e4
>   bcm_iproc_i2c_isr+0x178/0x290
>   __handle_irq_event_percpu+0xd0/0x200
>   handle_irq_event+0x60/0x1a0
>   handle_fasteoi_irq+0x130/0x220
>   __handle_domain_irq+0x8c/0xcc
>   gic_handle_irq+0xc0/0x120
>   el1_irq+0xcc/0x180
>   finish_task_switch+0x100/0x1d8
>   __schedule+0x61c/0x7a0
>   schedule_idle+0x28/0x44
>   do_idle+0x254/0x28c
>   cpu_startup_entry+0x28/0x2c
>   rest_init+0xc4/0xd0
>   arch_call_rest_init+0x14/0x1c
>   start_kernel+0x33c/0x3b8
>  Code: f9423260 910013e2 11000509 b9047a69 (f9419009)
>  ---[ end trace 4781455b2a7bec15 ]---
> 
> Fixes: 4d658451c9d6 ("i2c: iproc: handle rx fifo full interrupt")
> 
> Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index cceaf69279a9..6304d1dd2dd6 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -1224,14 +1224,14 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
>  
>  	disable_irq(iproc_i2c->irq);
>  
> +	tasklet_kill(&iproc_i2c->slave_rx_tasklet);
> +
>  	/* disable all slave interrupts */
>  	tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
>  	tmp &= ~(IE_S_ALL_INTERRUPT_MASK <<
>  			IE_S_ALL_INTERRUPT_SHIFT);
>  	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
>  
> -	tasklet_kill(&iproc_i2c->slave_rx_tasklet);
> -
>  	/* Erase the slave address programmed */
>  	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
> 

Yeah, needs to ensure no pending tasklet running to enable (unmask)
slave interrupts before disable (mask) them.

Thanks for the fix!

Acked-by: Ray Jui <ray.jui@broadcom.com>


--000000000000a2ca0205c8e6d1c2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Pi3DQoJNNR5cV1dw3cNMKQyHRziEjFTVmILshClu9AljdXzCUoHXDUbge8TIJ/fK36qTGCYWwA01
rTB3drVX3FZq/Uqo0JnVcyP1dtYVzQIDAQABo4IB1TCCAdEwDgYDVR0PAQH/BAQDAgWgMIGjBggr
BgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9j
YWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8v
b2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBE
MEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20v
cmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2Jh
bHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAfBgNVHREEGDAWgRRyYXku
anVpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdb
NHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU5E1VdIocTRYIpXh6e6OnGvwfrEgwDQYJKoZIhvcNAQEL
BQADggEBADcZteuA4mZVmXNzp/tJky+9TS87L/xAogg4z+0bFDomA2JdNGKjraV7jE3LKHUyCQzU
Bvp8xXjxCndLBgltr+2Fn/Dna/f29iAs4mPBxgPKhqnqpQuTo2DLID2LWU1SLI9ewIlROY57UCvO
B6ni+9NcOot0MbKF2A1TnzJjWyd127CVyU5vL3un1/tbtmjiT4Ku8ZDoBEViuuWyhdB6TTEQiwDo
2NxZdezRkkkq+RoNek6gmtl8IKmXsmr1dKIsRBtLQ0xu+kdX+zYJbAQymI1mkq8qCmFAe5aJkrNM
NbsYBZGZlcox4dHWayCpn4sK+41xyJsmGrygY3zghqBuHPUxggJtMIICaQIBATBrMFsxCzAJBgNV
BAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdD
QyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxnTAexrtwIst251kUwDQYJYIZIAWUDBAIBBQCg
gdQwLwYJKoZIhvcNAQkEMSIEIBn+S8UUmT+eKogGSGDpyswMC+V4XuaxaeWQ0RTMCKyvMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDgwNjE2NDkyOFowaQYJKoZI
hvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEF
AASCAQBUZ2cSH44+vMBuWi38pWahqL26gRT81tzHGmgOT6qJ6dn2U3Dr5yB3KWMGsb9o9Bwgn4OU
q3RZmt6KtsKRbaccTdN1T0b2l1wYg2u/hZSwPPpQbGtpAETQetvy9TBg/Aua0cB4mdYB4NiPtjvz
rq3bDaKx6h9tF6zHigEP3LVxeBqjd+LtCfEStgQjhSLfe06L9MBK1LOGS0oubbX8mWbcKRz8aIho
usHf/ncUKKvKT+LpfDq1R1+BOHt60TLTZqqIQxJ6I77V5a2T87nyZerLtqVlknLcR23JbDy9PUiA
THzN/pHHkW/25Nxv+dTm3qf2Ae7NT+IdYdfHQ6BNeok5
--000000000000a2ca0205c8e6d1c2--
