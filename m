Return-Path: <linux-i2c+bounces-14673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD6CD5763
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 11:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16496300A2B0
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 10:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1987730C60A;
	Mon, 22 Dec 2025 10:08:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91B301002
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398105; cv=none; b=bXvGjlqYWYuww2FhrK4Uimff1fkpWvKiYYi7SS7yyiuUikHy8GUdIVsaxchQUNZlz8kZvZfK5oOctogGavPjv6E0MTN0LN+GW+9OEnY5XoWl3+QN5LruGnWOpnLnta1Wr0p3Q25I7ge4aWsQ7ddngdvZYS7P1D8RdadkEN4mzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398105; c=relaxed/simple;
	bh=pYxC0xGJLfaMlKM2nphME9JmmJ1biPNjHd+MZwrmnFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7M1Hs9XVuuQbph6yDqoH7R+Fu/XbFr76rcVhlIQH/Pp8IkI4kZk8s7NaTfkBaPsljIN3+UjsxExljno6YXGHWHqvNp3aIqBUrMOPP5o0r5OJg61o1BnlAcDS20jwtMihJuUEAcmMP2tqxTt8AXwdy9noiXLrY9gqaFckG1SUdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94240659ceaso1058408241.3
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 02:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398103; x=1767002903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEzlntz/A3Digs4sjukIlKb5qv62LH8yawTgFzZ88fo=;
        b=AHw6dYBIGwENBZ1Bobc0aIId+PkOg1vXvEu93k5dcfAXd5lK7FqEUb78EmF6L1q3fD
         ANIkHcqp24jXOBM7vjQfNDF+9Xnl3LpiHLK80f0haAVbtd1tlmqZdPqVNij38mpYcDbq
         FsEA3/zBAUUrFF/z7T/ZS8a49GMxc4dmA+SGNqK+p6KJhu/VrtuL8TXe3wqWcna1tLRo
         1Rg7eMpkyfxRYJsjqJ1EtOKxSzQ1FyJJp6GrC+pM08JKUFaV5DjEIgnpM15e4IegQE5g
         SEfCA8n5ephFD2HYp1vCNTzHJvGh/RPXfL7C6CARx/mLkPhZv3GgBiVN6caP8EnaFYpT
         KaTw==
X-Forwarded-Encrypted: i=1; AJvYcCUHSypGAufHK6p/gO47K7weCTktEKlxZ+6Z6r9wyO0smpwzsXkFKWoI55nasU4WwUSQi83rCSAFdnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn+90iVoJ+TBb1+VGZWQ2jVyj04uLpowog4UU4DTBvhjF6IPjB
	+0xIBd+nQf83tfaWsQcHuI+JZDN55OQHV+WrOpvcImCV6ozbTjBNtezZiVTSo2Vw
X-Gm-Gg: AY/fxX5ze8rAu1fc6aGP/h8wDZiXbK6PG/tQvseunBj0uKf4dh/UvXy0jgAHBuyCht/
	Z/l77pwUsRvjXuJLdS9s1dk8WxSYvQ90A8qWNnQpyr5sZDIUh4tJMkpf23pB+nHsSHnVi7BUpl6
	36dDXWyZGSJk+lJM/M7daRJmTKHb72VFLyieYaAFAaXNSq8s672j6AT66nKq5K4kR+FaOLzwsfz
	eA+W6BEjxjecQ8nB5t/g7Mb/0LI8CgJm6HWWKQ0lH+qigsTKi0TUNHxwpZHO/IkiuD7PdJ+jnZN
	tpO39jR2PgW6NFtEQFwkg8O/SGeiYM1XhzmXOUcjyvPMcTgXXA1S+QbZspGAUGmdaDTsv/I7ueO
	cAz4cvxEjCW/wzsb/tdlzJBlpxF32VcB4E6hlE4qgjqWkuMTUfFo4Df3pdgSJ3w4tW0lXIYBVji
	0TabISgRSC/s5yQ/hifbvFkh9pqPLHfMYkh7J/WZ9kHzewRwOU
X-Google-Smtp-Source: AGHT+IFPL/QaoSv8sW+ggvr1k1vTzo8zQGlJbdKJbtUuPZUeQdkz18/9eEoy5vAt9M/zQOJWiUdzFg==
X-Received: by 2002:a05:6102:2c09:b0:5dd:f9c2:551c with SMTP id ada2fe7eead31-5eb1a7cf510mr3164180137.27.1766398102805;
        Mon, 22 Dec 2025 02:08:22 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9434162d873sm2833527241.1.2025.12.22.02.08.22
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:08:22 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dfd2148bf3so1262604137.1
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 02:08:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfHR/Gh1c+mZ66+eoVHODRrucDT7mihEfK5sf00OVCiCl5tnFjEwFsWllZWg3Th4WUbktkn+k5u8Q=@vger.kernel.org
X-Received: by 2002:a05:6102:3a0e:b0:5d7:de89:8dc6 with SMTP id
 ada2fe7eead31-5eb1a616c74mr2760273137.6.1766398102025; Mon, 22 Dec 2025
 02:08:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 11:08:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
X-Gm-Features: AQt7F2qgJlv5WWEn-8R7_EQWn45G6An5kBRt8R2C89e3bKVxcY7XZ_y43fEdjFs
Message-ID: <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> In-tree phy-can-transceiver driver has already implemented a local
> version of devm_mux_state_get_optional.
>
> The omap-i2c driver gets and selects an optional mux in its probe
> function without using any helper.
>
> Add new helper functions covering both aforementioned use-cases:
>
> - devm_mux_state_get_optional:
>   Get a mux-state if specified in dt, return NULL otherwise.
> - devm_mux_state_get_optional_selected:
>   Get and select a mux-state if specified in dt, return error or NULL.
>
> Existing mux_get helper function is changed to return -ENOENT in case dt
> did not specify a mux-state or -control matching given name (if valid).
> This matches of_parse_phandle_with_args semantics which also returns
> -ENOENT if the property does nto exists, or its value is zero.
>
> The new helper functions check for ENOENT to return NULL for optional
> muxes.
>
> Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
> property presence check") noted that "mux_get() always prints an error
> message in case of an error, including when the property is not present,
> confusing the user."
>
> The first error message covers the case that a mux name is not matched
> in dt. This is removed as the returned error code (-ENOENT) is clear.
>
> The second error message is based on of_parse_phandle_with_args return
> value. In case mux description is missing from DT, it returns -ENOENT.
> Print error message only for other error codes.
>
> This ensures that the new helper functions will not confuse the user
> either.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -542,11 +542,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>                 else
>                         index = of_property_match_string(np, "mux-control-names",
>                                                          mux_name);
> -               if (index < 0) {
> -                       dev_err(dev, "mux controller '%s' not found\n",
> -                               mux_name);
> -                       return ERR_PTR(index);
> -               }
> +               if (index < 0)
> +                       return ERR_PTR(-ENOENT);
>         }
>
>         if (state)
> @@ -558,8 +555,10 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>                                                  "mux-controls", "#mux-control-cells",
>                                                  index, &args);
>         if (ret) {
> -               dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> -                       np, state ? "state" : "control", mux_name ?: "", index);
> +               if (ret != -ENOENT)

I think the non-optional variant should still print an error message in
case of -ENOENT, else this has to be duplicated in all drivers using it.

This is typically handled by having a non-printing core helper function,
and having printing non-optional, and non-printing/ignoring optional wrappers
around the former.

> +                       dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> +                               np, state ? "state" : "control",
> +                               mux_name ?: "", index);
>                 return ERR_PTR(ret);
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

