Return-Path: <linux-i2c+bounces-12711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D1B47A03
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 11:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66EF92025DD
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 09:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F47B2222D0;
	Sun,  7 Sep 2025 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVJ+pxA8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF822157F
	for <linux-i2c@vger.kernel.org>; Sun,  7 Sep 2025 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236451; cv=none; b=KXKoKKvR39z44v/mycpQHZ2YmNDSsp4Dby6eUZKmZfFD0Kol6zxo3kEFYL4FJA5y5dkl2PFadBAOqqsGUngHNAFSDgrkxCQHP4kRjM0uHde8aTp9DeA0vJ4KQoGyB0q6lNV+4fGBhMUcOunyY+pKHtOoQSMSxfxgbkR9z1U1jv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236451; c=relaxed/simple;
	bh=nTtz/T80B1LFaBzGfFaobq1k9YIb/4LmaRP6eS9C8A8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CdpyrzWB1QFqXk7EcerOzEDHTHNEHPlrqJ0px7Ay+UKywe5eXyltzD42SMi/6tkJYmAxe+e6qLh3Z4LrYslpO31q9d8dJ6l9X6/dfi5nDw3j8OXybLVTLMrxlLxrYktS+LDmMqoWYY1g0xpD9PNRHBSGQPuztiwR4sgo+f9Se4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVJ+pxA8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45de5a7a080so48295e9.2
        for <linux-i2c@vger.kernel.org>; Sun, 07 Sep 2025 02:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236448; x=1757841248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCLQAsYpR6U6YXx5WXyyNz/et5qkwEIQ90qwDmcTRHU=;
        b=lVJ+pxA8WdsapeRIjC97ax0YT6KggfLwHY9NlqpaSJbTiyPfFs2m/jbADXLXjiDza/
         iNQD25YkPwErRPW0iQJxrSaHY24CBMNxhMzYeocADPNS/Qjk/P7ifWLB2U2KDALEMyUc
         zzq0e7b5pdPgByPMjE/fqcp/sAjpqRv0BrO3uzJWjSdzCES1V38iCPGC/+6t5ZNLtE0z
         tSw6cP8rEOmAlg5k2173Mn7jHJEAVCqjHQEp6UJKjcBn7fp4gkMreE2D2ThMR9lGGRVW
         ro8IMP9Akul404Zo06eyOgBea8vYFrwAY4Zw2ZN0pPQ7KNmEBUrKcWrZCJuqeT3AU0d7
         HgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236448; x=1757841248;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCLQAsYpR6U6YXx5WXyyNz/et5qkwEIQ90qwDmcTRHU=;
        b=usGrw4kEkV6rtVRqhtwEukNr2IajUF5p+983TmEmYLktkEOrfWuUV+1Mj8hdqQApTA
         AhMp+/WEeDaHPSMpLqaXnAWSHtvntkaYIMaJKGllRUxcSX+N3u+eWVnG2ZSyj/uJ6aBg
         XOTFZK0NCfrz71vC7gFu9KXpN/0rYXJsgKhaOUvayoelLgGBl7oWIEF7qygdN0tYOZZv
         lq30Tq8lZbKajO4YRivkVOfgR0jyt8tpEfej6kSmuEMH3zIl0lxFLfVQF28M/k8IAE8A
         3M+JK4q9h+M8WCR3Rl4Q4t+J1tblBlrQKMXv3/NGZxHOuWe9H4HkyykYOc8l3BQ7FYX2
         T/5A==
X-Forwarded-Encrypted: i=1; AJvYcCUOwgCYcbr4VBKu7s+xk/s9YO7/yMMrBDTV8huGhkPNz5AxHl7h3/a82Z+77BQdcFtATndxs0cpRCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhpqMqtcfXz5PlXGKQ+GnQhN3j/MLiKAUGYMpHsz7fwTBYdhc3
	oJ2YEaiSbe1zlFZ2HY32y4ECZbIJe27P+/vnaFYkhE3OpsHob7S93vSUYBUnkJaQdjQ=
X-Gm-Gg: ASbGncvuzYcrrr5E+NuUqpAk2U7UovGjkTm5GZpZUhaFY5nzF1FNRbBjw4VRlyANeBx
	HjOFKCWJkccCXCoxSSC20whqIY0g5lcsq1iGiNZYvT1t8GZ70wk0r1jmcHyJGnCNfmrwMeB2LnQ
	SpjU8AQY98nMSrOunQPaB58RqXrmyfiS5GP4RMPGYMt8d7DmZlGk5TOPz1XNNMOlpDFbosnJRIv
	PbwS1by0t1/hsnOdGFr7YFn+WbxPtrENh58E3RD0Mys2QjPiqojoOG8XROTaaazOwIQBonC8cVT
	oTVRamNlpS41uz69fuqGrUlgAs5KWcpPcOIVdQCTmkqw9VaoFayHEeA4sqIAvg8aJhAyu8mGnRC
	rtclvKGB7hQZ11d0Bt86OxCNbmKdv2f5HDVinw3I=
X-Google-Smtp-Source: AGHT+IG78HXO5H3PNHPON4QM2B7kxOdyJOW/vdjAFNFZeNRnZqCYRuJ044SQo+Ov8yokKCplK6e9pw==
X-Received: by 2002:a05:600c:6388:b0:45c:b565:11f4 with SMTP id 5b1f17b1804b1-45ddde84ff1mr18221295e9.1.1757236447894;
        Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-4-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-4-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 4/4] arm64: dts: exynos990: Enable PERIC0
 and PERIC1 clock controllers
Message-Id: <175723644648.30719.8043699953915235210.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:06 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 04 Sep 2025 14:07:14 +0000, Denzeel Oliva wrote:
> Add clock controller nodes for PERIC0 and PERIC1 blocks for USI nodes.
> 
> 

Applied, thanks!

[4/4] arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers
      https://git.kernel.org/krzk/linux/c/44b0a8e433aaad8aac51593a052f043aeb9a18d1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


