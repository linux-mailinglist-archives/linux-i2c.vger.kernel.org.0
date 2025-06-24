Return-Path: <linux-i2c+bounces-11566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06503AE6218
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 12:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124F23B3522
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 10:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CA61ACEDA;
	Tue, 24 Jun 2025 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKaIdSqn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C0272617;
	Tue, 24 Jun 2025 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760317; cv=none; b=pIKLM+hCATBXloeDAz/HX3S8Nh9os8KvkKyjddPrqfXNJuUDa5g8PSxkkT0N5s+YJ/etcsiO4slPZVxCPUBoFlKMHCzinVskfskw2lmgCESsmB0HQUQsZLe7JuLVObHz0T2LFYt7VvubtXI8Z6G35LA7GAfu9UlOxHRkMEWgup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760317; c=relaxed/simple;
	bh=O5ebrIWDX9MUdFhYtwsTfT3m1i3vYDC0sgpaJbTJv/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhkAHBanhnhQFg0v/KY1meL+B92C8VQybWUH9Ear/3ws9p5mn8ic8XhSi/5mVqgsS7vRGZlON20Y0HRmgBrvL5Yi7XIddcSxMRy9GNkf2wvCvA8Q1tGRSW8LuhzcWj0nXwP7j3nlRma6v4CoWKIsuc0xsO/vcAZFSTMmwN6tEAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKaIdSqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E69C4CEF1;
	Tue, 24 Jun 2025 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750760315;
	bh=O5ebrIWDX9MUdFhYtwsTfT3m1i3vYDC0sgpaJbTJv/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oKaIdSqnZdJzts0zPjsXfGpDk+Bt0ZsRGQDCdihWVCFouegkuf1yrIcTXA/mDPINe
	 vmN2L/ENxxc24gPnEJCI1Wly7J730i2fxXZvTj4YlTKHTMZiZW+5BNw2Qpz//1AwbK
	 YBqWB2WHZlsf/jcpCK1vycbfajzJ9ruYKwht3//9LYFB90WGy2iq3raK4toTx0swz4
	 h4ZJJxkdET8xjqDl1HZyccQlqEL7keZVQSrC0rJbEtesXlIEpGInIB5TeNdX2XFH/s
	 +hvVgWSdYJGajxdhWMM6micp7IfD/Zz/IaQbfGFdQyNA6vrG+rNkzm6kuiitcFiUwb
	 6lGaxq9lAY2TQ==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-61169c35f2aso55617eaf.2;
        Tue, 24 Jun 2025 03:18:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeXLZ1o3lI9+Uu18UieeFvXE+XThpw048DcL0UiTyq8x/1S2JGQBJEqdpN4MolXh+VBCrwqW7I3yuFtt7P@vger.kernel.org, AJvYcCXHAyytLwojO+3Json3e8omuUQQHu0bLdJsUjTkolb35JdIEQJIiKuqFFdJd4PB53n0Gt8HH5UygX6F@vger.kernel.org, AJvYcCXaoJxPErXINFowNzzGUJ/YhxwRDQp5G68G4aCbrSZVC/ZvrtBbG7AoX8EOOHOxRnia8qk3ueL+F23q@vger.kernel.org
X-Gm-Message-State: AOJu0YxWx+cKSHAYTbZ55jrcYIBgxCqZLZVh9Ubb1ArDnBqlLKzxVrby
	RTHw/nr7JCf+icy85/1OVYLZa5v0f3KQ6geDhjo2nBbb/cJPuGWU/c838NtMT6/VFfebndPk0mh
	Wh5EP5QvAZ2qb3eI0zlRi8oKXtNLrUWY=
X-Google-Smtp-Source: AGHT+IEIh2Y2iEO3tXNHC7HM+PlYLaAXm8l1cDxbiNKi0KZvFHvRoDKg/HYOkhPh+/Bmv0PvXfLkca0NpaxPczmXBec=
X-Received: by 2002:a05:6820:4c15:b0:611:436e:6125 with SMTP id
 006d021491bc7-6115ba9f7e0mr9677595eaf.8.1750760314528; Tue, 24 Jun 2025
 03:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>
 <20250624054508.GA2824380@black.fi.intel.com> <aFpRZoIkQod6g2Dm@smile.fi.intel.com>
 <20250624072559.GB2824380@black.fi.intel.com> <aFpVX05xv4j4uRiP@smile.fi.intel.com>
In-Reply-To: <aFpVX05xv4j4uRiP@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 24 Jun 2025 12:18:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hB1dJ-wb1_Wn0yrf0JVfpqR9cZ7xBmjKM2kB1Q=FF=yQ@mail.gmail.com>
X-Gm-Features: AX0GCFs0rNMkdD0FilJdLCpCHUogQmNzb_LB7O_ww2NRqqMalChIRMIUPdLvN00
Message-ID: <CAJZ5v0hB1dJ-wb1_Wn0yrf0JVfpqR9cZ7xBmjKM2kB1Q=FF=yQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: acpi: Replace custom code with device_match_acpi_handle()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Randolph Ha <rha051117@gmail.com>, 
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mika Westerberg <westeri@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 9:38=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 24, 2025 at 10:25:59AM +0300, Mika Westerberg wrote:
> > On Tue, Jun 24, 2025 at 10:19:02AM +0300, Andy Shevchenko wrote:
> > > On Tue, Jun 24, 2025 at 08:45:08AM +0300, Mika Westerberg wrote:
> > > > On Mon, Jun 23, 2025 at 04:45:21PM +0300, Andy Shevchenko wrote:
> > > > > Since driver core provides a generic device_match_acpi_handle()
> > > > > we may replace the custom code with it.
> > > >
> > > > Well okay but now you replace a simple comparison with a function c=
all. I'm
> > > > fine with the patch but I also don't think this is an improvement ;=
-)
> > >
> > > The improvement is in using standard API for such cases.
> >
> > Well ACPI_HANDLE() and comparing handles is also a "standard API".
>
> In some [rare] cases this might lead to removing acpi.h which is a monste=
ur
> that slows down a build and provokes developer to avoid IWYU principle fr=
om
> enforcement.
>
> > > You may argue on many things that may be open coded in
> > > the kernel while we have helpers (in some cases exported)
> > > functions that are one-liners or so. Note, the helper also
> > > performs an additional check and having an open coded copy
> > > may miss such a change. To me it's an improvement.
> >
> > Which is unnecessary check in this case.
>
> In this perhaps, but my point is that any of such amendments will be appl=
ied in
> one place for all, while open coding prevents this.
>
> > But like I said, no objections. I just don't think this improves anythi=
ng.
>
> I think there is an improvement.

For example, this helps (I think) when someone uses something like LXR
to look for places where a device is matched against a given ACPI
handle, but only as long as device_match_acpi_handle() is used in all
of those places consistently.

