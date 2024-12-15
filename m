Return-Path: <linux-i2c+bounces-8510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637539F242C
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2024 14:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2A227A0755
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2024 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE75D17BB32;
	Sun, 15 Dec 2024 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CPN+Ln97"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6081D696;
	Sun, 15 Dec 2024 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734268911; cv=none; b=jR0Xu9R4NTJ0tW7mKSjXCJN7dvCGSBYQBElK9fCDcJF3eMkOurSZwHXdPf/Qeoez0HAECVnd0KN2P6IIWKaw0wYu3hwmckLnuzwL10tb/4JT7qy+D65PAlYCvHei9PyWhHijeSN3ISRB+AZ9DOANyZoZ9ltHTWvEo8rvW3r7cP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734268911; c=relaxed/simple;
	bh=X40eubVdy4mQlXirykWJUNGB6+3vxY3Hi28rLTPMjnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=paD1obRp92OBcSxMfMfIUZ4Dto+yFxxlr1+QQowUn8Ktty3rep0P4vUoJbjvINccjtLf2hycGV4zFLIZwO8gRCGXnFQDzKLhu6TWVb9Io79OnGvQ6F5ZvE+WEhwdB8WhQBzMCSXP/TT3SZg72+7ozvfqzDkzkYrRaXbLZdl2Los=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CPN+Ln97; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734268904;
	bh=X40eubVdy4mQlXirykWJUNGB6+3vxY3Hi28rLTPMjnU=;
	h=From:Date:Subject:To:Cc:From;
	b=CPN+Ln97X5Ur2rptGfxbJb8LrQfbnsu10ZcxCRTKI6g9DhV7/iG/2oXgTs0amcCPr
	 1KW0/LD988aSRkdxDb4yTbBSycX6YQBfsSH7Bb0o672y5XfHyoKkeXLWDNjduaivGJ
	 a09mwaJKJYUEt7dpuX1Rj1xVml6uueH4DbYHmYJ0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 15 Dec 2024 14:21:39 +0100
Subject: [PATCH] i2c: slave-eeprom: Constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241215-sysfs-const-bin_attr-i2c-v1-1-d5c336c02924@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAOLXXmcC/x3MQQqAIBBA0avErBtIUaiuEhFpY83GwpEoorsnL
 d/i/weEEpNAXz2Q6GThPRaougK/zXEl5KUYdKON0sqi3BIE/R4lo+M4zTknZO3RBuWcN22wXQM
 lPxIFvv71ML7vB95R4XdqAAAA
X-Change-ID: 20241215-sysfs-const-bin_attr-i2c-5f1bbc48f590
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734268903; l=2065;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=X40eubVdy4mQlXirykWJUNGB6+3vxY3Hi28rLTPMjnU=;
 b=aDi2OKS8HsKoklEdcl8K9mpjTApHOiKY4d166+McJfYBUPWDyTIaR7GHa6vup1t0p3e5022EL
 NPpG/R+LyuEBT18zEQ+1qBlYvuKrEfElNRBqhwfF7zgEpG/fwfwUZOc
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/i2c/i2c-slave-eeprom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 5946c0d0aef991aaa280a2df1d74d8a2ef09120f..275d1d0e910fbec72c4795cb3aafa714c52fcd94 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -91,7 +91,7 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 }
 
 static ssize_t i2c_slave_eeprom_bin_read(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *attr, char *buf, loff_t off, size_t count)
+		const struct bin_attribute *attr, char *buf, loff_t off, size_t count)
 {
 	struct eeprom_data *eeprom;
 	unsigned long flags;
@@ -106,7 +106,7 @@ static ssize_t i2c_slave_eeprom_bin_read(struct file *filp, struct kobject *kobj
 }
 
 static ssize_t i2c_slave_eeprom_bin_write(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *attr, char *buf, loff_t off, size_t count)
+		const struct bin_attribute *attr, char *buf, loff_t off, size_t count)
 {
 	struct eeprom_data *eeprom;
 	unsigned long flags;
@@ -165,8 +165,8 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client)
 	sysfs_bin_attr_init(&eeprom->bin);
 	eeprom->bin.attr.name = "slave-eeprom";
 	eeprom->bin.attr.mode = S_IRUSR | S_IWUSR;
-	eeprom->bin.read = i2c_slave_eeprom_bin_read;
-	eeprom->bin.write = i2c_slave_eeprom_bin_write;
+	eeprom->bin.read_new = i2c_slave_eeprom_bin_read;
+	eeprom->bin.write_new = i2c_slave_eeprom_bin_write;
 	eeprom->bin.size = size;
 
 	ret = sysfs_create_bin_file(&client->dev.kobj, &eeprom->bin);

---
base-commit: 2d8308bf5b67dff50262d8a9260a50113b3628c6
change-id: 20241215-sysfs-const-bin_attr-i2c-5f1bbc48f590

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


