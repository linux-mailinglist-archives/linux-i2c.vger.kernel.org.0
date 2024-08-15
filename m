Return-Path: <linux-i2c+bounces-5441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B88953CCA
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 23:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 200CC285D49
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 21:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB7215383F;
	Thu, 15 Aug 2024 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z6zDSuVj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F414EC7D
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 21:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723758019; cv=none; b=UnLG8RJAYCC9W3VePDBX5PvltFOhwRQkNW1DVAQn1vNhsStv47A0LcQDmY5U9nuhQjfDwKDqgSy+95497WlBI1og2EGhSenDESKgMtvgV2YTaeZNhcnBsxxdNQgygwRijOuoha02P2YWUsUJwawt8LLT6aluJcZqD6ETbc9YqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723758019; c=relaxed/simple;
	bh=2MED1jBw+Hc1lSdAWZynFsgB1k7IXozgIvLSzMA1Lts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFfgfYm+cy6EYUF/kJ18BkFZTK+416ZFBCnnkJxOFXo4fl9gf0RpanPVHyrY2zBj0/Q619WRMIMeG36PQAxdGgiJN6/nmvejPZRICTUrvr+Fx/yjEELuejRGnfocDd8DGEUB5z+gm1SOLzl7UzzLHHaRe53Ltr0SwzA9cxuYWXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z6zDSuVj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ViA3Mk3fR/Sm00+jfPS2M9yvOzEGe6KD8x0Qw7mz9YU=; b=Z6zDSu
	VjgLHmx50mcA+7mCpqC0wQRVmBY3R6JDXxLHBN7cg5Bia3TPj+drKA1AaiZmCyvI
	LtwYH7FOroZo2UcEJ6IRM1O5QsZnhlkYpe8oD3upaHlP2lVFCFXtgijRR9DpQ0ql
	rRePVFP9E8V41V/ijLg3IBcsmcH45DASqtFWICZh4jveF/N0bXoOpTRXbshxbvoP
	LGwaIoq5LQld+bAOwMk55MBZCS2Wrktd8mndvPIR7kNfXKy/fLWjT/1P6XBwZVFR
	kmsCN10fxQk9ga3prpYvt0NWQLeJU5OqSXUWKD4BTX3b5V96AalipS/e+bVvlKdb
	PgZnykMpD9lV5Weg==
Received: (qmail 2404103 invoked from network); 15 Aug 2024 23:40:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 23:40:15 +0200
X-UD-Smtp-Session: l3s3148p1@TB8wsL8fdKsgAQnoAH4zAClVBN/DeGcx
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 dt-schema 1/3] schemas: i2c: reword descriptions for inclusive language
Date: Thu, 15 Aug 2024 23:40:11 +0200
Message-ID: <20240815214013.6519-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>
References: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>
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


