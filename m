Return-Path: <linux-i2c+bounces-7995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D20E9C8D27
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 15:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD510B33290
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 14:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A2F77F11;
	Thu, 14 Nov 2024 14:37:32 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF5210FB;
	Thu, 14 Nov 2024 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595052; cv=none; b=W/O8tTAklwLrlY+UlMolcdUPO0cYoDzOocQyp2BUmoo0uJYSl8zl1AgiqsZ4j0/nznDg5X+VoUQfomM/3ftWa47KQhBYkoo5+G5++Fxkg1ybG13ZoU7QpDLs+/hWNCVLJmhjxrG9tT2ktPpjVHSOEQkfj+UVhYLX7Pv8PqI0jDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595052; c=relaxed/simple;
	bh=t541hJP3c5Xj4Le7WixV7EUtsLEwzi/Db7BTD4rgXVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fk4R54qI/CTi6mRJOLG8evcFT4s8YXZWfR3r7DH9vvAE/q+rloWActUYEKzOg0/3Iu0r9bzbl+56SiUaxddlbQFP+6ern0kDkQI+pCV/gBN3HLyrtfbKPLTMfx6DkukR3B8mwlULvcjn5PWvJfIaWj4A+CifuqEgYPw1jzoGN0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e380f16217cso724809276.1;
        Thu, 14 Nov 2024 06:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595049; x=1732199849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XkQAk9rlU0ipIFuZq7Z3F+TVNbmBiyHocTwUGKdmYA=;
        b=JNttXmt48oJpml5cNEKx1cNhRqwbWojQCJSQ31IX5yAmUtI+HWRwH3dECNtdP0bp+f
         xToPg32HB8vUA8iO1raThlZ+s5puvAkE67Vpu3NryFolls+73+2rWuG/aplJ2r2zz4AE
         5JaLia4FUlCvikBQvNUpuhMFypodKXIdeAjfYE9xnRdntAKmmYFZkWrVJf6/h8X99NPP
         6zLwQ0pRqdAxk25wqwmpzSseqI1zBU5AiCmNdQfIwCK6lv+26LYrRgdyohLeQzSbZrDb
         u11W3aAgEE5cB0kme2VScsKckvFy/QRiTw634xJsK2jOs/sPBPRLIZPu2TN1INLbx8bK
         d+NA==
X-Forwarded-Encrypted: i=1; AJvYcCVBpaCyfcLoYECLuSsma+DBUissQ/InBKfdCSSp70aBdRS6FzxHWvlA6HeuFAhqSo6OIZMqjsJqABE/T7EI@vger.kernel.org, AJvYcCWKQdYDXd0KqHhnpB4uf1UAP6LuvvXzoaMkuLVOeeSXu6bkROlZ2B8nWtN3wutwSGQr/xsZKlg3ufM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCdGIBUZ+4/5RLkNhITe+K9lq/mxozdRB91N3qLc1ihr6MMIBb
	8X65/BTin0KoyiTjX8snoD6ijqt3QAi2lpL8sLRbQ2LGOXAgDaaK6gjhAGJ/
X-Google-Smtp-Source: AGHT+IGpPsNQUYS2ZOed8DJV2Ay98iF72uufW6+ZUtF40JsDlGqlb5XW/jWnD8uVfvNz4n/Nlws/Hw==
X-Received: by 2002:a05:690c:6d07:b0:6ea:7b00:4aa4 with SMTP id 00721157ae682-6ee42f44ae4mr27326327b3.0.1731595048791;
        Thu, 14 Nov 2024 06:37:28 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee4400db33sm2611947b3.19.2024.11.14.06.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 06:37:28 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e38158560d4so657193276.2;
        Thu, 14 Nov 2024 06:37:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0LEGonzQ3IY2p7qxwIRatKpY6afSSs5I/T6tlhJRSVEWeVFlioylkH3G+wZr8jh46vX2O2kVGjQk=@vger.kernel.org, AJvYcCWtICBDfU0VpeaTyxiQOJJCflW8gfzjnzRzat54uaBMfw7VcJEtzeh6azc49JGE//WjGpCSwhZ6JaQD/FzX@vger.kernel.org
X-Received: by 2002:a05:690c:6410:b0:6dd:ce14:a245 with SMTP id
 00721157ae682-6ee43375cb0mr27009127b3.6.1731595047941; Thu, 14 Nov 2024
 06:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114131114.602234-1-mpe@ellerman.id.au> <20241114131114.602234-9-mpe@ellerman.id.au>
In-Reply-To: <20241114131114.602234-9-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 15:37:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLM-eeAa9=YwkU6gcwmD60Wba5v=F6PU20QMqzxRbM4w@mail.gmail.com>
Message-ID: <CAMuHMdXLM-eeAa9=YwkU6gcwmD60Wba5v=F6PU20QMqzxRbM4w@mail.gmail.com>
Subject: Re: [RFC PATCH 09/10] i2c: Remove I2C_HYDRA
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC linux-i2c

On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> The i2c-hydra driver depends on PPC_CHRP which has now been removed,
> remove the driver also.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
>  drivers/i2c/busses/Kconfig     |  12 ---
>  drivers/i2c/busses/Makefile    |   1 -
>  drivers/i2c/busses/i2c-hydra.c | 150 ---------------------------------
>  3 files changed, 163 deletions(-)
>  delete mode 100644 drivers/i2c/busses/i2c-hydra.c
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6b3ba7e5723a..cbd072955e45 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -373,18 +373,6 @@ endif # ACPI
>  comment "Mac SMBus host controller drivers"
>         depends on PPC_CHRP || PPC_PMAC
>
> -config I2C_HYDRA
> -       tristate "CHRP Apple Hydra Mac I/O I2C interface"
> -       depends on PCI && PPC_CHRP
> -       select I2C_ALGOBIT
> -       help
> -         This supports the use of the I2C interface in the Apple Hydra M=
ac
> -         I/O chip on some CHRP machines (e.g. the LongTrail).  Say Y if =
you
> -         have such a machine.
> -
> -         This support is also available as a module.  If so, the module
> -         will be called i2c-hydra.
> -
>  config I2C_POWERMAC
>         tristate "Powermac I2C interface"
>         depends on PPC_PMAC
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index ecc07c50f2a0..ab366ce6f15c 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -32,7 +32,6 @@ obj-$(CONFIG_I2C_VIAPRO)      +=3D i2c-viapro.o
>  obj-$(CONFIG_I2C_ZHAOXIN)      +=3D i2c-viai2c-zhaoxin.o i2c-viai2c-comm=
on.o
>
>  # Mac SMBus host controller drivers
> -obj-$(CONFIG_I2C_HYDRA)                +=3D i2c-hydra.o
>  obj-$(CONFIG_I2C_POWERMAC)     +=3D i2c-powermac.o
>
>  # Embedded system I2C/SMBus host controller drivers
> diff --git a/drivers/i2c/busses/i2c-hydra.c b/drivers/i2c/busses/i2c-hydr=
a.c
> deleted file mode 100644

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

