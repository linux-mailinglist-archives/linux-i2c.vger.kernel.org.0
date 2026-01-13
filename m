Return-Path: <linux-i2c+bounces-15102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 409D8D193AA
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73FA53008F69
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 13:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F79A3921DB;
	Tue, 13 Jan 2026 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="zvfoV53a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A33921F3
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312659; cv=none; b=dfeBMNifaZgh086EdcMT6WwGMvm1+vHnaDDtMIsi+vVLnQURLICO4aTGXYGrVBEr6CqAbhT3Nm8NtgMCrJpFTTB7xK5j431r9VaK0lmVMuWeET7Uf1sircv4pYHQQL3a7wxxGGamPfnjV927mkAdnsq2kJE74YBVCFgagsOdQ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312659; c=relaxed/simple;
	bh=yHQXt2lohILulwRHWO2PwdKgbtksvgC0OIilYDvkikI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8Vkrrwc2gUZoE3OgN+Ce8Ay7RHdZ0trf9M+lMRBH4Qu/ODj/9pAGFfq+AxOo+/rvk6pklQrb3wgHlDzDnBCMQy734iJhMV8wyIioZelmfN6Sb2yQvnsN2+pDiarIuKkvQ/j1Wn8gGwTtI0TpejjlIG9MqdkNVxj2xogOnOwDE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=zvfoV53a; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so13016224a12.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768312655; x=1768917455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYgsGgBKZshEd3LQPmk39JcNw7m/fhIkjkE+xKR+bec=;
        b=zvfoV53a8KKlvQ3d1JQNoqsn1R64meaL/N0gvJBVsP07IpubGxx2QfE84x4Z2+kbFb
         0hLYvrdv4SXvbje0qJL0Ne6nG9Fm0EboVzJAYkZUYQ9YLVSaQzuc2aaTV6Xaw3fXr4u5
         epRUQ8Rr1fmQuXUGhAgjyFhKoeU5fsg5c9fXZgvqcAaQm3999ZjhMx1Bh0O7IukctDtr
         cxNCZsPNksEYEPV48GWIxa6MuU7QzPugngj62cv1/mZlpNlETWTREwFO8KHkhEamhwC4
         prCUxmFrHMkgeYCQCIr0xyrmQWG7B2ZuuAVRPrT+1i5F97N3cJr9JI7d5M8HP9SZcOFn
         Uf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312655; x=1768917455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYgsGgBKZshEd3LQPmk39JcNw7m/fhIkjkE+xKR+bec=;
        b=tQy+OFIUJ3jW2buSuVWPcJyt8smQUXpU7WGVmMmG1VQdp7bzdwl7lXeMIFf882wSsV
         oyLS4FB6B/uOHrcWx7cKLIdeu8/R8vnc8lUMJQzwzRwvl91NXEto06Exo2VV4Fv6md8N
         KOv001HHK1bCSScuT+oVLeUlMh0k1AFnLAFCz2rZBn9Sy2bKajkb3oTVsvlQzW/0dE5T
         Atb8KmuRe1Onk93Tmd6w8Aab6rDbtzO8kv2ELdRaMTcAMQNtuVRgxBBAa89FjWUs3Hda
         9yLIQEdN08MENaVb5zOGLER8K3dkEs/aFtzKQDI3CpdbR044XjH1dYFLq219Dxs/ltMx
         DpDg==
X-Forwarded-Encrypted: i=1; AJvYcCURrrOI6gbZ4k6ha8VcAck8hw5Ah6nH94hlam914aQbjO4OZwcTiC4cYJLxQ6mhUwEQ67ZByFy6J24=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRYRyJ/m4yr/Qk4w41P0RVCMwgO+1L+pOGh4EWqGKlkXe6uWxm
	b8Kts+0w8icWCuVPHBxMtYPZLxDty0Tkj162gJKtZNHYcfsYZYNiosH5J5ATx68wkUDOUuk69Z0
	ln4S+3Zw8SHkJr5EJMmAVLbgDMOwTNiVxkOFy0ce4qQ==
