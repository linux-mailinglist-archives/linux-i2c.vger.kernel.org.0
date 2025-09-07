Return-Path: <linux-i2c+bounces-12710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D0B479FE
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 11:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AED017A9B02
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 09:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD50221F0A;
	Sun,  7 Sep 2025 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMkEQiI8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272CE220F2A
	for <linux-i2c@vger.kernel.org>; Sun,  7 Sep 2025 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236449; cv=none; b=W8yujyWpRKa3Z0eIczZLoQraf+D5roHBM6jpLko8fY8/QFerYh/hbHVjdMPxgjtDob4YkolaqB9Rc2LLv62H3GvAg6UJcqMpz5j3ZpsINX6hICVZk8pu157GEcSOzrDDTWr3SSKryShsHTlJRbQGGf7BQ4jhh4034/YnlBXRCuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236449; c=relaxed/simple;
	bh=bjjOrCQY7nCRwJYjDCDSciNQEkgygJ3UGgcY5H/xmAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NRMyNmdeRE19ULDQitTq2sG7BKm/Iw7iUyp29Txpf7SmMhzfcVFcynvnByxhwgxONLQrqUPRw9OjsvwckyuNHWwDVP+5+K808LZTK6d4ZvAqSIYXym49/OAfQq+hhimN2ztTUD4EMrUgv/CnKRR04zhOh0o+acMPXT6RcsSzHfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMkEQiI8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dd0d53e04so3845555e9.1
        for <linux-i2c@vger.kernel.org>; Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236446; x=1757841246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=;
        b=pMkEQiI8+8OgDZi/+a9rJdkYDyX+icHpXyTQw4Bj1noiBGdnH51qHkOVu78nVCZ4cL
         rapQ6FaDJLlofPEF7yeCgzHCjTxE4Kjxuu6J6p5h1tga09tXm6ctE70HNyAjJE1XcudT
         5JDTewC7YuWD+uMsPkFqW71cIkCa7AIefNHpaQpcXI9/8Wh6gq69Z+zVtxvaGHq/qDxM
         ZpUslxECbRr0qcCl8Q1a3a8w8lxyLSexTVNAHrX/U7mhM5S9iXANp/76Xq1eHB7C+jNJ
         AtdyqFY8ruaX/D3xe1B9ft2KqH4WF82mUXBSpJHFYjXKfYJXcNOLOe77OpwNum0hGQcR
         Q6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236446; x=1757841246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=;
        b=T//zg6cmrBcttE8zonz358R0OwJHEk3OtMh/cbW7+hv78zTgtqAs0wJNYCZxabMzYB
         HHp4U8hICW6pvxLJStZfexUoHn93vYmpMAIDS2scF1QMzq7EzOGMadrIQbhblEimxAIw
         6IRh3i+RekfI/2G+GMnBTW6EkVZBx6XcnpoHgB5wa9J7tU2o/TFDBxE7VryjVQjjpVnH
         vt8s65rw4mCKzK9pCEzUgC6bNEjurDsrnUS1WhdHl27wgJv1e1CzWhuo0wjh4g6QGO/G
         8K+OitcmdYaAo92ren56wFdB4OdFFWB1wp3fodoKwLnb1wbsceUhhSAdRU27I1YLZt7d
         Glfg==
X-Forwarded-Encrypted: i=1; AJvYcCUHqY866bqtRaRBlhXxa+4Z4VhqLg6G/0tnYDREQIBqZpKrlsvpK+yxNlMk91cuUKHxs2g/FaPM2hY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9VDcF7XP4ARe3x+DPJTw5/i4A2UPsjNvo4wZV9zf2SkMlTsdr
	j8oeYwqNr2A+WN3hI+NhsUuxu0wwkcRgjB8DCv2LHzYlbodAVx0dKV4rPkaAd27BjtI=
X-Gm-Gg: ASbGncvgYZqRuLLMq2zRReOJtKIxtF7qDe4uAyb0xmZiIAV8goAY0cGNEHG2RtSYVZy
	6AIyRl03FIdCKolKKchgKRYOymFyOWU8eI9BzZw9szcWMD5TtuQu2OB+UEF+6AqlVcCrU13ZKeX
	zgL7G2ATHZFpIfr4ZCSPPWPNflcu0PnoOqw963wzly9S/2SSuLADrkVU1cHxyCjwZ9DT3GoBkTm
	JZpVhS3rIR41FgGKuC9BmHM3AgzUuqjfyDadMxFXsTXbl1p1mzbt/4sdW0t/to/2mizVcxe90yo
	oB4e7AqG1qi2ewyc46w+swOyIbFP5FQsGnk7l9SwDwradE3pyu02uyHVmZdJirLghrVK9LHtLG2
	SiLwR3MNzrsP2R/zvMc0AYr4ZGxe+LEVxtFOtxkEFMM/OICBkIw==
X-Google-Smtp-Source: AGHT+IFQImOn+iq/yUmUyBTZk4IQaF9iLgVYYsVIQC7hi6Y7Hlt3FPdtOjJo41ClE7NuPr3IM92ZKw==
X-Received: by 2002:a5d:5d12:0:b0:3d4:6abb:7de1 with SMTP id ffacd0b85a97d-3e63736f694mr1567362f8f.3.1757236446397;
        Sun, 07 Sep 2025 02:14:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:05 -0700 (PDT)
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
In-Reply-To: <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 3/4] clk: samsung: exynos990: Add PERIC0
 and PERIC1 clock support
Message-Id: <175723644487.30719.10030399153447295312.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 04 Sep 2025 14:07:13 +0000, Denzeel Oliva wrote:
> Add clock controller support for Peripheral Connectivity 0 and 1 blocks.
> These provide clocks for USI, I2C and UART peripherals.
> 
> Some clocks need to be marked as critical to prevent system hang when
> disabled.
> 
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support
      https://git.kernel.org/krzk/linux/c/b3b314ef13e46dce1cdd97a856bd0250dac8feb9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


