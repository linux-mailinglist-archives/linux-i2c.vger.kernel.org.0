Return-Path: <linux-i2c+bounces-4275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9054E913781
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 05:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9D8283993
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 03:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91221D28D;
	Sun, 23 Jun 2024 03:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="XM970SZ3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED16D271
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 03:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719112721; cv=none; b=DoosyljBxQSTMgsgs5dlCjdddLdAJYm93dCSoUhgqPWE8C8Kx/7cH5f/KYrpqXg7Aht6OB4OUnpu6ZP/NYD+HgjqJHEy5+EhYugh9jsshTHmqOcg8iRo1H0ufcljrcLLzvU78R7InaOxPv2xaX6KBC0qlSm7wMcOqrE5/8JovTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719112721; c=relaxed/simple;
	bh=EgbOmYAXN5AwE+F/UelOlXARvaj+AKD0/h1ATQNNP7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMsMQHBdxCF/wYyQ/nzFcsvqCjfo6lhVTpLWmHb7sRXLB1Hoe+E6AEzAZhD3sYxMIkDKxRc2Zb4fkW8fI5s1Y3BLm6pyDONtUNfzhgZ0ue5tS8H3sF6eKeoMON9GBSsqnpjmdwi658PyRDWGI01JtUnjUScZ9W8gfygk3opIxrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=XM970SZ3; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 31BCB88229;
	Sun, 23 Jun 2024 05:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719112709;
	bh=8wHGO6ZG4/qqez27QNxMNzpGlI1J7OXQC7Ffkuyibso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XM970SZ3vhG+VBRSCucEVweTEr7Pweyvcc7PYOd6l4Lq7kr0W/Gc17pAlcel/eaPA
	 tcmBH0TvU1pUIPTa6d/uNL6DM89LseENL6ShouuxNMd98EF1u0WiVP03l1gZG0iwBr
	 P6IvgELZ7rB06z460zr7yv4area6NPhv/DeNOMKoZc0jMwgjsscr+sXQGxSSKAdjMG
	 Nf14hDSCMPM0do1C2yHkn4/kzdfs7D7QKPiiyABf4avnKHL5MH6LRDhtMJ/PjnT4Ol
	 r/vquKiEc2Eq8RFxSIwUwTYYOVIHa7/pDODNkpvu2NvXjA52msgY9mcDPQrSI55VRA
	 5WQph9TPvtPAg==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/4] nvmem: Document type attribute
Date: Sun, 23 Jun 2024 05:15:45 +0200
Message-ID: <20240623031752.353818-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623031752.353818-1-marex@denx.de>
References: <20240623031752.353818-1-marex@denx.de>
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
 Documentation/ABI/stable/sysfs-bus-nvmem | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
index 854bd11d72ac4..0e3a8492a1082 100644
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
+		is enabled
-- 
2.43.0


