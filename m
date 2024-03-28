Return-Path: <linux-i2c+bounces-2642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C619B88F9D4
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 09:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 663FC1F28AC1
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 08:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB82548F6;
	Thu, 28 Mar 2024 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGPu1T60"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6E54673
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613618; cv=none; b=UL1Zg7AwbtXhwsKFvPGXm+nFebYlhPyWcWH7zgNQlbXpnUeLoF9W5CsPr2D9j6IbYcJkXw82blZwhHKZUOIiV4O0evqpeD30aF3HgZp8+NuwRZTg0glV6wNSNXnFwYo81P5RZ4bEAfDRQvSvhmif7c52yN29PP0QT08VhD+hAcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613618; c=relaxed/simple;
	bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlbKuzo1J56WLO/DS71er5iYMreX8HwmmMZwFgQwcH2/cIbNTy6H6lu/EQi7XsvPMCctRtDT0k08jz4kMKhvMJkmNY/eDVgywT69O7HNxGKNxdewtu6uht82EVPRMYdOJrp8YV1XyJ6QGxWRdwsX6vcGYLuibZc7LipD+D/kQYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rGPu1T60; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60a3c48e70fso7016947b3.1
        for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 01:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711613615; x=1712218415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
        b=rGPu1T604f65l8GfP69kX6JRbPffcFy/o35NPUwWnMiP/cna3H+Xg6fNhGYjtKS/G3
         RIy2e+bzL2xqdVXw2Z1021NrZmaTNrC+1qdFbpX2LZqGwUoNEmPWAS77AlCMMW4R1tA5
         cSWIy9kTz/13r0R7fMarsZB+7B37iGXCyyY1o7kKFjbQKdV12c9fuQ6zf7oNTGQI/Ko6
         V2B3lNf0ejPgsV8efoBeRELRNgcYaL+zkX6oTjEZlZVS8/14Q2x/vde5CdsywG8B4+Pf
         LBzjuPTq03IHDAXgBa1udYhNf2GpW0xkAEoYJkI662J3Uv+5MWzozByvFKcN88G83Svw
         ejkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613615; x=1712218415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
        b=IITdNb3R1aQbfHh2rTsNisOrUsIwuNza8+qDR7LKCvb7tJibinRlagC/P21I7BX73y
         urmjnAqBKbOPnXOiBIGVADIEUZHeSn7KILPdbx0knJknY7UZVFDJZsOym/krFrLR/zMO
         eS6w9d+zM8/4g83QNhC4F3HAekxcwRtDrw68Uz9HP23cjVWwDF/V+Y3lptFBQoP/n3wf
         iwX+cz/AeDRwvA7dck1/9FBFSi7WGAyChp5Mc8rvh62RAIWqjTpGTHiYu60zuLhg6yrb
         4sshDgv0xL+wAHwhk+RvyoJFuFtS02gpbXlIZaNS/WIA30KMB4m52AfSMgJj0VEigSyU
         U+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUypP1H0hfRFR6hYEovDmivRIA5oU9Y7U14Wdhk9PIoZJx4U05wID9yYVSU3jLvb+OwznSINPU+4sExZgUuApzZao7CIkDAAYGg
X-Gm-Message-State: AOJu0YxsxztNCyb8eG3sV40/eYEopCSNP9yRt9AJp+TfEV6eJoDDkfbO
	d7RcIBUsLKHsEAhIzB9MyDePZudPOySAuwPjJT3pYGmxsjnkIlbL1OK5alIHCDvR/tNDZxdWeGX
	TUDmNSDUBLPV2SXM4dUvKmZLc5g1XcCHikE7Rfg==
X-Google-Smtp-Source: AGHT+IGMP4Tk1rGQykOPNpks4MpJ7aMlQvkvBPR1XoNvNcoaKqQfOEDiNp35dK3mcwnlEPOwTL2pN8U5wfPMlD/HYFQ=
X-Received: by 2002:a25:4dd4:0:b0:dc7:4806:4fb with SMTP id
 a203-20020a254dd4000000b00dc7480604fbmr1887988ybb.8.1711613615243; Thu, 28
 Mar 2024 01:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org> <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:13:23 +0100
Message-ID: <CACRpkdaXWOp9C+7ahUO+6eTGodABW1D3CAGoE-6RrXbFcpd8OQ@mail.gmail.com>
Subject: Re: [PATCH 14/19] i2c: nomadik: drop owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 9:24=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Amba bus core already sets owner, so driver does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

