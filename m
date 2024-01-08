Return-Path: <linux-i2c+bounces-1211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7F82712F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 15:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F447B22571
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 14:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E214652A;
	Mon,  8 Jan 2024 14:24:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D4F405C7
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jan 2024 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d323:2fd4:4f64:e281])
	by baptiste.telenet-ops.be with bizsmtp
	id YEQN2B00A0Qz0eJ01EQNLQ; Mon, 08 Jan 2024 15:24:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rMqXV-00EtGp-5h;
	Mon, 08 Jan 2024 15:24:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rMqYA-00D2AC-Ad;
	Mon, 08 Jan 2024 15:24:22 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4
Date: Mon,  8 Jan 2024 15:24:20 +0100
Message-Id: <bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, all Kconfig symbols for R-Car Gen4 SoCs select
ARCH_RCAR_GEN3, which might confuse the casual reader.  Prepare for the
advent of ARCH_RCAR_GEN4 by extending the dependency for auto-selecting
reset controller support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 819fd76545d99d1f..71ff107e82a009fc 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1242,7 +1242,7 @@ config I2C_RCAR
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select I2C_SLAVE
 	select I2C_SMBUS
-	select RESET_CONTROLLER if ARCH_RCAR_GEN3
+	select RESET_CONTROLLER if ARCH_RCAR_GEN3 || ARCH_RCAR_GEN4
 	help
 	  If you say yes to this option, support will be included for the
 	  R-Car I2C controller.
-- 
2.34.1


