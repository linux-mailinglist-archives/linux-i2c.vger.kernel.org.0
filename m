Return-Path: <linux-i2c+bounces-14236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2340BC7D279
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 15:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2064D34AAAF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348CC220687;
	Sat, 22 Nov 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY2o6US/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309321ABC9
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763821070; cv=none; b=lUm787ONkJ3aSqvkD9FwV78BW1w8yGV21ppdpsfEjzZFghJ4U0xDRKCNuaDKcc8gDZxM09SD/w8kNZ1XkM1c038+mY3Dt0XrWAAmgj68Lf0nahaQG//iqgOI8vDMMasL4ShIDa2/CPJ747unkq+nElNLrPoyjwuncs6jbxGgV80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763821070; c=relaxed/simple;
	bh=9LLsvt7VNNfDM0aPRG5iggeE1useAYu1NfbeGLw1XQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U85Mmj0QMJaAs66bMAHb+ktd+zRsHplzoiaZGJGbf+qP1KAkiehDziv38UCiU3buOK+FVYcf+17VKv3dqOhKL1B+PTHQ/l0PNnBlUzQXQ9XUXlC9pksp9JNp7ePPBGuLhKF7xl6i5YlwFmIAvzH1HsGfQv534vHhfNuFtLOPPcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY2o6US/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5943d20f352so2999603e87.0
        for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 06:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763821057; x=1764425857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOwj7vYWM+0plQRjy8oxfTPl4Cp41ILtCWRX7XI7Uig=;
        b=YY2o6US/kjMVr5zHXIy3MuIXJteFTanv5ruc827DLnPkbDWfuCaxeei7/+y+7A7pzf
         8lvmQzQ6O0Hr/H+d61kPNINP5aMnKDpM/qb/0YYlZ1eNxkvI1qy5yUfx3iwj5y8UdUH0
         yx9RC9yRWwbsGkOtepcBZvTY3J8AaxrJjXkrLrhB57WZIPTMnfOUvjitfbuwgnfmIXuG
         6DYDjXQoHCcuedjCurJllTZxecyJylI/t244ibeaF1B/86LvF37GbLc5yyOs1o3EJNDW
         aFpi9RfnsSCeiUzb52RlZWCz8qIWQeTSogDCaaDX1b31XRgMn8G6CnsNwavkQTiOsjfl
         aG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763821057; x=1764425857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOwj7vYWM+0plQRjy8oxfTPl4Cp41ILtCWRX7XI7Uig=;
        b=FQY1Ryr0FPbc8GbvABxBtY8yltkEg8aatNKYlp3Fjk7Jjo7gEW7Kosl6fgpU6Z1g5r
         e+Rb1V4VZlyP6w6QT/vCihTrtHb/rhQLQ19Obw8M2a9Tem4WwJe//x5zMhSAXsA7u5c0
         r9q5wb9pT2lgx2kcKqqKSCMAItXRNEk5rMVuz5E0Y6Kty+dt29HBBQ88fzbWqnApAwNb
         Z1i99sb+KEpZVbNp26qvOvJz+hq7KBxXlhBx8ukCeezTXsqYC0WZ3OHKFdg24Ud3oXYO
         1I+95XpjXvC5WogeRsmxzf0EiMDNCcXPT68FrOTIRH0QszN+wHUc1bKjqlLna9Dg9JsW
         eStA==
X-Gm-Message-State: AOJu0YzLFCTeGJ049VZjxFTrI2A1KVndeGxGzHU6L3kBlbvlVqtiQgXH
	xWtCYAsYfdtJdBWnyRn9SaJvt6UvORZUAO2qMLsN1/j7n0BD4+HJpM7yFrTzQxIM
X-Gm-Gg: ASbGncuZckZ3n0dSFz2d1ooeW6q84T3KhdyC5t48h7Cx5xqY1wfJt3rDzRQ3ZNQA03p
	4UUii+bT91cMGfd/w/y7TK2+MGB0cpoWSnb0m9901Cta/U8QEJQ3zs+xZpfNQGBhPGsXVjoYJ6I
	qu/H+P+Jx3cMwGoLnIT7Ng32/hWawZkdvTTDKzkQXfdI+8x+Po6jLCU0AR1w87YBPknYYCyoKyC
	tBAUlb/R5jbJglY1Ced+IuZ6LMcSCGFbbbMPFCSjlmYmnJ2Xq1/V8XoXqGUelP5KquYQkMZLoD0
	nPYevrdACh7hkW2M9tRZw9jdBFhuuBq06sGZdzDS6su3+zT39ccL11iLYajAzFcopZ4mPcZiXxA
	GvxI3Ir1aaFiWuN5QCr9pylALjzpl+bS6zRVhNkZ26yOVSgHhErhL6P6P0TCc008ZPrsYXGzVGv
	0rwfhPuWRsYBP6LbWdWXWM7jn+yyitcvyVIpnnivyYydeIcwUbP/ARC6kbzlHEefY=
X-Google-Smtp-Source: AGHT+IFklu6JebwqnP8JZakPg7tHk6eSdpiLUuI/6kbSoLXPau2fC+pUuRteao94MnHm1vj8uaTVpg==
X-Received: by 2002:a05:6512:304d:b0:592:f5f9:f5a9 with SMTP id 2adb3069b0e04-596a3ed6389mr1854725e87.36.1763821056703;
        Sat, 22 Nov 2025 06:17:36 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75731sm2436756e87.1.2025.11.22.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 06:17:36 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2] i2c: i2c-elektor: Allow building on SMP kernels
Date: Sat, 22 Nov 2025 14:45:01 +0100
Message-ID: <20251122141717.28570-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the past, the i2c-elektor driver was broken on SMP. Since then, there
appear to have been some fixes and cleanup work (as pointed out by Wolfram
Sang) to get rid of cli/sti usage and rely on spinlocks instead. Therefore,
let's allow building the driver on SMP kernels again.

I've tested this driver on an SMP kernel on an Alpha UP2000+ for a few days
without any problems.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Changes since v1:
- Rephrased commit message
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fd81e49638aa..9b1473d720a0 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1474,7 +1474,7 @@ config I2C_ACORN
 
 config I2C_ELEKTOR
 	tristate "Elektor ISA card"
-	depends on ISA && HAS_IOPORT_MAP && BROKEN_ON_SMP
+	depends on ISA && HAS_IOPORT_MAP
 	select I2C_ALGOPCF
 	help
 	  This supports the PCF8584 ISA bus I2C adapter.  Say Y if you own
-- 
2.51.0


