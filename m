Return-Path: <linux-i2c+bounces-6939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8574B97F120
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 21:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A03B81C21791
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 19:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CD119F42D;
	Mon, 23 Sep 2024 19:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fy2HA/PH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664D433A7
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727118755; cv=none; b=K35DRe2LCx0J+ctD2IF0xF/D/Gs+JZMempHU2hE/smE5908aiHwEs2rMBxm6Y1ASpRwk8B6U1pZ28gkST4u6WJITDGZv6n9H4gi7OOZwG2ucGkGDxm8AvGn1Cn61QfakmJiNfcjAz8YSY08BWVQq72Tos+IIon8bcKaRr5sZGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727118755; c=relaxed/simple;
	bh=xf364lZIbnjp5yXv/kYTrKS69WYtJ5dXPHV7dU2ANQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+b181sCh0mXR/zioy5lVlwc7fm9TESRjRsU9V0mNJdb8K/ZdmGQOKdm2EoQ36uralNlclBHk4m3FerawcIUar8FQsY00H/MW865Nc/tjRdT8LU8yQIk9uysC/NmvnqKEmpKXlsEbPd+jrEn4LcTjcIdV9j2K2M6wicV0WsjkwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fy2HA/PH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso7315486e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 12:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727118751; x=1727723551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=Fy2HA/PHwzwmDH+z/zYibcHxGIhdToC7rf4xSL7rMhvnn+RI9geRIzlu1Ws4pWY1Oq
         8KXogjlpOi8wCw1JOddBjZdMu5mj58BpwuI/vvTfVtoGMgjb340R4ApqF2aFn04JwU4f
         z1Tbmfv9asK5yZIsPQc4/Wz1zJyxQvppfOr1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727118751; x=1727723551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=C9ngd1VbwEgAwuYfpen6u6PbhzPqxm/Xqk6CnpvHOzqjjMLM4wPlKuZuW+9K+z6pGl
         AStDpvPTu3OKkXVeGu0Ps8q1DdHYejpaV8pr4e/xyzndzemSJQPkawtkfdjXyo5KmiW0
         0s7U3fqp2xfEI0ibSy2IWJMzV/DWyOPYuIfGMI2pviTAclV2kEFZmjXyndDYgpDoecq/
         7/+IHPzevrY+QBZYCnV2c+0QJEF1ahR948AwIKEBjwi59RvLfuFhaoN99TbOiQLrFzp7
         CQpf6NWxYhCV/8pSDMDoAD8SPXpXenbvXH2g8ZLAdUEtJt3Y4PDLaDm2fysxC963p8Rl
         sjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQq2oRzpmxcPDR7E6kpoNIicpAwjQqiCZtjt20SkMQroxIzm+YdY4X1c9UEU3s2rYyo+1ExCTgA9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgMleJMj6xHTSQprD3Q6tilqWiUqSSGI7wlvHqrVnsfLne3zAX
	oxlEBeRd+CyBl3PStJCulynQX5bz6U1lfPlxA8LSD2PlbAwsET8CyAC6ntYEOa5ncOQoRz4vZ1+
	oxVCi
X-Google-Smtp-Source: AGHT+IESr7qDODb/PFNa7RDk7FuyRhJHWwNDWlD2JHKXQbb7rxokjJyrlyuNwLfzynx4iWGRjZEOWg==
X-Received: by 2002:a05:6512:3087:b0:536:741a:6bc5 with SMTP id 2adb3069b0e04-536ac2d6aadmr9489693e87.12.1727118750787;
        Mon, 23 Sep 2024 12:12:30 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704db2dsm3379942e87.99.2024.09.23.12.12.30
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 12:12:30 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53659867cbdso6533133e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 12:12:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXZvrb9ktsOJQC1JrVZAKs7GVmxSoHr1tE0FS8/ajP3SVYYdBfferUA13PdLKVwdXuGr1WyOvpG/A=@vger.kernel.org
X-Received: by 2002:a05:6512:280d:b0:533:4505:5b2a with SMTP id
 2adb3069b0e04-536ac2f5b48mr8261806e87.28.1727118750042; Mon, 23 Sep 2024
 12:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
 <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com> <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
In-Reply-To: <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Sep 2024 12:11:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wv1uFmxFsaxT9tY=-fwnPsXDjnabNxQ-cK3hm2a9Wo7A@mail.gmail.com>
Message-ID: <CAD=FV=Wv1uFmxFsaxT9tY=-fwnPsXDjnabNxQ-cK3hm2a9Wo7A@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 17, 2024 at 5:41=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, str=
uct i2c_of_probe_simple_ctx *ctx)
> > > +{
> > > +       if (!ctx->gpiod)
> > > +               return;
> > > +
> > > +       dev_dbg(dev, "Setting GPIO to input\n");
> > > +
> > > +       gpiod_direction_input(ctx->gpiod);
> >
> > This is weird. Why set it to input?
>
> It seemed to me this would be more like the initial state, without knowin=
g
> the actual initial state.

In this case, though, you're trying to turn off the resource, not
trying to get back to the initial state. IMO deasserting the GPIO is
the way to do this. If the output needs to make it an input in this
case then it can use some type of open drain mode.


> > I would also say: given that you're providing a parameter anyway and
> > you're giving the GPIO name, can you please move away from the "raw"
> > values and move to "logical" values?
>
> I disagree. When hardware engineers design for swappable components, they
> likely look at the electrical compatibility of them. In this case, an
> active-high "enable" pin is electrically compatible with an active-low
> "reset" pin. If we use the logical value here, then we would need more
> logic to know when the logical polarity has to be reversed.
>
> Note that this doesn't work for components that are electrically
> incompatible. But in that case a lot more board dependent code would be
> needed anyway.

As we talked about in person, that made sense in the previous version
of the patch where you were looking for all GPIOs willy-nilly. Now
you'll be specifically asking for a GPIO by name and we should honor
the "active high" or "active low" nature of it.

-Doug

