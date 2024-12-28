Return-Path: <linux-i2c+bounces-8786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0803F9FDA1A
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 12:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4BF6188269D
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 11:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D44156649;
	Sat, 28 Dec 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcziHiQL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB4D78F52;
	Sat, 28 Dec 2024 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735384521; cv=none; b=mne0KgGo7ifqLlnBjm5AbpVVLRn5s60RV2nSyxGVcElT9YK1aHHoHiSbFfoLZtJvfJCCNm2YBMXdcCqz/+SSiPwhNg9IHO8YrtKsrBZga6AWxFkgXmTE5PL26S6cnsE0IkEerorkoJUtV68zQLG3gKLX1lIZ0Mr5z8uLl2NOK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735384521; c=relaxed/simple;
	bh=/xP1wdEcaA9twXE8CUFnp9z+DhUEv80t8HuK8Ar4vMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cvyw3l4qNm3FvO34SP6iSK7hz5jAi8iIBalQQIEMkFz6Ho2vGGpsYM8SN832rvNRw6J/krTnbxX9MxSp0bFyDJtBkI8Aiv6nusjWgmPt1ICTHfzSkNlxMziKm/fIOcQKM6vHjDx9xz5QgzPmq6Czttdbbw+wglXKLEMQ52ovnpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcziHiQL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361f796586so82985455e9.3;
        Sat, 28 Dec 2024 03:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735384517; x=1735989317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nwph7eonXv9FvAIAPWUAen7H5AAgYZRILX4Lj5GM0pg=;
        b=TcziHiQLt9xF6pEumltV9Rr3U8BZJyjmzMbIISXKxhZWUBpM79cGw7YcvFsjnVYuVW
         MOMKhFvF0yOQ/nkvOpf6VslcOW1YVMfpTk2lxFtJsLbrckFZ1ZDfNkBtGyTZL+9ZjQxf
         BQpSH/Z1N/INxJ32VdZVnxg+DJQRcouT5YtGlcXwpfNbVnDPm5ZW2E1Z69PhkXcguxbs
         kw4mebfeL3Sf95UtkvTOq7310C23RbkCAnIq2IqwfFl2T7R2I1KrZfDW7Bw351RlHRhr
         3ujpE9HTGV1SfQDCRf0MEIHSxwUUsdPwUDcZPyQ8BDWLg8FYyxuh6h9CwD5CDIQcHaWx
         3ESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735384517; x=1735989317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nwph7eonXv9FvAIAPWUAen7H5AAgYZRILX4Lj5GM0pg=;
        b=Xgm58ie/zsME78oSgr7X0Q6l+1IpBvWa4Oc1HB3d3ZSmIWAuS8JCpkT8fD/aKsK1ay
         SkfImYbi2sA20aTFkug1iGqg7CtWJM0eyE0DHjRMQKV7/a17PbkOhM4+EIHH7dP0iqG8
         NKK+JlBf/Y99FMJomi2xt5ZYPavHlgA0+HAWRJqnaSedMFDVqEJBlEGPNuup83n24d32
         ZpMfR/fX5gHjGcFyX/QmfYmGi0HxPBjC4B7L7baZAgGYHox1WAZtI+1Cveue138JC3dB
         qrwBhbuAcTQv5NRzBFK8KtwDvbWY3UGYLBVA3g9h/OVhys2+L4dGQYpql3S+eQTTTg2A
         USdw==
X-Forwarded-Encrypted: i=1; AJvYcCU8V/xqzDWEVJN2VIG5eqZUkO2bve2HibZVK7a7g/xNbl0Fk7NDe5UARG8lzULso67bxO3hs35/JUpr30eW@vger.kernel.org, AJvYcCUey3xAOH3NzwhX9jjRApjMnEnVZg3xKcxVPIDNakABDodEHtq83Zfa5rZjiDsLFILUYVFYTF+DYfwWaLayV4N6RIU=@vger.kernel.org, AJvYcCWnlYssFkJb6CeQ2PDggpfYzaiqKYKe0d459psMhGrC19yDADH3r/+EqoAZsMhdf8PW97aWtemnyk+u@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVm0n+NgNAFEBHyOryWXIjJp78yyOoxPmD+PmSjG83bwjpbIZ
	jo1QOJxT5Nmhy9lr1D+KmH4atgAB9BCjSrewklORyMK/9qsvVWc2
X-Gm-Gg: ASbGnctiFcBBcJi7yVy1NWvVkryC1rM5Ucyn5nBZz63ed1LblYUM2yX5jETezROx38+
	Bi/1x1ng9ebFJiztT44rCo+vGH/2Ab0zrNQFcuqS/lf2HffWZMnXXjQFGnwfhGeGBc2fKpP0DP6
	XpkXrGwbkh/OG/Fs1XwlZL5x51gknSxIpr0FhtHqW3VVPy+6VYUh1TrsK8LUGMSmbqW5q4uoZy7
	HIUQOHiS5TjptVRLCoGBtRFzHolumOLDYQMgNG9quHTYV3RvieWCcl4NjCQEhAlpTpSw22vSGif
	KBxoDjnG3fvfYyW32PMjUVa7cLjU7zXP
X-Google-Smtp-Source: AGHT+IHvVyZqzFj4ExfeiMiH77fTmGWeHyD6C7RnVNZMQurDRHi8gE06T2nib6+5L0iUhRLvmSOaDQ==
X-Received: by 2002:a05:600c:35c9:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-436686440bemr274132635e9.17.1735384517012;
        Sat, 28 Dec 2024 03:15:17 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm326226075e9.8.2024.12.28.03.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:15:16 -0800 (PST)
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
Subject: [PATCH v3 0/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sat, 28 Dec 2024 13:15:07 +0200
Message-ID: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
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
available in the device tree.

Kind regards,
Ivo

Changes in v3:
 - Added a r-b tag from Krzysztof Kozlowski.
 - Changed the temp calculation for better clarity while also fixing
   an oversight (I2C_TYPE_EXYNOS8895 shouldn't -= t_ftl_cycle).
 - Changed the driver patch commit message as suggested.

Changes in v2:
 - Dropped nested-if in the binding, keeping in mind we'll always
   provide only a single clock.

Ivaylo Ivanov (2):
  dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
  i2c: exynos5: Add support for Exynos8895 SoC

 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |  1 +
 drivers/i2c/busses/i2c-exynos5.c              | 35 ++++++++++++++++---
 2 files changed, 32 insertions(+), 4 deletions(-)

-- 
2.43.0


