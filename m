Return-Path: <linux-i2c+bounces-10608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5EA9A31F
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 09:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766AF3AD096
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 07:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BF01EDA1E;
	Thu, 24 Apr 2025 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iFgq2CrK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDC61ACEC7
	for <linux-i2c@vger.kernel.org>; Thu, 24 Apr 2025 07:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479024; cv=none; b=DK1RBYuIcI3SX4Z7aDdqtcZ3IY9P7pe6d+2k1rx4oeaLd92KhIgJd5GVx0VdEAmnF2y84SdFBJZRFft3i7ijXApx/iHcHfHTFw9boII2Z4k/X5lz58xQs2/QeIwykw8X1YyPY8znDQc/xc+z3ono5ANeajZn7i/AdgTvt0ZvfVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479024; c=relaxed/simple;
	bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ux3isa9fHN53YxhI1PEuAXJmaco2bsHZSNDPJ6Po2H/8cIaJ5HFzmXA9P8SBqwWCCIVVbD8NJKeGrema0XBaiSEVgq19JDCyo+4lyvs6JfbRg9N7lEawcFcdemt6ZpqtFNmAmLHo+N/vhGVZZSocU3RV2B36aKTf9qs1PK85uqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iFgq2CrK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d6f93316dso722935e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 24 Apr 2025 00:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745479020; x=1746083820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
        b=iFgq2CrKN5ooXXvj1AdN3AukOU1QQBrq7qbmTZwNi+gDnVp28ahPlbABX2zKqj433Q
         iOx5eplyI5CJpxSRGEOecMF5Yf1p+OUiI6NWbThKgfJhlVGmTUMds0LZBzCf6zIVXn9L
         o80BJ1t0pVW9nkFbuHkSPFyhnoNYSAerCS8gVuO9I2fL6gO1Va/XEgFpWnYMBY36CWlE
         XwLTrTrpcGQArNPz/zB3W6na1sNp3a5sTiTA7kg/79slgAlE1F83UjHVar+nw5LLtSoT
         wGztuShaeoNOdNgZUVRDY/mURz4bG4ANHSFlDfcwWJ/9B0z7N8iUwY8fiuTKlEAeay6y
         BAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479020; x=1746083820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
        b=wo+BhKfR+OTeVqXqivREnDDDZeKVOYYgIeMhWi7M4O+Utgil8650Sofy5APrgGrsRE
         MSV4R3cK+kF39JmcHm7NVAgIOQ/7bEj3MrstLryr5hyIBEf7pI76an47qB5HS6nTP8Pi
         oFW1j0J5SCHRPVH79krSLdUsNxfy5h99HVSEpURXlAgMImE0Djudmgn21ODhimlUqqb3
         PYBhv4b57i0YxzGyEx8GSjgvXfpylZtNPgYSltLxkKUqISwgQma5byZFkAIBi57JoWwH
         OQbFrPQ3URvE+6bp/VPOxcsyBSOR4dpdaaqmYgfvnV31bRexrI4nemC/6TUBGwYzlHot
         PvZA==
X-Forwarded-Encrypted: i=1; AJvYcCUTjE3FY9w27ZTXdDLvABHmizEY2wH4VDWIw6gGK/VrBdl/AHzbqDRHmV6U2dJvrYpFqi+EvRWn+2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzNJBpV46Bmd1jiCRxkGYzthziLHD/IcA4AJRc6AwtM4t/eN8h
	uOAn9rYRjpndWd5mduhiU1EaPuIoGzNNPZKoj/RW8BiT920pM0umbUtT0B254iAsHMDaNFKOF2M
	ghkvGpBOy4UIKfU/UwxtRNZvgGvWQ+7JTKuqVUA==
X-Gm-Gg: ASbGncssIHV+iusSL2k/srJMt8rWdX4f8vxITAoggQ/11GiI3bG5OmCNOQRUo8e2LMt
	W/u4pwr+TR2E+N5SkFpgzrdo13oBA6u3tX+Dvug+SHddNOOgQ/GkcdNVidEMnox//2AmVynqho8
	QV3ZmUUBPccFtkEduItCUMPK+5Q/vkWYMBCbqD4zHnBO1Vq9hBQbp9jg==
X-Google-Smtp-Source: AGHT+IG7sbNkW6K4E+gZCj9BvmRurRuIOdRBZYRXKnKeo9MdE3o52+XU5EDUC66JU8GTial2FaxDd9hruPwHijYGY+Q=
X-Received: by 2002:a05:6512:15a5:b0:549:8e54:da9c with SMTP id
 2adb3069b0e04-54e7c41682fmr591334e87.4.1745479019474; Thu, 24 Apr 2025
 00:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org> <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se>
In-Reply-To: <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 09:16:48 +0200
X-Gm-Features: ATxdqUGJSrKABbl7cdx0FUWA6bl4aWMdgNufCjq59VS62rLqVUFNqJgqC7ohSmc
Message-ID: <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 10:08=E2=80=AFAM Peter Rosin <peda@axentia.se> wrote=
:
>
> Hi!
>
> 2025-04-07 at 09:17, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Peter: I know you've not been very active recently. If you prefer to
> > just Ack it and let me take it through the GPIO tree, please do.
>
> What normally happens is that I just Ack trivial things like this, and
> then either Wolfram or Andi picks it. The risk of future conflicts in
> this area (and cycle) should be low, so I don't think it really matters
> if you pick it, but Wolfram/Andi should have first dibs, since it makes
> for slightly neater PRs during the merge window.
>
> Acked-by: Peter Rosin <peda@axentia.se>
>

I just realized their emails didn't pop up in b4 --auto-to-cc. Cc'ed
now. Wolfram, Andi: do you want to pick it up or should I take it via
the GPIO tree?

Bartosz

