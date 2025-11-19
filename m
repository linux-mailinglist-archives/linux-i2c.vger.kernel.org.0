Return-Path: <linux-i2c+bounces-14158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D6C6E563
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 12:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 45F402C22B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 11:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C48352F9E;
	Wed, 19 Nov 2025 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbnzNC8t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB222E5B3D
	for <linux-i2c@vger.kernel.org>; Wed, 19 Nov 2025 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553198; cv=none; b=ERMVAacKyCrc/zrsf91N4Ru0L74FD0qj1bNMoy64AdFUY+fFu7NTwxPIXWsz5+0JTeoDb075K5qFaL8yMvRFmfSuSGKYSW+RuMPZImkXhjfoV1Z5yhsWfHs2+s1utl/Ll6tivlsioqXt2CUW+J5e54sirHqdMvM1GMZWmO8FXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553198; c=relaxed/simple;
	bh=sYgOih9xbGs3F3XHTRJ7fvFo+edeOEgNokHpkprwd2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QNlsyD1TmZ6Ti8jsTyNGemPqJ4pBQOAY3CgtZGEwE/KRR3NQPYF/Cs28ZmlR+tiqSRetezzswUymlJ9Xf8NEWwM8Cl3EXQaY59wV7toSV6w3q9FCpaI7h8CSr0Fd6rSSMl7GU6/B3XWobdcfxC9Q+GGAQ6IF/RG6t/vcVIu1bqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbnzNC8t; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso4230747b3a.0
        for <linux-i2c@vger.kernel.org>; Wed, 19 Nov 2025 03:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553196; x=1764157996; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dJIwW/N0kWg8cOXmaaT2vRpR7NNxpQwJA/W7KyM2QY=;
        b=WbnzNC8tHXlfMYKDe2YJ819xCOxAfS7hFxImkaL0disDXSXb4ovw2mYLhjlE8vVaco
         x10D51/mySLDOdFD0KSe/QCx3O39bq6Az5AqCBG0gbbotEchih1dSrCepMQH6djq3FgG
         ol04cjNk4qomrWYHeyDJ49o1RAFUW6IEZHRtk52H+ttMB0ZRHg92w6w3Xm3426iu23NG
         nouaLAaVP1HbcwNECvVL9NvT1daJKsiDfxJgHvGqt8S6shegX3Dtu+At8qzj4J+nrjyS
         aXFJ0N2Ybt0zcBTBQGGT5nihKsciSqdN32t/lg+f0rMjlyf1331RfktlI0s9neqpzX2N
         UF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553196; x=1764157996;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dJIwW/N0kWg8cOXmaaT2vRpR7NNxpQwJA/W7KyM2QY=;
        b=ksJ10NFmn871gSm0JYD6WeXq8/EERelpUG1uGWh2s5Nng/LCzorFKoksKAwDeZqDEa
         nMm5cgdKjWwp5g58eF66ypJJkLYONlXsi+HZ5kCPPXHuLOfeLRIRCHn7T9kWjYRlGfrm
         DvR1wiebbKZvkf2OzOmCd7CkBwKnS8SSbHq0kR/F8NtmjELtfryq63em+D0At5RFAD2X
         X3OuCaKGu9ehThgyjOryrjwGa+fw7vTn4hmRgxB+RQe3nlgLaMLCZBM0Wa1dZB5FZUUA
         YsOg5nd5dtXBqjjvBPtULTVD+APcbYSoIiVZu74qNzWyRZoKBWhBpZ1D+4y8yaB3XnwK
         p/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV1g7Lk96QW+ymqYIYrY54dOX039m3nYw9mszbaYEzT88sThqMJ322ssmUasSooX5bejEsOtZ12Ftg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbUNQpWWQpUGwhg48AiFlAXZe/KbBbXfzOtcdjVnjbhYw4wSf
	HJ9/F7NUD7BAZDcGmENetIAdVD5cbK98y/L47fJvKCSD9Tiz5gaeeDcmXB25wTTeJ6BovA==
X-Gm-Gg: ASbGncvx/d86xtsFkqLauR/95pu3MCsWcDOCg/mjA4MPy0pnbfJQCuevSxcSYKSEj6M
	rUf3BXaKDdKBSGWPct3pM1OUIZFMc+Z9TkBdQ/HlIwIfoyjr84fhdYEalu/c6pehcz9NSH1ofZ6
	sYSOZIi3M4ayxcFwtwh83MfwcR+SV4N88tVlF5OkLoCz5e0WmOyfICqY3DcRF3kn3qHxZGHoiA2
	g887UmWJH/ekyt0PPYz1s36YEEwqQsm/mRiXeHy74/URAlNAGnBuMtFe4FAu/bALix2ak6KtH32
	iGOQIe2kZF6jouPwemt/+CaRU0APotDxmXy61n6usnCdmc6bVy1/+GEVkIrA8TiOYhgW3SlYxQp
	s71ZArOhaUbdyLdD2MLMdLmvlR/NoDGZKFhOUf8XU0D1zmvZ93hP0CK6/vZlcsHMvtl0bcZcERW
	3s2R2RqinNGtEwZzIt7g==
X-Google-Smtp-Source: AGHT+IEJfBQbQgtvUYdmvQBm2UrCj4dLEyRvU/IrmcWNvI430xMQUCHPm5Ptcge8YsrdP9W2nWxZkA==
X-Received: by 2002:a05:6a20:6a1e:b0:350:b8e:f99b with SMTP id adf61e73a8af0-35ba2195757mr20706141637.45.1763553196212;
        Wed, 19 Nov 2025 03:53:16 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc377dadbc8sm17903908a12.36.2025.11.19.03.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:15 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH 0/3] i2c: spacemit: add reset support
Date: Wed, 19 Nov 2025 19:46:42 +0800
Message-Id: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOuHWkC/x3MXQpAUBBA4a1onk2Zi8hWJPkZTIrbDFKydzeP3
 8M5DxirsEEVPaB8icm+BVAcwbB028woYzC4xOVESYbiBlypVTY+0E7vdz2QXFFmTEU/lSmE1Ct
 Pcv/bunnfD1r01blmAAAA
X-Change-ID: 20251104-i2c-k1_reset-support-12784e17bf83
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=680;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=sYgOih9xbGs3F3XHTRJ7fvFo+edeOEgNokHpkprwd2A=;
 b=IU3xRJcKwpUMoWT+rUcpgurcIY0Jzk1f2odi1WOayQ+0gfEARL+PNmM6B8g65taYKt+zhWcGC
 fjXVZc7Ex+oBBt1B5JeclzBIvBPoPI9A4W3sEEPVkZ6EWs87z8jBBGI
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add reset control to SpacemiT K1 I2C.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       |  2 ++
 drivers/i2c/busses/i2c-k1.c                                | 11 +++++++++++
 3 files changed, 16 insertions(+)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20251104-i2c-k1_reset-support-12784e17bf83

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>


