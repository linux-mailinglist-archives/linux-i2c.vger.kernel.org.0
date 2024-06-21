Return-Path: <linux-i2c+bounces-4176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E7911CD0
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 09:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 642A11C216CA
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0A616DEBD;
	Fri, 21 Jun 2024 07:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AJitrd3c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B8616D4CA
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955030; cv=none; b=WHsCmSzyRm3DXgkVMaSYTJzsd0FJSa9/yXrKD/lyX53VnhfZ9F0Ge0qhl74tpKds9opr+NuG8zSwkMpbFm2xSR6HBoIm4itP0SP02w4TN6s1hnBqJ1AQShVO/k/BEstDatCPT/julp27DrLIpaAvFZzaViBaGSCsjSUgz8WFXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955030; c=relaxed/simple;
	bh=rDqQbB8WtLI0sNUuiLmLKSokCC9jWiu+CRLfqoeNG94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjyDqQVBjsA4Y4x2lw48H5CIgVrPA28cx24mI0ZFGM7TWTMhds5kK+NHJRddv/ywJujq1agHdevOHnN/aHjfPDfYxV4MkULj6RwF8Ui8n34dfGpJ3wQRbvR6EwAU1kvHkfCa+VbGeuNSIudKyeGBhpJRu2dyhCPwM2zeXjcsBA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AJitrd3c; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=X8SjZrtr7vYauQzzWhyTb2doGzFDtsUQAd4VY9QcFf4=; b=AJitrd
	3cWXG4yRPQpFSvpRs5EZ4klDtvdbmQ0+FSIW7qGhVXS7fJrh1yILhu6PiqszhHiS
	mYVX2DrmJ6XjWCqaQ/O6s2sXfX9aEC2VRtsZ7bEmr70yTLU6SSEevPZWdoRp5ULw
	HIKoKJ9DxTwq91k0g9cJiOgqWVMYp45Ong4stOdOtuqT250snO30SXW2ePX5ToMe
	lwMGS9lZb9kGjHbkzN8xbXMa2LrA3wjmyVBZMBa8QVcMGasLCs2L8Xd2Frx9qLUD
	c960g8LEZUfz2XKdKJS5YXm+cwsTnBcnFsvt7bt4pWx9Ay5FXx41yDEJloa5axPD
	fAsr0U/6ib8KvIfA==
Received: (qmail 1279150 invoked from network); 21 Jun 2024 09:30:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:30:26 +0200
X-UD-Smtp-Session: l3s3148p1@Zia8Z2EbDJAgAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v4 5/6] docs: i2c: summary: document 'local' and 'remote' targets
Date: Fri, 21 Jun 2024 09:30:12 +0200
Message-ID: <20240621073015.5443-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
References: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because Linux can be a target as well, add terminology to differentiate
between Linux being the target and Linux accessing targets.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/summary.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index a6da1032fa06..ff8bda32b9c3 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -49,10 +49,15 @@ whole class of I2C adapters. Each specific adapter driver either depends on
 an algorithm driver in the ``drivers/i2c/algos/`` subdirectory, or includes
 its own implementation.
 
-A **target** chip is a node that responds to communications when addressed
-by the controller. In Linux it is called a **client**. Client drivers are kept
-in a directory specific to the feature they provide, for example
-``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
+A **target** chip is a node that responds to communications when addressed by a
+controller. In the Linux kernel implementation it is called a **client**. While
+targets are usually separate external chips, Linux can also act as a target
+(needs hardware support) and respond to another controller on the bus. This is
+then called a **local target**. In contrast, an external chip is called a
+**remote target**.
+
+Target drivers are kept in a directory specific to the feature they provide,
+for example ``drivers/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
 video-related chips.
 
 For the example configuration in figure, you will need a driver for your
-- 
2.43.0


