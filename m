Return-Path: <linux-i2c+bounces-14761-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF33CDBFFA
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Dec 2025 11:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB07C301B82F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Dec 2025 10:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F863176EE;
	Wed, 24 Dec 2025 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="eo79299N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD922A813
	for <linux-i2c@vger.kernel.org>; Wed, 24 Dec 2025 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572229; cv=none; b=SzZIy55fHUBnnATl1l6pRY0Yfhw/y1UVHO94wOKQEmNWgBEYgqpVkfWYqgURcpVEY8UX7V99OgMuA0B60b/4yeRFIsPTtYlGBRY2kxzjvpg++CxuEFT5hnzI1ZEeeiF2XMMbHfNYLPljUBos7yo+nnk8qZeApJVtRwuMPEpfNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572229; c=relaxed/simple;
	bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LiNe+0sj+wagXpIromUCfahf04EST4bnMi8bFku7PAXgcbQwnIN5YdJjrO6tKhWM8JxcMRaQrQZG1qelC0XQ/E6u8w8aL7oNfNNxrVAVF/99LDH1IIBC8LfVa1n2IkBvZjDw9D8cCx849w1WfjY9mWFwCgMwG1KY18HXbgmm+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=eo79299N; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7cee045187so1040199066b.0
        for <linux-i2c@vger.kernel.org>; Wed, 24 Dec 2025 02:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766572225; x=1767177025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=;
        b=eo79299NTUIwAErW4myUfdwKoRa6wGbOYNMRJ5FNkwOyVhoGDkQ9VbraS2fkUnVMFh
         BY91qRMoY06fDxfY+atg66ZxPu1czhOcTvgmjsKgB7U+55pGfakLG0uZQ9ooYfovrSq/
         wE9oW7f+RUB0XIWj24UNaX1zZsR40hZ9EB9zozHBrKz46eFcC+IdmeJBreOLXOTE/HR6
         80KFATmqDImhk6u2G7kuupbQTlXKT1QmunvI8S261MarT0Osw/fD2TLRlPN+yC71nene
         fHN16wtWm4lsJiXOqwddaiJPn1PxaYHhTmgAoSq8OjRBYjrj7uIfrKdW0QfxD7cAUuSX
         cj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766572225; x=1767177025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=;
        b=AVZ3mStNDzOh3ifHE+/MTVuDmV+jelM4khWheDkGqShMenFaYx57UdUy7NEPAnLVxg
         kEaBTh7tJlg2Tu5dOa4FAfOG/m8iDMmR7fQZo3aa4gEG8+7vilJYqBitJzPLeRXq0T+W
         nGbV6qkBgrt5tJdQ36VIkS+JNRcu4oDGjnqz/kZ9yTEHwFvVgefci5aFtqzK3Ps0VvVz
         YCho1IiSUqtuo4WLSZMxQzGh99et9tGW52b0U1qn9eGUFescNioTJ+SlFAl/bevycSkq
         sU4BUiP9PGNJIcOJnXUjuL+wpcdQCiOkCsJi2WZ9OWfCovPTWJHJMKCiPQNg4ja5BhCg
         d6dA==
X-Forwarded-Encrypted: i=1; AJvYcCVPr19xcwdNuT3X7t0HcOpdOByb9+Gex0/esvpGHuhamp8qWmAeIflwTzpkza5NGPas5Ajw0x8e6VM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq3v/J47lgEAs9zwRGiqSM1Q+/RZNz/CK0YAVI/zSLNEh4SKdJ
	Zxc/PbSthHikanddrPXgwhTWkWkLYpcVlBCwBESM1pO/mpneD8hPSzAarspYPD/NvG60nyWL1yI
	gUOhC/XJON61LLgtyWwiVe6oCGWSnYzrlK5ekKxJxkA==
X-Gm-Gg: AY/fxX4XKtCl0uUoLLrBFm9V+/fnfD117EiwLGzqOCRRj1Gpy5SpFFoPBW2QJ0eKt1X
	pC6LKkHFCnh2H5Ae3aj7kMm6PVkRTl4kllcK0tMugiazkOL8HkXYrGnjUeSbyVS6y80CHbr6+VV
	hFq0TaqVaHEPemA5knaSX+UZUm0R4VLeYAhT/F6tPvQx4Q3DbcM9YZJqeynN5vMAKuKZcgAiCop
	ZEbfmyeoFqzTiXeydDu9U2SzvIU34/vjEhBYs0ZSy431oPMntw9YDWT82FkR7aFw+Kh9hrb/MMn
	8RJS1aVun45xWlqGLxSZdiJieVRHRNwkSUx3fc5OcQpyFOrO47ngffN550O2
X-Google-Smtp-Source: AGHT+IFeflXA2mce6O+1rdmvPjP/12/Umt2Y99WbRQ8cM3OEzOcKAWgIne20UzsSB0V8xKjPoflCDtb5j1Pn52N5SuA=
X-Received: by 2002:a17:907:7f01:b0:b71:ea7c:e501 with SMTP id
 a640c23a62f3a-b80355b2523mr2261188266b.4.1766572225170; Wed, 24 Dec 2025
 02:30:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr> <20251224-berserk-mackerel-of-snow-4cae54@quoll>
In-Reply-To: <20251224-berserk-mackerel-of-snow-4cae54@quoll>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 24 Dec 2025 11:30:14 +0100
X-Gm-Features: AQt7F2rVNXRXeSbgmjkb2SKB7p5AiaNihNvuJMBrgMZ7XIKTnJcRJJO5brWpKNE
Message-ID: <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> > Add the required LAN969x clock bindings.
>
> I do not see clock bindings actually here. Where is the actual binding?
> Commit msg does not help me at all to understand why you are doing this
> without actual required bindings.

I guess it is a bit confusing, there is no schema here, these are the
clock indexes that
reside in dt-bindings and are used by the SoC DTSI.

I guess I should have titled this something like:
dt-bindings: clock: lan969x: add binding includes for LAN969x clock IDs

Regards,
Robert

>
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
> Bindings never have a "include" prefix.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> Best regards,
> Krzysztof
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

