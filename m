Return-Path: <linux-i2c+bounces-6382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E5970C06
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 04:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 678ACB21F3C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 02:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C08F1922F2;
	Mon,  9 Sep 2024 02:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jnYtg8VF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B080191F96
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 02:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725849944; cv=none; b=Ux3S9Du12v2uBzoTWuO/QMU3x4V8hpWtDMX/uNRpBpyl3+K7mWuuZprfVsuEyq+34rJNMWFT/KrpBLj7oiUsfRuXcL26d+5dlBSaYn5a/Au4Ygm3NrI6Swm3wmhIto4WK+pwEtuVDw1zabNbRmiKM7ymisfXTw+/hbjC5//Hlp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725849944; c=relaxed/simple;
	bh=EKTLMNEi50l4j4FQxR8tby9uBgIDSSWcDTHy3KnbFhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e21poCewdyqp4zp2obW4WiS8yq1E5sy6n4KO9HYG9QAOpXyj+MX6+vpX3bVFrNJB4/FYktQsr1kukeziogGulw12cqcp413BSO0HW7JYgrZ82ajOnA8IxRYZAX0lx6PuUH918l6pKxMJhRcCR3OlEKRQmmvQgLE6YjP1iPHrdnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jnYtg8VF; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f75e5f3debso12131811fa.1
        for <linux-i2c@vger.kernel.org>; Sun, 08 Sep 2024 19:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725849941; x=1726454741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMqW2/x+fk7uF1c9DEdkk0ZnLtGrl9rFz+k1/Bb5Q1k=;
        b=jnYtg8VFTdgeWs0W0PwlM+Di+ACH1ZxBROvjHTAZiN0/NDZe+nOsksEeS44SCm7Tfm
         9NBH1/+OJU3wc8ZxHqdXL9J/31fpQJa/RNHCtEs3D8PlY6l5HJ6izoeKcioveW/73jV8
         X9/oKuS/X6yNGNsJqHi2+yanAzWFuCDVImOiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725849941; x=1726454741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMqW2/x+fk7uF1c9DEdkk0ZnLtGrl9rFz+k1/Bb5Q1k=;
        b=pME7ZvcUzACdGztiJ3AymiRRt+39Le6/DosG5u5KTPOq7NUa1fXvzWfa62o4EmPUnb
         kkNXrk7au3frfrI9GENp3hL//SjBgzcn/Q2VVLJiV31zp7Dxf0z9wxF1V3lYOaeUXJ7B
         WtE2SCTM6mOebs3MnL/fm1r3F+RZYeuoEznQe0laaawHKCkQNHQErBo1s64aspycwGD3
         kzWpaAhTRhKFlKF7kdqYiWlnyoD/iof50gWLL/1PIsoBL9kGx9kmn/p2jweynT6nmSTd
         hpdh8SFDVXirrR+o+7beMtn7CSX7licscYSs3jrnFXMY2E0aoJrOCdbEktKcu6JVVaHo
         +Ypg==
X-Forwarded-Encrypted: i=1; AJvYcCWql996O2Q6IFjhPk9Wl3TkBYgZDCMXZPn4SZCP8JfnG63CqafzW4drtXwQyzVDDFEbq1tNIVzkdWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1IszQi2OxS0w7gYJ/m0Bk9176dZguRr8ZQsokobBK+e8VnekA
	GXKufr2vrYj0+nHOKYTG+q1IST9M5xOlpjDR/+NYbmq2N9UeyWrV7DxE74wK0/9uBb9/raacb0R
	rKVT6jrYY2pZznwbVJyIo4K3uZLdd1kTg3tXb
X-Google-Smtp-Source: AGHT+IHKcGbtZMLF5gC+Rr5ltwNIMAF/guOu0Im7D+JgNL7Cng1B+SOmWwSxiNMZsp714FjogNvrNqttyc4V2OI3P10=
X-Received: by 2002:a05:6512:6c4:b0:533:4620:ebfb with SMTP id
 2adb3069b0e04-536587ae621mr6193097e87.21.1725849940576; Sun, 08 Sep 2024
 19:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-7-wenst@chromium.org>
 <ZthjSK9N9z11YXi2@smile.fi.intel.com>
In-Reply-To: <ZthjSK9N9z11YXi2@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Sep 2024 10:45:29 +0800
Message-ID: <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
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

On Wed, Sep 4, 2024 at 9:40=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:
> > The I2C device tree component prober needs to get and toggle GPIO lines
> > for the components it intends to probe. These components may not use th=
e
> > same name for their GPIO lines, so the prober must go through the devic=
e
> > tree, check each property to see it is a GPIO property, and get the GPI=
O
> > line.
> >
> > Instead of duplicating the GPIO suffixes, or exporting them to the
> > prober to do pattern matching, simply add and export a new function tha=
t
> > does the pattern matching and returns the length of the GPIO name. The
> > caller can then use that to copy out the name if it needs to.
>
> > Andy suggested a much shorter implementation.
>
> No need to have this sentence in the commit message, changelog area is fi=
ne.
> But if you wish... :-)

It does seem out of place without any context. I'll move it to the
changelog area. :D

> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> ...
>
> > +/**
> > + * gpio_get_property_name_length - Returns the GPIO name length from a=
 property name
> > + * @propname:        name of the property to check
> > + *
> > + * This function checks if the given property name matches the GPIO pr=
operty
> > + * patterns, and returns the length of the name of the GPIO. The patte=
rn is
> > + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> > + *
> > + * Returns:
> > + * The length of the string before '-<GPIO suffix>' if it matches
> > + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> > + * -EINVAL if the string doesn't match the pattern.
>
> Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel-d=
oc.

Ack.

In the regulator cleanups I did, I used -%EINVAL instead. But then I
realized that constants aren't really cross-referenced. I probably
have to go through all of them to fix those up.


ChenYu

