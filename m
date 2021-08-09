Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83EC3E42F1
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Aug 2021 11:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234717AbhHIJfv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Aug 2021 05:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbhHIJfq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Aug 2021 05:35:46 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07906C06179C
        for <linux-i2c@vger.kernel.org>; Mon,  9 Aug 2021 02:35:26 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id w17so28209489ybl.11
        for <linux-i2c@vger.kernel.org>; Mon, 09 Aug 2021 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RBRsrdoR2otiTKlOhaQpfadSB34ZC/hXeP4l0EFbfvA=;
        b=PgEVd/Hth7t3KVWqbbAtPJaz2C1Zg3PUR53vVBB/i2UHlX1Szq8cpWOyVNFQQVwK1k
         g8/ARLfGQy2vBmNcnHswy5+WTqzWEXYH6hlP0l5imRA0lodzx9lHab3/+JwWBIshDqWU
         tV0cf+sgMMHpCazL4bLFscXKTur08w8hiV1hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RBRsrdoR2otiTKlOhaQpfadSB34ZC/hXeP4l0EFbfvA=;
        b=KecYKiWHyFCEjuWwaQykqL1fPG1jcFAFkOgNJspP9/GHG1a10YG1FUgu6qxWCHIALv
         SJBquNTd9MPBcIU/oi1HUYu0tCCMpwixN2vvzliKQ/8odLnmZSyclbbaZX4sXptgDG7n
         0T6B+7Lf1wnxQUrqxhVJRgbYDKIM4Li4FD/12KIuxzEZOzzUzoHuF4xBDTq46gNf4yhG
         IirAmaM7yKrju+9gb+8kbEE6s75AtSZRHcnqHj1AGtgFUZgBSItvhgYti7dSeDYuKh/r
         u5k4Mv9r9aXXW/M5pqLoBMV+dz3Tz+E2JbXSQTKeSnzgpXemaJdNZ07s4ePaVPTbobi9
         WTKg==
X-Gm-Message-State: AOAM530s+uE3CGgBw7/BdtqMyg8gI3THYahxoLAFSKDF4Uaq1+/LaAgW
        rSoMI+EK4ofLms/0xd0cEAzOUMtl6SvceuaAlg9LFg==
X-Google-Smtp-Source: ABdhPJwft6TniJIGZGTILiHEOji+fm4qe5GnNKjz4dk/7Vh55pDvBm/dRmWvmoQGrwdvP1Ps5ABqliGySOGoIFUNDrA=
X-Received: by 2002:a25:810c:: with SMTP id o12mr30262817ybk.249.1628501725015;
 Mon, 09 Aug 2021 02:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <1628200145-4962-1-git-send-email-dphadke@linux.microsoft.com> <501dc915-e958-32d9-b2de-f6ffc227ab17@broadcom.com>
