Return-Path: <linux-i2c+bounces-8527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B82399F351A
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D104162878
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 15:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71823149C57;
	Mon, 16 Dec 2024 15:57:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DEF1494B2;
	Mon, 16 Dec 2024 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364661; cv=none; b=bdeR0MkONwr2d5OMN4/EW4dVwwiIdyyh6jRre3x74wpjH5iw3gExGSt8ZDYnYW23iTqLyKWLN4SeZfyqDo+JVu7Hc/mnmRiMvKdzPZy6YK+A+bKo6HkXR4S4u1TO46N3rqclT8FLsu1Ml8ZE2HcVtlWeLkEfkge8jiBD3l/dbak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364661; c=relaxed/simple;
	bh=fIDYlXvQOJj0MHS6CQWvXG3LDIZ1js9IKKCCACbETp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtxXiXEKnXFJbqGrn2v4yWIrv/T+TQXhdB8VivMgcsRRVcoum0ev4hCAqZg8QiWB5/NYf29goBxKCZ3v4SQS+sIp42KpSysjhl5q4YyNu3V2aSquTdXJynOxkNVVfHesrlCPeyJg8vOzKXA2jZUuINFcIlf5shc5ObXbn7muhSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5161d5b8650so1075116e0c.3;
        Mon, 16 Dec 2024 07:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364658; x=1734969458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gy3oZcWAvWbiJzxXQx6Dl6TjNe+Yb4LhHAJ+hDC4lxs=;
        b=MYAkB6i4z4nbqyFKByIohMxNtHZLoUsoN9vBco9KDNn1J17fQaO04ezpc4EcmfhFKb
         B4ndLfbFlgUd5V9kBmN5RFHHkMg5QoWDr2kqRZZqmRzD9PCp+ozEnyNt43vfpfV/76ZW
         lJk8XuIX/KSiuYHz+nc0gkslThCguGvwXJkbP95mgZ8i8eJI0ZzBvJchk3wQhspltC5s
         yllK84gAH6wDXK6LZwTJTDwuWPibKaWXQfic8xsv3TQp9B+R2sVaGLo4Tiv3G/UnmfjP
         cZOital889SmIALT8MB6+EIIXKd8NKx9nr5Pdz20504eHNz9RGTAIysPZwFqajmsQCNo
         AiRA==
X-Forwarded-Encrypted: i=1; AJvYcCV1LD/bTgD71Lj05MYjMzVuymCSF8DBGS69w+qvbkc8EhtGmiE0PsEYo1CRcbOXj1Ym8pPY86TpHSc=@vger.kernel.org, AJvYcCVAwNSkVJQzK9Ku9T4dkBuxcLnj0K9aBQfEPk7+zEmfkQzjB5yaq0dU+l0UnHeJ8iCSpAxPnmoexDP26lDbqj7pZ0s=@vger.kernel.org, AJvYcCWskA3xVkgRr2QIdehWNPyyLkq16EwV79YRreyU7AzTw6EJIKJy6z2d8XYOrkE9t3Zhq2vCBXUtqnzR5Nou@vger.kernel.org
X-Gm-Message-State: AOJu0YxjNPcQnqRGxwQAyvKFmhnNboGQNb9YrvwamXHsGCvna0/CqloK
	tv9W2PAzlLmzjiYDeTSJBvblgcscor0xHbLOZXqj6HsNyEpVckCjb9Sf3VBA
X-Gm-Gg: ASbGnctM7wKLcXaT2IciKi5TFPkaevznlhnQDUvYLLAXWxcqrR3RHfuZka6z5RTDLFl
	GXew1fAyTXKJfITTInUrluhVBW1E891OAad5XTK2mk9+SHosVI10bnMjDFJ7KRU76eianmbAX5r
	wGzQM8qtUQAATCpThgwI1FzbM7Ny6ayws0HjZqQKSWAp/TfHFb9V/AlDrksbByLgGHq4kKKKouX
	J1q6pA+vJ7M/OSiiy00P2b+oW1j4ZlypDJ87Q0y0+QvIHK4CR3AS6thJlJYmDufxGySd6z3drC1
	3EY/7I9JQXiZn9NVUGE=
X-Google-Smtp-Source: AGHT+IFDAvyl4OG75dzz/9/oSOnlRGN3TWwZskVLeZtaOY4ikA75sB0qSPWiLglL/rCFiLpGNub5hg==
X-Received: by 2002:a05:6122:3c4f:b0:518:865e:d177 with SMTP id 71dfb90a1353d-518ca3079a4mr11071783e0c.9.1734364658055;
        Mon, 16 Dec 2024 07:57:38 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519e30e30f9sm646703e0c.11.2024.12.16.07.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:57:37 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so1165868137.3;
        Mon, 16 Dec 2024 07:57:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaeyMsvQ86aVIkDcCN5435xaqCAEPtXWUzwyk9h8Polh7oohiONuIL0bQSLoMTE84UTyby3bTnjjCbiZda@vger.kernel.org, AJvYcCWoCWdIO4kP060R2jEVGsB/WJxVLIqTFUBI4aoBTYpPOipjLy73iMYwwN82yVE4+mwUqHAKkyD0zqA=@vger.kernel.org, AJvYcCXu88HdZqi9WMBKRgAbpI4Lr3rJXRLG7cVumPDOTs3wpm2AsUSRswKWAIPRqn6dpLDhOGB9R/agE4J9ejj90kC80gc=@vger.kernel.org
X-Received: by 2002:a05:6102:162b:b0:4af:f3bd:51cd with SMTP id
 ada2fe7eead31-4b25d9e30b1mr13015894137.16.1734364657430; Mon, 16 Dec 2024
 07:57:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241213175828.909987-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241213175828.909987-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:57:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAnShqxiXvcaavBJ0BAAznFWsg-i5PukZDEsX=AUQQoA@mail.gmail.com>
Message-ID: <CAMuHMdWAnShqxiXvcaavBJ0BAAznFWsg-i5PukZDEsX=AUQQoA@mail.gmail.com>
Subject: Re: [PATCH 6/9] i2c: riic: Mark riic_irqs array as const
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
> The riic_irqs array describes the supported IRQs by the RIIC driver and
> does not change at runtime.
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

