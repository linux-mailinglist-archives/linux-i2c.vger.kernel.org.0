Return-Path: <linux-i2c+bounces-6831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD897B353
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 19:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D521C23DCF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 17:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C7F18B47C;
	Tue, 17 Sep 2024 17:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fdYmEkTm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53017BEDB;
	Tue, 17 Sep 2024 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726592469; cv=none; b=kDEcfK1eXNK1dWp5YYj8BXl6+OcozMt0YeIJsjJ+AcZwZfzZGHX4Au5njKGpmQo2ATuhY7DPsIXySDiGjmeF8HAcwp4SC6CNMN0prXUT3PCkvBL3eQJ9+HsFstptAEbKdx4nH+jc66LCoDsTkDAxtHgy1Ssqm09O/PJjPdkMzug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726592469; c=relaxed/simple;
	bh=jvbcCJBr52FpyfBIzVczon1Y5B3UNMHZEqplRqigoKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDnWQ/vQnGoJ291LpERNa0bGtwLYAZ5w6MxyMJ/qFUbU0TC8FIuVbG89NkgpxwGpgpzktSfupnZnLQvStGwqH5zl6Bx0PYhaBEPpyOhX1QalZvRFGozTKgUgVEWvm6pYnJKDSO3bXJ6BBrDokBQwbGOkXv2mAfkMx42OGLo0VGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fdYmEkTm; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77891FF806;
	Tue, 17 Sep 2024 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726592459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/hSb2bZCJGX1P0YzRSMvwqgG2+dprUxtsLtf7xEdZk=;
	b=fdYmEkTmSpt+G7KEK2Jm5TSA95M0WqEDCpUzyCQ/5yDv2kkktQJfuQ2W1nDh8AB6k0JZQC
	HS1j7quwAJm2R/fAvFPnr8JkP81jpjDtUu36rJT+Nc0blGKecFpisUIFg/m5TpqQzq9kK9
	mchmy2BZXPQPRuNmgzIng0p2XnL0LdzOktFTVKVO0wHXWY6MQQrRfCMTJw6zS6ORUmokDu
	FUNPKRv3l/yNJ9XVr6hbHB8n/wAeEn+ggl2ujY6WHjgYSenPbDkTac8GkoNR5YKNMiGYpe
	Cha2bqxLVlJp4MGfV66IjNB6FpBRoeXwYQLnF4P4bTYB+eS3kSSxyg2Uy9iSJw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 17 Sep 2024 19:00:51 +0200
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for Congatec Board
 Controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-congatec-board-controller-v2-5-681511a01c8f@bootlin.com>
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Add the Congatec Board Controller drivers and header as Maintained by
myself.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc40a9d9b8cd..63c61ecf9e0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5653,6 +5653,15 @@ F:	fs/configfs/
 F:	include/linux/configfs.h
 F:	samples/configfs/
 
+CONGATEC BOARD CONTROLLER MFD DRIVER
+M:	Thomas Richard <thomas.richard@bootlin.com>
+S:	Maintained
+F:	drivers/gpio/gpio-cgbc.c
+F:	drivers/i2c/busses/i2c-cgbc.c
+F:	drivers/mfd/cgbc-core.c
+F:	drivers/watchdog/cgbc_wdt.c
+F:	include/linux/mfd/cgbc.h
+
 CONSOLE SUBSYSTEM
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 S:	Supported

-- 
2.39.5


