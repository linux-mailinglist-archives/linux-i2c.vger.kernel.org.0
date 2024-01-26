Return-Path: <linux-i2c+bounces-1483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35D683E437
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435CA1F22D1E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC41924B3C;
	Fri, 26 Jan 2024 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8LV9elq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388B51CD34;
	Fri, 26 Jan 2024 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305743; cv=none; b=fDltfjvQD7VJJ5fnEuenCkeaxIoHeEKnJrZ1BIcaBZR97jCU97Zw+SthrOPI7el53EnQfEIoZbpB5u+wSQHK0mrcgyGlkQxhERJ+Mz7WGDGYucbxYCG7vbW5GSQm8LMp907drZE6b6W9AbB6Bokzae+t+MMfHxzkzgl3xzpkeDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305743; c=relaxed/simple;
	bh=azFQjbcNAxbf+l4V4+7aYhRjZeY+K1fI7+LXCEZguzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAglSy95N0k1fJ1Tsg9zq6Um7+vmq/XIdin5gHkMXj4V/ulDamg0gtFg/1ABg4JbU2auAPjz9Mlj7dxrzWrnVN1sKqnFw3UeynHXQFqQiE0tKFfPbUZbnaLvIOFWB9EpYO/FYy0fYKAxoN61KzHhP3K0jtXspfJTj2Bx8GuMvtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8LV9elq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55a8fb31fc2so720011a12.0;
        Fri, 26 Jan 2024 13:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706305740; x=1706910540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbOdcHzZMuqyDhAMb9nNM/y9eQJXm6UnGv0LdTTypoI=;
        b=l8LV9elqvdMM6d2yzwb6wHeNZB77QlaL/JF8XIPVmGwdbYQLDsUqv18WOb2wlhQXZA
         eHn8FMuGkWVUHwj8tW5ujXumGO/uSW1LDYEBKhuqGOfd7gJJH/nmrt5EiSHZ1zaBJP0e
         HRhg0Y5iJ4fRIKGEfu+6aFyZELp4jANu6IIoYz3K3n9/5Gt13iNJYzExT5JQuOKxDZhb
         GJQDdBQk2RQbDCSWI9Z8/XlB3nT87vZ6/Gy2wIXauzMNRbGnL8Ez22HmVfX03S/kopXi
         UMYMQXFLKGVnXjkRhpxQ6C8UMQ2Hw6an05RdFJXwhYHXlJAEyqS8mfp6+VRG2X4Als7i
         WZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305740; x=1706910540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbOdcHzZMuqyDhAMb9nNM/y9eQJXm6UnGv0LdTTypoI=;
        b=eUZlXovQfDLSY8Dwi1P/l0EnE4FuK6zB7UjeHlEzScxpTkMdhQ1GRj4Y8lLcQPfDhv
         5NTiG/78B3a5GP6eYoSirIV9b+2KrtZqOEFk1IMee77fk2omoB9MzCAV/nWkrkoGahEb
         PXuf7J/KfdCGYiwyz92umRc9A7rUU02+WQQv3OmNJASzEkiV5/bmZGAJSSvLhOKW1Q7C
         DurQG43OPCb3sJI3XCi/Txrjw5bVC5biN2qcUsa8Se06RG0e9jAYwXjCHnd1C4Y7aQoo
         j1fjxQIwzjttORvfXpjRBoPhktJ0mrq0qw2JGWFcRCFw4xBmOG50uk5Chh5UfPdijU3p
         3VmA==
X-Gm-Message-State: AOJu0YzcWHPxs1exmJNjqiC3DswpWxhJzYWqJTC+k8z+lkKkE1w37jMa
	VDZY4k9WuNw6RjFDndQM9f0mL4ZArtc9/PTTlELzlYeBDPHPt+wwElsCgz/d9j1gxIOJgG6GQ72
	eyEDbJ60YgjIGxhLMGnO4MypQ8yA=
X-Google-Smtp-Source: AGHT+IGUA7tu4MH2h0O9HCe7+d+lD7YqcS6Agxx4nkApYTvJ2J/sieq/HbGR7u5mIQMbAOKRYYBLVf2Gii6wM5bwGuo=
X-Received: by 2002:a17:906:4a0c:b0:a30:8bce:2183 with SMTP id
 w12-20020a1709064a0c00b00a308bce2183mr251190eju.3.1706305740240; Fri, 26 Jan
 2024 13:49:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-12-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-12-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:48:24 +0200
Message-ID: <CAHp75Vei9O_mvR7o_esOxko1LnRKWgJ8HmheACtf46bGtWHKug@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] phy: cadence-torrent: add suspend and resume support
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 4:38=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add suspend and resume support.
>
> The already_configured flag is cleared during suspend stage to force the

the suspend

> PHY initialization during the resume stage.

...

> +       if (!cdns_phy->already_configured)
> +               clk_disable_unprepare(cdns_phy->clk);
> +       else
> +               cdns_phy->already_configured =3D 0;

What's wrong with a positive check?
Why do you need unprepare clock?

--=20
With Best Regards,
Andy Shevchenko

