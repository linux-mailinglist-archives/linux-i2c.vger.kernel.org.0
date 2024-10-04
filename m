Return-Path: <linux-i2c+bounces-7225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF5990E97
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 21:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F9D1F22DA5
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 19:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620C71DF98F;
	Fri,  4 Oct 2024 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUKY2H5p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5102281F7;
	Fri,  4 Oct 2024 18:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066635; cv=none; b=G7RaEGB0m8OY9u+ocS7bJzPfJmb6U2rFzVOLpvHyrnh8E1KM6S/qPSrspSk2Yld0QgsXfL07v1/FYbexalXyAjKH1+DHruOU90fI4u+rDZNuvFWQZ1Ku2AGW7wtDBEduNyL4fG4p1TJlckYp81uhLiXvSMA39SrlcLMLCmehwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066635; c=relaxed/simple;
	bh=EbEDNMe/ud2NSQzYnDYrrl5nw2Ikp6ze+E7G5ly5UlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVHt3v+8DAwwVHRp5i3XRf+MehKSCjknLquPJk3hEbO5Tux8/rugFYAMJ8bIpQC5SEdsEdn6CtIPBH9QO1O/VjzmSy8EcuLDOgOmHaQ0BtEWFLx8HeujTzlV0oKZiy3TgftBXRLe7CQTozpmuNYnb04buO8mmEIJQll42mf7mvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUKY2H5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E948C4CECC;
	Fri,  4 Oct 2024 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066634;
	bh=EbEDNMe/ud2NSQzYnDYrrl5nw2Ikp6ze+E7G5ly5UlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUKY2H5pZMq8ym7kTajOWgWbdLJRqE/LJcqqxotm8oZrAL6khu6Q6BWU0WekaN2KJ
	 K+MMyD9/Ox1fYI9NaIvskDZ5IgC9C/Y5ax5EV4mj+bmSFtklpKRzkq0qUFK5OXnskb
	 OXLbYD4mGU0aL/ERHChkuXwZj/QsbGjtXaP9fKQxaGt09pl8w0OEzFr6EMqs5Z8wTI
	 Ws0gXLUGTPhP4tjmfOtqUZHpMnR6MAFxn6KkUJx1kGVvRa3G5mxY3EBnrEe0gYmtwX
	 jE0iO7ZuemfVHrZiA3DSbtND7cveGiDzLJrC2KMt83Wf1fa6uGATcwqguPns7fsIHC
	 480ZUn1LkcviQ==
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
Subject: [PATCH AUTOSEL 5.10 15/26] i2c: i801: Use a different adapter-name for IDF adapters
Date: Fri,  4 Oct 2024 14:29:41 -0400
Message-ID: <20241004183005.3675332-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183005.3675332-1-sashal@kernel.org>
References: <20241004183005.3675332-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.226
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
index 4baa9bce02b67..3d5ef84482b25 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1895,8 +1895,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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


