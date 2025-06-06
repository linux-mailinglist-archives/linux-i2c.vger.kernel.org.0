Return-Path: <linux-i2c+bounces-11266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D9AAD0326
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 15:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E9817B053
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 13:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2421E288C36;
	Fri,  6 Jun 2025 13:26:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC9828852E;
	Fri,  6 Jun 2025 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216361; cv=none; b=lTxXdOjyLz6oeucgUOP6FZ2wFog9vgQW/MzRAHDouO7uYWoe1MokzIf1sWO/+ou3rZ/a5FpFZOSWO17P7v0uSidB1c/FYHBly5Zk4sxfCcby4myhTBdOG7uOTLmUZnV3ZPNLWz61xsMINaagQ75Mw67pqzr0oJvjRPrvaAkpgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216361; c=relaxed/simple;
	bh=HlmQyiD7lRAJAjekPuStEFPuTq66ZgP31O0JnrgtbHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPSYP+X1LtU0ggFd1SN7UNdCl3o1OISxDTV6uGPfjo+xs4YmNOyAvjlE33X0bbVKdGjs4fvezFIRiOmghPaqT865pktvmMXdTERkWqcuCvZtLHvUnHg37EfejNPsphljgykd6weEQT8WNl8RPrnN2METwTyWw4zJLxNGchTaf7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7561d3466so656710137.0;
        Fri, 06 Jun 2025 06:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216357; x=1749821157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PA1efIKwevEKJ6PmR6nxG1RXXlI/tsd7nqF/WhwHFDg=;
        b=tD6YljsItJKd8CVbwoH143qI3rHaAWQoJTJbsi0eiirVMkrFB6dp8LIPvAuv7KvmYp
         oG4Z7nasdEMSJ9yPq2t9jTDEPJPSTOz8s28ws8Xj37/V0cJs390gVPC1+nsnAmD0MWRa
         mulVLhh6KJYGrqUpqPJcOz05oGDwPwXDsUk3cpgK8f99gM3chUkqLuBcasyx2ywKfMB0
         eMv2laJ1zaCKDgSV1wX/RaEp84ELKm5TpI+UoALoc9i7sUTRvGW5/dEOZ8NVKZX40uTr
         kc0ce/jVPi18EF/Z7ClXduYydpfuVe95KG4Gf8jUQC77pga+uR5DVtc4D1HEG9ZIY2dB
         laBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+bLWIxq3+JyvTa5WIfkTjJrm14dP8OUAj9jfzqGNp8M5r46FcwVkhdNnB/ITzyF4q6K3AsXLE9kdLmuVRBvEH/I8=@vger.kernel.org, AJvYcCW22m1FK2DqvHvk4HDIkvNOjC7kurot9QyZpwHRGG1ffrY+b8Z5DJ9o0LPZOtGPYximN/ehUS9xfjMP@vger.kernel.org, AJvYcCWVcSbXKXPfbK0ltsFof75ft1w8VTsLy26BU3qnBycIXu4uGZvvB9BK74rfQZXtYV78e1JepV93A5as4keG@vger.kernel.org, AJvYcCWfhhKnZjP6kvMenjSt4sP+Doq2gudXBOsxb6WQeigt4QxMOjzGE8By/5CzoBOcsVoK/EKqJDP+JIzW@vger.kernel.org
X-Gm-Message-State: AOJu0YwmlzaJmvmS2749JnYLQSPI2GzYPCUAOsZh2v6PdyAfQfSkPZnX
	ADJzk939X8AFwDZHIvM2M9DJLcGNCa8nm7bFhMww/dY74VcMHTwWg9tnoDK3qC6z
X-Gm-Gg: ASbGncv3BTJfC7vD+xJat5i3frMeLzHycvvn/UCkxETQPZnq3SVyji43PNicNrixDWs
	eaVV0W4cBrCfLBT8NjXJYbi39RG3hdZAFb3R3UhDwoWOu9A8n8ck22OsNgiKf7zW5HHbRVVyJ7G
	dVSq+LCoH8PP2GQbdurAUzsp7nAlzUfXzSM+Se3ujvCIieXckDKEqFBr6Pr3WFWjyyScLVS3al6
	KkHQhXUIyQbs6IRNPU6C+VlT1rcf2VySvTwXmtBya0QXJOt8+aq23hKFKm4uIxbn/KMXF985HYc
	TKKdH9mk9FLE0zNhK/0wkvhiAtFHPWcErEVoENC7rS9b4a+OzPpAiocFoC7y/YPUug9mWJOfz2q
	KVfkLlWcg1PUYLamG4NzdJ8qK
