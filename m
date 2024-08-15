Return-Path: <linux-i2c+bounces-5442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE07F953CCC
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 23:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78F38286769
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 21:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA30314BF9B;
	Thu, 15 Aug 2024 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="h/aE4aI+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE481537D4
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723758020; cv=none; b=pa7oUycyhAV2G1flR8q1T3PhWspaVKsuTimYprxg8TdAZO4v1a4KmYJ6Whn+gJv3/TZTBBtXuD2D9weuNzjJBSG25VH/KFbeABxYsMXsRdQpLT7Nb5KTM4ybpRdFS45Nueu3pZ8f5PohfmuD2T7CAOkUoxN5UecTVe6nH+mFkns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723758020; c=relaxed/simple;
	bh=uixzx293zi4EbW44FAXO+3iHNRT9KQ1qR3Wxtrs1WGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucp5lcrttElqh3zvd5IfebE/Mm5SC2uvZfoeRB5etuggRoDTyBUIy/5lB/yEVdlrYrlzTG+/JkiaPNqY/jaNJeKkFJD0bUeQXRb9/vf6KjXRAi+pq5M2QNzPjCZadch63QeFW+wu5KjG+tfeV426fDrH3aphltgHq1tVOdxS18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h/aE4aI+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4qhqVgvw3Z+RW+itxvmehChRkK8ifMLtZfkRwcU9IgQ=; b=h/aE4a
	I+gXkQrhw0y+l2Xz2JUB0L2AYG7NU7TukEIKcOGilApOx79B1ZYPAbw29odCFThq
	c7Y55Grcjz9vzm95TcxzAnqIZ1twppSvx6I7DOhcd/qCDETYX5miYNs23yvW/eML
	U2PITPtRl4L34LqxHiIvl0cTG/9NNhmHH2iVmBP7N7l+IQGt5M/CoixrAC3okPsy
	vfcfd2koOVQkEPFxqdGaSsG/dchdANydDgZK/P3+SYkLEaaUB9IduhafcFyvW0sx
	HCVhNXTIUNWUSmgpJw4TltgzuhrntB6dp0dsWrQK2Jn4B0Hx/0GExMyqId39/lZb
	R/X8ydJZIERbfsDg==
Received: (qmail 2404127 invoked from network); 15 Aug 2024 23:40:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 23:40:16 +0200
X-UD-Smtp-Session: l3s3148p1@zKU6sL8fWI0gAQnoAH4zAClVBN/DeGcx
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 dt-schema 2/3] schemas: i2c: clean up interrupt descriptions for I2C targets
Date: Thu, 15 Aug 2024 23:40:12 +0200
Message-ID: <20240815214013.6519-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>
References: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Schemas should be OS agnostic, so don't mention what the "I2C core" will
do because this only applies to Linux. Also, drop the generic
"smbus_alert" naming because this belongs to controllers not targets, so
we don't want to describe it here. Finally, use "contains" instead of
"items" because the enum is not exhaustive.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 dtschema/schemas/i2c/i2c-controller.yaml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index e475ead..6dc73f8 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -171,20 +171,20 @@ patternProperties:
 
       interrupts:
         description:
-          I2C core will treat "irq" interrupt (or the very first interrupt if
-          not using interrupt names) as primary interrupt for the target.
+          If not using interrupt-names, the first interrupt will be treated as
+          the primary interrupt for the target.
 
       interrupt-names:
         anyOf:
           - {} # Any name is allowed.
-          - items:
+          - contains:
               enum:
                 - irq
                 - wakeup
-                - smbus_alert
             description:
-              Names which are recognized by I2C core, other names are left to
-              individual bindings.
+              Generic names are "irq" for the primary interrupt and "wakeup"
+              for the wakeup interrupt. Other names are left to individual
+              bindings.
 
       wakeup-source:
         description:
-- 
2.43.0


