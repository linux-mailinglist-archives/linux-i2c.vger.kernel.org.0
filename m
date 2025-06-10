Return-Path: <linux-i2c+bounces-11336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC5AD39C9
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8099F189B423
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD042BCF53;
	Tue, 10 Jun 2025 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYINuKUr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE81329DB8E;
	Tue, 10 Jun 2025 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563154; cv=none; b=mzFdVq4BsiVuftE+MvR3QbfrTf20eBUdifXTwA7WtGG/6fT9IuA7SqU0RxC6C/rsu5w1e919iDWMaW2wcKSQ7YKeRwoeU4DtBJcXKVkR40LN99wufjpcLFJBEAhX/JL52mkPTaWjXYkxbz39rILEPwILtXND+wfMmN8d1/+vyrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563154; c=relaxed/simple;
	bh=LgWOfIRrAa1vCwGdhDD6foU+2vSIX2068gA8U5LxxFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MTvPCUvLnjWmF7DS9pYbC3jfZ1Fk1UBYk0ftPSi5K9fBFhPkDmWNUT2e+nGCMbf0rqSfz/y5DvkcqyOeRJBR5qj+wYhF+cvSsN+NtX88hFalM3fEqoj+LuHRwjDgdxZ9y8vmVx2vxJNa/3lWf0/t+o+2PD8tq7m8IH7M645TUIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYINuKUr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2353a2bc210so47089745ad.2;
        Tue, 10 Jun 2025 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563152; x=1750167952; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnfF8+Gzh65nxJvwI9tp8yZPPMTOkFO4Yf4rye8gFyM=;
        b=QYINuKUrN5YZtiUm7oUvVJU07aqKQp8CaPoGo5E0QCeWhEA8AIhp+61Dsi0JhU4EAt
         l7XensW4ZULjBsBMQIBYgfr1nueLMT6abQK7GspaaHXZFslV7gVXDPCUVXrj55ZoGnoZ
         XfTWQ2UXY5VJx1tPd0KjsEVwOAUlCx6qBYdxFsUs54sJnoTPl1uWZq/dBwZwTmd7FHLv
         7v/0rUpMzdkJ4rCNpE+AmAtw/L3UGkHs6J+XxPcp1c2pNHn2CDMMAE4dxp97EXlxF5cb
         GLCV5oLC9fDH55U/ViNpA5JLaXNE8DYD7Pfvqf7hFh6j6aZHmNBRtb0kjh8Rn/Fxys3F
         nc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563152; x=1750167952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnfF8+Gzh65nxJvwI9tp8yZPPMTOkFO4Yf4rye8gFyM=;
        b=ZwGmLEpQs7nDoEBS0xe/6tIzSPk5LMyUOgS0WX52J5mnnRc/HNjQy9N0WTMFIvqhJ9
         K7eFCZRKrSAG3gbhtST4jmPleogex8V2j5Or+rEVnmIdf5PgUeiGtFFJwXAWLstlCfCA
         ss8zrG02psGFkIX6JPIhzQxxTVY5dKqhFHneRLQIQD5ah8I8qdEKfRJIMs2gMWT1Lh+f
         qGsKQ+4jeF5GyqT7qp6u0iuEcLdfs4tQmzyfEB+4WAFTifq9V0kPU+DZ5ElUDodvu7Vo
         yefFsggSXL1Uq9qNYX0xYYDoA3e28kma6ZWcqvaNR6xYBOMOynIugYhNpU5wBN5uATCY
         tq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWA1S+WprES1eSxkns+e6Va8j/RJb3YAOkmDbSJngHgvmVqEUoHrkvl5XoBYh47bNMO8L5sIqTUbkU8WiI4@vger.kernel.org, AJvYcCXeTLFo+6fbgzOTy7RZdp5eSE9PrSvtc36bgeT6YKlpL5vkEJ0IqFeV1glML12TVs9Wi6VIIgRvPTtc@vger.kernel.org, AJvYcCXkihXJ7Tu3LOxXd/Fed1h9b40Ayuv3yttw9Ub7NxBgj1mJC6DGcom8SSYUtb8wjRndrmQuJUtsna8K@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ8HKyYub0kNBeL0J/65Z1bzkx4FxfSEsEE7RdHAzIS0OAPJYA
	lOPd08OvVvjYPu+76BKz8NePmdnRkVngasvaDAZ/fMUGB7w5hScy3mU9
