Return-Path: <linux-i2c+bounces-9514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 473F4A3DE02
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 16:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6E2517B832
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 15:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EE71FCFDF;
	Thu, 20 Feb 2025 15:12:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D671FCCF8
	for <linux-i2c@vger.kernel.org>; Thu, 20 Feb 2025 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064345; cv=none; b=SpIBjuNpCehflMpeb7I0h7jW863nK/+3ETSRXWDZ9KTOou2Cqzjxqz7ytZy0IAYGCAL8EIToLs6zan6ebP7ariZvemEdp8tPO0tIPnoXOqVuwPom8oHKVc8t5gB+U4IMO6g+nj/MrPg5TZ69hajIZgcyaPCjDu+rHqP6HDdR1Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064345; c=relaxed/simple;
	bh=I2c9D+583DIn0oLjbjCxnIf4feeCVl6vepzjhZLcn1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hC1dYEv5peKqsu4lGJrWd5oiZpHMHJmxG9BTIy5y21+vSCuEZ18imMFGnkZUvzS507vWU7oLhxslBZQsYJshfWAqyVLGTu4Rmfu6vklZz380hElCs53XPt09FSKfCel9z/LetseRVjvYd/CwpGFHDHA4JT6DjoxUQujrz0cMIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b586:2686:e976:446f])
	by michel.telenet-ops.be with cmsmtp
	id FrCD2E00C3dp1uk06rCDv9; Thu, 20 Feb 2025 16:12:14 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tl8DS-0000000BFaC-0dSe;
	Thu, 20 Feb 2025 16:12:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tl8Dl-0000000DLHq-2r2Z;
	Thu, 20 Feb 2025 16:12:13 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Su Hui <suhui@nfschina.com>
Cc: linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: core: Allocate temporary client dynamically
Date: Thu, 20 Feb 2025 16:12:12 +0100
Message-ID: <f9aa39362e918b62aec0567f899b37d8d3c44710.1740064176.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

drivers/i2c/i2c-core-base.c: In function ‘i2c_detect.isra’:
drivers/i2c/i2c-core-base.c:2544:1: warning: the frame size of 1312 bytes is larger than 1024 bytes [-Wframe-larger-than=]
 2544 | }
      | ^

Fix this by allocating the temporary client structure dynamically, as it
is a rather large structure (1216 bytes, depending on kernel config).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Mostly compile-tested, as apparently I have no I2C devices for which
driver->detect and driver->address_list are valid.

Apparently an alternative solution was posted before, but that does not
fully address the potential stack size issue:
"[PATCH] i2c: core: mark i2c_detect_address noinline_for_stack".
https://lore.kernel.org/20250210080217.2772467-1-suhui@nfschina.com
---
 drivers/i2c/i2c-core-base.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 35a221e2c11c1460..7ad1ad5c8c3f5694 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2506,7 +2506,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 {
 	const unsigned short *address_list;
-	struct i2c_client temp_client;
+	struct i2c_client *temp_client;
 	int i, err = 0;
 
 	address_list = driver->address_list;
@@ -2527,19 +2527,24 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 		return 0;
 
 	/* Set up a temporary client to help detect callback */
-	memset(&temp_client, 0, sizeof(temp_client));
-	temp_client.adapter = adapter;
+	temp_client = kzalloc(sizeof(*temp_client), GFP_KERNEL);
+	if (!temp_client)
+		return -ENOMEM;
+
+	temp_client->adapter = adapter;
 
 	for (i = 0; address_list[i] != I2C_CLIENT_END; i += 1) {
 		dev_dbg(&adapter->dev,
 			"found normal entry for adapter %d, addr 0x%02x\n",
 			i2c_adapter_id(adapter), address_list[i]);
-		temp_client.addr = address_list[i];
-		err = i2c_detect_address(&temp_client, driver);
+		temp_client->addr = address_list[i];
+		err = i2c_detect_address(temp_client, driver);
 		if (unlikely(err))
 			break;
 	}
 
+	kfree(temp_client);
+
 	return err;
 }
 
-- 
2.43.0


