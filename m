Return-Path: <linux-i2c+bounces-4996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB7293237F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 11:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 951551F23AF6
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 09:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA849197A99;
	Tue, 16 Jul 2024 09:57:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6618428389
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jul 2024 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721123856; cv=none; b=nxw5Or2KbB4JkrUs/WnLD3WTZARvf5u03XhZ8y67c1w91rOK8H8QmshZQ5KfEmGqDVgcW/EHMic1Wl0VasHbU7XtHx5/xuWL9C0TgL+r2My5tnAfmf1N9B5IS4ZHp0skP4+3yDGaUe6+MioXri8AWwSpfaU5cxvGWWmhTYQnVoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721123856; c=relaxed/simple;
	bh=/43xVFD4NDO5K4C9sRHg+k+Ro3VTB259VkrF2BUl7ck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yi8rdBLtZ2tRqTSGM9Uwml25ctNASx3PJIAgqz9pU4wKjyoGuWICKY/aF89OzTVjoCSk03yq9xkxlBGigJXf1pKalgXjg8zyrUK/FqqfQ+ndvK9TzAJLspCKoMljkttQvsVrkzEJ8WYwWI95lIj6BddNVr3tPEskIwLmbTWJzWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:dd46:82df:8d7c:6f14])
	by baptiste.telenet-ops.be with bizsmtp
	id o9xT2C00E2v92cJ019xTrH; Tue, 16 Jul 2024 11:57:27 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sTevn-002LHZ-Iu;
	Tue, 16 Jul 2024 11:57:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sTew3-00F4UD-7T;
	Tue, 16 Jul 2024 11:57:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of/platform: Fix inverted check in of_platform_notify()
Date: Tue, 16 Jul 2024 11:57:25 +0200
Message-Id: <a9ada686e1f1c6f496e423deaf108f1bcfd94d7d.1721123679.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for of_node_check_flag() was accidentally inverted, causing
i2c-demux-pinctrl to fail on the Koelsch development board:

    i2c-demux-pinctrl i2c-mux1: failed to setup demux-adapter 0 (-19)
    i2c-demux-pinctrl i2c-mux2: failed to setup demux-adapter 0 (-19)
    i2c-demux-pinctrl i2c-mux3: failed to setup demux-adapter 0 (-19)
    i2c-demux-pinctrl i2c-mux2: Failed to create device link (0x180) with e6ef0000.video
    i2c-demux-pinctrl i2c-mux2: Failed to create device link (0x180) with e6ef1000.video
    i2c-demux-pinctrl i2c-mux2: Failed to create device link (0x180) with hdmi-in
    i2c-demux-pinctrl i2c-mux2: Failed to create device link (0x180) with hdmi-out

and anything relying on I2C connected to these muxes fails, too.

Also, loading the 25LC040 DT overlay on Ebisu using the out-of-tree
of-configfs now fails, too.

Fixes: 98290f295fbcf18f ("of/platform: Allow overlays to create platform devices from the root node")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index bda6da866cc8f8f6..86be4dfb9323d8fc 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -739,7 +739,7 @@ static int of_platform_notify(struct notifier_block *nb,
 		parent = rd->dn->parent;
 		/* verify that the parent is a bus (or the root node) */
 		if (!of_node_is_root(parent) &&
-		    of_node_check_flag(parent, OF_POPULATED_BUS))
+		    !of_node_check_flag(parent, OF_POPULATED_BUS))
 			return NOTIFY_OK;	/* not for us */
 
 		/* already populated? (driver using of_populate manually) */
-- 
2.34.1


