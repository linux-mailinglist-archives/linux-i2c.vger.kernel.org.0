Return-Path: <linux-i2c+bounces-11292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C4AD2181
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 898C416C68B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 14:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9A019F135;
	Mon,  9 Jun 2025 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eO7An/H4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAF219992C;
	Mon,  9 Jun 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481107; cv=none; b=aF33Cgv36AuEpy7ikoX2GfnRfGjkdktOSk+mTJvCROg4u1m6NhKzsGtpCQp0SgCnlF+Dv+gXFCKJjLVNcpA4RiLT0VSlHl+fsbvl1kIQZIDKXgD2dKQ26ioVrcxj9h5B6Rl2ub/iud4vWXacUfScu/wahJJ1etyUMZBVWOj+DSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481107; c=relaxed/simple;
	bh=sFe+H8XLKeS7WiN2PZpSJvmWH6Jxo9uZaJQTws9Dm70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QjpimAMa+Oq9o9SJyRe/fEa5P9OcG/hrejG0bH2FfZyaKYlxA0bFx//H2g6E9Zxg+kJ91NuudXa/RcPo+Duy1q242Pk8FxZmfurNOk5ZMBml2rMJRbTHwqoMnCiVicLlHdT5VEAY0DNy8ooVkpuZafCqGc+df9XW6QU1pk+asso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eO7An/H4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c27df0daso3860248b3a.1;
        Mon, 09 Jun 2025 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481105; x=1750085905; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byEYBlmbmeRBtFl6//UsijpT9TN9tT48aruahvOT2Vw=;
        b=eO7An/H4Cs01n1rbhVJNyrkEax0LYgYD2AKXF4LjQZge3w4tbUg+MU1dTTTsBKdSe0
         WL8Qx6WjJCF7Y40LBah+q/3qR659LBwRlGXzqESQybC4uGGu2/dzukyLoDbD4izWy+gu
         noUtgjRjED2NCzMBjTgByXvHeVIOoo92jq/0GKr0A2aU+/5tIm/Tmyu3Q9k6Ps/KL7QA
         NjP14MHumODOxg4/ngoNmwjS20TGtbqAaQz+dYp1hMKUSyuhJ8rOAnjXhbRNOLnKuxyT
         zwoAB3nrsisGd0ZwVJXB9RatqPPDx3AeSuKb6S60hO7j7j3wc5TiD30cSsOhMdROoXax
         KK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481105; x=1750085905;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byEYBlmbmeRBtFl6//UsijpT9TN9tT48aruahvOT2Vw=;
        b=IQbj3DmPE49gZXhW9NonyfWPj4FeuTM4yh55wpfd//l3MlgirODuFWQmENl4tJ9any
         bk/ZUNgN3gEijRoG+M0SssJjOdvVlAbXBTC07gSSS8Rd8lbh9plkUf+APtt202XPxhJE
         TUiCQ+D9Q5wGcLmNNvbYO4RtaMA3zXDx1YTlDblhF8M1LGMDpBKH4KaPpPl2rzM1X4a6
         bdiNBmAc3aBuOtPgvu+egcZO8DbQ/D+mdaO5Bj2/I+vQ8VlYjcOZ3wUzAIfB/+GtSNKi
         byW14khhigIaxOVVLpYU+r9eJfa+MNDHi4J1/VY7ZAauifZZRBmKaC0/aLoeB1txXxcT
         LIIA==
X-Forwarded-Encrypted: i=1; AJvYcCVATzkUGWM2laA0FURXgOMlZNQiN75Djd6Opvg70nesdM5HVFsC/XIfI5S4bO9prqP53vR5DPXChfas@vger.kernel.org, AJvYcCVSfil9C4DVqpZP6Jpad3hXy4BVhxhkQPtK+m8mJ+WA0mWJgqKIaTpWUqQb5eW4FhS2g04MWVPMIcYf72BO@vger.kernel.org, AJvYcCWmWPaTcJz0KbdFwI8U3MpP0jlLnTtU5i1ZmpBp4v5Mwb94YOMufFmbs7CQMV4L1NVAidknbQkcA1+T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvk5fnlrdgg0U5t4znVFP96CBZDz4NrwBZtEtU30niT7YLY+Vm
	LX41Zl8UY5g93l0vNCUo65+yL/HtMjnZ3100fO7F4NWFsbtnA2wUfQ6N
