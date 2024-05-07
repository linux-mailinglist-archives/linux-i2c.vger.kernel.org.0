Return-Path: <linux-i2c+bounces-3460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5358BF01C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 00:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A80111F239CD
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 22:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E35E84E18;
	Tue,  7 May 2024 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3eVclrG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B868884E0D;
	Tue,  7 May 2024 22:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715122660; cv=none; b=Ba+sxi//bkFEDBiKPCYlGN8P8GMO73DJOFUc3sfEOx8PyCZYYx3r2EH331P/cxwA87bORDKD3VmhcizQ0AaYqgMy/I6L+p6odf8DxougwgnJg2+Bl3bRiqIyLa4b8xTR041rWB8kAbYZKnayY6b4WCPOinCjpirzWrN7gKqMZ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715122660; c=relaxed/simple;
	bh=srp+0voWpZpnFxnV8w6Oid1p/ImC/tZG1yH9vsuUfAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ooZGKaRYVFHMqeXGvS7LrC5J30b4qiMBFcQVoI1nl9MKihE7xc4kr7o0CY7xdq/BhATUHS3P53HSJlCtL1tKnyvVqV36ArslJzPGlD5u6wkluzpotMirqnQaK8DulgrFM67NQ7ppwaqbTriiQFkR5KDNJQrZLBwhtyE178F27pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3eVclrG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532F2C3277B;
	Tue,  7 May 2024 22:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715122660;
	bh=srp+0voWpZpnFxnV8w6Oid1p/ImC/tZG1yH9vsuUfAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T3eVclrGmJRkdjvDHUoj67vcA+lwC2gvQmu107n4A0ohYlW+JMw8eYA9tF8OdtyZw
	 Gejg9RNNuwAPkCua4FoPFD7edbBJo2saCdAAR6Vq+piYjR7gc7UmBwLRymlxJfDLKm
	 whG/UamcMKZ8UlkAyYYfQ3XkDU0fxQ7J53IQvBbEVNw7tFtDgjoXEmgawnHv7scMuj
	 LM2NFPjcVNJtWPvzg9lPTNECjTOwAVkj46fhPzXROUgtKZIgQOrEkzxvg9ik/2m+bB
	 wmV95B6mYmGn3sdhIoTW1ooo0+LNvv/SjqmtNB3HhX1PF2TUu1eE+j0iSzdqRYsHAv
	 lLvPoS8W9YfOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	gupt21@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 07/23] HID: mcp-2221: cancel delayed_work only when CONFIG_IIO is enabled
Date: Tue,  7 May 2024 18:56:33 -0400
Message-ID: <20240507225725.390306-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507225725.390306-1-sashal@kernel.org>
References: <20240507225725.390306-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
Content-Transfer-Encoding: 8bit

From: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>

[ Upstream commit 3cba9cfcc1520a2307a29f6fab887bcfc121c417 ]

If the device is unplugged and CONFIG_IIO is not supported, this will
result in a warning message at kernel/workqueue.

Only cancel delayed work in mcp2221_remove(), when CONFIG_IIO is enabled.

Signed-off-by: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-mcp2221.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index f9cceaeffd081..da5ea5a23b087 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -944,9 +944,11 @@ static void mcp2221_hid_unregister(void *ptr)
 /* This is needed to be sure hid_hw_stop() isn't called twice by the subsystem */
 static void mcp2221_remove(struct hid_device *hdev)
 {
+#if IS_REACHABLE(CONFIG_IIO)
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
 	cancel_delayed_work_sync(&mcp->init_work);
+#endif
 }
 
 #if IS_REACHABLE(CONFIG_IIO)
-- 
2.43.0


