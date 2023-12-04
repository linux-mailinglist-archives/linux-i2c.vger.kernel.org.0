Return-Path: <linux-i2c+bounces-607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21401803AD3
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 17:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13FB280DA0
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 16:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7241128E3D;
	Mon,  4 Dec 2023 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MrxO8J5F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CD9B4
	for <linux-i2c@vger.kernel.org>; Mon,  4 Dec 2023 08:50:41 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1b03886fd7so223287966b.2
        for <linux-i2c@vger.kernel.org>; Mon, 04 Dec 2023 08:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701708638; x=1702313438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8E333mX0LWpYdsutAHYgoOIGzA9DDLQh7glRXD1fJM=;
        b=MrxO8J5FnBfMYJPpXZeaHmjExUVo6fckVZ09qMyo6cpBlfZ7hF/BXTNxzov7OJB+Wg
         U0+L5FGKNDDLbYu7eMr168/zOWWj7rJDa3GTGQ+ZwmZ2qOFy85oYi/rk40c/mEwQe4Hh
         noDp1hx9vgoTnm/QxBc9xiYudYiUGex+2MP8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708638; x=1702313438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8E333mX0LWpYdsutAHYgoOIGzA9DDLQh7glRXD1fJM=;
        b=uYLkig+wnLuToIhgs0hIRIZHjZhNtJGNBo0w/vo4EmP2hMi0eljUJ994XhS7dkRstg
         bkjTqW+YHggumX9OfRzV3/D0gCVmWVqXQ4m4lA/eVGAUZzLx3GJjRcM3cFaDxCZgLYRX
         qoLra1bIbGyPLUm+/egaaVb6iC3zk+/GtVh2nYcZgejrA2vrX/Jjs9UHrqU12gzbR7t8
         X95qeG6B+HTuReRVR+X/ssW5MPMOdiMjbBKbyff5OjuJ1zZTQLucIE93yO8IQvX+PJjd
         Wpg6DuNUt86xupCkkZKtWRSkGn6si1Ko9uamb0XlzSfU8RtFlpz2x8eWVhfie/6FdXg9
         hSHg==
X-Gm-Message-State: AOJu0YzD5i1wjUM96R4zgG2eJ8HTBcXoWdwDjxmFIDgBk9YuB33rV+IB
	WIpq0AkJflPR6Rc0X6RcALfidYxQswROcxBgb2zWlPnJ
X-Google-Smtp-Source: AGHT+IFrZYivpM6ZHJYQNXW3MvBvQetU4gHaBZ61eKJ+WY6PG9yPHcRvzjmBCCUaY0WCEnFQ2l5ncQ==
X-Received: by 2002:a17:907:6d17:b0:a19:a1ba:da56 with SMTP id sa23-20020a1709076d1700b00a19a1bada56mr3688917ejc.125.1701708637866;
        Mon, 04 Dec 2023 08:50:37 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id hp3-20020a1709073e0300b00a1b77475b93sm1209829ejc.5.2023.12.04.08.50.37
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:50:37 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-54c79cca895so16430a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 04 Dec 2023 08:50:37 -0800 (PST)
X-Received: by 2002:a05:600c:5247:b0:405:320a:44f9 with SMTP id
 fc7-20020a05600c524700b00405320a44f9mr414355wmb.5.1701708616473; Mon, 04 Dec
 2023 08:50:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com> <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
In-Reply-To: <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 08:50:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
Message-ID: <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
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

On Sun, Dec 3, 2023 at 10:59=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > >
> > > @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
> > >                 reg =3D <0x2c>;
> > >                 hid-descr-addr =3D <0x0020>;
> > >                 wakeup-source;
> > > +               status =3D "fail-needs-probe";
> >
> > While doing this, you could also remove the hack where the trackpad
> > IRQ pinctrl is listed under i2c4.
>
> Sure. I do think we can do away with it though. According to at least one
> schematic, the interrupt line has pull-ups on both sides of the voltage
> shifter.
>
> BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups on
> both sides of the voltage shifter as well.

I dunno if the convention is different on Mediatek boards, but at
least on boards I've been involved with in the past we've always put
pinctrl entries just to make things explicit. This meant that we
didn't rely on the firmware/bootrom/defaults to leave pulls in any
particular state. ...otherwise those external pull-ups could be
fighting with internal pull-downs, right?

-Doug

