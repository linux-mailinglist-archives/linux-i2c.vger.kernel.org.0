Return-Path: <linux-i2c+bounces-12734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E00CB480C5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 00:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC40217747F
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 22:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CAC27BF85;
	Sun,  7 Sep 2025 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lROX0Who"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ABF1B3937;
	Sun,  7 Sep 2025 22:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757283216; cv=none; b=t3I+Wg8tHtPhtXvd39AQv1tGc5HvtQu48DCydX/tvnvx/azDIoJCwhvp6Bnm8CZlPdIGIKiw/z+u/7KjUCAn2yba7GaAuRyatdR5nd1vNquUAQITu+M4FzWF669achLbLXHgGwQsV6ZM1eS0PgXaDUReBVyxmNnvalMutymkwis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757283216; c=relaxed/simple;
	bh=tLVqjY14UAePc4noRTuUWPb5LwslyhZKVli64rzmXlg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OKHZlBKBorozvB4GSqEK1alzw3G9QhFbzeNyYWurWhOdO7Iefo7pp1wPyCBU4f1GYpLaapM84FQ6Boy3dnUEGikdbh1kUTlH97TIC5nISERiJ2YeShcQ/+HOcpTdgdMOdfvjEQvw5dEQA4I5X+c5yqgY+twgnqTzu8W7eXYYTfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lROX0Who; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-80cc99fe980so388674985a.2;
        Sun, 07 Sep 2025 15:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283214; x=1757888014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Im1JmmLYtcCw8AcGDb4EvZIp3UT3ZDSThZ6eBWeytEc=;
        b=lROX0Who+RO1PsTk7lVvHF9abs3lhs8KSn3+PkhTU3kQ8Acd+6pxhByT//lhcYnhyX
         6eeivlCiM+fWHKsu32E7OooQzX52sgqlT1Z8TR2fQUPHCq+7K9so1EXud8l2PRXBqrsS
         foJOF0Tan7D49XEQn/B7yDr2CmxK6RkRH7zx0MRQawpj+PXeOc6wS5wZiwcERlfp0UbO
         LmdJdtVkTa9WOoqnspYn2gAuJgA4n6JWx+bQdCVTOAqMOg6OpK58zLtbqLtTh7TqPPQo
         XU/I+NuKKo4aVxZNQB2UA0dcrQoob9wWUODV3etsPFDxb7S5tCAWUj7SQ7l31+BUz17M
         gn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283214; x=1757888014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Im1JmmLYtcCw8AcGDb4EvZIp3UT3ZDSThZ6eBWeytEc=;
        b=eDkCJEFjkbcCFngtnECv1jpNaz5/t0lhyshUm+N7BSUy8o3Aac8UuIB+lqU1NChwL4
         ieJQGp2vdhHy+o4CXmg/hzesrUaMMtkFL+tfKWRLxXuCK0CwI7HSMlapOQCKfVppr4Dj
         DDm7xvWlTMI/s6tLE4J4l51m58yE31NIDE2VeZ33ryBg8IoVSsOyyrxm5Sk0GJwM/x3a
         Arau7s9Y27A+gNUnn7i24Yg9iAPM4t46uFpZg60HCthnKq2wfDYe83OTJt7Y6YMlvNSW
         bL650e6fQtkCv4ug5YyDUThWlvZKF0TgybFPsCLFgstMtknbpjAhBJf7WmW81N1S3RWz
         gSxA==
X-Forwarded-Encrypted: i=1; AJvYcCURcvD6TQ82nSd8ljwBSK/u9ZLeTAlVMsZq6PDOA8aUbQHqq4cMxkCJrMhJQyeNs5UFdS5eyq0p/DT4peT09S40U2k=@vger.kernel.org, AJvYcCW+8h6PTmzt32TPx9SCFD+8SzLo0Hm4682YRs2U3dJHTHx7o68d09do3uwW+l268DN7P3h82zT1ZUE=@vger.kernel.org, AJvYcCX1HejzDy/ym5z4BOWJVp+u3egrLwHU2eQiXD+tGU+ezXXiCi/XllAVtTP7IcmxYbu/zJGdRquP5pTMP6u9@vger.kernel.org, AJvYcCXYfXEe3qWGJ9Y+cB4QfZO7puh1yD4hD8Ujh/dAMYe6KQX6t6qM6nAcAe3XZH+kfEDrFx6F6OEM2PNkyh51@vger.kernel.org
X-Gm-Message-State: AOJu0YzXS7aSBTGovJyqJcnitrWbIkj1CKMnYqQxIeOgaypLje466tR2
	SODBAFQrcp2H8sk/G1bSvW5FSmRmeuGivbSdiCWPdxsJaFfrqp7gItVj
