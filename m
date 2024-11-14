Return-Path: <linux-i2c+bounces-7998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CDE9C9393
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 21:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C18283931
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 20:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0267D1AD9F9;
	Thu, 14 Nov 2024 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaKnXGRu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567861AD418;
	Thu, 14 Nov 2024 20:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731617827; cv=none; b=fXGFFuG4viu/P2I1vVWDFNzBf0umqH7lQ1vGn+LcsZJCp88l3Rw9EBZgmN+R83PUy7iw7cXfprNHUmfSXVwDAI7CU5cNEzJq2o4x+4lOpWIeFexQLpeyhpCj+vBYfWWJQBDYFFK3MX+zlcHO6zbtGzrvua3iNT7PekTI6qVm3B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731617827; c=relaxed/simple;
	bh=cMSzEEGbbZ4oo+8FdJ4pjPFmzqLuuWLWDFqIkGdHYl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlzsfJNLRC4viVxivpZSn4z77/Ym21wbL1WTP9goZciroDhVf/VC0sv9k9kLKqBKb6NDx+OFb5hzjdwlWWzT+DhAGtMlamkjz9M3Cser/OZx0W1CuKP1qzMDnGUTfY63AissKVh8F+aD012kMjZTprwO/5zjRk/U3HqqWJLek8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaKnXGRu; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-462d8b29c14so6607221cf.1;
        Thu, 14 Nov 2024 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731617825; x=1732222625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FENYyNK4vC//y2A9AUuY/xTIkgQJ19w0WgQKxb08jVc=;
        b=IaKnXGRuyuHd2KkhG2BqSDo5JfJGGiLu/HUUM+bwmWIb/vOhnrtsL9xnG04XczwmzW
         dR5Ml+g9gbK47dtbVVFfiJisRWEyu40vYgysw3/nyxK6B3VSj1cC+UxiKL3M7myhk+KB
         v8X26BpSwF8oUBHQ+qJzPRLUg0vhwvNzcxDebD7v5p+h3fB88+oUJaH+De30UfBxa+6X
         eXlU2c/VQZby7Rb2bm0MEY3x7X4I7hDhRVwD1Tv7b1Xkm6Ldbf4Yw7jpicHRrMbEeYZD
         6ubLuBGGR06sJrkUhTtZHjzDsK2xb+WixuWxQfwGOxEOicT9EWwKoo+q9u5RUIYjXM8O
         SUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731617825; x=1732222625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FENYyNK4vC//y2A9AUuY/xTIkgQJ19w0WgQKxb08jVc=;
        b=B1wOneKK7U1ZNFeU98/Ay60adVZnoGxT8aYViP7nh+ftmcqG428kAeGjkRQ7FV02T6
         mprFcSDI01WgfPWxuQ/wRDT3RWxIZFtKBLFiTyvtJvn1/y1BqQR0QdJeYMjqj/zTD1v5
         pHuvGDhFa6aWtbNCeJM48qT7+DlGxQpXfeQ23wodFuj6NNX0eKJ8JlSSj/jPcJcqqsSt
         i+NXUhqk7Ss67QIKXYMMjpTQvx+aa62FjfhOt+NEBdO+ojvZBU4a8S8XmOUo33wNgUV6
         evN1pHjIJUidIZEsLkK3KrtzTZU2LNucRNBt5gmeGI+GHQFMctJQokjZkQCTlYlPz5/h
         s2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUjTqssJQDcASeLOqXuSS2zmiPOhFJr6HiBP+5qR5V3Dmat3vdlzdQcXBTSIuvnjnZ5vTUfwOPHFew=@vger.kernel.org, AJvYcCVjimyv7kbMss4LYsLIxoJFaNojzVjjraYqhN+zJohtBSLcyXQ6mjq4YyBWaw/SPgjK10eYoh44Ke/z0HcS@vger.kernel.org
X-Gm-Message-State: AOJu0YwUJMR3jBLuzTmclY1PluzEweQiqusP1b+RUnjY6mWWv4g6+O2H
	t33/WXiI0SNq7ngjgpYmrZY6uuKAEnDE5yzgQgVLp5GlSaISSUhexCv4hsFEwUg9Dw9mozb1xoP
	N2k2P4jjG6vbuo4fE6N5bzV61JB0=
X-Google-Smtp-Source: AGHT+IGIofF+jHyf1Q1A5YmkDMwujZlkcq6NnhCTWVq9V58kJK2WdBuo4vqtDJAoF6p75Moc+Y23OIWYQYIEYzK+XIc=
X-Received: by 2002:a05:622a:1c06:b0:461:2150:d59f with SMTP id
 d75a77b69052e-46363debe66mr3045871cf.8.1731617825253; Thu, 14 Nov 2024
 12:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
 <20241107211428.32273-3-jiashengjiangcool@gmail.com> <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
In-Reply-To: <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Thu, 14 Nov 2024 15:56:54 -0500
Message-ID: <CANeGvZVibHOsqdD+zw_u2yswJdvUu=Ssep9eWeAOcqmg6J-zqg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: dianders@chromium.org, rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, 
	david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, wsa@kernel.org, 
	manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 5:24=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Jiasheng,
>
> On Thu, Nov 07, 2024 at 09:14:28PM +0000, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() in order to catch the
> > potential exception. Moreover, convert the return type of
>
> It's more an "unlikely exception" rather than a "potential
> exeption".
>
> > rk3x_i2c_adapt_div() into int and add the check.
>
> ...
>
> >  static u32 rk3x_i2c_func(struct i2c_adapter *adap)
> > @@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device=
 *pdev)
> >       }
> >
> >       clk_rate =3D clk_get_rate(i2c->clk);
> > -     rk3x_i2c_adapt_div(i2c, clk_rate);
> > +     ret =3D rk3x_i2c_adapt_div(i2c, clk_rate);
> >       clk_disable(i2c->clk);
>
> you can't disable a clock that has failed to enable, right?
>
> BTW, although I like this patch (or at least I don't dislike), I
> still want to check whether it's wanted or not.
>
> Andi
>

Thank you for your advice. I have carefully reviewed the patch.
There are two clocks: "i2c->clk" and "i2c->pclk".
The "i2c->clk" is enabled and disabled in rk3x_i2c_probe(),
while the "i2c->pclk" is managed within rk3x_i2c_adapt_div().
Thus, the "i2c->clk" has already been enabled at this point.

-Jiasheng


> >
> > +     if (ret)
> > +             goto err_clk_notifier;
> > +
> >       ret =3D i2c_add_adapter(&i2c->adap);
> >       if (ret < 0)
> >               goto err_clk_notifier;
> > --
> > 2.25.1
> >