X-Gm-Gg: AY/fxX6BUsxB6HNrGsGkHyNF5PjuYIUYQHmKBan42GT/r7KR8XBJYGWZdCWBFLGBg42
	Zy2w/9/HFuwTFU8LVuoCUTTHBk0XrUmDHOvTOsEL77wx7mBSCiak8A0Fj1SzMmbaNoH4Y2HIyFg
	OVMQya+3rQRL1MQckNSIymQhi9iA+lR9xkAAg1wmUIPTIMGaV4nw4Ftczu9lW9D1rr1WpE9HZux
	57xJI9rV33a9ne8gURiGiO226bYPGaFuhQbo7jycs+NydaepzWuOg3l332uEMvyLqojSyZxSJL6
	1yjApNC/cSXdabMznPLRS2b8OLUapTt7vRHKR2q9L+05ct+0pw==
X-Google-Smtp-Source: AGHT+IHC69qajNN2R0Oc5VosMApQk8dB2K8/wIPuNuXO4ULHt0+4HajErsuy6Dkjt1+pDa9ixvBw3NRLu/Pa+AU8sC0=
X-Received: by 2002:a05:6402:1e8c:b0:640:e75a:f95d with SMTP id
 4fb4d7f45d1cf-65097dfbd5bmr20646641a12.15.1768312655296; Tue, 13 Jan 2026
 05:57:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-13-robert.marko@sartura.hr> <2cdac084-4924-4ca2-85d6-2e6d9bf284aa@tuxon.dev>
In-Reply-To: <2cdac084-4924-4ca2-85d6-2e6d9bf284aa@tuxon.dev>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 13 Jan 2026 14:57:24 +0100
X-Gm-Features: AZwV_Qh0sAc6Pa2O_93Ow3lA3FmFDgK6_SoYiCOhp74HuwfyLgAjJuCjbp6xbBo
Message-ID: <CA+HBbNH4q8o-4Jb=hu7JgE4emxFxktFSLHdfY4J6gCDbYTpWUA@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] arm64: dts: microchip: add LAN969x clock header file
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.org, lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 3:42=E2=80=AFPM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
>
>
> On 12/29/25 20:37, Robert Marko wrote:
> > LAN969x uses hardware clock indexes, so document theses in a header to =
make
> > them humanly readable.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v4:
> > * Move clock indexes from dt-bindings to a DTS header
> >
> > Changes in v2:
> > * Rename file to microchip,lan9691.h
> >
> >   arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 ++++++++++++++++++++=
+
> >   1 file changed, 24 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
> >
> > diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/b=
oot/dts/microchip/clk-lan9691.h
> > new file mode 100644
> > index 000000000000..f0006a603747
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>
> Shouldn't this use the same license as the dtsi including it?

Yes, its a mistake on my side, will fix it in v5.

Regards,
Robert
>
> > +
> > +#ifndef _DTS_CLK_LAN9691_H
> > +#define _DTS_CLK_LAN9691_H
> > +
> > +#define GCK_ID_QSPI0         0
> > +#define GCK_ID_QSPI2         1
> > +#define GCK_ID_SDMMC0                2
> > +#define GCK_ID_SDMMC1                3
> > +#define GCK_ID_MCAN0         4
> > +#define GCK_ID_MCAN1         5
> > +#define GCK_ID_FLEXCOM0              6
> > +#define GCK_ID_FLEXCOM1              7
> > +#define GCK_ID_FLEXCOM2              8
> > +#define GCK_ID_FLEXCOM3              9
> > +#define GCK_ID_TIMER         10
> > +#define GCK_ID_USB_REFCLK    11
> > +
> > +/* Gate clocks */
> > +#define GCK_GATE_USB_DRD     12
> > +#define GCK_GATE_MCRAMC              13
> > +#define GCK_GATE_HMATRIX     14
> > +
> > +#endif
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

