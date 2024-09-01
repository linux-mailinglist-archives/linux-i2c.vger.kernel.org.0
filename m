Return-Path: <linux-i2c+bounces-5976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 913699675A4
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 11:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40DAE1F21B39
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 09:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DA313C66A;
	Sun,  1 Sep 2024 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bdXgaXOj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A54A1B
	for <linux-i2c@vger.kernel.org>; Sun,  1 Sep 2024 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725181356; cv=none; b=kZyiliz3+UfRA7nGCaXfuwKPlkpq35CbvHRFPecsNIVWFjNKlh6T1nBJlWp1qPBU/Fm9ZI3CiHtshL+vPIvLfkllGu71XNiwUkkW5RflwfkHXcipfRvvdVeA/OJoumRPsDW6sbobH/0gifGEv++EMwjpXil6p/8uruRDJfC5KMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725181356; c=relaxed/simple;
	bh=oFLOXNDDklgyTqcduEsEbJhkUfMSyhfd6kKhmXj0RxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u8x39u7+YgzGKRFtbcOdqOkdIcBSXv2OdCcA4uyhb1VYIuQbwlkB4Vnm2/mR/3wn0sT0C42lrV8K0Cwbd7B30+e6vKxF7ioYYCOp94ue4dfKU5fmquDqUIZd5MVjmvBp7mNdiGVTWLLEAweGBtPczTkupXfk10dBajQWIlAIiUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bdXgaXOj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=DNAAyzq/RftJ9D
	1dVVcs6SxeUfX7OTPrIA5ni+CVLgE=; b=bdXgaXOjC9ZK726EikXV2xiT4WGmne
	h1/4AcBcE3EHLMaWg9fW0AjGi8FBxDGkzRHzA84Kmd3V8jmleeRtoXVNQDoWFkP8
	QVXSRtxZK0OO2RpiW67UujEuEbWzH7VC9huFYv03DqX+KKDdztdP/fgN/ETXVu6Z
	aQXhqzS6vypmCkpS9qg2Tl58wQ8l92l+vavXk9xkjRq4hmH5xeHGD069S+67mr/5
	VX4hF2KOI7UhT+3hiGqhoTL6ZQhvzWge6KRGVFQWs+0/COkJsDzhrFmnglJ3Ttdm
	D4O2QSCNskEJDhlN9Ntr45TTd7+ilEc8yWjmbjD4/zHTnCq1ubrqt1kw==
Received: (qmail 3758735 invoked from network); 1 Sep 2024 11:02:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2024 11:02:27 +0200
X-UD-Smtp-Session: l3s3148p1@XEFaFQshnsxegkeE
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Corey Minyard <minyard@acm.org>,
	Jonathan Corbet <corbet@lwn.net>,
	openipmi-developer@lists.sourceforge.net,
	linux-doc@vger.kernel.org
Subject: [PATCH] ipmi: docs: don't advertise deprecated sysfs entries
Date: Sun,  1 Sep 2024 11:02:11 +0200
Message-ID: <20240901090211.3797-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"i2c-adapter" class entries are deprecated since 2009. Switch to the
proper location.

Reported-by: Heiner Kallweit <hkallweit1@gmail.com>
Closes: https://lore.kernel.org/r/80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com
Fixes: 259307074bfc ("ipmi: Add SMBus interface driver (SSIF)")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/driver-api/ipmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
index e224e47b6b09..dfa021eacd63 100644
--- a/Documentation/driver-api/ipmi.rst
+++ b/Documentation/driver-api/ipmi.rst
@@ -540,7 +540,7 @@ at module load time (for a module) with::
 	alerts_broken
 
 The addresses are normal I2C addresses.  The adapter is the string
-name of the adapter, as shown in /sys/class/i2c-adapter/i2c-<n>/name.
+name of the adapter, as shown in /sys/bus/i2c/devices/i2c-<n>/name.
 It is *NOT* i2c-<n> itself.  Also, the comparison is done ignoring
 spaces, so if the name is "This is an I2C chip" you can say
 adapter_name=ThisisanI2cchip.  This is because it's hard to pass in
-- 
2.43.0


