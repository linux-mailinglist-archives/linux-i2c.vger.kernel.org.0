Return-Path: <linux-i2c+bounces-1861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B965385A56C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7D61F24882
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2F737142;
	Mon, 19 Feb 2024 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x3DauRNp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A9374CB
	for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708351618; cv=none; b=OBj/fls5kaTyrRmQsX6XrjgwQQnA1pwpruS7brQSLNn10+luvC5JCMIQA3r9Mj7BNJtwRty8pOU2x4F8R7wZVNu6/pIA785HlV0XUVHuwPUEmiw0Ftlx0cZP6Tyo1QDJaX2lFKJZp1tYEB0CNm2TlIl60MMwYKmL05Jx2pVdLog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708351618; c=relaxed/simple;
	bh=ZN4BmNlEPEpjW/1H6cuktkLIhxEDSd5BgGVVJDCLARw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnwWGOEPeXhz03l3Z20HYDE4ILpfoU71TaRiFfc4PD9cQ6yPJnLDppLQcbhddOGwa2iUsxZ1pvSWsQNVLyIUVgnDHmctDip84wlsCG4UMETZ/88ESPXPXZOD1uNhXacHTlDlGWAbmUyAvTBohNg1L+OsNIaT7gXlWk3UGo53t0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x3DauRNp; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-59fd69bab3bso123249eaf.2
        for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 06:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708351616; x=1708956416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZN4BmNlEPEpjW/1H6cuktkLIhxEDSd5BgGVVJDCLARw=;
        b=x3DauRNpxSasiSusCnfPUiD99ZhMX9wFlxFvRukioEBT3PUdaDkL2Mkfq8RWevdycb
         M8I04oIPCDGeh4t15Yg1VmICe71+zPx8hQe13O0ChRc2IPfjI6QA5IuEuzkKXoW9UL26
         jvF+w0UJ4HF1bhLJLPSk8paQDTPTEY7+Amx7g1z7bscRESgf8fntXmFX5e/DJt4Z60yR
         Qv6ITduFqDuGDJSltMT6fWgNGpkfM5TI9zl8YZKAnkdpsqyGQpN+LuwZRQ6c4bDwxpYc
         aomNlT11H9eb0Tc7+1EU3n82UygI3v4YHO7TQmKsRAGPQlcpYnaBTpVYlmDtjSITYoXS
         bxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351616; x=1708956416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZN4BmNlEPEpjW/1H6cuktkLIhxEDSd5BgGVVJDCLARw=;
        b=O5O0GPAxDcR6acJPZXLq2+nhUUdAlZQlF5WRgWfwpgD6C2LMsHzaA0vsCQnM0AwpKJ
         lMe4d3GgH8H9DEvgSmf8mEooG01fj37t4GvevJzpAAxQqdGZ5Bo4YZtHLbBEtOojhUhR
         FoGCap9/P7ICRxMJv/7FpFKMNBTRnP2ohLr/JfE0Lq889jAbNklyz1oVzoHRPfk/MJoq
         DkXaWJlE53bKJjTl5OZbVgNMXhnDBmin2zCWdih+fWdB5ON8SolsNaMTjXVh9PU+/cjp
         sRTmS5HJ3onadSvazQtUB70AR69xePjI+UtuBXzWHqkGLU1/hvhmAC5Egvea4atkJ1wc
         UHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKUBxQdZdnvnahw4xUZGkjQuzD8J5Gh5lchnpaa3eP08mIr/tb8iN2LHdP+SSItI4Xcpz7ZD08TWc3GzRYPDuaXnZilR7wVQ9r
X-Gm-Message-State: AOJu0YwlMFB3OK4BhwLJRSJixnez3K/tiDdkdMs/XdtfcVvj/lFuGv63
	yzF4HUzGCI+tv3IZFQdAWZ5bvcan/+Bw6TD0EcgVvNor01z66EcNXAU7RXzweD6iaYap0h35MHG
	B/17Sl0U2CPLX7Soz2IHI8oGcYBzTNy/yjp3A9g==
X-Google-Smtp-Source: AGHT+IH04EqapwhcfryqkGeJ0PLDo0rjKByqtrCM8cYE2MnjC0gv9WZUijbBYPo1lK02ZF+BZQw3zmYboI9pZdUPgfQ=
X-Received: by 2002:a05:6359:4427:b0:172:d79f:1841 with SMTP id
 nz39-20020a056359442700b00172d79f1841mr14599705rwb.7.1708351615699; Mon, 19
 Feb 2024 06:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com> <20240216022704.GB850600-robh@kernel.org>
 <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
In-Reply-To: <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:06:44 +0100
Message-ID: <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Th=C3=A9o,

thanks for your patch!

On Fri, Feb 16, 2024 at 10:16=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> i2c-mpc (fsl,timeout) and i2c-gpio (i2c-gpio,timeout-ms). I agree this
> prop has no reason to be compatible-specific.
>
> Feedback from dt-bindings and I2C host maintainers would be useful: what
> should the property be named? Having the unit makes it self-descriptive,
> which sounds like a good idea to me. timeout-usecs, timeout-us, another
> option?

Use i2c-transfer-timeout-ms in my opinion, so it us crystal clear
what that property is for.

As Rob mentioned this isn't in the kernel schemas but in dtschema, so
you need to patch this:
https://github.com/robherring/dt-schema

Yours,
Linus Walleij

