Return-Path: <linux-i2c+bounces-9812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688DA5E41E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 20:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1764E3BC9EC
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40041256C6A;
	Wed, 12 Mar 2025 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mzyt8Nxy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5742D258CEB
	for <linux-i2c@vger.kernel.org>; Wed, 12 Mar 2025 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741806389; cv=none; b=Kun1WPw4GmcWvY2wD2fpwEc5qiYl26e5bl2lCF9E5qvMVcYR8RY/xZjPdzxAd6pRwKWfmTACpT4waSGOSHG0nyomwLGUYXOqd2DePZrBpnqyYMJFyfl5k9sqR+EYkPdlybFE71ioYhi3iaGe8xrzxqCrNpHvsUz8XF21us3Xo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741806389; c=relaxed/simple;
	bh=i3vucoPseVcWW7c5dXt5ebAxqit03r8K46E121gZIsk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ccvKcIqBfbAk31oTHuGTcUBNvn/wvtjmBeVSpfWEAeP/rCDEoyiFd6kDo5+4jFgEG9J8x6iBppuYZcgz7LTY8XJ3gMVJv0LCMe72vVAWSt6Vmaly/Vubw+aoId2NdsUXNlhqbc6qx/GpoCJviELcE7nG3dg6D77mG2EBRHoGtYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mzyt8Nxy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe574976so894515e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 12 Mar 2025 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741806385; x=1742411185; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ccyd4F5pPIVH21nsulrQLjIaNTjnwJxA5SDU2R/66rI=;
        b=Mzyt8Nxyy2aeQPMylwR6B/HqlGnzo3Wdc4cbizum7z0a4b/tA4hYsg1XTr7vbMJ5SM
         vyvzT/dMaf2znKE074suyw0H3NiscUOud+ZNvCfgcfZYYPmMPGRQIOKyZMMDANHEmW4X
         I7KlZIA1UUeDgU4XpfwK9Mb7WqpVHyeP6uTA34GYSUSYrix8NPbf9Sxao4R5SStj5clU
         Pp4msFnceowu6coZeIP+V+1EsnNgXNuN8QVtz7IncshH0KEnE4/KFE9Yv9FrEj51gXab
         PVuIRtMkT2V1vFGCCUqehe3tqA3AwKGAVlf9Lng7xQcvPJ3x8tranBs/EBJCkOPCY954
         MPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741806385; x=1742411185;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ccyd4F5pPIVH21nsulrQLjIaNTjnwJxA5SDU2R/66rI=;
        b=EE72n7j8LxYiNpz6nhjds7bXZdZpeh8tNn/fGgLUrazu9UNjd9z8PoVy7+6Sg8JlUg
         tbmFeaEq8+zeI5soNe6vg6Gz99WNKmVrwOqBVZxMkIPd4VluhFQ68XM7WoG4pAIMm+/1
         rlGtTKi3GUuJugq/DccXpDyRrdAYQ4wfgnaPaOS2TxSdqdTYvIbnGaBM2/ml4WBrK6Bv
         24KTHvNSd9MHhHMGyepCgcit/cL+iy4wglqzjmq2330HBqMW8q7yxE/Lor4IUYXSos0n
         dFZFC/onF96mfCR77iH3FNaN1iv6Nx90lPQZ5FOm633XgltF1h5mDzuRFvX6zzPW1v6a
         Ev7w==
X-Gm-Message-State: AOJu0YzOP6NPcxM0ScShOHddpJV7cPMj2qY/0hwra4ZPi/K8dJPIAgNL
	oXQMUEnXjnuqqEA9cv1kOLPera+8HjYPqE7ITiQ0I97ynWdO3qKn
X-Gm-Gg: ASbGncv6BkPzmEgoZaorWkAmm7LgV084jLotB8rZhvpxTXssc6Q/z3HcaHe03C2wAZa
	46Q7rd5E6Zt8zYHPSW2PcYVA4mA1gcRUEccYRf3wzFqN5jrrR537zGnWgKbgS0ixvGHf9iOkGUb
	nSVcIpYWWBhLPP6/21xGEh6ddfnTSxEfimEVj/1MM+O51Uw+Pj/ZZdP3IwrCLB7n3sTBJpHpYFX
	E71Kl+cbN3vxx5pjrqoJ7sTVagh4l4rpZ2f7a4jE/jHIVf3BirEeyTS7O1sfMHqOlFbVLgIyWex
	GVX4kP8Yiw8Cz+CbhCcO92O1edvgznVlmjNWgEk8cETHgc6NFvogxvE6yvFnEQPghCjaWekPlVr
	zSmOPcQiPJCrzzW4PK4BuGKmBfw1OZa4pZuLFlVrLGrXTcZixP96CCs5Tb5XRbQWeg/j0a1zx8x
	pvQzucodyej9nBXPVMDTmIZpMVbzzYPhVlJr4dAgWCvUU5tIM=
X-Google-Smtp-Source: AGHT+IGSyFEJRw3gY4tGiM00Mv2q2pWJ9WhEcSa/7cwy4oHIOUMmbPoREpellOBmb/JL7YKRnYmIlw==
X-Received: by 2002:a05:600c:4fce:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43d01c25c64mr75399515e9.25.1741806385331;
        Wed, 12 Mar 2025 12:06:25 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a4d2:5c00:ad7a:ba59:161c:c724? (dynamic-2a02-3100-a4d2-5c00-ad7a-ba59-161c-c724.310.pool.telefonica.de. [2a02:3100:a4d2:5c00:ad7a:ba59:161c:c724])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d0a8d0af7sm29314705e9.35.2025.03.12.12.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 12:06:24 -0700 (PDT)
Message-ID: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
Date: Wed, 12 Mar 2025 20:06:31 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] i2c: i801: Use MMIO if available
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Newer versions of supported chips support MMIO in addition to legacy
PMIO register access. Probe the MMIO PCI BAR and use faster MMIO
register access if available.

Tested on N100 (Alder Lake-N).

This series is a rebased re-spin of a series submitted last October.

Heiner Kallweit (2):
  i2c: i801: Switch to iomapped register access
  i2c: i801: Use MMIO if available

 drivers/i2c/busses/i2c-i801.c | 157 +++++++++++++++++-----------------
 1 file changed, 79 insertions(+), 78 deletions(-)

-- 
2.48.1