X-Google-Smtp-Source: AGHT+IF/qQBp9p1aqHwZklw6BFWt3YtdokV535zi0/OBCD5JhqoJw7lKmSjbCHAaRH2Le0omLv/Y5w==
X-Received: by 2002:a05:6102:41a7:b0:4e6:ddd0:96ea with SMTP id ada2fe7eead31-4e7728badc8mr2617904137.10.1749216357589;
        Fri, 06 Jun 2025 06:25:57 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7737d37c2sm1149780137.5.2025.06.06.06.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:25:57 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so572387241.1;
        Fri, 06 Jun 2025 06:25:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEbUD2Gavn4iUuipM99X4WKbXhm4HV2smXLUY9JDvikEGA+K1UBqnu1S1gS8vz67xYya7DNqenZfQAZ3cd@vger.kernel.org, AJvYcCWTHUjJxU/HruAC+4AkqYJ0m2M3a/BAJpIPf1cHpYhTjq42RV15js0S9LXInB8tuGaSZbs5V99K3bR6@vger.kernel.org, AJvYcCWkwXWJYuUWjN2yD4qcakNotrYjXpfjnTiO+zI8iJ2Q+p+6ZWDpWWjI4MmGihfWibLCbKoLKmGlY7Xa@vger.kernel.org, AJvYcCXUrGFhmwSNABqA5c03+pLUtTF45LTpPPBMUpLGNVmuUHBsyal3z3U1EqqEHhcsq8DPjFNmEAtLuzhbHWqPf/Ai6Ss=@vger.kernel.org
X-Received: by 2002:a05:6102:534f:b0:4e5:a567:8e57 with SMTP id
 ada2fe7eead31-4e772a087cbmr3025305137.24.1749216357192; Fri, 06 Jun 2025
 06:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 15:25:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeBa2fzSKL1Q9jgr3NgoDuQZsGnZbu42cnEoEJSoiNEQ@mail.gmail.com>
X-Gm-Features: AX0GCFtfDLFR8_lgMUMxpakZL3MpfYTfvPNdY5fs0NEbOi2ivKeG8bfrE6iA-XI
Message-ID: <CAMuHMdWeBa2fzSKL1Q9jgr3NgoDuQZsGnZbu42cnEoEJSoiNEQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] i2c: riic: Pass IRQ desc array as part of OF data
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 30 May 2025 at 16:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> In preparation for adding support for Renesas RZ/T2H and RZ/N2H SoCs,
> which feature a combined error interrupt instead of individual error
> interrupts per condition, update the driver to support configurable IRQ
> layouts via OF data.
>
> Introduce a new `irqs` field and `num_irqs` count in `riic_of_data` to
> allow future SoCs to provide a custom IRQ layout. This patch is a
> non-functional change for existing SoCs and maintains compatibility with
> the current `riic_irqs` array.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/i2c/busses/i2c-riic.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 23375f7fe3ad..4950b790cfe7 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -102,6 +102,8 @@ enum riic_reg_list {
>
>  struct riic_of_data {
>         const u8 *regs;
> +       const struct riic_irq_desc *irqs;
> +       u8 num_irqs;
>         bool fast_mode_plus;
>  };
>

> @@ -607,10 +611,14 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
>  static const struct riic_of_data riic_rz_a_info = {
>         .regs = riic_rz_a_regs,
>         .fast_mode_plus = true,
> +       .irqs = riic_irqs,
> +       .num_irqs = ARRAY_SIZE(riic_irqs),

Nit: Perhaps initialize the members in the order of declaration?

>  };
>
>  static const struct riic_of_data riic_rz_a1h_info = {
>         .regs = riic_rz_a_regs,
> +       .irqs = riic_irqs,
> +       .num_irqs = ARRAY_SIZE(riic_irqs),
>  };
>
>  static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
> @@ -631,6 +639,8 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
>  static const struct riic_of_data riic_rz_v2h_info = {
>         .regs = riic_rz_v2h_regs,
>         .fast_mode_plus = true,
> +       .irqs = riic_irqs,
> +       .num_irqs = ARRAY_SIZE(riic_irqs),

Likewise.

>  };
>
>  static int riic_i2c_suspend(struct device *dev)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

