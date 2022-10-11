Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837B45FAC31
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Oct 2022 08:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiJKGIz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Oct 2022 02:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiJKGIq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Oct 2022 02:08:46 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B108768F;
        Mon, 10 Oct 2022 23:08:45 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id a67so9295687edf.12;
        Mon, 10 Oct 2022 23:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rokH8SB+fCVwoXBK5lTt7JbvkpAPiYRJUy9ay8afCHU=;
        b=KwUpf67ltK43D03SBE66eNPRpn7yhhdgS0Skz2Q8eUtoxcLKXkoUeqbIZVN+lWc1dj
         JfPMLQaYl+haeC/kgnIsr8xBTvrPBWzFgG2x2QdjOw83/2mPI/BpupFV7sdAcUOs0yEz
         nrB0C/ABWbjxYs6iUQNmX45REPjrqsKAuA03OSHNNDxfsWdM4nifhqZLngMmdV1GcI6E
         m2Vr2n9W4l/ZoMZVHjZiYrYT5tSpGihFZsB+zzEb6IqxrRBAMLrB41wG243jrZjPHFud
         ERWtI5dNzhjI/lGyTkjo2y5uREdGECrQpB6bIbA1QqEIg4axK2rBlPCLf/xIYU2eZqBy
         2TqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rokH8SB+fCVwoXBK5lTt7JbvkpAPiYRJUy9ay8afCHU=;
        b=Z+qJ1mzc2zjjWgPp3BDniV8QSBNBUdNhF9hz/OjW5+I0O3JNIjc6yFWPY9r6wqWGek
         eeFer+3+yJGFsMyJAWsSmWhyQDA2iSffG/1cLuQzAEkh2nl0zFQBQ5X/FIvGoyUBYZ8a
         p6PFASRnMqBDeiZ+fEAk4CrAQmddx3nR151t5ARfPU7M9MgDXTwZ2HYE69vyPALEj4nZ
         Wgta8IDnrjh7Ljj/ScUAuyu3wk7PVKh6KcdYp3GZXmKUT73DQbRjNUrN8hHkJp6w8/qr
         IQn5o3/oPXd0fq/kvnWq2PlpM08KIwIv78VMEaXDbniV1/AeC1HrBW5PZw31xBbCb+0N
         0B3A==
X-Gm-Message-State: ACrzQf02lfDcrUkbb1cCTJK7PIiD4vJCm/RlOjk645SjSUZ6M8iyOA04
        HQJdWmJElQx4AQjEcoN9y6kXTlwJUix7fK/496s=
X-Google-Smtp-Source: AMsMyM6HVsyRffxQA7dMiK2jhsqxPvCxPtElUDFPLF2FvR33Fk4NXJOV0Bsc6fwANmLFMObV0IEKU3AHsusQnwYwVKs=
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id
 y17-20020a056402441100b00437b7230072mr21426449eda.38.1665468523541; Mon, 10
 Oct 2022 23:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221008125924.1220203-1-j.neuschaefer@gmx.net> <20221008125924.1220203-2-j.neuschaefer@gmx.net>
