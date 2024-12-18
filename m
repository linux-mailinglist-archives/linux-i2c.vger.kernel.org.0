Return-Path: <linux-i2c+bounces-8599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCD9F674B
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 14:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A3D18811C7
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 13:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7D31ACEAD;
	Wed, 18 Dec 2024 13:30:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016AD1ACEA9;
	Wed, 18 Dec 2024 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528649; cv=none; b=HEF6AR8jo97O/TKM8NlT8cUReAhHq4718t/dxaq/F/TzYWU+IRtiE1JuAkRXpYy3rtiM3pGbRdvOjtCOHDqpd//UXf7INVP7i66+2xp8dxo63SrpG+uZdZl2MfrIY6czq+KDhhUzYYZ2cG+m2ll8Oyx5f17CYD6f8o603KVkffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528649; c=relaxed/simple;
	bh=Hoddnh63odfLX/AxlvRS9aAWHM5VjFs/XwvlPtsVKqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFGNKWfgMmZgUrz2PbUfmzjnItB6ItK8Adc4dsIhd493JDYJ/gNQ6O5fmfTg+XpaYLSKZfaaxMy2DWecL0uZ/ajs2MUsL6OQhheQGKl2f7PYNfBRY6pJuhdPqDP+GlEjvIyKp3OhHsp6s0WNVufCgKefDmNq5x569of6kOkuh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afe4f1ce18so1783110137.3;
        Wed, 18 Dec 2024 05:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734528645; x=1735133445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5bmGNivVaG1Qy8JNXysm8cK8Vgjt38i52LnDxCzAVo=;
        b=XY0lG8tXlr2oPPx1ncgG1VYKNwsLzsgFlOcpSPVpdqL6gUbXA/EKXTbp6/KHspMICR
         hXZcP+DlK5dgbDgxTF5P2de9tiKOgt9wPLCGRPE2mEE322+OkBRuvjyP+KvtRufykXkX
         pjkUwnSkFd3SqYD4MqFfFLffWq25mQYzIjXK7J1jkRG/nzeTMIDcMhW/scimvPuy4Xq1
         43aOt7zzP0ICoX7de7y4p+EiA5LhQb2JOCtQRQhh8Pqt83u6SemqmERxTP0xtTekkytM
         ruDlpx5871HxHX56G83MN6QlTWpA1EMkW7YHkoLLNp5iGctlXwvE69FQZmsE95Y2Hs76
         f2LA==
X-Forwarded-Encrypted: i=1; AJvYcCWheZ4rUDmz6W2lNlCy9Z1Q7ZOAhTPGOaygJhmmSvKwY2mO0MqFvTWOsQwJ22oBNkR9b0Xw0StuWu7RQTfh@vger.kernel.org, AJvYcCWqirua15+p8eUmAxhlzr8QpEehALmJwAOkdiXZrnIr+dct3s50R0FvBTDEtR9Sy2UDkj4kvlp4P32ayGuVPtHK+xM=@vger.kernel.org, AJvYcCXLRINAMmatE9zMO7qxiViPxd+CZee5G/ncJQ+aWup830TDuUjbT7hXgt3ofsdo7Jp0wJ8CC2EAlxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwphMQicrVrGSqStUjF0gPLwgKUVIGAceexcGruPrDIN9TpRHFL
	COcK6orEXuxsvcTxo3vibBK/ged6BbGve3ewyUszfGLJvBpVzm7SgQcsOaJT
X-Gm-Gg: ASbGncsKSwuDXp4clSO5MtCWqhA/rwAEqiY8Wf3wLyHgpHKv4NhuGNjylowUTWjO057
	svK5xjdSc5vqLzrs78U8wotd6NRSv4d7BycxiQYOZu7ZkTFy+OK3VLzimrUQW/yV9qCkBxr2m1e
	Mzm0kC8IJBYV5YI87hhULkzkef0wRiwf8SjNdfO429JeEBVvqdldc353gLYC2uj6Cx7dvqHbgWv
	JhcpdsQ/E0/gd3oGfpWVgkyQa176xoSe5gyD4Eh6M4VtHc8NXOGK8KOlyoO3cYrwnLwto0JHyT+
	aJE0lb7khek+/7TBac/eLA8=
X-Google-Smtp-Source: AGHT+IGGaP1W2UMQgYBDNCgvzUcMfiNhNz88VKB8OZnAmZkQg6QjJhh7gPIalhNWNWLoBQwvVUZzSw==
X-Received: by 2002:a05:6102:5121:b0:4af:fa7d:71bd with SMTP id ada2fe7eead31-4b2ae70c0d9mr2263502137.3.1734528645463;
        Wed, 18 Dec 2024 05:30:45 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2701f6b07sm1463354137.5.2024.12.18.05.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 05:30:44 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5187f6f7bcaso1869893e0c.3;
        Wed, 18 Dec 2024 05:30:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3apY9Ijx+U18MMPY7P4gnZdocnInsJSW3T4vrZRKmTeJRPnox8oR3poEkMWuNx94FXjBg7qAnSI7rIGbN@vger.kernel.org, AJvYcCVJH5Oq5bG+CThKWOvMfex6E2EirCLzm7UV39Vq9hOFHg5xKTx1bz17wzG4GXplNQPsfbNNe0bMeFU=@vger.kernel.org, AJvYcCVpqck2VPTB0v4nKKpVan+AiF6A274M2qbpqElw0oz3DurGI0HnLEO7AzN6qmUYVDuwIrsGNGFm8RnBk7n+HKHoJyM=@vger.kernel.org
X-Received: by 2002:a05:6122:659b:b0:517:4fb0:74bc with SMTP id
 71dfb90a1353d-51a36c519d0mr2435170e0c.3.1734528643745; Wed, 18 Dec 2024
 05:30:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241218001618.488946-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241218001618.488946-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 14:30:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXt5STYVt6Ht7Gq=LYCXaF7XOwFgk2mrDEi4YXix-Jh-w@mail.gmail.com>
Message-ID: <CAMuHMdXt5STYVt6Ht7Gq=LYCXaF7XOwFgk2mrDEi4YXix-Jh-w@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] i2c: riic: Make use of devres helper to request
 deasserted reset line
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 1:16=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Simplify the `riic_i2c_probe()` function by using the
> `devm_reset_control_get_optional_exclusive_deasserted()` API to request a
> deasserted reset line. This eliminates the need to manually deassert the
> reset control and the additional cleanup.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Updated error message

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

