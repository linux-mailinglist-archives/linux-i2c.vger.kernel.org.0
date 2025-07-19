Return-Path: <linux-i2c+bounces-11976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D75B0B13B
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 20:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8597116B8C0
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 18:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C23F1DE4EC;
	Sat, 19 Jul 2025 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttR2Sja4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170A7770FE;
	Sat, 19 Jul 2025 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752948073; cv=none; b=ky2t1fe0nJ8dICYjlKUMdZZnoPZqXgsdssRnAKS0nMJRKOXLTURIWY/9GGfZSYJP2StfeYrG9PQaI5ZTghe+8/5lPNwIxQSqx+Oodnx513e0vf4Ur9uav4CoUhvNabl/shMYcz+pEggn2hKiWpAJsEbkOQACxW1myaVAhuIO6Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752948073; c=relaxed/simple;
	bh=HYOCknlt6QSfO5Y8i9m9u0HyxIzikj8W6P/6uO5Zguo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=suRlGASUECAhw7DzfYjGTAxx3iATekawJKBxGWv+L7Wo1aqVAXhIIXBysTfHIG/HBgc/9akU8CgIwafZSeM1foL+s8Kj48lWs4npiT41FmI0eRuYjB9QK1iivWVDNXPFVfpoHaG6KjdIiR2d81tzL1acscr6RsizocxRo7CPvSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttR2Sja4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35058C4CEE3;
	Sat, 19 Jul 2025 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752948072;
	bh=HYOCknlt6QSfO5Y8i9m9u0HyxIzikj8W6P/6uO5Zguo=;
	h=From:To:Cc:Subject:Date:From;
	b=ttR2Sja4l4o6ZRDYcb+kg0+LGf49zLJa8t4z6C9m3DI20sY52dbek6qDHhOqQO8TO
	 4vXEX4qSnP4WFFxM+9jkaeW+wW2TIsXFoI3T8n9cGzHZ2oLDlIRpDEppmISX6/z3D3
	 Uq/LlV3FEnTEffVh87OkF+OdE/R00JT5GrdNBpJT9GQK0MT00L45DJ6WEsv/Q8TR+L
	 +HZzOMMduPmchOA1BczZ0nZVprIM/9W7kYS0kziJvX4xWEpLz0xNIu5sBbRmLMJhnr
	 HhmDB++NPKhQH0+AZt8/Fdgn0BdCacuy/8B3rbOtqQXCipkIVRc2TcH9UmAOxNw8C7
	 ezWt03UTZszwA==
From: Hans de Goede <hansg@kernel.org>
To: Wolfram Sang <wsa@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: core: Fix double-free of fwnode in i2c_unregister_device()
Date: Sat, 19 Jul 2025 20:01:04 +0200
Message-ID: <20250719180104.66939-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before commit df6d7277e552 ("i2c: core: Do not dereference fwnode in struct
device"), i2c_unregister_device() only called fwnode_handle_put() on
of_node-s in the form of calling of_node_put(client->dev.of_node).

But after this commit the i2c_client's fwnode now unconditionally gets
fwnode_handle_put() on it.

When the i2c_client has no primary (ACPI / OF) fwnode but it does have
a software fwnode, the software-node will be the primary node and
fwnode_handle_put() will put() it.

But for the software fwnode device_remove_software_node() will also put()
it leading to a double free:

[   82.665598] ------------[ cut here ]------------
[   82.665609] refcount_t: underflow; use-after-free.
[   82.665808] WARNING: CPU: 3 PID: 1502 at lib/refcount.c:28 refcount_warn_saturate+0xba/0x11
...
[   82.666830] RIP: 0010:refcount_warn_saturate+0xba/0x110
...
[   82.666962]  <TASK>
[   82.666971]  i2c_unregister_device+0x60/0x90

Fix this by not calling fwnode_handle_put() when the primary fwnode is
a software-node.

Fixes: df6d7277e552 ("i2c: core: Do not dereference fwnode in struct device")
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/i2c/i2c-core-base.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2ad2b1838f0f..0849aa44952d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1066,7 +1066,13 @@ void i2c_unregister_device(struct i2c_client *client)
 		of_node_clear_flag(to_of_node(fwnode), OF_POPULATED);
 	else if (is_acpi_device_node(fwnode))
 		acpi_device_clear_enumerated(to_acpi_device_node(fwnode));
-	fwnode_handle_put(fwnode);
+
+	/*
+	 * If the primary fwnode is a software node it is free-ed by
+	 * device_remove_software_node() below, avoid double-free.
+	 */
+	if (!is_software_node(fwnode))
+		fwnode_handle_put(fwnode);
 
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
-- 
2.49.0


