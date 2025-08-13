Return-Path: <linux-i2c+bounces-12284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E25EFB25281
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9210E18954DE
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0472BE631;
	Wed, 13 Aug 2025 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="uCEjxzL9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9BE28CF56
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107291; cv=none; b=UA+g1v8vZfSQRHHtJ2fwiOxVFxZp3gWtpVzBAfQqJib20stQI/SVbbwcmV3MHhCbCLeufeA9CP9pXpUZOem9BcmR4EMo3cnMDdwkpCOLsehHnZA1lx1/WJDIMV9qVI+RYc7dALWmuNtaDeZZyiHiPy/X36Piq7ZR3qMARgqLtgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107291; c=relaxed/simple;
	bh=wVsDz7PLWcqLuNDyAizM/2yV2YynzKGFnsWWEvqGeqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdIU7N3AYW/b74dDqkoZm355l8xRVjoLoAi1RvF/dsjaiI5yzQqA+lDmRjObmWaz2DpGpSrLxbxXrDvY30sIlVC+NiqfEKYzZwN3kW102Po3Z4BR4ACoYRFHt7xdnMAAQaUH+D5xekZVP+UgGGUjyLrc5THD55LPX8kCgzlUm3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=uCEjxzL9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e87030df79so8989785a.0
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107288; x=1755712088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR9O5hej1zVdBrSrvTEY2n8cN8r/rUR8l5graqaiob8=;
        b=uCEjxzL9d6OxCyOhmQi3vdf6Zth+dnpTgzkFmF62rxI5lmbr9a7I3BT+Aqjv0s6LUV
         U9DBnlwEVGCAp/MeK/dxdFk1den0Y1v99dvqjj1SN+h1nI7sWIoVXEVfUNysmXYHEEiK
         fNLCmV5VNMAeiuRdQwa41npfs5rCwwEgsK5qqWlA30Kz4rvpyVWvqUgeNELha7yacjbq
         L2I/M3nup5RK+UmDwy5nsMUiczXNqhWxVz/yBQE2AySs8JD0jsnD1lMR24wMQDsdyedN
         pazjC5kLX5m1eILw5+jAU3+e+g6pW+2vy3F3PMPrZ+gaznpdDOQAyEdU3pLTcvYy4NcM
         5nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107288; x=1755712088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NR9O5hej1zVdBrSrvTEY2n8cN8r/rUR8l5graqaiob8=;
        b=SnzlKCmUMYq1THzDclbKevKSTWjUk48wSKNHlkpK4nBSlTky88kfrYpH8p6KbrjsmW
         4oVmECMkfF6X0M3shPWGiYlP8CheW051WWquUdpNN+2nO9eJCCVkReKfE+5xOkKDQUBZ
         cclDKZkF5064A4KaWf2DNuZpLE7y7TlG1J0f2PoeNshtnryYxv0rlFHtjxX2q6n6SkbH
         c+XYAbm8btfBCrFE4BgGwiqpKvSe2d5rYDdRjAfLn6mjpJRK/EUc68Ol0+7rm7M76cKw
         ht7tRb1hPjzttEb+corx7yqGLdlI5ouCSp2yZ5Fcv/Q9+O5i0afNmMBybIkEXhEHBVKb
         C84Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQH/JNckreUkuZSvm053vUzjPU/jt/b5Ik1io5rCk1Jje8Suj8JHZkdy4CD5bk5RNIfwCbSf79eWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXxGgVrU+e6NfdlJoUqc0Md1vNIdZ9FmGLXo3Hmy8Ews7EqNq
	XJWLNquJAdyHthhrqM7a369B4R56b6JEIKqS+32b/De9jlPEjpEMFmGkkE12BA65Wuo=
X-Gm-Gg: ASbGncuXcde4Ub9AIGGrGzkKgq6K1C6xvA9F3da658g7uUEYXQqrvDQrQiZtV/emIiu
	S3nsIjnR3dwX6Txyz9fF/A0RSwjDMGYTeJRzedQ22NqBGzArGit96AdDF6617lSheVBIGuPYvRx
	/5Jvf8gDi6t2NvbjBwFKYmGT7lmjNlreI6lKOSMgLgwZ832OJT1FVvul+MBVPa8/2PYS9wpHzcV
	7RLPu+Dl+gNZXSdHOpEGDKAYfagvDcN1UVelNMyktNKhh/i8K5GEcymZy+eFrc3lCkrSPxXm8VC
	eyxG1HhCPehRtUaSeHhlW8ibbsFGf/fCN7XH0Ey+eNZbPwvSOfUCUsRtRpvDIywFNaHFab1Weau
	I6qwTlz+3VyIt+QpdH5jPnAO1zR+of46bEEftSiiqQg==
X-Google-Smtp-Source: AGHT+IFRs83sDqTRyEN7DfReHLOYn68Vpzc0LCiQZFoDgh8bJ2M9bgboNPmgbUyMB+oLX7FeYNZzXA==
X-Received: by 2002:a05:620a:1724:b0:7e7:12c1:8f93 with SMTP id af79cd13be357-7e870600b91mr33016285a.63.1755107288221;
        Wed, 13 Aug 2025 10:48:08 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:48:07 -0700 (PDT)
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
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 9/9] crypto: atmel-aes: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:45 +0200
Message-ID: <20250813174720.540015-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
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
2.50.1


