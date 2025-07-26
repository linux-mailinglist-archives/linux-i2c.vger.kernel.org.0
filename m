Return-Path: <linux-i2c+bounces-12044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A26B12CED
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 00:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4039C7A4178
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jul 2025 22:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D872248A8;
	Sat, 26 Jul 2025 22:10:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED01DE885;
	Sat, 26 Jul 2025 22:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753567805; cv=none; b=PbjBUie/fPNcKfWPBilriex+2JALkkvFUdQFD/95W8lkfp6R3aTi5mK+stTMvyEZfP6VNPLOJ4baw/il2pfMEjovtOz5kiNqqqmFab9Ri1kAWr07QdDpxTYr3/61MGVKYYT7P90NJoZ+7UzYtl+8a4fuVoOm4TXlXdCMUhd9fIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753567805; c=relaxed/simple;
	bh=tfMdw1gdoi09NgjImSJjFAETuUgIgCg47WnxPv1FxUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aYoW2vuRQdoU/3AD5GyFSykOX6zu0E25+qVItItv0yjk6wucNHD0RqyIYRrRwnwPBIeJeGoX8HlzJ+Ve5rZ1qduHhr61vR5+kaO4zm4e37nXFYYw47wlfrfD6t3J+SrLsrf7vzBgOKntqlfjrmbNge0B7E6GN3kEOE5MmYYojEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a02:8084:255b:aa00:f281:d82b:fca1:5bb3])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id A05644006C;
	Sat, 26 Jul 2025 22:10:00 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a02:8084:255b:aa00:f281:d82b:fca1:5bb3) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: Rishi Gupta <gupt21@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com,
	Arnaud Lecomte <contact@arnaud-lcm.com>
Subject: [PATCH] hid: fix I2C read buffer overflow in raw_event() for mcp2221
Date: Sat, 26 Jul 2025 23:09:31 +0100
Message-ID: <20250726220931.7126-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175356780125.29756.14907190966280097588@Plesk>
X-PPP-Vhost: arnaud-lcm.com

As reported by syzbot, mcp2221_raw_event lacked
validation of incoming I2C read data sizes, risking buffer
overflows in mcp->rxbuf during multi-part transfers.
As highlighted in the DS20005565B spec, p44, we have:
"The number of read-back data bytes to follow in this packet:
from 0 to a maximum of 60 bytes of read-back bytes."
This patch enforces we don't exceed this limit.

Reported-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
Tested-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
 drivers/hid/hid-mcp2221.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0f93c22a479f..83941b916cd6 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -814,6 +814,10 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 			}
 			if (data[2] == MCP2221_I2C_READ_COMPL ||
 			    data[2] == MCP2221_I2C_READ_PARTIAL) {
+				if (!mcp->rxbuf || mcp->rxbuf_idx < 0 || data[3] > 60) {
+					mcp->status = -EINVAL;
+					break;
+				}
 				buf = mcp->rxbuf;
 				memcpy(&buf[mcp->rxbuf_idx], &data[4], data[3]);
 				mcp->rxbuf_idx = mcp->rxbuf_idx + data[3];
-- 
2.43.0


