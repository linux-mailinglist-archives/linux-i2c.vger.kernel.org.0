Return-Path: <linux-i2c+bounces-5723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5685D95C5DD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 08:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E0CF284A0E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 06:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7BD139CE3;
	Fri, 23 Aug 2024 06:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l5eBf03t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18B1311AC
	for <linux-i2c@vger.kernel.org>; Fri, 23 Aug 2024 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396079; cv=none; b=RqXIMc0+UkoxNAh4OTfW2NfsRCtgNI/pIgm83wQUR3AREVe9PoLW44qIOE0WO0janXyTCm3d3yNsLR/MYkGfpJNCpVmYXRwLQEiwPv/ZpW8ilzZxaXYAOwEX+HU58CKGNOYIQwH299fQxcSejM73G+Dww7dBZwz60B9Ll1vDwgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396079; c=relaxed/simple;
	bh=b7cBKZ3aiovvpcnd82a//jTwAitemyJStikYa58pHQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUojXmqsXutpbQGFSDgjHuEj1OoxHFliSGP52ROJtW0ZfJr/f40i+veNd4bEnH/+TuL0H+a1pxZrhxxk/ZQHs+z/kbUT0aRKjfANUf/z+aL7VoST2cp28IIUOOSmvx9A1bqyFI5ZUoSb7O5SIi18+DDSXUOMaSYgrWsLuzzLPuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l5eBf03t; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f4f8742138so1375611fa.0
        for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724396075; x=1725000875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYlhEmPtRTYor0AL9cAnJrQT3p974t5Lzi77Eaz87M4=;
        b=l5eBf03t+B4cTIRsh4zABzzWRLDgy3hvAaTLEIP21MEzxih/MD35FQo9jgF50fyTxk
         NvQ6/9qIQ7gyiKo6gISOSe00cTslOpOzhxwnt2FUzpRIuhZRNAl/AresT6e4vF/ZZuvR
         UC4ecLuUDRqIcPfkTlrU3Zjx9UGLBs69lk8x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396075; x=1725000875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYlhEmPtRTYor0AL9cAnJrQT3p974t5Lzi77Eaz87M4=;
        b=hrVnfAm8CT2J8O7pYJHqDG3BaMIYTL+j0FTXvkxuGwku+w/TBJi/ZuSttc1wUX+NiX
         lQfLOhbK10rX45MW/fLRqmoRWOpXvZnKDQ2dhgKa+z7m5FSwvaaJR9ZeM8n9s22tLfGz
         zt5PQWRLHaSk5Wy9RbgzpXxz0mZ4cRsybX0QONoeBQWmCgETe0UB6XkFblM22EQakaSt
         mwpb+kvn4SGwjpUUEXwCLF6Sh8kBtK+KL++7NP5tTX3PdRXiR/7qv61zO2iZTlouJtf3
         yv4tJZCL3kO2/I/18tLze+oIZ++xwmmWh6G/PLFBTsPWg3e4cO9Pfu/fgKKz8SBGTJBd
         qomQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlpr4xPOriS5Oa0NYbz3eqPnmrfDdcENwmogqOMXUeJtXFA/6MeWevyGii99j5pUgrdEqTz3c0tro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxArl1+e3j5XDiO54Z2aNEARqawSLMgOu6WUP1bqegwv2NQvJ5m
	/VVcUli/wFkkh4q9pD4N5QBx3HLEa8r+7uGGTHQBKMNzSai8X6kN0yIxa6eLSyMx9kfxsjdkAeG
	NRCQ8R/Xr4t3fLKuLYQYg0nGHBaVfNGkQzBnm
X-Google-Smtp-Source: AGHT+IGDC0WWTfFgI9QnQzvX49/NewGmGwj3Cz1KMtz32yMSQX3nF9dwL9fql5Pr3fEZyw3lnpJjTa3uuZm7Vkpw1m4=
X-Received: by 2002:a05:6512:3b82:b0:52f:154:661b with SMTP id
 2adb3069b0e04-534387681c5mr853124e87.11.1724396075319; Thu, 22 Aug 2024
 23:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-4-wenst@chromium.org>
 <ZsdB1vsEe0atW88_@smile.fi.intel.com>
In-Reply-To: <ZsdB1vsEe0atW88_@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 14:54:24 +0800
Message-ID: <CAGXv+5Ew1tQKmuKckovfHCgH-ja0qSmqJWOk2qowQC4k_1tvYQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] regulator: Split up _regulator_get()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 9:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:56PM +0800, Chen-Yu Tsai wrote:
> > _regulator_get() contains a lot of common code doing checks prior to th=
e
> > regulator lookup and housekeeping work after the lookup. Almost all the
> > code could be shared with a OF-specific variant of _regulator_get().
> >
> > Split out the common parts so that they can be reused. The OF-specific
> > version of _regulator_get() will be added in a subsequent patch.
> > No functional changes were made.
>
> > +/**
> > + * _regulator_get_common - Common code for regulator requests
> > + * @rdev: regulator device pointer as returned by *regulator_dev_looku=
p()
> > + *       Its reference count is expected to have been incremented.
> > + * @dev: device used for dev_printk messages
> > + * @id: Supply name or regulator ID
> > + * @get_type: enum regulator_get_type value corresponding to type of r=
equest
> > + *
> > + * Returns a struct regulator corresponding to @rdev,
> > + * or IS_ERR() condition containing errno.
> > + *
> > + * This function should be chained with *regulator_dev_lookup() functi=
ons.
>
> kernel-doc will warn here: No "Return" section.

Will fix.

ChenYu

> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

