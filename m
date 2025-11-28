Return-Path: <linux-i2c+bounces-14335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C686C91B1E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 11:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6F1D2342EFE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 10:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB4530AACF;
	Fri, 28 Nov 2025 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fsI5icq4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5BC2D7DF2
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326555; cv=none; b=aTdSYR/L71XFl8s4daYhmohOKl4wDWgZh0eCiLb+K0+5Z2VSnbUuQp20NBXiqGSJIJDcP5bu2upowHPJBT0LG5jtGo9ZPWAd+nuhRPKno2+2jnDjmkDLPLN5ej5YaQQG4mWfVXzbg7d/i38dGZpsBAeXE17/cFGRl59jrB5KqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326555; c=relaxed/simple;
	bh=1bt3tnVRrFnal0co42eg98ueduuvUTwmOowoGaRrs9E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aa0UGf6Tr4MN7sTY3mPzvhwMYxxef6rupr7BRiQc4uT3eDaauX5D+3FDdlTQh3F7MLhhSVdqjcYAnfM9IjswRYai5YGfMGb71252PntcFzOu+SGVBW1GBduc0ae4Ff2Dzt8/tBWvr7kQ6ArTy3mrFeC/0vh8yebmQmlQI4kkvIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fsI5icq4; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8D236C16A3C
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 10:42:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76B5A60706;
	Fri, 28 Nov 2025 10:42:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58F77103C8F88;
	Fri, 28 Nov 2025 11:42:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764326549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=u1f/P+uMXdR1sNcwYstUdtD1PR3YKkZSgGwzXQdlmmQ=;
	b=fsI5icq4Sv8Hp9yoqsfjLP5k3+WvA+4yo0MHrhhoKzX2o+FUlM++PkdaX7FyGvqAzPh4A5
	wGgqwpMqNGY6mcNElMguaq5XTu1inAu/YDpjtvf+o80onYrJCyY6IWbJkZtzOlk6P19m4s
	cT984yS/xJGz5bLKK3c7oXW+0waWnyd5HArnT7q2jjmvNQbS0b33NpbseYgR6Mqzl5QbQX
	fNlvEAJ5SRaId9wccUFlrFBD0cSD078iLb9ws9dGA7nMUIhleb2UDcM7STl+zglqwyFjyT
	n8TINbI0isbL2nGJh6xtRQGX3O3iX26yvHk+VIYt8YF7m0aH12UcsFbx2gc+Tw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH i2c-tools 0/2] Add support for message modifier flags
Date: Fri, 28 Nov 2025 11:40:08 +0100
Message-Id: <20251128-msg-flags-v1-0-6353f26fa6bc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAh8KWkC/x3MSwqAMAwA0atI1gZsRPxcRVxUG2tArTQignh3i
 8sHwzygHIUVuuyByJeohD3B5BlMi909o7hkoIIqY6jGTT3Oq/WKpaORnG0tUwOpPyLPcv+vHoQ
 mPENYFYb3/QDT1sYBZgAAAA==
X-Change-ID: 20251127-msg-flags-3d2b2da9ae28
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I2C messages can be modified with a set of flags covered by the protocol
mangling and the skip repeated start functionalities. This series add
support for such flags to i2cdetect and i2ctransfer.

The first patch shows the support of protocol mangling and repeated
start skipping in the output of 'i2cdetect -F'.

The second patch adds the parsing of optional flags to i2ctransfer
message description. Those command-line flags then set the i2c message
flags alongside the read/write flag.

I wrote these changes to test the insertion of I2C_M_STOP flag in
multi-message transactions with i2ctransfer, but the other flags can be
useful for various test scenarios.

The patches use defines that have been present in the kernel since
v3.6 released in 2012. If compatibility with older kernel is required,
we will need to wrap some of them with #ifndef ... #endif.

Maybe a minimum kernel version can be documented in the README?

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Benoît Monin (2):
      i2cdetect: Display mangling and nostart support
      i2ctransfer: Add optional message modifier flags

 tools/i2cdetect.c   |  4 ++++
 tools/i2ctransfer.c | 34 +++++++++++++++++++++++++---------
 2 files changed, 29 insertions(+), 9 deletions(-)
---
base-commit: ea51da725b743da00b894dfdc4ab189f5a51e90e
change-id: 20251127-msg-flags-3d2b2da9ae28

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