X-Gm-Gg: ASbGncv9pbT8p4/7Uk4HLsMuMHmgxQDinJ17dciMrjtE9JhLSCkM+Bseunr+Ee6miY6
	mTutvoHqlnlZqGAE2SbQ+hGyarfgdKMdesn1YQBPVzLMASAeFME95vj2Jej/UJ3FFPPHuSP8+0l
	vmy3tCA58z1yo2heKTlrn+dnVBI7kQEXF3jPubHO4H8inszMFpd/g2z15xIk8M/jbAJA2PaXC4s
	L5OYoAitNMW6D9N5TYbgm3j7PFgZ6kRUqnihUOYRYo6WVg6kfq7mvk0vtUFek64bGX+4JB06JQn
	aafbX8+7FH99l9yHG7WbOQdsudGxsQzgE0rfb0/802EH71ywpXNSUw==
X-Google-Smtp-Source: AGHT+IEIc+6G22pK0B+QVv6+YOjfM/2P7KrtVtBBawyZzoXj9zYv4yrhluVgdzNvUn9UVRzwAwkRCA==
X-Received: by 2002:a05:6300:408:b0:21f:5361:d7eb with SMTP id adf61e73a8af0-21f5361d91dmr5880509637.31.1749481105313;
        Mon, 09 Jun 2025 07:58:25 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/8] I2C dt nodes and bindings for Apple A7-A11 SoCs
Date: Mon, 09 Jun 2025 22:56:17 +0800
Message-Id: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABH2RmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3UyjZN28fN0SI12jNGNTC0tLS7MUQxMloPqCotS0zAqwWdGxtbU
 AUY5o51sAAAA=
X-Change-ID: 20250527-i2c-no-t2-2f3589996d14
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=sFe+H8XLKeS7WiN2PZpSJvmWH6Jxo9uZaJQTws9Dm70=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaIHk8b5nDOOtFNIDshX9oPFaOksqYznLjpr
 tKrwt2Q7Y6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2iAAKCRABygi3psUI
 JP+FD/9Gdgqt/lY4KDwLwOG9y0ChTcW1JV08hZC+822o6XWkd8eFThBxeujQFbiV6SqIjAzl/em
 ln75ssqyvArWQhqvpM12mKCs0hJstSCNgF75soIntCoKpg/fQiYIbDQa3pfjMO8Zf+0/dfIANHz
 p+sSJMDpF4B+6JdEtvqCsY/joLI3h/HQjPv2hTSTIPFP2uAazYGSlJR6oDejMBEUDurAq2pNNQ7
 jOF/c1JuBx1iLiCCn5ySXlVdTYtQwsmX7VEvQaiLU2fww6WVF+AzRThuz+1VAnViJynYQuKfyu8
 Ril/4WzJqQ4gZ1gCt5urjBtdyNNBphHfStaaNueW1gRTga/KZWPvvz4c1ndR/QdvHZrG02M/h6s
 9hD5oTuC3G3Ez9BzG+2AlUNdYiVViptnEyTMePGa+3qLeIbGd5i6BavX9Yvk2H8SBKggt5rbbSF
 Rr32hu21LUh/Oiwa9Y7JIT+nwzvlGI5ihTiA4FbsQtgnZgCZi65I9mnDBj8hdxxhK4IQjkagrrL
 8urBEmoWOKMB5/UvPNq2PWM1hSlflFoDAWs7EzSF50Kc9RuFWmzuWkI8sqUT8Kz56LADLuCgR4X
 i6KAIjGa5ROV6YIW8FCQSz4kNBLoP/ZVI5RwH7NnFtYgMJR5yq+HFrnLvAFNXKHqsexxgY6Q74g
 XTR6YB6U1Xieqgw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Hi,

This series adds the device tree nodes and bindings for I2C on Apple A7-A11
SoCs, since the existing driver appears to be compatible. The drivers for the
attached Dialog DA2xxx PMIC will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (8):
      arm64: dts: apple: s5l8960x: Add I2C nodes
      arm64: dts: apple: t7000: Add I2C nodes
      arm64: dts: apple: t7001: Add I2C nodes
      arm64: dts: apple: s800-0-3: Add I2C nodes
      arm64: dts: apple: s8001: Add I2C nodes
      arm64: dts: apple: t8010: Add I2C nodes
      arm64: dts: apple: t8011: Add I2C nodes
      arm64: dts: apple: t8015: Add I2C nodes

 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi    | 76 +++++++++++++++++++++++++++++++++
 8 files changed, 589 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-i2c-no-t2-2f3589996d14

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


