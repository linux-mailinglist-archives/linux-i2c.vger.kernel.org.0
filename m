Return-Path: <linux-i2c+bounces-6620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE1976C56
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 16:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A99F5285AC3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 14:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F3A1B4C26;
	Thu, 12 Sep 2024 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caoD8z4U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B51C1B29D8;
	Thu, 12 Sep 2024 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152159; cv=none; b=cXvEgqea1Bole+XcAJjBd+r7qo3erH6l9h9o2GMl//JDv8693MbWY5MWuY4VyT7sNGAlMPtTqhJMdY8hG6/uQhVE+ZTwX16HdVSwFCYdK18xOHyAcZzzmSi7TpjuevTphFnBiEboqWG39L3EuSmz9OyzVJAAINQbn0cSiNKo37I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152159; c=relaxed/simple;
	bh=91sx6RJPRKi/SF2wNV/FtFMeGIDPbpp1+rwQhhnZcWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMcGHxmQVh1m/2hgC6jY4MdZQpG04C/1BMkl3o8t17g/t834fZXm2deHcr8IpeLw+xqIZIoXqhwXUG70Lp2gIk7UYhgDu4ypthGV026ErtUa8N+4pb8e1d2GYv/zSXzX7v8cd1ZKvLxB6FLAwLhLuG0iGeE6FBPUg00sFnirbmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caoD8z4U; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f753375394so10864531fa.0;
        Thu, 12 Sep 2024 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726152156; x=1726756956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG3G/xLcDil7XGiRva1vgweHYXBREJkLBp9yBjpfHAc=;
        b=caoD8z4Uh4EDnhyAEtd3UnCO6T8s0lpgYWKfPlBN0QBQxvD1r8F/dzeNFxyH696t1+
         MSOrcgx3DocXDapuRE0+s7UFg5lKz0YlhkBLxYyw4xHS5/xtm2zoixwSmd/hnwHUw9lw
         sBfiP/yAhKf8wT8QybtLlf9ZxT9FklsmUxnLYh6WwV8sc+AfPcyckqvAaEMACBQ90EUi
         aOFSHwHHi9pegylf6nVR4wLhAEH+fZYCoiX90o7TwsHUdVuvtVDWJVpteMUsyvOpP5Lx
         El4DUtizjnSbNOH4cd/Xkdf6w53xYOHPL+mm+kHa8Pu9x1C7BXsd5YQwwkhaUnlKpunD
         21+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152156; x=1726756956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG3G/xLcDil7XGiRva1vgweHYXBREJkLBp9yBjpfHAc=;
        b=bvodwjXqbYkmw9KlK0I/BaAtQ78OLTPQoBMRzvCjh0w0/73CvJzw782qSwAGJb3uj5
         G1rdRCAvAqd/YekWTQ86IE2Vb1Dw4RqIHwxBuu5Mr2abVLxSZVhu5uipZveNjEbeqYi8
         DmMwp+WrlWEa9UJU/naPc+jF3W0j9QLKrzhaS5mMHqpr1DYmVyp/xH4330qXyoDQwxQ/
         r1ZQ1jBwc3Kfbf5TDAFpgyDj2vdqOSH1SidqeRhU/XHNfW+d8WpfE9LdJPIKv2cDM5j5
         fBC5OKnypBUIl1YUdrgGGIBj62N0CDJRNENzq9tA3m049K9P46HX65VfKSlbpMF8LlMX
         VFMw==
X-Forwarded-Encrypted: i=1; AJvYcCUPPs9Q4kaCrLBDijJ0fnmBQdJJ5sFm9PZfuJEa5RUvT+TFH92dh9AinwdlMn5VXcLBenfuFeeuORyA@vger.kernel.org, AJvYcCV4kKnyME+/3RCaEckx8dEa1Lf/3jJqKelECQtwcm+1rsrjunqwiP1UK7QuMberOzl7/N97s130HoCv4Buq8nQ=@vger.kernel.org, AJvYcCXXNHPzD4wZ4M+PpvOA2jkL2uuJ41DsSQ/sjdKC+DMpIkAyZXDnI/TVljO1MWzHfyVx51SThRdVVEIw4HL+@vger.kernel.org
X-Gm-Message-State: AOJu0YzlvwNbAzpvKSPye/Iji1EGDwjudtshHhWXb6wF/IWjfYBJdScE
	BUICyugZNiEIjvaa1xg0GKJyMd2OqyWekJDmBsHterTDpQpiIAMMQbTYhREoG4b48NjpOcNszHP
	OAPsz5YaXXlP0sYQR/ywmvQqJ87w=
X-Google-Smtp-Source: AGHT+IGdobJgRH1oCohv5p95eKFDPxU3nMr6+b6rc7idMrPbiLUTkf1xpRJT4kpxo76xtfNW/i/DACn6DwZgd8XJkhM=
X-Received: by 2002:a2e:bc29:0:b0:2f6:9787:5fc0 with SMTP id
 38308e7fff4ca-2f787f4f415mr20374301fa.40.1726152155860; Thu, 12 Sep 2024
 07:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
 <z5qdyk2onwohenaclbflb7jlfn3wadafjpxsxzpvkmax75mpvg@vhhasuuutjzh> <CAMj1kXFH+zB_YuUS+vaEpguhuVGLYbQw55VNDCxnBfSPe6b-nw@mail.gmail.com>
In-Reply-To: <CAMj1kXFH+zB_YuUS+vaEpguhuVGLYbQw55VNDCxnBfSPe6b-nw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Sep 2024 17:41:58 +0300
Message-ID: <CAHp75Ve7ZfiT-apRwSS8Cjh7n4CptC2h8AWxfGh346mNhPL1tg@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Wolfram Sang <wsa@kernel.org>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> On Mon, 6 May 2024 at 11:03, Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Sat, Jan 06, 2024 at 01:48:24PM +0100, Christophe JAILLET wrote:
> > > If an error occurs after the clk_prepare_enable() call, it should be =
undone
> > > by a corresponding clk_disable_unprepare() call, as already done in t=
he
> > > remove() function.
> > >
> > > As devm_clk_get() is used, we can switch to devm_clk_get_enabled() to
> > > handle it automatically and fix the probe.
> > >
> > > Update the remove() function accordingly and remove the now useless
> > > clk_disable_unprepare() call.
> > >
> > > Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C co=
ntroller")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >
> > Applied to i2c/i2c-host-fixes.
> >
>
> These patches should be reverted: ACPI boot on SynQuacer based systems
> now fails with
>
> [    6.206022] synquacer_i2c SCX0003:00: error -ENOENT: failed to get
> and enable clock
> [    6.235762] synquacer_i2c SCX0003:00: probe with driver
> synquacer_i2c failed with error -2
>
> as in this case, there is no clock to enable, and the clock rate is
> specified in the PRP0001 device node.

I have just sent a fix, please test.

--=20
With Best Regards,
Andy Shevchenko

