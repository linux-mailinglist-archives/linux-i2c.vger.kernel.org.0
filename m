Return-Path: <linux-i2c+bounces-606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC53803992
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 17:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DFCD1C20A4C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 16:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D522D615;
	Mon,  4 Dec 2023 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ArzIiCH6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA4395
	for <linux-i2c@vger.kernel.org>; Mon,  4 Dec 2023 08:04:26 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1b654faa8cso182610566b.2
        for <linux-i2c@vger.kernel.org>; Mon, 04 Dec 2023 08:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701705863; x=1702310663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fXQC8kMEIVpKhirV/8r5WlQUD6sGUWR7e162LHNTZo=;
        b=ArzIiCH6G3huoVVlm4nAo3S1W9v4NAESzcEiRQHLx4KrscXG0dXjKiQQySw1YfPiG4
         mb0sEuXlxn/vjITM8xu6qBQkAHfSZ9Tb4dhv5u4ilX0DHXfO8TZW74t7jn4E7YkdeJL/
         j/phLAnb+mroBOycvdhzOWE/wMTMkNeuf4cH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705863; x=1702310663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fXQC8kMEIVpKhirV/8r5WlQUD6sGUWR7e162LHNTZo=;
        b=eViGYJ33FblzD71W5X9mqHYPmyBzoPKTOFZXvucIJQ4k4M38oZX8M8q+Nx8t4RUWdb
         QksO5FltaB3if1p4UrGUrYQeiPiKspvyqoyWnqeLEJ0vdW4FytcZO2g76kxJD56XI/mx
         eN3YBcB9yxOlRmMEXaMhgJBLSsb+RyeIEvQ9viicig9Inq7uMiTCaIgPfRkUS/8KTb5x
         PPlUhy/2b1RvcwYS3f/+828mQv5w3wMYbm++1h1p4aHeNlmuxehKxl4pAyDQpNKadNGZ
         /s3Qpox39TBIVMA97/vVV5RYtGoiM0tVoIv+JgF9gYxgl8+ih+SP16HAWdwWryIqHVp+
         nRjg==
X-Gm-Message-State: AOJu0YyFPqlKA54OfIhRkv5bixTUtC+1dJAjS4IFpnCDX+pb854qyUHO
	Nz4W1tAhXxSDYBNwDbpeRvZNGwySwFKCI2syEjyoL8Mc
X-Google-Smtp-Source: AGHT+IE9qq2v5921q1o9eI7/hqM1bKQ+P2QR0FW/Qhvug9x0euxwNECn4IkH+H4uAhFT+yEE/K8dPA==
X-Received: by 2002:a17:907:90d5:b0:a19:34e1:990a with SMTP id gk21-20020a17090790d500b00a1934e1990amr1276049ejb.22.1701705863454;
        Mon, 04 Dec 2023 08:04:23 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id b20-20020a17090636d400b009dd98089a48sm5447522ejc.43.2023.12.04.08.04.22
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:04:23 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b367a0a12so96635e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 04 Dec 2023 08:04:22 -0800 (PST)
X-Received: by 2002:a50:99de:0:b0:54a:ee8b:7a99 with SMTP id
 n30-20020a5099de000000b0054aee8b7a99mr280850edb.0.1701705841514; Mon, 04 Dec
 2023 08:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-3-wenst@chromium.org>
 <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com> <CAGXv+5EpA531O1tW=h1RvK34+LMvtdve3=cNmfN=2+9t1jL_bA@mail.gmail.com>
In-Reply-To: <CAGXv+5EpA531O1tW=h1RvK34+LMvtdve3=cNmfN=2+9t1jL_bA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 08:03:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WtvPUD+tXv0GghreG3w5yWedeHTYzhk-LNzf94fJ6B_Q@mail.gmail.com>
Message-ID: <CAD=FV=WtvPUD+tXv0GghreG3w5yWedeHTYzhk-LNzf94fJ6B_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 4, 2023 at 1:53=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> > IMO you should prototype how you're going to handle regulators and
> > GPIOs before finalizing the design. I was going to write that you
> > should just document that it was up to the caller to power things up
> > before calling this function, but then I realized that the caller
> > would have to duplicate much of this function in order to do so. In
> > the very least they'd have to find the nodes of the relevant devices
> > so that they could grab regulators and/or GPIOs. In order to avoid
> > this duplication, would the design need to change? Perhaps this would
> > be as simple as adding a callback function here that's called with all
> > of the nodes before probing? If that's right, it would be nice to have
> > that callback from the beginning so we don't need two variants of the
> > function...
>
> So I think I can prototype designs with one GPIO and multiple regulators,
> assuming each node has the same number of both? At least they should if
> they're on the same connector.
>
> More than one GPIO probably means there are some ordering and timing
> constraints, and won't be as generic.

I was hoping to see a prototype of how this could work in the
non-generic case where the board needed a custom function to power
things up. It seems like we'd still want to be able to use your code
for probing.


> > > +       for_each_child_of_node(i2c_node, node) {
> > > +               union i2c_smbus_data data;
> > > +               u32 addr;
> > > +
> > > +               if (!of_node_name_prefix(node, type))
> > > +                       continue;
> > > +               if (of_property_read_u32(node, "reg", &addr))
> > > +                       continue;
> > > +               if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I=
2C_SMBUS_BYTE, &data) < 0)
> >
> > I'd be tempted to say that the caller should be able to pass in a
> > function pointer here so they could use an alternative method to probe
> > instead of i2c_smbus_xfer(), though you'd want to make it easy to
> > default to i2c_smbus_xfer(). I could imagine someone might need a
> > different way to probe. For instance if you had two touchscreens both
> > at the same "reg" but that had different "hid-descr-addr" then this
> > could be important.
>
> I'd say the only specific probable type is hid-i2c. And that could be
> generic enough that we could incorporate it here if we wanted. However
> I think we want to keep the initial version a bit simpler.

I don't mind if the initial version is simpler, but I'd love to
understand how this will grow. It doesn't feel terrible to take in a
function pointer that will probe the device and then provide a
function that callers could pass in that simply did the simple
i2c_smbus_xfer().


> > > +                       continue;
> > > +
> >
> > Put the "break" right here. You've found the device and that was the
> > point of the loop.
>
> In its place we'd have an if (node) { <enable node> } block. I guess it
> makes it easier to read still?

...or perhaps an "if (!node) goto exit" block and then you don't need
indentation? Essentially the loop becomes the implementation: "node =3D
find_the_one_that_exists(...)".

-Doug

