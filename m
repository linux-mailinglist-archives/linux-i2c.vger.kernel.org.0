Return-Path: <linux-i2c+bounces-8682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ECE9FA14C
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 16:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EA0E1693F7
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 15:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFD51FAC55;
	Sat, 21 Dec 2024 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VspNLYF3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E21F427B;
	Sat, 21 Dec 2024 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734794407; cv=none; b=SWtoU79F8tuvSsGmWnxpT0tXIEyfnVpv5VBxD6VeF4jk5Y7h5WJy1KnXMP0LMI4S649nJ4j2nw4yFZOYC3v2pt9RfBy43ePsRbAeWZAKwNlcgJwbm+IvnbCc1fverN7fobMwKKROgDT3/RYS7DtWL3voHlQz2DX3CRogbk8wQ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734794407; c=relaxed/simple;
	bh=9v5+hAHd32rlHLafrWQexc/fi2H6/adWC5gbLnVGsL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axhmOi3Md2l7meHWVz0+6safnkufh3+RE8k9v1YOqOPh06N2gzFJwWd+i8xcxqopm0/KikEJ6+7mopJMPTPFyGZ4KwFAiZvvAOVaFeUZniWC08kUMJicuwsgOk3UIqxBZlHYexxOK2iRN/05BgYSoUgZuZMDIKfirZyrT2kI0Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VspNLYF3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1832329f8f.1;
        Sat, 21 Dec 2024 07:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794404; x=1735399204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V63wJTh9Gpi5tIJqemgexT4IewcNUrEcJ6BJ9DO+IfQ=;
        b=VspNLYF3sbUKcO39sT8kAywkQKdceJmPnIYmpoOSf3xZew5on2Es5NDCIYmtjrMy9q
         a/UOvSjYkXqRYogXrWJ1ZGVwlvlSjVT2W1aDhw5mffe/MwOWsm1+QjB6tJ55EigmaffO
         Nt3UwFzn+2ec15fvf2CxYo/5cHdchrXX6NAw5dHNsz68SDh/7LKIPuc5cMgPbiXPAvIp
         BVc5g2rR/LEufzwubBVHdXdydtRqEFnu2sPxLzoDSvlnKEKAPigpZ5i/wqt/CUSFSCvs
         Wn4+rKNZiG4SFhR6QSf5q2VZKnLD4W9Ia/ZwrqqY1K8VdTmzpYvYabGi5dwrzvoigmFy
         /rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794404; x=1735399204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V63wJTh9Gpi5tIJqemgexT4IewcNUrEcJ6BJ9DO+IfQ=;
        b=Ss9DcefC+caSx8a14ci809oJRZOf1dC2oN2poSsYBkjVNoMjIFwZjEm6hJd1EpViws
         heCkPK+i0MiAfC3bqyJLIzO9lq3YXPwOGNI0vUV1uFJ2CeAqjEQVM7wvNk7ToBPm6Erd
         21NSkMajmNARwrrKcDf1hsq2RDD2L/a3NCfBg9CBYVhDhRMqkyOYy6UV2Htc3c1/WAuZ
         MbPjruibxN80b+OalRv7B6/wNNSgpy5EmcTE7kj4wKdJu+LOXtlmPjsc8jPrhcmR5iNd
         6//uVuBk7vyz/3KSzK54WGTxZIGraQ5Vir0isstEMCbji/b75LRHQZM9U32Ak93/mggL
         U/zw==
X-Forwarded-Encrypted: i=1; AJvYcCUYe94P112Njj657A5V+6pAN6uRwpmMtvRsPDYBD5wWKcqCYMWzU0H7g27iu81u+ui7cjhUP1egQTjSXohYIJ8ybVk=@vger.kernel.org, AJvYcCVMPY/YO4L/bjC9Som4GoSFG/ClsDX+ig6Vpz3z68C7n3iyjFB/nUtdwrxQ4LELntoPDX+5ZY3JwdfI@vger.kernel.org, AJvYcCVVl8uNGAXVT2yzh2OAHMgEhely6UhtSI6vU+uZbFdKzjbfyfVbWCqTRBkli+UYJE/82wb+0X4HS4yZH+PR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuc0yopCogVXEFbZKvQI8FzDRcUanKJzI39eHv3hmLUWpPfInx
	Wih8imNy2nndoYJvnKT1HSiqT7bDadFVZVOnxgMoCfvzWhi6aASx
X-Gm-Gg: ASbGncv6tg8lsot/tk+RrTrgVkZI/3VLeppJ2Ubg/rEfGi0xPc2+VLI1J7yZ64bONU1
	jOZkOBoq+ImvO2oSRGFAJDZM7uZmdGpiztfEhuuzRzmTU4/c9p7FmWyy7wfRS5yn2tt03rSi3bd
	LUk9h8QkMU/cuR3YaHg2MbAlNFl/IgkIx4jsKGq+SwxrdEBgVVVPRrqd5KJtoIzlmQb7FAwoYRj
	tpcwYZPg/q4OfQ/1QLp2Efj0MvDIwo72DNP51kxfbg00lNqUEJIunzSfFXUIGsumKy3+fw4/LcA
	nLKXJJR6AcrmErX7xOLfVUfiTevZ5Ucn
X-Google-Smtp-Source: AGHT+IGxUo7d6FmiNUMjFt1hGCs3bvI+XiU2A4CUZREyhrBfzG+bNHKkB22GLvnHpEEmmpCAj9pj7w==
X-Received: by 2002:a5d:59ab:0:b0:385:f220:f779 with SMTP id ffacd0b85a97d-38a223fd11bmr6377994f8f.49.1734794403720;
        Sat, 21 Dec 2024 07:20:03 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e126sm6629046f8f.65.2024.12.21.07.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:20:03 -0800 (PST)
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
Subject: [PATCH v2 0/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sat, 21 Dec 2024 17:19:35 +0200
Message-ID: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
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

Changes in v2:
 - Dropped nested-if in the binding, keeping in mind we'll always
   provide only a single clock.

Ivaylo Ivanov (2):
  dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
  i2c: exynos5: Add support for Exynos8895 SoC

 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |  1 +
 drivers/i2c/busses/i2c-exynos5.c              | 31 +++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.43.0


