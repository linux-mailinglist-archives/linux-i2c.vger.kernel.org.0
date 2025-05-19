Return-Path: <linux-i2c+bounces-11015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5AEABBC20
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDE7817C5D6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A972750FA;
	Mon, 19 May 2025 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NXLyYQEp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAE2749EB
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653208; cv=none; b=lhWiaI8JlXtNQ6LKgHukD6GtoufIrLHaX/tZXgWzZcRDPH4PczNhEJyo1Y4XsnftVObmpJI5jeLP1LoVxe3bEKqGu0NJVjOwdE93Xh9pjZvHmIjIKL+m9uhWxZiJBx1qwhG9RD5xZ9WwzwvncXBmMDnw5VpIAJXmwBU6eqlWE58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653208; c=relaxed/simple;
	bh=DMRSjhoFZfA1cJ4677hmBXwmZrHDQZK/AnNA9Ok/938=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBNzjfU1TWqI5vSE4BQR2ihMpQCs2TGcjQULlDDI0rsRGDauGTF0Rv2e5dYgcY5bFOFShjVUZgvNlxuTznwZyNjp4bbsWxJqnBNRlr/Q79O/N++po7P/I0tHv+0SKWYiX69BxIEwnhBVGQXODUVVa+oyAxgUBVD5Vda9Sh9/lKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NXLyYQEp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2dseSyP2VjGZ9VQad8V5Hdinw8KP1CadYXDdUasl8P0=; b=NXLyYQ
	EpopjhwvGXzLUn2RfhzFlALhrepTDfsplYM7WCE16whP7Vh5tuqFi2V/YaSfZE/f
	rFnm1bJI1C7Ep8aB8qRubteHH0NR9dfcEo5UpssSi0CNTjjChOeBimo980Fq+t12
	cPhLi5h0xt4uS6eecPBNOrqXo8qB8TlmarJjLYrYPuENzMz/KIdHxQZ92SspI+GU
	ulroAnryqP4g5uNQmztBZCKuQvi8AqFB8hdCubVGH38jVNgAl6zlxwI201fkiSTI
	KxdYBU5vkKmapK4XYTtBQG0sKS+qf8yYEVvNzoqETo6COSRXFXHkHRFkiC1Upq1d
	Nnit83Qe46iZPrsw==
Received: (qmail 2453796 invoked from network); 19 May 2025 13:13:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:13:24 +0200
X-UD-Smtp-Session: l3s3148p1@vE1hOHs1ht5Zz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] i2c: remove 'of_node' member from i2c_boardinfo
Date: Mon, 19 May 2025 13:13:14 +0200
Message-ID: <20250519111311.2390-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no user of this member anymore. We can remove it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i2c.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index cc1437f29823..20fd41b51d5c 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -405,7 +405,6 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * @addr: stored in i2c_client.addr
  * @dev_name: Overrides the default <busnr>-<addr> dev_name if set
  * @platform_data: stored in i2c_client.dev.platform_data
- * @of_node: **DEPRECATED** - use @fwnode for this
  * @fwnode: device node supplied by the platform firmware
  * @swnode: software node for the device
  * @resources: resources associated with the device
@@ -429,7 +428,6 @@ struct i2c_board_info {
 	unsigned short	addr;
 	const char	*dev_name;
 	void		*platform_data;
-	struct device_node *of_node;
 	struct fwnode_handle *fwnode;
 	const struct software_node *swnode;
 	const struct resource *resources;
-- 
2.47.2


