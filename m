Return-Path: <linux-i2c+bounces-520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7D7FC6E6
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 22:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE5852868AD
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 21:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D79442ABB;
	Tue, 28 Nov 2023 21:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sm8v9YS9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC30844367;
	Tue, 28 Nov 2023 21:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA200C433CB;
	Tue, 28 Nov 2023 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205635;
	bh=P2uQ5/4CmM9CK+imh/1k1oIXYXrTVS9ToOqdCaQdvL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sm8v9YS9PDTmIbAlp6TXINicYiBKVn9YQBz+bDkpYs8OBvVl4tpi4HdK5kKRRF44U
	 PAOyJ1oAv6gYP/sovQUelVIzluY8mtSrAB8iwCIYn9fqQt/9/YUV5KaNav6YkygvTW
	 YE3ETncJIuQtHtpt0oF/dSFqH1LEFU7zItt+YEZY6DvnCYPXVXE6k3g+M15pzVnEGC
	 XOtkoCGq3WqKUxGg23HSIB11kCKVjE9Qx/xGrUtQZ/uTWq82gAN1QMwqUFGVBzw3vH
	 oSqIpJGrmkrD2oNuSz+yE3FBAvm8VpbyTlXKcw7L9tgvrvQ9jKDnQYjkz8jJFXRn9A
	 VqWWDo9NcQyFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
	Jiri Kosina <jkosina@suse.cz>,
	Sasha Levin <sashal@kernel.org>,
	gupt21@gmail.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 25/40] HID: mcp2221: Allow IO to start during probe
Date: Tue, 28 Nov 2023 16:05:31 -0500
Message-ID: <20231128210615.875085-25-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210615.875085-1-sashal@kernel.org>
References: <20231128210615.875085-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.3
Content-Transfer-Encoding: 8bit

From: Hamish Martin <hamish.martin@alliedtelesis.co.nz>

[ Upstream commit 73ce9f1f2741a38f5d27393e627702ae2c46e6f2 ]

During the probe we add an I2C adapter and as soon as we add that adapter
it may be used for a transfer (e.g via the code in i2cdetect()).
Those transfers are not able to complete and time out. This is because the
HID raw_event callback (mcp2221_raw_event) will not be invoked until the
HID device's 'driver_input_lock' is marked up at the completion of the
probe in hid_device_probe(). This starves the driver of the responses it
is waiting for.
In order to allow the I2C transfers to complete while we are still in the
probe, start the IO once we have completed init of the HID device.

This issue seems to have been seen before and a patch was submitted but
it seems it was never accepted. See:
https://lore.kernel.org/all/20221103222714.21566-3-Enrik.Berkhan@inka.de/

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-mcp2221.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index b95f31cf0fa21..aef0785c91cc2 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1142,6 +1142,8 @@ static int mcp2221_probe(struct hid_device *hdev,
 	if (ret)
 		return ret;
 
+	hid_device_io_start(hdev);
+
 	/* Set I2C bus clock diviser */
 	if (i2c_clk_freq > 400)
 		i2c_clk_freq = 400;
-- 
2.42.0


