Return-Path: <linux-i2c+bounces-9084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B308A10761
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 14:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4080D188782C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 13:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7074D2361D3;
	Tue, 14 Jan 2025 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2+5Fvvx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F9922DC53;
	Tue, 14 Jan 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736859957; cv=none; b=XI6ahTMUneaoP/HTvFsVqLAvFVl8tTrM6A7U/w0TZoyKeHY2613MicePBMOtaZt40s27wJYQFDpRFJlRcQHRKYyUeBQ8tMRoPmvARsBXGQzqu3QhhvVjL9a0GgdlA+/jI4J9tVd2YCpW13NbxgJEC1Z4hkeNOsHvef1WL+c1qF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736859957; c=relaxed/simple;
	bh=yyH7YE+CG+eiWFi83dmPyWkVfF1aciuv75YL3Fg7Ed8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pHW1GxvUDBHfvOPIuNTxvNjnQ4+32Av3vK6SNwFjIKjlz7SkNimp1JHOrC+4e9YwlR9mTZ5zGlU5ZJIJS8/Du66vlPgNROqtbrxKpjwz3OGMn2CDEuxhHRZOk+bI6ah3/jQtfMIsqNuspwXeDafDfpAnChlSTPYpsjnZe+ZMQSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2+5Fvvx; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c4e74e2baso1160085241.0;
        Tue, 14 Jan 2025 05:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736859954; x=1737464754; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyH7YE+CG+eiWFi83dmPyWkVfF1aciuv75YL3Fg7Ed8=;
        b=H2+5FvvxNSXzWtMyHavD3weoWkiTHJHA42eGx/seEn+PXbLwSNIZVBE4c5DgaP2HDW
         SLExiOfTEnxbed+UPrpkfws9plEBtjmIMAof2rNRSCe13ezMZ6xfV4DjTA23t95rfXdP
         60syti6XQIFi/Z1CqZO9PoNgUUok/KLF4L+utnrBUCZ6QcH00CYU9s/24WZEf2xSbKaE
         cJ1uOohlDVzg3pkchWdDBiGBPG6eacLhWT508rg2QTozLf1RfqccFZe0bhfdAeGLUPJt
         CgNXbp/sr3xbPs9gu+R6bx8/uEQmpjtROK/q92gUan3e+blnQHtXRN7JyxjLvJ6aGe1O
         IFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736859954; x=1737464754;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyH7YE+CG+eiWFi83dmPyWkVfF1aciuv75YL3Fg7Ed8=;
        b=p7gflz7ukEWlxNuTqfbcewGJijo+NI6IE8NnJ7fDDXgSmlMLhdSXCFMBU+wPrm0SQL
         7PHIPWJV2K91GEOBw0kJFv2VcZFjdu7OalvA/kTcTqdvVtcRMTVpXD8AAh3M07UqUkBp
         r5MqHbC8cPAqGXHi7sXdmZLloeavPR9hd6ljYxMa1YdTreyGyxTWFD8ry12mWNFmd+Am
         YWsxBnyqLbgY7nDiWKzrZvdm5Hh32yYJ6aqrMDDZOlmt9NlRnHXkMe37mLAzgq56NI9z
         NrjzoDnhGwjC8FvUcFa6c/lDwx47Tck6VJukupdVM0MvYdSrrhKyO3VZsvnR2BUtoI24
         jxJw==
X-Forwarded-Encrypted: i=1; AJvYcCW4tAWET8yLPOZR+0RcnugJZhgNnyGMG6fVBBUou1BUOtzHglnTmeEkn8uX3JUDDOfEz4p6Qx3XBUIaVSyQ5GDqzec=@vger.kernel.org, AJvYcCWu01ipmhSp6HarcZZZe5skad9cksArmQ434C5Qx6v2s7NOv1Ks+KZrfTQ/vgE+02QN81YcDoDEkodcTDxX@vger.kernel.org, AJvYcCXQFkzUi6vKgPRKshxevMVGjiSYtEnGfqxSwlCqgLjSiUS9so2H9NkPnH4GV+ytNwksZcOLBIXHwA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHOO/ZsZEH/eR7nPleqWbIXA3O7dyPNtnaCT72fuoHohvO6xnY
	+I68yQAwKk99WrwhN7SEYDrzCQZAB1kSEsY3yRf4A+vT6CtrSXUQc13oMy1uNYQTpR6LcBE+MDS
	eCZEdM/e8xEZ3d6n4ffK1SadFANU=
X-Gm-Gg: ASbGnctK54vOYpdE0INQvG2/p0rJLpdhrMREtnWU34iMHgklXh31/IZw38v7jU5eD8Z
	aqBgTEH2ocLPqYkRdLq3GrcY3pUd74lX9bZ+60/c=
X-Google-Smtp-Source: AGHT+IHuen5JgT095oAhhOjZzmS64KMMfGtHLmFdLQJPs7/S8os7yTFzFAzuT221CmiSBRUyu41hrWR34QCpGKLEtlQ=
X-Received: by 2002:a05:6122:180d:b0:518:a2af:d666 with SMTP id
 71dfb90a1353d-51c6c439cf2mr18077814e0c.1.1736859954182; Tue, 14 Jan 2025
 05:05:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z4ZCJYPgvS0Ke39g@shikoro>
In-Reply-To: <Z4ZCJYPgvS0Ke39g@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jan 2025 13:05:28 +0000
X-Gm-Features: AbW1kva5S2d8rr1gC3J1KnQIuGQSMb12d98LysE1wqMzVzrBXKLDpJlv86KXvFQ
Message-ID: <CA+V-a8tSnfJeahjY0qn8_5+KBBTsLe0h=MqYwPMDq+Pqrnvi6A@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] i2c: riic: Add support for I2C bus recovery,
 along with driver cleanup and improvements
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, Jan 14, 2025 at 10:53=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > This patch series introduces support for I2C bus recovery in the RIIC
> > driver, which is utilized in RZ series SoCs. The addition of bus recove=
ry
> > functionality enhances the reliability of the I2C interface by allowing=
 it
> > to recover from error conditions that might leave the bus in an unusabl=
e
> > state.
> >
> > Alongside the bus recovery implementation, the series includes several
> > cleanup and improvement patches that simplify and modernize the driver
> > code. These include replacing `dev_err` calls with `dev_err_probe`,
> > consistent usage of the `BIT` and `GENMASK` macros, leveraging devres
> > helpers for reset management, and improving code readability by marking
> > static data as `const`.
>
> Applied patches 1-9 to for-next, thank you! Patch 10 needs a separate
> look.
>
Thank you. I'll resend patch 10/10 after the merge window.

Cheers,
Prabhakar

