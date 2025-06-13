Return-Path: <linux-i2c+bounces-11419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DC2AD8AD9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F4CA18990E7
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDA22E6115;
	Fri, 13 Jun 2025 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="kp5alJbw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01602E0B69
	for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814927; cv=none; b=bzjEJyi2LEJpAtVhRhHsYFcDO+ewvO+WT8G72Mt88eGVlyHcjvu0A7nCFM6fOXtDR0WsGDJDQY2lMqpb2DThBkjIjCU+JEiwd96fW7mSeY8NqVjpMFIgTYTsBWL85t+Xm5T9CZHGw9fEPD0xVsWWmOXl1LJlGcL5XdBcpdH0TIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814927; c=relaxed/simple;
	bh=N9EwmincliKfa+Mj4InfAX1k9UEb+FroSKDS7Tw5blg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIz5KzFIV5/8KN18cWVaC10j5dHxGCXPwzca+fP8qugADRTIETjfPfvTVVnC6WRC+PiV8/E96IZg0eKtTQmRpWb1dkgMvpUbZuKigEhESfvUl7Nb0VvJg3EuQfaTHrGhqQ+VgAc926PHj+uIM2rySD+qinC78S9JL4Ur0y36tgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=kp5alJbw; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so27752386d6.3
        for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 04:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814925; x=1750419725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHtJLyTMYIFfJmuax7k6vu5lhjJG1PUEv0OdzzE0zPY=;
        b=kp5alJbw1ibON2Dab5a6SrDZ9iCGZ2Nf4bdRShSDrKmBRO1Km4Dd2GxERRY+45VY1+
         zASnCdxWsMjIn0EUNnZdr8j4CzO6PltJ/5KiboftiDD5mJFbXKUVEyeBpJ3U53rLRuwL
         tKsDfzynZly/EIZNa5TEXqbuNq8WZ6QtbjqXY46PKTmtPIYUcWv1iRv6QsA2iRZH4zDE
         9EXyH8bQqKY6DUaPRbEVSjmLz3ecH+i1KPXVBSgC43g9xH/X11ySjzt+SkgdLaUgnMrS
         a9QzkEJ3LZYUi24ZEESfHFEFwDrHwYaRnYVedGQgFvust4DNvenZrcd0zqnPka31K20z
         ws7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814925; x=1750419725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHtJLyTMYIFfJmuax7k6vu5lhjJG1PUEv0OdzzE0zPY=;
        b=OmQDa4MPC9UclZqtNIpAgoapLMi1pf1iRAwJDRDEiadwYbdq8RCjkez4+IFRSz4n1r
         cVA/O1wxeSsxmisKTlwtv9+YDl6jvOdJ1Ai/qtT9N0UvzwMa3DL797MjrX0QUQy4agt4
         gpgrdgi1p+1xjV4mPSLe6Gm9uwwIkLecZ0yaPiUXav/9GZgdyMojDqt6Gx9QDHjfqEZV
         yYbsiI4DyRPe5cU8gXRfAkioC9lJAVBpmG0Gjd/7ljOmUIgKfxWBMgPlcWIgFVx4cPP2
         jrB62MP4pWtM9rfipNr/MmzvGBNyF5itZYUujlmjneOTpT0SnYIsGHjP5cz2JHdhwDHz
         YYmA==
X-Forwarded-Encrypted: i=1; AJvYcCXS0ZmZeLQbVGzwb53fx3UUtdQ7X2mu0GL1p0ky4Zbo+GnH/qJ9zbnsqfeB72Qke7szTP7IJ2+vkh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvRx1uUxKhH1AJ0cDrtdFFH/XwCmr0NxuQRyX4Q8aFNH3/3JnD
	XUXgC3wFtBuXtcVaxcmB9/vclOxOBzigoQv4+w0Y0ODGyiFsouu6fu9FqNJogIGaGvQ=
X-Gm-Gg: ASbGncu5CNZQG46aX0KR8LNW2+ZYmCB/smZfg/6mzeyb4f6MZN1G7OeRFD8/mAMqwHp
	kjA1jt3ytBNz8woGRP6dFZMtW9gAfvDZ7/L+8srDaIsw8Mcikvnup+9wmZVMNs26hUKro1hUog+
	cBIytQ/Wx++Hv0AHUqy+1mTw2YD43frPzpJC8n1nlwy6aX4H4YcJU25tO48YomqDUK5fMmHnO4B
	Yhv+JjVBKKWoz/e/hRIeJh5ySlkLom2RXL/AStOY9K7jfWJyvGr+hJ50IDmOyYySKizRyMGVv1N
	wSo2roJ5sUta7oqYU80ME8MEpt8KYeELYEsacs/vMNYgnQ/l12WRTbGW74SZ8OGNEaBOtLkMlsh
	2KLUQlfUIrl0FYPa5Hv5aBA==
X-Google-Smtp-Source: AGHT+IFEhBGPIDsjq1frk0/wn96Fw6QfUCgUoIMTWna+hcxXY+/S62LesfKCTPJGDYw7KyfEPMYp/w==
X-Received: by 2002:ad4:5dc5:0:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6fb3e596a01mr39443246d6.5.1749814924913;
        Fri, 13 Jun 2025 04:42:04 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:04 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 3/6] i2c: at91: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:38 +0200
Message-ID: <20250613114148.1943267-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the AT91 TWI I2C, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 48c5ab832009..ba8c75e3b83f 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -414,7 +414,7 @@ config I2C_ASPEED
 
 config I2C_AT91
 	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  This supports the use of the I2C interface on Atmel AT91
 	  processors.
-- 
2.49.0


