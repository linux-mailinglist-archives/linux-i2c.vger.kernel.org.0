Return-Path: <linux-i2c+bounces-8528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E489F352E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDD60169DAD
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710A4137750;
	Mon, 16 Dec 2024 16:02:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817D1D696;
	Mon, 16 Dec 2024 16:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364933; cv=none; b=jL6zDXsGuoAwPriKhrRfnkD/IL4SMLGO2Kdr5BCOCMwgu6v8SpqsHxTMuFgeuAuKMM5OJ5LnB0BWWMFj+g2egl9OhHm0oCjTQ9tTFm0J0KYdlq82PRMbcqxaZf8FAwRlbmDn6U0mmM6UO6DO8NYSKwQ6NlA2sSKBsji28OxMgKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364933; c=relaxed/simple;
	bh=7qB+WH5CvzhJIUn/n+fEK1o4wvpCcq42CH7zzcTVJ0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVRybRwnlROly8dpoLB54y0xSwn4wbAO8yVp8a1sY+Fc6ZDU6ZJ14cAQJ6JoChxFq7z39ilDFyy6CBVeG7ZLJ3K9X5f6B5Ub54D47WociQxz7nwABqQPeDqfbTWgzvbTBut8Ahc9fJvaFoHeCjpy2mAiirkDKHGjLeEGoXX+L+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3fd6cd9ef7so3083961276.1;
        Mon, 16 Dec 2024 08:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364930; x=1734969730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rhzR3tttEO159oG0zFZxwUBRhydlJ5RVs56V/7Yj5o=;
        b=pW2ddd4bTJ+Xtacwkw3NW/n22DyxCBBbguUeCMd8LWM8YNO7SW8S+0ECzb4DuEvWMm
         kZJzbSst2IpcXJDTNtg7f1FXB9deFEIJ1XR1Uiv2sngcMO/8da5xOgejX7ygoMzDuPga
         MDoZF9ZjUDqorjDRWy8tiws4BYTzH6jQaiH1i1/+5277YLr6TtvMPE4ldiC5kH14PVlW
         o7FgPc+93nLmgumUMO1sEeLQc8didvL/BcbJFlP+nMm078db0wGnisP6ZN+3gr27ZFEA
         oM+Rr03HV30NDNto87o/dmlbf8K3y8boPKQv8rCptI8lhn2pr1aVH7+mt53QuabHRlo+
         or/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSvXnpKt4NBGOXID369/L/dEe5j2Q/f8iXn/4xUXST6EkwHMHT2pgcjne8phc0RGzPl7OjspZEzjHGG4Oh@vger.kernel.org, AJvYcCUZUCAlEyAXLOgjcA9xF/TxA6TSYGj1wF3r+qHGhF8Shauopt85Kx2nQEbjslZjbdtrLs7ktWrS14bRDK3uIvASZps=@vger.kernel.org, AJvYcCVfoXnPLhwV4lXQZEHhGHUV9I+x1PA8CxtcjsJgI4mmx4iAm8kw8eAqrHn1de/5aZVBS9JctqdPaJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWVzp2c9A/CKX0c49wNCmOMNfBpUt2hT06KzvbEhlTwaD35JFF
	WpWLRD9Z4tBa9ScXtPwPfc4SskjCXxAvBcGKlJviir/FVrwDi5yrCwvRbZxM
X-Gm-Gg: ASbGncuZcVhSiEzf9NTdU+yBH5/coQJmcmn6xhmI/St2fBKwpDGBT+Wi0wM2hgM2Klz
	HHScH+hDr/t4Y368j/+KJ1hgoaExMrsM5lcc1H5mwRAZ6vwSOGTNDDnyA9u2ZVFiOHvt2l1B6EY
	ktoMx9I6fCjr2iglG9vdC237sF3PvqbTfMWOADK3nqvyvhAwQhlAdk01cq6hKWAZrAlW1jMVOSO
	XYxff5xtCpZ7zH6g2BNxFaib01aPPKEFhHTZekwB1iq+T6aqTtZMXYxBrcyd+4R8TkwaLnBlJ61
	/inrhjjVpUAw3sGs1INy3Uw=
X-Google-Smtp-Source: AGHT+IFg33LfxT9NqKcTyZDrO8iVahlkEKy8+ELUTaGc2+zc9y8eONbTWngWX0MPNmHYcXJ98I/L8Q==
X-Received: by 2002:a05:6902:a90:b0:e4e:32d6:e9dc with SMTP id 3f1490d57ef6-e4e32d6f1a6mr3430701276.1.1734364929855;
        Mon, 16 Dec 2024 08:02:09 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e47021fafa7sm1401155276.2.2024.12.16.08.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 08:02:09 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6eeca49d8baso36066687b3.0;
        Mon, 16 Dec 2024 08:02:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTuSfL9FQ/Twa7y6yUzl/FTH0hM7E8FXyPN0F/Ri0djdGgTVfzwi4yE48K7mjy2KKva02wjj7+xXd6PBw9poO4zRQ=@vger.kernel.org, AJvYcCWTPyXiHFhKCfCoahfACorGJWO4PglNiFga/4SFmMpHeDm5jzdGrCSw7iP60tpRRAuk7GmXDkwG1WM9+57K@vger.kernel.org, AJvYcCXpJDKDgdXIPdpoWc7E0u7zEZ50c9J5pTOoyyg/OR61HihlP9gH+pyPIfuIoY0ol/FV/a8pPxKuix0=@vger.kernel.org
X-Received: by 2002:a05:690c:3388:b0:6f0:3f7:ab1e with SMTP id
 00721157ae682-6f275cc8dc9mr104112327b3.16.1734364928938; Mon, 16 Dec 2024
 08:02:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241213175828.909987-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241213175828.909987-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 17:01:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-z6jVKXOgAz6S0qrdQ+CcobT7XYiknEQJoryi281PAg@mail.gmail.com>
Message-ID: <CAMuHMdX-z6jVKXOgAz6S0qrdQ+CcobT7XYiknEQJoryi281PAg@mail.gmail.com>
Subject: Re: [PATCH 7/9] i2c: riic: Use predefined macro and simplify clock
 tick calculation
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
> Replace the hardcoded `1000000000` with the predefined `NANO` macro for
> clarity. Simplify the code by introducing a `ns_per_tick` variable to
> store `NANO / rate`, reducing redundancy and improving readability.
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

