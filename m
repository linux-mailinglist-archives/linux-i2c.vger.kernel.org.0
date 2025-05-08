Return-Path: <linux-i2c+bounces-10886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF16AAF47C
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 09:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E2EC3ACC34
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 07:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0AD21D5AF;
	Thu,  8 May 2025 07:13:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F12BA38;
	Thu,  8 May 2025 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688430; cv=none; b=ftH/VPpGQU4EC/D8rbjTLNmPt4xB+eOm9qchQmFpa1D3uxGs5pPERH5LXjl4+89d8Q9IPo9wXM6qG38P39jn3A3UzLCD/hM7yVl5rE6qweC8MitowXMEtmMvdCmxT964ieFwLNQUUIMDXLWFG2u+auHiQ29hUepUoDYfrClloCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688430; c=relaxed/simple;
	bh=hrwGFHMMwMzLO3qU86OI8t/Nh3XTJsB3z/oENIE9U9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUd3J7R5wuotH1g2wWz09NEKH9Sm2IxzOMkXnvg8R+jwBrAhP4Sy+p8ixoTHQBcg53le+PCUg9JXmksX0umBAG6ndW795JZERNAFg/MhcQ77LLKd/Fm4n/nbTSrNmIM4u5guvfG3Br8smENCrD254YwjzwaEpibS2ploMeyhwx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52413efd0d3so219825e0c.2;
        Thu, 08 May 2025 00:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688427; x=1747293227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCDiRMnhh5NRGE6kDeKql7Kl5Sr5vQvd1G2z+pchMa0=;
        b=ZDoeHGGKMTvcWEJvCd/5p+CiRtbolvk0TTPyqjfYJXDZw+qnBNEgKHGxgi1xPWcjZk
         fhlWIupOLOtDjIjutZRWWv7QlI3JjBNdGKjQlMvfjolbsIJ0uZyGN1eG71wCYYTW6qB8
         G+T1I4VZ/qfalrX4MiQ+J513JMi+3nL0UyIHxuRQC/EluAnhvJT+B6XlAm2Zab7QZDuV
         jrj35bJt8wj9/HQU7pqa5zjO7QF+Kwkiao51UZYS0YL76FGDSJpxFYel7fMhDsZx/WN1
         +zGe+OjtJazSB/IKI7OaLRg9AqiJsPr0T9f2G+GSIGXU/4YlELO3Cth/rvbzxduvG8q1
         YW6A==
X-Forwarded-Encrypted: i=1; AJvYcCU6cWQlaPAu+D2oXcVYq1rAkyYtR72d5p0ziPgniuNxLPWcwCX+uwirOLuAn3N1jY5QnHArx7fLR6iiWw==@vger.kernel.org, AJvYcCU9AasIYaDLOA47POR4s7BIbVO6LZrKxYJ2wgkDBPrbJYD3wKX63FHjSKapFsB8X2a1h7zkmEsCzu1a@vger.kernel.org, AJvYcCVNWzVAtRT4ZCWPvPyW3yhQDMgmD41qpwMRWNbsygyLsJS3G1YEWi9jiKtjI7OYbmy+1MoCz1YcBg/x@vger.kernel.org, AJvYcCVwGYOq0/kT6N/Wzg28b9q7/giRZ6B5ralpUZeB/VtP8Xrtt7bJJlYbTtq4nezL72K6Ogq6Qbam9zxO@vger.kernel.org, AJvYcCWPpXZMzsmgqwcxZP0gDQKA4g837AsrCWOVGST4NzUwWUwI1i+YTxFAtbjWjAfJQT9hOsZN/D8UGIlL@vger.kernel.org, AJvYcCWfCmjc9Tk26fJ2mlXcAubQyhZO0G87Uyg+s93g0njmCeKLZLzBhbnjUKyivfP71tZbcCFxRvlXjfTK@vger.kernel.org, AJvYcCXF2utdp15OHTrzOag10UrrfIRCdjf/6QG4D49QSCzr5hstwDy9vhqQAnSUOQ/0GrlSbGJPU8i7kGu4A+sB@vger.kernel.org
X-Gm-Message-State: AOJu0YzqoMjjcgL245QVx7A6SCKCGTbZ4leWZ2Ds2FJzPtkg/IHXN7UT
	mOpCnCoc9aEOd04ZbP38eQd07GhWsT+1XQwnq6f1ukRLcjbxzKhzbizHoVa6
