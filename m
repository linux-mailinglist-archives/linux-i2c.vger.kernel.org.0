Return-Path: <linux-i2c+bounces-5813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB69B95F517
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 17:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6934B2815AA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 15:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B08192B89;
	Mon, 26 Aug 2024 15:30:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79CC14EC4B;
	Mon, 26 Aug 2024 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686230; cv=none; b=pYpMPGsGMdK3PlwZUjD406S3WxOnUPnlAjYO4Z0vLsWd1W+43LneY9csnrNCqLUCFGDN4PVbHFfOHLklhgl0uKxGn0hkRQ3K8hSiwYpadsgF3ZzegWReCZbLPrfGO4GoIWPL0SAWNZ6vxHqbAwbSLovu4/dF2FkOfG0I/D3q2Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686230; c=relaxed/simple;
	bh=WPP9IPbSh3gSEgOX/R0IsF0vYrSTY/jGWNbjR/FCmpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fnB7iuFGtQn7GXu/j60DiKCvc0dj22Fr1PeqszvEUjsHTHQ/nchUozsoveFEBY5ERs7hdIwvz3hp/9tgTQ2F4EwyUX4pbWWQyTMacCelYeF5kr+NNUAACTDvZEswX3YNWGHkGR8350/+HvZZrsONepsc5xu7SV49WQg3ppsLtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1659e9a982so4868420276.1;
        Mon, 26 Aug 2024 08:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686227; x=1725291027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q38riKSecEk+MIX1Urenkh8wdSVZJbYS3R8MMSdNR8U=;
        b=hLiGw62/1LCzNiCqavgqqrmv0tQqtfeTHFPXty5Y0oGdJfAcXZjJflRSUoiQRPveI2
         TqC00EASlLd+FrKFIfGWxsKxtEoVbtPY4h43aQluNM1jd//SmlS7p50H6qVd6Kn1sOXM
         p606RP99X6S+pbrw9S6wQgAzwZRxB2H8XDhrNSotmN4HPuPsU7dvLWIBe1vy1RZHyvzC
         bWbkfFPwKfy/Or9oq2D5BONpv4U3luxoqQJWsN/BOUGpYamWyimEQMC46s+y/76EpEy0
         tLES5JtKrZt5McffD66HoIkH1n/Z5LT5zjdnd2vnXGdof6oGeckD2hxLSS32eFlgjrXo
         RUMA==
X-Forwarded-Encrypted: i=1; AJvYcCUds79JV3f1pKHRmarXKgE4IbNOMBDC7hWvXv6jglTvPxvboFhidNIvG5TxdKxyJZ5qCbQ7QIIrDYLQ@vger.kernel.org, AJvYcCUnPQnil02BXR33P1vWjCrHsXGiTez8ODO+yT3PM3N4BRn3iCPBxhIynG9Ak+bPN2gjw0Eb1SqsAS+w@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOj8jtnCchN/QuhB5hfKqmuMZ59q3616BbRzxu4fSjs4Vxpvy
	Xw9q0BZtU335nUd6Qef5N0/sIQcI1XogYPHpkc0z9djrkctaRrWOigO/PCAN
X-Google-Smtp-Source: AGHT+IFjN/GKyShpMImByQj30Rlce96wuw0SxaUtWVNCtMb5kCKpB311W+FDxeS0uC+gJckC2OUthg==
X-Received: by 2002:a05:6902:260f:b0:e11:5916:361a with SMTP id 3f1490d57ef6-e17a83ce9b6mr11516845276.21.1724686227307;
        Mon, 26 Aug 2024 08:30:27 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4638c5sm2015215276.18.2024.08.26.08.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:30:26 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6c0adbbf2eeso36134497b3.0;
        Mon, 26 Aug 2024 08:30:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2CiltHZhE+OvAw/36rLCI0cPNuE4a97qyUOPwNSPQD+nJNh2ppXYmhBQVzH/cnA3jZ+r3qHR4dSHj@vger.kernel.org, AJvYcCWDP5siOKBC7p7KVshWuMBz/d5O8aXXcNTPNekowJSkkkS3GNJs54bm/pZk4/IcmAIcHez96Kfx5NW7@vger.kernel.org
X-Received: by 2002:a05:690c:7684:b0:632:c690:d991 with SMTP id
 00721157ae682-6c6286b930cmr106507837b3.29.1724686225908; Mon, 26 Aug 2024
 08:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826150840.25497-4-wsa+renesas@sang-engineering.com> <20240826150840.25497-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240826150840.25497-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 17:30:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiOLPm11-nBnFPC4pRa0WP1VviwCwYVVPHAeHLgXLe0g@mail.gmail.com>
Message-ID: <CAMuHMdXiOLPm11-nBnFPC4pRa0WP1VviwCwYVVPHAeHLgXLe0g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: document
 SMBusAlert usage
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, Aug 26, 2024 at 5:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Question: Should I remove 'smbus_alert' from the enum of
> 'interrupt-names'? It is already documented here:
>
> https://github.com/devicetree-org/dt-schema/commit/c51125d571cac9596048e8=
88a856d70650e400e0

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> @@ -60,7 +60,20 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Without interrupt-names, the first interrupt listed must be the on=
e
> +      of the IP core, the second optional interrupt listed must handle
> +      SMBALERT#, likely a GPIO.
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:
> +        - main
> +        - smbus_alert
>
>    clock-frequency:
>      description:

IIUIC, this is not a property of the hardware, but a side-channel
independent from the actual I2C controller hardware? Then a generic
"smbus-alert-gpios" property sounds more appropriate to me.

BTW, are you aware of any I2C controller having a dedicated input pin
for this?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

