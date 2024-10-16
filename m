Return-Path: <linux-i2c+bounces-7422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C629C9A02C8
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 09:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 044C21C2353B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 07:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166291C07E7;
	Wed, 16 Oct 2024 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hul/KEya"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C011C07C0
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064380; cv=none; b=VAW6nYBZQ8KMWstRYrmMI2BC1fa7Gdlx3xG4ARZegjh5visJj1LH4Tp3lKJj4/hQWoM3JcE5kKjkTwMQzwqpbhHXfm2qGUOqKPk1Tgs4qA9oir057Bo0xbBsVbzj+1GbZsR50UolpIxCdUhbWr/SQtuF8nqlx3TImbc/UaS6tgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064380; c=relaxed/simple;
	bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqJduNU0+AEn5VLKdhl+iSs4xJl26MW54aqtG9PqCVvCnxUQf7aQ6EF7AxhKBa3IRxGLA5sn5jVwXgKJdjqOFv6fsG5a7sy92Av7H7MsSMePaIXIvjSnTfqSXQWwylr5mMJU7Duu5toCNhKq74nXhOztbqa4h03uIOBDW42nkC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hul/KEya; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so61808201fa.3
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 00:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729064377; x=1729669177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=;
        b=hul/KEyaPyqoAf/yR1Y0E+Dk4gc08kE2yJphxSXahu5ya7Myuoid2wG451egWDWk+i
         LSag8FYAjRi3iFnEwxrtli3MvJnw5v0jyc4DIrRbCy/0w1+9uLv019rY4+VZEWvlADIQ
         i+edOtx3g6c6cTvJp4z78IQG20F6aEAZpNuy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064377; x=1729669177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=;
        b=RaTsAK29SwihpntGnshmyEbZQjsg5/1eJV9sLzDj6TCFKWaLHaUdqq6C9P21liuOEV
         /49oNisqE+XunkuLz2VVKusxjtVZJ3fCO3u4//Ypqymbjxd15I86d64V+EM2CRQpDBSl
         eco6nkWeuT4l7ido6MpZstKJMMORlH+mh/m8XnY0OAggJBfHjOH2X6VXnQnIemlQi5XJ
         NgRGeY9iTvONwaMEaTp6x1BKUcCrkOYBMzu0wV9QTqIRi4VLPeC7YT4Lhz3ESd6DAuS/
         Is3/dtjlk5OSnYnPP46OSPHg3iXfGsmkQLdDhleQsgcchsctBv/g+p3LZnb255jBhcgJ
         p1IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWr8XxgNhXap9hUAB6dH6jyW28DNhTOinvOdlNZ758FM0zFC2OA/3X8qWOYgygBSZDo+XvFySNriU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzehu46qaqT95gCkWnCVtILBhVO1yzlDJavve1JcsQ7rOA7ym6F
	vGFAXG4dD4QeRequsj2LPudReNghJwhpF0guv435MWuEpeLQzlFUxJp+krASmxUERlV759TMZ7k
	YzPswycYMMJMff1fokNYb7RXCZDLxWpo3Ib7x
X-Google-Smtp-Source: AGHT+IFZ47ariW2Rra8wgmSaA6DC+PU8PnYnhILwMybMfHSnCE3ukSpG6GGGC1OiiQsMnz8LTDjTAbXe4DKeoahrz7s=
X-Received: by 2002:a05:6512:68f:b0:539:e317:b05f with SMTP id
 2adb3069b0e04-53a03f31724mr1842549e87.28.1729064377360; Wed, 16 Oct 2024
 00:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-6-wenst@chromium.org>
 <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
In-Reply-To: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 15:39:24 +0800
Message-ID: <CAGXv+5G4OpGK77D7Jo6dtPj_R9=6Uy9GjuQ0O8su0Z--ejboRw@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator support
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 2:00=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > +/**
> > + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2=
C OF prober simple helpers
> > + * @dev: Pointer to the &struct device of the caller, only used for de=
v_printk() messages
> > + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> > + *
> > + * * If a regulator supply was found, disable that regulator and relea=
se it.
>
> nit: was the double "*" starting the line above intentional?

Yes. That's kernel-doc syntax.

> Other than the nit, this looks good to me:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

