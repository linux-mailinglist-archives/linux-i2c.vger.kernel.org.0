Return-Path: <linux-i2c+bounces-4703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44459929318
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E0B2822D4
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028C115B999;
	Sat,  6 Jul 2024 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GQndvjGO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F615884A
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264925; cv=none; b=K3DQurGtYd6tZOuE9Hxfz3Uq8tGc5y3YI1WDOENhplkHWYNX1e5bqPLEhRaooIi/wNphZ001MT0eGcWIv6hCGpbsdOtBMZATa46qkXDFhp7vlZ/G7LbhhXSuHWeJFq254j7gijjI7xEPGPL8Y4CosW/fuEOOfa9IcFmEUjfZh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264925; c=relaxed/simple;
	bh=ScaL0Ozty9ZSgQUVbj3nwMkwJgaXyJfRepDSjvMz2dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HetnQKfFjwSS0M/fr1GblLbw7YiWGFs278BH/5uu83o86wf5IB3lVqYc4miHjMFZ+jKxWBIfYP13yEHyVIa/G045TXdzxKUqNvlvIWWnHWOyyIzN348dMTB99xeOo3b6qA2vYzyRULK8YHOpMSd8tXkBtMAuAFsK00zNmc8d3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GQndvjGO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=LBOEuPmP45x17I1fwDIjtyeY3JJeak/7XBOt8b+rk0Y=; b=GQndvj
	GO9tntaD22QpjEHsVWIl+PXS9ut84waujSJYHUm5/ZTemkH/9Ze6jnN7BupSp/gw
	e0m21RK7kZ1nc7npNS1ZsN+hVtX4qDWSoo/t2pC8WohZaGRlCBDdXovBOnqwEUe4
	kB8WvkjvjzvVqR2Eg/H9Ges84KDDuMw77o3aXfUn1IXaMaXo8o6OnBmgcveyIpKS
	OPpYUyD84xMiutNhHzQSKW9wLQTgmrd+/v7t9qG1DQvYjWok8kV+CfRCRwoZeyO4
	9YFCU4OdP8HK4Jt/GX+U7IcAM5tdqbxz7GoXHRTmBsI3WvuIbq+A2hTKe4EdVVPG
	+u1+D7q+r1tljYSA==
Received: (qmail 3810518 invoked from network); 6 Jul 2024 13:21:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:47 +0200
X-UD-Smtp-Session: l3s3148p1@GHOyYpIcEMJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 35/60] i2c: opal: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:35 +0200
Message-ID: <20240706112116.24543-36-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-opal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index 17ef87d50f7c..d9dd71cf37fd 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -70,8 +70,8 @@ static int i2c_opal_send_request(u32 bus_id, struct opal_i2c_request *req)
 	return rc;
 }
 
-static int i2c_opal_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-				int num)
+static int i2c_opal_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			 int num)
 {
 	unsigned long opal_id = (unsigned long)adap->algo_data;
 	struct opal_i2c_request req;
@@ -179,9 +179,9 @@ static u32 i2c_opal_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_opal_algo = {
-	.master_xfer	= i2c_opal_master_xfer,
-	.smbus_xfer	= i2c_opal_smbus_xfer,
-	.functionality	= i2c_opal_func,
+	.xfer = i2c_opal_xfer,
+	.smbus_xfer = i2c_opal_smbus_xfer,
+	.functionality = i2c_opal_func,
 };
 
 /*
-- 
2.43.0


