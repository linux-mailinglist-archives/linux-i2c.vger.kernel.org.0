Return-Path: <linux-i2c+bounces-7226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C8990EE1
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 21:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AD731C220B3
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 19:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5187C22CAFF;
	Fri,  4 Oct 2024 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPv9+vee"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2CC22CAF8;
	Fri,  4 Oct 2024 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066688; cv=none; b=BtQj+HExj3LXbT1mhXsaRqHkEetaBHQ92Qz8zG2Xskz8gDh8LOm0Frf6E/+RHAiJgERdYhGDtb9J/qsBbZ2nZjeQ/Ng5qJQskDWWN30MpZxalCN+0ZlJZ5lg82zw79VQrnM0QOlbUwDkhP50Z3GgSiPN8Wp6yTKk77F/oAAu1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066688; c=relaxed/simple;
	bh=8v+rZuHdjM11xy9pyUCp6uop838dCMz8Ck3kgy9mPtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XekTvwQykRp/CPJihIlGdvUGGTln605clVmOwlZEwb4Nv0q1rsJ0QmLF4IcL0ACLx068T25T6stJ9v247VZ4CvPVqdG70E8MsEN2qXnz5Zz0MlU3Tp5kpaH271ByJaGzUwq9gM7OoVI8gVkwqg70PKYMP/bBGHxcefXHWnhwuQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPv9+vee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B56C4CECC;
	Fri,  4 Oct 2024 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066687;
	bh=8v+rZuHdjM11xy9pyUCp6uop838dCMz8Ck3kgy9mPtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPv9+veeAuDSGfMyRgNTxYxTpSvOD+f/g43Ca1Aia+SgOWRXGFYE4h2NroHuFav/K
	 FbgZXAgSdJndnztKq3ownYugg3RW2N7Zowrm91TXaxt13KgTJJGF1NOlBl8RxTEY8H
	 dS/esMq0bM0QQSqvmzbYrb+7iyGwgsUjpzjNamTowzS6sk6DzV5sFkMNdO7HRuk9Tl
	 bdWpmL6OWFLZ36LlREtwXw0ZlWzCN6duvACuJQh2zXdzubuQt6hRQJvdruloqDyhMM
	 wICktotxoDIET0Z7EhJR3/Vk/g1wpv54z0j5OeMI3igcudComNPrtZ6sR56VhfH294
	 swrtlDjWNzVHA==
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
Subject: [PATCH AUTOSEL 5.4 12/21] i2c: i801: Use a different adapter-name for IDF adapters
Date: Fri,  4 Oct 2024 14:30:47 -0400
Message-ID: <20241004183105.3675901-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183105.3675901-1-sashal@kernel.org>
References: <20241004183105.3675901-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.284
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
index 2c077ffcee607..6b960cbd045bc 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1861,8 +1861,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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


