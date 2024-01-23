Return-Path: <linux-i2c+bounces-1438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B86838B08
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 10:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E985283BC8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 09:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7624B5C5FD;
	Tue, 23 Jan 2024 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rmukCPXx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFB15A0F8
	for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003704; cv=none; b=pBjfPknuaY4TLpYxfiln/+eGE8iLnLvWpFjztvPod08B3neWqC8pm51NicgcLlS8CdweiVRCFKl9jtOSH5JMOY8gxfveyA3DRh1bkg+PdK9SRTEeoeWHI23iUaEPAdyvlfQ1r/1wbQulODmQZLMvXyX8Dy2Emlsjb3jbEdXDAUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003704; c=relaxed/simple;
	bh=mx4PrvBtSDVpAng0sMkJXf4E+yvXGkHZWB3AcX9lW1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eDO0/B12/UjxkVETBiS5zgEn30btarT2ZTpBhZ3mDzMQ529niVohSSpf4BkR0iSuhUWvz+EBMihJjKHbYYwi72TKiQLkyGlRjyFn12hB0zNr9uqbK1MMfjcBJaHZpzYbzdeLajNwKMtqeSnyMHeiNz0vEXjb2jkqdZeJffEcPRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rmukCPXx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40eb0836f8dso14135105e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 01:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706003700; x=1706608500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bucJfGarknd2tELBVoMBEgCN8J8/6RScdC6wYGiB/eQ=;
        b=rmukCPXxn6XO3YknR7JzYPzUUoq1PQv8zNgmKwY83+ViFfZuN8WBihSrAtgAO1U8yE
         TCZWOOKTDdJK0tZXppNB6Rm10cOJYE6W9xMGmfyKqlw1oY3o37ci3GhTjQP0+b4ibQEm
         AY8N9UrK7Frh/RTAkO2nLsyoUmQ2OXfU5E4v5LHAUlsPGH5hCe9609UkBv4Q5q7WEdIA
         ciqe7FdJislmocyBK8PzfULlrFRZNJ5oMKiOCoYFvXpwCzu8D/wIZXHtV8o9poNBeE/8
         LyPTw85kd/vDx5vI+Lk3LeClyHOAoBD0NrhaOfES9mP2e6bEVPYS0MO6bOVALoPcjzg6
         gv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003700; x=1706608500;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bucJfGarknd2tELBVoMBEgCN8J8/6RScdC6wYGiB/eQ=;
        b=v87akz6WicFBRK9Mw0jOBf3K81pNOIOY0bHJ7vnKCUYETKGuiu5rAReAUgf/4Lj9AQ
         950w9hHChDMG429ccFPuy1nCDiAZ+wXa0uZjp8CmSHFlKiPZDJYzN1s24KeLrwmQDJvc
         DPSdFVoMAvzWa5vqIVrygk1nUOQEABZSwhn0t3GBpwFWBegltFdnBfGVi7dbd+yu5fq6
         xjdg6wycudupfCz//NmC57pQvryH0F5T7QnhqNMCSgLWKu3VYGiam1drv18fcE5QU7CI
         LI0+We0Zw7Q8om/CzpVb5wc1JYsnpr3nYnnF40vB5u1ywok1uIYtfMRZIjFjYCkXn4si
         NiPg==
X-Gm-Message-State: AOJu0Yy7evW/TAYr3yy1wvl1SM/zYM4D9ejO/0MtVbX0ykj6FIA5HQqg
	fr8KO6Ky5N99UjbQqbXw4EfIVpcJPfa3NmIUDO+4vUfEdCk4qZ82kF5yieLHw5c=
X-Google-Smtp-Source: AGHT+IHUPvfVJ7IH/a2j8r6K9UncIewAdRNTmilYQuregY2Fyz0ucwgWm6QQpZsxnCg//IAVLYGY7A==
X-Received: by 2002:a05:600c:2487:b0:40d:8ff4:ea02 with SMTP id 7-20020a05600c248700b0040d8ff4ea02mr397959wms.86.1706003699868;
        Tue, 23 Jan 2024 01:54:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id l34-20020a05600c1d2200b0040e89ade84bsm21649964wms.4.2024.01.23.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:54:59 -0800 (PST)
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
In-Reply-To: <20240119111132.1290455-8-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-8-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 7/8] arm64: dts: exynos: gs101: define USI8
 with I2C configuration
Message-Id: <170600369751.35728.2631997217293504798.b4-ty@linaro.org>
Date: Tue, 23 Jan 2024 10:54:57 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:31 +0000, Tudor Ambarus wrote:
> USI8 I2C is used to communicate with an eeprom found on the battery
> connector. Define USI8 in I2C configuration.
> 
> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
> selection of the protocol is intentionally left for the board dts file.
> 
> [...]

Applied, thanks!

[7/8] arm64: dts: exynos: gs101: define USI8 with I2C configuration
      https://git.kernel.org/krzk/linux/c/f3635d5ff6105e6e0450b2e7f7bb0055f0fea305

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


