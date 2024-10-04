Return-Path: <linux-i2c+bounces-7220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D3990B49
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 20:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F1E21C21EC8
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 18:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE75221E5A;
	Fri,  4 Oct 2024 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqmYpihA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40D221E4A;
	Fri,  4 Oct 2024 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728065959; cv=none; b=jlbgDkm+Pzm/0kPFR4uCq+r7z/dxVUwa7rEd1+yvZ4iXVnzJQXgCgYGKWuZbq2wNJhbuTpnF1HqiQu+oSUwDrrvulPF1d6D5033W0lOkzWCJ2997OSNOr//CYapQSfVYvwhL8kGI3NXOV85xDwsURWoOYd9R72tCXg5ZxJa5mxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728065959; c=relaxed/simple;
	bh=c+STVTma1OKrrNgT+CTvb5cUI2XXZJx4+umYTKVNdl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r1BuMGskkolTp0YLITA4SxF+JRev1TpxFyMRmVEj6MyFyXko+0r2j/YVqv7UvswXuVWnVC/ArtpmMuREIgpUiIhA7YsraXX0fjjPjpCsEHeuHMzVVAZgXJWw1HMgm9XjNsIwvx9jHDXpkX+se03A7Jx67d2NdOabZVn3MxvctJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqmYpihA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC41EC4CECC;
	Fri,  4 Oct 2024 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728065959;
	bh=c+STVTma1OKrrNgT+CTvb5cUI2XXZJx4+umYTKVNdl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqmYpihAZzzxiUAHsqM5PpXLcSmrUlrNerjjSSKexR4xHOBXY1QCFdPWd5tN772QM
	 114M3SQW+F+tgGCX9iML6i7E+XVuoAjpaURgWqkQ6PETgKzS3MDN4asNp2cshlw/eb
	 RDHntXgQHRY4iImJTPpCsmD+KYLJeBQj7AoBk5Z6lnudUW6K5jCzgZFfAHgGM5nM+B
	 VSIO0i+h7r5k0w4bAlSI+DZc/6Y5Ff98aY1bOKBT+GBn0rcH6qnINONp5oPnb20iBh
	 g45sTvQquc9uyo7DX6yDZTg2eRnulg9c+2gkaF8Wp7S/NN2dkpOv2MKXsjiMZAgdKk
	 gPXHKvyef2SRg==
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
Subject: [PATCH AUTOSEL 6.11 28/76] i2c: i801: Use a different adapter-name for IDF adapters
Date: Fri,  4 Oct 2024 14:16:45 -0400
Message-ID: <20241004181828.3669209-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004181828.3669209-1-sashal@kernel.org>
References: <20241004181828.3669209-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.2
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
index 328c0dab6b147..299fe9d3afab0 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1763,8 +1763,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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


