Return-Path: <linux-i2c+bounces-6955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF00C984241
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 11:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82A7A282D77
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C04928370;
	Tue, 24 Sep 2024 09:34:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4AA81ACA
	for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2024 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727170463; cv=none; b=b1++qibnf5NsJKRlfMUMeuE/Y4D/unGm2165nfRyoPoRLusDq5dNokoqLn6n2ym4QxPAXWu+ozTTWfU2/m/IB1t/UOmd3PUq5l1nqw+oE/QiS4AFFg736j4G9BngmmIu1MNfvsQPoqKgmjYsBjd9TL/m7X0/cnKGztntNEu/Gs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727170463; c=relaxed/simple;
	bh=CARFp6th4DbUiUuXwF6L9Sn0d4QvR0it2mvCHoANL24=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aIrsTXnETrdAXlFTAjPVAJ9YaymzUgvYjim6yWLd/wQLL0ZTPUqCvZABlZs5HKlWceSxnsnDPFmkcGYjV/bDLFLXJt0EavJbKKA9YD/p6eRHxr9l2u85rzTUcjKyn+sDkWfDk5TzMhgJ3CwElT/qayIstKP9gQvzzwPlswNmM5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.187.55])
	by laurent.telenet-ops.be with cmsmtp
	id G9aL2D0071C8whw019aLnn; Tue, 24 Sep 2024 11:34:20 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1st1w0-000Shr-1q;
	Tue, 24 Sep 2024 11:34:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1st1w3-0015Xd-Ui;
	Tue, 24 Sep 2024 11:34:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andi Shyti <andi.shyti@kernel.org>,
	Gerhard Engleder <eg@keba.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: I2C_KEBA should depend on KEBA_CP500
Date: Tue, 24 Sep 2024 11:34:18 +0200
Message-Id: <39a6ce50b152c8e435c78825ab56aa714b54fce8.1727170404.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KEBA I2C controller is only present on KEBA PLC devices.  Hence add
a dependency on KEBA_CP500, to prevent asking the user about this driver
when configuring a kernel without KEBA CP500 system FPGA support.

Fixes: c7e08c816cd2fdf8 ("i2c: keba: Add KEBA I2C controller support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0ea437c76167ad2d..229b8166ccc03803 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -782,6 +782,7 @@ config I2C_JZ4780
 config I2C_KEBA
 	tristate "KEBA I2C controller support"
 	depends on HAS_IOMEM
+	depends on KEBA_CP500 || COMPILE_TEST
 	select AUXILIARY_BUS
 	help
 	  This driver supports the I2C controller found in KEBA system FPGA
-- 
2.34.1


