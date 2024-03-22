Return-Path: <linux-i2c+bounces-2530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF1886D41
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A06C11F29578
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D5263126;
	Fri, 22 Mar 2024 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HjUJjr4Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D210B627FB
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114038; cv=none; b=RHz9UaJLlvMhIoQeuHPZg1uIl5v1scb8kNW3xUgVTzzmMwXt56ULV2N7hvHiWFi+q+nZM8qRx6zPVpEqZTe6ZCiMzuYFzP9AQC3NctOvUV0BkOQi0TQpIcEOIDfV+tOM/SVkCKisbsySe9rzxc9E9GfSp0lLhWgikqY56BKV39I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114038; c=relaxed/simple;
	bh=sEAELQLoQ2hS4arLKa+DxKB9SNqWtO4/+EZW54gUmF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1PYelWBn589fx9GQIIEQ0GM+2u+NFMxWQ9GxOEk7NnfDAeBEo9k8Cv2qWIpsMwaucsWrJMozT3uYr/1MNkMgysFMFm8K/hoj0FZn9mpL3jAe8zhBsq5nZcCt1I164u3DgDMfuTN8ZyqrTeqCjyuZC7jCX79vm2UFZqU5T2v/bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HjUJjr4Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PPIIXUWR6FyUlW8Np95mNAvjfB9Snsx3N+J9VU7GsLo=; b=HjUJjr
	4QmT6Q3K+DxUF+o40VvmZXna6ZaDyN7WH6JFnyPFMc01i4iDZgj6sfiUQOq7qvpo
	SJCnfdUEhiYOicHs6FeETZQkUjjvZDMjXWLLrif5O0nXGca/SVfM+GB2uffK6mSe
	MwiCICPkChXUVB3kodi0nm4UD/WPR07UDgA0zCmZSIqyb5YYpzj3WJHh3MvpI3RL
	TEQ5/T8IsaTPXXjq3vIH68Pdzl7xiECgnMippjtdsKZVTIprgqisK0RjOchEPF2U
	nU2EqvFr+p/Nq3xY3TchM2KcHPWJjdJcdF6lS51CCePFL9hYIKOkPbHgG65Qy1/Z
	acMaBsMpnI7IZCMA==
Received: (qmail 3871541 invoked from network); 22 Mar 2024 14:26:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:56 +0100
X-UD-Smtp-Session: l3s3148p1@UTIixz8UhrBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 43/64] i2c: pxa-pci: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:36 +0100
Message-ID: <20240322132619.6389-44-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-pxa-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa-pci.c b/drivers/i2c/busses/i2c-pxa-pci.c
index 08b3229c443d..6b3c6a733368 100644
--- a/drivers/i2c/busses/i2c-pxa-pci.c
+++ b/drivers/i2c/busses/i2c-pxa-pci.c
@@ -4,7 +4,7 @@
  * Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  *
  * The CE4100's I2C device is more or less the same one as found on PXA.
- * It does not support slave mode, the register slightly moved. This PCI
+ * It does not support target mode, the register slightly moved. This PCI
  * device provides three bars, every contains a single I2C controller.
  */
 #include <linux/init.h>
-- 
2.43.0