X-Gm-Gg: ASbGncuyusv70pkjtvooth+eo4dpZ4iuBJAEmae2BSbef/EjYUFS55AIAWltHu2eOmo
	PO5229SUXxdmO/93U0UNt1nUnsetnwrHs/g5zX45hSoL6oXPHAeWHof85T1Ua91KKjWHFOOEPUa
	PvSVDbmAylzOoWPDLL4EdKoyGnvZCPkF4k5uomPtt8Vuar9xKLwMxhbCc4CpEYbQ3ZzGvAkUdkv
	GSc3ndKsz27d3b0P3qOEPwJktSAQY9ePoa9h0DDuxosRkZyCQoUEANuZS6cuFCTikwV/ekHlDNX
	z6XU1q01UK9coATG/4XeBSEkDob/MVeyQmnIqSQmRrnTVZgm4iFUvhipIJrh/BjkHcVzdkHb5QQ
	FEwwkhuccjztXn8JNuwY8KbXc+YwnXjPb4aPpoHfBcQ==
X-Google-Smtp-Source: AGHT+IEiM7eS5nfrbME2jcoMbIuxMdQDQ+5QJZ8z8QZo15S2tz80rEoTS3DMD/i+1xW2u3NOJaleig==
X-Received: by 2002:a05:620a:4115:b0:80a:beb4:7761 with SMTP id af79cd13be357-813c3d781c4mr592039185a.76.1757283213734;
        Sun, 07 Sep 2025 15:13:33 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:33 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/8] arm64: dts: exynos990: Add PERIC0/1 USI, UART and
 HSI2C support
Date: Sun, 07 Sep 2025 22:13:31 +0000
Message-Id: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIsDvmgC/32NQQ6CMBBFr0Jm7ZhpBQmuuIdh0dABJhFKOko0p
 He3cgCX7+f/93dQjsIKt2KHyJuohCWDPRXQT24ZGcVnBku2ooZqXHO/V3Te40tlCZ4VK2ZbNSW
 Vhi+Ql2vkQd6H9d5lnkSfIX6Ok8380v++zSCh4/pKVDbG1UM7zk4e5z7M0KWUvlc9Lhi2AAAA
X-Change-ID: 20250907-perics-add-usinodes-5ee2594041e3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=1553;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=tLVqjY14UAePc4noRTuUWPb5LwslyhZKVli64rzmXlg=;
 b=NAGmpZhkTIQxAL8Qd0JITLUSY9I0k45wB3RHfLZGE4xYSnldnuff8aEV24yJVwPolIBVU3Uu0
 PheQBaWeS1qCAI1+T4FBvM/Z3Gcy/8G+pr1hUabWIl/xf7WE6AGAbLj
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Hi,

This series adds device tree support for PERIC0/1 blocks:

- Add sysreg nodes required for peripheral configuration
- Add USI, UART and HSI2C controller nodes
- Update bindings with Exynos990 compatibles

These changes enable serial communication interfaces
(I2C, UART) for Exynos990 SoC.

Changes in v2:
- Remove unnecessary blank lines in HSI2C nodes.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (8):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      dt-bindings: soc: samsung: Add Exynos990 USI compatible
      arm64: dts: exynos990: Add USI nodes for PERIC0 and PERIC1
      dt-bindings: serial: samsung: Add Exynos990 UART compatible
      arm64: dts: exynos990: Add UART nodes for PERIC0/1
      dt-bindings: i2c: exynos5: Add exynos990-hsi2c compatible
      arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1

 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |    1 +
 .../devicetree/bindings/serial/samsung_uart.yaml   |    1 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    4 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 1419 ++++++++++++++++++++
 5 files changed, 1426 insertions(+)
---
base-commit: 98ee0e036cfedf543c4728a604fd7870d0000efd
change-id: 20250907-perics-add-usinodes-5ee2594041e3

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


