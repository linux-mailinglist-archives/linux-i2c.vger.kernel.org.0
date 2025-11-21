Return-Path: <linux-i2c+bounces-14214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E1C78DD7
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 12:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A540132AC3
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 11:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3C634CFAF;
	Fri, 21 Nov 2025 11:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJODCUud"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42A33451AA;
	Fri, 21 Nov 2025 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725055; cv=none; b=dEGLxrWRbI8Yf+hG1eHpK59aCrMLLw/UmhxlHWzPCGqELw2gxzk/6EqtVqbPbApOVWeyfqRZZamSyHBnDnafPP5+wNf53hrYEyY4IjfYPL0zPAcP8Q5SxSTbs5J4mA5Vb/5GLq3evq8F8lyJd2ul4fDvQv6wbadyQm3IXkHZxoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725055; c=relaxed/simple;
	bh=2qYJtfww/zHVcyQgUZfKWKnSi9H/xWeambs8t1X3vb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qwp9PYo/EnvlrOrCpcC0TwGTgZcj+ocuCM/x9KdN4aLgtltsGWWlYfQ8qw34ROM6uwvZhZmf5pPCg0FCDwjiFYRIFePAjTwAQTvxAmIR/Eod0Eqz50PMxU4qhG8un7rGf5c8GF4TqcCoXRwHfm1Q+9dzcO0LwQ4rU8LgHT/B/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJODCUud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DADC113D0;
	Fri, 21 Nov 2025 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763725055;
	bh=2qYJtfww/zHVcyQgUZfKWKnSi9H/xWeambs8t1X3vb0=;
	h=From:To:Cc:Subject:Date:From;
	b=JJODCUudkKw7T1fJdgv83+iFam86BCD/5vdb+SG0BW5sP0zeOSf+AmWa4G1cbaxJS
	 0uGpC97flOwrwsTacnrADMJ4YZOT62ZFZFs/soG3Vz/5qfPkyuhAZsgAHZXZcadb2Y
	 lnPgXr5dsByOMa0jUr9R/v0uZvJg8Xu8gN5qn9B133jXH0Dmv5DjCW/fopje/oAQP/
	 um5/ekCP6q1fTRT18tH0ACqnY0JCIsMtRxdP0B6RBLQLPL1mqNqt4dSpu+h6lqmM/S
	 S0aOHJW9Ry3HAhZ4USWcDeuHVBY9epU964y813IpAi1bmr6HFKCy2XvR+B7M9gE5w7
	 gVmavnP5SLsIg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vMPSI-0000000014D-2Sxe;
	Fri, 21 Nov 2025 12:37:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: amd-mp2: fix device leak on probe()
Date: Fri, 21 Nov 2025 12:37:14 +0100
Message-ID: <20251121113714.4080-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the reference taken to the PCI device when looking up
its driver data during probe of the platform device.

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controller")
Cc: stable@vger.kernel.org	# 5.2
Cc: Elie Morisse <syniurge@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index ef7370d3dbea..5b41d18b62d3 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -456,6 +456,7 @@ module_pci_driver(amd_mp2_pci_driver);
 
 struct amd_mp2_dev *amd_mp2_find_device(void)
 {
+	struct amd_mp2_dev *privdata;
 	struct device *dev;
 	struct pci_dev *pci_dev;
 
@@ -464,7 +465,11 @@ struct amd_mp2_dev *amd_mp2_find_device(void)
 		return NULL;
 
 	pci_dev = to_pci_dev(dev);
-	return (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
+	privdata = pci_get_drvdata(pci_dev);
+
+	put_device(dev);
+
+	return privdata;
 }
 EXPORT_SYMBOL_GPL(amd_mp2_find_device);
 
-- 
2.51.2


