Return-Path: <linux-i2c+bounces-2437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26879880D14
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 09:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56BC81C22B14
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 08:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F44033CC4;
	Wed, 20 Mar 2024 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSqBlz6N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F73338DC0;
	Wed, 20 Mar 2024 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710923540; cv=none; b=K+MRVa8fpYnXR+DTutnbBNghchXrpwVzcelZTpXtaEq6RXj1pRCA/lsxoWN0qMD/135qPD8ClaEwAkEP/cKJGEPyD+4PqITwWn2FBQuGhrMxO0Rw+iDg6kCQoAYCYs3wEuD87KcJ/EiEkBj98HRm3YxJQxP2iwdEUq11cXun9cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710923540; c=relaxed/simple;
	bh=I1GjyquXx44yYevg7HqbsGvpoYxKwSNXqTAAuylPg/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9rPxB2kEuc3OrPCbfumPBBaYQKojVG0H5FAWqTCRMUHS/K88ZzIrenIoTGHn4CLkKowmlUAXjesLeNCnrn+A7Iw5/qj9hyjtVGfqTDBgn8SUjruW/l6UVWZKbBBD5QuaazBoRzzksnPwFhrSLLLC5P3VbGeuTMQyWJ6PK7YN9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSqBlz6N; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-229661f57cbso1351060fac.1;
        Wed, 20 Mar 2024 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710923538; x=1711528338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1GjyquXx44yYevg7HqbsGvpoYxKwSNXqTAAuylPg/Q=;
        b=mSqBlz6NJ3+2tCmAGCEr3/IaH2rliKQiymVWeAiE2UO/2Is2feelSUtuV9SDk8ReSp
         Wxex31zQPLLoGFbb8h6S/wiUlVXS666ZVEU0edgawGmADu3/1Zvc3hPw5wBNJHTA0UND
         9kTIULEhoEWbVs0ltDg1lSigk3L5M1RXf3eTNZwwAYLZvQEjuGOzwDnMucK5ZLtK/QsO
         wzY7qWXrKrwugPPTB6QparhZ6Yg5unsQlzjyW77tPehEq2OItjkMdk8cR4XodzTGbz3F
         0IBaJCDsqa13D+MQPDVTSv2Jlo6tZsjxxaHW0UYREM5bSlQH/0lI2m7mK6x8TsuMDKsn
         O8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710923538; x=1711528338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1GjyquXx44yYevg7HqbsGvpoYxKwSNXqTAAuylPg/Q=;
        b=wudnkfcYEn6Gm9A4EoeG+MeTDnWgtiPBsqK5CH6J1aow2ZZHzy3XZDDGCMY81e6+s7
         KWlB+jMFxDsCpiKaUEJRfrHwDWa3wOxhPIkQsL6hs9/YstcV4O/8QazbHDDJts6bN2ot
         0ELuPWtchwkrJx9T5TnhASIhDesaE+JiQUy3rJjYnF7aNy77YL7hPUEXOlwEDlvdjarJ
         3DwyarPyrcoRdyq5FgHTGipRpOxFydw83T5x34A1GpTXbjSu1m5EjkkoVZhCZXWznioN
         DU62Qzt5CtdKL9EbPjj804XJYJZJTLnYquQQ4erz0HGzzNSjQhAov6DuqJ2gRSB+dXIL
         rD8w==
X-Forwarded-Encrypted: i=1; AJvYcCW3HZc5D730D4R7aJu/UmaZQ2iI7Zr+1Eh7Sw/IDWIRTq5zRXEhjwMjXNNNeYzVoM/9W54RrbUZbp74MxOnQbaXto1Qtj5dezbNG8PxmtlbyEOAbRA7t4APVsvyJWNb7lZ9/7YAFyE9KKLXe5uOLqsWnT6ESmrnXmmPC0IVqo1aNXCrcA==
X-Gm-Message-State: AOJu0YwgMX7IT42s7TSi3oA3uuFWwxAsUvL6PQV34CGFcTb9YGIPGGdT
	asbm8yNPtdwKX12WADNWF4uoLWGXFXZpdENNU684n4dQGvRkQLbqOtGz2iiNcBFo6F6EPn0CAkd
	UfgarpGac+4g6zNUGT14FTco9Flw=
X-Google-Smtp-Source: AGHT+IFiavUb4RKpde44jEu7GlR1AFgB69m17aLQQQQL5sk9DzK3kTrvPW91CotGDjLYbJieZL/MDGjGFWjLy+czHIE=
X-Received: by 2002:a05:6871:5b13:b0:221:96b2:5a4e with SMTP id
 op19-20020a0568715b1300b0022196b25a4emr5273606oac.58.1710923538332; Wed, 20
 Mar 2024 01:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318153959.30755-1-animeshagarwal28@gmail.com>
 <20240319-oversight-viable-4550ffbc31d9@spud> <CAE3Oz81-8tV2iJc7Jp3B-ooHvGeOSctxUAvd_1dA-3DQRUJFPQ@mail.gmail.com>
 <2b45017a-5a68-4c56-a1b3-ef17163139d4@linaro.org>
In-Reply-To: <2b45017a-5a68-4c56-a1b3-ef17163139d4@linaro.org>
From: Animesh Agarwal <animeshagarwal28@gmail.com>
Date: Wed, 20 Mar 2024 14:02:07 +0530
Message-ID: <CAE3Oz81K3dFW7PNV+oEq4HEbTWYP3DkLbpztSXg2jHk+wh1Ebw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: nxp,pnx-i2c: Convert to dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 1:23=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Yes.
>
> While at this:
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.
> missing i2c

Thanks for the support on this, I will be using proper subject
prefixes here onwards.

> This is an automated instruction, just in case, because many review tags
> are being ignored. If you know the process, you can skip it (please do
> not feel offended by me posting it here - no bad intentions intended).
> If you do not know the process, here is a short explanation:
>
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
>
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/su=
bmitting-patches.rst#L577

Yes, I'll follow these instructions for v3 of this patch.

Regards,
Animesh Agarwal

