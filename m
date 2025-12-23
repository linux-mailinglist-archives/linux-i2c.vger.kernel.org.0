Return-Path: <linux-i2c+bounces-14731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75733CD96C9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 14:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4580130133B5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AD2339B41;
	Tue, 23 Dec 2025 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BzHsGRcC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C7C1A9F88
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496177; cv=none; b=qWV0uSOrbbydTxfZ8oWUeaR6EJiZXIZxaM9da+yDiIrQ/Gj3u1/kmQZxOYIJQRtNLSvBxa4bKFObChXUTm8G5+41omG1gcpr/HBBmUn36BPy9g+oeLt/sSmPvXfC54DKSI9hpj6mYPl9wQuv/aT1hebcCwnM2hhIZq5wtNRO5QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496177; c=relaxed/simple;
	bh=u46TRZ7VpztXpK+GEUqe+KaKbRJWB5Kyei/eWrswsmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bmRE/FIYj0c8BSJwSdQvGLerX648ayfMbEnZQcGlhemHh3cgO3kh2UdhloSu5BkvjOYzEUCXHLP2MUXTH6wr7oj+ERxhAf8FuSRvUfGCy3SbtL+EsHULdzwz69ptOkn4mlKb/LUJINcOY5m62eQuXupcLTsubCK6cvt373cfyMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BzHsGRcC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 003BE4E41D5C
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 13:22:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3ED560716;
	Tue, 23 Dec 2025 13:22:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B74CD102F0BBC;
	Tue, 23 Dec 2025 14:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766496172; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ALf1bE5D6OFfRstiAapWOEo4FDHa1F/7w/YULAeoZVs=;
	b=BzHsGRcCf8W4vx8Tc/IPq2p1BTh8Qu5iegADTlXJmLOHQm8IBZ0SuRtXe1Hjm5B+ATA/5k
	+b9Dr2mtJ0oWl0JvjanRcERo2fVp3nXvfAW0C2tCZP0T41Af3KrN9S4xImXnLVslB/zXJI
	n2G4WRaTPNbGNxseFQ9V3ZuyNs9RWCEE7pXm54zCht7Qt/pv1zCPkRWTkGDRMoDTC3Gv+E
	TWqk9uPD6xzuNiF2zvlRdea+f2AOS6WqBzz3YCxgviFFGFKtVU5n95tMluC9VWOxLXFRnN
	pc9l81Q+CEwSq5Z74ozpt6iCx9vZ1dYjLmmF6uhhIPebFVLlkzIfpylvI/ZWGA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH i2c-tools v2 0/2] Add support for message modifier flags
Date: Tue, 23 Dec 2025 14:22:41 +0100
Message-Id: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKGXSmkC/02NQQqDMBBFryKz7hQzorVd9R7FRYyJDqgjGZEW8
 e4N0kWXj/94fwf1kb3CI9sh+o2VZU5AlwzcYOfeI3eJgXIqjaEbTtpjGG2vWHTUUmfv1lMNyV+
 iD/w+Wy9gcriKjApNmgbWVeLnfNnMKfyC9V9wM5hjVZRFoCrYqnXPVmQdeb46maA5juMLPYWZk
 a8AAAA=
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
Changes in v2:
- Document the flags in i2ctransfer.8 man page.
- Link to v1: https://lore.kernel.org/r/20251128-msg-flags-v1-0-6353f26fa6bc@bootlin.com

---
Benoît Monin (2):
      i2cdetect: Display mangling and nostart support
      i2ctransfer: Add optional message modifier flags

 tools/i2cdetect.c   |  4 ++++
 tools/i2ctransfer.8 | 26 +++++++++++++++++++++++++-
 tools/i2ctransfer.c | 34 +++++++++++++++++++++++++---------
 3 files changed, 54 insertions(+), 10 deletions(-)
---
base-commit: ea51da725b743da00b894dfdc4ab189f5a51e90e
change-id: 20251127-msg-flags-3d2b2da9ae28

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


