Return-Path: <linux-i2c+bounces-12280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE7AB25263
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD95E5A59A6
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC3C29B796;
	Wed, 13 Aug 2025 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="kFW7/Cap"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ECF63CB
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107274; cv=none; b=RRjK1WqV3h1iKlgTjz+rqkZ0ll2pShSco26BoyYs39XSd7K7wNItfU8oOJsnpeCu+ji+ebAG80t4a131zc5ucXbxVZlwBcg5RE8O0s0toDhmViUv5JyCrEIJfztLMjdj5FIVrV3Xr7meOEFboCAanKp69OiRcCORQf8jbEQmzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107274; c=relaxed/simple;
	bh=/+oZqZHI1h9WgghpCqBvJzy9LGRR42vTOm/KVnlDk38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgsJS6wSxrglLBUqE7dMwBWF91hjER8WI9BDC4Juzxx0Se0z4hkebJ5enUpVaMj7Y+K4FnDgiWkq/tuALOyRBl4t6OTxuURaV4/keTtQk+WePgouIH2jQMWSDvxRTVQ5fUizSN7OOMrnKttB41QUPe7jkelsPrGx0ncsAte/QE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=kFW7/Cap; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e8706491ecso8017885a.2
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107272; x=1755712072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHeBX+bcrAsO9afYXWyPr7+HVV+gOxB4ZyOYt9ZHb8s=;
        b=kFW7/CapgBjqXy0radKy0GWHUNIVOiivw2/rsDNMRsE3FQ8/ZQsZgmwWXPi+eTFNES
         x659WxQMaAe1C6C7XMajkIdnQEU8QWR/cR++KYKluRQxkNqwpR3PxG2WFSLzDsdphcP7
         6jxGxViOSo7w0vwxP3U+GEjPpK1m0NfSD/0huhESrALNBYcLgAmp5DRelfFTwVp4VwsX
         dUsrv6C52NWSNFQjopefpKwbANhUU4nzRUmnyOu0XlmWV6BQYqQGmuYDGwykI3VKOcWU
         uJzqCWcGbGnZQ94hNMtn8+8cetmvqgMPKJEX+yCX4Ftt/SUxA1RFdsbDEklI4ILZ3nQZ
         eP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107272; x=1755712072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHeBX+bcrAsO9afYXWyPr7+HVV+gOxB4ZyOYt9ZHb8s=;
        b=YgJf/Lp46XB+GD7kiSPp0CU/N57/k4+hcHPRkM2kRfq2lfyFRl0iKZrLz1ZRWVNOP0
         0f+EE240oVFpOQQ4pmQub8hV9QaV1ec0ZGoKrHa1jt5mZ7Ejwlfs3apvT3F0dTkI3N8r
         XNGjDKnprBcI6fl+r/9NP/h19wfFKcxjOXDMpHk4MpNIs8eN1ITlXE8ZCiBoxerHM/2L
         q5tSD/EXzA08u1zKBKRDaL+yXg3JqHtHqs7SfwEHpVZCTNphf6Ts8AanXG+7flU79/mx
         n1SOTNN7lTtmSZVaQLwwzRDaSJEHQnUDdbkiq8eiMuh2KC7P1+vhPc70Cj748Im0Vlge
         J9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVZJIAauAOwDcParUgDwp50RtidIWzjYyAlwcmomfqsC6ged/X+/Sz/xMYVCKT3mwipuH9MTkoQS34=@vger.kernel.org
X-Gm-Message-State: AOJu0YydOnTAuq4RM6PzDNEinaXGIAi83HpGQqxR+PgYZOVWPdVN5nfS
	Xf7B84dkgxAr4obLOslOgbAASUFxmqcs23klywp5JYUzOHzaDMX+V6YG1jK0bELl/Is=
X-Gm-Gg: ASbGncujzSG35gxUCBk0qyfDIFtimqzmeL9E6Ff/uiP0SUL1d4tcQGXSMTWnu+rzkM5
	a91DvfmxwDbHuxmcHLSXgbPJUmh2NARori1kH4qUlNm7FobdE0m8Fzz+0GNfzOLBGgF7M3nFrnM
	vii0jZN9R1j4/jxygf1VhDsScUGZhcUc4Fd1MWeY02LQpDr5SvrmJGNe3/pptrR8N3XAYXbtCgv
	ZUQMVrryzMDHZKxS1ZuHYiNi82eEGeOJmCx1UJxmzeOf4B1SfuDF/y7uVR58Xx9SONNvEI0CCDR
	+1PXfo7fkV6+ZaYGtVP44izzbtRaRqL2zGz2ctxT9fL2FU3PGjmbkB4Lq0ZEeowLj93otQ0FulC
	fI0AA3MrFj1p7HaoAU45MhjrO90rorLqfurtNv6n9KGYdGuhTflfyXLaKKWqPQs4=
X-Google-Smtp-Source: AGHT+IFBbRD05COD+4uOC97ucvpHyx0jBQqfnQDIsz8+GmCzNdE1TPU770o9CrOuegUdmCbSDq2ITA==
X-Received: by 2002:a37:f50d:0:b0:7e6:5ef5:c7e4 with SMTP id af79cd13be357-7e8705d2e04mr26126585a.64.1755107272247;
        Wed, 13 Aug 2025 10:47:52 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:51 -0700 (PDT)
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
Subject: [PATCH v9 5/9] tty: serial: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:41 +0200
Message-ID: <20250813174720.540015-6-robert.marko@sartura.hr>
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

LAN969x uses the Atmel USART serial, so make it selectable for
ARCH_MICROCHIP to avoid needing to update depends in future if other
Microchip SoC-s use it as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 44427415a80d..724ad4f3cbee 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
 config SERIAL_ATMEL
 	bool "AT91 on-chip serial port support"
 	depends on COMMON_CLK
-	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	select SERIAL_CORE
 	select SERIAL_MCTRL_GPIO if GPIOLIB
 	select MFD_AT91_USART
-- 
2.50.1


