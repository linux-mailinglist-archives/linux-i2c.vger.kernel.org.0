Return-Path: <linux-i2c+bounces-4704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E0692931A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D333F1C2124B
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E650B15ECFB;
	Sat,  6 Jul 2024 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bb6i1/pB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D617F1591F1
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264926; cv=none; b=p3MNQd2HLtkvkW2o7vB3WjbMj8X039pKr3JNveaHigJ+jG1kPZ9+vHAqY2ObC/oZI/zlJqrUaxgXbLZlSKJ+6wjAAkqy66ncJah5BVS+qOEVA8kWScyCe2S1qvewpKK09qMsv056oFOqHrs/tgS6dP0Ye+UGLDsRe4Uhl3kFznE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264926; c=relaxed/simple;
	bh=cYeIEPevFKeER7rNatuXkS56BKGnO7fpmd74rioOOwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/Ouwn8wIyKYxiDG+ItiFSc2QhIbqKIReiJqrkegavLOZYLQDhIdBkaBSqRWzhRdb3RvHbh9JeKwi+PTAalXs13ZVjZE0fuFys2TBa+l86QBcTw9rDcv9pL8CjBQJolcRZni8u4LZKTpVMaJ7Oqa+qtoqRpwDgBTb7fGLW/AZJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bb6i1/pB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7oZE53EqwBJ41YgA1lOP+r1p1fkFj5Ah6izJNlUQSw8=; b=bb6i1/
	pBSvPM0QWPAlXgSbfX5ryFvQVJV0iC+OkPEdf9u83ehcXfZJLFl8XazQ2Lp8Odr5
	+4VnVDPiHrtr4PNyp1XDXFqOtIK0Zf5EQLNRWXYG3XI1F9shZR28a7AQg6wpuGJe
	dASWosDlIyzc9J81yr6dNMmb1sX5jLriavnaw5U7adfIPkHqtuw7RV2mGxQ5548G
	Top84KGEaAeo4TkNTTD1FmrjyII2tyjW/Yns+hYXJqMX44OvJEvozbLDuEzY6Fe1
	3TYLurhTGrcq0/jlH/M+JKp/QyvGBQxujOYaBb3ybX3ZQvAIKPH/PfL3R64K2xzg
	+AN+ZpRcK7iIVMEw==
Received: (qmail 3810577 invoked from network); 6 Jul 2024 13:21:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:48 +0200
X-UD-Smtp-Session: l3s3148p1@667GYpIcJMJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andi Shyti <andi.shyti@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 37/60] i2c: pasemi: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:37 +0200
Message-ID: <20240706112116.24543-38-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-pasemi-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd8becbdeeb2..dac694a9d781 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -336,9 +336,9 @@ static u32 pasemi_smb_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm smbus_algorithm = {
-	.master_xfer	= pasemi_i2c_xfer,
-	.smbus_xfer	= pasemi_smb_xfer,
-	.functionality	= pasemi_smb_func,
+	.xfer = pasemi_i2c_xfer,
+	.smbus_xfer = pasemi_smb_xfer,
+	.functionality = pasemi_smb_func,
 };
 
 int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
-- 
2.43.0


