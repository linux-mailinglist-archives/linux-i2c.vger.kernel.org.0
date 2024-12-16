Return-Path: <linux-i2c+bounces-8522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E189F34DA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF9291886EE4
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 15:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5DE202C50;
	Mon, 16 Dec 2024 15:43:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC51714B7;
	Mon, 16 Dec 2024 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363781; cv=none; b=Vj7U6EnpUIvjBswrXKVTcLkbu8D9qKq9CL2vWmOBvmr/YtS5wTQJ4S9t/6Yp6fdpu0Sx/Fci/0bobKjmbIcrLa2oj2K2QSMZha5WRDe7aUg0Lhmu1cubEGZTyCN9AuBVlIiVRGNFZS9GIDlnxDGnGWIbQGvf2b/dQy6qevj/fjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363781; c=relaxed/simple;
	bh=58FYXRqBpcNh81+gZYGToNCLzgg83BEO8O5Yry+Fhoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQRjI71bb8QbnK3ak9jbDVrkhe1DDt+7dNBDXOi6X8wrib+5KIQ9bk2/qru1ySkZhYFZrcUGybJKY7PKMj7Bde3NB8Tlhqb5JnSt1QAoPcfrdabjTIb/fvY0zPU2D5F373dWP8M7EcBKEDR4lmZvuuszW0U5s+5piVJtuKdZ8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5188c6f260cso1278033e0c.1;
        Mon, 16 Dec 2024 07:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363777; x=1734968577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+acnXNVUQ0LA7MYUEQM7LfAc1qmX6IAb7It8hYEHGtQ=;
        b=KpFXkfxHibf+nIQlazEOzgbdux6XiFrJvA8geopSZ5F/OS6o+0VuVxKc7GJSAA0ULq
         eF4LBTzVxx526w4GyG3rZNuzEAfVq6qghXT9igYVYE7Y/dGkVgAj6bRxEWW+kZWQM35W
         TBVg/tbaROnplK8lcibcDO/6g7xkWBBihdde2g0cnYdsyx0jt+/Wjvc3cAR15E+slHQK
         im4qp2pjKf2N6sZtjaVW9asEZE1IupxOAo40mEZQjuu0ogqdmNzLochLuy4NEABhywNo
         e3Mubd34II6+nqM01v5OfT8+pGgKNUKB8keNSyIU7/5CHiYNnn+/IAqPUqudd3zHXB+o
         U70Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJl4AUq75QgYlW1Aw/mYMyoRSySD3W2xfTSDnZxG1KCTV/f+CVX+XfKfNcOZFkbILcF3Z/azIzHMfjlGuy@vger.kernel.org, AJvYcCWIXojEZUwhI7nHomdh0p3P5BKllAQJwIII736mWSG/4/+EnsdZ7sCkcUu74K+ZONtZNMaQrXPVitM=@vger.kernel.org, AJvYcCWXJsbtJCtJJiVknCz88Vi2PJ3HpjQkSlTNPGrBrC8lGGYOcoVC90WsplWDQFLbiN/f7owDstEFWkrFlbBkPDZ1OiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIuFEinTbwva8ZsjjFoMhCmiFirDdIXIqM2o7x/1xYukLhd0hR
	sbgkxcHHfs/MKrKbpCFHRRp7YvCdCG2Mex5bytWiBl/srCMtYKBXzaW1UsRc
X-Gm-Gg: ASbGncsbwv0KsW6vk+R5WQ6BoVghQU5zw1j35Atn4snIHdn0CX6JyXQ6jfX79FqCKDn
	YCDXOy3bzzWBHUu7XQfbmlIHvhQAnfgQYdiH/lBNJg7b0OXC2SgJZNM77G/pxe1QCuOv58btTbX
	H0uHxEpm0nZp92/ux9ypVe9FZnNbUsAwdBbg1MY4b3Lq2C9FeLNaMgKLyOffNn4w/8yWs7cEQHT
	l3Mmk6eO8GwaBId1vm/ACi8Diaq7x349X4aueJvCKlbwN7wmCeqDX0NlElX3Q78ZfIL3X/wIx8L
	hS+EpAL4zQfZJLQGHlc=
X-Google-Smtp-Source: AGHT+IGLVYyX1dGArf5gdqdcc8zgHtAJ//EzJwRXmYQhgiD+0+UuIg/0dxB1gViQMD9Gy5VMyUyVeg==
X-Received: by 2002:a05:6122:2505:b0:515:ed1b:e6dd with SMTP id 71dfb90a1353d-518ca2182bemr11488424e0c.0.1734363776923;
        Mon, 16 Dec 2024 07:42:56 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb72a06csm675458e0c.44.2024.12.16.07.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:42:56 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afefc876c6so1148533137.2;
        Mon, 16 Dec 2024 07:42:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/9rYR9DfvyHkxYL9cOfXCUDHV2xHtFu+j2gNWP7LqzIPWOcss0cTjE0VIpYKTWEq+IBSqTfF61gLa9y1XkI+yZmM=@vger.kernel.org, AJvYcCWVttc3vqgwMZQ6k21bzLGoYjcUCQAWJtAGT8+BNb73kqgYbkN7FAYuKxEmJFEAUi3JjVD9KSW9Cv/pVHo5@vger.kernel.org, AJvYcCXz5ArgDlavh4i2FNz1y8X/dUiOirV6goyisW7VmYHGzMvklp7Shhb1VRg31YC4oK+gSt3fxFXGhbg=@vger.kernel.org
X-Received: by 2002:a05:6102:418e:b0:4b1:1b33:eb0f with SMTP id
 ada2fe7eead31-4b25db3f6a0mr11773132137.24.1734363776010; Mon, 16 Dec 2024
 07:42:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241213175828.909987-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241213175828.909987-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:42:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9=ZNzaJaxyEB3Bu-EFL-txa4c9BOUo6w8Uk8zuPeQeQ@mail.gmail.com>
Message-ID: <CAMuHMdW9=ZNzaJaxyEB3Bu-EFL-txa4c9BOUo6w8Uk8zuPeQeQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] i2c: riic: Replace dev_err with dev_err_probe in
 probe function
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
> Refactor error handling in the riic_i2c_probe() function by replacing
> multiple dev_err() calls with dev_err_probe().
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

