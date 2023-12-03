Return-Path: <linux-i2c+bounces-583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D9380211B
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 06:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1291C1F21014
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 05:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2D710F5;
	Sun,  3 Dec 2023 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XvUNJYkq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 54FE0FA;
	Sat,  2 Dec 2023 21:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ahHhTIoYSuW4oEicRP
	fZHV0EEIBQvulbWrXXGWxCOmM=; b=XvUNJYkqX6ES1MpGQU5tjupJCMhggBgbx9
	JsJ844kAK5zlGURHSsHHO2wkH2EssxUt4n1uJvUcYEa7TW3f7BPvg07JuinM6XVJ
	cyukBIGDrZlB0oei2XvKNq+MIGEw/Wa35Qzu/k753g9njzuMFde2HxQ3UCepH50+
	Z5r5U/FOs=
Received: from localhost.localdomain (unknown [39.144.190.5])
	by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wDH11fPEmxlBd11CA--.4371S2;
	Sun, 03 Dec 2023 13:32:00 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [i2c] robotfuzz-osif: Add error handling for i2c_add_adapter in osif_probe
Date: Sat,  2 Dec 2023 21:31:42 -0800
Message-Id: <20231203053142.37453-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDH11fPEmxlBd11CA--.4371S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4xuryfGFy8AF1DJw1fJFb_yoW8Aw43pw
	4DKw4DCryUXwna93ZrJa18XryY93yrGFW7CF9rCws3Zan8JFyqqrWftFyS9a48GrZ7Za13
	Xryqv347CF1UAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zifWr_UUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiwhA7glc668iM4AAAsJ
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

This patch introduces error handling for the i2c_add_adapter. This missing
error handling was identified through static analysis, revealing that the
function did not properly address potential failures of i2c_add_adapter.
Previously, such a failure could result in incomplete initialization of
the I2C adapter, leading to erratic behavior.

Although the error addressed by this patch may not occur in the current
environment, I still suggest implementing these error handling routines
if the function is not highly time-sensitive. As the environment evolves
or the code gets reused in different contexts, there's a possibility that
these errors might occur. In case you find this addition unnecessary, I
completely understand and respect your perspective. My intention was to
enhance the robustness of the code, but I acknowledge that practical
considerations and current functionality might not warrant this change
at this point.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/i2c/busses/i2c-robotfuzz-osif.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-robotfuzz-osif.c b/drivers/i2c/busses/i2c-robotfuzz-osif.c
index 66dfa211e736..0f4d84449050 100644
--- a/drivers/i2c/busses/i2c-robotfuzz-osif.c
+++ b/drivers/i2c/busses/i2c-robotfuzz-osif.c
@@ -161,7 +161,12 @@ static int osif_probe(struct usb_interface *interface,
 		return ret;
 	}
 
-	i2c_add_adapter(&(priv->adapter));
+	ret = i2c_add_adapter(&(priv->adapter));
+	if (ret) {
+		dev_err(&interface->dev, "i2c_add_adapter failed: %d\n", ret);
+		usb_put_dev(priv->usb_dev);
+		return ret;
+	}
 
 	version = le16_to_cpu(priv->usb_dev->descriptor.bcdDevice);
 	dev_info(&interface->dev,
-- 
2.17.1


