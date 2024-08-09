Return-Path: <linux-i2c+bounces-5263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4294D94D2A6
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 16:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75A271C20F0C
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 14:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB1B198E9C;
	Fri,  9 Aug 2024 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e4YddIaj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3E8198848;
	Fri,  9 Aug 2024 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723215168; cv=none; b=GjTv4/313sUQHBBVKw5NFZu/jR4vYxwmYXmOAkZKDvH8314g9AZ8Jyk7C/8iolgfrPnf8w4iJi8y/G8tzfE7Q5aRz0qxF9vTeZLkb+qgQq4GFHMpHHqyqyBHB+Ec6SjzH7N/mC2ObzW1FIaVfuUfY9Yt9yg3rVgrhz9+1jYwqj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723215168; c=relaxed/simple;
	bh=Sw+oLlc7TSxf7TiSdLT9axbvrep8wB4Fgzlbr7MroUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWkpTxu/8CbYHcnQsjmEnjvOdJzqEQpJbibxCHgAebibOR+omw3Af1gwiV3Rg1prgPe6JfflfpQZTb4XViRlBwt3deWQATgYVSqRqgdvSNlYzBVbVSHtD9WQ7GIVjIq/riFeazWFSq5qkPvSJBysokR94cPYlVrHD0dKL9df0gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e4YddIaj; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E61340006;
	Fri,  9 Aug 2024 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723215159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bof5JX2qIGglUu1nJZwnxlc2Jg4ND61QWz8uaqbeqT0=;
	b=e4YddIajyCvvmE4aJz0bnfme8ANROPwDQr+9iFGRe0A24GDNKFZ1rB77DUS8Xd3aTEFi8b
	s4qkeony1oh5VBMDU/eDa2A/CIxW/ssRJfUh4v4IPhMfUAMycNsTCWT/ptSQrATU56KTke
	ttUdKlkW1cbfwIUzF8RPWAP0FO60my2P9dK5xsxJiLnHxI143dgIUhf+bVPY6V+p1Agwu/
	UK+uXPj/6JfIoudYlW7z7hHJDbIgBTiB5cJ+Ftb9D1se9YuyF1LFcdTvSSx88P9CtSQEgW
	yhoPEIalfsiIamkjP5bO6nfJ4MN3ruHwNhtaHlCmosN0AVJSi/53vTDlsHAjsg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 09 Aug 2024 16:52:09 +0200
Subject: [PATCH 5/5] MAINTAINERS: Add entry for Congatec Board Controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-congatec-board-controller-v1-5-fec5236270e7@bootlin.com>
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
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

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..781803bb5d0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5648,6 +5648,15 @@ F:	fs/configfs/
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
2.39.2


