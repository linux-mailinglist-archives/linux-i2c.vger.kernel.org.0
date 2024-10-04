Return-Path: <linux-i2c+bounces-7227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D1990FB0
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 22:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B9B2B3224D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 19:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED71F1E22E2;
	Fri,  4 Oct 2024 18:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xc7W5WeR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44622F8F1;
	Fri,  4 Oct 2024 18:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066727; cv=none; b=ehve8fNsEh3cdsSZ2g8J2zBFa5JCTqpdDtHjeTXTye8nhhGtbkjd9K9d0X3n0DcvwZWV2C947/iwdq3D3jd/uvNIcmRoEG8xCtKceJvtNeLMOrVPy0yXMdGIxEZ+J7p6tLD0u45QFXP2yMYPa45PcIMIzV4qwvY3G1tJvGgaSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066727; c=relaxed/simple;
	bh=skvcep9sdYZskInQv2BaNUbnAo9npNt0KtzP7o9x470=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fE/yxyw6qcZH+o8JiFe3O488Q0RvlL6fd3xhyKgVeP9fURJSg1UxLafkxPXrq+XNcVPM4EnnKJyVEN0/05dCDdhM15jrYa/SMYWhCKTSqRDcyL6UcSiqhKpvhLMOXooep2fvrEYNnW0pbJ7QDLXmnGmRSRNCSCtRGzt/N7yNIWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xc7W5WeR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545E4C4CEC6;
	Fri,  4 Oct 2024 18:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066727;
	bh=skvcep9sdYZskInQv2BaNUbnAo9npNt0KtzP7o9x470=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xc7W5WeRP8PeSP4tdwQLIsivANMw/IzaMDf8UhPR5UfyuHUpgOY9LsaVYkCuqn/LF
	 SEOmln73vH3QJurYEJhnnQrYV8Vtvxb5L8DGi6SoPVss8Po7VmAnM9mWscYQJiQI+i
	 GBjILC7BcnFtWVhO+L/Q/DqDfGxFUqyUEIgeRfYqwE1zA0AHrxY90Vwxg0R5NMBsD6
	 M+Q10wCjPZW3a4oq5a4bJUvk92aDCp/md+cph6SQl2qTfeeVLseu6g3xyaTcPCbNgZ
	 fbRUc9CcwHM41ibRlnPGDM/tysvlm8Plj5xSbbuVUfQP67GJMh3SBOO6nbMv1oUOyq
	 5pS9jw5il0ttg==
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
Subject: [PATCH AUTOSEL 4.19 10/16] i2c: i801: Use a different adapter-name for IDF adapters
Date: Fri,  4 Oct 2024 14:31:37 -0400
Message-ID: <20241004183150.3676355-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183150.3676355-1-sashal@kernel.org>
References: <20241004183150.3676355-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.322
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
index c1e2539b79502..b552f8d62fa2f 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1674,8 +1674,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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


