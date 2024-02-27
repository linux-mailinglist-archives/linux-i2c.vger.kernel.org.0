Return-Path: <linux-i2c+bounces-2038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB9986A178
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 22:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 472DA1F2363B
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 21:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DA8145356;
	Tue, 27 Feb 2024 21:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ca1slFG2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196A51C4C;
	Tue, 27 Feb 2024 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709068798; cv=none; b=joejc8ULPvH7+u0wDdyR7gPpgPJEbo4jR2F5wBP9CDpBMqZtOYKeSomMYfsuXLwitIUkj437SUvX2ipPB9WmhLS2qYP+g8FQ2vIOo/Kd/8jvMUR7Tz3Wm8AF1BdtjDI3IvmwgcxON6Z0HXQg+E+yZmOeCtwMKlBkHCCKO4x02q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709068798; c=relaxed/simple;
	bh=I3l70nMYrxti8un5GaS105aRtBECnSBbd2+3S2L+zm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/m23RFR5fgRsaX2KmVu1UAhzKyZLsKjW6Y2rfxL1J2nffmDvLnP4wXyL1rB1ylf7ZiVtXRl1lMfU5HcML4quVymJbHka5NxOm0oiQIfkwkkpiGPds2fnly5x8gZSEDMtZNXtixEsByMiPLp4m1N/RLW7FtaQ8XoqI1H1zfa5Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ca1slFG2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3e72ec566aso619292866b.2;
        Tue, 27 Feb 2024 13:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709068796; x=1709673596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++o2goUjLYdG1jqeRwvFS49mabxlnTgW6Y5NANhArPY=;
        b=Ca1slFG2wZCYjBPmBUDEqyYSYhWXHgxTkBuhnBQ6Hkt4XDfLtsA5pQG7zP9JW2kz1g
         PuGsCXMmop92WN5OHnTSdfCC77EMIk1wv3e0bKPLjAOYlYwoK45Ir02WChBEOkX4CMKc
         jOrXrSNoxky7dfe5+7TwPecHZqrqfFOch5v9atiF1TXIDo+R7KXiVkTQePBMF5TpuX7U
         4Tml+n+UHa6V5BctWPd+oeeAH35D5f8c8xKRPGSyKCnFkAUz7vKzQaEdxacVEYX9Hhec
         q9FEFYrEhwJQ/Q10B6frM076CYBjH6fbJM9jhfWgUURrg4uFUZFGVoucCawTsh1OeRXC
         Fx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709068796; x=1709673596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++o2goUjLYdG1jqeRwvFS49mabxlnTgW6Y5NANhArPY=;
        b=I7794JspGboxYK0M79BQLs8MFL685kCuDk0Gd9LpUkdMs+AIOxGqD6zMA1K6+mlel1
         dkNlJmiGzQU59Yn2li0FYF+4p4XkK5Mt2EF0OVP/mGSB2WUQQJPpe3+HQfUXrUlYv/6h
         emocC1kc3kch2oh6uU5GF1HiGiCztXCGQY5UnnuiPPUXadzwHfZC21600txbiGQ1eRyL
         gnd4rq4v1G8MqcICaK7cio0b4OYqE33Vecqmp8uppKO23GYwDl8sRHkOWtwKtmjuRUoS
         vLK55stKO0hGcydw8itlvFeKyv4UDCtUVrBLyiaR0ONbv5C2VH5JSW+wK471wTboSW/A
         izJg==
X-Forwarded-Encrypted: i=1; AJvYcCVbGVi0DGPvkt+UTDaTuShZuqUKdozXdmkgZEm8qU24nSeK3rsjve4DM1tL3P1s+Sxv1e8E7km8d0LdZeJqjncn/GbyHsq3Y4PMpoFnlIc1eCG95SBcJ/whbCtPJO8aAtqEfEj54WQz8a2i3iAS3A==
X-Gm-Message-State: AOJu0Yw0Q3+8Atx0IQsA3fZ3hxaL4yyC/9vzOBpt26stZPeOW0bsPC0X
	28A/eICl/OtNHlwJawIh5/GvazIsrtim0ORV5RiShNcwXK5CoIOU717ck7xq1v8d4FmvBtYDEc3
	rGWpWkHZ2ePzgUZNgEXJRuf6IDcY=
X-Google-Smtp-Source: AGHT+IEOU9x0Bvsy/Uzk67aRklmNev+HiB9PegIQWNyMx1LzxN6MM1GgQk4ghBtErcN98LvPeojVxe8VkzGyt7emt4g=
X-Received: by 2002:a17:906:168d:b0:a3d:bb68:be30 with SMTP id
 s13-20020a170906168d00b00a3dbb68be30mr8239616ejd.6.1709068795654; Tue, 27 Feb
 2024 13:19:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106160935.45487-1-hdegoede@redhat.com> <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali> <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com> <ZdNBGSJ28AcdpC7f@smile.fi.intel.com>
 <20240227210429.l5o52wuexqqmrpol@pali>
In-Reply-To: <20240227210429.l5o52wuexqqmrpol@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 27 Feb 2024 23:19:19 +0200
Message-ID: <CAHp75VeGaKws35x4u-mrmWP2Rd55T6VcR9OjNfh+PsF_M9GR-g@mail.gmail.com>
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

On Tue, Feb 27, 2024 at 11:04=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
> On Monday 19 February 2024 13:52:57 Andy Shevchenko wrote:
> > On Sat, Feb 17, 2024 at 11:33:21AM +0100, Hans de Goede wrote:
> > > On 2/13/24 17:30, Jean Delvare wrote:
> > > > On Sun, 7 Jan 2024 18:10:55 +0100, Pali Roh=C3=A1r wrote:
> > > >> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
> >
> > FWIW, I agree with Hans on the location of the HW quirks.
> > If there is a possible way to make the actual driver cleaner
> > and collect quirks somewhere else, I'm full support for that.
>
> Location of the quirks can be moved outside of the i2c-i801.c source
> code relatively easily without need to change the way how parent--child
> relationship currently works.
>
> Relevant functions is_dell_system_with_lis3lv02d() and
> register_dell_lis3lv02d_i2c_device() does not use internals of
> i2c-i801 and could be moved into new file, lets say
> drivers/platform/x86/dell/dell-smo8800-plat.c
> Put this file under a new hidden "bool" config option which is auto
> enabled when CONFIG_DELL_SMO8800 is used.
>
> i2c-i801.c currently has code:
>
>         if (is_dell_system_with_lis3lv02d())
>                 register_dell_lis3lv02d_i2c_device(priv);
>
> This can be put into a new exported function, e.g.
> void dell_smo8800_scan_i2c(struct i2c_adapter *adapter);
> And i2c-i801.c would call it instead.
>
> register_dell_lis3lv02d_i2c_device just needs "adapter", it does not
> need whole i801 priv struct.

I'm wondering why we need all this. We have notifiers when a device is
added / removed. We can provide a board_info for the device and attach
it to the proper adapter, no?

> With this simple change all dell smo8800 code would be in its subdir
> drivers/platform/x86/dell/ and i2c-i801.c would get rid of smo code.
>
> This approach does not change any functionality, so should be absolutely
> safe.
>
> Future changes will be done only in drivers/platform/x86/dell/ subdir,
> touching i801 would not be needed at all.

Still these exported functions are not the best solution we can do,
right? We should be able to decouple them without need for the custom
APIs.

--=20
With Best Regards,
Andy Shevchenko

