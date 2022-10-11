Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D9F5FAC35
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Oct 2022 08:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiJKGJT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Oct 2022 02:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiJKGJJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Oct 2022 02:09:09 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07128769A;
        Mon, 10 Oct 2022 23:09:07 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id q9so24599373ejd.0;
        Mon, 10 Oct 2022 23:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+9XNPifPhFMInlVJCwLX4AaVIIMRwa+RQbkGTlKlhM=;
        b=Q3qMJjd7UgAEdf0Kg6Ll7geYQmJHPmTLWNNj643z/+bllr9PhTCyJIELDlBvE6xank
         KHeqMCApaX7rtEE2B6HEeAhjn7OGOH8Bx3WYNDkxVUWpxm3+jgYfCbHX2sas4PLYZPrP
         k1xWSJZDtGF1uf7rXinOupmPJBJGDRyME2uydH36hJH4sQ/vQr6gdJzZ7Y1jA5+CtKvY
         6jdG1F+0qgNTOfnbGR2jh0w0yXvwOKpKiuLHNrKrqbUg6bG340dqoAMIpDyVmrbMvATq
         hYH665wWe8sE6Nl+9qPx8N9o9w3u+1MXgTVCo2iPa0XQ112BzAGhdpkBENZC/MvYTv2n
         YwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+9XNPifPhFMInlVJCwLX4AaVIIMRwa+RQbkGTlKlhM=;
        b=ecE/qoD/ci7x21eYHdyU2uPBek3LwavYOiQ5Irw1VJkfM3E6okkI+Vl/SUdf1OYZfO
         /aLxjOz5Ri3WpzPgJMHPFEN+GwmS+efzSTP5MVW/x305QVKiBHTbjDrHrOKaXBEnBONO
         e9VrTDykoiGtgYPe2uf588/SmL1SWEivsvmcQo94yzXh0oFWCNv5HmKbbnTn1ESH5e0g
         oG2UFqM4+/XsUUZIZio8TK5aT6IeYfr6lQGzw2EoYjBpRq3BeFYA/wu+/CUSDTZzY5rA
         zkdHRGzb1i/KbaPzOqVhAiZ6S63fMdXWAenLmILDt24H4xxyGpKFsIN35RnaxnBM2Oo9
         X2CA==
X-Gm-Message-State: ACrzQf01hWiB9fCAS/9EQw6Gi2OmwYZAnODFcT0w65kuTWF+lMD/Ljqu
        JRK5e27z2o2w96weVZ3heG2lHszf/z68ipr9ZmY=
X-Google-Smtp-Source: AMsMyM61TmlrbQ7ijBCqkJmNRbO2NMDrIkg20Na2jKpNofM4d4cA31RPB6PBDIjWucVwwnLIgc+8wbv+BixIlr7YWZE=
X-Received: by 2002:a17:907:7fa1:b0:782:7c58:5341 with SMTP id
 qk33-20020a1709077fa100b007827c585341mr17609058ejc.368.1665468546180; Mon, 10
 Oct 2022 23:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 11 Oct 2022 09:08:55 +0300
Message-ID: <CAHb3i=tzG0myrwHVvHCDNVf=yf8Ze2FhhX=7zdrhcaZAzqx9QQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: npcm7xx: Group bank 0/1 registers together for readability
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

Thanks Jonathan!

On Sat, Oct 8, 2022 at 3:59 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> The unlabelled registers NPCM_I2CCTL4 to NPCM_I2CSCLHT overlap with the
> bank 1 registers below, and they are accessed after selecting bank 0, so
> they clearly belong to bank 0.
>
> Move them together with the other bank 0 registers, and move the
> unrelated definition of npcm_i2caddr down to keep the banked registers
> in one piece.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 0c365b57d9572..9a7a2d0bf5765 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -106,7 +106,7 @@ enum i2c_addr {
>  #define NPCM_I2CCST3                   0x19
>  #define I2C_VER                                0x1F
>
> -/*BANK0 regs*/
> +/* BANK 0 regs */
>  #define NPCM_I2CADDR3                  0x10
>  #define NPCM_I2CADDR7                  0x11
>  #define NPCM_I2CADDR4                  0x12
> @@ -115,6 +115,20 @@ enum i2c_addr {
>  #define NPCM_I2CADDR9                  0x15
>  #define NPCM_I2CADDR6                  0x16
>  #define NPCM_I2CADDR10                 0x17
> +#define NPCM_I2CCTL4                   0x1A
> +#define NPCM_I2CCTL5                   0x1B
> +#define NPCM_I2CSCLLT                  0x1C /* SCL Low Time */
> +#define NPCM_I2CFIF_CTL                        0x1D /* FIFO Control */
> +#define NPCM_I2CSCLHT                  0x1E /* SCL High Time */
> +
> +/* BANK 1 regs */
> +#define NPCM_I2CFIF_CTS                        0x10 /* Both FIFOs Contro=
l and Status */
> +#define NPCM_I2CTXF_CTL                        0x12 /* Tx-FIFO Control *=
/
> +#define NPCM_I2CT_OUT                  0x14 /* Bus T.O. */
> +#define NPCM_I2CPEC                    0x16 /* PEC Data */
> +#define NPCM_I2CTXF_STS                        0x1A /* Tx-FIFO Status */
> +#define NPCM_I2CRXF_STS                        0x1C /* Rx-FIFO Status */
> +#define NPCM_I2CRXF_CTL                        0x1E /* Rx-FIFO Control *=
/
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  /*
> @@ -131,21 +145,6 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D =
{
>  };
>  #endif
>
> -#define NPCM_I2CCTL4                   0x1A
> -#define NPCM_I2CCTL5                   0x1B
> -#define NPCM_I2CSCLLT                  0x1C /* SCL Low Time */
> -#define NPCM_I2CFIF_CTL                        0x1D /* FIFO Control */
> -#define NPCM_I2CSCLHT                  0x1E /* SCL High Time */
> -
> -/* BANK 1 regs */
> -#define NPCM_I2CFIF_CTS                        0x10 /* Both FIFOs Contro=
l and Status */
> -#define NPCM_I2CTXF_CTL                        0x12 /* Tx-FIFO Control *=
/
> -#define NPCM_I2CT_OUT                  0x14 /* Bus T.O. */
> -#define NPCM_I2CPEC                    0x16 /* PEC Data */
> -#define NPCM_I2CTXF_STS                        0x1A /* Tx-FIFO Status */
> -#define NPCM_I2CRXF_STS                        0x1C /* Rx-FIFO Status */
> -#define NPCM_I2CRXF_CTL                        0x1E /* Rx-FIFO Control *=
/
> -
>  /* NPCM_I2CST reg fields */
>  #define NPCM_I2CST_XMIT                        BIT(0)
>  #define NPCM_I2CST_MASTER              BIT(1)
> --
> 2.35.1
>
