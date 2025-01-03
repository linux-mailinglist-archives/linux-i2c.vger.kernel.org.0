Return-Path: <linux-i2c+bounces-8899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E0FA00BB9
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 16:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17191884CDC
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 15:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7945F1FA8C8;
	Fri,  3 Jan 2025 15:56:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031A1A8F9A;
	Fri,  3 Jan 2025 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919772; cv=none; b=uIdY7LR0ipV1whWqV3/m3scj7jfscm/tO2rqTzVVEHnVpPRf2VBS3ZhuwkMCdB/Cn+C0scL6FF1kEndllHeciRfIZ+0o70miHuANWUKsCx4H1w3W4sAtkD0W52RiUcMahsLeVsaSvZBI3OpXRjjI8WGx+eGMQ6hmEP3VXVv8zYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919772; c=relaxed/simple;
	bh=pT0U6gKqWknNj+IOXBlNYt9rdbHzosm81zpu05FijRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPX1Yum3K0tpUK23mM0PU0/fmhsgW5GFTPFf+iddxOBL5edB/vlyudJmOp2L6LctiJSA1Q1COryY2cSJZysKAxAC7RDPwJyyNW58hrc6uS1o504Q5d/3Mh/kEmER29x+KSdJMCwEZxPOlAYJHJ5swySnhlC9y0IKbdLHpcy5v3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4aff1c57377so6644959137.0;
        Fri, 03 Jan 2025 07:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735919768; x=1736524568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsYlLH3YG4Vh2vY/zLWj0jkuQzixjgYhRXWHh9jcJBQ=;
        b=wiH3LZXLOYmOiUMxvoEHnBSgrHQIq3sD1/X8HTtiRQ1D3Pezp+RqfaoAjYwVNTPzmM
         RvZ9+MGQZSNkyoTfocdpAEp2JEwkr4kTWuK18DFj+f4w0X81nniix36v6lr6ROMZODwk
         rAtlstn268w9h/khm8PXSxr1xUjuzFFSTBHu2DxRz3nGI25skbcYs+bslNni4yDoinZ1
         9W7L4B4UgilCulub0bGbjhKtAX5TrrUVMP/gPJy5qM5+aOqIHrkB8lj95qy5rMaMRodT
         vScKzfRg81UlChg5Jspna3X2PF9IgLqN2cMniNNdbamuiipU0e88Urv7Jot/6DAC6Jio
         d6+g==
X-Forwarded-Encrypted: i=1; AJvYcCWGy2T+sLnEAPuw9qm/fiFCoOo9AUZkTdDNHl6KVN+f9acqPPnmDWg0x7R2+eyPQA78ZV33f5kwGTdznzCO@vger.kernel.org, AJvYcCX8ytkHjSQxSx9oXjEYAWnudieiANxcivgspHtxpu4LmjqbAWVPuJGtgMWzrsAjZiQNGI0XkwxB+ON5e8C80u5mAwg=@vger.kernel.org, AJvYcCXl5ehhvv1kChedH4sSbRkmO5VxaEwiN4MdrQLQ+fYai1vcVHbrrBfCnNztI1CbqgpWjbu5XsZ6A84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/PJsnx2HRwTDHTMxiV3Zc6XxxY2c1amPVXEQc5iycE0EggrM2
	PSgL9Zxxqhf38RW0qksTMq9vHHfqb+AXKwiPTJ450iQ3iJpOLZj/15ZVypWf5ew=
X-Gm-Gg: ASbGncv8nrE4ViJzz8uLDw3Jvj8ZDXOcAbXC7uHUgTHd+P76Ngc2L2vqAQTVq1CVaxL
	ELxA2IsExI0gDUhNAk4MYhG84+v/U1TLOMjTggsDnZPN4q84CGwTs6lebn5ZvM204epSER5srO0
	sEmrMZGTZ4YUNlANYCELNqv4nYlv00SJXRNuAbJkGt2FJaA2G8sc9i+hgYZYgNWfAynVOQDJUVW
	1Hly6QHbZvc1sBO5RwA4gg9NqVKY1pwYz0YJD4EC1a5ukRC/wRREkTgJzI5Bkgmnb8+OI/omtRg
	cyl9FVeb5+2MPYEMv0xGV5I=
X-Google-Smtp-Source: AGHT+IGkmLERhKz9U0tnGN/BteplE56HRXOH5effySnE6n7u3WmFo/5y56Hq4eWU/Pcd9pcmPt9d+Q==
X-Received: by 2002:a67:fbcd:0:b0:4af:d263:de23 with SMTP id ada2fe7eead31-4b2bc0da4dfmr33600899137.9.1735919768619;
        Fri, 03 Jan 2025 07:56:08 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac4bfb2sm5658876241.11.2025.01.03.07.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 07:56:08 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5174db4e34eso8750409e0c.0;
        Fri, 03 Jan 2025 07:56:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXFE95da3LKGajsAIbbapcqoEc2ARDZFWDkmTC9OMsXWscLtHGHG7E8B6uafjT/JHagBx551AyZvEzcqdZ@vger.kernel.org, AJvYcCV7wZD6Svg6M849lU4e9nbPOzmBUr52cVSvuny3wlo8pUEtR/GH4jq57ZtmMQrrrNII9JiHDxgCC8k=@vger.kernel.org, AJvYcCW1KFm+f0/cGDZXRxMmrTjs0wmmK/Z6ZkKSDnoQI8i45JtmBxmHnT7KWltFYobL+rLqDXo6ksOeVR0xFEKSuRtc5+A=@vger.kernel.org
X-Received: by 2002:a05:6122:320d:b0:517:e7b7:d04b with SMTP id
 71dfb90a1353d-51b64c0534bmr43510145e0c.5.1735919768085; Fri, 03 Jan 2025
 07:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250103091900.428729-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250103091900.428729-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 16:55:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUN41eOT8nUH=RhE-ynzJGF4mi1s=vhYiXMm7wRUH+Y2w@mail.gmail.com>
Message-ID: <CAMuHMdUN41eOT8nUH=RhE-ynzJGF4mi1s=vhYiXMm7wRUH+Y2w@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] i2c: riic: Use predefined macro and simplify clock
 tick calculation
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 10:19=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace the hardcoded `1000000000` with the predefined `NSEC_PER_SEC`
> macro for clarity. Simplify the code by introducing a `ns_per_tick`
> variable to store `NSEC_PER_SEC / rate`, reducing redundancy and
> improving readability.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Switched to use NSEC_PER_SEC instead of NANO
> - Updated the commit message
> - Dropped the RB/TB tags

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

