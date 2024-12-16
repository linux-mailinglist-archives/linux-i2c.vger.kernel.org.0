Return-Path: <linux-i2c+bounces-8524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4039F34F5
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B93487A119A
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 15:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95571494B2;
	Mon, 16 Dec 2024 15:51:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E653E23;
	Mon, 16 Dec 2024 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364270; cv=none; b=jyxwK+tCFY0Zx2MZIcCxKLYM5M96awAYmddjqn6lzEuiUjkFdWseMz4Wdt1ZLOks6iQVlcz9oqP1blNT6yITr4Yvf/X/IojYthdrEKa54NUGJBZXNv58pQQ5AVE2jztPrNN872ZBPGkk6oKCDZgCVQvX3IcGj7GILrLrRBstvIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364270; c=relaxed/simple;
	bh=UCwieU66/99o/wE0qXJcxX+MLBlFinlvMlIOZscA97U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVDVPaQPYU6LsiVByhV/hYkZ5vBdfNCC/LSEk6MMKklOXPdoYcuTekzdCgXpfWM7orEajvqRyNuqgReelLBCQLkDR6/dxxMzFcI/HtxsAvHUDIpPnf4fQJH0mBxf4ZFgtVMaaxNQKvorcEyPMKGZv3IGYKAqcAHqYYjgb4pNJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5188c6f260cso1281410e0c.1;
        Mon, 16 Dec 2024 07:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364268; x=1734969068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFmcu2x7nM+cpZdx4yRmO6qW4644N8d091wOSqNC+YE=;
        b=AylEcEHTSUtt36Y8vEMe5yXWKLAXUT533PRKdhQ1plWGF6GetOyvdBr43Yl5vy76ba
         mlk7ra4E+eBhoOUxr8bzALiUQiYx/hSbTGOxnYYuvd94DX2dpGJqSl9vGOlYiVaoqhCT
         3J4jqiGchzuI1/HyDEcnCY+18J6J+g9iiuVPF6CD4YoJVnafFj3o6gSkvpLo/pcakQPP
         pre4jyzQscexO3AQTRvGEhjwj3AMp6+0QNlDl2+Hsdamy5O5YHhtBXwVajZg+YUvXWb8
         gw10DsCIQkmolUyP99r1VEKpn4fhmQwYVJetQ8JBrWKHXqFLAbF9eB7nNjUfsc+tKdNv
         dghA==
X-Forwarded-Encrypted: i=1; AJvYcCWF7tkN//7A/OW70E/yaJTmixXeOuTIOUZMRwifHxFl1o2cztsxSPUz+bht53ekUWlvjN+qHqmZ1/Erdp90@vger.kernel.org, AJvYcCWssIG69OatTdHUDK/9GdeUVPdodPJPVYvIi8++fQdt/KPMbdcC5mYwtqzO08Uq09954X4SFpjd9r6OVY/bQs0Rpz4=@vger.kernel.org, AJvYcCXBBpu3IjwU5SpFUiVxXnwhzWoNOvFp+iIRloltOAUu4IYI0M2SWN15ZsTh8/wtSWv8WfUIDbhFLTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZjDDB6EKyvw/IZdntVR48kMKlZbA3U6yZSc2JezlDgEZyUJF
	TLHtD/dZGlpsRioPqM9b0f/V8KgXMshy3yHgr8t8LgI79d9U+bff9Y8oPIBN
X-Gm-Gg: ASbGnctRsuCWzR9bi82twyx+qWmfhoGxIsgTJa4KvMZSUaL+ujBpnZ0yjshJMVx02CX
	zwsB0JB0+yUqt2TpZWxmmh2zTzPzVW9m2ncBrLCcbzAXzzOqb8KpuMHo1/DDlwj92/fn1gNK3dg
	K6iUWvsXLYYFaAQaIIYUAb2fMwgs9xzDcM4LLTkPdO6VNrJE6sko9P1x8fMfH8NItq/hqMCqQlJ
	ICJiYhPDLZbxNyJHRgB6eHPlvXW4T9cRfKGB0yJV+JfXmo2/11Zj0HuTvqe2jLPGdGB/ionodC7
	B4kWY60rYunDISF7bsM=
X-Google-Smtp-Source: AGHT+IE6ML3f8XwhYx49vEkYmodzuwOugfM8xE8ZwGJ9BHc9Ryu10iFxvj6F9iSRR7TY2LoGyOwTHg==
X-Received: by 2002:a05:6122:2505:b0:515:ed1b:e6dd with SMTP id 71dfb90a1353d-518ca2182bemr11535348e0c.0.1734364267516;
        Mon, 16 Dec 2024 07:51:07 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb72a06csm677564e0c.44.2024.12.16.07.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:51:07 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85b95896cefso737778241.2;
        Mon, 16 Dec 2024 07:51:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2U6bZk6gthydkk07d5o6AqJ+TmaEnP9aBUXxHZwCm/Qrb2dSlWeV8Z6xrSaSjIhGUj3/D57f+FFiuigVIAVN5QbY=@vger.kernel.org, AJvYcCWSiDWQ6SeCGYH34Y4nRgFReCpT9TcKCf+zlF2P0oQe36FcHh2pzkVIgTPHyGa7+41gNWBGgNbBsbzUlrSv@vger.kernel.org, AJvYcCWx8BFCblo2V3Z4RnIqGFEfzMOqC/XGPJVTD1S5C1x5zX6C23GMUqznGcydNExFRBVXnY1ytNUGGgY=@vger.kernel.org
X-Received: by 2002:a05:6102:1591:b0:4b2:5c2a:cc9d with SMTP id
 ada2fe7eead31-4b25d9dff21mr13929134137.16.1734364266819; Mon, 16 Dec 2024
 07:51:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241213175828.909987-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241213175828.909987-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:50:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5KuMLih9_upsrJFHM422+N5mgMMafBLxKOtrBX_njiQ@mail.gmail.com>
Message-ID: <CAMuHMdX5KuMLih9_upsrJFHM422+N5mgMMafBLxKOtrBX_njiQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] i2c: riic: Use BIT macro consistently
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
> Easier to read and ensures proper types.
>
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

