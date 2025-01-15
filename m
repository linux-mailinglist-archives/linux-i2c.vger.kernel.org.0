Return-Path: <linux-i2c+bounces-9095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C3A11A55
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 08:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E6D916656A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 07:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659B322FAE0;
	Wed, 15 Jan 2025 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhBWUNQO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27BE23243D;
	Wed, 15 Jan 2025 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924718; cv=none; b=icT+ePPv8txNGwPAG+W1Vz4jxh9Pi+Uve5Kyuvu5x1u5UpYjdxJMKtlDJ+HVCyNindwZlFUgDIzVkqEQ3ACWnR7flzXX+Iwcuj+NZ1nTBZwIBy6EQjm+4GLqVZZiPHXmo79YbMIHQC3BLC7wLJOg/sVwcXpWxtNraSw7AT1xwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924718; c=relaxed/simple;
	bh=ESrP+R+vbzb0KV3PE778NNDH+LI5asYGq+gEf/u9+bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhriFju11QHGwh1ui1XEp1vwKYBIOctojKfD35Ul27YTo6yKzGKIDYkHFBP+QFTg1iOQswcWtwusPffjv/237ghZpo+BiXUwpGm09rgOE9nFmiZNIxL57DivwUImEK/iqJxHGWO48J7fEhLtNieGdaUwNO1s8t960XetjqOH8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhBWUNQO; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e54d268bc3dso11347362276.1;
        Tue, 14 Jan 2025 23:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924715; x=1737529515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESrP+R+vbzb0KV3PE778NNDH+LI5asYGq+gEf/u9+bI=;
        b=VhBWUNQO8NHoScnUwS8Uxv3XIZee++JodIxuHyYMBJCZ/2vX/sFLCilMyVjdRk7P4V
         IfQ1wgAeZFMWssR87P5gyADyRYcsAbMKs4De5PeiuXO7orK+c2gb1PToBj9QP4MOnUuT
         Q6EOMH0q+AxQe6vKRblKFDTK622i0olyQBiQt1l+hG9JdcQyGhQI5z5FBrYr/XD7gPrd
         52gbcntrn0m8xLOrZLTRjVNKP08lpCOT5kHrdrRnvSNGnkgFxbD+sEOKu9TUFkIgeyf4
         maSjK1EIeA2+krQjtDKUT1XQxdHpoi/75NI0aTwnaLPJ1i3M+6OhNBS9ii8+H7pq2uJO
         Ph+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924715; x=1737529515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESrP+R+vbzb0KV3PE778NNDH+LI5asYGq+gEf/u9+bI=;
        b=ef4uko9cRRnKqsx85wySy/3CMVTJj10p5yd7jpneH2X4RO5jnlKLXW0ELPUIzBnRM+
         1jhbwag4ugUkPl/BdwKJZTYm9muLJxjvtzapUEKyYuGPbZ8obYFl21t+m1r3/thncavt
         jqexqd+AcbvrSH6JcN9ddRrlf2Ral9MEd+JjezmFlhGlDhp5qv3kj6jtNLIWzzay/W6u
         U3/v3G0I4GODxLrUa49h3SAMS+uahHwNC5vmSrM1xa/nC9Ewz5n5K0dqVNhFX8zX52aI
         oddrrLXDvbAk5ioI9xhiHsnABV+v9jV8zvsyZ4EBE5ZvMF+yyes9yX9Y3Bk5Of1l0S47
         7Ogw==
