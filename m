Return-Path: <linux-i2c+bounces-11789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F951AF61AE
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5241C28684
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E852F7CF0;
	Wed,  2 Jul 2025 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="bpKlO2zr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A8C2F7CE6
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481622; cv=none; b=ipTu8uuAuP4f3cPTKrjAvAkNV11UYyAwZmlqurrwfHX9cdRdLULH2134ev02KZgvgNZWpPc97YNQUn3aibg0Gjl5DVPxoeYKYx2rjtQSGrpay3ZtDZOn4mm1iXyDmGonYjfPiR39+PZ1tAuhzjQni0UMHiAFqPHegZZmjJJctiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481622; c=relaxed/simple;
	bh=uR10k/MNsD2KTqxwxNLmNVi+dmMLfNBNQQvEqJsmDa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5yfVrqOpoJLvDvxAokKF8p1+vsq5YJ72yRp3b+asRU8r7KkIaX5+jOEUinnZu+WlQx8yrriSfYUG/pQN4CeC7CK2V8uCFFRDW1KpAsWM0BDdoqrTGO+3fotLfCAE0vb0VPC+GT7pPirk8K7WgtS15qd+aRRVe/9TdrFIAhdFEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=bpKlO2zr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234c5b57557so48242485ad.3
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481620; x=1752086420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbnTNMFdG2kGnp4zBFs5MgPMup5zL0Zfe8VUfuWUBv8=;
        b=bpKlO2zreZ4Dw49+XpbddUTu/s8vYAQrprCuWs4FMzPVmKsaPdOuGCsWR7P1CqUmbg
         aQXF8g30FFZD5HNZyapB4pHSUbOyYpShNABIOSJeF7xGeUWbj4AX/3ZV1HDR54SHW6Rb
         Z3I2jzQ9kzZ7gNPHpWswVYvPn+vp4X6sGWtxGhoDSfhtEvRs+TdGQdFYGEl399uTOuM9
         q4F0gD+M1bd1ywcOJgEP3AkYT573RvKvzsJjjUXed9oHnxqOHG3qpQ6WfelMU9UwhLBc
         5m0gvn/DJ+suKGPTJMvaf7teqS/TEBabuLP2Y/uTeE7cMjkuNPOo6sGA8HYDgDcceTdF
         kQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481620; x=1752086420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbnTNMFdG2kGnp4zBFs5MgPMup5zL0Zfe8VUfuWUBv8=;
        b=PTh791+ldQvFHyhc1lCKGfmWU0pcFlYUj7PHozYDUBvIPr+A0I0M/rqXybHufF53Tj
         wnOKGLAzZ0p7xqk3FRhvwPru/sex+Fl8gADZlc6k4nYn6dH5dFpxeOru2V7/9mVOqFnv
         l5m2HvVAoNUfXXrhXugxrLLdb9YZEYOf/nmmyOSPHxRrTMSIuj0ZXGYkJClh9XpZQeSw
         miM5KJmOKCIzU+faYyjJhfM1uapExF7TlD19fRRChTFxRcx5TBjr37OHksZVJlXHzcG7
         m9RAptDx6kP2tb1J5Barc9ffc6kFBBL/SjY+Z4u1IyT3KifnuZmzl7j98wWXHXLWQ/WE
         EgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4KHAbdhEUhl30Gd/EH0rdlVovmrhj8XCY2PPz68sYIfLiGNXTo1vIEoPpF1+hvHtaFK4inqVphBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVhe5ipBVtIhKhEB/T/yA43xrwAjBKpR0hsOKe1tT9WMVg6Ciu
	RtFkhhJA0/CVkWGp8sZmyQDoHr8mBBAXUgnv/LG4sPJzNVpHnqE3Cc3HExHulDss6mY=
X-Gm-Gg: ASbGnct5bmeFVay/wuePJ1Swwpx/FLpvCs4QXUuL/KUnCjkJcBKLuOvWT9ZI0imRC2C
	uu5sYtmgtffrREPMl5Y5dEhG5fjawayI19m/X/Q1ZrYsVF7Bj4crDvzgGrBEpwyP1u4i3Bd+YEj
	X1Jq2gBMB1CbPCRpup059iZycCz2BkF+dks+ZAw8rVjDODB/vgNFfUnOEOhVkBMUrRF8N6wCv4V
	3cctZuBbCN0y7f5XlFWdbgMAT6GocOzGwNeAIryzEEDDEhReVNoU39HJgdxGNgQ5pr9pHYezko/
	uIoNVr3KoOA0H5hEhABD88VIpjco1PMHwssLOr5X8s7hsEXJb3PVwbRXywtzSoSM9XynKaC9yqO
	VUlqf5tlEz53FXz7OdX4QbDQ=
X-Google-Smtp-Source: AGHT+IG4Ha6X6nXWuDRiiAtD/IybzMavhr6X2melJ3MACMJlG77wfbwOcD6VvpmvkGPoSxTpUxzwhg==
X-Received: by 2002:a17:902:e751:b0:235:2403:77c7 with SMTP id d9443c01a7336-23c797b92e4mr4443315ad.37.1751481620268;
        Wed, 02 Jul 2025 11:40:20 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:40:19 -0700 (PDT)
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
Subject: [PATCH v8 10/10] crypto: atmel-aes: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:08 +0200
Message-ID: <20250702183856.1727275-11-robert.marko@sartura.hr>
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

LAN969x uses the Atmel crypto, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 04b4c43b6bae..7c1717c35b76 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -439,7 +439,7 @@ config CRYPTO_DEV_ATMEL_AUTHENC
 
 config CRYPTO_DEV_ATMEL_AES
 	tristate "Support for Atmel AES hw accelerator"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	select CRYPTO_AES
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-- 
2.50.0


