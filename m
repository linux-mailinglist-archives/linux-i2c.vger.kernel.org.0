Return-Path: <linux-i2c+bounces-11787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A59AF61A5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 084C63BE7BF
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354ED2F6FAA;
	Wed,  2 Jul 2025 18:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ecBqhTYv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD782F6FB1
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481609; cv=none; b=SbfExfv4Nqd4LalnL+Vp3w3IOsgWY1brlFYLQqFo3YVBo5YAT77XbNLmooBF9N2ye+2bmzpj3pU+9SH8B/1FGgbYPM7M1nVusJYj2yJu/Jn46pUhzo/UvCIZqwINNlN2JeC3s+8mZxB+bozDjysXWN90+m87O49eV2Tpv+YFQVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481609; c=relaxed/simple;
	bh=F6mJ3voGjUkQtf+0vAv2Qcihci6oK1DMUpz/FxyVtPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4RC9Sg52r+6W5aLY5uTMDDfsmNwL17OPxlrrYuTy/3TBG+1ij3ZRWwPzbIsHpTrmhyt/GliLPwS66vFlxeHmUXMmWlAIZymxehSfICzW7kXmpiK263TY69AcKKGBcuSvSEUuVmdPEwxEEQ856yrHpJTK6gK6HN5r5tDZpcCDoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ecBqhTYv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-237311f5a54so44699255ad.2
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481607; x=1752086407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbC/GH7strBGwb0IdiVA7md1jfacDKOVYkS3o8tcID0=;
        b=ecBqhTYv0hRooOBvI24/4iP/zgUK2IigwYvfFYISQFRMloFFOaQHLu0va/BSmYQgA+
         1TL6cbtR7PX3ubrW0AQUqOJGN+kieja0LvdoauASfFdYsX0LXn4Ty556aEtUxiwefdOp
         2kk+nvcF0TNNB7sQgDRsnI+vAyAE75IQI4zVvR9sYCEIKRlDRZ5EE0xu4wERBZisz0JA
         axhw7QLczIqIh5aSnS/dNCpSrvzu8OKZWxg5XIRb/ix4Qsw9a1XZShq99HmWiIxbldU1
         s4uTAqhECBVgFKBmNnGrky3yiMmjH0z53yaP1B0G6n11MLChfbyGG3ZqF5vsEcIpg2ua
         AlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481607; x=1752086407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbC/GH7strBGwb0IdiVA7md1jfacDKOVYkS3o8tcID0=;
        b=feTnUWoPq3ZX+mVjAPBXdWbOQsfM4urDqAJoOD3x4of69XFcbPTi7vsMBFldhEpOOq
         SU12dCpLNiOkqFuCUvptUxgr4Er2nGenhpZmeUSENipVucjRH+fXfFUgRf4omLFjSlZd
         Vm/NJPgkFxemleyy6NhPPDr+Z5Y39YmwRvp85MITlgiQBrs5ofToALjDI2dpcqfOkA1G
         zVLrh86QiuYpBiwVtmt1HnJrVGOI1XibukJtQufC/+FFs9WCRoeaiY1kW8l/voFGV6Xz
         4mVVcoF6951qQB1FgTuwhfb2GR8Xv3Osf/0lomUtdELpouAoiT6h232wgYyL1/tXhmc1
         SaTw==
X-Forwarded-Encrypted: i=1; AJvYcCUCCXUPxqBSthuzsR+JC0NVSFvhuerob0ErGh4yvLNVXRgb83kYPkdGZgE0/V1iTg2SeYqVK8WSD1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8lnQLbG9lW2W8MsxUM7dnPwn126KsKNLv01VX1te4u+TjjXNs
	LR7vlJJe400n8BqOppgQBRMUcsUjfkrSV1eMOfYLdvxPrxqOO6gDpSsaIWaQEADEC2k=
X-Gm-Gg: ASbGncsWM+SS84QCLEWnmmgQ/h8TUWGwKLjtLqEAM0qxyWTKT6w71YqBs35lIPgGqjb
	8kc3MC3ZDKmq21ktd2XtiuP6ML4c3ll7r6fErjgaOOTy4c5JTC6St/mU43CkK7pqDpsaMENzyH7
	jJ5eyJjcedhwxULqxRdE8Upq+bZwZ7sCyf5m8ccL7/ZvkssKLNSr99C5P9mYLEXee/Nrf7c7/Ll
	YI+BCeezG0L2lmqqrnSUnt/BMikmcD2GL2Y7IeRHbHPXE5fyT9co9GPJvsK3R0bmVjrxY6sdwF7
	VU2RlzBbFzxYVn8QY53gC5t9ykYUEv8LiJANEyePZr4OkCsleR4QaxGDOW5vFlEUDAZd5sdvERX
	S4Gj0AKaSBupk4yor0W3Kp4A=
X-Google-Smtp-Source: AGHT+IFr57CoKx0dtGw3L8LbGIOnkIEZXLju9E0LUunBcEwcIBFNROCo+7NEiDnUKvwkV1U4hmG4cA==
X-Received: by 2002:a17:903:2f8a:b0:234:dd3f:80fd with SMTP id d9443c01a7336-23c6e4dbafcmr49910685ad.2.1751481606631;
        Wed, 02 Jul 2025 11:40:06 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:40:06 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:06 +0200
Message-ID: <20250702183856.1727275-9-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the Atmel XDMAC, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 3bc79f320540..05c7c7d9e5a4 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -110,7 +110,7 @@ config AT_HDMAC
 
 config AT_XDMAC
 	tristate "Atmel XDMA support"
-	depends on ARCH_AT91
+	depends on ARCH_MICROCHIP
 	select DMA_ENGINE
 	help
 	  Support the Atmel XDMA controller.
-- 
2.50.0


