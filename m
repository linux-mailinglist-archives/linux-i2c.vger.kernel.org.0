Return-Path: <linux-i2c+bounces-7459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D99A2043
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 12:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AC581F232F9
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 10:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4700E1D89E2;
	Thu, 17 Oct 2024 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZSozq5F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC713B298;
	Thu, 17 Oct 2024 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729161983; cv=none; b=XhaQpRkOt+VmxNqwOqI5Jms1Yctn5KnFfOMnVU3lAR3bqqmuIIMAO5HsJHblS+LdiCb+bTAxl/DMR0zayC71K2ajHOM+5LrM2kuYf1nDbmwsd2r80tGQ5QtQyl58b2B4gGeR8H59vNgGk2pGLiG1WepEGPL1i8eXxCQNaXp18bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729161983; c=relaxed/simple;
	bh=bZPJ2TQJRvI/rTDGuSdNPro0wJfhREl8Me3tovFDsFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VM5lBK7Slhlfv7TfUJVXJ6es8GeKlZiF7JYWMudloQqg/sOR3CvLSpjfpAjv+UlIUtmr6T7taXFACWGh94Nl8is4UuILuBpXmoAFckYiuJF50YcyrP9ymoa2fdopEAkIfLdV0VsKHRy9u/DTKfNN0eoBl7/QKxZ2+7feNMbNF+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZSozq5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922F4C4AF0B;
	Thu, 17 Oct 2024 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729161982;
	bh=bZPJ2TQJRvI/rTDGuSdNPro0wJfhREl8Me3tovFDsFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SZSozq5FFmsYUsiJgVzrmKBjQwG2mevKywTkAiBLpLMt5CP7iuG15LYT4IiI4RKQZ
	 EODlY7Km7nC300OQ75iiOEtNjcsXMkyOP1toWIj7TNlqJasQCZv48eRepUBlLf45Bi
	 6xB1TNmX/hunVaYZ+N2VoeIsBCD6c1mwTBFIXh2uR97u5RW8WNpLtsjszc3YC9P64y
	 TJsspyEuhcijN7IO763J/0lEvXcMC9/f7vc1YUAhGXfDyyAD+MlDhWg1hkfj/hEH25
	 Bmaji9lZydR4yR+yF8PfeLmEw9XywnfyDOTgAdH65o0caGbpWyLsbE/D8+/po+7jq9
	 k/Vjoa5eASVFg==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71806621d42so349202a34.3;
        Thu, 17 Oct 2024 03:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvvUGN+gD4xHnBDlEKYDHEtQZL4gMVWN0KO1kYDOSF990Z5J9Lx0FWI6V29EwZIuDAFM2CV161MWhd@vger.kernel.org, AJvYcCXc9IHoU5DIXEz0J1QB+hrIA/DbAncv1MHmGKW5iKoWksWxv7/FAfjEdhIsJEGf1umlfax75/W3tV9p@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSgEPZq8omMvDD1RKwKp2m1PGO8/+cTOCVCgmwoxacLTajgRd
	YAmVVDn6ppZNe8eqE3Cu09GV6HASVzcZc/Vi5l2z+foS7mlo/We+l+L/Gf6MgPnvx7/J2p41BL9
	MMPEU/bVv3FZJMxgJxgueIXGHCO0=
X-Google-Smtp-Source: AGHT+IGCmePH43EfNjSP4w7Mf8Q9b2+QIP+RRkowv9s+4lEBMM9YbAQObdd9N2R0b3CxjlHwnDqQejKAevdid/YSVek=
X-Received: by 2002:a05:6871:e49:b0:288:a953:a5c7 with SMTP id
 586e51a60fabf-288a954e365mr8688345fac.14.1729161981927; Thu, 17 Oct 2024
 03:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926024026.2539-1-hunter.yu@hj-micro.com> <20240926024026.2539-2-hunter.yu@hj-micro.com>
 <pmbvhdaz4qt57gxemuxoyb6xjrcmvusm2jzl5ps3o5ga52edo5@qabu6rcbdipp>
 <CAJZ5v0gSyMYerPqH9LOA77EWdBEOL7kHrc1+P1R=8Epn77gfNw@mail.gmail.com>
 <ZxDYOrAJEddtPrWv@smile.fi.intel.com> <ZxDY1ljxXkO7pFnl@smile.fi.intel.com>
In-Reply-To: <ZxDY1ljxXkO7pFnl@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 17 Oct 2024 12:46:09 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hOzgazA0GQzRkGuzH9k3mrckvMeLBencQrMob_+o4FXQ@mail.gmail.com>
Message-ID: <CAJZ5v0hOzgazA0GQzRkGuzH9k3mrckvMeLBencQrMob_+o4FXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C controller
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"hunter.yu" <hunter.yu@hj-micro.com>, jarkko.nikula@linux.intel.com, lenb@kernel.org, 
	jsd@semihalf.com, linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	andy.xu@hj-micro.com, peter.du@hj-micro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 11:29=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 17, 2024 at 12:26:18PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 16, 2024 at 10:45:26PM +0200, Rafael J. Wysocki wrote:
> > > On Thu, Oct 3, 2024 at 12:13=E2=80=AFAM Andi Shyti <andi.shyti@kernel=
.org> wrote:
> > > > On Thu, Sep 26, 2024 at 10:40:05AM GMT, hunter.yu wrote:
> > > > > I2C clock frequency for HJMC01 is 200M, define a new ACPI
> > > > > HID for it.
> > > > >
> > > > > Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
> > > >
> > > > Do you want your name to be hunter.yu or Hunter Yu? I prefer the
> > > > second and if you browse the git log, you can see that everyone
> > > > uses Name Surname.
> > >
> > > It must be a real name as per submitting-patches.rst
> >
> > Hasn't this been relaxed last year by the d4563201f33a ("Documentation:
> > simplify and clarify DCO contribution example language")?
>
> Note, I do not imply that the existing variant in this patch is ideal, I =
also,
> as Andi, prefer the proper spellings on the "name" parts.

Good.

Now, the way I understand the "known identity" part of the document is
that a misspelled name is not sufficient.

