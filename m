Return-Path: <linux-i2c+bounces-7222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72095990D26
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 21:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289951F21B39
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 19:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A99A2225A9;
	Fri,  4 Oct 2024 18:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZrXGLA7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7E204F9E;
	Fri,  4 Oct 2024 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066349; cv=none; b=Lb1yMVLXiDTKorbA8wcs8cnTIto6/Jy7ZLCblfZXDpIXNDlDmWu/aRxEP34C/bIwgVKRD3Bq61KrmVLoT1eh2VaH0WOPjdsYqhipCr0A9H4K2ZDcxtM51Qa1FBMhq5F8Ep51oi/rnMjmvnMvqUnkUmt4NV+P7iiFAGeWagSp/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066349; c=relaxed/simple;
	bh=mNT5AmqUXN8RYS/x0dKziW21l8m/WeydPaXpGOQsp7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MqubqXJNB5p4vsEkMl5z+4bnn6/YDULjnGz3SIJ1s2VeRI7DvYPQtMuhWqaQW98NWdgtgmVl8LtzYWH9F53EiBQ2IXv7yaTZAEpfW3mHwEBpTH7EsWTqNomgY6mqvnWpyJqO6qCSREbNjwT71o/s+p/wX81E+zn1DJDHfhqmH6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZrXGLA7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD91C4AF0F;
	Fri,  4 Oct 2024 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066348;
	bh=mNT5AmqUXN8RYS/x0dKziW21l8m/WeydPaXpGOQsp7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pZrXGLA78C+aOYbS+0r1FmJ02dEDtGoAfx4S3+E0MJn+DOzul8yaP5pjEhspVdjOT
	 233/OR71poGCeKVCs+QTv1b95i8WC8Cr02NuvTdLsrBGDn189jFOlwCsTGTwho7/v8
	 ezmBRgR31Ox1zvmZaXV51gDyPorjmoD+YgY31QqhtD3IWqCADnQO9jNL0dvXord9+C
	 KrT+43/DZzrq7wzKXg/+KjLhMt9gFZVb7dELjNOSApEdKU7TctIof91igWSpxjyFrR
	 /XTqXgwAQvstolWfOmooJQ4xWPKHwNsrQA6AptXWu+18OhzhzudxniKTMo61BgwJSl
	 E5pJntXQgpPfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jdelvare@suse.com,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 25/58] i2c: i801: Use a different adapter-name for IDF adapters
Date: Fri,  4 Oct 2024 14:23:58 -0400
Message-ID: <20241004182503.3672477-25-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182503.3672477-1-sashal@kernel.org>
References: <20241004182503.3672477-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.54
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 43457ada98c824f310adb7bd96bd5f2fcd9a3279 ]

On chipsets with a second 'Integrated Device Function' SMBus controller use
a different adapter-name for the second IDF adapter.

This allows platform glue code which is looking for the primary i801
adapter to manually instantiate i2c_clients on to differentiate
between the 2.

This allows such code to find the primary i801 adapter by name, without
needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.

Reviewed-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-i801.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 3410add34aad2..2b8bcd121ffa5 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1754,8 +1754,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	i801_add_tco(priv);
 
+	/*
+	 * adapter.name is used by platform code to find the main I801 adapter
+	 * to instantiante i2c_clients, do not change.
+	 */
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
-		"SMBus I801 adapter at %04lx", priv->smba);
+		 "SMBus %s adapter at %04lx",
+		 (priv->features & FEATURE_IDF) ? "I801 IDF" : "I801",
+		 priv->smba);
+
 	err = i2c_add_adapter(&priv->adapter);
 	if (err) {
 		platform_device_unregister(priv->tco_pdev);
-- 
2.43.0


