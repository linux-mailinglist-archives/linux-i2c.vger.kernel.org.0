Return-Path: <linux-i2c+bounces-15292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F276FD3C4F9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 11:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FB4F709C7D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1A626158B;
	Tue, 20 Jan 2026 09:54:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D02EB876
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902839; cv=none; b=DuQ9nWQ6+N7+1O2hhsZYWTV1P9SclaeGJrjHTpW9TGrax6UMDShWQsxVJh3VWOL27rbA0MzlYolucWiJdEeM3vFZdNfCk20HKvgHuygK2Zn1JEO3Vd9Z4UenFygj1mHvZUlyNT3KOKRmb5U1MhDPZMkURqe2CaMTc433EcdVmdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902839; c=relaxed/simple;
	bh=Y2e+JbZ5geFsLrIwdXvR6J7aoCBZ+QeMG1PGfBHkwC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ts0c5Uj2x7TgQ5KQ8fk+W5SlSl2OUHNOyJFawqF2m+/9sD7UyKSRMrr4myggpBFXK0kg70/ftNUVjXbQVvw8X4SzC7/qzbPb0rjK9McLlWknWJTamz7psT1b4/6duo2Mt3etcf2Gx+DCXxKWgLmwNApJi5IGi1L81WHRP90SL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a37cb5afdso86131776d6.0
        for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 01:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768902837; x=1769507637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l18hDtqu7l45yo1vlmek39RB1c0Zv/I56SgfcgBEbBk=;
        b=wKIzdwmuHjGixgCjOIVnfpnhtgJPsMkMovOHkxSchBjmCaHWvAW2zNexu81dsG3agj
         m34kAI3AXpc3v1zSMV5KJGpZVjB3y6jvx+R5sMpddnJI4S0SliqjyCNVbONgB4pSoyA2
         slw43y1+V1nqhJbA78yehahVQXw5ciWAlyg5W7IAgy1KLGom9vEOmSg+K8qwUxHXwbvr
         m6sxucBDk8QkDmnRercYrXSm/P2czum5CosRC/HT7rnzm7b9g+8Cd141wnM1/dgGmEUu
         DWdCGTh9Fx7LaZvtUf5Ux7LbILj39PLiaWos0QRtzQWHgK9HiUfnhyu6O+Dgd+2m+8oR
         fL7A==
X-Forwarded-Encrypted: i=1; AJvYcCVF0plAsEA/BQ79MhtEkk7TcGIHAYDom5nokUnnD72f9tXUmxoQZueUKOmj4Ui/rtD6g4tjjQ2lxlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YynMYVDU54XdNBJboJLLLQ/8fFOcsv/JIEjzN89LrgruAV6aZ+k
	L91nreAIXX0dLklvgZGMaKCemhHxpB5JcLgk1firw1X+fn+7yUi1dBVsXpz/dsK3
X-Gm-Gg: AZuq6aLG5Or9YqzBSqUULhxeY5bKNwJGTWDfTZ4aB/1DX0D4FMyNlJtUIwfU2OKCsOf
	gVSM0a/J8Wp8vZUUmBgYlObaMwiKIYxjyvCWp0vrzgJUSbIyiQH9ffuaXTyLI74f36hd5TgT7oM
	71BfTpmpclJPwrf6InUNW1gEqKKbJzqg/NoZHMycGmP3OuE/G4f8gufrJZarodcWhLU/QSmyqQI
	HbhJ+06w6DvLDxroT1Coa0OWKlYPZTjR03dLE/pzbS5oiVK4npViNTkRtf8xDV0Bwd769SuXc9h
	maMNF7qfpHl2FpirLqBCBUWZFaCDgymiDUfXeqEFIqX8EZQHHvr1y+25pSYPobYr1Q6/1li47IZ
	mQbHvbYMDGCJ09UUCj/2TOCLOyCgtu5lFj/vQ80M3mspadqnm/K1k7oAWN4rsxZAWDUr5hJXOLR
	N0aKl6SCen/wyS7RYgYtOuP5HEBm7mIYNmHDmWBZgkIYuNwARM1jVk
