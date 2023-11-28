Return-Path: <linux-i2c+bounces-519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD637FC6E5
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 22:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E6521C215C6
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 21:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F2042A97;
	Tue, 28 Nov 2023 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTHEKupm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BFD44367;
	Tue, 28 Nov 2023 21:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D3CC433C8;
	Tue, 28 Nov 2023 21:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205634;
	bh=IVw3bUqj96xvMhDrvVTGpuXVF4X6lVujV/9OUJK9BNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cTHEKupmG7Q9tJP8bIE3KCijOkIcZIMe5HV9l7fnG9UFD5ZZAojr8eB1oYUtf108l
	 8bTZVISWXDik00Gp+l2yBZUFkSE02ll2Un0Dei15js1fyQDboAgMeuTXAWEYGR4Ezb
	 l9AuREuY2mue/s7jn9AcpveU2LW2x7kW0oyUUAtakXQlRTUjgUvP+SyBxmUE86q35h
	 YtS51qxz3xNTXaMlf54QcB7ddTpnt5MBlL6zUmNP4ION9QiOVew0Shxt2f8Ngh/oHa
	 0zP7KylIFTreWGjVlanrZTFOsnY0Kc6Rlwk1zQcQ8DefHA2Q6MecgwutEQf8uYnYkb
	 ZUFcAOsRpKSqA==
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
Subject: [PATCH AUTOSEL 6.6 24/40] HID: mcp2221: Set driver data before I2C adapter add
Date: Tue, 28 Nov 2023 16:05:30 -0500
Message-ID: <20231128210615.875085-24-sashal@kernel.org>
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

[ Upstream commit f2d4a5834638bbc967371b9168c0b481519f7c5e ]

The process of adding an I2C adapter can invoke I2C accesses on that new
adapter (see i2c_detect()).

Ensure we have set the adapter's driver data to avoid null pointer
dereferences in the xfer functions during the adapter add.

This has been noted in the past and the same fix proposed but not
completed. See:
https://lore.kernel.org/lkml/ef597e73-ed71-168e-52af-0d19b03734ac@vigem.de/

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 72883e0ce7575..b95f31cf0fa21 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1157,12 +1157,12 @@ static int mcp2221_probe(struct hid_device *hdev,
 	snprintf(mcp->adapter.name, sizeof(mcp->adapter.name),
 			"MCP2221 usb-i2c bridge");
 
+	i2c_set_adapdata(&mcp->adapter, mcp);
 	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
 		return ret;
 	}
-	i2c_set_adapdata(&mcp->adapter, mcp);
 
 #if IS_REACHABLE(CONFIG_GPIOLIB)
 	/* Setup GPIO chip */
-- 
2.42.0


