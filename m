Return-Path: <linux-i2c+bounces-1865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ECE85A5A3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FCFC285876
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4CF374F5;
	Mon, 19 Feb 2024 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTv2Tzzd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B852374EE
	for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352215; cv=none; b=EesB/mA3Q1ep1jhy4YEmFo7MtuDsnLLd4h8q4/pb8RkXhRFQy337wCF//OqRR7iEEDUbl1B8ez/U+BS/b9i28XcRgTvNjMknknt0glCFbA1Bpf19YLIwpsUQseLOpFQ1Sn5x6rP47QvjJtLSEab+EfWaH9nV4USOWbQNiq9kEqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352215; c=relaxed/simple;
	bh=8NtoIAADVPgZfZLTu67UGU+6DVV3ajBVgGPX09bdDig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFQ24xJP9vYkotrFxTu1jxnxrBT5SsgvDwyYXHkNzlfzX04mUbmdCVvJ4w2zjVKPsMZDFONQZiDezubbF5RTASr5k0qEjR51+1+RIASeetymlPO/nYpjDPwOCSquxAR0Kuo5o6pY8Jd/27ClV0Iu3GSJjVymHiGefmHC0hle2MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTv2Tzzd; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so3401909276.3
        for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708352212; x=1708957012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NtoIAADVPgZfZLTu67UGU+6DVV3ajBVgGPX09bdDig=;
        b=MTv2Tzzd2/VA7oqnWwbz7W2mSvD1P0Xm2hX6E33qmD4jsA4JVl9TLcvElzZDnxGpJ1
         KMbzO+SyjetWDcFovc2LMOG3bO4KqygaXRmpuyX4MCbNNEjSEGEbr67tsOiDctvnKBSs
         cka6Q8vAoh48DbRQFiOzYzyxX9PTQzGlQcuTSZw22/64TPzm6CVIAqfIDLnR63acoQVT
         NYjpVUw3nFq3mcgbwpH8Uwp6LQy1YJS2edqC3SApJuEtqu8kusqH8VbGyui1o0AIhBkt
         rw+WfqKQ0R7sHoqxyziSmMf4hhKmLVlui4cpqCgzk4JzMnvbKZ0aODGjI7ZHithOYPz9
         RP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708352212; x=1708957012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NtoIAADVPgZfZLTu67UGU+6DVV3ajBVgGPX09bdDig=;
        b=d9yOKpjAbAjSbHQsS/dXc63MqIzyWgQnrNDBnLgF5i2S/QkRNu/pQXtrpLGTPf5ust
         I/j2GuWqP6sZlkwfBQW/RpirJIla7YqQNBymyhaRGQU1LJvDEwZyrXbqa0vRWrdpixJ/
         j26STge5xvY7JxiIIaL7zZXl3QcigaujtpiZLlaLlXlIk2T77Z8wf8v7TPVS9steYa2d
         /NACyXucieNto3lJBazhlwMFNFdxkg7QEQ7eVzQoUR1vU81rAftAyJUUswrm/giwWlnh
         Px6ZFl+KPr3iRNK58Krz7K2h0sCcitpsEBr8TKrZcO6k31Q2ww4r/Gp3fFshSfnNGolO
         VDqA==
X-Forwarded-Encrypted: i=1; AJvYcCU/LSEbGqkjlX0QFVyaRP3OR8kc01Briva2vNmMpteYBskJ7inFWs4eKGVBXNqEiA5rhnT0l+RwQM3c5KEx65VCWO/r/dW0tttt
X-Gm-Message-State: AOJu0YzOvlkLxsj7lxDqd289iWT1BO9qPWX6eBzdxcrx5aWLtqTcqtCN
	bD1Nvnmo9Ixf5IZVi3v5BB6eCZtQv9fx1nXSvK1JZkL174oojKl/zNa2VLXSY0htuJSgb/6dndS
	D7P04t/kbVYpwOn0rb9GM+yo8wVOKKiy5EI+USg==
X-Google-Smtp-Source: AGHT+IH8zoIF6nwlmjqS5YKC62u1494qWLmxwhbcebn26N7GSaVYv8uV1vUneZZY53AiRhaVHNae5A7n3HAWkkeHKYM=
X-Received: by 2002:a25:d64a:0:b0:dc6:af04:2e05 with SMTP id
 n71-20020a25d64a000000b00dc6af042e05mr8299772ybg.7.1708352212135; Mon, 19 Feb
 2024 06:16:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com> <20240215-mbly-i2c-v1-6-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-6-19a336e91dca@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:16:41 +0100
Message-ID: <CACRpkdaUJ6tM51o5tDSMURFS3u8J=dfMN+p4j04QNXdGUPzCXg@mail.gmail.com>
Subject: Re: [PATCH 06/13] i2c: nomadik: use bitops helpers
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

On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Constant register bit fields are declared using hardcoded hex values;
> replace them by calls to BIT() and GENMASK(). Replace custom GEN_MASK()
> macro by the generic FIELD_PREP(). Replace manual bit manipulations by
> the generic FIELD_GET() macro.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

I'm a fan of this style.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

