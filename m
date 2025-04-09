Return-Path: <linux-i2c+bounces-10229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B95CAA81FB9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 10:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03814882F47
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 08:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E60525C6F1;
	Wed,  9 Apr 2025 08:27:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30B3D76;
	Wed,  9 Apr 2025 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187248; cv=none; b=hg6t3ZfpKcS9jdPwH624ixTK94kz205k3uNeXlAMfIENVG+qHohtJ1MJZeuw9GP1NOTEIxBDQsk4wK7ffPCgb+kVRhKoegU/ZQ8CdNNSyyYAkFXuGfqL7xfvioSyjOHObNplfjV/NYCZP/GioOmIE6H5usGkvTC5LqrFNzAdWxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187248; c=relaxed/simple;
	bh=wEowYpxBCkDlmNfLtfV7R7h7B7J60vMLNj1+hOWh9KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6j+I58/FSqDeHvILMLE1Ar5uzTXomkePntUcfJAQARRSjnDGI4qDlH9ZtJFtxh9WfhYTxwMdrwA0nFwdyxwqtAGB1pAEHWhr317NRdIJ9R5tOvPIuWqEIBb96i69k5IVN0VG/5C7KuF0+ApgLrlx2vYNOxQZzb6cxmPKANKm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52413efd0d3so2815586e0c.2;
        Wed, 09 Apr 2025 01:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187245; x=1744792045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV/VIz9Dal9GidNfi3rZQigxcHcKa0Red1OY/otJy2Q=;
        b=L3uFeBOxi/5xqwWopNdmj1OJ1ddmPKvJGo1jAZ2eKIMPHY7Lo2wI9YSWzSqbKQ1CfI
         uejMT0w2+rrlnVZTkOq1TgeWl/4U68oXkIAMnV+E2qPoU+Nu7fGTlFPoY7j0dJWk1wn2
         r/5/nkYPOVDy4JO0spsl6XuUOGRgN08GLnMUv3A0mc9fo3fkMABpy2iri/AbQ6fWyGOa
         Kk7uC+8wgN1/jfi4bwoCIkx9SfKENxfpJq+KSjtejS/4Ee5NiTGTlUeAy31hTobGLuIp
         IP5vE/6992JWRjdAOC5lLnmM0V5howOjw1A0xSGTsgJxYKBPHLDQHtHnWISZ82hCkKgC
         1Kjg==
X-Forwarded-Encrypted: i=1; AJvYcCUSy8cuXAa7zMSJdUkBj6M3f2wYEI8U97cguX4tpZ2v5sm8RbT+ICiptVp0QBLHCwxFd7cLemecfhBY5g==@vger.kernel.org, AJvYcCV5adHYsPQRYSXOKPGGXYpd32R8tIEhRbrIcXUAD0j7h6dNcnyHs3hYBJLsQy1/T/fzGn+8k2tRSvr6@vger.kernel.org, AJvYcCW+KQRIPxKlLv3Li+L6Dj/4GhS1gb2KFyzmO6g1VJi53nvvEC5oPh9UwkoYZ06r6ND+QUdbQbHdUkxD@vger.kernel.org, AJvYcCWOWzWpx/FRGT1b7yi4kVp/w00x6Y0j35I2GUmNQZfWzTCAsKurqTNVmbzdet0bBj7UR2pFeXluTY+lrPL1@vger.kernel.org, AJvYcCXXXjXLu1FIwF5TxFG+Hit9KvrM44gLWml1JSOVIUnQqekVdljecJGp4xbiJMh0XUqo9pKc/RHVPcKz@vger.kernel.org, AJvYcCXreR/KjnL3ySd7ycsz87Hu6e90Q1CEci6aGKH0EYDRjCe3xBoOnXuX/1/8c5TYeBy9tgKuuq1u+GO0@vger.kernel.org, AJvYcCXz2Mi7cwAlsviSJ15Qvzhsusy0zQWtLYqDehOCFBqPZbaO+B75ayE1MjkyRbqOwxJmnTBS6GwMqFKg@vger.kernel.org
X-Gm-Message-State: AOJu0YyljY27lcdpJ7/+JeRVkSVYJSBbE1U44uqzKni/JW/XdCZ0TfyY
	c1H+klqZ4fefuRUtXNRLgaorGuhd3/J+TkozNmaeION1jlOXumtvgXkKSB8z0TM=
