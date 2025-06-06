Return-Path: <linux-i2c+bounces-11264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B249AD0318
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 15:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE403B228E
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 13:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E900B288C26;
	Fri,  6 Jun 2025 13:23:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C728852E;
	Fri,  6 Jun 2025 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216210; cv=none; b=PJdGP8JzPpCIUFWy7VsHbXPDoZVtO7mg3dBvx7p56YNLlZXGYi6honPVsL4MksIRitXFN8r2xByUDkddMjOdF+KrsBOG7/LHHSjogRhSr6lFd7OcBtuxt4xyVjO5wsic5+5ZFIvY5t7sk7rX+Yae2dz+Nv4AxcZnFjH8pTfB4Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216210; c=relaxed/simple;
	bh=1O43kLCCjpP+TNHlQ+g741PwHG3hmtdBwonuIrGfRoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZnlocDQjEAmaQCH8DN6zTLnBt8RcCpN8Vtaxisy6Y9kDhzBdRsYDh+nsEnfZPvFuI7RCorgcWOLbrFsaba+/6UnenuPgTdwVR3NL+mh3cBGkMcKuSfk6VwB7gswenmzYMZ4No/9JXHrAC2zqA/C7IIEWNA9ZvutxlTjNYYdr2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-530d764149eso569929e0c.1;
        Fri, 06 Jun 2025 06:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216208; x=1749821008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLGBlMljGxUzYj6zseFCN06dcUibxMge+KFFj/3wDMM=;
        b=FJVASKvqetGoLk0RuwffwhhkVsGti67ijfEM9MQaRa2ozUqEUVgVsH70/cv8xYQ/ET
         5Q3MzEDutHhS47VXPCFXrmQ1RBFdrMkpnY85mpDKUSGcoHrveFTIGDQwTpaUhCF2f3CR
         DtUAsruBjtAcZT+dyMP34m34mjRldFvNSiWOhdZa6cGSsJ62OR8y/A/TS+/aBYAnjgZB
         UvfBL1oqIw//O6/M+yEsRILI2NEHAZZ/dTL7hSq2jx6nbFMvRlEkTkwazac7sj8OnKrG
         PeoAxZDFQs7BNLtI/4yME73HcJ5qEHt5QRCe3HeuXSrAD4rGz9Q2ZRlYGssUMmnks0gN
         sfcA==
X-Forwarded-Encrypted: i=1; AJvYcCU5XKTopKajvrm++d2doJzX0HPIZocPLlo5YcNMBXzn21V1lj796Ex2ICPLe6mhZJqKAMJphSFkKXCs@vger.kernel.org, AJvYcCVi4d/W1w6108hur19TAFPiCkmhqeXsU3VRKIOVjfULLFWH20HtXVcydM8vHDuFh5A+HgADfJMynHC2@vger.kernel.org, AJvYcCVmBH1EsztcICbSTlCKtNDIw0wqUIz508O3huXpAKYCp8CLJyAUGga9x9Kq6LA7/SnHp99sbHWtiDdBXuS+nF8reC4=@vger.kernel.org, AJvYcCWMGHvjiMA3x8dhGchCskN4OKyunLtB2fV61yyiGwO0F4Q7nZJgDOZeU5c6YBRP76cVju2m/rrLjvuTxhiK@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5H/Mv8T1AlGH8GjzBSNQlUJRXysS7en2Dsu9zyR/1VigSiUX
	WPkgLXEqfejJGe6Gk0pt9s+VfOOk6zQs6+JffjISKs1EfY8LRBn4QkB5BDy++PUW
X-Gm-Gg: ASbGncuKV2wo4phWd6aDyrJ++4HusH8kYNLKZ95y0TpVQYf7/aOHKxSZhWj8n9gYT3u
	DDmHDs8gPmqSyStaMSU5woYWtSqNAfrvhhrQx+naKg68SROSz5RmfnHuLYkA1CrtqwTwD1QC1m7
	AN8tIflfPePN43O/rzK9XWEie+82wwbg8xR9aZy6MvPydU4M3KPXIVdPJLSOqhTpIUzj2PW+t1U
	ZdFNhzsB2MIK0bYTGzQlGKjY4y9Oc/4oNglgHoSZM3CqO4airV8IUSnhtuebapIWH4FdWVHErg+
	caLecmXban2jhiJ4qB7JGkxMcqkj1ySclHmsVj2/1yc/XD35sbGvYBkNv9CxGKD0Rwv87SNMDej
	Zq9oJzRmyWeAnkg==
X-Google-Smtp-Source: AGHT+IHq2D9lKGc7g69migtcE+5GG57ZiCTikQJ1Q00qBHumZqKLVU0QDGedWKQjhEkcJhJCTk3Rlw==
X-Received: by 2002:a05:6122:82a4:b0:530:52d0:d021 with SMTP id 71dfb90a1353d-530e4890241mr3109914e0c.7.1749216207846;
        Fri, 06 Jun 2025 06:23:27 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e6411d61sm1078109e0c.41.2025.06.06.06.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:23:27 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87ea6361feeso632558241.3;
        Fri, 06 Jun 2025 06:23:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXPQ7vL+261npMh4XpyX9m9leUUExl4F/NrEB+keJFPmnbaSPknqh6+S/PgRvYdczFwhWxoEHu/k2OAQ7z@vger.kernel.org, AJvYcCVP/p3lLuesVWpDwtkRkIef8xrhizuB9L5EIg+8lg/f1eeeqQ+KKtC1gXwQez3H2yrgj0Wxx/Neea1g@vger.kernel.org, AJvYcCX5+W6czwN6lYfNEsKxJ8Mh3XQIXFUqgMMrwBSKL+DRdZQNT63nwU0me46/qUgG6/49gBdM0H/VhAYH5PA/sokHGv0=@vger.kernel.org, AJvYcCXo4p+prSt76m0RlBdeTGy5RZtlDErNlHdupQDGbyeKm3AX6kiEmoNPc9zlI6bjPay2ExW8pFGaSlsN@vger.kernel.org
X-Received: by 2002:a05:6102:3a0d:b0:4e5:babd:310b with SMTP id
 ada2fe7eead31-4e7729af39emr2765647137.10.1749216207242; Fri, 06 Jun 2025
 06:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 15:23:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVshPg_xbZFb_TPRcKv8YxenzR-L0Zz8v7jXspbm_XF7A@mail.gmail.com>
X-Gm-Features: AX0GCFsXpYx6ymQqw0Hxe6p0jBPNp2Xx59RXtnVFcr-qgO5qSij21Hb50FlPBDE
Message-ID: <CAMuHMdVshPg_xbZFb_TPRcKv8YxenzR-L0Zz8v7jXspbm_XF7A@mail.gmail.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

No regressions on RZ/A1H, RZ/A2M, and RZ/Five, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

