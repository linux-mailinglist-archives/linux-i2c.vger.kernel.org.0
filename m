Return-Path: <linux-i2c+bounces-6940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD797F124
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 21:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8381F22B35
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 19:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C34D19F407;
	Mon, 23 Sep 2024 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VLVdHGRv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEE71862F
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 19:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727118774; cv=none; b=B4KEA3xkh6s5RRfXLtoFWzo3VaXJ8195Cy6JRAv9NtbkghwN7dMlWIbwNpIp0IFNDF7V0/5zjLyFKybvkYRJHo/aaZxIXIfTBZAhsqaLRzmf0PDkKAF9Z4qkVcStHASzdu29SsLWYg7cS6cus4mkkAiyfewMXdTU34v80AbMK6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727118774; c=relaxed/simple;
	bh=xf364lZIbnjp5yXv/kYTrKS69WYtJ5dXPHV7dU2ANQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XB23Ha7fzF3VUYbe9oMfZWW4jNLsttUsLnVghaIfkw+3WK8OFPZia7snM1DAXkt7qgoNFgceJzwhC5XsQVhqbRstMoAOuuWt6p4WZgOgOYLKM62DlR/u5iPKIlZJUD1uxtdaMVJaJZX8Drt5cQFXDjDCnOeCAPvKzlFyLPX4Enk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VLVdHGRv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365aa568ceso5471183e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 12:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727118767; x=1727723567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=VLVdHGRv5+8uxRxVimW+5h3ce6VYR8VSSD5VxCcPzaBa5I0Orp86kZjAN9gBrlPVMv
         a/zD9E0zgFIRTIUAkO25z/ZlCJghsYh+vau8IEeaKxcyNEyyIKbiVwa2T42BhGKUe+oA
         Pfjlg7EJvRtpywaqu0Uon5ZXQlWFL3XZCWffo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727118767; x=1727723567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=LYFEcC9LOJQvUisVZcjW8U0wt9vqYD8O1YE1D8GDzuzMGJEAHuiZTu7E2Er+rc0Yyx
         bGD1mmFfJGZIMDsMNSbcOB4oWzMd8SVVZoGAkk91OQ65syMrCejxD6qnikgtK+VrLFLC
         of/cOiAbRqkSul3X6c2jLmvH7JjSZTMwN663DO+TBaJk5GA/Y97YFJXSKGCxtBG8b1u+
         eKfy5u/Fjsz/wOp0OiGf/xaygPDOeG8TP6wcfHFc3FZklpBYBENDI37PwNu2szyUNzVX
         DgzNaiO099vnOU3oEy9kJLVg4X2h4Bk3nEzs/dcaE9C7QthvJsmiyodJDymLrrQKSL9r
         5oAw==
X-Forwarded-Encrypted: i=1; AJvYcCXfOatpmTkco9uCSF445XcgK0uNWndUHQ4O3C5qR5ukPVIkEwB4AbXLX3KwcdVitOUIj38RFoFBONQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT5GZ9HEGpfBpG4QgeVKcMy59ovyqJhCKmBt6WyLlchDPq8bmh
	8S446dPx+bHqndxrsWAsKKw3cKn+qkPcnNr8igakSTXeSaUBhp1zKuu37IeH0KvOhQBEs2Sv8xm
	fmWGB
X-Google-Smtp-Source: AGHT+IFdMt+HwnHu/4cU/FneqtXR/guzn6BgC8FVzTX5FXIB9vA13UBYsEE2Cneq8ea5B0eqDyRKEA==
X-Received: by 2002:a05:6512:31d5:b0:530:dfab:9315 with SMTP id 2adb3069b0e04-536ac2d91bemr8959029e87.10.1727118766590;
        Mon, 23 Sep 2024 12:12:46 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870474fbsm3412733e87.60.2024.09.23.12.12.44
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 12:12:44 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5365aa568ceso5471034e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 12:12:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCb+p+7rH/FsL56mhNasaWVQ6NWpEhME2XUuGPPoz9yob1cKDoEjY1tuwDrQY2ZNO07h+WHm/RBYI=@vger.kernel.org
X-Received: by 2002:a05:6512:2309:b0:536:5625:511f with SMTP id
 2adb3069b0e04-536ac32f109mr8497177e87.45.1727118764064; Mon, 23 Sep 2024
 12:12:44 -0700 (PDT)
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

