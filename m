Return-Path: <linux-i2c+bounces-6938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5E97F11D
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 21:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFE0628210A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 19:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2DA383A2;
	Mon, 23 Sep 2024 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ud/wCCEk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A4B1A28D
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 19:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727118746; cv=none; b=fGHqtpaxYlLyfSFXe3vVMP2szN4rM3yfmsanmstyRMkGwRZIswn1CLDNzTdU1fZr8q9xc6cJUVubmd2odpPQhZdYB+lx6nL44bgPxak2S6aMJYdLQdw8rQL14d6T+sLjAcASOnUZ9U0s/W5NFglEQgrtLbLCeFq+gbrtKFoM2+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727118746; c=relaxed/simple;
	bh=xf364lZIbnjp5yXv/kYTrKS69WYtJ5dXPHV7dU2ANQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8yGUzI1Zz8+fIZQ8iH44UZ8+lrW+ITX1yPgW45uE/2+AAjMLBZSX9L9I5/J/DnkCa1xshkfZlNufE0kEupLSxQivZHohBD7cQRpGB5KLLCOziHYYdIcPF0uqzZo8Bv1mnm1U1kxwT3MBqR6o9qMOKftrg/RcDD+yWcaNIJ05Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ud/wCCEk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so4696556f8f.3
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 12:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727118741; x=1727723541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=Ud/wCCEkHuYwvqa0kKHbjJyhFJyGDLKiyKG/6OP9/SjHvoR6p34t/lG4xdJb136ZJD
         rrEUMEkf9y3KDU4GKxGV+vvbvZ+1sXSsMyGhYNkJURi9dHVR4CeisukpMHGPv5NE8iYU
         530AwrSWpKftMFbPfBOVLa3KYO202Vd8tgSGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727118741; x=1727723541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=I7GsP0eEUfp7IK8VWCeFrsTHQ2w483/VBxRXvCbyrdyxdjC5KtvgBO1dVotO6OeV4d
         KUGnjvUyUAMBFmR5ZD1rgjl7G0JZ40QO8/sBO5idSZprZVyJ0ka2dAg+5MVBGR21lT8R
         emZipEeUdxprmUdDUOrvAN9XSJqERx1rn9Tr5Oy/fXBr6bSULnqVsPT2LcTHyR3+Nwhy
         jwueGRW4e5RBXSWiESm/PVszs35uKfrrd0XstDLtoHO7nd4qxIRZznEYd5UJM5SSQ4Ih
         WnmdjxpASp3I3XdtVZNBWfRB42fc0AvdVh9g+PSjHFGXDSPwNBtRxkXKwyBFQ/P9MQ5J
         ZdDg==
X-Forwarded-Encrypted: i=1; AJvYcCUYwXeUvtrnhuz1gYOpnSDJIL1bTRPwOCJMYESr+17cI8p1ON/0VsVLN8jx2jppI2E0skUplWs9+Z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRxNlVuHhSZNFm2bZ/rrtOCbGemiYdPyk0yk+rGgEuUu6W3+u
	o9nth3a9qt5iDCpWxIfexfLLLtfR++a2Njgah+rkhgqH3HDoxEcllU6gxPPk/oMdb04cVNnNwQQ
	9oQ==
X-Google-Smtp-Source: AGHT+IHjc5ZLZhZO4yqODQfWgu8dTczDRkwNxYxeF24WjbzoHSIrJ2b6845temH7KCaPhLrQvd3TNA==
X-Received: by 2002:adf:f64e:0:b0:371:8dd3:27c8 with SMTP id ffacd0b85a97d-37a42279eb8mr11620314f8f.23.1727118740939;
        Mon, 23 Sep 2024 12:12:20 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612df5cfsm1285136766b.146.2024.09.23.12.12.19
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 12:12:19 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-378c16a4d3eso5126082f8f.1
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 12:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXExTWxJSRO6Hg6wEcmt8rfLryviFXjJYz61ocuLbXxl5Raaio0DxoZ58WPGjhxbnQFu6SxjAcQSSU=@vger.kernel.org
X-Received: by 2002:a5d:4741:0:b0:374:c6b8:50b5 with SMTP id
 ffacd0b85a97d-37a422783aamr9933862f8f.17.1727118739230; Mon, 23 Sep 2024
 12:12:19 -0700 (PDT)
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

