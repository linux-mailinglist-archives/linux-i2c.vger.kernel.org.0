Return-Path: <linux-i2c+bounces-6531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD0974B92
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01EF5B236BE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 07:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AE08494;
	Wed, 11 Sep 2024 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WqUxhFuV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A847127E18
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040270; cv=none; b=utZydlkFUiDSNnAxU2/8pWNf3J+zgJVz1190FC/F0XeVDP5elKS8PFtMNIk5swe5XBkceWctOVuIPO9YlA9gQiP2hTZFOHJo0bPGFAUnfE/NkfFV1bqVmRxbg4/c1rcwqyQdYOvY4JyoBEp0/QkpUl0mtyuVH8FsgY1dqpIsu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040270; c=relaxed/simple;
	bh=OJiD0dE4D2l6iH8UbnBaYGFLq+atL+gXbKu7MBslUAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHTG1B6kWwhwCy/LBIMvb8JSqjm+lg+4s4Ci/gZ9jaa07r/KAxBK6ARWRhTLlgmM+rundRErckEKa67jIrGPO5JJA2/XH9k8Xgmsp+H1P/K7mCy2ax7stom2EudgFlgqpEpI6Yum3GDaIsDpj8pnkKUOTDvxS0lx7Mjj/S4MYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WqUxhFuV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f75c0b78fbso18204211fa.1
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726040266; x=1726645066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LtJuWg5rZzkpKKkENXUM608sDYwm9QANqJ5OTuJVDE=;
        b=WqUxhFuVufJcpgwK15dyx02jG6BG70LedEXCT1v8ha0krIhzSxKpPVCNcEum6aO/EF
         V2Txh/7lmD78OmUDCEgEvy/lF7EynwfGEUpQWAJTpNd+0ZxOS+A9N4o3XW2lHfZF9Qvq
         Vx9o01uEBVIB9tisGWwJfvIxMrFqCsIQEeAGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040266; x=1726645066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LtJuWg5rZzkpKKkENXUM608sDYwm9QANqJ5OTuJVDE=;
        b=I+GDLFNA1hZgA5Rq7Uv9NMf9MSX53z5vCSGEnwLwruHknvr1zFxDBQQAlwzPVg50hH
         Iq0Mw5NasSfZNHQTU5wDUxY8mIrh15QVCQFSS3blf0gJmx+s57vSqvcBbwbHo70WfbDs
         7FvnA2QoIX7MRXyVRIUL9AbwAw1x54rPuDJQG346vRPJuKJcHEWFP2O3DqQNbJPPTyqO
         cA0PE1ln9uIhynx4gHIKAWWhy0Jv1xhezQo7LtRjVmwjoUCHQ5GaXB3lrbWl2xct4UlA
         OdLcdFUEdpc23At/7muerWMq+SStjT2EzKnVWiiIB8WQwWNFU2R1+p/VvGnxermgQ3R3
         8nVA==
X-Forwarded-Encrypted: i=1; AJvYcCUEEGPzkb0eCqjAsafGp7BuSArd+wyk1cFa4a5q0LzmxJaHjx4nOnvPj8sQFkeq1hV/WglXrNI6JkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzun3pvc9lnUxAI0lAYaltfKtcfMD4k7JYXPnZDxEPxa4MUMTG
	CcPGr6YrofIzCpzAUfUFJhk5O2Tr6oUxygURdajMaeQJ1PPzyEXgctMGLQXwx2nzgFCgbQnLSid
	zSzSDFqOU46WI2Z+iDfBrp00r387qHr2oDLkECBjDtlG13FE=
X-Google-Smtp-Source: AGHT+IEd4894jUMhTj+lpuZUCwhAQoDemTfiQND7C5Rfboo0QkW+QbXwdarpgS+S2rznD6UFho/GB5hhLLZk1Dxbtzw=
X-Received: by 2002:a05:6512:b23:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-53673c95c1fmr1178265e87.39.1726040266114; Wed, 11 Sep 2024
 00:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-7-wenst@chromium.org>
 <ZthjSK9N9z11YXi2@smile.fi.intel.com> <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
In-Reply-To: <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Sep 2024 15:37:35 +0800
Message-ID: <CAGXv+5Hrz2rA1_eAY8S96ankeWS4wr9EX-hr1LUY5JGx=FoNPQ@mail.gmail.com>
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

On Mon, Sep 9, 2024 at 10:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Sep 4, 2024 at 9:40=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:
> > > The I2C device tree component prober needs to get and toggle GPIO lin=
es
> > > for the components it intends to probe. These components may not use =
the
> > > same name for their GPIO lines, so the prober must go through the dev=
ice
> > > tree, check each property to see it is a GPIO property, and get the G=
PIO
> > > line.
> > >
> > > Instead of duplicating the GPIO suffixes, or exporting them to the
> > > prober to do pattern matching, simply add and export a new function t=
hat
> > > does the pattern matching and returns the length of the GPIO name. Th=
e
> > > caller can then use that to copy out the name if it needs to.
> >
> > > Andy suggested a much shorter implementation.
> >
> > No need to have this sentence in the commit message, changelog area is =
fine.
> > But if you wish... :-)
>
> It does seem out of place without any context. I'll move it to the
> changelog area. :D
>
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > ...
> >
> > > +/**
> > > + * gpio_get_property_name_length - Returns the GPIO name length from=
 a property name
> > > + * @propname:        name of the property to check
> > > + *
> > > + * This function checks if the given property name matches the GPIO =
property
> > > + * patterns, and returns the length of the name of the GPIO. The pat=
tern is
> > > + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> > > + *
> > > + * Returns:
> > > + * The length of the string before '-<GPIO suffix>' if it matches
> > > + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> > > + * -EINVAL if the string doesn't match the pattern.
> >
> > Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel=
-doc.
>
> Ack.
>
> In the regulator cleanups I did, I used -%EINVAL instead. But then I
> realized that constants aren't really cross-referenced. I probably
> have to go through all of them to fix those up.

FTR this patch ended up getting dropped from the series as it was no
longer needed. However if folks think there is still value in this patch,
I can still send a new version.


ChenYu

