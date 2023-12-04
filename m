Return-Path: <linux-i2c+bounces-600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C215802C7B
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 08:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69B51280D0B
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 07:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7EA1774D;
	Mon,  4 Dec 2023 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G1gmXNpr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC22194
	for <linux-i2c@vger.kernel.org>; Sun,  3 Dec 2023 23:53:45 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bf7bc38c0so675232e87.2
        for <linux-i2c@vger.kernel.org>; Sun, 03 Dec 2023 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701676423; x=1702281223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SzWfC6WDG0HEDP8yk1dI76L7Vjoulwh6flVXPbKqmw=;
        b=G1gmXNprbCprtMygGCN3TP+iUIH45Nhj5aH5ytMuBnhD4sYtRVa9bgvHZwHLStsUl3
         5nxZ2yBAzaYFot27FHzpvORKMtOK6RcoVFrRe0tDMVSjhYjyaUuZvw3B+C18WHWmIzC4
         Rqu9/Jcq/bJu306I6WCfqZROzwFqQwyxegI+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701676423; x=1702281223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SzWfC6WDG0HEDP8yk1dI76L7Vjoulwh6flVXPbKqmw=;
        b=ISZwfjgGH51KCWePPngY1p/kkH6vo6GwFj7zQC7Ew78OABozWio9hStxErMGqZmEtY
         frLbDorImHg7WdT3bnaTe0pVYj9J+G7lIw4fMtQ+i4M1ShkPu2jj0nDUU4RGb9x55uku
         2uSh0dxoqzEH58/Ta5pknkU+A+z6bsuQuMA62CbDfM11D0USFtvVU16Tsn7aEQvlWtJ0
         o4t7OZfZyUGmHrPcSCjH5JdTinpnluet5/HqVqIOu1sbe1Bq7dUVKbRQ4Uzn6BBbFhkC
         1YqAPOIro2NVaodwbN1Ghau+2JwE2b7Ut2R+C68on6DcRRt+mOYlDYxbUon22LI8+tLt
         GWBA==
X-Gm-Message-State: AOJu0YwZ9huHZPqJrGtCSof8q0tpGtr7s3/LbGo5fYV8t1R6ZfqJVMCm
	iHbUiz4oMSb4cpU5SaEJ//HrG3CzVHut0UUxh1/x+A==
X-Google-Smtp-Source: AGHT+IGrPmPXLIsd+pzC6dzwBwPyO8KWCO9Fyx9YUVOkHlF5xJpwelZzOKlQkT88eTqzfYlBmWVj2CBHMAJkZ8Aj9xw=
X-Received: by 2002:a05:6512:3088:b0:50b:d764:64a7 with SMTP id
 z8-20020a056512308800b0050bd76464a7mr2985712lfd.92.1701676422869; Sun, 03 Dec
 2023 23:53:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
 <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com> <CAGXv+5Hz3wfjCRa2AiOQgOv7zo8bzAmtG=a=jWJhO2MZNrFtpw@mail.gmail.com>
In-Reply-To: <CAGXv+5Hz3wfjCRa2AiOQgOv7zo8bzAmtG=a=jWJhO2MZNrFtpw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 15:53:31 +0800
Message-ID: <CAGXv+5HQeXPyRVFXaPKwX6GDoeMVM0Sneqk4CJx1AWGYT-mAEg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
To: Doug Anderson <dianders@chromium.org>
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

On Mon, Dec 4, 2023 at 3:24=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > >
> > > @@ -61,6 +61,17 @@ config CHROMEOS_TBMC
> > >           To compile this driver as a module, choose M here: the
> > >           module will be called chromeos_tbmc.
> > >
> > > +config CHROMEOS_OF_HW_PROBER
> > > +       bool "ChromeOS Device Tree Hardware Prober"
> >
> > Any reason that it can't be a module?
>
> No technical one. However if it's a module, the user has to manually load
> it. So I think it's more of a usability thing.

We could probably manually add module aliases. I thought about aliases
against the machine compatibles, but there doesn't seem to be a device
for it to trigger. Or target something common to ChromeOS devices like
the EC? It's really hacky though.

ChenYu

> OOTH I think this needs to be a module if I2C is built as a module.
> Somehow I had thought of it at one point but then it slipped my mind.
>
> > > +       depends on OF
> > > +       depends on I2C
> > > +       select OF_DYNAMIC
> > > +       default OF
> >
> > You probably don't want "default OF". This means that everyone will
> > automatically get this new driver enabled which is unlikely to be
> > right.
>
> I thought this whole section was guarded behind KCONFIG_CHROME_PLATFORMS.
> So if the user has CHROME_PLATFORMS enabled and has OF enabled, they
> likely need the prober.
>
> > > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > > +{
> > > +       for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++=
)
> > > +               if (of_machine_is_compatible(hw_prober_platforms[i].c=
ompatible)) {
> > > +                       int ret;
> > > +
> > > +                       ret =3D hw_prober_platforms[i].prober(&pdev->=
dev,
> > > +                                                           hw_prober=
_platforms[i].data);
> > > +                       if (ret)
> >
> > Should it only check for -EPROBE_DEFER here? ...and then maybe warn
> > for other cases and go through the loop? If there's some error
> > enabling the touchscreen I'd still want the trackpad to probe...
>
> Makes sense. However there's no extra information to give in the
> warning though.
>
> > > +                               return ret;
> > > +               }
> > > +
> > > +       return 0;
> >
> > Random thought: once we get here, the driver is useless / just wasting
> > memory. Any way to have it freed? ;-)
>
> I don't think there is a good way to do that, except maybe marking all
> the functions as __init? But that likely doesn't work in combination
> with deferred probing (say the i2c driver is a module).
>
> ChenYu

