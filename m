Return-Path: <linux-i2c+bounces-4677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616E9292E0
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A48AE1F2163E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906FA13BC31;
	Sat,  6 Jul 2024 11:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KogWU+Jz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3413A864
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264906; cv=none; b=bAWl3Rb9A1KT+Sxqmw8f9IwV48nVE77uUMLGdJOHfLcUjn2nofIbIa7q3euEcAZXx9bBNWMvItRlcQOT+4bHxtjOpnGHT9+7S/xwqhZTu1mDkhR3XJ16w0VCPwNJKA9ltfncfK2MbFuRAO4a++IqBsaJIodkGzTlg+Ptxnr3Ffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264906; c=relaxed/simple;
	bh=9lVLZWRc7NAlCXEos/Ht+9OXDaJDePn7bYvBLBWeZ78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k33o95YE2lea3QTpjiJBiIXZP9taf78QB5vA8l5dUeeB6f7rn3Vz+hWeVR5zOyFc3/MvMgHEsTGxymDrGMxA2XOWbzjnGqLOhYO+0ZkE9U7SmN46tdOUCYAlqb9I3J7XRv+x+L8BUtTGHAmQlYfjQplw5k07cDj/1ul3KK32fFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KogWU+Jz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=D1BuoUJ5rXFWGybNFHM62IQOacbAYA+TSmxYZ9HLfeM=; b=KogWU+
	JzPp3w0jQi5IbflPz3B/JK/4yhnX6vdtEhOU9hNgBMdOeGMm2t9aC+3LK0RTVdNs
	SoNr+F+M93O1jUTVgL31cAcYmpqV4dzJFtIVJJq2BKlwobytQBnrxTDFkObdWJlx
	m77Q8pLKU5rnh6X5nfN23pFbsFTDHpVK7ml2MZGaJZxWWeGypY8RZMPkOOv62U4j
	r+l9H6pKHWWexRwOrYwCJwhSNt2FqJB7xaDkuplHionbf0KStZOB5IkVnT1TBwBW
	opBlcYvyM9IG9sYDcGgAOII91xICWaUsnEBxxKQoAXztrwUa3bfAu7rRwjIKYf2u
	Qrju2kzpOxFAAQcw==
Received: (qmail 3809660 invoked from network); 6 Jul 2024 13:21:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:29 +0200
X-UD-Smtp-Session: l3s3148p1@SDCiYZIccpBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/60] i2c: cros-ec-tunnel: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:10 +0200
Message-ID: <20240706112116.24543-11-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 2737fd8abd32..ab2688bd4d33 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -235,8 +235,8 @@ static u32 ec_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm ec_i2c_algorithm = {
-	.master_xfer	= ec_i2c_xfer,
-	.functionality	= ec_i2c_functionality,
+	.xfer = ec_i2c_xfer,
+	.functionality = ec_i2c_functionality,
 };
 
 static int ec_i2c_probe(struct platform_device *pdev)
-- 
2.43.0


