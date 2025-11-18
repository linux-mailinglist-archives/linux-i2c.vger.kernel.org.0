Return-Path: <linux-i2c+bounces-14148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 53770C6A9CE
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 17:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D3AE335B462
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 16:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA92377E8E;
	Tue, 18 Nov 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="H8eCuJYD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F01359F9D
	for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482587; cv=none; b=mlD1bmmGJx0MfJMR+8v0vSySbMUBV2W2gdKRnfZX2wpFPlDwof5uyCENIefY0PlQ9meMyyaUwt8BQpovDoJfZ8j9jsxtPfozijbKpFYIpCIhGoR/99UzpO1c/dFmUe7OtfCIfkt95vPNNxNjw+AMU9evUwqJ/sVUxO6zb8rGkAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482587; c=relaxed/simple;
	bh=btv3uPBsVnXpVNmS4qDs/R7pyu+51TWUj9EIVRnOgio=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rsl8RQFRn640Xqywc7Ce3d9MJJkskYI3fZqOfdXNtoei1eKnCvF3dkbCnu+dOZ4F0zx0L0iMswCLUBdS8aVUxPaDTPGRAjgtCNZ/OHjGWuqov22n+c/5xAvWS3Ah9nPFhYRDP8AcXfF3X0XmX1cdQOyuzPMzQM35ve2Ig1V7yik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=H8eCuJYD; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 25E513F325
	for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763482583;
	bh=mIyOErqpwna01AMHHTOqB9yVf2/6iPsT5MoLCulL3dY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=H8eCuJYDkniBuR/FmwmRKBIJKbk/K23a1AciYiZyZo42ra/TCr6/8AWF+QZXwVsJq
	 /dDwMwgg760UcaJxijQbZzyjfjSTexG5D/1r5Tlj63aCpIDHLYJmBuRpa0gMXLTdQv
	 hTMwy4mQPMyi/AmTwNAK0LHDTh21UfIeHVYlHsTEYPqhoshC0SMhnJVqNcKKVhuxXG
	 QWq/pLntX0eWZphXvd947+j24NhZzjGMCy7DjpapYgYrOUf4lZwZdq4k+fcXvTAYG0
	 eqx23HUsWBNPQM+LEbSw6qdm8oYAWerwgEcg7PNDWml+81cWsy+B7srsCpn6eB7GRg
	 BN/NsKFW9ndBA/JUzOkSV1gIGKKOZ5UO+ByXNNLYuADxoDewangbqiOLrj8riqKTAv
	 CGBkIyZqbmHHrY+D/20hbwmI/H4ckwY+E1R+7LpNXYMXSpsAHWJS8/Ca0l8x97wsdR
	 w6O1JI1j1vzGfJhAcIXDuWtZjKSfdu16VXe+UTxUFUHegxIv7mQELdjR1jVoefTK1d
	 g+7gU23XoD41Pmu8N65r5D1raTF0ZHhzLpI4P9MYd9ujmTi9JCQ0NtwTWk5FEl8QZe
	 kHwf7jkSL7cH+B6GZHQWg6Y+DmvtSlDFRrahs72L3H+VKXQ7zWteipXS09o93FFpFU
	 N7L6MEwCngE9XjEfnagqL/A8=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b70b21e6cdbso543317366b.1
        for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 08:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482582; x=1764087382;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIyOErqpwna01AMHHTOqB9yVf2/6iPsT5MoLCulL3dY=;
        b=gBUf1LmbEtR/e8mVB++RTqmzpjZarOXpMKiOx7GwKztvlKwlC7NS9uFc8utqSuZ2Ss
         4ceu9I2JFcLsevyIsoEQtp2JzO65YQDgPm3Yl0QoJWAjhcc6gUoNAeOMrwoBwCTUDjlf
         IonIBzU6AIc7zPVHXf4FRHbRPtkvw2i6dry8u7WujW218xN4Kgn7pp5yDO96YiJXfAXN
         a0DhFvFYE9Srto+qJoTL5R1UF/Rsko2nK6cOfHbwbD9NmfvEt6STVc1nf3iDi+aOPo1q
         pxw5ZJO/n2ymWHlwZJJ/XQbg9vjYe2HHhhZ6VTW9K7EvYv3wFp1j/w9p76PuNf6D5cpc
         m+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCC2UqNlpgq34wWi6wd7n4ei9bztRiPeolInTUfn15V+JaGNuBdJnZrU0GOiuaT2eG4FZnKDYVvWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwylpsLH95YI+WY1HsytnFSEzxPYXShC9GrZgAMwpU+/wYIjXxq
	jk0/Ks7ok/qnA+Q3n0q3YFMI1Dw0KgrqI4gTrQ3NbvZGtIwA5sAIAl1CEcBOn3pBHMoms/oXUbN
	EbBOzHwh53iUPr86hwAEp+658ZS1gCFKXEVu5jFhDmS25tPrG7cbnQWzNx2tDXvOvYkLL+RFM3o
	ivUOzuzz6DPai1pW73Du7PiMmni7Q/y5tYN/zrE6361OZ8qOx2GOUI
X-Gm-Gg: ASbGncvFhHu9jA29YF/lMH0f5RNuCMExJ6TxjL2z/p6TJbAnVopbE6B7uVzAnFD0Ew2
	oCYdoeGlLhRDKYjRFx4EPpG8kKNxDy2S3KXcSao1zpf8pcvL3pcJe1nyYyjkzs3Js5aUQjAue0u
	atR28lgXTNG/DXoOtmAaHXbTioYLdlSiLwGT7IZOA8PafEOcOJS2r0CA==
X-Received: by 2002:a17:906:c10a:b0:b61:e088:b560 with SMTP id a640c23a62f3a-b76346ef9cemr3649966b.4.1763482581783;
        Tue, 18 Nov 2025 08:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBn7K4EsQ1/VADA/bQzwH86ZFXAYwYh29/z7evvXjdMBNS0csaU/n5+W/6S5nKTtDNtgN/9vlYqKGmpyFhzys=
X-Received: by 2002:a17:906:c10a:b0:b61:e088:b560 with SMTP id
 a640c23a62f3a-b76346ef9cemr3644766b.4.1763482581386; Tue, 18 Nov 2025
 08:16:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 08:16:20 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 08:16:20 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com> <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Tue, 18 Nov 2025 08:16:20 -0800
X-Gm-Features: AWmQ_blHnUdEuO_Xk-xLGxCSBj91WsT4QrqSPcs0Pl7bY6VmfVJn7i7Sg1yCEAQ
Message-ID: <CAJM55Z9Ep6xAR_TP+dCrSqWWyk8n=31-W3H4Ad6BkWUAWsbObg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mfd: simple-mfd-i2c: add default value
To: Alex Elder <elder@riscstar.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Troy Mitchell (2025-11-18 07:08:08)
> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/mfd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..b0f109b3acc40b074e4d0178e123437495853496 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1260,6 +1260,7 @@ config MFD_SPACEMIT_P1
>         depends on I2C
>         select I2C_K1
>         select MFD_SIMPLE_MFD_I2C
> +       default ARCH_SPACEMIT

Can this not be default m if ARCH_SPACEMIT?

/Emil

