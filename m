Return-Path: <linux-i2c+bounces-13175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC86BA1621
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 22:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A645560D04
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 20:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2446731DD94;
	Thu, 25 Sep 2025 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="br5NT4Ck"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43D830AAC2
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832835; cv=none; b=sd2ZD54qTkPbv/TeCaou0ngY5tOZks/fIRTvSbLk1Th7wJr2H5qBBWZvNGWYRE6BC12ZjIUWOTVlaC465GS+uvgUqX7dq3u42CTBoIoGBQOZLvRdwne/LAm5sUWOVRywn/YIjr2hJ8Wk04EdTTZqtRxyZHlzaUAojM+fBrUWziU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832835; c=relaxed/simple;
	bh=oOrPzewUgGSIG7BowTof3CeH9wpPdwr1yhnqvTNMeYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lqu51Sc3yE2K9YuuGqU7Lxe3hXvpoIZ3V0Q+HFTvROFczbYiEp8rqZ2EdwVlMXhdxtAcsa3431YqVJ9DT9LCVRbTQJBitDHpi7KJa/ZWKO8Wgzk3EwyY42DFQe7qpF4zGw3HPeATD2EnOVJIK1NsIc9bw5cAMcS0HslsA08Pl28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=br5NT4Ck; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=oM24zHBEYcVgNW
	x/7st09U6usDBZ3Rg00l2srltEU4I=; b=br5NT4Ckrg/iYUjTF9cLWLrfYVh/ts
	HRT2IIkxsyKwvlDl7yfIJKyXTiIQlIi9N8GQm8rNkmJi5WWv3yo2Lv54i4mgYjVG
	33s+nejRdjub9XtwZZIHnsDMGW8hNcZiCpwcWTlqBNFSaF5azX0NrtRWM2sFy9eN
	mXDidwWevvEf9dddYI0d+HZ2YBd9CG9dwL9xIg46eqIldEbC1JyGk/rWSUe1Y0Me
	sflIUBCUiRj8GLbcujFSjkCRwl5eq7FzjGhtFdfr6ns83PI4G6chPXI1mkLhOdUb
	QUDgk4XRMc7XmsBjj2XfiqDz0OW10OLEa1k5qTTrNmwbhGG63CJbwFxw==
Received: (qmail 2010658 invoked from network); 25 Sep 2025 22:40:30 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 22:40:30 +0200
X-UD-Smtp-Session: l3s3148p1@wqURLqY/pKUujntx
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] MAINTAINERS: delete email for Tharun Kumar P
Date: Thu, 25 Sep 2025 22:39:44 +0200
Message-ID: <20250925204020.4544-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The email address bounced. I couldn't find a newer one in recent git history,
so delete this email entry.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..71ec2bfdcb7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16661,7 +16661,6 @@ F:	drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
 F:	drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
 
 MICROCHIP PCI1XXXX I2C DRIVER
-M:	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
 M:	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
 M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
 L:	linux-i2c@vger.kernel.org
@@ -16670,7 +16669,6 @@ F:	drivers/i2c/busses/i2c-mchp-pci1xxxx.c
 
 MICROCHIP PCIe UART DRIVER
 M:	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
-M:	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
 L:	linux-serial@vger.kernel.org
 S:	Maintained
 F:	drivers/tty/serial/8250/8250_pci1xxxx.c
-- 
2.47.2