In-Reply-To: <501dc915-e958-32d9-b2de-f6ffc227ab17@broadcom.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Mon, 9 Aug 2021 15:05:14 +0530
Message-ID: <CAHO=5PFcV9SKS-3c=BaPbej4S2AoxFLfTYZaJCiqSEoYKxP02w@mail.gmail.com>
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and tasklet
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Ray Jui <rjui@broadcom.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000dce53405c91d1ad6"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000dce53405c91d1ad6
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 6, 2021 at 10:19 PM Ray Jui <ray.jui@broadcom.com> wrote:
>
>
>
> On 8/5/2021 2:49 PM, Dhananjay Phadke wrote:
> > Similar NULL deref was originally fixed by graceful teardown sequence -
> >
> > https://lore.kernel.org/linux-i2c/1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com
> >
> > After this, a tasklet was added to take care of FIFO full condition for large i2c
> > transaction.
> >
> > https://lore.kernel.org/linux-arm-kernel/20201102035433.6774-1-rayagonda.kokatanur@broadcom.com/
> >
> > This introduced regression, a new race condition between tasklet enabling
> > interrupts and client unreg teardown sequence.
> >
> > Kill tasklet before unreg_slave() masks bits in IE_OFFSET.
> > Updated teardown sequence -
> > (1) disable_irq()
> > (2) Kill tasklet
> > (3) Mask event enable bits in control reg
> > (4) Erase slave address (avoid further writes to rx fifo)
> > (5) Flush tx and rx FIFOs
> > (6) Clear pending event (interrupt) bits in status reg
> > (7) Set client pointer to NULL
> > (8) enable_irq()
> >
> >  --
> >
> >  Unable to handle kernel read from unreadable memory at virtual address 0000000000000320
> >  Mem abort info:
> >    ESR = 0x96000004
> >    EC = 0x25: DABT (current EL), IL = 32 bits
> >    SET = 0, FnV = 0
> >    EA = 0, S1PTW = 0
> >  Data abort info:
> >    ISV = 0, ISS = 0x00000004
> >    CM = 0, WnR = 0
> >  user pgtable: 4k pages, 48-bit VAs, pgdp=000000009212a000
> >  [0000000000000320] pgd=0000000000000000, p4d=0000000000000000
> >  Internal error: Oops: 96000004 [#1] SMP
> >  CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
> >  Hardware name: Overlake (DT)
> >  pstate: 40400085 (nZcv daIf +PAN -UAO -TCO BTYPE=--)
> >  pc : bcm_iproc_i2c_slave_isr+0x2b8/0x8e4
> >  lr : bcm_iproc_i2c_slave_isr+0x1c8/0x8e4
> >  sp : ffff800010003e70
> >  x29: ffff800010003e80 x28: ffffda017acdc000
> >  x27: ffffda017b0ae000 x26: ffff800010004000
> >  x25: ffff800010000000 x24: ffffda017af4a168
> >  x23: 0000000000000073 x22: 0000000000000000
> >  x21: 0000000001400000 x20: 0000000001000000
> >  x19: ffff06f09583f880 x18: 00000000fa83b2da
> >  x17: 000000000000b67e x16: 0000000002edb2f3
> >  x15: 00000000000002c7 x14: 00000000000002c7
> >  x13: 0000000000000006 x12: 0000000000000033
> >  x11: 0000000000000000 x10: 0000000001000000
> >  x9 : 0000000003289312 x8 : 0000000003289311
> >  x7 : 02d0cd03a303adbc x6 : 02d18e7f0a4dfc6c
> >  x5 : 02edb2f33f76ea68 x4 : 00000000fa83b2da
> >  x3 : ffffda017af43cd0 x2 : ffff800010003e74
> >  x1 : 0000000001400000 x0 : 0000000000000000
> >  Call trace:
> >   bcm_iproc_i2c_slave_isr+0x2b8/0x8e4
> >   bcm_iproc_i2c_isr+0x178/0x290
> >   __handle_irq_event_percpu+0xd0/0x200
> >   handle_irq_event+0x60/0x1a0
> >   handle_fasteoi_irq+0x130/0x220
> >   __handle_domain_irq+0x8c/0xcc
> >   gic_handle_irq+0xc0/0x120
> >   el1_irq+0xcc/0x180
> >   finish_task_switch+0x100/0x1d8
> >   __schedule+0x61c/0x7a0
> >   schedule_idle+0x28/0x44
> >   do_idle+0x254/0x28c
> >   cpu_startup_entry+0x28/0x2c
> >   rest_init+0xc4/0xd0
> >   arch_call_rest_init+0x14/0x1c
> >   start_kernel+0x33c/0x3b8
> >  Code: f9423260 910013e2 11000509 b9047a69 (f9419009)
> >  ---[ end trace 4781455b2a7bec15 ]---
> >
> > Fixes: 4d658451c9d6 ("i2c: iproc: handle rx fifo full interrupt")
> >
> > Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
> > ---
> >  drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> > index cceaf69279a9..6304d1dd2dd6 100644
> > --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> > +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> > @@ -1224,14 +1224,14 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
> >
> >       disable_irq(iproc_i2c->irq);
> >
> > +     tasklet_kill(&iproc_i2c->slave_rx_tasklet);
> > +
> >       /* disable all slave interrupts */
> >       tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> >       tmp &= ~(IE_S_ALL_INTERRUPT_MASK <<
> >                       IE_S_ALL_INTERRUPT_SHIFT);
> >       iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
> >
> > -     tasklet_kill(&iproc_i2c->slave_rx_tasklet);
> > -
> >       /* Erase the slave address programmed */
> >       tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
> >       tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
> >
>
> Yeah, needs to ensure no pending tasklet running to enable (unmask)
> slave interrupts before disable (mask) them.
>
> Thanks for the fix!
>
> Acked-by: Ray Jui <ray.jui@broadcom.com>
>

Acked-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

--000000000000dce53405c91d1ad6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBWEwggRJoAMCAQICDGIRAc6011ojWeRV2TANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMTAyMjIxNDAxMzlaFw0yMjA5MjIxNDA5NDlaMIGc
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xHDAaBgNVBAMTE1JheWFnb25kYSBLb2thdGFudXIxLzAtBgkq
hkiG9w0BCQEWIHJheWFnb25kYS5rb2thdGFudXJAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsDWLYJyQNqqi7r4da0/fTBMrrKN6PYtLMtwocQxmRs1kWqxZCI5b
Nf+qnuxPO3eP2x8XDtdQ7EqbdLzkZttHc2aglsOjA+Am6VOGtjCoT0s5Z++nyz5dvyOran4or0DE
f7L1p8ueTvyHP9HGnlXyaniat3z2dYtGHsB6POIDXGnXktNFVdBK/buhiVF1mmhfrlux3j4FL7MX
yVKBHwVOolHq1g1x81yxbJv8W14vcBj7oIOjeumV3EPsFGRkp1Dp4AM129Z46WfpSmAZwXn2Tvbh
BkTtcaFwUFnTi/kML2BUj0IKuVygzaYwxPmo2OWjViiyJ+nFtk2jNYyDpkwqrQIDAQABo4IB4TCC
Ad0wDgYDVR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAu
Y3J0MEEGCCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29u
YWxzaWduMmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0
cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBA
MD6gPKA6hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2Ey
MDIwLmNybDArBgNVHREEJDAigSByYXlhZ29uZGEua29rYXRhbnVyQGJyb2FkY29tLmNvbTATBgNV
HSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4E
FgQU+UmqV/CWouPDQxE3IU8QviBP+lcwDQYJKoZIhvcNAQELBQADggEBAA7vznpt5t0oe3gzVt3l
gk+42rUWRVBK0414dwY38J4QCmNGTkqR4/RLiUMU/5gI207m9rgXLHq8OEx9KQn9jaGTLhC2ifQt
TymLxN5J54xy/PnmUm//K485v01fTYW/Des5jigILw9xsP1NzqZjjESNfGIeGCo3xSET7FP4fraT
4fnIglD35Q4P6vnwk+zhwVwSGuT4mSByhV06SRdxCP3tGKH15J0wZbpCrpsbPCI0u5UV9VW10EOo
L/6jkp0tcbfANOkTYh+9nyv7O6dMGumpUm35/clRb2nQ8fvkMCconKazU72yY/+Uatf2oOQrW1eU
1odLxlTZYKIpTBVO2sIxggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9i
YWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBD
QSAyMDIwAgxiEQHOtNdaI1nkVdkwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIMtI
bMsr+7ZRTAT09NUYjf6nmKXaGBnIQFZseYiEP5w3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTIxMDgwOTA5MzUyNVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJ
KoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCk1+skud7yHHNEakcCUHHy
eEMQQ1wbX6+bYxJzlNJIJVK5qhsafExDQ2f4KizvKDiFqDkHSUSdd/N5B6Jzk88U4c48YXyo+7IW
kSjZin+DVMN2PfWSN/zuW//0tMStWEJcJH72z6dAduFiPV6mGmEikBu2mxSj6T0NylrdsN3i1ibR
h2MaFjxiP9Z+OGQwfm/tL1SowGq5f7cjcmCGmtJU0s1rg2LhD852I816UI3ABy9aWdmOZuKY9aDY
hLTi+9nLVb5a0jjYVUufVkRpiswFJhxiqsFeyVB187LeK003sJSxQAV98LJBT6eXSPmLeBkvMHCj
2jYU6kTNm6QDuA+q
--000000000000dce53405c91d1ad6--
