Return-Path: <linux-i2c+bounces-7142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0698BB96
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CF7D282F29
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 11:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB54B1C2451;
	Tue,  1 Oct 2024 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PsfDobaL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872F1C1AD1;
	Tue,  1 Oct 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783651; cv=none; b=bx9PiyUo5M1PddBd8/5/x/10T2BWXGOsJiLu2kE9HQrRvChVoijFbFK+Ag52GatdBnQ++7K0AV25xDXwqs2Sk0LUv4fqOj9FdxvXTQ0lOzPpPTp3YvLUwZb3yosvmlPryQFanYukYp60YUbSVrAwCEY9HpAQ96IplQywYbMTFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783651; c=relaxed/simple;
	bh=AH8jKNrfpB02Bch+UeKQLgAOCwY+kh2jdGOKaLJOh1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cp7O29Y7SxOFzxZAwXZi32RJSueoQeRmjmVRZN3/Yp4XO7cWAZ36Z7cFjE/1ipUZzCtMaVMHyAPWltbwp5vsgTcTXq1gngf4r8qUb9diOL8zyEJ1ARRH2ArHI50I1SbAw6hErvj6mzq9N2VhnaokRPleb4KWfZxyJ6zyj711Txc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PsfDobaL; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 700E84000B;
	Tue,  1 Oct 2024 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727783647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9FquloJFHLrC/bo4utyC5vq8/FwWCs0brZCGadDDad0=;
	b=PsfDobaL7t5juFxjex9Xbqv6A/T0rqECIsSNi+AU3Vyut6R8hlRk6cCwJgK0wAcCAgoTTk
	7c48qwGOnYLdzkVtEWY0sQrLND+tHRPiJ2gQfKtNzVAchdvMf2ZF8f2R+FWE+kAk76SRm3
	Jdkz5pEEwQcmQIrplY+6EfYRvCTAGpYuJhFvdlJlBv2qrVSUPSFp788XlRvIsEuwxDUEUK
	3P1XAEHJQ80GUWdbw8GcFmLLtfLa1S3os0o93oGIIDAuKIXqficEPNeWFaOel4AprXtEWs
	ManH7pIMOuSPfliYC6zhpr3VDyTipjyiw61SGmIyr2arxF3e4fDufP7NIvBIlA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 01 Oct 2024 13:53:31 +0200
Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for Congatec Board
 Controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-congatec-board-controller-v3-5-39ceceed5c47@bootlin.com>
References: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
In-Reply-To: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

Add the Congatec Board Controller drivers and header as Maintained by
myself.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..6f218022bd02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5760,6 +5760,15 @@ F:	fs/configfs/
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


