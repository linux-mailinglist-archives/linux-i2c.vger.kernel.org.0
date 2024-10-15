Return-Path: <linux-i2c+bounces-7373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B62999DE71
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 08:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A97B284665
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 06:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33FF189F2D;
	Tue, 15 Oct 2024 06:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QSulWA69"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26524165F16
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973989; cv=none; b=IPxeC6k1KUY5q7AmJZOeTdU9XQ/vPLW8FM60ap9LgGgsvJM2ikN03tsuCFQu/lMcnwgJj5TxMdIWmvppuZzRVysq/jattul96eGxapHQHNfOpz96NORLijk5xUwiIEdKzPuhvpCpSBEjt5ilsNmQa+76V4Bgi/8zMFsA7TJmXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973989; c=relaxed/simple;
	bh=ajcr+KVWs/DtWqF1gsWdMOYVHLRYdSzAIdmxuUdyUdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoLHe0BHHxvivfFrFNLB6YEtWVhKezxGLC9LW/bbtUdrZnaZO7qgFnHIiTv58fPI7MP9YZvOgtUXRmnQkAii2s02MIN6r2Im/MAyE5e7O3v1EgiEy2ksIihsh7+OeW/9elWpJfQBmMiqEusp05r0ie1Ycpiv48eICYLnP+9q3mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QSulWA69; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e7e73740so2087391e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 14 Oct 2024 23:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728973986; x=1729578786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSQe+OWkJptNhalICgZHHnWYpzgrAnYhHgBYOyd2y2A=;
        b=QSulWA69imZpBxSB7twecK+I/3UCL5stUsEn22tLRtV/yOJugi9yoNoaxCSk1j4vgD
         KoeH//1D9yJeSIwlcyddNpwX/sBCGCKjkhed0nJEcgkKjGPoD2buSZV3aarH0DvhZds/
         wttqzeGcMJQzmJ3sPedSiyOx2gVBHsrL5xAJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728973986; x=1729578786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSQe+OWkJptNhalICgZHHnWYpzgrAnYhHgBYOyd2y2A=;
        b=nZNilir9QCwZmSxQojwt2rBBjtzLFR7oB9HQF4haAam0oe+sLQC2+JsH582D8kn85m
         E+mmRN7jHVVckrpEbhKewHJYVsZNSIFZREfrvDeBqrKNuChi24IUc66vv1692CjAjSGi
         fYKPSQiDkcA7P6pAZ8mH+ALqdy/ggYVHGQX0ryJGD6PwW/R88YpeviUrNiwc7zq6KGnu
         iEwNzVFa5ttV1e2EMPI+M4mHcON7eUKAz6Xme74BNuwWS040WJv10KHJlu/lGVrmaco7
         GgG/vc5n+NQyN/tSJDoJrNRVG6POAuA9e4jTtiG4Mm8PkRjVGcK44uyl/aRbehxEGRJy
         +U0w==
X-Forwarded-Encrypted: i=1; AJvYcCXUr8v3wxMpu3uMqkqqgQLFg1AzHng7QvaPso+mkPjiHIJcNnptddldc0EYGzIH4SgspYwC9A3eVGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/tg/Yj2mRa5L7GsN0+sFKUyYyvQd3PmG1QVSgtJxdu2ccbgtX
	UO4k9jQyufvIkf1hzmrcGLrAgZhUlg6pwZFM2uYg05DmI87/j/Jp6f8NVqNmQ/+Oszq7d2wyAZp
	TwTsyzUnEAW/DPfWGpE6OHs7Ov8pGAQuKnk2+
X-Google-Smtp-Source: AGHT+IEi5VM5BInri+Xle/NpCFhUkRIBDd77CTdk9H6/daGndiGJT4jSou7J34vtaK0aKDEUC8sIsGSEXiAysfqU1+Q=
X-Received: by 2002:a05:6512:2396:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-539eb82d67dmr3760676e87.39.1728973986262; Mon, 14 Oct 2024
 23:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com> <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com> <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
In-Reply-To: <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 14:32:54 +0800
Message-ID: <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 7:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 10, 2024 at 11:32=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > > +   .cfg =3D &chromeos_i2c_probe_simple_trackpad_cfg,
> > > >
> > > >       .cfg =3D DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simpl=
e_ops),
> > > >
> > > > Or even
> > > >
> > > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                     =
   \
> > > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> >
> > I'm not inclined on using compound literals here. "simple X cfg" will
> > likely get shared between multiple |chromeos_i2c_probe_data| entries,
> > and AFAIK the toolchain can't merge them. So we would end up with one
> > compound literal per entry, even if their contents are the same.
>
> I'm not sure I follow, you are using compound literal _already_.
> How does my proposal change that?

I'm using it where it makes sense, i.e. where the embedded variable
is not going to be shared with other instances.

For the dumb probers, there's only going to be one instance per "type".

For the simple probers, the config part is still one instance per "type",
but the parameters are board and component specific. There will be
multiple instances. Hence the config part can be shared, while the
parameters likely won't be.

> > > With that also looking at the above
> > >
> > > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                         =
   \
> > >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> >
> > For the "dumb" case it makes sense though, since it would be one instan=
ce
> > per type. But we could go further and just wrap the whole
> > |chromeos_i2c_probe_data| declaration.
>
> Maybe it's too far from now...

This is what I have:

#define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(_type)
                        \
       static const struct chromeos_i2c_probe_data
chromeos_i2c_probe_dumb_ ## _type =3D {       \
               .cfg =3D &(const struct i2c_of_probe_cfg) {
                        \
                       .type =3D #_type,
                        \
               },
                        \
};

DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(touchscreen);


ChenYu

