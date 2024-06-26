Return-Path: <linux-i2c+bounces-4357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC6691772D
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 06:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11239B237F7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 04:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67227139D10;
	Wed, 26 Jun 2024 04:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="GxeILalo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3E21369A8
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719375164; cv=none; b=HSspFW2RY8j95mkLosmXNoXHvyVRSg3QVhq7wWPc5/jViUCRwJb/Xe2xhte+2QkD4gDL35CaDu2beLLVp2uD6cZx5y3mbrAZppXYpyNH+UHdOPnvsPZLjE401RMgDExpHrqNjv975AeuzmzQ8IrkJkUNl9p4YIMx/p5vgRSNx94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719375164; c=relaxed/simple;
	bh=Yc8bhzuTh5dhrTwhgguiLNMs+Z0G0L2JfjVeDqybMLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+E+LBk+ztDUHeTTfh+peXJdoiFj0c0t+4IyiauyrPKoFHDxr4V6pkCUw5J5KHFkATr0qca1Feou83rBzkBK5hj07gI0dRQOZzEgAD1JPo6gfcvmlIAv7DT1FTKWksFL4VakzQCCnXHTjj/6VAlk3QMMk29AYAiEQfa9//jRCZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=GxeILalo; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8A5738843A;
	Wed, 26 Jun 2024 06:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719375160;
	bh=MqJJiK5ZcpTj6ohr4IvakBBTXdeJGhI3BdkcN6YPFyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GxeILalo1Jf+o9BPB20z1P2/q7OYXdUgzhNwTFhfuo8RlOWUZRA2R6TgvzMdNhK9f
	 m3z5FoiCtYLKYo7w3Yp1diO+FnK+zdcjcel1Qfb67WZKd5Dt2K1HDb8PnKnfiQJAi8
	 QqXD/Njd0/1Y1n95Hg1nG8n89jD4yMWNGypAKQqdKY3u6GZz49KI0TYXe6NTG4Ufiq
	 n48IqnNztlLg1yq8QRTGuxMUKsQmfh6cVovuxTiANkN7IuNhRhjKir0aa7SQxBb3N4
	 JuIyLQz5D32J/hTjnDrQoKA5Y8h5xjfAd+z9ltIYyJkNdBTI9GkSv7Fegp5L9FglCK
	 EzJ78Zl5NCY+g==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/4] nvmem: Use sysfs_emit() for type attribute
Date: Wed, 26 Jun 2024 06:11:16 +0200
Message-ID: <20240626041214.513242-3-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626041214.513242-1-marex@denx.de>
References: <20240626041214.513242-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Use sysfs_emit() instead of sprintf() to follow best practice per
Documentation/filesystems/sysfs.rst
"
show() should only use sysfs_emit()...
"

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
V3: - No change
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index a31ea4275d5ae..5b3606114628b 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -179,7 +179,7 @@ static ssize_t type_show(struct device *dev,
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
-	return sprintf(buf, "%s\n", nvmem_type_str[nvmem->type]);
+	return sysfs_emit(buf, "%s\n", nvmem_type_str[nvmem->type]);
 }
 
 static DEVICE_ATTR_RO(type);
-- 
2.43.0


