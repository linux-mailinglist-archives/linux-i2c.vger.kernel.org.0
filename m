Return-Path: <linux-i2c+bounces-7297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279299968AD
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 13:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55CDB1C22D90
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 11:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFDD1922E1;
	Wed,  9 Oct 2024 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQkj8Ab2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF6191F95
	for <linux-i2c@vger.kernel.org>; Wed,  9 Oct 2024 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472957; cv=none; b=GLtQ+AT3Q9jUNliJxtnd94hQJrfbJ7MJtyuvZsnhT/E0ql2kpYmOdbNmP/EdGdCwlgZYqEmHVwzuyNe4WtGIFjZzMIpQgSY/eHZDf35flMmTt9APaWEcJukv+uqDn1oMCC8l9OG6F514TYrfTkyiEHf2KEy1fKrt5oaTcDPEF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472957; c=relaxed/simple;
	bh=LGiw/oc9ETyEARgRG3P57WvWVitY9aVPClt8FRfIOtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g119i7Ez475kwy6lUcHbkF+UQ35XgKePrjBRFdd1vMoTk2MdEdM8ympPuT42veyR4lEp3zMSN3Z4rgcLitKNpCbaR3Pgm8RGGaND+gTJABOv6NMWs6j73AWFSpkp30sUKFBe2OfCmtI+brE4FmI7OblTYnpMSt6oZdpnOk6kpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQkj8Ab2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fac5eb10ceso6990691fa.1
        for <linux-i2c@vger.kernel.org>; Wed, 09 Oct 2024 04:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472954; x=1729077754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGiw/oc9ETyEARgRG3P57WvWVitY9aVPClt8FRfIOtU=;
        b=bQkj8Ab24KLc7ZmUzcepDf6xshLlQ7KL2rKVtHKrfN138HHwTsRaRbySjyCISnjIjb
         suGwrTxdKzVHM2BXDrNxOTe/ylLjAo5ZMg9GDCaqifo5wynlO230qzCMlncbtYANhOrS
         l/a0HMy/OwRGCT5ye0U3dSjVvtwUYfLKa5yq2WUx9WU7f8NpI1R1gKQH3giUO4IhcdNh
         5b1FYti00nHQj7u2ugbStGqDKp3O7FusgpVLkxG3aGUf43KAEIgHp4YaYqTVNaXpOxip
         sx8Ji52k+jua7hyurFCanal31+amM1XzbyuSL0DALX/ERG+syOUgXfA6H6T1KLiL54wn
         6pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472954; x=1729077754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGiw/oc9ETyEARgRG3P57WvWVitY9aVPClt8FRfIOtU=;
        b=j54ImTVd62dGcvXnYauk06oQdAFO+15roz1KFNxcSv8H+FeFC7uQiLP6Qh+WosFQVA
         EwDMaBiqzlQeahUgRNMofEHBAXC7CS4abmnQ5fMbyRZGjUhZYz092hL/VEles2rdIVFr
         kYyF3UqSMg8F3wong6awjuo4g/QeOf4laWm2JiNVdhpG5rQzlyoll5/AoV6uclQNx8gb
         XsmznSfVZuvTJoHPmgY11lL2KoY/Kp9DREG1f35sIXWVs4loPQeqU0UMnmg4YYPqG/WQ
         pNBsSX7dcJUzHSR6CHxZNKu0EJJ9bG84vB6v72o4qnfsKIy6Y4tPpygbWITeJrsDqOix
         vNQg==
X-Forwarded-Encrypted: i=1; AJvYcCXpV/+OiZV+MdNEH29PhUmzFPUP/r36so6bILaCTpBagA+KM6ztDfe9vwPQRTTgO8JU0lLSAa5aa5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmc03G+r+NRSnRuKg4P/h7Zph+w2bApTFNNlnB1bp1tltQQqC
	IKxQ+N5S5ptcGesit6Vq/bCML3WeYCn7Aw1CBYlY3e1KngrIvluy3XWPEnL+F6rkYQagjftuu18
	q95RdxU/ZLSA5GqwkfHy6F3ZtyZvGYvrS1/LI7g==
X-Google-Smtp-Source: AGHT+IF9zAl8DQPl7zn/Ing4gQVNbPa2pljdHpuKWGx3GBhCA9FkwWGI/USumIRp9+/7OCW4AwqSo0p20trwIzg0dTU=
X-Received: by 2002:a2e:809:0:b0:2fa:be1c:7ed7 with SMTP id
 38308e7fff4ca-2fb0de96d8dmr16651541fa.12.1728472954225; Wed, 09 Oct 2024
 04:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com> <20241009-mbly-i2c-v2-4-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-4-ac9230a8dac5@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 13:22:22 +0200
Message-ID: <CACRpkdbyZMzEb2i-tjeUdns+cODBeQdgXPH7EAaEHQZ8=gAkaA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] i2c: nomadik: support Mobileye EyeQ6H I2C controller
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:23=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add EyeQ6H support to the nmk-i2c AMBA driver. It shares the same quirk
> as EyeQ5: the memory bus only supports 32-bit accesses. Avoid writeb()
> and readb() by reusing the same `priv->has_32b_bus` flag.
>
> It does NOT need to write speed-mode specific value into a register;
> therefore it does not depend on the mobileye,olb DT property.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