X-Gm-Gg: ASbGnct2belSbQYsBbO9W+ke6cuNRlKuonMZSXdXFoGXA8OOVobuj8x+6b0u7iJBxsA
	wCiv97GYaAPJWepSUSuWbtzDuCr1gphSbNdo/ZHoR7wHzIq2seoOfYw8/KyHzDZhWUBrt7U/+sF
	SUtf0nkPfYi6pisLMrMjFJhVZqNaMcyruv+RnNVa+zaL2nuqjRoyoxWxuIp5ZkEU5lHwLuHEiZm
	FlXtqOCvAH147Urho8obu5knFuN/wzP4M8t0hcGi/1TW8OJzj8sHIE1f8jMJFNvr/JEOYV2Nc/K
	igi+iKKLsJIXMJ5EpqTcsWHWS6HRIyUfNHfLbA9ual0TVefkzH3hIpqee9BIk8lb
X-Google-Smtp-Source: AGHT+IFDGAVSPMuId25EXsH25RtuQw5OgumKF7/tJggZDL74R1fo/0EawYSTueGBI8URC4EWYzprHA==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id 98e67ed59e1d1-31346c50561mr22059153a91.21.1749563152000;
        Tue, 10 Jun 2025 06:45:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/9] I2C dt nodes and bindings for Apple A7-A11 SoCs
Date: Tue, 10 Jun 2025 21:45:19 +0800
Message-Id: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO82SGgC/03MQQqDMBCF4avIrDslGTWarnqP4kJiogPVSCLSI
 rl7U7vp8n88vgOiDWwj3IoDgt05sl9y0KUAM/XLaJGH3ECCalFTg0wGF48bIbmybrXWapAV5P8
 arOPXaT263BPHzYf3Se/yu/4UJfSfsksU2LTaVEqXUih3H+een1fjZ+hSSh90HYQhogAAAA==
X-Change-ID: 20250527-i2c-no-t2-2f3589996d14
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LgWOfIRrAa1vCwGdhDD6foU+2vSIX2068gA8U5LxxFM=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcCJMvk3SHQXuEkKlxUtcTqx6wQiJlRzbvCb
 1k/L3QeOySJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3AgAKCRABygi3psUI
 JF9wD/4oTGhOFVoVqvvq1j/1gXrVnR4n6AQIPsTOultTcfH0UuLokbafdBvmOuh+LHbyNrIloOW
 EsbwTfoCxbRwHfwNK4hX6gV6s5xOzmIo9uIGDodKxvUY9CFjOhXjQoV+f6wYyvKzC2VwB3xIqtS
 vAqy9rI6eVqXnvZt+nerWtkyw2daE0YB9JdIEq8Fc7kxBeqEEdyOVC8QLfJXisZ7iQ0WV27Vkfv
 ha0QiRqiuskTve1RBkiVZycdE13EnvyExH56Eos+IOen8jEKxb/rmXg83iO01swEPK/tUvBk2IT
 lJnJNqLHYyEuy+mHZif6bOBrlABZtNFbu0NBNuvnqGmEc4DObkG/Rs0Ml/shZNEujN6h5ITJ3Vr
 sfFro7crRWPPpT/XVOa/ObeD8j6pO7KO0PGc5dNEJ6Et7FuOV0qKCo/970Wny2lfWapKRrbXE3C
 pRFcXdZPjyC2U7q52UWNSot/wZwpFMjg1ePXP1ap07t1XWLvDj8gpVhWU1MV7hmUB+ybEk/vK0r
 rMeA47cCEn+r2P7lx2ZYJgci9AWgsucMybxMGfPaeqDCRy+poAD51BVeo1z6LyLaIwyGqvrJqw/
 bzcfAHuksnzjC3HpJaXaoScK+8eb4hXsGKImzllXPpkmPHI459D9/Hrs88xdquOkrWbo6Gi8AD3
 CROwdhHgypgnsqQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Hi,

This series adds the device tree nodes and bindings for I2C on Apple A7-A11
SoCs, since the existing driver appears to be compatible. The drivers for the
attached Dialog DA2xxx PMIC will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Actually include the bindings...
- Link to v1: https://lore.kernel.org/r/20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com

---
Nick Chan (9):
      dt-bindings: i2c: apple,i2c: Document Apple A7-A11, T2 compatibles
      arm64: dts: apple: s5l8960x: Add I2C nodes
      arm64: dts: apple: t7000: Add I2C nodes
      arm64: dts: apple: t7001: Add I2C nodes
      arm64: dts: apple: s800-0-3: Add I2C nodes
      arm64: dts: apple: s8001: Add I2C nodes
      arm64: dts: apple: t8010: Add I2C nodes
      arm64: dts: apple: t8011: Add I2C nodes
      arm64: dts: apple: t8015: Add I2C nodes

 .../devicetree/bindings/i2c/apple,i2c.yaml         |  5 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi            | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi            | 57 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi               | 76 ++++++++++++++++++++++
 9 files changed, 594 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-i2c-no-t2-2f3589996d14

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


