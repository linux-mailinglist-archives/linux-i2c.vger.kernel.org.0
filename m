Return-Path: <linux-i2c+bounces-7224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA498990F69
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 21:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E230B27EA6
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 19:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812F221FEA6;
	Fri,  4 Oct 2024 18:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otYBoWtk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F871DE3C4;
	Fri,  4 Oct 2024 18:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066568; cv=none; b=d9oDSPZS0lryKSLPnpRvTbdwBlrBPKX1t/DWXS+8ZFizoLSclrheeeHCWqZPeK4mYUK628NpEoKdxIjgMUM88X1JKQI4/o/XuR/wcNjANdFkL9E8KsYprrNGvRphihkWZqqxCIeWxEwQtNgoun1BjXmDaV7MVbvu801ZWRCwkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066568; c=relaxed/simple;
	bh=89tN/7VBPX25KKGXAvRGv0QcE9gwxjjPObs36dlJHBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9+65D04Jy6NvwbJCxHwz3J0dYBMy8/fFPibmJIkaSUtM7Fyh0PUgo4nh88OyQLBDVlagVj3DfvDTvC6aZFejH59VT/TEAVXN6VshWCpBJWvKiPj+1B3qvB3IzhzfCcvYdjQ+sAEFWoCuTdi8tFuvty/pma3d+3TstUMpkJUe7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otYBoWtk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B952C4CED0;
	Fri,  4 Oct 2024 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066568;
	bh=89tN/7VBPX25KKGXAvRGv0QcE9gwxjjPObs36dlJHBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=otYBoWtkcdKEai1qiW+OYCQ4BQbPzdl8MnCL8QMrNAIpRHRoWpzmmXlo1T+5IoB9K
	 Sq6ICFi9x4kwDxgpi17txE8rrudo/ht7DAAWSXTHbls5MYDu+qAJ+hFGyDpHDfMqyT
	 OWeqglJexmDrG/qALTZ9n1iRadIqyQZXeOpr21c383VARXblBIwvUesH3i+93PUkLy
	 iWLVpU+gYLh0Q/KH4i8CbACz38rDu/UqPxasbtVkGfOzwdGZAKGq6cAuJ3w1uQERQV
	 gLI4J4BHjJecb0ZJ/P9HRPJGmFPI8icDbrltvB5pMXN36+7NqaoB/tajnm51d1SqEx
	 /0I2nk1bU3lZQ==
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
Subject: [PATCH AUTOSEL 5.15 18/31] i2c: i801: Use a different adapter-name for IDF adapters
Date: Fri,  4 Oct 2024 14:28:26 -0400
Message-ID: <20241004182854.3674661-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182854.3674661-1-sashal@kernel.org>
References: <20241004182854.3674661-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.167
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
index 758bbb13b8be3..e983ad07c4951 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1851,8 +1851,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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


