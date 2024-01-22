Return-Path: <linux-i2c+bounces-1406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9683619A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 12:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AA4A1C2648D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 11:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A2D4D5B7;
	Mon, 22 Jan 2024 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bbrnlqj5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2A4D10D
	for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922127; cv=none; b=ju55jVVf7pIbVEWyzH2RIbo/MHRoGhyE7bYkg+1iB9UHDBqs9jX8bquny3OSXy3fn6NebIEvuCFz60HXlUbFWi+gvVpWiMHRahukuVKy4/gqdJ67XlmLhNk0oUcLXS24hpO8FV4OjyEggY5PGmspgmg3R6M7zikkKBcgzKpad88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922127; c=relaxed/simple;
	bh=jz5+fq15v8P2y1IAjuMP+zZSU56HsumzIfdjgfbshWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ucl9ACpr5+nClK+1XQ+hdVsjtrB156UUZXC2P0geYj9e5bKCfdgPYZUSx1wJIKps9loTFyMuxFpFmi/6V4ohwrC9HN1p75wqASFkhjb01B3PP6ExiTUyuTKh/640Dzh/q2wQ6rz6fX8emSbMiwC0MDtRaAG+OJV34T5HlciLX8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bbrnlqj5; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cd0f4f306fso32300781fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922122; x=1706526922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcuxO13l9rVY0t17bgZ5rUtyhA0tzJvdYRk5OWx3zok=;
        b=Bbrnlqj58dUry9GOIU1x058bMXzTRNGlmh1uOq8GxRW/f2lmU9vUog9CivUU6F277k
         JHr8gNQ+rwzV4DTpqeFHVI40Si+BPJ+FNNWcOmnWdDOfscPlf1X7ZYEYCsLPTLb6yU3p
         lLnHr1EoLqKPkQn8YtDmMw6cvXvg9niscgwufeZR3vSgB/d9NdzvIAs6Nx5JncSX4oQj
         /iGQ1VMB+82yKReDwsNolULXAxA6kBEHqTmS4kQCYbTtIrkSgHOLETtLP+3uUsK94pIT
         MDj6hDGBfGQgMSwTvCcJNIG4Z4vhg7nmn//wdH4gGYKjQjI0JWChbW3CtzYwacn84R+z
         eAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922122; x=1706526922;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcuxO13l9rVY0t17bgZ5rUtyhA0tzJvdYRk5OWx3zok=;
        b=RJtOwuF4g+FouNxmIxKEG1dt6wNyMc6/kAW5FIZ4mE27CUrY7tyOaiBCAOpNcoJH3h
         Lp2EgeIWOTyVGk7YeNYE2cFemsTxtFil86JJxDlGzShlcoSYwwxMFr1dYRAvaaygcNwy
         ka5vQcAZAIiR/TKtPYa5C5rZp0IlY8wCFcsvXmmxULA1Bn9ZoHJ+RibMQLLUJmp5WqYG
         SzqcyWjJgiOZymL2uADbiIJiHe2jF49sbAQ41eXEvVFgCCEg0AmDok23uuq4Kl1vHe6D
         UjKa6UyOyR45h7XuMz7vhKnuAo1yDR3fMPgDIcPz9vozzrJI/weA8fDUnNXHSdBCVpMh
         ApTw==
X-Gm-Message-State: AOJu0YwCSMlPreiUHxv+voD78bf4U5pKYwEwxfxDlpdi3fSwZp+qhnIe
	tqozVggkGjA2MFWgIEy50llIinDYnDlmdH5YXjBProNuho93XOubOkiDHYq28rQ=
X-Google-Smtp-Source: AGHT+IH9GCOtDWvqqem7I6JtqINBeY4M8rLVsz/vddPraRdlqQUuPr0C1iB6ZvQxovWcHQFQ8xuEQQ==
X-Received: by 2002:a2e:8895:0:b0:2cd:8ee5:2d8c with SMTP id k21-20020a2e8895000000b002cd8ee52d8cmr1592791lji.33.1705922122727;
        Mon, 22 Jan 2024 03:15:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 andre.draszik@linaro.org, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20240119111132.1290455-6-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-6-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 5/8] arm64: dts: exynos: gs101: enable
 cmu-peric0 clock controller
Message-Id: <170592212128.45273.4024019835261321108.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:29 +0000, Tudor Ambarus wrote:
> Enable the cmu-peric0 clock controller. It feeds USI and I3c.
> 
> 

Applied, thanks!

[5/8] arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
      https://git.kernel.org/krzk/linux/c/8a670bb84cdcf1397fc4a3bc295c0008f49bed91

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


