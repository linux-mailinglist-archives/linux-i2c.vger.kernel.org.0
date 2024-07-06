Return-Path: <linux-i2c+bounces-4680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC739292E5
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4DBB1F21FD2
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD2413D250;
	Sat,  6 Jul 2024 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PbzuCbdu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF8813B798
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264908; cv=none; b=ifG8PAZye4inbDMlRmvsHJ4AlSWq4E+/JyJqo0V6ul7DB5/C3ur72/9lrU70GyKtt+FeSFl4OCqXLsXySUz5KUS+DfiW9FfFWFjN8zIWxov4nR4LfrhTcbIWeRfylLGg+X5C+Q/gQXoAex5qjudgNusM6v3i//HNLfZTDWh9gIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264908; c=relaxed/simple;
	bh=gpWfjQlQgtGBMOL4SKHWzglIH5Q+S3RaWdfS52CQ/hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7v+gZgj7Q6UGW86GA1M2Dm7MGBNf8dVDFw6CwmnkUMJHppSg7yVWZLe918yORjQnHILS71L3GnbBW/DRTMliJoEV3zftGcjJ4SazjMvf/bgwwQv+nm7K3v7OGKKMxqmmJGpaav6JfKMcIEmVQJbksEveTeRXNtPmip8ZUnRpGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PbzuCbdu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=53fB73WF/zdRPDifklGT52RbsqQ7MAY+iG5T2ic3X58=; b=PbzuCb
	dubSao2U3CzgAAVtHrnxezaKAnzgGY0z6FBCNhOAxAB57W31xIbAIB3JYohp/dyF
	uHgjBctZRbUndY4aArhSco0kYUwk+5lZ58f4AZV+bs+eFZH7s4p9Ax2/m3kUpPLm
	1oc9bvCr7p2geFoEupB+SzcF+/dmo8PulqG2R40Eyl9evd/We7ehlNCQ6CPA047T
	vHEhik0ewZ9nRXi0syM7cT7go6fjHEncj05YWLkxcpadcjIm0dQfJrE9QZ3r2l9B
	b8dyIQl/HJYWt4biMX6T2RXkN+kh+W6SHX3DVp9c17t90ExG69fee+wXbf6UZr5w
	ROONv3wb/R4lATDQ==
Received: (qmail 3809762 invoked from network); 6 Jul 2024 13:21:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:31 +0200
X-UD-Smtp-Session: l3s3148p1@ZFHFYZIcnJBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/60] i2c: diolan-u2c: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:13 +0200
Message-ID: <20240706112116.24543-14-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-diolan-u2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-diolan-u2c.c b/drivers/i2c/busses/i2c-diolan-u2c.c
index b48b7888936f..c02459405b26 100644
--- a/drivers/i2c/busses/i2c-diolan-u2c.c
+++ b/drivers/i2c/busses/i2c-diolan-u2c.c
@@ -414,7 +414,7 @@ static u32 diolan_usb_func(struct i2c_adapter *a)
 }
 
 static const struct i2c_algorithm diolan_usb_algorithm = {
-	.master_xfer = diolan_usb_xfer,
+	.xfer = diolan_usb_xfer,
 	.functionality = diolan_usb_func,
 };
 
-- 
2.43.0


