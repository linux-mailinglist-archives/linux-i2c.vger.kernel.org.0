Return-Path: <linux-i2c+bounces-597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A072D802BA1
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 07:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43FD5280CC1
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 06:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050808F58;
	Mon,  4 Dec 2023 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cxx1r+XX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED11FDF
	for <linux-i2c@vger.kernel.org>; Sun,  3 Dec 2023 22:28:32 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bc22c836bso5462156e87.0
        for <linux-i2c@vger.kernel.org>; Sun, 03 Dec 2023 22:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701671311; x=1702276111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKeCfLZc7mdf5ttEOE5xpGWsNMCS5nBu7bohK0rYA9k=;
        b=cxx1r+XXew+5s+HnBUjs9bSZmFf1RrhwwZDVsG1B+j/MITFaoTbHWKgHOhiW3qydkw
         s8tWVThoy8yct0MUtGo7xf9dTnNaJNzDqfMIBThvpiF1MADlftto1/VQnB9Jg/jN9swv
         qtbTm3gOL0TojgktRRfmW992C/4HWC0BarWkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701671311; x=1702276111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKeCfLZc7mdf5ttEOE5xpGWsNMCS5nBu7bohK0rYA9k=;
        b=dYM7ub2lEo3rmV2H79ckA/npvZ4uDZehJIhawhxn/j80vrlxqCB14L5wWHYA+3h4xZ
         p3dW/siafY3E+E0Xtj8bXWkFsHp0C/BNGM7Gm0RqjIBmKCFHpWTpePttS3f+m20Ahui/
         oHSxpmTV4aVdU58x5Ylrvf9wPZthB9fGMiXPPsUakIequB1q3PzsJN84blZqTz3Pox8M
         vFYrnY6rnBiijXGi8yYuZJyNSnkZF8Yfdqj96P8GkanJw6b5jRxde+E2YIavHDAPhc7C
         Iqc9I78MsROa4N5UZ1wr8CvCIPKf/GQJkc2B/9fHvDyx286wJj9Qm9DmORZBQwMajcr4
         VizQ==
X-Gm-Message-State: AOJu0Yw6Ot5BCAHTQpkkx643NERdmbxWXAELJmb/IS0qBfw710vIPGIX
	J2EUrMOYxwd3uGaa2R7QlrnDao0IJDPJx/TkLqE4iQ==
X-Google-Smtp-Source: AGHT+IG95fL6ZmhFrrdBZs1yHZpwJEkMdnWR6Z3TRg/FZYz0mqiHrefYfWV2agXhFMwbCcFaJSeavkE3C7jpb9RAWYc=
X-Received: by 2002:a05:6512:368f:b0:50b:f88a:dd63 with SMTP id
 d15-20020a056512368f00b0050bf88add63mr334344lfs.102.1701671311129; Sun, 03
 Dec 2023 22:28:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-2-wenst@chromium.org>
 <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
In-Reply-To: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 14:28:20 +0800
Message-ID: <CAGXv+5GiwgF4CJBPT7JucV8qEMY0jLAvT3TqRzvLjCKcVMZ0Mg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] of: dynamic: Add of_changeset_update_prop_string
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

On Sat, Dec 2, 2023 at 9:01=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -1039,3 +1039,50 @@ int of_changeset_add_prop_u32_array(struct of_ch=
angeset *ocs,
> >         return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(of_changeset_add_prop_u32_array);
> > +
> > +static int of_changeset_update_prop_helper(struct of_changeset *ocs,
> > +                                          struct device_node *np,
> > +                                          const struct property *pp)
> > +{
> > +       struct property *new_pp;
> > +       int ret;
> > +
> > +       new_pp =3D __of_prop_dup(pp, GFP_KERNEL);
> > +       if (!new_pp)
> > +               return -ENOMEM;
> > +
> > +       ret =3D of_changeset_update_property(ocs, np, new_pp);
> > +       if (ret) {
> > +               kfree(new_pp->name);
> > +               kfree(new_pp->value);
> > +               kfree(new_pp);
>
> Given that this is the 3rd copy of the freeing logic, does it make
> sense to make __of_prop_free() that's documented to free what was
> returned by __of_prop_dupe()?

Makes sense.  There's also one in property_list_free(). I'll add a patch
for it.

ChenYu