X-Gm-Gg: ASbGncvRhgg1+y4hGXRwWgCTaWVthYLws4ls2mTT1CjPsuDTarVGbTAVzRoGVMEMCWn
	s+GbHpDujH4BbqbmUo6zKaKYBUr4S9tqNvRy/ER2vGIpynNXVuc/f3CE65ir4x49z+YY6CiL9aX
	VOBcgJjuedFbmWwOIUA5csf46EJLocsBHxa+2FUWP5NZtNGy7ZQmfdlWTEx3dEQhJDLZYaBi/H9
	PTa1EZhxHuQKrduieJ+SeppkUFFvmebGqs0cCm9h14yJaN3wy53V8TVLnAnrgwj8/aSq/53GWVt
	hks3TIETyh1edGYhUadYaGFLWi6RLY4+Mc41ylQRaqsU27sg8rTZ5szWy5bWtcblnvh7VYKOStC
	4lwY=
X-Google-Smtp-Source: AGHT+IFcVZXyiP8/B1rVIrSkcRv8mQj8RHwtry4BOiWLiJp1mSvg6aS1Oeor/8p0rEeWJI315N9y+Q==
X-Received: by 2002:a05:6102:5249:b0:4c4:dead:2f36 with SMTP id ada2fe7eead31-4c9c641cf68mr808049137.0.1744187245562;
        Wed, 09 Apr 2025 01:27:25 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c9738360sm99445137.2.2025.04.09.01.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 01:27:21 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86b9d9b02cbso2741933241.1;
        Wed, 09 Apr 2025 01:27:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUqv5G+L8AuIm7B3hOp02/d1qa1unsVZT6svjMg13B/yK4F1EfugF10fP8hBsVsdlmspfchuWPygDIag==@vger.kernel.org, AJvYcCViGBnC27dEbVyuW61xF97FOBtX171KKU4AEceRg4GBDf+CmNn9YI+BxkOv9T30my19gfgA+PQSNV+G@vger.kernel.org, AJvYcCVnEW+0p5VXhDbUAjsLdE3WsclbLuXwn1I+Z7Fh3GIUmWr57+n3PaQbkNhOzy+1ZavuwdGeaXk82pjo@vger.kernel.org, AJvYcCWO2WPL14v4JQVubQtnk4dHVPZEbpmFu9I83V+SYyyjbl6vRqiDb2e2dRYAzrL2Z5AOUXGf/N6iqUTb@vger.kernel.org, AJvYcCWeM9tppTjo5uzswjIdYbk2Yd9+JjPxy+yNmJ+7ETyiekCeL7jLGq0y4yjNx5TrVckdmJHfA6excUqx@vger.kernel.org, AJvYcCWphhYNjzQqje5ZC4+S0JIjpzmLw+TUaDkzI9UnZEiBq3M8OSjZWO1foDgeaGowMBTMxPKoBHDstmPogaO8@vger.kernel.org, AJvYcCXbT/zobJgoXRTY/J7KJrhrsqyzIr1kHXOQ09hnosRQkyXnP8EIsIiM1+j2xHBqNsACoBDZzG8wd5S1@vger.kernel.org
X-Received: by 2002:a05:6102:801b:b0:4bb:e8c5:b149 with SMTP id
 ada2fe7eead31-4c9c6a728e2mr725401137.7.1744187236860; Wed, 09 Apr 2025
 01:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com> <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com> <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch> <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
In-Reply-To: <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 10:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtrmh207usW45c0v5EmxgM+JgfQ=m55tXXNT0m4o5aGg@mail.gmail.com>
X-Gm-Features: ATxdqUFWOu-H2GpmZpjc1_rOXM2aP80PMBbJa2DlVS33R9lalUc2jSOHZ1dg-j8
Message-ID: <CAMuHMdVtrmh207usW45c0v5EmxgM+JgfQ=m55tXXNT0m4o5aGg@mail.gmail.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 09:44, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Tue Apr 8, 2025 at 5:38 PM CEST, Andrew Lunn wrote:
> > "HW blocks inside an SoC." That would be the SoC .dtsi file. Anything
> > outside of the SoC is in the .dts file. OEM vendors take the SoC,
> > build a board around it, and name there .dts file after the board,
> > describing how the board components are connected to the SoC.
> >
> > So..
> >
> > So by PCI endpoint, you mean the PCIe chip? So it sounds like there
> > should be a .dtsi file describing the chip.
> >
> > Everything outside of the chip, like the SFP cages, are up to the
> > vendor building the board. I would say that should be described in a
> > .dtso file, which describes how the board components are connected to
> > the PCIe chip? And that .dtso file should be named after the board,
> > since there are going to many of them, from different OEM vendors.
>
> Indeed, that makes sense. So if I get correctly your suggestion,
> instead of having a .dtso that describes everything, it should be
> split between:
>
>  - A .dtsi that describes what's inside the LAN996x when used in PCI
>    endpoint mode
>
>  - A .dtso that includes the above .dtsi, and that describes what on
>    the PCI board around the LAN966x.
>
> Correct?

Sounds good to me!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

