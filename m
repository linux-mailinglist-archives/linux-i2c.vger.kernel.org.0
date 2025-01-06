Return-Path: <linux-i2c+bounces-8927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6441A022F9
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 11:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1421635AF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E3B1D9A76;
	Mon,  6 Jan 2025 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XhTJ6zPa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909A01DB540
	for <linux-i2c@vger.kernel.org>; Mon,  6 Jan 2025 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736159499; cv=none; b=FMdRDys0oNnYqGQSZIfUVu1CS9K/0vxA1c8YDXFqX+Up/pUWs1A49cXnnKijqQoRnMmDqU0LoIrAn1Ewp13ryfjqeVud3LA1FltnOtocfiw4IQD+I6jl/faw3GMPnWEfbZaLC6xZHmv11/XsEpv9P6NMlpVMRy5ZNtFjqs0NV0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736159499; c=relaxed/simple;
	bh=hNHQY6hbUh82jZV4XF67JxgFkShGL8GqnQh2CtEYaBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqZ94zHNwny2mlXSrG3Kn5+eexGrfYnodzt6UwCihuiyYBPsoQu55iFLA1FZW8t+/K4RU6uLZiUtAV8vvDqNB+N1FVU6fAemBczd632bVGY+a8j8PveVqdNMucd2Iqqr3tx/D4SI5GNSr08GkbilO2PwCYPxjJC6SfAUQDd1KEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XhTJ6zPa; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso150616091fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jan 2025 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736159495; x=1736764295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XankIvDMHUqYhqUmdSBV0fOsVivenUwuoWrt76c4yck=;
        b=XhTJ6zPatBgXX7jUvLxiaGG+jcFh2pHoyDOpnDINIyJUIj6oyBIAu0UMuaedtOrQUq
         dWcYpjRjS/QEasu0c7POtGzrWLFa+wQK2Pk+wP0RbsOo0IiIZY9OUqeEmr3IaPKkEjqU
         pVxLTzMwPLIw3/ZiZ7oEMOv7xKyZvcF0P3OWN8LkreAOxGFXNkqfafz5loUxrrBCH2iI
         ZQJ0Zi/OraEb86NL2oT17bPMkZRJDxdS4dJ9QIQjdkSQtYgGgFnH7d0aF3H4/ttyEZ+i
         m6FQNf95fNYl4IbQQcVcMglaXve8PJCB8KhSd2iHQuAbKa8YE8Bi4/QsoVAtUOfnAdE8
         KhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736159495; x=1736764295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XankIvDMHUqYhqUmdSBV0fOsVivenUwuoWrt76c4yck=;
        b=JhymW8a1XWd672lNiY3naE9hoOLIS3pDB86CLOEi3Qg3axo4cUorvC1Ys11EO0rhFx
         risV6187wjpNDOKAu8X8H1/1vhFMGK8MphDio1Hx9ATXVAmhXI9HshdI6CqxS5HLPIYO
         x52kadmpWM8GhyRZGub5sd1qP/9/xKx8OHBdPZZOSeE2veFfDKf9PY4hSnkxO8sg04Vq
         s5bdctzCTRIPtptznVHVfhrowmrhK0ALFcPCmhctS2pNHhnxttoicKIkdgjJn+eUphzH
         uSSKMMvzl3kuBCbql0rm+mdESdOyIMlNY3Vi5v/MlaNMBwF4ThnnWwPKeR8TtkrxeIMC
         WxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUntPYPBe6VRzxQQWkAwbtaAHi37Y/ak1/SmRcES98HN5g2hE+lg9pUaNKMMXeV1LMfI1S+2YbbnR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Qyg6vqPK4DF5KQazGpg1MmdprlEv8Z97ZZp9Jlu3A6nhlshX
	/sRtomNei+9fQyQ8p252FyHRlptqYgIrd8zOl2EFHd5vRC1YHlps/mey0ka2MD9i7+R+XKZuf+G
	TRx8cfVSzO1I93OlBuZ2cxhg/BwuhjJ/PzzJPkzaAh44LK1tw
X-Gm-Gg: ASbGncu3Dev+/oVOD3Vsp2aHHPPE5j9EIqRk7Ys352E5dnN1O8uFRr3CHNvUh+vO+ER
	6FBAeVOv05w4cn9rz8OqpD969gqOliklsKLGa8fASXZnQM/8t8pFtikw/d+l1VN6pnLA=
X-Google-Smtp-Source: AGHT+IEiDRVszLPNSWReELs+FvHEEQT4b591zdm5BwFAgIooM/r46g0uSJ600ZcQi8LjZ7XFbgcpfge5W6rypOCrkew=
X-Received: by 2002:a05:6512:3d1f:b0:53e:3a94:c2bc with SMTP id
 2adb3069b0e04-5422953305fmr17304530e87.18.1736159494514; Mon, 06 Jan 2025
 02:31:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211102337.37956-1-brgl@bgdev.pl> <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
 <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com> <fxj2tqrjfr23cxqmtmpj74bombtfjn3qtpz5iiegvhbap7v5md@pkmrskwamatl>
In-Reply-To: <fxj2tqrjfr23cxqmtmpj74bombtfjn3qtpz5iiegvhbap7v5md@pkmrskwamatl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Jan 2025 11:31:23 +0100
Message-ID: <CAMRc=MfRq9xU7a64qCOrDCYgSbeWVKF=PnzS8Cabm5a3zzFekQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 1:02=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> > > > -
> > > > -/* default platform data to use if not supplied in the platform_de=
vice */
> > > > -static struct davinci_i2c_platform_data davinci_i2c_platform_data_=
default =3D {
> > > > -     .bus_freq       =3D 100,
> > > > -     .bus_delay      =3D 0,
> > >
> > > what happened to bus_delay?
> > >
> >
> > bus_delay is not set by means other than platform data and it defaults
> > to 0 so it's safe to just remove it.
>
> yes, but how is it related to this patch? Can we put it on a
> different patch?
>

No, why? This patch removes platform data and all bits and pieces
associated with it. Splitting it into two just to first remove
bus_delay and then the rest doesn't make much sense IMO. The argument
that it's already not used would be incorrect as it IS used by
platform data (even though it itself is no longer defined anywhere).
I'd keep it as is.

Bart

