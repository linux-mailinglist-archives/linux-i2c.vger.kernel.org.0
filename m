Return-Path: <linux-i2c+bounces-2824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 653F089BADF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 10:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 969C31C21C21
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 08:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96AF63A1A2;
	Mon,  8 Apr 2024 08:51:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C239AC7;
	Mon,  8 Apr 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712566265; cv=none; b=kecv6hZQSbUUOUPkFHQFmAkbR/v7VraIPVTlFeveneZQfNktknA0896Hge4JLXlXTIip10w5Q3lJdJhkyOAVnWaSTSDwAkwp7GYFLplXmOJUXu4G4ZkRcwgUdjVSnt6Z1bldyM45UIHyaReUnRax3dzRbQeOUWVbMdy1f0VDDwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712566265; c=relaxed/simple;
	bh=eJGFI4I49dt7XThhdrVtXbmwrsX1OQrh72tEumdCWak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnwAYDJa0lgRjLaNBz/7r7lacYcUVeF6YzZSU2QTJtWzd1PtK35TQ2d178src3YLaWXZ2VA6m64QLBlaWFmMaLdld7tqLn7zPQ76bHIouM7SJtFCH4CqDE62G1M/eGoLfREBHuiZ2g/Ne3kovdl7umKhozVlkcJi+jZo4rMRgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61149e50602so27288397b3.0;
        Mon, 08 Apr 2024 01:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712566262; x=1713171062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7knVccZ+joC6b/5osClP+4tRwlgsC83C6kaddSo96c=;
        b=efjNkuvskvzMv9E4mp3+oddCG7MQuh2K1RfPhCtATMC2p+yWn+2LtJPNK067UJSi3F
         3z2eHmC3EswnE09Ik+ewT/SpUHOYDB8+0kLfBhjUnmHgR7mh2K/UtdcD1jhuwreLweHP
         /SJZM+n2+LiXPQUylYIJnMvbU5wQv2UyrCmK7oY563SXb1xG7mBw7QzI/ZGqUxPoupXB
         JyEi67Lo8RRJbRVmsAGVP+dbdgTTBacjsEhFOTuoxNKGgAKrsLW/yHmmqmWwZjyjwMeT
         JLpoIwxwZvKAUSH7hX8lIV2hEy/ZZ6TkLD2mCt0azPDQAI00lJ3IJ2ezUY11N0BGdVQE
         4P+A==
X-Forwarded-Encrypted: i=1; AJvYcCWwy0B4WEwzucBookldEi4V0RKGw0JsP9Ojz7rLj4AmuKGP3EkRPiaHAKWxMcOoQ2R6DITtCxDoZy5lVcsNyIfCzzcf2ZQF/JR7QcgZfm2HhscmC2clAAI76Uu0FhDSrGXtuXfP5KMI
X-Gm-Message-State: AOJu0YxW+bCtYZPgyaAjCN7gxshIxoW38jhI8GqRgpAY298B6MGVClka
	zGLFVS6o1HQ6YEt3t32NXbV9/B2bci14rMSC/JMOm4PQ4UPUOglOrmEtYIJvCBs=
X-Google-Smtp-Source: AGHT+IGCu19QoaJOuUf23uFteit6D/90vy1ht/EtsH1gTkeTaV8gMJWZtPx4R6ZatwaLpXeod6SPMA==
X-Received: by 2002:a0d:ca54:0:b0:615:1711:e9a1 with SMTP id m81-20020a0dca54000000b006151711e9a1mr5242663ywd.14.1712566261916;
        Mon, 08 Apr 2024 01:51:01 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id p7-20020a0de607000000b00610e32312f6sm1633039ywe.43.2024.04.08.01.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:51:01 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so3066762276.1;
        Mon, 08 Apr 2024 01:51:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkHWfTYA2CrXhc4/cVzZPWzHpL6nVUmQdypZ4jBOcDKvKykUzFCk7Nu+/D1VlqY6A7ybE9a7HRfRV+F5+br+H5TWZVWRLeV4FXCLZ1y72DSI34/O3A2TmZ9tt8iSv0mR1DtRHt4KOy
X-Received: by 2002:a25:dc92:0:b0:dcc:6894:4ac0 with SMTP id
 y140-20020a25dc92000000b00dcc68944ac0mr5240129ybe.20.1712566261458; Mon, 08
 Apr 2024 01:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405101009.2807447-1-schnelle@linux.ibm.com> <20240405101009.2807447-2-schnelle@linux.ibm.com>
In-Reply-To: <20240405101009.2807447-2-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Apr 2024 10:50:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUQ2WgtpYPYfO2T=itMmZ7w=geREqDtsP8Q3ODh9rxdw@mail.gmail.com>
Message-ID: <CAMuHMdVUQ2WgtpYPYfO2T=itMmZ7w=geREqDtsP8Q3ODh9rxdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: add HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, Apr 5, 2024 at 12:10=E2=80=AFPM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
> In a future patch HAS_IOPORT=3Dn will disable inb()/outb() and friends at
> compile time. We thus need to add HAS_IOPORT as dependency for those
> drivers using them.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> Note: This patch does not depend any not-yet-mainline HAS_IOPORT changes
> and may be merged via subsystem specific trees at your earliest
> convenience.
>
> v1 - v2:
> - Removed HAS_IOPORT dependency for I2C_PARPORT

Thanks for your patch, which is now commit 53f44c1005ba6421 ("i2c: add
HAS_IOPORT dependencies") in i2c-host/i2c/i2c-host (next-20240408).

> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -885,6 +885,7 @@ config I2C_NPCM
>
>  config I2C_OCORES
>         tristate "OpenCores I2C Controller"
> +       depends on HAS_IOPORT

This restricts the driver to platforms that select HAS_IOPORT, while
the driver supports both MMIO and IOPORT.

At least for
arch/xtensa/configs/audio_kc705_defconfig:CONFIG_I2C_OCORES=3Dy
the HAS_IOPORT dependency does not seem to be met.

I think the IOPORT part in i2c-ocores.c should be protected by
"#ifdef HAS_IOPORT" first, so the driver can still be built on platforms
that do not support IOPORT.

>         help
>           If you say yes to this option, support will be included for the
>           OpenCores I2C controller. For details see

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

