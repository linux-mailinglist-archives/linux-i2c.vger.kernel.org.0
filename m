Return-Path: <linux-i2c+bounces-8523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE879F34EE
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 407AE1884491
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 15:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9D51494A3;
	Mon, 16 Dec 2024 15:49:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CA353E23;
	Mon, 16 Dec 2024 15:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364169; cv=none; b=TQVor8NLRBWV1RtNeJy4O7m3AKfaCVElLJ28t3RjcxAv4W62WHNzxPFi9bQZSgPAiKyyK06IYQUZVxMCHmCihcHIt/fBv4x93Pmb6eXr4LI0cfLHZLclr5DiMdlosCb5cMXX3LtdKK1JEYCORm/0bOnDC1A/Iyhc2GEu5kV8otw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364169; c=relaxed/simple;
	bh=s42BqmLsAbRDynFfUKXg6KjrzQKhyfgEU22z4jU8cJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2sk8Qt7BqBBx1k3eI6PC7awlDEmsGF1mIPl4d1qFonHe/1I2h1sJgxoqWUzlG7zNraZ5//w5c7d/no8E7Hw0ZAPXWbehozImV2i6z2kNNkaIw2N9XD/q9ayPFmT+qcE/Ij7/No7V5pR/spMwhcGqzvrB+BKkqsdcNG1VO5A+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afe99e5229so1156033137.3;
        Mon, 16 Dec 2024 07:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364165; x=1734968965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/KK/DGJLlVcpaa/VzBQSTqWfD255PNzKjWR8sXYI7A=;
        b=kEvuF8Tq/h+AtNg7+g6cEusn2p6nji0mw5t9Fc6jTNaQIAIRDbVKfP74nILEuW7EQo
         6/Uuo4psv5da6atO9qhvlKgfRUEXvNDJNlYX40SXrIpKJ6iNgBXGnuVECFVRQmISeg1z
         Jia/4AGhTiK53ncclal5QP67k5/heKL/mypyIGvzDKRwHJlWudzKFA1xyYO5kNKiZWs1
         YGCUENeOWUaf8oFGyf/TR5+S+67x44MUV4ppj84IIXPPIMMVOLBvdewhymJuEdfdqZoo
         8QMkt0t4t1fn7ITYk/pFgi5SSwP6QvL3JrjS+8ylZsGhy/7OMN8fLwcisijloj3OK4so
         mUxg==
X-Forwarded-Encrypted: i=1; AJvYcCUc/Uq03VhipeGAJH7dr3+alLJ03wJgBm1U8xcT6eg6uHO1Owm+pxYNZgKPsmycD4Uq2MPtzdXcilM=@vger.kernel.org, AJvYcCVHMJ+IzP9WC28saQ/7vb0BU5YzDqf6UUG5t0r5FIN27BOE8aBpTg3PFaeRsLDwjQDQmNqWF1W+dELPlAWciRFXG4s=@vger.kernel.org, AJvYcCXZbTFnUDDlPOFEZcQv2Trw5N6Zg0NlipSg5NWmtk6B+o9rncJ0HyFVBACLfx+ijo/ACdOuiiShW09UMiV6@vger.kernel.org
X-Gm-Message-State: AOJu0YyEgqX3fcu4nh4sPjGqfsjvfhUQBxec6fnPRELXqCual9KdlsyI
	hBjv6555kKJjMIhnBHX0CUTEZyf8mMOibPws+vHpShsw7GKXpBn0MiL03SH2
X-Gm-Gg: ASbGncuoDf5r9cnheYtXUcD0rSz4KkrXxVS5Ve/6ZvGn/jOgs8UvNY39GNWke0eDo9D
	+TjPNvgqzbmS6Gq+IzUDXLg3UCdS5Fks1oK+/mExdMNn9QPhvjW3H4savoafVp76+8uuwpeEAWC
	3RdXYIp7UX6nCwf466b4CLJxzcEIHBa9MncjDS6EgDU8Rf6C0HfSo++SZ809cB6QfUv0SsSWgb5
	dShy0E/2IpaOf/1tK9afxf2MlZGW76ScgTl5L4NuUxiOzD81QJcxD3V+Uh1L1YDa1gjCGLnmE3S
	w5G3mQZpminxDmFO0KA=
X-Google-Smtp-Source: AGHT+IFjih+VTcHFPGNtfAmhoPGHcjA8g3KWaTXEv+ZyRk3LPdNsxLYyzKVtorNpCJvJrCYkjK/cgw==
X-Received: by 2002:a05:6102:4429:b0:4af:e4fb:2f0b with SMTP id ada2fe7eead31-4b25db3b229mr11907127137.22.1734364165337;
        Mon, 16 Dec 2024 07:49:25 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-860ab587109sm927395241.11.2024.12.16.07.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:49:24 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85b83479f45so732270241.0;
        Mon, 16 Dec 2024 07:49:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHCMT7WnWUg0OYEChytPhiIuBywsvuK7Oyt9fd722GOZr72l61hHVRdcPj0NLNXikYuPua49XWzFEO0p7A@vger.kernel.org, AJvYcCV/TpBFeu6LYYtjpC4y7ECCXbs410E3Ps1y9uoTS7M4wNcgX9bfo+aonD+JhNJMikllNzLw44jiTzk=@vger.kernel.org, AJvYcCXLyHzuBCYIcuuOHsi9Rvxzx1LdU5Gh/PsP864MDHrLs9NxObIZew5L6dZL0G/c/TEWLOvgGh2UWr5ZH+OKgug1WVE=@vger.kernel.org
X-Received: by 2002:a05:6122:2089:b0:516:11c9:f46 with SMTP id
 71dfb90a1353d-518ca32eecamr11929977e0c.12.1734364163493; Mon, 16 Dec 2024
 07:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241213175828.909987-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241213175828.909987-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:49:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX6Lhv3CmLa461fn1pbdh077sOe08Q6VcBiZmv0ZcNNfg@mail.gmail.com>
Message-ID: <CAMuHMdX6Lhv3CmLa461fn1pbdh077sOe08Q6VcBiZmv0ZcNNfg@mail.gmail.com>
Subject: Re: [PATCH 2/9] i2c: riic: Use local `dev` pointer in `dev_err_probe()`
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 6:58=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the `riic_init_hw()` function to use the local `dev` pointer in
> calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
> `riic->adapter.dev` in error reporting. Since this function is invoked
> during the probe phase, the I2C adapter is not yet initialized, leading t=
o
> `(null) ...` being printed in error messages. This patch fixes the issue =
by
> consistently using the local `dev` pointer, which points to
> `riic->adapter.dev.parent`.
>
> Additionally, replace `dev_err()` with `dev_err_probe()` throughout
> `riic_init_hw()` for consistency.
>
> Fixes: d982d66514192 ("i2c: riic: remove clock and frequency restrictions=
")
> Fixes: 71dacb2565ed (i2c: riic: Simplify unsupported bus speed handling")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

