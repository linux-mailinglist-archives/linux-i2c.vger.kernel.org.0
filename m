Return-Path: <linux-i2c+bounces-7223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1C990DB9
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 21:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 097221C212B7
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 19:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA942118A5;
	Fri,  4 Oct 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgG6VJOC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8652821189B;
	Fri,  4 Oct 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066473; cv=none; b=gNSH7hZqHs3PyP9QXH5HnJreSaFxXwSfh6uX52luiDAU9BKursHnjm9pAadcDTW2jHJYikY4hJdIpnhFoBqyw9vDWZQKdD4JkIbbBi+cGPIlTuYoFLViXLFCrytkSM/zJl4vIHvitsR+T898iZQoF8WqwB/FO+ukbKyv1BJc338=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066473; c=relaxed/simple;
	bh=kcrnLmaMITL7FKlDnyQXdgkLO4uXSn/Dn1VSCe4S3Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHFRUpx22dHN0AiBU+8NQNljTYtSrpHeMTv5ykkt7Yj1htrLBKFGuDfbfvAZVFoEB2ujEL/0iyoz3PJ1Xfbg66fAHsukwcncW7Ul87ELyOLv1NCXK8X7wHIxwMJlmnnsEsfey68LXvd1SfYkp7AkhevdzDTSovz44D1jslHZJ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgG6VJOC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694A2C4CEC6;
	Fri,  4 Oct 2024 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066473;
	bh=kcrnLmaMITL7FKlDnyQXdgkLO4uXSn/Dn1VSCe4S3Kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TgG6VJOCgtch+4EY0C2vvKfCONDupzi7kYy0RvsH8sVojsS5JX46abHbM+2zagmNy
	 fPv+y9tuGtvE3EJqeZCsglEocxoH7C4x7PyrIgjSIeUG5ZNY0hSznRXehAf16pKEPe
	 xC9C0VUO/RK6RXr3uod/R4jmaAeGUUKNMHmIVM7IJ+kOjYv6msOn+XpiUehtXspkdt
	 MMSugs2XLMgOA3rLlWHAI3KbC5LDbC5PdBDgC6gA+TUZKrC5aToggjNIyVCCFmT94k
	 kCs2tmUlK/m9JjRYw//YZG+kXQAjYwNjDk/HiOEd0MeeIrz26tkp8s4CwSZciNWBBi
	 cWkNxpMW3/VRg==
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
Subject: [PATCH AUTOSEL 6.1 19/42] i2c: i801: Use a different adapter-name for IDF adapters
Date: Fri,  4 Oct 2024 14:26:30 -0400
Message-ID: <20241004182718.3673735-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182718.3673735-1-sashal@kernel.org>
References: <20241004182718.3673735-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.112
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
index 208c7741bc681..d3ecd65b0542a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1751,8 +1751,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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


