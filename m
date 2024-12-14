Return-Path: <linux-i2c+bounces-8505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 641FC9F2117
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2024 23:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1656188639C
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2024 22:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8961B2192;
	Sat, 14 Dec 2024 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Myno+Fu4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B1E101DE;
	Sat, 14 Dec 2024 22:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734213894; cv=none; b=Zx5tgBF39/Oc/xc/a0NnyaoFe2D5wBojAIRhBpYxK6eFPrJyoUNBlEM1Ef+8KtXK+ZvVqk+/DyCBkTo2NpwfKVsWYWavHuCsTiSU6hdKQQQ8nHJRgsCymXD9QxDHrbAHglnmJoEH5JVNmPgDTimvHROF5h5r4P/zBOVYBiJm628=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734213894; c=relaxed/simple;
	bh=N4cZs98f7oy2DlvxebZBdKCvvFB0BUa8otlmhClILfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNkEZCD5GVhbyfhSG0VAtWyfDgwNzTmQq3aoLmhmAm98tb+NjVaWSO+75JrypCBvNSINBMBoRUunAwmvCX1g1v4Tnc3GGHk+eY433lpP/v9VfzxqbM/iF/dPFNm1T/xfFBT63GJw60cAwZySQuRoa2BA6wugQo5T6LO0Nkc3hd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Myno+Fu4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso19917545e9.3;
        Sat, 14 Dec 2024 14:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734213891; x=1734818691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rZb9moUiVpxFCMqmY6tsWVihMcoiO44ViJkmkTUeDTs=;
        b=Myno+Fu42VfFbKHGf/5yG79jtJTDDhUpl7l0DDFPSHN2P95Hi5nAgsMvtDRmALPh2k
         15cXV+ET3Ro+vC+3dLjYR695q2KAd7ArRbDWmNlIlD7MXWpxVk5yPC1gtQqnYDjiK+qa
         UUzQUwTCU92Ki2yrUP5bvhW3jICOTBSL5yVc0/ZufA7aCd7aY/GDlkS5p6DcT8T1s0jn
         1Oslgu0Rrw+axj4BczwAToA54aPEe5gUFXLjKwsZmkPPtwfU03e6E7eECopermV4Zml7
         4DLyLDBMeWEVKzlhApOvLeGMAh36a2vSZs5SUocGAWAFgo67k+Br5fW+8EqN7tbw+hG8
         Q0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734213891; x=1734818691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZb9moUiVpxFCMqmY6tsWVihMcoiO44ViJkmkTUeDTs=;
        b=wdX5Zr9RVa7iJbutYIKgX4KZibu9cfJffkYgl6jy3CFaEdNMdrq335BgFRkHR22k9B
         XE4PgCcLFNMttqNRXTOQ48/PlcA2IaOuE9w4O70xE3UCDQAaL35dBOLiNiQgbZ4hqlql
         yExnB5ukD64MRHQi/dLQ1iMDcHcaZJ0fwLj/FHqsAgkVdcquJ5CtF9vSENhp/RfvSTpu
         ZkfL01bNC7KiiNoCve8sA0hbq8jHjwjray02rSoltjO8W86pOt9ZXxeZK74d9GtXudjI
         EpsV2IZFfNXPJESAk2F2CzxbAL08lPRBZ3n+ZS4ASHSNUaiTC+7HbzFOwNq7TWKSLVXm
         DfKA==
X-Forwarded-Encrypted: i=1; AJvYcCV+9oI9xye/z4J6UGV7wnA4zUoVr//E7aXAeTj9ZKj4CbQWj2CsAcPNYsichs5ng/wIX29DuIZh2yD1YbVBJozosgA=@vger.kernel.org, AJvYcCVi85pDGH3uH2/aDC3/DciBOCVkjLjHOuD1Fevkm6ZX/8rhZyxnyaD/LrSKYldfAvDXZrI7K8akzYV+RUkZ@vger.kernel.org, AJvYcCXszkneLfIFAykZKmJk4QxtSHJ9ewIiR9Bq8E0oqB2I7WWMl3e9TRHuSywJB6hfMW4NogYPV9U8M/yr@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVYSkFF/53+Ga5Q9QfGaJ9LmYJPAFDoU3bNmNtqET4umWDrmd
	78WJ0hsvN078IA1AlNrr3WGSEEXZCFcXGxkFYE0rSntGnJgdu4lw
X-Gm-Gg: ASbGncsDELLkcfqu+rslfMt2TWNFvRzmVmKlFBFmutp9APwV0bdgKEEUup4HGN3ht0W
	LYtu7HV6YdkHOWpXBAPR/EcmukVreSY7uSPaf/vqQNq2p9UAHvS1ZH3lNyibrdTbNrdCff44Zgw
	Cnl6W0AgnBn6oSWFAzaYc10If1UdVh4X8mk6fdMAeAycDdYGx0G+OGtEy1PYBq1Kz/HRMkWXlbh
	mdSLgwGm822wxImkE7/r4kjEJ2tJsFYslq2vzXe/HP/uLd2iHChYrwbuD9HFVt3237Ybu/iPLr/
	wWD2tM9nvFv1ZNdW0ePs044iAAzzMTfQ
X-Google-Smtp-Source: AGHT+IEp+JHm04UmoCFXhypLWQox3sRGEjPR48qR1XxVmCrxM/GGVQTqiSSl6fYMc4Bk25nsaMdzVw==
X-Received: by 2002:a05:600c:1c12:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-4362aa3d8bbmr72912625e9.16.1734213890608;
        Sat, 14 Dec 2024 14:04:50 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec75410sm104456185e9.1.2024.12.14.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:04:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sun, 15 Dec 2024 00:04:17 +0200
Message-ID: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This series adds HSI2C support for Exynos8895 to i2c-exynos5. HSI2C
buses here are mostly available implemented in USIv1 blocks, with 5
available externally - hsi2c_0 to 4. hsi2c_0 is available for PMIC
(although I've never seen it used) and it uses BUSC clocks, which are
still not implemented in the current clock driver, so I've decided to
leave it out for now.

In the next few patchsets support for USIv1 will be added to the
exynos-usi driver and with that the rest of the I2C buses will be made
available.

Kind regards,
Ivo

Ivaylo Ivanov (2):
  dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
  i2c: exynos5: Add support for Exynos8895 SoC

 .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 26 ++++++++++++++--
 drivers/i2c/busses/i2c-exynos5.c              | 31 +++++++++++++++++--
 2 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.43.0


