Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7803B162D
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 10:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFWItZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 04:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhFWItY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Jun 2021 04:49:24 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408ADC061756
        for <linux-i2c@vger.kernel.org>; Wed, 23 Jun 2021 01:47:07 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ot9so1780032ejb.8
        for <linux-i2c@vger.kernel.org>; Wed, 23 Jun 2021 01:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ffi7vh5kMUYfLBdLZZUIYBjBht5Z7skCTxAnKO9WzXI=;
        b=ylyAfMNSpUzGxf9uRYDwXOMNc/YihIMaYnKzKnOTvnAF2xRRUDnPef4ETeJD5cXP5G
         Wc3mzZCQy3/HM2B7LFWLG6WU/gnjP1uPD3qJIm3qUMpk7GVYcv423FF/p16bymWzhbaK
         I9jfrXeJ/AnEieMAHLmB3pXItB8LgUcsqrjZoCbqWLiHUgRolUz4EQW7SW0aC+jwaCw/
         YAGsDxW7GPc+hPPAhp6bNrxVfg0vkg1N9NOXxd2jN1wHDiRRjbcpd6/p6irlMUh2EAcM
         6TYBK0s9ZfUZ6fIG17B9GfPBZGbKsy8444mlr2SR7M8TI2IYW35XjXIdNjjBNojh2RTj
         JaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ffi7vh5kMUYfLBdLZZUIYBjBht5Z7skCTxAnKO9WzXI=;
        b=fnUBqtPSE4FxqtXCNroFtZi50qd+6+v99loyTVBkTSR8OOJb15ZUWNegzHXU0WltPB
         Xucb082uTHsdv4BddJgUopET1vHKmNZttbUnlLrDN4XuucXXiy++KykxPUZ4JJUEU1zh
         7l5tQ6FXC9rxB9kSu3Q3z0yZblFVN0aLChdR33PiNg2knE07/Oa6y99xBT39mVssxoNY
         FsiaGUlTcvAabsZtR3jbkB647ZJGbQnmgFyACuzS7cSTQjvsIfLpoGFq/HK9eL5TIyFK
         BM2b+HkpyP2ChQoNUVjEErNMv5biDQofeuaAY9imp4jocNtIAccXwzVxQOGYvB/fPxBb
         IJZw==
X-Gm-Message-State: AOAM530aqdR1Pqd+XCPQC/inZo/anUZa3sBojMLkxSWZil6nt2YfeoOI
        JAFyxny7TDngNW9kfAapZjguyKAcapdyLmypTs6y1w==
X-Google-Smtp-Source: ABdhPJyTH9s/UvsUtyQ35JbuOcY8GUH5gY0ir2daf6IxKqtBsARRZA5kE2l2S9HejwPvUjA3qDvBV2kPtZA9ABiRbvA=
X-Received: by 2002:a17:906:31cb:: with SMTP id f11mr8791435ejf.379.1624438025789;
 Wed, 23 Jun 2021 01:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <1606203965-31595-1-git-send-email-raviteja.narayanam@xilinx.com>
In-Reply-To: <1606203965-31595-1-git-send-email-raviteja.narayanam@xilinx.com>
From:   Michal Simek <monstr@monstr.eu>
Date:   Wed, 23 Jun 2021 10:46:54 +0200
Message-ID: <CAHTX3dLA1oF2v6FRgeL9kMExMXxGz=7LJBM3oo9Zf1CA2HfQFA@mail.gmail.com>
Subject: Re: [PATCH] i2c: cadence: Clear HOLD bit before xfer_size register
 rolls over
To:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, git <git@xilinx.com>,
        linux-arm <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C3=BAt 24. 11. 2020 v 8:48 odes=C3=ADlatel Raviteja Narayanam
<raviteja.narayanam@xilinx.com> napsal:
>
> On Xilinx zynq SOC if the delay between address register write and
> control register write in cdns_mrecv function is more, the xfer size
> register rolls over and controller is stuck. This is an IP bug and

and the controller

> is resolved in later versions of IP.
>
> To avoid this scenario, disable the interrupts on the current processor
> core between the two register writes and enable them later. This can
> help achieve the timing constraint.
>
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> ---
>  drivers/i2c/busses/i2c-cadence.c | 48 ++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 41 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-ca=
dence.c
> index e4b7f2a..81b7c45 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -578,6 +578,11 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>  {
>         unsigned int ctrl_reg;
>         unsigned int isr_status;
> +       unsigned long flags;
> +       bool hold_clear =3D false;
> +       bool irq_save =3D false;
> +
> +       u32 addr;
>
>         id->p_recv_buf =3D id->p_msg->buf;
>         id->recv_count =3D id->p_msg->len;
> @@ -618,14 +623,43 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>                 cdns_i2c_writereg(id->recv_count, CDNS_I2C_XFER_SIZE_OFFS=
ET);
>         }
>
> -       /* Set the slave address in address register - triggers operation=
 */
> -       cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
> -                                               CDNS_I2C_ADDR_OFFSET);
> -       /* Clear the bus hold flag if bytes to receive is less than FIFO =
size */
> +       /* Determine hold_clear based on number of bytes to receive and h=
old flag */
>         if (!id->bus_hold_flag &&
> -               ((id->p_msg->flags & I2C_M_RECV_LEN) !=3D I2C_M_RECV_LEN)=
 &&
> -               (id->recv_count <=3D CDNS_I2C_FIFO_DEPTH))
> -                       cdns_i2c_clear_bus_hold(id);
> +           ((id->p_msg->flags & I2C_M_RECV_LEN) !=3D I2C_M_RECV_LEN) &&
> +           (id->recv_count <=3D CDNS_I2C_FIFO_DEPTH)) {
> +               if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HO=
LD) {
> +                       hold_clear =3D true;
> +                       if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
> +                               irq_save =3D true;
> +               }
> +       }
> +
> +       addr =3D id->p_msg->addr;
> +       addr &=3D CDNS_I2C_ADDR_MASK;
> +
> +       if (hold_clear) {
> +               ctrl_reg =3D cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & ~CDNS=
_I2C_CR_HOLD;
> +               /*
> +                * In case of Xilinx Zynq SOC, clear the HOLD bit before =
transfer size
> +                * register reaches '0'. This is an IP bug which causes t=
ransfer size
> +                * register overflow to 0xFF. To satisfy this timing requ=
irement,
> +                * disable the interrupts on current processor core betwe=
en register
> +                * writes to slave address register and control register.
> +                */
> +               if (irq_save)
> +                       local_irq_save(flags);
> +
> +               cdns_i2c_writereg(addr, CDNS_I2C_ADDR_OFFSET);
> +               cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
> +               /* Read it back to avoid bufferring and make sure write h=
appens */
> +               cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
> +
> +               if (irq_save)
> +                       local_irq_restore(flags);
> +       } else {
> +               cdns_i2c_writereg(addr, CDNS_I2C_ADDR_OFFSET);
> +       }
> +
>         cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET=
);
>  }

Unfortunately we can't do anything with this on the Zynq platform. It
is better than nothing.
ZynqMP is not affected.

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
