Return-Path: <linux-i2c+bounces-5423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA16952DE3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 716D31C20AE4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 12:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1341714AC;
	Thu, 15 Aug 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Rhwn/nou"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A781714DB
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723785; cv=none; b=o4fHo6XUaPy+f76U/PQ2hrWpbK+1uJcg6RPPQiDhRr6XxMjfXdlANHz2RzmPmvv+4KUsT9WQX6oIh4R+hZ34yYb0G71k+H93xfUmuug51Cgbt5Vq9K99jsE8ZX7TTeGQgKqUfcQooGUkZQcZTHg6kOaBogBsnQtge5nlNrUsFOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723785; c=relaxed/simple;
	bh=2MED1jBw+Hc1lSdAWZynFsgB1k7IXozgIvLSzMA1Lts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPaO8dy0GsFSGS9ts7vnAPJRFDDivvxvGERFkZDHfVV+7ETpJbdlxcnISScn0AqI3ED53BvpqXikrYXwsn0IpZRsqwFqdoUODRxOEOELm4O60siL6FBDAGsjgbeor9f6Rm4m+J0jSmTxYP4GZ8vcwI+0WuE7muvGVI8tNNTVsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Rhwn/nou; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ViA3Mk3fR/Sm00+jfPS2M9yvOzEGe6KD8x0Qw7mz9YU=; b=Rhwn/n
	ouqeQ0xVKIeuy6RmAsWIkxQ/ZGx0hzum3SIpNSgiev1Zj9VyKYWwZOAwQPg3uirl
	b5rUzp+gSUdXClHGvg5KEglBzKlPsdj3RiS/rSMg/UMOJifWcR+0EBXQNg5+Bqa3
	3HbNKr8FjyOYOwvD0W8Rn3bw6jSagQZMPCGJxnkuZDrCH2uYCEU7voF/H3K9UZIW
	15aNNJNLxKCwQ4ejIVltKCAjLJXVQeny/YpOk3dR9g3xnj9hQZRhjXqS5KT666FZ
	dsaVmbnm2x7ZZqufV5sYgG6VACXEs2IIEgWsh9k4L/VtLv9Z0OpZ4kHkRbI8lVtZ
	Uuj9Oa7Ij3frCAKQ==
Received: (qmail 2281982 invoked from network); 15 Aug 2024 14:09:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 14:09:38 +0200
X-UD-Smtp-Session: l3s3148p1@VCZ9t7cf7tBehhrc
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH dt-schema 1/3] schemas: i2c: reword descriptions for inclusive language
Date: Thu, 15 Aug 2024 14:09:33 +0200
Message-ID: <20240815120935.5871-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing bindings is hard, changing descriptions is easy. Let's start
with the low-hanging fruits and use the official I2C terminology (as of
specs v7) in the descriptions. Drop a superfluous 'a' from the
description of 'reg' for targets.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 dtschema/schemas/i2c/i2c-controller.yaml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index 9670082..e475ead 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -99,7 +99,7 @@ properties:
   multi-master:
     type: boolean
     description:
-      States that there is another master active on this bus. The OS can use
+      States that there is another controller active on this bus. The OS can use
       this information to adapt power management to keep the arbitration awake
       all the time, for example. Can not be combined with 'single-master'.
 
@@ -116,9 +116,9 @@ properties:
   single-master:
     type: boolean
     description:
-      States that there is no other master active on this bus. The OS can use
-      this information to detect a stalled bus more reliably, for example. Can
-      not be combined with 'multi-master'.
+      States that there is no other controller active on this bus. The OS can
+      use this information to detect a stalled bus more reliably, for example.
+      Can not be combined with 'multi-master'.
 
   smbus:
     type: boolean
@@ -155,7 +155,7 @@ patternProperties:
                 - minimum: 0xc0000000
                   maximum: 0xc00003ff
         description: |
-          One or many I2C slave addresses. These are usually a 7 bit addresses.
+          One or many I2C target addresses. These are usually 7 bit addresses.
           However, flags can be attached to an address. I2C_TEN_BIT_ADDRESS is
           used to mark a 10 bit address. It is needed to avoid the ambiguity
           between e.g. a 7 bit address of 0x50 and a 10 bit address of 0x050
@@ -172,7 +172,7 @@ patternProperties:
       interrupts:
         description:
           I2C core will treat "irq" interrupt (or the very first interrupt if
-          not using interrupt names) as primary interrupt for the slave.
+          not using interrupt names) as primary interrupt for the target.
 
       interrupt-names:
         anyOf:
-- 
2.43.0


