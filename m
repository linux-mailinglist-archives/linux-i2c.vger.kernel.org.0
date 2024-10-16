Return-Path: <linux-i2c+bounces-7424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17D9A0302
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 09:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30A431C243F5
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 07:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C3F1D014E;
	Wed, 16 Oct 2024 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UiqaUB6z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F11C7274
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064960; cv=none; b=grmsZHdqPslOx+Ub3Ug70ntMBxwgLI69Z/eBl3sDiIgHxNzLsUpxu8isWFb0FUiVPzmfvEdD26Nh5FomikHKP3yrVVMWPMuz/AwzCYf8SFPCceFHXeTkXIlkB1/7t3LUSIEzF818f7/MUbYIOnMdno64+dpN6PPwZk+7k8VY0VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064960; c=relaxed/simple;
	bh=PyStb3/Pmwe3ISP9nOh9GcWb5KrhI9ZlHni3WfxuEa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUbqfq3HmrIUFsPymRE9s9HC5H1Y7UGJcLbILcTbts79Nc4vx9B561c8CcagVkW+n0BYPYiOFeAHDA+OHELi157CW7cRQDY3ULP3VgnAFR2JpXm0/oQUtfVT18xTtpu+j6EXRsCS21Q6xaqYSM24K/451EwHVWtb4JzE9TIWM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UiqaUB6z; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f72c913aso3449555e87.1
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 00:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729064957; x=1729669757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN7AKsuA98PPPT8uDMCj6K1ZQtwWhhEOz7w0/8n7gmE=;
        b=UiqaUB6zqksj4LqvvhwZRd1QcwjbIQhC3Gt3DSCur+h+AhU/fTCKVz84U3GOseihVH
         ySyovaIsgiYYVAmNlg3kc2CeQdKJ1/qta+WsQoO1w1vp6BdAT5q+9S+FBo0gVWqyF9Ta
         skHgXors/JU2Yi2FFkDvL0iK5+2jn+RdDHX8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064957; x=1729669757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QN7AKsuA98PPPT8uDMCj6K1ZQtwWhhEOz7w0/8n7gmE=;
        b=FTtwO3GhQcTLgh9M1JrXcdAEyOFQKtcbwmFTerz6DwSIE9g4z8pp0TtOl/cE6ffaHC
         w5JD6SMkrlIA3G8/a7+q/SGFPEzyHhBCak1LrzJdUQ6txd55rM4XjXJHEv0yO53GjS3K
         CrbhFjd2+Q7EQV/JuvnR6mYLIpHnOZwG+kCYN3gfEW3uXO0+WR4pGAkTfAplZGFXpr7h
         NsKONS4SF88xUABMZTblpOZNfPofZgp+mBGzSaktXSwAfAw4e80s6abpgk1k3yz4KN7h
         rZPk7+Yfyd+vNmmDSMSjuQyI4pwiHHmrFFvgrpnV/rCoyAqTryRf/7+io1BME7/eWCC8
         X7UA==
X-Forwarded-Encrypted: i=1; AJvYcCX1QMoJisEFJFzlA4SLhAGdnJqmta+yZLb6o6HJr6qPQpfk25DfrByt2D8PaI+3R7hOOhW/1J5BYzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkcnrx4GlZ27VvbAl4cU86S6sdXw2a/CEj5kPPxpbs6h/x0Zmx
	tpu27ar66prQphV7TokYYOLpoppsssoVoa1uTioBLsvYfaeFXW4M8gxbQNcCKd9siDIQSIb/eN5
	2ZncRQUvHgBrQ71g7wXdbJyETFkh2dWjTOWGh
X-Google-Smtp-Source: AGHT+IHvTkwvjhIgGqx3Y94zbgKp7DdoAxdd+wPihZcQpAEuvOqZHroRtSnL6ezi7qQpWv1axzh0aG7P3lW1zmgXUYU=
X-Received: by 2002:a05:6512:b08:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-53a03ea078amr2069607e87.0.1729064956730; Wed, 16 Oct 2024
 00:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
In-Reply-To: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 15:49:05 +0800
Message-ID: <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
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
> > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struc=
t i2c_of_probe_simple_ctx *ctx)
> > +{
> > +       if (!ctx->gpiod)
> > +               return;
> > +
> > +       /* Ignore error if GPIO is not in output direction */
> > +       gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
>
> I'm not sure I understand the comment. Does disable() ever get called
> when set() wasn't called beforehand? How could it not be in output
> direction?

You're right. I think it was carried over (in my mind) from when it was
still four callbacks.

> >  void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
> >  {
> >         struct i2c_of_probe_simple_ctx *ctx =3D data;
> >
> > +       /* GPIO operations here are no-ops if a component was found and=
 enabled. */
>
> Instead of the above, maybe:
>
> GPIO operations here are no-ops if i2c_of_probe_simple_cleanup_early()
> was called.

Makes sense. Will change.

> Just commenting nits, so:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume this stands even after Andy's suggestion to drop the gpiod check
is applied.

Thanks
ChenYu

