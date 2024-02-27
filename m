Return-Path: <linux-i2c+bounces-2041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B49F86A2AB
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 23:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FBB11C22BF3
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 22:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC445576E;
	Tue, 27 Feb 2024 22:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVkHkY4U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF52F56449;
	Tue, 27 Feb 2024 22:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709073488; cv=none; b=RugHExsgK6STYyQ0wulWff1DTiwUdQBP7UJ83Pz/YSCXFjM8oLOJOhs+81AABxuBJafe/8lrO5WXWEKnQNirH1Z9GcDrTQE3Sf4RjbIblYL4UKHNvBHnsLknmIPlmbFvLAypSPC39F53I4s52fKORUu2NWgg1ZH9fR5YNdZQAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709073488; c=relaxed/simple;
	bh=mu6h9vvWY4/hRPWc19p/Du6v/KdKG59t7J/K0sc2jf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7AtPd4xOmwUjSb+FEK4MoU0d70X4TsyqRYjsSA8zOYbB4NSy+9+iNMvA99XwdOWICBN2VY4Be/Mc4a3nmVdQl8QGP2qXLGFfpfp7gk0QXQSPPLTCJ09cFnSP2L6WeIU1FK+ZCeOTGRWlhH3YUZZSE/gykg4ws+zejAi2ZqSNIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVkHkY4U; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3e85a76fa8so468099966b.1;
        Tue, 27 Feb 2024 14:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709073485; x=1709678285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mu6h9vvWY4/hRPWc19p/Du6v/KdKG59t7J/K0sc2jf4=;
        b=jVkHkY4UgL2hAjJXy3c6dCejxRQ9oB1PF/zdIckw+VhI22DBd9vTJYMOFBKPKpA8kA
         IZnZeswyxIxZb3MrXalkd369JybJW71BNGzpJXQ0/3d3WWFjCXEz2fxA8A8C6CMm41SH
         HZGepbFiYeVSqeRIST2eG8jbxETzbk9Aa+C9A57nXWFQWlxwz3vvR6VsmNxaYjpbToFH
         trLvT71Bz8OfrLdWQkTAOK9Dif1k220mztFLkAPOq1XaoK1pyKbkvkHdP1afFkXeyht8
         6F1C4Yv1H+rkNouKgzqDvGS5i0XEZQ2WMBhanoSbs5s3V5/ERQP5A5/nNxd4PnjgeZxa
         feYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709073485; x=1709678285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu6h9vvWY4/hRPWc19p/Du6v/KdKG59t7J/K0sc2jf4=;
        b=whB4ZDAoAvWJfQdKddPAsmNS+hkUML+elQm+otYmq8uq6M0TBeRhBAyRFBOvBPU/LJ
         JJdXcMOm2RW1fF9+mq873f+NYVmINDt2fwIvQwc4LArF6N9N0agppTl+YwrchkmIVXa0
         vUEpJoKeA0O6ees2hGKsUGTPy12+7uTZDrUFXeapcIoBvpOd6NSMy8/spMQQYPowmNS4
         8Lv1dqmItHCwkjRrk/NANkRd461+cdpnSVQlw3uB3loYgwYVIb4obdRzgdw1SBUdzB2d
         mWLrpv3i0BjTais6HzSraHjOVDLMR6DtXF2+MBhwR7G9FLawNDUkhWleSbXTYd21T7m+
         5qig==
X-Forwarded-Encrypted: i=1; AJvYcCWFBvwlh6HKlj07VYNlyA6ALBQPgeiXqcjxsU7kwLFQv3H1yeQIE1LdZ5nZ/QA40lczConD7Onp7HizgjUG7IZikgkhIlCAGSg3bE/1C4N/ZLjZXDsVvm2HV4sX3CAdHleX2B/gS7He5+YA2tx12Q==
X-Gm-Message-State: AOJu0YylNB8YwEIyyhQcez2zzqKjC+Q3Lju0FPO87J4DDtzTgn1y+WVz
	zdZsNUn06eNEt6N3yvXJ2EtgQ/O12JWh8785D/aWkIYM58r0VJXIrl5qgepLpxjJhX8uPa8mRP0
	vnGGbUqaVE1xAonN5HfNb6y9VHSY=
