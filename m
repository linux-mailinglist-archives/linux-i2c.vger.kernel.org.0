Return-Path: <linux-i2c+bounces-2355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFED87BEFB
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 15:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3DF7B20E0E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 14:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FB31E497;
	Thu, 14 Mar 2024 14:34:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A57A14A8C;
	Thu, 14 Mar 2024 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710426856; cv=none; b=BAaaY7Ma+f38+BOCU00AbvrSZob4dBAz4HtgaJryEvBhO629xP4/ch4KihTqNUwC4ep8M0m7sU5tpVIjh/qPawnlVPLe39t/Wz8Ylv+MOooXxIHY0+S/lgVvrtuQ+yC8vS1k7jWJqTRB/l+GltuSZNMTyjgm7B3VTAVh1iV//Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710426856; c=relaxed/simple;
	bh=FKovST/TpljdGGs8D2ZkyAgK4AleN6LIPat7SGGwkUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/vX2XxZ5PpCUhzJ+eEzbx0w8+KKfsfYA8hVpdWfCoIB1Tq0qUe9BjvOoY73IKtfXq6xHC0usHmsidFtgWVYnka1PUXI0e4SLT7FDhy7+n6XCtB3WuaBkqlHSVYkIbM2FXf7PEO7zg/Wk28zMfLYM1TWg7FxLgxZbbArzsW3KhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60a15449303so12101827b3.0;
        Thu, 14 Mar 2024 07:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426852; x=1711031652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4Iq1so/K1jl/ID2dXud6xMeQNRUVJwwek8xs8zgHgA=;
        b=c8IXbXQgQvXJvr+4HFvUHiQpy3kZfGauTt4iyXpxVLUQ3fpIuqTttmaOY6xrnUGeki
         /n+La1Yt1L90+fQfqETVmbQdZm8fEViMu6iV9GVDuBgjIbx91dtQi2lYZdUffzgFhwpd
         a3G3M22+1hAtKj8VjCmm3O/qsRxf1C1XketsPmB7G+v0U9KIXwtzkxVqtMMG3Exs/TsU
         mqSlu8Uw26cSWtoiqyje4pUBm/uMVf4CQ2RZ2rmwEDy8ZhwPPE2N8ST6Rd6QGYb3AF29
         79KQB9NP8PC+dhnzFFHE5oXBo5Rbzf1Oe+Sk3BGgoJ6sUQe1+R5JDZfEM7v5t7bui+Q0
         NJGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCLwrG/cqdozm3lrGkf63DO6utVPPjJ5lndybptRwQ0NXkRQ3rtZkEKdzE6iokmyDopETqlwtBOGHNjeFFispZhBqdSHgKDffTUVffCySbD0aipwU0CAqW1D8KY4czqWYy9LQOp3k6H9qilur4N24alZzMTAsJUt2frLR8issndM3ZD988dQAVP+ekjhK0Xf9MEdzOb61JLQkR/CbZT3TCW/6hM3gx
X-Gm-Message-State: AOJu0YwEi8kvg7X1ET07GmkJW1j7TyINoFaPA0ixjilJo4nkt/h13SJy
	MnDNZMqTAzfWFUKQzU65aKpKjvrcNryVu3T0BHnJPCaGHajdT8aaCrqLHPEQbbo=
X-Google-Smtp-Source: AGHT+IHk3kmywUXU9hcymN1OOj8wBNPklLaUiH/bLzCytCibIiA+43m9B9QXvn4tBtW5TUKdvAgUAQ==
X-Received: by 2002:a81:5d0a:0:b0:609:6eb0:4714 with SMTP id r10-20020a815d0a000000b006096eb04714mr2070873ywb.34.1710426851886;
        Thu, 14 Mar 2024 07:34:11 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id w127-20020a0dd485000000b0060a3b09a5c2sm295034ywd.84.2024.03.14.07.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:34:11 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so885803276.1;
        Thu, 14 Mar 2024 07:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKE8TvrxFTLLLpOGtotZuXpR2g2hcsfwcWXHo2X0w9e9XqP8KRRrhUnLDYLhGRKHk2379kNhCTUGgm57XCoq0UdcXp92mciWA7oq4rfn8/fuOING/jXApCoauVPII/KL/zK/VAaJoU8vCdv7X1yeaXnlPqSzEIC1oC+76p82qcvqu1RZ6cnvOrtYsqrfMotwhaQfghpw7Mvq1nV6HdLHyVTitXPlf3
X-Received: by 2002:a25:aa2d:0:b0:dca:c369:fac8 with SMTP id
 s42-20020a25aa2d000000b00dcac369fac8mr2083982ybi.1.1710426850867; Thu, 14 Mar
 2024 07:34:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240308172726.225357-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240308172726.225357-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 15:33:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNW-JbBLuou=dkn1dPJAL+g2GgXnN91nEaoYyNM1biOQ@mail.gmail.com>
Message-ID: <CAMuHMdWNW-JbBLuou=dkn1dPJAL+g2GgXnN91nEaoYyNM1biOQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: i2c: renesas,riic: Update comment for
 fallback string
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

On Fri, Mar 8, 2024 at 6:28=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> With the fallback string being utilized by multiple other SoCs, this
> patch updates the comment for the generic compatible string.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -22,7 +22,7 @@ properties:
>            - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
>            - renesas,riic-r9a07g044  # RZ/G2{L,LC}
>            - renesas,riic-r9a07g054  # RZ/V2L
> -      - const: renesas,riic-rz      # RZ/A or RZ/G2L
> +      - const: renesas,riic-rz      # generic RIIC compatible

Please drop this patch, as this is not a truly generic RIIC compatible,
but applies to a subset of the RZ series only.

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

