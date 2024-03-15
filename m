Return-Path: <linux-i2c+bounces-2372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A386887D3B0
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 19:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AA541F2335D
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 18:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDF210A2A;
	Fri, 15 Mar 2024 18:35:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93766FC18;
	Fri, 15 Mar 2024 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710527727; cv=none; b=unJ8J4fgLVc1cQ5Yq0KnXQf8dcuhiqgGsyNLrbAElMyVdM9xBa8UmHCtx4E5ghXMxqk7HJKJ7Bjf3w34QzFHLB86/Fk21rQfEbNicKalB4KnHQ84NV5N/VHTjh7FS7BsgH962xnrRFjNEsEsHYmsL+92nj+QIcMnsEwvsoSjftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710527727; c=relaxed/simple;
	bh=Gv8QKD12HIml6BcI86NmkVhlJYP9tGz7JBYz0p3U8kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HE54ZpRVmIhdc+Q9VwtulF/+CgYEC0BUCDs6T1s3dylddweKDZL7ACzI1O8+nxWaDarW8vlN1qcezU01vx6OAbhaLz6jG+HWpGZd5WDfO/iL3yHcl089dlzP93c6jUjL2ObMKeFC6xGdwbyfEko7zvB7BH1A3lX76RFNZZJIvL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a15449303so27165317b3.0;
        Fri, 15 Mar 2024 11:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710527722; x=1711132522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9WcVFiuL/IGi+J5+eglMDeGStL2NJRCLgSl7bWAdM8=;
        b=mM0EixQUJWTag5bfg9SVLwUF1FKs/xtHt1Br+kdQ6cb8P0zEhn68D0q8RMurKvASGU
         ze4CuOaNs11JGBv5lEkuspikeov9WnoDhmHIHrbPPYBp05whCjgTq9mqBE5NoqNa6Kq7
         CnpNjW55nWhmBRWooGvfruq+qo5PqKj8h+iJ3kZpnuB6amlU0n49psNH810MK4X7pQb5
         JmrFrpDmBz8lRaNEBrfBKcAXlA0kZKOTEn9qDcIR/z/SKTS4rnMQn18i9/rw2W+wbg6v
         W677Ic0vyEuiYD6+o1yeT+p8J78tiI9zQmFGUnoNyzLkw978cXwLkSPd5UEYbtQJZL07
         rS0A==
X-Forwarded-Encrypted: i=1; AJvYcCXubCw2USKiG9iDgV559vURVVGakxCmKYgmNjdH0yvOqDlpoKw98gfS9DL5UjeWLtzxBruFzAB2R2xVUA82Aiupcg+RkhmP+lMLgg7oR1pz5nghB8ElRneAcmBHDqY26jpm0/IIiL61kUtynpRQLiZmwn4p+4teEhj5zYsmquogcF3Mwu2pi5mvXyj3zjgSvsaaoVh0sJVUobKbxyDX5neGRsvkyUr1
X-Gm-Message-State: AOJu0YycvoHHyL/8juvJv4Ik+pdEaSbS/aZWFOBdKc2fdHzGSyD3mVKl
	z/pEmcEp3zmNTs6k2v1CUEAQwACBi3rNjchx6UldXrBsIhlWYny/gRZDoguNEXk=
X-Google-Smtp-Source: AGHT+IFklYu4oUcMub/sDiwT5/31Hf2W3LX/tGBWhOeSzReg25WSQcIwgIbOhYR4xbq0pLO9KM9gtQ==
X-Received: by 2002:a81:a253:0:b0:60a:374:969a with SMTP id z19-20020a81a253000000b0060a0374969amr6106221ywg.50.1710527722243;
        Fri, 15 Mar 2024 11:35:22 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id bs19-20020a05690c071300b00607bc220c5esm794529ywb.102.2024.03.15.11.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 11:35:21 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so2136428276.1;
        Fri, 15 Mar 2024 11:35:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMWKAW+go8i+wWDm+i9Ge+WYz4FXcuQbzbnsYpmYaHE97D2rI9zDZKCxVGSWUfPcsaJVceWHocRcsQVyVbsQNvWY217Nfdj8D3emsvxUmzXos+XQhzglSGpoLiLq36tnP/SrObhJB+rI4mBPfY6VLa9cHMvY+5COPtbTjA2ZrLQlDc0uu/8Z7Tsn7TcgRovQjSXE9+zf19EZ5j9jl72vHpGMw+3X2X
X-Received: by 2002:a25:f40c:0:b0:dc7:2401:df4e with SMTP id
 q12-20020a25f40c000000b00dc72401df4emr5038303ybd.39.1710527721014; Fri, 15
 Mar 2024 11:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240315103033.141226-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW_WBaGjYmU_RnMnq2T7PeEafAZqyP9Md9g0VUKzgrecQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW_WBaGjYmU_RnMnq2T7PeEafAZqyP9Md9g0VUKzgrecQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Mar 2024 19:35:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZhnf96M2MgLepu04J84jz_B_vZEtQYQZefsFu1rYfeg@mail.gmail.com>
Message-ID: <CAMuHMdUZhnf96M2MgLepu04J84jz_B_vZEtQYQZefsFu1rYfeg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: renesas,riic: Document R9A09G057 support
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

Hi Prabhakar,,

On Fri, Mar 15, 2024 at 1:50=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Mar 15, 2024 at 11:31=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the I2C Bus Interface (RIIC) available in the
> > Renesas RZ/V2H(P) (R9A09G057) SoC.
> >
> > The RIIC interface in the Renesas RZ/V2H(P) differs from RZ/A in a
> > couple of ways:
> > - Register offsets for the RZ/V2H(P) SoC differ from those of the
> >   RZ/A SoC.
> > - RZ/V2H register access is limited to 8-bit, whereas RZ/A supports
> >   8/16/32-bit.
> > - RZ/V2H has bit differences in the slave address register.
> >
> > To accommodate these differences in the existing driver, a new compatib=
le
> > string "renesas,riic-r9a09g057" is added.

As it looks like there will be a v3 of this series, please drop "in
the existing driver".

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