In-Reply-To: <20221008125924.1220203-2-j.neuschaefer@gmx.net>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 11 Oct 2022 09:08:32 +0300
Message-ID: <CAHb3i=tVphSZiPKohnVX3Q0AXD0LYQYStNjzXzrOKFPvKL3odg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: npcm7xx: Annotate register field definitions
 with longer names
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
> To make the code easier to understand, add longer names to the
> definitions of register fields. These longer names are based on source
> code published by DELL/AESS for WPCM450, but should apply just as well
> to NPCM7xx and NPCM8xx.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 56 ++++++++++++++++----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 9a7a2d0bf5765..bbc7359e67f74 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -146,50 +146,50 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D=
 {
>  #endif
>
>  /* NPCM_I2CST reg fields */
> -#define NPCM_I2CST_XMIT                        BIT(0)
> -#define NPCM_I2CST_MASTER              BIT(1)
> -#define NPCM_I2CST_NMATCH              BIT(2)
> -#define NPCM_I2CST_STASTR              BIT(3)
> -#define NPCM_I2CST_NEGACK              BIT(4)
> -#define NPCM_I2CST_BER                 BIT(5)
> -#define NPCM_I2CST_SDAST               BIT(6)
> -#define NPCM_I2CST_SLVSTP              BIT(7)
> +#define NPCM_I2CST_XMIT                        BIT(0)  /* Transmit mode =
*/
> +#define NPCM_I2CST_MASTER              BIT(1)  /* Master mode */
> +#define NPCM_I2CST_NMATCH              BIT(2)  /* New match */
> +#define NPCM_I2CST_STASTR              BIT(3)  /* Stall after start */
> +#define NPCM_I2CST_NEGACK              BIT(4)  /* Negative ACK */
> +#define NPCM_I2CST_BER                 BIT(5)  /* Bus error */
> +#define NPCM_I2CST_SDAST               BIT(6)  /* SDA status */
> +#define NPCM_I2CST_SLVSTP              BIT(7)  /* Slave stop */
>
>  /* NPCM_I2CCST reg fields */
> -#define NPCM_I2CCST_BUSY               BIT(0)
> -#define NPCM_I2CCST_BB                 BIT(1)
> -#define NPCM_I2CCST_MATCH              BIT(2)
> -#define NPCM_I2CCST_GCMATCH            BIT(3)
> -#define NPCM_I2CCST_TSDA               BIT(4)
> -#define NPCM_I2CCST_TGSCL              BIT(5)
> -#define NPCM_I2CCST_MATCHAF            BIT(6)
> -#define NPCM_I2CCST_ARPMATCH           BIT(7)
> +#define NPCM_I2CCST_BUSY               BIT(0)  /* Busy */
> +#define NPCM_I2CCST_BB                 BIT(1)  /* Bus busy */
> +#define NPCM_I2CCST_MATCH              BIT(2)  /* Address match */
> +#define NPCM_I2CCST_GCMATCH            BIT(3)  /* Global call match */
> +#define NPCM_I2CCST_TSDA               BIT(4)  /* Test SDA line */
> +#define NPCM_I2CCST_TGSCL              BIT(5)  /* Toggle SCL line */
> +#define NPCM_I2CCST_MATCHAF            BIT(6)  /* Match address field */
> +#define NPCM_I2CCST_ARPMATCH           BIT(7)  /* ARP address match */
>
>  /* NPCM_I2CCTL1 reg fields */
> -#define NPCM_I2CCTL1_START             BIT(0)
> -#define NPCM_I2CCTL1_STOP              BIT(1)
> -#define NPCM_I2CCTL1_INTEN             BIT(2)
> +#define NPCM_I2CCTL1_START             BIT(0)  /* Generate start conditi=
on */
> +#define NPCM_I2CCTL1_STOP              BIT(1)  /* Generate stop conditio=
n */
> +#define NPCM_I2CCTL1_INTEN             BIT(2)  /* Interrupt enable */
>  #define NPCM_I2CCTL1_EOBINTE           BIT(3)
>  #define NPCM_I2CCTL1_ACK               BIT(4)
> -#define NPCM_I2CCTL1_GCMEN             BIT(5)
> -#define NPCM_I2CCTL1_NMINTE            BIT(6)
> -#define NPCM_I2CCTL1_STASTRE           BIT(7)
> +#define NPCM_I2CCTL1_GCMEN             BIT(5)  /* Global call match enab=
le */
> +#define NPCM_I2CCTL1_NMINTE            BIT(6)  /* New match interrupt en=
able */
> +#define NPCM_I2CCTL1_STASTRE           BIT(7)  /* Stall after start enab=
le */
>
>  /* RW1S fields (inside a RW reg): */
>  #define NPCM_I2CCTL1_RWS   \
>         (NPCM_I2CCTL1_START | NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_ACK)
>
>  /* npcm_i2caddr reg fields */
> -#define NPCM_I2CADDR_A                 GENMASK(6, 0)
> -#define NPCM_I2CADDR_SAEN              BIT(7)
> +#define NPCM_I2CADDR_A                 GENMASK(6, 0)   /* Address */
> +#define NPCM_I2CADDR_SAEN              BIT(7)          /* Slave address =
enable */
>
>  /* NPCM_I2CCTL2 reg fields */
> -#define I2CCTL2_ENABLE                 BIT(0)
> -#define I2CCTL2_SCLFRQ6_0              GENMASK(7, 1)
> +#define I2CCTL2_ENABLE                 BIT(0)          /* Module enable =
*/
> +#define I2CCTL2_SCLFRQ6_0              GENMASK(7, 1)   /* Bits 0:6 of fr=
equency divisor */
>
>  /* NPCM_I2CCTL3 reg fields */
> -#define I2CCTL3_SCLFRQ8_7              GENMASK(1, 0)
> -#define I2CCTL3_ARPMEN                 BIT(2)
> +#define I2CCTL3_SCLFRQ8_7              GENMASK(1, 0)   /* Bits 7:8 of fr=
equency divisor */
> +#define I2CCTL3_ARPMEN                 BIT(2)  /* ARP match enable */
>  #define I2CCTL3_IDL_START              BIT(3)
>  #define I2CCTL3_400K_MODE              BIT(4)
>  #define I2CCTL3_BNK_SEL                        BIT(5)
> --
> 2.35.1
>
