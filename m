Return-Path: <linux-i2c+bounces-4426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8991B2DF
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 01:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88341C2229F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 23:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596B01A2FCB;
	Thu, 27 Jun 2024 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MpCylN/L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFDF199E93
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 23:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719531488; cv=none; b=GQDm1KIfyaPnhvttSdQdweIASAwkFFCh95W55KVHFxZTHuOM9v4u0+xXOOSJbSqs4wQy9EmouuEbN//Z5+6qpnTmGI/gnqi1M7nQkWNV+Z37QJ92A8Kb4Dx9LOyqfV/ZAZZGrZfuvX6+YZFICG+Tt8tjvKJQIWGFM72Psp0Cok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719531488; c=relaxed/simple;
	bh=9K90ZzJ/N4giFuPOWS6D+T2pwBx80OAaZvgQ9BWojYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dec3gviCPagLfB85oPaIOPt4B4PAuw5VxTfZ2lNEICHLdhJ2JVYlJ+3Yn7ycPUFszgCYBGhLwJwJvGVF8S70jLV0iuM/KJRKB6jtHAxwKZBJrmSWGnBam0RX5h8oZkYpB8koFB+u6OjDFgNN/w+UcyZrC9X2ha5zNWUyzX7CJl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MpCylN/L; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C5FE78852A;
	Fri, 28 Jun 2024 01:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719531485;
	bh=Lv6J3oXBcYwk3Ox2MW9pBVAGdddaz2nr8GFbIwGmPmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MpCylN/LI+4RnxSJU8kFbLIE0ve/tYT7dBRylG275y1LOwyJtACfTvG9qHDIg31dF
	 Nol1Uv26N7Xg8r8kR517BRNVeg9TLUZ5Hak8gTmBcV9NexEjT/EVdtFc3jQVZ6syuw
	 ZpPzdkK+MquUx+T3cM0RAAapp4QEziHExM3Ar0GJNeyVA0ZN5YnKRa5Hqu7o8rg+Z9
	 5sXmPQOvQSiAuY5Iqy9thpb2nhhEVGFGujwufoL1tvvwt7jBLe42qC/ggIdpzD6cT7
	 Ys2bH7bRq8DL3oMVZA2WY4oCKgUnRi7ySADceFhUsKafrZnfX3DfZGFNETwzxFm1IZ
	 xhLbcmrjbBJbw==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 2/4] nvmem: Document type attribute
Date: Fri, 28 Jun 2024 01:37:28 +0200
Message-ID: <20240627233747.82341-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627233747.82341-1-marex@denx.de>
References: <20240627233747.82341-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Document a type attribute used by userspace to discern different types of
NVMEM devices. The implementation is already present, the ABI document is
missing, add it.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
V3: - Add RB from Alexandre
    - Add trailing full stop to the paragraph
V4: - No change
---
 Documentation/ABI/stable/sysfs-bus-nvmem | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
index 854bd11d72ac4..3f0a95250aa84 100644
--- a/Documentation/ABI/stable/sysfs-bus-nvmem
+++ b/Documentation/ABI/stable/sysfs-bus-nvmem
@@ -20,3 +20,14 @@ Description:
 		  ...
 		  *
 		  0001000
+
+What:		/sys/bus/nvmem/devices/.../type
+Date:		November 2018
+KernelVersion:	5.0
+Contact:	Alexandre Belloni <alexandre.belloni@bootlin.com>
+Description:
+		This read-only attribute allows user to read the NVMEM
+		device type. Supported types are "Unknown", "EEPROM",
+		"OTP", "Battery backed", "FRAM".
+		Note: This file is only present if CONFIG_NVMEM_SYSFS
+		is enabled.
-- 
2.43.0


