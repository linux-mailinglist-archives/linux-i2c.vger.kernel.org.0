Return-Path: <linux-i2c+bounces-9901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8AA686AA
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 09:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D9019C2BA2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 08:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3C7250C02;
	Wed, 19 Mar 2025 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV/MfMU0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA52500BC
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742372659; cv=none; b=iJ5eyhM9O4VBJ/uZ1smRld5y81ASho9oXt0qW8XWJBkVL4yjTINLjX2lTP3hZe15Ln09Ph5GIWov4zZYMu8+JKb0MrzsNsLO1BY8lJTVbYQhNWbcVczfHNKQdhaJ9Aar9US3WNC28AKZqbZPwEQaN/f+Vp3IOBUcf8BXzB3YkBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742372659; c=relaxed/simple;
	bh=qWKKl5rsi/ROJDByiIt+GITGLbj9UcZd/cXXA4shWrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmYHI+OhYJzYVNf3IaPEX940OJel5Uio2ond9nT5oMjxsmfmqEOx5VLPiBmxFdoAMnw/g8ziX6J4ZglDbl0C8kENbHvqc0n0ScXBiQZct9fqpXNWGHbzYQs7hZAbr8IqF3QYGPuSMxXEgpNhidbMIVtQ5EHYbC61eKXVga542AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV/MfMU0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac34257295dso370546966b.2
        for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 01:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372656; x=1742977456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWKKl5rsi/ROJDByiIt+GITGLbj9UcZd/cXXA4shWrE=;
        b=cV/MfMU0ufETBhFi++eqc+mEla3n2+hpd3dSibUYFGfLxU6nP++QlOPQ7ppyo1u59U
         q+ECHSk8954CBJ+w7fPVoVnaqWx1mrOOj1v/wqt4EbJrlhi9Tbl5raSTcsL+FStOSAwd
         z+GmpYiE+v0tERpsoAItJ/4F7cftVYyxhSM3DGCeIxgbTY8lQEmCFoPpafRK18NLhUdq
         3X/D9Pbsx+yLZ95kNhz7qx0tEW0pOX782J6Om7E6zD8/5FD5OZvvMGtvRfE4Em8zSfSB
         71aMODYERw37VcfOHbK0bUay2DuDQKI7hBqzhu2PWvmCFYSMiFLsOLbIFSeckPfYrwlY
         TY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372656; x=1742977456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWKKl5rsi/ROJDByiIt+GITGLbj9UcZd/cXXA4shWrE=;
        b=cPdh41PH2ss91NOg0JrvypJLLUnz6FxjczWpFaHRjHt/bS4+kuEK3ObXoQoEfVLhAp
         mf4DNCPjOIOq1qBncDc669NC1LgESUu9pJrcZuhTpsARBdPbGD3VyfXwVptYbXlRxI85
         IeroE6iMwf7B9TTNm3OkYgsSWOd8Jpmv/28JVf9mSiQEpLxH2XnijL0onuQhbrhmOUqt
         vyg+e04GUilsgZwINF6BhtMdXOAlhz+Ia9fpFmdNF2w5rivqhwX1DjFLFLXESxQOpJfB
         t+Rf84lIIGbbjyg+nYHTH34uRei9Or8b0VxfyIdpv536KI8xbasZk9XIXZ2ysQnEnrY6
         Y4vg==
X-Forwarded-Encrypted: i=1; AJvYcCUV8m6B6EB5Z/HDe2Wm2jAGpKBoVrrO15+ZY1c8pPRQxvR+UGA/I+7xx6LtEkBbObT83Ot6kOuRphA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEECylvUlYr5F1J5fG9Oxj4gMsPegWyAjTOIEXk8DO6wckgwT
	N/4J4nogjr7jHLwe8AtAXRl9Ith1k7AJ6Tcaz0GQWVW54l1UjnV84kA+YrZNuqo2Tw36iJFQ8kJ
	WMhTKHw4ikEM7HNrdMcaOECjRIPI=
X-Gm-Gg: ASbGncsSNj2X0wt8UBHuIHwXey2m85mrhnwis9gYLlpq/XLsJZeIEq4StjgaHQhwBUQ
	W0rxOI7X3sjdqOjUNxcSIspIY49QouJ8A3F56CcKy4byi8nYRw0/fEUB/ApMkzhawSDJbFH5nae
	P1y8LRuCZyvT7ClaiNNCi2cDXxnw==
X-Google-Smtp-Source: AGHT+IGUukT9ExgChO+CTtfvbII0VrqOWh2xSIjh4pEOR/RviyO7iBf2JPq33iWLxaW8Lxv9g6+6wzguDlXrXoUwOt0=
X-Received: by 2002:a17:907:6e8d:b0:ac2:ede5:d0d3 with SMTP id
 a640c23a62f3a-ac3b7decfafmr178628566b.27.1742372656253; Wed, 19 Mar 2025
 01:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
 <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com> <Z9nxRwoeLEriKP84@surfacebook.localdomain>
 <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y> <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com>
In-Reply-To: <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Mar 2025 10:23:39 +0200
X-Gm-Features: AQ5f1JorrZSdZlrou-P5BvRUTUrbfIBo0BXdPDGMxVBXm2fHFG0PSYcoV9ecnac
Message-ID: <CAHp75Vdem-DBERs18=VqO+MUh=5Nyg9XLp8Jg-NuQ1Zk7cjFeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 9:17=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
> On 19.03.2025 00:22, Andi Shyti wrote:
> > On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
> >> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:


> >>> Switch to iomapped register access as a prerequisite for adding
> >>> support for MMIO register access.
> >>
> >> I believe that I at least discussed the similar change a few years ago=
 or even
> >> proposed a one. The problem here is that *_p() variants of IO port acc=
essors
> >> are not the same as non-_p ones. And commit message is kept silent abo=
ut
> >> possible consequences of this change.
> >>
> >> So, at bare minumum it would be good to test for some period of time b=
efore
> >> going for it.
> >
> > How would you do it?
>
> Documentation/driver-api/device-io.rst states that the artificially delay=
ed
> _p versions were needed on ISA devices. And in general I didn't find any =
hint
> that the non-delayed versions ever caused issues on PCI devices.

At least put this in the commit message. It will show that you were aware o=
f _p.

> On my system using the non-delayed version works fine, but I can't say 10=
0%
> that it's the same for the very first (> 25 yrs ago) chipsets supported b=
y i801.
>
> Likely users with old systems don't run -next kernels, therefore leaving
> this change a full cycle in -next may not really help. We can argue that
> we have the -rc period for testing (and reverting if needed).

My main concern is to make no regressions for most currently used
cases, that's why one cycle in Linux Next is better than none.

--=20
With Best Regards,
Andy Shevchenko

