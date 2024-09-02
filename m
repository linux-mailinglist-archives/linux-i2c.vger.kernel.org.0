Return-Path: <linux-i2c+bounces-5992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD49683CE
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 11:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 195691C226A2
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 09:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACCC1D2792;
	Mon,  2 Sep 2024 09:55:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34EC76035;
	Mon,  2 Sep 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270947; cv=none; b=gfZoYOXFz8ml1FIQcbOs9Zs1hkmaNoHTZXh1Xjw9ouLrnAY1PypP4XZvXvi6tAWGwf6U+YxXU9XbklO2VPFVEAIb8spxvc6DCCI2xGfp3vqgud+LUlb8GDiigjD0Kk1+NtHIxVg9RC0IAvm7HpcALvtNqQlEBlEWO6ekZFOhemw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270947; c=relaxed/simple;
	bh=N1G+YOdCXmW6ZM5XS6QgL8CFfLIUCedjbdwaaDSoylU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+QJ2Lpu8qNHIOqI6FtiCqnbKUjfAATw0LDF1d8JcctV56mDdhMzv9mCjRix87onZPxDh1w44AbznpNOxnvPCERRlJg4V+EIXrGawRwNeJOAspHg5RRcwMZrM9Bz3RVK/cgK5VFSvbdX6MgxhaVMbOknsYP0k4lP2wsUxzcNUVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6d5893cd721so15636517b3.0;
        Mon, 02 Sep 2024 02:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270944; x=1725875744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MAn5qVpDY22aHv+DFM/MBUkQ/9x+sYh3IxT5133w4g=;
        b=bK5B73Tpd6I9+GDHybEefl/xaREHvldjWWRw7ajEQZa4xbqdGmDWkoyYrSxYcJM1iz
         guWww2HSGX1wH/b7X0TQSeAZ7mHTIEqalvvoH0rcZA9xSWu+qqfgbmWhEmwlHcI5o5HC
         KHLMUvhGNdkC5juDHfKjNn4irM8cJZe9uDvU39Bbdb+AC5fltuDdQXQ1ofp8kV8GjOoS
         mZ/tBMH/DLWMnyAshwttpu2qQuLm11rzDV1Wi+yEHsdceMcPbIh5iR5NA/tH/D/UdB9d
         3fkMn2+VeOQqOqD4KcweBvODHzh0mwO0gH76HoZ0e8Ypf+YvuRNQX0Rrf8zAz+M9lBuw
         5UPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTWtkwNloUMkuOnUWjRUffK/U1k0mjceQgayGItGJtqMP4PsD5zjMrcjQPSQhyMfYfUBSeSCvyTaQ3@vger.kernel.org, AJvYcCXZsJfADVvUPAzePPsF0oI4kI9pqc1w2B4xCqr2YH1QazRWph2sjgQCHPofzGyK5r+hIkjbR2il2iml@vger.kernel.org
X-Gm-Message-State: AOJu0YyP+1JRDvAjlhRkJmGmnVZw2NPB5QwDWVmBHD3c5xrVyna4JsZG
	csIwKxXLYEC3vespyHXlWw5cFL9lNEvVzjrR7wCXGB5fLPDhlW4nROf3yncO
X-Google-Smtp-Source: AGHT+IEJ+ptSMdMs26WdNp0s8JHpnHf+1nwtv1QlQhRD1U9a+bp1XcduxpH0bJSM/9wkGKfF4t4VjA==
X-Received: by 2002:a05:690c:6309:b0:6be:2044:9367 with SMTP id 00721157ae682-6d40e17ff2amr112413307b3.15.1725270944361;
        Mon, 02 Sep 2024 02:55:44 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e15dsm15247087b3.66.2024.09.02.02.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 02:55:44 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d5893cd721so15636357b3.0;
        Mon, 02 Sep 2024 02:55:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWCOH/kIGAaw+t0W2WsGzDqna50Je9b7LJGOBMwoQVSwzI24ROo0oYqKW1mhYWYjNhwpzK27ARZTzG@vger.kernel.org, AJvYcCXlDuO63eonStLW66r8CsBLHHjuU71fndhbVCsHsVdpWy0+qiZcPKG+CAKIa63uxYWgfDwCBFVqVwRz@vger.kernel.org
X-Received: by 2002:a05:690c:62c6:b0:6d7:4dea:5f16 with SMTP id
 00721157ae682-6d74dea5f7bmr31804377b3.26.1725270943798; Mon, 02 Sep 2024
 02:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
 <20240826150840.25497-5-wsa+renesas@sang-engineering.com> <CAMuHMdXiOLPm11-nBnFPC4pRa0WP1VviwCwYVVPHAeHLgXLe0g@mail.gmail.com>
 <ZtM3Ufj1akqZckuu@shikoro>
In-Reply-To: <ZtM3Ufj1akqZckuu@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Sep 2024 11:55:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEBVoBmWVKiVYcKp0As6mo=C9u-bHFwt0zPeRbAgCkvQ@mail.gmail.com>
Message-ID: <CAMuHMdVEBVoBmWVKiVYcKp0As6mo=C9u-bHFwt0zPeRbAgCkvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: document
 SMBusAlert usage
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sat, Aug 31, 2024 at 5:31=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > IIUIC, this is not a property of the hardware, but a side-channel
> > independent from the actual I2C controller hardware? Then a generic
> > "smbus-alert-gpios" property sounds more appropriate to me.
>
> It is not generic. While it is true that most I2C controllers do need
> GPIOs as a side channel, there are controllers having...
>
> > BTW, are you aware of any I2C controller having a dedicated input pin
> > for this?
>
> ... this. Check 'i2c-stm32f7.c' or 'i2c-xlp9xx.c'.

OK...

Still, this interrupt is not a property of the R-Car i2C hardware block,
so it should not be modelled as such.

To me, this looks similar to hardware flow control on serial ports:
some ports support this in hardware, other ports need to use GPIOs,
or board designers may still decide to use a GPIO anyway.

See Documentation/devicetree/bindings/serial/serial.yaml and
drivers/tty/serial/serial_mctrl_gpio.c, which uses GPIO interrupts.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

