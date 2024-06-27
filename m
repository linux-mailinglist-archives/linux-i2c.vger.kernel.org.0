Return-Path: <linux-i2c+bounces-4427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD6791B2E0
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 01:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62CC91F21CFF
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 23:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7599F1A2FCE;
	Thu, 27 Jun 2024 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="HMtzoUpa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E281A2C37
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 23:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719531488; cv=none; b=I3hpIsDVa/f4Trtikq0GDLc79Bc7GRS9h9tJy3IUHbgVfyVmiwkYpcmyqpKaO7BhVKi82kBGWWJzBcD38uZiphmu52QnA8Hde6PLT2Cvys9jS+Ua5PhsFqTYjRY2G9mVYumP0B/RnhBvh5PMxwkpwWh8eSKenEWA+2ic5tQK1bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719531488; c=relaxed/simple;
	bh=sPPwy3OgS712MWOelTtBU0u/uD3t5IE0yF+6lI+vVds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l8MjzSidZHGta8FGluR5P8VOGHoZnxO7LAjBn8HVGbCXXvS7Wb8Z6Zy3wR/dhPcivlAQ7nPnY4MErsDj3PKXelzRYiL4F+uQ/qBizMB4e6fcW6Toncqy668oKknqO3YKdavYeImrdo7FLR+N4jom1Mcl2FiiJYGSVtZWHtZs6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=HMtzoUpa; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6648187E13;
	Fri, 28 Jun 2024 01:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719531484;
	bh=Jr1/Dj09BEovlWD7SzHWkk8M/JwtroHdbzcKrK0kBCc=;
	h=From:To:Cc:Subject:Date:From;
	b=HMtzoUpa4d1ev9hD7O2bYR+LIGTDwzRLujdG3mkJWrVZnQ0lhOPfEqukKHwdlObju
	 mFBuZ2f5o65axeBk1HKbLrjf6DLayvltduKxO0AfDRbvFB8TICYe9cn5VKjWQbt6XP
	 V4LnqfSq6uF/tMug7/DCHGE8/SmAla7R60D+bbPCJGlz648HewDu1s+8ueaLcdK/2J
	 WgmUtMU6VoFje8vZqbmuWHAN7QDDZoAzPJsOFG7x9zOadxKkhxwiemdDkXw3OxEtoP
	 70sIxcZyQcmO4/HzdureeWJ+N92pkViwR5J4z0Rg+Jhbnp2DmQAJIlaAACJctHvtU3
	 HVH/sTiG1qX2A==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 1/4] nvmem: Replace spaces with tab in documentation
Date: Fri, 28 Jun 2024 01:37:27 +0200
Message-ID: <20240627233747.82341-1-marex@denx.de>
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
V3: - No change
V4: - No change
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


