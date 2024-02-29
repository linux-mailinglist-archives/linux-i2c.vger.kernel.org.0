Return-Path: <linux-i2c+bounces-2079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D600F86D5F5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 22:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 735D61F24E3E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 21:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037A214567C;
	Thu, 29 Feb 2024 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d0N1jv0e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A62B14566D
	for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709241010; cv=none; b=BgGkS/ZNDNjUSbsLqHGHORFfoU7XjSWjNg3WGzH1ThtSy6K7cnYxpQBGBwlC5fzftJqGDOtVmEM2vF6Ug8DoE2H8SDtg52peYTbIsyfARNIeQgLZ9778KXCOOFMJvlEAc0dE9pgard4DGH6Jfw9ZMZNaJG5Q9/kF2/8p2a2lVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709241010; c=relaxed/simple;
	bh=S8fZ6oYozb5nHV8nQRv8KctbzAfbnxof3VtKQDRYRaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrn3NDYfQn0r+UABn9jO63R7393Bfq9VIDc5XhGoklPS9tW5YVhirux0TIk61kveNRI+enw68++mUPcvTCLy6lJdpyzKy7GalcmwByyu3WalHoRSXzdpFctE5sJSgDYLKqiFZcyofmFiqSrK+HisxXwQi8jMN4ts/sF7O+tuSEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d0N1jv0e; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so1469377276.3
        for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 13:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709241006; x=1709845806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8fZ6oYozb5nHV8nQRv8KctbzAfbnxof3VtKQDRYRaA=;
        b=d0N1jv0ecE497SIdHY1a0HCti2dEtiEy95GKD6/ZSYIRxqE2CubgluTDIa0hm4ScFQ
         Pa9i3kXtrf2sU8cUdQzxmHsrJpUCJlVxiEtaetaZT+FGb6WCrZEypaM3amhqu8abO62Z
         dFVyfhaGTo+3D/1YFH0G+y7SdNlpDI1SK2tYrIAsELS6Y7B+qDL4odKyrLFPvG3IgwJ8
         nwQQBkm/3KGg1PlfwC1Fk6+8DuQLF29x/LRS7yT0sENWp2U4NMz0rfxTPRpYwyj7sCPi
         aP75dC3/mJKsK8noytXh6w9j6yMmxfRkwpa6tMGGbb1L1CVylTnShJ8Gyox5sbS6kfCS
         oAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709241006; x=1709845806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8fZ6oYozb5nHV8nQRv8KctbzAfbnxof3VtKQDRYRaA=;
        b=QJaOmWkA3uHlFifiTuFPrfRQy8C4YLvv3ZlydPkNHDb4NaNtGBC5vgSFK/MZAvAUyJ
         kRpqZm5Ha1Q2FnYYMNifoFa9J0dAsQTwGwQ+Vd8x5jHS9llc/HOGt/j5y27IIjWY5RFd
         Ipw5UAwnSMVE1EWu8amMAsVcBh6UKmxn7xyKp+QypCBRQfutA1ML7xd5N1dmOnhmO+nd
         T63+Jnk9gauR2Yyz7vMGQJAwcrtf3ibS9O0attxG2ac4mBUjS5l9Hh0/wsZjP4YpXM/F
         5+oVFWf1f/foFJNvGbZGIxGRoSTUzsOZRm5frpB7J4uOue9GVnMAGyNenNcIp0gGlFLf
         cs0w==
X-Forwarded-Encrypted: i=1; AJvYcCX+umXPfsyvvKZigHjbDKTpAltxKH/e0IJHUTfHg8adbIhNN6PcdCL6sexwL3htz9YflpMdpVyzYsfT3siEKrgbEqDug1kyzCZi
X-Gm-Message-State: AOJu0YxNMyB/T1RXllsScru6PM0tldrj6UflB0dEmZ3vXRuHvbrn4ac/
	NquPR6bPwx4oUNJ9GJ/6+CoFA/zTtmcbSI/ykg/VESl+BtkHOQWuhsQQGY2shr+owrq4BRhAGSJ
	nl5GR/UAubyXAwzGj8Gte5uL3f9vS2Anlxbjm1g==
X-Google-Smtp-Source: AGHT+IHpqt7WVprMdgDUXDj2HfXpkMExj7EZqboVSsy0vCvMNy6esVauMuDWv/acQi58TDCcoWCPbUaQEY1kCjx06I4=
X-Received: by 2002:a25:2f45:0:b0:dcc:8f97:9744 with SMTP id
 v66-20020a252f45000000b00dcc8f979744mr3219750ybv.43.1709241006597; Thu, 29
 Feb 2024 13:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com> <20240229-mbly-i2c-v2-11-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-11-b32ed18c098c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:09:55 +0100
Message-ID: <CACRpkdai_-FyXc6+oxLK00Esdw+akg0==YEUv+B5nBcWafN6qQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] MIPS: mobileye: eyeq5: add evaluation board I2C
 temp sensor
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 7:11=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Declare the temperature sensor on I2C bus 2. Its label is the schematics
> identifier.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

