Return-Path: <linux-i2c+bounces-9407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579EA32ECA
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 19:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCFC1162C0E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 18:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD6225E458;
	Wed, 12 Feb 2025 18:37:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF725E44A;
	Wed, 12 Feb 2025 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739385423; cv=none; b=If0o/+Hy0FQtFaSS2zwiDYP6Plkan3f3k4mBgbDa5+hpo+Ne5eKSK6rc14aYyz9ebHIa+sYt5A2gRT8qW3ksTB46GLJnTbi38TYeFPUBt6iFnQIumupWGAww1PQkH75jlTkPR4TgEgWOYgexI3zlU/cxu3YDY8kZU0grpSFjWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739385423; c=relaxed/simple;
	bh=FYua6SvZTTyZwm5obpFXnglnaJ0t3ySBzIR84QOZen0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqI/Zh3/UZGUHydhVB9JNsfkRY1+ZjxlqhnnRTg+x0vNM74N3gKBfCz3uSATlOcu5+W4rKHeUi6tBdCJ8WozXpMJh8UUtRwYrBUPMdKJwrBP7VnMlRK2dKfsmhzPFLGJsqjCgYSjB1jhkh19yJD/Gt5d7id9bGzNbu9/wAjzH3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51f42b1a69fso4871e0c.1;
        Wed, 12 Feb 2025 10:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739385419; x=1739990219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pZ4JaDu880aYdD64xQr26gJgkpLcEjZGdougVKZC6A=;
        b=vqYNauZsvbk+seIds1srOaxqfuHn8kMUUPmWEqO1U43Ll5jjwjGr0+lb0zq5UFNb5e
         Jds8QG/MDZ+pst3zEu5BQC4lv+15XObkzCoB69+01a/2T89yygJVkWM+Spo7ulwxtRtF
         M8Cwhi0FI2Bpgp/4NTiKQGIRItR+i8D2y1JUcwlj5iuzuE/rTSAEuaFaS2vkViR1wmJM
         YYe42QlsarPPKQJt+IssXVQlVGnwdAKaq994DjlRIEx7iQch714y/XbKWjzhY3rj9nnN
         yymZuVlqiUxH9YvGZAW7GIjHwJYO3go2Q/3SaoyTjW91XrO3jikOU5X3WSonH0JNgteH
         HmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX+9fYx8KP3cywswB6B6kdpvD8y7nRY4+/VKlbg3iKjmP6//4Pi5ksxeuWckjBnsoku9yJUjSgd73D5UZI@vger.kernel.org, AJvYcCUsdGm32fgFwV8wHjU1XMgerMSB5CCLT8iyg/z57V1pF6PS2tSISqNSKFXCKXpb8dva6WW2GuAAGfziQ6v7uQQ38b8=@vger.kernel.org, AJvYcCX686y/YNZpS2P+Xk1J3fUPQ6lTkrbcD3xcsvvGy0SgFyTES4ECUIRGBII0us7AuG+6ujq1WWWUVzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsK333LHqJ62Eu2IuMsd100wTlDFtA6MdnsqFLd3APH9hyZ/ZU
	Nq0P6OeKSCrXMF+Amrp4ptlc1NG+7476FE0O84FMsigdDwsUTjYeU+zvhBDsj14=
X-Gm-Gg: ASbGncuGRvjlH2KlEiicKsKRxU3r8UJLYqigrqxYUyzjArol4oP3xHW+sjibAhdjxkJ
	LANL3vHdZniixqeQMQJyIO1xVsoBmXkih18t7jOTwP79liShZxgO1DTY/1uOYufhCd1YBywHvW2
	OeIvdwO6ENZ8dl762IcJZeLuT95iQP0tzGF/3LoADM2/iBD758+P8SviOtr7lDZEZdKhXoEq4l5
	/mesD52ptygcdBILxxGdtKvefSUUHnTyCNTRCAuGnhF2MMniyv0baB2IbcdbfpaTYB9eGm4hdul
	Jeip5zeF72UWF/wQVm+I8V/tJKOCofAn6HOyPhYfqYgeNSqvN2szSw==
X-Google-Smtp-Source: AGHT+IFLUJ2wy99kxdmlqQ5UvtKe1tvUy/zI+H1MLrAY6l3tLfaaej1hoAmj9uSmsFtq6seMi5frfg==
X-Received: by 2002:a05:6122:1795:b0:520:5a87:66fa with SMTP id 71dfb90a1353d-52077def26emr453918e0c.3.1739385418263;
        Wed, 12 Feb 2025 10:36:58 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52050a2c061sm685352e0c.32.2025.02.12.10.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 10:36:57 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4bbbaef28a5so1406013137.0;
        Wed, 12 Feb 2025 10:36:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLHGp1Qa9MgA66vshwz2UZ+wrQEqSVb5PDRROgkBp01PK+RoWt0lKFt1T0dmdbDK4fjbWEkILh1g1eFTTsa7tsGQo=@vger.kernel.org, AJvYcCVwVd73C3cLHLrHpq6Bk5hICx8mL5rd9AO050TpLRO2FIq3skf9Unf/s6QHLak0ukeqs9OoThkEUrA=@vger.kernel.org, AJvYcCXfArVR0FjWns9ILWA6Df07et/wqc1EqAf1WTI3CYd74iQbCVtfVCQKqGhxaDtWCau9am2O3/4K3oiFU2Ls@vger.kernel.org
X-Received: by 2002:a05:6102:2912:b0:4b9:bc52:e050 with SMTP id
 ada2fe7eead31-4bc0351978amr1135729137.2.1739385417570; Wed, 12 Feb 2025
 10:36:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com> <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 19:36:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
X-Gm-Features: AWEUYZmLM0E1ki61JdMJvvq0q2FTXGeHJ8gpiMKPNt5HXp-8AeEKkxybEg-3nNk
Message-ID: <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Wed, 12 Feb 2025 at 17:35, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> There are already a lot of drivers that have been using
> i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> to have the similar for 10-bit addresses.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
>         return (msg->addr << 1) | (msg->flags & I2C_M_RD);
>  }
>
> +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)

Having never used 10-bit addressing myself, or even looked into it,
it took me a while to understand what this helper really does...
So this returns the high byte of the artificial 16-bit address that
must be used to address a target that uses 10-bit addressing?
Hence I think this should be renamed, to better match its purpose.

> +{
> +       /*
> +        * 10-bit address
> +        *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> +        *   addr_2: addr[7:0]

I think the second comment line does not belong here, as this function
doesn't care about that part.

> +        */
> +       return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
> +}

Probably you also want to add a similar but much simpler helper to
return the low byte?

> +
>  u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
>  void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred);
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

