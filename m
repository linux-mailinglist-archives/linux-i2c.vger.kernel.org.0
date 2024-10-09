Return-Path: <linux-i2c+bounces-7294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E39996883
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 13:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2559628789F
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 11:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9151922DA;
	Wed,  9 Oct 2024 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqeShJgj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD33191F89
	for <linux-i2c@vger.kernel.org>; Wed,  9 Oct 2024 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472849; cv=none; b=jrDcuWDnXWD6uya8FTtS0yG+SPZd8P++C/2Y6RZ2itTqMOrUY5tFObch/lHjK2U7flVk8ftTSh+9XIDN1c2rW5fbCfL6WgJoqBsiEf6Xfm/7j5By7Oj1mcTseqjoWoH4vPDVL7o0l8xNX9cHudy50RzByieHk7nqzxB+YqX1Vb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472849; c=relaxed/simple;
	bh=pa78TRizjjVdE0dxmdhb8BTfKSCsoXg+Ebuf5qNTjkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLn/dXU/COpOKvQ6Im/rKfexxd1Da6e+ysBggxxchNz6T7waqUHFn47++aD1Gv9UYLQZyYyKujS8PseqM36c11FeUNA/kiVqLT23ed/loy7yPkpl++lA5d6M0HbCNjLp+fnPwvzF3C1vU+EYpsabIi86+xOExQMDYV02O7YHanM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqeShJgj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fac275471dso7536931fa.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Oct 2024 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472845; x=1729077645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa78TRizjjVdE0dxmdhb8BTfKSCsoXg+Ebuf5qNTjkM=;
        b=YqeShJgjUs7chd6glvyFek/9PLvFGG9cRJF0zzHAqIZYSBMdEegrpjXNJ719auOC2X
         nWyN09JhA5GWoh3RokdLFrQOXxD3LUD72gOQcwJotnVOx7ZMXUQ9lkqNdqOz7S8Z8z4a
         cccHLI+L6aTQMIHtrukZCc6xQQ9I2TzrMtvR9L/hp4+ZORZ8/BqmMYvfDr4ZPZ2Whwck
         MAyStnVzqexV54WAg0XnJgnBuODMAe/3y+lnL4eg5EkCypK3GuqlqYiuT3M1Ox87Jl/R
         bM7BFZ7HZ3JysmO3PXyLWeC+N7f85XH0pblSPODf1g6Rs7ljRritjuMVK2atW7RVnVbZ
         y2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472845; x=1729077645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pa78TRizjjVdE0dxmdhb8BTfKSCsoXg+Ebuf5qNTjkM=;
        b=EFl4daWGnWi0ZDdGDaZ1viv3KKXCS1hK77dmsY/2a1WHOhGmaMDb6kXB61veencHV2
         KHrNpOyO+R/exKr3g0O9/5kt/Lc6YaZ0sNFryPwTcTwOjkQo56Ssg79zPuwzFWKgWRhv
         6NkNM7h9aGw6f+vZZvKqL9e16hjelHt8dK8c97NJouykJhzfUg2WpQn4wVjb+7cO6Ywz
         EfJFCLzbWolk3PqI990pczMGueIG6frhnZyCCfM+HyADz/N9c5M+r80IhsRPWFngf/Zy
         cCALKin4TWIKk1sLZ4XqQMxl/nzYHGZpcxFjyhEM/cuG9fJPIuS9yN0RqG9gjX5fUXG+
         mrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCURaOiwI05/3lJpCpgU4HiT/pt4E9qxlHpj1WqGoN6jypbAbWxfGI0a88ut10/asna1sM325rljDNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyedcKTW51OMPQCJrYrtuQ/awK3eJBly7X2376OYLW8i/oUhRhh
	0tlOE/ovfJYuIE8UI7a0RQhOGH1Sk6kYx2TAnLmJHTXMqRqsZdXNqZ1Pvf/YCjYA2ugDd4+uVBR
	OC131XQHgeIXq8KQozXp2hLxOWJxvcqlB0qu7TA==
X-Google-Smtp-Source: AGHT+IElCoNgHPYdEDIW8DaGG4e/y5QuMTEaASb3YR4mU1fiWgN1TxZ+dX+MF7ei6SiMh7r1qC+FAYvY2X4n0SFzpcI=
X-Received: by 2002:a2e:bc13:0:b0:2f7:5900:1a37 with SMTP id
 38308e7fff4ca-2fb0def33c2mr21404571fa.17.1728472845396; Wed, 09 Oct 2024
 04:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com> <20241009-mbly-i2c-v2-1-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-1-ac9230a8dac5@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 13:20:33 +0200
Message-ID: <CACRpkdbCwrh4GD8BpP0DV+9=T_i+5nXmtwz6K7KDz_jwuxBp+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings
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

> After EyeQ5, it is time for Mobileye EyeQ6H to reuse the Nomadik I2C
> controller. Add a specific compatible because its HW integration is
> slightly different from EyeQ5.
>
> Do NOT add an example as it looks like EyeQ5 from a DT standpoint
> (without the mobileye,olb property).
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

