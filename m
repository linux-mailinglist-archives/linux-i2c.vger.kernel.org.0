Return-Path: <linux-i2c+bounces-2368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA44487CD83
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 13:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 620261F22D25
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 12:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9CC24B59;
	Fri, 15 Mar 2024 12:59:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4536AF1;
	Fri, 15 Mar 2024 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710507544; cv=none; b=IU7aKh4GFjHexDLdJhZmJmG99zweqsOXfjGioryn4j7BskALHSLY+V6C/4FBxUsSEoP6J12/SeX8vzVp1W3K3/aH6fktWYAx+1mqgSPpWilOvNYWekucJZcumcRjG9c0EVptG8wjnNANKupKeVMjpzQvWEH65Q/4oH0jOT4Ikj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710507544; c=relaxed/simple;
	bh=aU/+xbHZrRa2hS8oJ9/kmv4Zwrx63bpqjJiI+btrVVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V37Jv2KTurMnKlqioGOCdpsFO8EjO8FJHPhlcjZeCVmmqaH3SuUakPh6MVt15ZtjZ7L0HucItF61WsPS34aGhSTxQ1YFVrr6PJeF5VyHY95BU7ZFUlhFiR0E6oFUfJdYl5t27wmmaKOyKspc5Z/Iuw1GD5qRc5debLJnjneeLWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60cbcd04de9so22251567b3.2;
        Fri, 15 Mar 2024 05:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710507540; x=1711112340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh+7X3xMJwI1csR7/OA1vWq1iHF+qCWaXfTH41sfHnM=;
        b=K/MiGuoejGUltMUVRfyz0QBEzbuD1qTn7ivKhpfHbQdP9q1RbDbWr60KpDE0YVapiT
         g/gwTcdBN+MRC2G23FsOuyN2w7Ua+k2ZsN2lfvu3MseJvXkpkqbGR8yRH6Mrg1MyB5/y
         xrrbj4Ie4Q0FO04qT7MlqXB6AFHpKrHBFGDdBg3un7hDVSUKISwf0eYx73Q+y6tWxxoj
         gOAcEWnYaXaCPq0uxBgRD6irSX8Z8yxqDPDFjZK7OIbodKhSye53dZmU/nc8vHagVdVZ
         vHul2zUdoE+k6zMK4/yn8hayLYgrionZy7gJUWYKS746cIiWRmGsB8HeHrUx70su59vt
         Cyhg==
X-Forwarded-Encrypted: i=1; AJvYcCUGwIvbfEzVpcXvZZxCrsGvSdf/xrY87TwFPMqrGElzijT1JKpQUskkA2xyACtMnWv335GdY+k7UcipKuez7lhvgCflIu9UnODMaGLBLVFCC1fvy/wU9AkmWbdRb7vZu9SyUfICVla24dhH/jgrwQf4ZJl8eGwndv81myuXgPMLJp4rGMh4v8OtC1GoGXrphrSZIhfuYc+Hqa9RiMnBBX/afmBgt9jX
X-Gm-Message-State: AOJu0Yx+UT1rPlXugwFr7cbg7OFzbvnyeRQELAFBWBNL6stWNPxSMSEB
	skT3qCIurltsjc6AkGTbQ6ax/zbeQbdy6BoswV2Vn5p4AMLPfj8cDh2hNhkQ8Ng=
X-Google-Smtp-Source: AGHT+IHgYo0LrTYs/K5TI/f16QIeEtbNdUn/0DRjx/nDmnkCyu7rz2N2TNfGAXJcTc65PscAZrHkow==
X-Received: by 2002:a81:6508:0:b0:609:c125:e649 with SMTP id z8-20020a816508000000b00609c125e649mr4692039ywb.48.1710507540016;
        Fri, 15 Mar 2024 05:59:00 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id et4-20020a05690c2e0400b006042345d3e2sm674360ywb.141.2024.03.15.05.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 05:58:59 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60a15449303so23149867b3.0;
        Fri, 15 Mar 2024 05:58:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLoKqCBDozIksvH8FnK2NigVK8Pjsb+zCrm0F5ocr8cpcrY4qE5e9im9JYu3lf80FT5O7fS0Dri4RTFOPlMDf4NnSxgq8UCyy6ZVth4DO/XZHpzrlhGYA6XNjSu4oi/syOVkzV0MF6JN+Q/S5siXL4zilRsrG8ocZa3A1fX2FvOuhsEmFS9OaHg9WgY5SQKhmbMNFD1jxFZAFtcSBx/TnXKPwAY3Dt
X-Received: by 2002:a0d:cb47:0:b0:60c:d7c0:8ee4 with SMTP id
 n68-20020a0dcb47000000b0060cd7c08ee4mr2808805ywd.42.1710507539610; Fri, 15
 Mar 2024 05:58:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240315103033.141226-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240315103033.141226-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Mar 2024 13:58:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8qKy4p4vefhrdK861dEi93Awr6NcQBHbLTwO0NWq6kA@mail.gmail.com>
Message-ID: <CAMuHMdW8qKy4p4vefhrdK861dEi93Awr6NcQBHbLTwO0NWq6kA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] i2c: riic: Introduce helper functions for I2C
 read/write operations
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Mar 15, 2024 at 11:31=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce helper functions for performing I2C read and write operations
> in the RIIC driver.
>
> These helper functions lay the groundwork for adding support for the
> RZ/V2H SoC. This is essential because the register offsets for the RZ/V2H
> SoC differ from those of the RZ/A SoC. By abstracting the read and write
> operations, we can seamlessly adapt the driver to support different SoC
> variants without extensive modifications.
>
> This patch is part of the preparation process for integrating support for
> the RZ/V2H SoC into the RIIC driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Renamed i2c read/write to riic_readb/riic_writeb
> - Made riic as first parameter for riic_writeb

Thanks for the update!

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -105,9 +105,19 @@ struct riic_irq_desc {
>         char *name;
>  };
>
> +static inline void riic_writeb(struct riic_dev *riic, u8 offset, u8 val)

Please use the same parameter order as writeb(), i.e. "val" before
"offset"), to increase uniformity.  This also would make it easier
to review your changes using "git {diff,show} --color-words".

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

