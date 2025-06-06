Return-Path: <linux-i2c+bounces-11260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F43ACFDD3
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 09:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 744D23A92A1
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 07:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357B7284692;
	Fri,  6 Jun 2025 07:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="hdXx0MfO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0BE7FD;
	Fri,  6 Jun 2025 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196634; cv=none; b=QYikJYX0XLX3vFcUWmuAArQF+23Ucn64QtEHnGd4tllWGzENx2VNhhO1EVqu0dsKH09zfiEjCcId/Fp6KslDG01/SrdMQN83EwKy50HIHjeT2cgeVis2NcwD8yVNfaLNiOxAUQERPLFaZU12W4JQnnBrbH0XKhhigsD7/fetlpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196634; c=relaxed/simple;
	bh=AablxqS96EKY6hLe5XBgRspufEk8p62UI0YJE8xG/3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qjj4BUT8FH8cc0uBQg4DYrCsNk5mVf9Eaji47xEu7J71O2LOIdtPTtzzZZ3+4dngNJEvA2a6GtU/X6E4UC+V6DzOqAzqhL6M3JwPIpvzJqL49KCls2GpNDXj7bje8JNXe7QklFRy3E/ZZwdIqocUfoPJYiKRAcfZBsX2aYkg5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=hdXx0MfO; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=b3CYqum0N4pbjpCcD8KmyOO/zd8vAZE75mM7w5K6QWM=; t=1749196632; x=1750406232; 
	b=hdXx0MfO9Wun+p0ifrDWLTekYWmE2T+ppHCpLke3DCvFyAE9gw5I+rRn3gp7HBLr8SLZYm2Oakw
	3cjFtsgfSUkLVTqhcPzWB9OCp0BQQZ30qX+/E/ns+Vnd866F/cv1HW5So7SuSuM+XA8JNJAUaY/Hs
	NLqLjaZK9N8cQTUHbCcVKCHw1leAe9b6SRcngTa/rFvD4FGgPy0a0xto4R+5/OMmJSvLfKokObQ/A
	uYb1rpCv033XoXO5eM1E7cDC9/XRRLKpc57IlP/zgrhmng42rnXAnmz16CJFG/UD5AEnSVQPB6Hvc
	ljohPtHZUdxX6zml8eubfbNOC9TKZrzUG8CA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uNRwr-00000007KbM-0k6A;
	Fri, 06 Jun 2025 09:57:09 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drivers: i2c: Geode ACCESS.bus depends on HAS_IOPORT
Date: Fri,  6 Jun 2025 09:56:52 +0200
Message-ID: <20250606075651.10883-2-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Johannes Berg <johannes.berg@intel.com>

It already depends on X86_32, but that's also set for ARCH=um.
Recent changes made UML no longer have IO port access since
it's not needed, but this driver uses it. Build it only for
HAS_IOPORT. This is pretty much the same as depending on X86,
but on the off-chance that HAS_IOPORT will ever be optional
on x86 HAS_IOPORT is the real prerequisite.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 48c5ab832009..0a4ecccd1851 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1530,7 +1530,7 @@ config I2C_XGENE_SLIMPRO
 
 config SCx200_ACB
 	tristate "Geode ACCESS.bus support"
-	depends on X86_32 && PCI
+	depends on X86_32 && PCI && HAS_IOPORT
 	help
 	  Enable the use of the ACCESS.bus controllers on the Geode SCx200 and
 	  SC1100 processors and the CS5535 and CS5536 Geode companion devices.
-- 
2.49.0


