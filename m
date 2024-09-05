Return-Path: <linux-i2c+bounces-6231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB996D1B1
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 10:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4118C281AE1
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 08:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDDC199FAE;
	Thu,  5 Sep 2024 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hSnyJUsb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D066199FA0
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523894; cv=none; b=t0VCwaylm0QPQOZ/4tF3zDLXZyBrKGBnVoI3PJq7a7fMj8ddNyPND0vlE3S/GR6Bv5LZGAi8GLpe1//KotX+gJCY8otre/xUTKtYY6L4S4Q+ieo23cMfiP8Rg3pKZD+8IJrzY5tbdtxUMKTHculJyCU9O7KXmX54r67/jcYgG+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523894; c=relaxed/simple;
	bh=F4EbLyf6kkAeGukY+adQL1kHBSivOSuwUA1FnPkwLr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceB7pcfVsTNsSO2sk33YhJQMv0TSuafD4aJ5cuU+DGx/qhxmq3k6LhTany97PCacrBCdRQos1VyV3jdlT2RLyotPWU3gAq6gJn9V4R/ps1upscg6Ti9kK2KfdtTwmkjNIk7Q8waxdWKuLB5/c4iHT/MChF//QvMw6D/lbQbPmjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hSnyJUsb; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f4f8742138so5186851fa.0
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2024 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725523891; x=1726128691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqxrNHgbeGAL4h4J6aJ4gyN3+tB2yX3dGNtW99El5js=;
        b=hSnyJUsbK5rFp5pga6NLRt8f31DufTzNirIiUlRWClp4JK/sq+w/Xjva9NpfHS7SIZ
         1bTDsXYgQ1O6Hh/Qd+y7M4YdvZOohwaDxEautCUoEZp91jxeywCoxSToqtSFbcpFQuaE
         NKyFUp4tbb6IM1oQYZJ1ReXBCbgrlrzxU8MLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523891; x=1726128691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqxrNHgbeGAL4h4J6aJ4gyN3+tB2yX3dGNtW99El5js=;
        b=JOV5ZGHZbVTs35q5nKUZX4lzh9MsyFjy6AJla7pk4kz4hWl0yK9BwXzKmScMcbKW/C
         w2lLqP0B4r8P3FtJUGfSk1JolmsZYYwbPL80aasPe4qvmjZCIP4OHwZt1sD39icELvkW
         XYLCM05GAsjViin0Mp22qktGsWogOqDZSRUlOTl55lniGkhAqy5+/DIWINX0zTDs6ssw
         vqeaSZMxqX5VunNnmbZlV3rYN5hTEvwKtMg73TeupN5NwcjCipZoihA9idUW/bDtCqYR
         vy0GO46qYuW4IhPywYwYpOscG+lRFQUuHq+B9vLBpbb2OeWBPC1exHIfdlQziJBorVdh
         4VNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFxMm4msEf03p1qvn59bPg5nFvzm9EratnbvBvNkk1+X2cmRy7qEBqlI9A4rH0eGpA0ahH5hqTX1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa2cltIivoVLXzIfnY2K7GyJaxIuvuYz0kylv3Argx9lSmP0B/
	CFwACbi0GlZdxNttgjGlxkYkyFzaPGeo0VF8lvlMO2rFG+PdlO0BRnsZUDjY3ABRlZZPSLOs0lh
	DMUyLja5OjU+zZ4YPDb8Ytsm9slV62CVEU44e
X-Google-Smtp-Source: AGHT+IHgBQxVW+6mWOLd4xU/v/uqA2bXrlgX+qclLv/VfI8suvKUwIZp0O6ejzR9OBlUf64DSkNg9Mtn8N7ARtFnYaI=
X-Received: by 2002:a2e:a9a9:0:b0:2f4:9fb:5905 with SMTP id
 38308e7fff4ca-2f64d38cf3fmr53482011fa.0.1725523891012; Thu, 05 Sep 2024
 01:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-4-wenst@chromium.org>
 <ZthcBpx8WFIvsrJj@smile.fi.intel.com> <ZthdU6UGlM75GJVj@smile.fi.intel.com>
In-Reply-To: <ZthdU6UGlM75GJVj@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Sep 2024 16:11:18 +0800
Message-ID: <CAGXv+5Ew23BGgw6XpikBtAm+wQiOjFDyGuCSpt_GsGhoAwD22A@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
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

On Wed, Sep 4, 2024 at 9:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 04:09:26PM +0300, Andy Shevchenko wrote:
> > On Wed, Sep 04, 2024 at 05:00:05PM +0800, Chen-Yu Tsai wrote:
>
> > > +static struct device_node *of_get_child_regulator(struct device_node=
 *parent,
> > > +                                             const char *prop_name)
> > > +{
> > > +   struct device_node *regnode =3D NULL;
>
> > > +   struct device_node *child =3D NULL;
>
> Btw, redundant assignment here, as child will be assigned anyway AFAIR.
>
> > > +   for_each_child_of_node(parent, child) {
> >
> > > +           regnode =3D of_parse_phandle(child, prop_name, 0);
> > > +           if (!regnode) {
> > > +                   regnode =3D of_get_child_regulator(child, prop_na=
me);
> > > +                   if (regnode)
> > > +                           goto err_node_put;
> > > +           } else {
> > > +                   goto err_node_put;
> > > +           }
> >
> > I know this is just a move of the existing code, but consider negating =
the
> > conditional and have something like
> >
> >               regnode =3D of_parse_phandle(child, prop_name, 0);
> >               if (regnode)
> >                       goto err_node_put;
> >
> >               regnode =3D of_get_child_regulator(child, prop_name);
> >               if (regnode)
> >                       goto err_node_put;
> >

Looks like Mark already merged this one. I'll send extra patches to clean
this up later.

ChenYu

> > > +   }
> > > +   return NULL;
> > > +
> > > +err_node_put:
> > > +   of_node_put(child);
> > > +   return regnode;
> > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

