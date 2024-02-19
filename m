Return-Path: <linux-i2c+bounces-1864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7985A595
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A95E41F2219F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE0F37162;
	Mon, 19 Feb 2024 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oYQ7QyPK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE83715E
	for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352149; cv=none; b=Oh/f01xIM5vaHPAy8ptK7JHSOrM4a7dDQdII471zpgL/qVeYq3yd8rIB0t3db0gkL5mABFQvhd8c+nrk/lzXBMhrEHC6a+/W1vEDSSHpq/I2GXPyU7iOBFUuQaf6V1R1MDlrpV0HviuwGOOV5Q0UnfSkRpyU2XEl9TmCPWWnmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352149; c=relaxed/simple;
	bh=4DPLBwTn1xD36bWpSPaGvzOXf4/1hjvap+dI7URkrQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U68qeddc7WlLeblN09UjSpsPJdSZmAdT/9ovlnZlJnZ5rxwN/3uYdR4KJawNxCR8RxxgyIEa6h1hJ02B4p8bIeikVHbbxDW+dI4b0KUPNC1dJ+DgOaF+W6B116KG1LonwyTE/9tDw/leuVVESO25ndcyB4zXzNOJRUekNvDid6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oYQ7QyPK; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60822b444c9so7641607b3.2
        for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 06:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708352147; x=1708956947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DPLBwTn1xD36bWpSPaGvzOXf4/1hjvap+dI7URkrQM=;
        b=oYQ7QyPKwZrJxc/1vWnh+IdWeVJWVKMLO9KhD2PtbYvEiDGEIvVKCSoTEFI3hvTEBe
         XTcAWQ6x1AiaQRpo0wzhihVhYAYYv30KhR0oVYuozJS83n64XybRQskSrzLwqt1VVKRW
         +DTACQ1MdDP1xuTKa7BTfLjOkdNK+4eSGpp4eRYMgu26XiX/LCTnj6sKbhg27n2IgCHP
         4I5hnn7Eicz6fbMRKixnOh1Df9c2TeVPNKaXxGv04RRCb3pMZfAJ4NUElButyrt87k8Y
         c8QNjroMSLFESAkVJX4LMWAvnjyB7gVChuPMANpGgkfzEG0nkcQmhU4gw774K0gMtIrC
         hZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708352147; x=1708956947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DPLBwTn1xD36bWpSPaGvzOXf4/1hjvap+dI7URkrQM=;
        b=M9XN7F7ekLJEYqFGlnU9vNtI4yN9LSKIJgbfsq9DMSd3CRSdHi90CeSTh7TcjJidlb
         42Fj2O42bje0hnV2wHdk1oV0KjIngby/GC4BEqzx/V1gN05e0Qr3Lxtyar3FEUmkkn+Q
         Syg3YwiYaYNOfYTcZSD8KlpUiwqHIye0NH3dfwJDLgosKS+CxNGLJNemJOsxV2xjD5II
         7mvlkmlubLpz0eo5YNdAfcH1pOS6ePbwC5zWxjDNdGO0NXUseVTmuchCRbHUr4yPqAEc
         BXrBayBTFL+uTPhQCm6PQTCHyNBS+h5oLw9cHKXrqNQNYqshEGiFIhIxTMT2mFkrfBqT
         33iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1BbEYYslyTOagEyP1RJ4mivs1hKjtF2B77hYSXoUSCxQDp9A7z8e+Dr9swJotk3gvczoG3RgmfbeEnO7zrgw3cv3nPc1H9do
X-Gm-Message-State: AOJu0Yxbqcr7Hee/ThzcdGnzN+a4OcKkaihjUQBxQYGu0hM9uppXV5RO
	ydmkjm697X5Ixe0JVoLvBr9c+Nhr6AnG7+a0RqPFOg08PHHyRtxnWqiqa+OLlaorie4pcHYqbr1
	JOXn0m7/etXgjdsEKBMTxMGeup+LDpERbMOPeeA==
X-Google-Smtp-Source: AGHT+IEGRelqWe2dTiOY9iPHsVWt5SGUzoFQvr/GztPD4++Mw1yGR+nXAuOs79zdC55kYgkbpeTBWZqjsyVHDwYA5+0=
X-Received: by 2002:a05:690c:a81:b0:607:b85e:2d21 with SMTP id
 ci1-20020a05690c0a8100b00607b85e2d21mr13022466ywb.24.1708352147092; Mon, 19
 Feb 2024 06:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com> <20240215-mbly-i2c-v1-5-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-5-19a336e91dca@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:15:36 +0100
Message-ID: <CACRpkdYZTrEKdGfN-EiOTWtQhhMHVqk5zCjmcAuUZq9aWesqFQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] i2c: nomadik: simplify IRQ masking logic
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

> IRQ_MASK and I2C_CLEAR_ALL_INTS are redundant. One masks the top three
> bits off as reserved, the other one masks the reserved IRQs inside the
> u32. Get rid of IRQ_MASK and only use the most restrictive mask.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Yeah, more readable like this definitely.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

