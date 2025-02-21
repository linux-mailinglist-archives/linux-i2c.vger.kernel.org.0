Return-Path: <linux-i2c+bounces-9527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C27A4016C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 21:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2982786153C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 20:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29A5253B5C;
	Fri, 21 Feb 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaGt9YzS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6B1253331;
	Fri, 21 Feb 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171295; cv=none; b=mZc7ZcX8xYpxHq45XEyZHZwj/dqW24jQF0WSevOULUBtib8gOn+1fG/D9zanaVVYvzOAP7K3h4EloFgqigV3U3mR04IfNSm7mVQsbPguGUkcF1FKRkeR4jIVja8kMH505kJFJt2NdqCiv/6GJ3kiRN3zsknGyRisYapMNc9U4Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171295; c=relaxed/simple;
	bh=VqPotNG6jzN72uWOItX4umtJnJFt39l5Jl5Tg3Bf9U4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L9uKBwrrFbJM0Dsn6Nd3nuGC85pi7tjLJ0jzdtfarwStYu4Tr+kzlC4ODOgc7cJvPxDQm/ulIji5KyupmMZevbpjhWIZ+Oy7qXWzNRJ9OkiW+Gi/0DfKxGekFWHd5PpCAFpmV0zTC1wW7UqRset6nREeZqK7O0yoRtTgjAQV4Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaGt9YzS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03572C4CED6;
	Fri, 21 Feb 2025 20:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740171295;
	bh=VqPotNG6jzN72uWOItX4umtJnJFt39l5Jl5Tg3Bf9U4=;
	h=From:To:Cc:Subject:Date:From;
	b=AaGt9YzSn7SP3ng/pejxFlvQfas3s0G1+E6QUMcgk0WDMdeBUE7ce2NOfs3BKkWkS
	 0+cUGIQk0R3lSxhT9GUHguxNisGkX4oiGdzM2VYtO8WeEgenmWKsNRWMJAn2umVXoW
	 +VF9X9NujTQhXPE+jeF5gG4HYThSNPNVH08yxkmO2Xoh9MoXqqBcltuRhO8+RlPeyR
	 0rAANQVunxE3TWF2qGno0EsMofLYoD9BJCjhWWcFLI1BsEHRlwpetb9Eypbm3YVMT2
	 540+NyySFHEfB/2Co6qxn8b36gitsx1kxduTeowLJD1rXwgDmoe2s0sn5pnZail2kZ
	 1D2/EvauTyqIA==
From: Arnd Bergmann <arnd@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "i2c: core: Allocate temp client on the stack in i2c_detect"
Date: Fri, 21 Feb 2025 21:54:40 +0100
Message-Id: <20250221205449.3838714-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

struct i2c_client is way too large to be put on the kernel stack, and depending
on the kernel configuration, this can exceed the compile-time warning limit:

drivers/i2c/i2c-core-base.c:1420:12: error: stack frame size (1040) exceeds limit (1024) in 'i2c_do_add_adapter' [-Werror,-Wframe-larger-than]
 1420 | static int i2c_do_add_adapter(struct i2c_driver *driver,
      |            ^

The current version is the result of a cleanup patch that does not appear
to be a requirement for anything else, so address the problem through a
simple revert.

Fixes: 735668f8e5c9 ("i2c: core: Allocate temp client on the stack in i2c_detect")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/i2c-core-base.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 35a221e2c11c..5c9419e95044 100644
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
@@ -2527,19 +2527,22 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 		return 0;
 
 	/* Set up a temporary client to help detect callback */
-	memset(&temp_client, 0, sizeof(temp_client));
-	temp_client.adapter = adapter;
+	temp_client = kzalloc(sizeof(struct i2c_client), GFP_KERNEL);
+	if (!temp_client)
+		return -ENOMEM;
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
 	return err;
 }
 
-- 
2.39.5


