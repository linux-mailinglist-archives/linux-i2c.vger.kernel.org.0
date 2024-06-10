Return-Path: <linux-i2c+bounces-3940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB5901C94
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 10:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 937431C214AF
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 08:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F32A757EB;
	Mon, 10 Jun 2024 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fOJ3ANdm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5574171B45
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007042; cv=none; b=ImKTMxalN0nzNlduWGk2qmCgrjPM8tFVaut3yw4CN/poRCEVxOhrijHpdBOWRevLFE8OAiiJV+qqrYEBKqCkhwkCxsdONV0nRvJkvxVSg1Bz29dn4Jyesb5wDJL1Os4kVcoeDGKutFF+vB7H93lph4NUasUq7AgaaXqC0luBZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007042; c=relaxed/simple;
	bh=aSoXwM7AxjCYi4o5UPuDejbH07mKDQ5JXUxoQO258co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gppvtglDxM2rVy2aGLHm7DQSA/o0+Ssv2ff3uSaNptwWTImkGyTKCMp7NzL30JSsS0QiwYN1IXnkPMmweYM78GMMNaCnADmjdPQXn9Ulio8Cgl6TpftTfMuVZpn2HW2lu826E/e23WoUr6LmD1WAoSW+IaLEmudd28tvRD/RFmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fOJ3ANdm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=kPW6Z47SSMaFsqhDVQlxCvLx2hDU95KMb1LtJY99czE=; b=fOJ3AN
	dm6uYbD0EqFZCVW6nM5mULOgyWm4UJXZzb3h27EK1RrPcVFoR2gHpYDBe3cH0Onc
	X+LgIu9H4wkOzDMwNPok/lwTreUOkjMqCfbQi4sFvXJGEFm8XtkkvemNqaXnn7T2
	xwGfAtUAP+dH7NIAUGU6ve3VZ461n2i78NN2HnzPuzX4GPvZq68VbJAoel9k+vVV
	EqU8slceu/iCe7lXzz4+4Ne//uVOawJhi5UvfvLaXzmxsZzt8xfiVRF0We4Ntxla
	RvSujTwOMvGPhwPA7Pr/7gXAI84nvOqYEawnDpAWqnSMgGe44q9TS09DfbB1sePi
	9wCJX/HqbmNuOWgQ==
Received: (qmail 4192516 invoked from network); 10 Jun 2024 10:10:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 10:10:29 +0200
X-UD-Smtp-Session: l3s3148p1@Kmi0roQa7OYgAwDPXymAAHMyzy0c7Kdl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] docs: i2c: summary: document 'local' and 'remote' targets
Date: Mon, 10 Jun 2024 10:10:20 +0200
Message-ID: <20240610081023.8118-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
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
 Documentation/i2c/summary.rst | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index b10b6aaafcec..203f6c9b2472 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -49,11 +49,16 @@ whole class of I2C adapters. Each specific adapter driver either depends on
 an algorithm driver in the ``drivers/i2c/algos/`` subdirectory, or includes
 its own implementation.
 
-A **target** chip is a node that responds to communications when addressed
-by the controller. In Linux it is called a **client**. Client drivers are kept
-in a directory specific to the feature they provide, for example
-``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
-video-related chips.
+A **target** chip is a node that responds to communications when addressed by a
+controller. In the Linux kernel implementation it is called a **client**. While
+targets are usually separate external chips, Linux can also act as a target
+(needs hardware support) and respond to another controller on the bus. This is
+then called a **local target**. In contrast, an external chip is called a
+**remote target**.
+
+Client drivers are kept in a directory specific to the feature they
+provide, for example ``drivers/media/gpio/`` for GPIO expanders and
+``drivers/media/i2c/`` for video-related chips.
 
 For the example configuration in figure, you will need a driver for your
 I2C adapter, and drivers for your I2C devices (usually one driver for each
-- 
2.43.0


