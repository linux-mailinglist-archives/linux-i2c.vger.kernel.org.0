Return-Path: <linux-i2c+bounces-5831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590CC960CED
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 16:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE1D3B27CB2
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 14:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38411C460F;
	Tue, 27 Aug 2024 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cbj3RNSq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A61A0739;
	Tue, 27 Aug 2024 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767438; cv=none; b=nTdZhC26ql51omUMqT8HW8GFPhHFJt8x3qGhqoceJUm6HYCRNtbMjXAiwtOt+8vUNmsUIsndPUwj104dA90h/KyiQqqerD0mw4eiAGVkeZreWZdThC8GCRjrHVhQhVhsICD18ihgdI08xX24e0nhBRx9lg9BwboEZ/X2awNZ6v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767438; c=relaxed/simple;
	bh=8mK6mReE3DyTnXcZXEX6Am2kQqjJci0Jpm4bYw9fi2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLB09kwY4ccnsbDS/EWS55/7TYgGZBOs4Rijo7dit9LYNxCKrZIueCuYtmKgJfwS2qh6AXXCVXx/bbWxTHxfLJE1o3BG8LQwB6FpNK4vDSrlzww8kLosK/RJRTe+6ljmEWpudCcrSt9U31HKQq2tCvJ2303rgmY/4FkEghCqV08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cbj3RNSq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8692bbec79so707691166b.3;
        Tue, 27 Aug 2024 07:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724767435; x=1725372235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QLC+haGvzH0F2LMbU5gpuO3FyU2i0QjVlMNQG6Nbak=;
        b=Cbj3RNSqoT2/ae6Mgp+QnbNG8Cr5BvsxiI3BbmVsWrcmkCAvoDJt/mfS2ElLjt8AZQ
         UTriUscipn6I+wgkBYjrm02Rg29FLK0x2TMCdqrzAbtD/Z6/PMH39abFIOv+/f9G6hs4
         BKV1ulxJtHd4AfC/PUPKbwZWx8k6jwltdb5vCTnBnjaMRtQrNWGRju4kW9yWUcr40iAD
         PALFP49JDv3v61gspwTKwUNP4IILkWHUtZcjXGhgQpHP7AMK4xEsLgc3ky1nG0g3Jkwy
         smfkjs8w0pKFK452sxEUZVW/4T2vb0oRhlRUvE7ru7cZreXn+rg+N4Y0t/mhiPr0x/qx
         3Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767435; x=1725372235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QLC+haGvzH0F2LMbU5gpuO3FyU2i0QjVlMNQG6Nbak=;
        b=jyDwfvhc6lJi7FoGh+IHu5eSV/ukaJfSVgu/JWhCY4xSHOwI8LhJMznMHGC7Md1uie
         9GYeRyl72hjAaVxSYNIpUh/c0LbOVM+KismEvFp6n8QSBQztIASIvaj28Dj/BVnhjl9T
         4/uY4xpCoReUZbcfJVT30Sru3bdxcpju5N+QCkJDEtBisEB2YjCdrzHvUgSfKpxVM3YU
         djdQnMx8j74553cEFQTQ38lsc0l7CSJZ+zsOIRsKUMyleiYmx3PePfdiVoMj3PpwI7Ml
         IBiDo1O/Tb5DFQbljvDWRs5NLqc33YXAuIY/VJjyOXlMZsJ7w7tbbAHvUvoDoOR2ZuJ8
         1BWA==
X-Forwarded-Encrypted: i=1; AJvYcCVs5M3IoEmtghHuKNYAAlCooHXYtGWpjTV8C2qF/qz6ToCY1z4skoWFp5Z0ks2x6RVmQ3wBUXItEbyR@vger.kernel.org, AJvYcCWXwdBn9e/iiJ8rNaYd1NxIwxnRXeS+mGEctmbtxict4xncnnndpu3PrT8ISiXbpgW+MYSAKaK3/U1sTWU=@vger.kernel.org, AJvYcCXQFA0l0tJBPmC5eWucx7TLbn5XR7AtW+F+CjkX4/jjY4PNvvAZ4cImyPsTZZIsRg33PeGnIN/lupiNDog+@vger.kernel.org
X-Gm-Message-State: AOJu0YzVdaUBh/bNMrfEWvsDVWtfJNqoictw21jnWAhH/kgCvSGs4iEB
	l6BYCCJK3RSXQV7noX9cy/YEbjDdF4UXep/IZOXVU93BurD29r8b
X-Google-Smtp-Source: AGHT+IG2hT2WgMAdhoPm8TTYFp3cYe4IosIAg6E11+to02wabt81KWLrWBkSWNsZNEKuaxK1vgG8MA==
X-Received: by 2002:a17:907:2cc6:b0:a86:b727:3f27 with SMTP id a640c23a62f3a-a86e3c1d00emr208884566b.52.1724767433916;
        Tue, 27 Aug 2024 07:03:53 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e54b5cd8sm114801066b.97.2024.08.27.07.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:03:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: i2c: nvidia,tegra20-i2c: minor cleanups
Date: Tue, 27 Aug 2024 16:03:50 +0200
Message-ID: <172476741772.1248444.18184463926689075530.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
References: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 20 Aug 2024 10:44:23 +0200, Krzysztof Kozlowski wrote:
> Simple cleanups for nvidia I2C.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/3] dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then: clauses
      commit: d7ae7599809754d23cf571b849db0fead206ea67
[2/3] dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks in if:then:
      commit: 82ce7a4dc6d43f067a520fa5b1ac5f2a83797474
[3/3] dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains top-level
      commit: 2d9bac9a590ea522328ac7cdce810128ec1f333f

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

