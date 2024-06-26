Return-Path: <linux-i2c+bounces-4356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293C91772B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 06:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A348A1C227C6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 04:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6786F139D1B;
	Wed, 26 Jun 2024 04:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Np4ur2b4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCEF135417
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719375164; cv=none; b=mPTEvkcgVXXwYOPLdKpAxHGoRIBBwi80rfkewMyu2S1iRvEpryY+nKw9Dc7jIvBlaTwxaAktYWXrJp4wu3TjNnrgzVPnnn+jvUlZhQODgLevT2IDKEoNfpsYZkof3Bor+siHl1pF3IfZuhCIfhv7bU0LZzfWrojygNCvMGZ+85Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719375164; c=relaxed/simple;
	bh=DMfHImeVQacrbJLdW9Gm1gJayI0A4oashzejx8lHTUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgluocgNi+X62FPAHHa9fQIEBnfppduDeqS8q+1pCtw8Jyi1GVQMP1PQTQZ3m+siNHO4jZlrd8HNoucsXiTSF/zwNsNnuP0bME03TA/gJknP+eRM/6csKEndfNdSC9hy9DcBNN5XsL/PR2HSeAvvQ8t+dOIsgPSP5g/6Z5GK0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Np4ur2b4; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3A46888405;
	Wed, 26 Jun 2024 06:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719375160;
	bh=3gO1NwHnOedIW6ntjXW2EqQTewKzsrtIp9NJodnbHzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Np4ur2b4Eil5bKxfss60+7udvtyS5P4dtQWe9lubRtVQhpNrioD5s96Qfc2fAaLYB
	 aix/RV4jFq3cxGBKkuFHFvSW9xCB4l2Gw/00oxGqljBlcx8YNzkg3V6xTYoqubWp9s
	 5obEw1eu8lNUu1lKaUp+9kEH0jMK8ybLoswizOiCxmyAEKTtcZl37084B+L3Qdql6b
	 fEIe3E+a6YPB/ggl67xdKEnTXx8As1SrGDln18Fl7wcm5Ntu1HM6hKDtGGkSjHHJeV
	 s1EmoP+yK81Tl0OPMt03Gu+x13dtHOvBa/1G/S1F+BD19RgX2HhlV+agWWg0akAypC
	 8qtGCu+eYEanA==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 2/4] nvmem: Document type attribute
Date: Wed, 26 Jun 2024 06:11:15 +0200
Message-ID: <20240626041214.513242-2-marex@denx.de>
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


