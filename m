Return-Path: <linux-i2c+bounces-1408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC7B8361A5
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 12:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36A7F28F0BB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 11:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158584EB5B;
	Mon, 22 Jan 2024 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKjSUQrd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5614E1D2
	for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922130; cv=none; b=TiEHcIGhmgujuX6FSiwJXTAKb2Mbq5boixLuBuTP8yTdtBar/ZC5W6BlWnxd4YRkkH9GB1Tp/AjLEPexqQe4+6+QewyAEtTT/z5jqWgrR6/H3NYCUgo8tyzeN68qvFCCygeignzexnPCNrlqXnBxF2QWzuTOFradlNZvIo6p3lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922130; c=relaxed/simple;
	bh=8AVSfvnvewYVpFEg5OnwBrC4L8m18vBtE3mGwILSVBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CYWDv+fuHkeqW8zgM07HTm3Y1WRCqjagLMil3EMTq4vrA0O9HobamCzM3YvV1bcPeozdI/UdM8b1sFUn1dEn9oITGvSu4iMttOxUuKVEjFBhd2fSEnFNiRjhm1SLfGwg+Ot08dFjr9H0eFljdBQzBLI5p33CkqpOWTePZJhdM+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKjSUQrd; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso4175207a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 03:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922127; x=1706526927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LP6BeipGGR5gRd3jOo2QMg73V3joNZMaftoWElxnq9U=;
        b=QKjSUQrdXwZ4IvC+dxpH7050m0XiNABjfR6bHagdxfduHIl4Dpcz2CkRgIv5M5DBEY
         zT26gErKBqKsD05SpSGRE3l11BEDenGCI+tMT8akDRTluy/pg+0pQ1asvZcfetlZHOrN
         aJEGLn8kS0iYNsoUqr1oVoslmxSDv+ouASysHgOZvh61h7wPFUb0G6Hr/28Bhnx6Cd6f
         CcbsXXELMCUeXo7IaKSREPHB4sRozo2SffYrIssqePC5I9bL55AXLWxJzmAnf7+jKVHt
         W2ZhazGV+5NVEGKMFh6sjKtQKr5vjrAkHUdEeoMS2/R5xu7i5YmYqz76lrX5/utuPhTK
         Jy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922127; x=1706526927;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LP6BeipGGR5gRd3jOo2QMg73V3joNZMaftoWElxnq9U=;
        b=INqZegTXKAH46AiunUAKv4zXDHMtA3XGES8mOMPKbOAQwIuyiNQ+/7+EBMoyRa5RAf
         nQfH/E50zFxbPHQWHT4gzbhtHfg7g3hHESAIFzu3oVhvH0d8Xlikcvf6jmuIDfnCa2ZK
         G/MnCl1GXpv9PyzSK+WvHTPCsZmBhnSiLk5G05WN9RgaiKMJRKqDJ8wcCltbjiFo3q7X
         OUu4OORpnrXxAq6zKFFv0amEx8IMU4NqBRb1/kzcUtzudim2e+EqaZN5BgRjU/plNb6c
         ueKxLGaFcAuRowHIxCd5ut7tA00NbfB5qTZyYUAZnRKXUyqpj0hY63pCgoUlYLQ9clrG
         qWEA==
X-Gm-Message-State: AOJu0YxAXNegullhGISLM7xXA95GGQTn7hNutahydQoLyo1Op0J2y+ab
	eJr32YsQaoH1FJnGogXZGt1tIf41us+dHyv2ogeTHQnEsiKVbA6GaLRYEnxzbhc=
X-Google-Smtp-Source: AGHT+IEjwyLnsRLcG3m8gzbVSEMmyhC5QV1u/gscFQ9ZtxBzMBVlkEgknIRfi04FHE1btxcI7pzbgw==
X-Received: by 2002:aa7:c318:0:b0:55a:6d56:b41e with SMTP id l24-20020aa7c318000000b0055a6d56b41emr1103088edq.70.1705922127685;
        Mon, 22 Jan 2024 03:15:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:27 -0800 (PST)
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
In-Reply-To: <20240119111132.1290455-9-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-9-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 8/8] arm64: dts: exynos: gs101: enable
 eeprom on gs101-oriole
Message-Id: <170592212617.45273.5124040864049049802.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:26 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:32 +0000, Tudor Ambarus wrote:
> Enable the eeprom found on the battery connector.
> 
> The selection of the USI protocol is done in the board dts file because
> the USI CONFIG register comes with a 0x0 reset value, meaning that USI8
> does not have a default protocol (I2C, SPI, UART) at reset.
> 
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: exynos: gs101: enable eeprom on gs101-oriole
      https://git.kernel.org/krzk/linux/c/6a06935ec8263be083ac897a842f06d66b138ffb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


