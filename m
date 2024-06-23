Return-Path: <linux-i2c+bounces-4272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED06D91377E
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 05:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F5721C20F54
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 03:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5411FDDCB;
	Sun, 23 Jun 2024 03:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="g50AiUx2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECDFD268
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 03:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719112719; cv=none; b=ixiCuRtBtY2lsx/gVAHaZWSVKypEhqA7WPaslGUvP26KTdZSFVs9RCLRODIbcyOpG4oEJR+VzVHmC8/r5A6P86gNq7xzmNv2KURd6V7PC0+bRFhZQMOkx+3yoiJOSlpoPz7QkPh41rBInrSSBFe7dRVAJkNyceioSxL5UJdYswc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719112719; c=relaxed/simple;
	bh=gADv2+Pyee86Nh3L0QY5TGM8W96BrhLANeNaDNj6ULY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMzMZ0L/JzZ8yFLiEoWHPPKiqOCF8uLjwfPdE6hYTueiXHdwQQ7g4rDloT5gmqV0pczL4zgZ4Ya2MtE7DuNFe/a57u+Gx61VF17vPQUsy99bJSlwVO41l3GSCGQCW55lulDrT1QSd7cEnq/10IFLCv28hOfvKwUqQDUpX3D0jxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=g50AiUx2; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 88E1187572;
	Sun, 23 Jun 2024 05:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719112709;
	bh=NAb9lbBPTrKgT+x8KnblGvszN5C3f+goUvG/SFIzZjk=;
	h=From:To:Cc:Subject:Date:From;
	b=g50AiUx2kfjf7FjgnNqWSER1Joa2WUZx72KbfiRuxnFMzVU/AuCewF8fKFkOVQ3Bo
	 TcOEoIOSvV1tIX3O8c6LUfvfmTOWzNOojecWCuhiPby6ooMB9b9eB4X6Az06P/1uIT
	 6TFyZGGwCf5GgcTIGvmd5WykOJRgfG15xycoWf4Wprknx6sTE2Gai50MtMjOCfl4cM
	 /7jy6BubjOiHQ46hRGPJJNRveUOGQDdy46XnHI4LLYFzzgXPWoVZahSj/gSAnjRJgI
	 kqQheA6gLnm5dilDjkQoI8U3gfHaEzx+dXBpjY3bAg56aelJNeXJFWTeqbyIXd4uS9
	 Pg2QybEosokBQ==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/4] nvmem: Replace spaces with tab in documentation
Date: Sun, 23 Jun 2024 05:15:44 +0200
Message-ID: <20240623031752.353818-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Replace two spaces with tab in the sysfs attribute documentation.
No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-i2c@vger.kernel.org
---
V2: - New patch
---
 Documentation/ABI/stable/sysfs-bus-nvmem | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
index c399323f37de3..854bd11d72ac4 100644
--- a/Documentation/ABI/stable/sysfs-bus-nvmem
+++ b/Documentation/ABI/stable/sysfs-bus-nvmem
@@ -1,6 +1,6 @@
 What:		/sys/bus/nvmem/devices/.../nvmem
 Date:		July 2015
-KernelVersion:  4.2
+KernelVersion:	4.2
 Contact:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 Description:
 		This file allows user to read/write the raw NVMEM contents.
-- 
2.43.0


