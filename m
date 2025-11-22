Return-Path: <linux-i2c+bounces-14231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F74C7CF9C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 13:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 36256354565
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C280E2F1FDB;
	Sat, 22 Nov 2025 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TH3A0TtS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E23298991
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763814558; cv=none; b=lU9U93suqgpm4HEzBaXhn3dnsfKsescuaIoJcqHwXyzfqwCL8wc8mpz473eEyY9YOjNi3hw31bA/eKjbGETGDwtfg6cqwfl1wfIR2Ic3zh696GfWZMJ7L08kYLvm35M7TCCGEEwmLeax3IvgNKRAl3UPjmsDv8gDsguzJjqavJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763814558; c=relaxed/simple;
	bh=Kv34Qhw1M2zx0fQhMPas0HbCW/VUH/y8+M15EkSCoKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R+RMeThuGwIndeDISXxEjFPR82BEUUKBNzqQGCjYOUFy+lrcZqwDiu4nuHPq36/HXppt31P1Zt4roXlgESo+/5wmUJxyf3NPcBkiiCAtY/Tq7P6ofM9jc1sxinJ6nLqISV48kl6peA7KwZtELbDzzUTnFgPul0Grpe+fZtk4rV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TH3A0TtS; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a5ab1e81fso25087531fa.1
        for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 04:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763814555; x=1764419355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KE5zzu6+WyidL/pFkBhQCA/eTQnpCwLRhErWx45XT9o=;
        b=TH3A0TtSslbwUcIqlrkFAmpE9zMsMq1SMiFtMr6ZnnxfCXd1yIe18+o3zfg4qLOmUG
         gN6IAemsA8dL+hClc3uaN3nzjCPW+1wtRaPpisaZIogbIODg8TWRmdMs75dz03aViVtl
         qClNInYv2xH9HS8wjXIa+N5ZSBjK+JK8/HDRCopqLwz5+UNeeMT670Qyjoo/Ok3PKY2r
         PsdPmhaUJoo7/NLIlum3v/uV1WesRzAt/kuJ0OuO6PTsjnHFES0bJ0W/Q9MoQ/Kc28A+
         Y+Z4agYjyGmerBJVo/g3PEm0knmozL+LcQGtnyTBfXOTGL/indbUC6Kk32GLRlY2QLIJ
         nRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763814555; x=1764419355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE5zzu6+WyidL/pFkBhQCA/eTQnpCwLRhErWx45XT9o=;
        b=BqyAgg1Fe52DLM0n8NNThknasTrxgRpnCs6fhM2K35dO+m59rIpq9+INrCvHdhmZ8f
         GFNVThAqsqo5T26IyIoDp3Bh97GbJC7oFKpP8NSIdAdjjT9RkwPoLVA36hTabA5AuNG0
         5ZbuXSAwrU0XJa0NZsPLpcy4Zq+3L7NxjjssQtPRS/K//7/qGAmeJSgwHu2W1zXMy33q
         KLB2FAmvk4NRzoBCL+rbMPapTfU53HMoUV/Yn6cvaQ03cVXHlmzTerRmh3khSixXohzr
         9mdYdRkgt88Us8HGsMj6f3VxY8xUdH1cnhUR+pE5zOBWOnANUP0lYED/094kRrU1jqpr
         sL7g==
X-Gm-Message-State: AOJu0YwixZg6CepRuheIEuSpJN5Cas4tn2rE92sWx+eHko783H1wIU/a
	TsA27ncJPfBcfWOYilHi7BgDOuhHsy9c1O+TsBkmx4He5mA+NlNvfrONs/4mgHVA
X-Gm-Gg: ASbGncuIq82OwVagb5Qm+GI/T9sVO92IYie9fOe+/RbQtTYsS1650c9J1hXCvpEL7QF
	5LCatZYx7IQF7Oov80HNVYR/gAZXK++Dl/scgGyvYRjIGkijGV6q+8VrOzt4JFmt9KDfRbgcTCz
	TKpy1OVn84eQzPeWeJVHY4n6KRz1nA0YwYXmEOsjiL2/sQvC0OHx95iKtatl9glRoAuwHywAUM1
	zwmqj8V3mavOkVRYEkQtyeCkuABMW2lv83vVDArWlvTBGZ22AiVg19VOHlC3wiwWIvH5zRvrRHq
	IkeXPbP804aecg98onT2vlW5rKZIuA5Psnv78iwYaTM3NZHHkD6gx/3xqGJWVGlqEfOqDaJZ9yz
	vaTKSykzNYGq5fP29tQLRs+aNksub5A2ROM14P84E0NU/LcNV+H5vkhokyEduC2j5IHAXGgG5hN
	dObCVQ1iR7sFGeg/9go559BE4sQCgHaETWAsxfJKXYg0BpA0kZTtMIqEJmLyreBpM=
X-Google-Smtp-Source: AGHT+IEfHEd1eKtbkmPVx2iC265Mj7H07T7tOJ7ekf7uuPq4wGrYxeF9XEHvwGQeCxYdDEVuH6afQA==
X-Received: by 2002:a05:651c:4184:b0:37b:8f05:13bb with SMTP id 38308e7fff4ca-37cd9252e34mr13332011fa.27.1763814554382;
        Sat, 22 Nov 2025 04:29:14 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db89886sm2437043e87.38.2025.11.22.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 04:29:13 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH] i2c: i2c-elektor: Allow building on SMP kernels
Date: Sat, 22 Nov 2025 13:26:13 +0100
Message-ID: <20251122122846.28493-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It the past the i2c-elektor driver has been broken on SMP, as it seems
there has since been some fixes/cleanup work to get rid of cli/sti and
rely on spinlocks instead (as pointed out by Wolfram Sang). Tested this
driver on SMP kernel on Alpha/UP2000+ for a few days without any problems.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
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