X-Forwarded-Encrypted: i=1; AJvYcCUyBTqN/gvqabMXTWkQ1fMq4DP88Zex4o7DrYA2eXPmmzZ+U9ux6f8ZHk7AqE6Bui9zIu+rLDiz@vger.kernel.org, AJvYcCVFFAu6SL4S5sKyDwgMtR9mgQnXtAHJhv2uebTHSfFuAfFEAa9KgnqvNWKCHSHaBUvvQkguXWV9DUVZ@vger.kernel.org, AJvYcCVpBfuJDRG+OrKRH2mFc65MNMYdL24R/VuG6UMv+npD7bURF00CfiW1c9hxXm2exfAs57rAATTdrDVM@vger.kernel.org, AJvYcCVx8bwOeSfPVk0KRzmy2d5phchIK7kTkftG9eYj40AOQt2epnWt3U691o7pGk2MD60z4nKmSzPkkaOes1hA6/A=@vger.kernel.org, AJvYcCWEJ4SG0rZ66Kj7TnneXMBG8GuLH/WoQst0Frsc4GdYbv1YyEbvP/qJtde8mKVsHXY1BbkxfwVeoI+fKKc=@vger.kernel.org, AJvYcCWKAEqvDaU5UMWuYohjZ+/422mcNy79BL1x28R0Jr17AdsTZ6prbzEg6OSPOvgK8YHWxjWX4oQS1GJTwsyO@vger.kernel.org, AJvYcCWVY3bmESKINm6soiyX3yQfUdGxYpDwEK7eHRrr5R41HZq68uFS/CESvQtwzZmkwoYiO5KKo0oV1gMc@vger.kernel.org, AJvYcCWe9B7uCpI8uAWqHeqfpyXDCIVAdh+kPI4UvD7YkaJ288VOk2epsAOq4b+F1Vzu6a5zTgpIwfRUXuGILA==@vger.kernel.org, AJvYcCX9FecU/olgUbYyWsXdRnlszy7ltbetqxaDgfu1xZxIF/1EVkjTuHEJqz2JFxryDXjeRHnFBkoZv6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJztWEF56D9aA1or0RBOl804YVRrBE0qu3RUMsYKiqh17tfgc
	i+12gbMfRLNIAqejWqDw5Z/1mtMvYwo1FSZDFqgMTqNgMBiQVOyachF+vq1WQnmCRXw5U2oCf1W
	UeEs1lyONs6V6HXaXXxPUMDyCWKk=
X-Gm-Gg: ASbGnctrT9sR8O1HGYuPgiYikdutzjBn8ji/r7xYvAD8pf7mwsiIpXJ6yBhM2l3bxKL
	r1WDtkW+BYIFQzf2hLl7YFqMS1ANkPB4O8MnHH+nRL8hEDy4uNQMbNGFln8q7FdYZERFdhpE=
X-Google-Smtp-Source: AGHT+IFIsyVRJmpHZBjotMVCSRPbd3gEaCIIHHy4FjD1w9/Fs7vwaZor8NBHQG4IdMBq2/3+m2DX7k9Rk0mcGAJ2tJA=
X-Received: by 2002:a05:6902:1891:b0:e57:8df4:523e with SMTP id
 3f1490d57ef6-e578df4612cmr601583276.41.1736924715583; Tue, 14 Jan 2025
 23:05:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-3-a0282524688@gmail.com> <CAMRc=MeEye9i2Z=Y8bHt2ruCS6JJRxmGiLvAUt6E7BJ2K4wosg@mail.gmail.com>
In-Reply-To: <CAMRc=MeEye9i2Z=Y8bHt2ruCS6JJRxmGiLvAUt6E7BJ2K4wosg@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 15 Jan 2025 15:05:04 +0800
X-Gm-Features: AbW1kvbY0w-UuJw15CFDA2VEYiv0cNht8IhrNUen9V2_54YGXuldzphdX2Xup68
Message-ID: <CAOoeyxXxmO7Hvd4==TY-NuUwY_tv7xfjG-Cd4H4stfL6Wmoorg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Bartosz,

Understood!


Thanks,
Ming

Bartosz Golaszewski <brgl@bgdev.pl> =E6=96=BC 2025=E5=B9=B41=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Jan 14, 2025 at 4:30=E2=80=AFAM Ming Yu <a0282524688@gmail.com> w=
rote:
> >
> > This driver supports GPIO and IRQ functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> > ---
>
> Please pick up review tags when resending.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