X-Received: by 2002:ad4:5bc1:0:b0:888:804f:3098 with SMTP id 6a1803df08f44-8942d5f7c70mr197820326d6.3.1768902836786;
        Tue, 20 Jan 2026 01:53:56 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e5307sm100612406d6.9.2026.01.20.01.53.56
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:53:56 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5029aa94f28so39387411cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 01:53:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYLA88lutND1M/lydOcI/k7fQBdClIs5RF4Omts257YoCpsTNt62owBesduTsetNcZjfiBi1uXQok=@vger.kernel.org
X-Received: by 2002:a05:6102:cd1:b0:5ef:233e:6b25 with SMTP id
 ada2fe7eead31-5f192508654mr6479996137.13.1768902342092; Tue, 20 Jan 2026
 01:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:45:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnpci1v1oQb34_QRtU-P3S8TSormmNudajT0e34EO14w@mail.gmail.com>
X-Gm-Features: AZwV_Qh1sWLkk903wC1dLdg8mLxjiEBVkYZdOb9H2O-Zh60PCWOHx0RPYuQB8LA
Message-ID: <CAMuHMdWnpci1v1oQb34_QRtU-P3S8TSormmNudajT0e34EO14w@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> In-tree phy-can-transceiver driver has already implemented a local
> version of devm_mux_state_get_optional.
>
> The omap-i2c driver gets and selects an optional mux in its probe
> function without using any helper.
>
> Add new helper functions covering both aforementioned use-cases:
>
> - mux_control_get_optional:
>   Get a mux-control if specified in dt, return NULL otherwise.
> - devm_mux_state_get_optional:
>   Get a mux-state if specified in dt, return NULL otherwise.
> - devm_mux_state_get_selected:
>   Get and select a mux-state specified in dt, return error otherwise.
> - devm_mux_state_get_optional_selected:
>   Get and select a mux-state if specified in dt, return error or NULL.
>
> Existing mux_get helper function is changed to take an extra argument
> indicating whether the mux is optional.
> In this case no error is printed, and NULL returned in case of ENOENT.
>
> Calling code is adapted to handle NULL return case, and to pass optional
> argument as required.
>
> To support automatic deselect for _selected helper, a new structure is
> created storing an exit pointer similar to clock core which is called on
> release.
>
> To facilitate code sharing between optional/mandatory/selected helpers,
> a new internal helper function is added to handle quiet (optional) and
> verbose (mandatory) errors, as well as storing the correct callback for
> devm release: __devm_mux_state_get
>
> Due to this structure devm_mux_state_get_*_selected can no longer print
> a useful error message when select fails. Instead callers should print
> errors where needed.
>
> Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
> property presence check") noted that "mux_get() always prints an error
> message in case of an error, including when the property is not present,
> confusing the user."
>
> The first error message covers the case that a mux name is not matched
> in dt. The second error message is based on of_parse_phandle_with_args
> return value.
>
> In optional case no error is printed and NULL is returned.
> This ensures that the new helper functions will not confuse the user
> either.
>
> With the addition of optional helper functions it became clear that
> drivers should compile and link even if CONFIG_MULTIPLEXER was not enabled.
> Add stubs for all symbols exported by mux core.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c

> @@ -677,7 +707,7 @@ EXPORT_SYMBOL_GPL(devm_mux_control_get);
>   *
>   * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
>   */
> -static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
> +static struct mux_state *mux_state_get(struct device *dev, const char *mux_name, bool optional)
>  {
>         struct mux_state *mstate;
>
> @@ -685,12 +715,10 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
>         if (!mstate)
>                 return ERR_PTR(-ENOMEM);
>
> -       mstate->mux = mux_get(dev, mux_name, &mstate->state);
> -       if (IS_ERR(mstate->mux)) {
> -               int err = PTR_ERR(mstate->mux);
> -
> +       mstate->mux = mux_get(dev, mux_name, &mstate->state, optional);
> +       if (IS_ERR_OR_NULL(mstate->mux)) {
>                 kfree(mstate);

mstate is freed here...

> -               return ERR_PTR(err);
> +               return ERR_CAST(mstate->mux);

... and dereferenced here, leading to a use after free.

>         }
>
>         return mstate;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

