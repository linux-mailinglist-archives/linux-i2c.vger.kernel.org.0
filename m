Return-Path: <linux-i2c+bounces-10076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6265A7782A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 11:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8570716B1E2
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 09:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A1E1EF39F;
	Tue,  1 Apr 2025 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="DsAJ08YI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from forward203a.mail.yandex.net (forward203a.mail.yandex.net [178.154.239.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107251EBA08;
	Tue,  1 Apr 2025 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501102; cv=none; b=jHig9i+7uXyxsj2NGqdOnaz39wDsehGVz9XXcxCG20shq73aqayMLBVW2V88r8dPSPbmB4NAJv0zelEPd8S1uy4sBICxQSpbwXQadfOi+YvaKZzMC3s5QmufgfyACE2xOiYUhgOFr+t+0QE/6VLh1oq1HtwVMlbUNzTdzF+cVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501102; c=relaxed/simple;
	bh=9oElyV9diyT6UtDkNT9r9IuGjmpF0oRUKUrRx68NNnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=linVVlHoNEvJm8A3szmVmHjTFkOjtoxXwcZ4MT8kHmSnzDmOhaIU+rMyRX2bMZB65MEpWJQnHhKwtloSXuqHhj1k6qcU3KdyQt+DshKSo75K4KyzALq8E6mxObDvjaaQNeU6v4fl8JtHGy/TVVFKzp94cfWbqfa+g3GwMylCVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=DsAJ08YI; arc=none smtp.client-ip=178.154.239.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward203a.mail.yandex.net (Yandex) with ESMTPS id 2029265AD9;
	Tue,  1 Apr 2025 12:48:14 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:6100:0:640:f888:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 061EC60E26;
	Tue,  1 Apr 2025 12:48:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3mSPBN0LjiE0-OJ0SsBLL;
	Tue, 01 Apr 2025 12:48:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1743500885; bh=hQ+lFy4tyS21KRRYFD5T13q7+AM2thXzEE8iO94oHas=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=DsAJ08YIH5tLB6+KBUOqtUKTjkVJ75VI0ZRrTPAv81J12fSy9sH4z36T9vR2PeKvJ
	 EmXw4iIsa2GyhxlB/OHnu71eeMOTIJq78hxPmkDsaMhXZSPkgOWyrd42VgySWjHyuP
	 556qAK5Qjb/UvVqNkEfmjVQ004Lp4+XDRd5nFv3o=
Authentication-Results: mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Mikhail Lobanov <m.lobanov@rosa.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mikhail Lobanov <m.lobanov@rosa.ru>,
	Rishi Gupta <gupt21@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
	Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH 5.10/5.15/6.1] HID: mcp2221: Set driver data before I2C adapter add
Date: Tue,  1 Apr 2025 12:47:50 +0300
Message-ID: <20250401094752.8324-1-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hamish Martin <hamish.martin@alliedtelesis.co.nz>

commit f2d4a5834638bbc967371b9168c0b481519f7c5e upstream.

The process of adding an I2C adapter can invoke I2C accesses on that new
adapter (see i2c_detect()).

Ensure we have set the adapter's driver data to avoid null pointer
dereferences in the xfer functions during the adapter add.

This has been noted in the past and the same fix proposed but not
completed. See:
https://lore.kernel.org/lkml/ef597e73-ed71-168e-52af-0d19b03734ac@vigem.de/

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
[Mikhail Lobanov: older kernels use i2c_add_adapter() instead of
devm_i2c_add_adapter().
This problem manifests itself in stable kernel branches:
https://syzkaller.appspot.com/bug?extid=40dc62a33c759a65ad44,
https://syzkaller.appspot.com/bug?extid=24b122f8e84c3f9d9d1d]
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 560eeec4035a..b0dc0edc69c2 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -879,12 +879,12 @@ static int mcp2221_probe(struct hid_device *hdev,
 	snprintf(mcp->adapter.name, sizeof(mcp->adapter.name),
 			"MCP2221 usb-i2c bridge");
 
+	i2c_set_adapdata(&mcp->adapter, mcp);
 	ret = i2c_add_adapter(&mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
 		goto err_i2c;
 	}
-	i2c_set_adapdata(&mcp->adapter, mcp);
 
 	/* Setup GPIO chip */
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
-- 
2.47.2