X-Google-Smtp-Source: AGHT+IFMB+lie0FcgAouDa6HZbHwWiVzW7b+SeqikqXKytkx/KVK+dT1xGs5TasEAkcLFFghhAapDyLfl4nx4GIp1iE=
X-Received: by 2002:a17:906:68c6:b0:a41:392d:e11c with SMTP id
 y6-20020a17090668c600b00a41392de11cmr7933034ejr.26.1709073485078; Tue, 27 Feb
 2024 14:38:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106160935.45487-1-hdegoede@redhat.com> <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali> <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com> <ZdNBGSJ28AcdpC7f@smile.fi.intel.com>
 <20240227210429.l5o52wuexqqmrpol@pali> <CAHp75VeGaKws35x4u-mrmWP2Rd55T6VcR9OjNfh+PsF_M9GR-g@mail.gmail.com>
 <20240227215000.gbmn4n2uzd3hyk3b@pali>
In-Reply-To: <20240227215000.gbmn4n2uzd3hyk3b@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Feb 2024 00:37:28 +0200
Message-ID: <CAHp75Ve5S3S0MPuW1v8q3Dx8sbDZH_LCT8a_p7hwojF2aKS8CQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Jean Delvare <jdelvare@suse.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Andi Shyti <andi.shyti@kernel.org>, 
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>, 
	Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:50=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
> On Tuesday 27 February 2024 23:19:19 Andy Shevchenko wrote:
> > On Tue, Feb 27, 2024 at 11:04=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.o=
rg> wrote:

...

> > I'm wondering why we need all this. We have notifiers when a device is
> > added / removed. We can provide a board_info for the device and attach
> > it to the proper adapter, no?
>
> I do not know how flexible are notifiers. Can notifier call our callback
> when new "struct i2c_adapter *adapter" was instanced?

You can follow notifications of *an* I2C adapter being added /
removed. With that, you can filter which one is that. Based on that
you may attach a saved (at __init as you talked about in the reply to
Hans) board_info with all necessary information.

Something like this (combined)
https://elixir.bootlin.com/linux/latest/source/drivers/ptp/ptp_ocp.c#L4515
https://elixir.bootlin.com/linux/latest/source/drivers/input/mouse/psmouse-=
smbus.c#L194

> > > With this simple change all dell smo8800 code would be in its subdir
> > > drivers/platform/x86/dell/ and i2c-i801.c would get rid of smo code.
> > >
> > > This approach does not change any functionality, so should be absolut=
ely
> > > safe.
> > >
> > > Future changes will be done only in drivers/platform/x86/dell/ subdir=
,
> > > touching i801 would not be needed at all.
> >
> > Still these exported functions are not the best solution we can do,
> > right? We should be able to decouple them without need for the custom
> > APIs.
>
> Well, what I described here is a simple change which get rid of the one
> problem: i2c-i801.c contains SMO88xx related code and changing SMO88xx
> logic (like adding a new device id) requires touching unrelated
> i2c-i801.c source file.

`get rid of one problem` --> `replace one by another (but maybe less
critical, dunno) problem`. The new one is the spread of custom APIs
for a single user, which also requires an additional, shared header
file and all hell with the Kconfig dependencies.

> I like small changes which can be easily reviewed and address one
> problem. Step by step. That is why I proposed it here.
>
> For decoupling it is needed to get newly instanced adapter (if the
> mentioned notifier is able to tell this information) and also it is
> needed to check if the adapter is the i801.

Yes.


--=20
With Best Regards,
Andy Shevchenko

