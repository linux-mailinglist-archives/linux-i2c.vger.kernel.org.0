Return-Path: <linux-i2c+bounces-5401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F209521F2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B6F51C212E3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FBE1BD4F8;
	Wed, 14 Aug 2024 18:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O9uSC4wM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E501B86CC
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659736; cv=none; b=uRysykdTIP3urtIUzyWdKSDFn8ZIhnGGdZRd0F73Rfv2XNAmIB9LYoTlqRCwF7x+6W0DmxOs4gPVGFDGsQXGZin2TBA+SSjBh+a5u4a6yrvOhMgY6h6M/OTXMmoHWuyi4OPON5WNnaLfcHwRPNncVcgNoEmxXvh0VxxWox8z6iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659736; c=relaxed/simple;
	bh=tQjuUaxdat+2KEGQjyVmeSbf2fFsAcFpB+QxVnFBRvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwpT2Qlv3Jgv69WWB6ZRMWaWwNEvxwMQsbMkJvU586hcyE2Y+EQ96OWzYbfWuyHkIj5WEfErYt6mrj0O+ySPKjUUbqcWjQUpRX1ZyEDhdhJdol2bmzxO9iFIIEbOKG0LQxPOeLQbrYqa+upk1vcWkPJosLPf+BIltP+jpBXzMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O9uSC4wM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EZuSu/YjWTn+/F93ud8G89tPT7KFtw5MjmqiM/N9sro=; b=O9uSC4
	wM5ANZqIIcNGRDMX5OM5K7Vd3nZr0+6SqQ0IbSPDol19DHiIHrDY0Tj/94+d3rfO
	3f7Z7Jz5HfMEcl/SZZIGIqjQ1SMAp0ykTgYks5kCd7iMZqOcDgpLWuHC1lscFbw+
	7BWT7XjkWkYif2QPGSnwV3uMY0INoBSA3EP9FlB+O0mk6iFaOrWNxjGAysNMJP4y
	+NrhRJauRCcQPd2ZfJ7W/BbME5qOvr1mXTdHVwFVKueci5y4X93bT3eJ2XD5v7Tx
	YgB+JHtXGhBLEEt64GW/yJEeKKTir0jXuAab4W9ZzCUM+9gdUClQai1JwcHMmLfC
	tNbosPRJZbTEhgdQ==
Received: (qmail 2065475 invoked from network); 14 Aug 2024 20:22:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:22:12 +0200
X-UD-Smtp-Session: l3s3148p1@UfIPzqgf5sogAQnoAHipAGJRnFk/ZdC8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 1/3] i2c: testunit: describe fwnode based instantiation
Date: Wed, 14 Aug 2024 20:22:07 +0200
Message-ID: <20240814182210.15382-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
References: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The testunit can also be instantiated via firmware nodes. Give a
devicetree node as an example.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-testunit-backend.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index d3ab5944877d..3743188ecfc7 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -20,6 +20,18 @@ Instantiating the device is regular. Example for bus 0, address 0x30::
 
   # echo "slave-testunit 0x1030" > /sys/bus/i2c/devices/i2c-0/new_device
 
+Or using firmware nodes. Here is a devicetree example (note this is only a
+debug device, so there are no official DT bindings)::
+
+  &i2c0	{
+        ...
+
+	testunit@30 {
+		compatible = "slave-testunit";
+		reg = <(0x30 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+  };
+
 After that, you will have the device listening. Reading will return a single
 byte. Its value is 0 if the testunit is idle, otherwise the command number of
 the currently running command.
-- 
2.43.0


