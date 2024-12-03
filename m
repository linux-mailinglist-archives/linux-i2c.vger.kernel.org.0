Return-Path: <linux-i2c+bounces-8313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2A9E28A5
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 18:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73441B873C8
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 16:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1F41F76D1;
	Tue,  3 Dec 2024 16:19:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC691AB6C9
	for <linux-i2c@vger.kernel.org>; Tue,  3 Dec 2024 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242798; cv=none; b=rYUR/oB/j9x9vITlUP0VHYbf35td2h2Y/MPTAJq6qa4jNxzzBRqyP51tJLkhfBHdSpxhat0ulb5FDbym8jDF50s4AaXkbWsGwci6Yieuc2YwmGCGdUUE+tbJlDaXtkiHhKs6hHAfd2OrBX5f/OIdE8sLkpAk0L+X6hYNFrnjJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242798; c=relaxed/simple;
	bh=d4Ens6M9dMP9bcv8CHfdc8+0vTooRlgILJ8tKqtDRFU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TdWuuBTODlrqnT/nlOasgbhYOhrrwytXd+7V6i9mMeB6QDzaspWU+WTUxLbEN3azUqwSFDAEYIHTch3k5Z9dGjDSOhzO4csAIKt8DTxBN7Fbvn8njtodXUNYWNqgNiyWykC9XkaZd1Q6LUgpJAl7dF/GfkFV26e6xjmgrcKDYys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:829d:a1e7:5b32:5d8e])
	by xavier.telenet-ops.be with cmsmtp
	id kGKr2D00H3sLyzB01GKrsB; Tue, 03 Dec 2024 17:19:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVct-000DPE-E8;
	Tue, 03 Dec 2024 17:19:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVct-00ALAU-8p;
	Tue, 03 Dec 2024 17:19:51 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andi Shyti <andi.shyti@kernel.org>,
	Anand Gore <anand.gore@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	William Zhang <william.zhang@broadcom.com>
Cc: linux-i2c@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: I2C_BRCMSTB should not default to y when compile-testing
Date: Tue,  3 Dec 2024 17:19:50 +0100
Message-Id: <36b2923241f285595f43bb9565da352fd366c63e.1733242595.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merely enabling compile-testing should not enable additional
functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index f0ea6245f7d03eaa..4c9b193381288fc5 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -503,7 +503,7 @@ config I2C_BRCMSTB
 	tristate "BRCM Settop/DSL I2C controller"
 	depends on ARCH_BCM2835 || ARCH_BCMBCA || ARCH_BRCMSTB || \
 		   BMIPS_GENERIC || COMPILE_TEST
-	default y
+	default ARCH_BCM2835 || ARCH_BCMBCA || ARCH_BRCMSTB || BMIPS_GENERIC
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C interface on the Broadcom Settop/DSL SoCs.
-- 
2.34.1


