Return-Path: <linux-i2c+bounces-579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B32BA80192E
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Dec 2023 01:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2156FB20DF0
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Dec 2023 00:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E030F15A3;
	Sat,  2 Dec 2023 00:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UkLzDfSX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C986719F
	for <linux-i2c@vger.kernel.org>; Fri,  1 Dec 2023 16:56:48 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bc4fe8158so3939849e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 01 Dec 2023 16:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701478606; x=1702083406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=;
        b=UkLzDfSXj6En1fruWZH/hf/Vg/9m+NPgyAvAnj8wOMkasicTp5/2ooO49S0IkhpP6K
         vrC+2jImmFg/wGo2KTHlDg+TTei2nUe1Zt1NLFuMArweKlDjZyYLfurrzaoWDN9ohI3o
         qUBHz9maVsji1Q4Gyu32djk1w2XWWpzREuH/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478606; x=1702083406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=;
        b=Y/3941xjKoXyvCqHkO+3P0spzMdjXQSDV351NL9gzPezmx42QnXoswmTL1vvPIcldf
         Qy9DXZ33QgBfPAhDsLifn4+IAAkJ+dNqTWt01XBnUM8DlDRlg7scfZ7dH+ypZWk5TMlg
         xnijZp98lU+lIigc3Oze8qwZJMOfr5knoCi4CxzatUkdbBJaFRIthhL2jUEPLv4B7EvM
         ca6eFMIpMhuZ77JnYPjpFi6msVOcIlKTQPp/b9br0LbfQL4/++21MjrMhhc/TpXVNr8y
         dETw9SV5vq1gegdb8Chkd4l/PIMUNKAUgFqW+mx7nDI5NAip+MAzOoFySPXkH/4llS25
         82pA==
X-Gm-Message-State: AOJu0YyWv+dGKkDvmw4Y/i+kWatqHhsBHc7J/KIySy0m5aep0uBOQqpR
	uBYoSeMTmFwnpPWo7Aq1muukdjfnd3uxUMKhY469pyMo
X-Google-Smtp-Source: AGHT+IGVPCTyDIQBWpmMPQGS+Ii15FWoMP+wkAJ+qg8/kw5Rii4Tauic/CSVnHJVcaGdyAUnFE7Pug==
X-Received: by 2002:ac2:5f6c:0:b0:50b:d3ac:2889 with SMTP id c12-20020ac25f6c000000b0050bd3ac2889mr1256482lfc.44.1701478605825;
        Fri, 01 Dec 2023 16:56:45 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id q13-20020a19430d000000b0050be813bf9dsm9230lfa.183.2023.12.01.16.56.45
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:56:45 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50bbf7a6029so1141e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 01 Dec 2023 16:56:45 -0800 (PST)
X-Received: by 2002:a1c:6a0c:0:b0:408:3727:92c5 with SMTP id
 f12-20020a1c6a0c000000b00408372792c5mr311701wmc.2.1701478584358; Fri, 01 Dec
 2023 16:56:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-2-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:56:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
Message-ID: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] of: dynamic: Add of_changeset_update_prop_string
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

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -1039,3 +1039,50 @@ int of_changeset_add_prop_u32_array(struct of_chan=
geset *ocs,
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_changeset_add_prop_u32_array);
> +
> +static int of_changeset_update_prop_helper(struct of_changeset *ocs,
> +                                          struct device_node *np,
> +                                          const struct property *pp)
> +{
> +       struct property *new_pp;
> +       int ret;
> +
> +       new_pp =3D __of_prop_dup(pp, GFP_KERNEL);
> +       if (!new_pp)
> +               return -ENOMEM;
> +
> +       ret =3D of_changeset_update_property(ocs, np, new_pp);
> +       if (ret) {
> +               kfree(new_pp->name);
> +               kfree(new_pp->value);
> +               kfree(new_pp);

Given that this is the 3rd copy of the freeing logic, does it make
sense to make __of_prop_free() that's documented to free what was
returned by __of_prop_dupe()?