X-Gm-Gg: ASbGncv9AQLs30bzrFisedCFtzfjX171YLPsQNeFoam3x0p/kC8crscRZuzx6cgbv/h
	sTS3hir/W+i3co0n8zi9Sy5eLmDj5qTneakcgb08UwrtfKAGfEnyEWOhSVDpiX4Ra2Or8Tf+zBz
	4pmFxpVQ8Qu/0tT41zLnIrbsugFB+d0FL7e7Z1aFL/iNUIIAMzhKYyqqrlECtreTfH9SV8QJayu
	71b6P6/UyE+GeNg4EfCoMTMAzOGdEYP62+cBCF1s8VivT+Gv+3tQ/x0k1NI+pfxJiRLtjQKfFEH
	W3BO3fSvEOLhC9ul5sOFcEoWSX9yp5e3p7bPGtihCRfEtWO9IX7X+8xvVTv5EuKW11t6L6sKBP9
	0RZU=
X-Google-Smtp-Source: AGHT+IF2A/TDjmguwXYq3jSxg9o+koHTOBbSlXcLVMj1lgbKb5yCqhb2DL2IwH2HhmoWubyqUiPEIQ==
X-Received: by 2002:ac5:c7da:0:b0:52c:4eb0:118d with SMTP id 71dfb90a1353d-52c4eb01601mr35484e0c.4.1746688426849;
        Thu, 08 May 2025 00:13:46 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae41f2065sm2870684e0c.47.2025.05.08.00.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:13:46 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ddb03095d3so162794137.0;
        Thu, 08 May 2025 00:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNj8OJor3vZ/dTBxqJZC3ZgPzzPP2+ehV1cJqek9OxNQkPC/wRWkfjtrylZ9TaVCYaGY4FVL+JCmQ4@vger.kernel.org, AJvYcCUtA2qJtyXPFPPy28Up9FnXEU7rYW/E8TlpWVt1uKSAXROvuqum/1RFmbE7WZRa9VMxgXWa3rIOsGQk@vger.kernel.org, AJvYcCVJpEhuHszeh3rrLo7LIhbYait2dWyIXX0RPhDAxROA7ESJi/URMULnsMdTF+1ZLswbSznkxssYagtjp6sg@vger.kernel.org, AJvYcCVTP7+rFGTJ62yCleLXcXsbj2fwLnRrOpBBGuyBlyp40pOflowX9nTuNEBJfiKcttJRx9TMGMA3SVJiAg==@vger.kernel.org, AJvYcCWLKCsk0LrjA3dkeYnBxnwJngTn/JrfSwU7/sVxYlROKiMJSe35NkuMoTwrIp2hddQhbXlgusEdyLY3@vger.kernel.org, AJvYcCX5X0LnAOacg3o95rdnBe4wDf7vtTgJaqCztpip75vA94AbWr9z6A/gq9BTrJyyVOJ0jVgd5qfKurNO@vger.kernel.org, AJvYcCX8Gwv3tJ80wkeBjV9dOwlIFrBll7/3VEj9XQ5cxVrAVc3CA1QvC7/UaLZGws30lqXt6dja4HovCVID@vger.kernel.org
X-Received: by 2002:a05:6102:2c87:b0:4c1:c10d:cf65 with SMTP id
 ada2fe7eead31-4dc738bc3famr5378135137.25.1746688425863; Thu, 08 May 2025
 00:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com> <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
In-Reply-To: <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 09:13:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
X-Gm-Features: ATxdqUHmcSjbjZfHI-fr6cqBy9DRd_HkLObPFwa-nuGiyXHv4iNIliDKKGB_NdU
Message-ID: <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific data
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, 
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
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 00:24, Andrew Lunn <andrew@lunn.ch> wrote:
> On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> > Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> > and this overlay is directly referenced in lan966x_pci_load_overlay().
> >
> > This avoid to use the code for an other board.
> >
> > In order to be more generic and to allow support for other boards (PCI
> > Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> > it to PCI Vendor/Device IDs handled by the driver.
> >
> > This structure contains information related to the PCI board such as
> > information related to the dtbo describing the board we have to load.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>
> How big is the dtbo ?
>
> This is going in the right direction. I'm just wondering if each dtbo
> should be wrapped in its own very slim PCI driver, which simply
> registers its lan966x_pci_info structure to a core driver. Only the
> needed dtbo will then be loaded into memory as a module, not them all.

Alternatively, the dtbo could be loaded through request_firmware().
That could lead to a generic support option in the PCI core, which would
fallback to loading pci-<vid>-<pid>.dtbo when no driver is available.

> Pretty much all the pieces are here, so it can be done later.

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

