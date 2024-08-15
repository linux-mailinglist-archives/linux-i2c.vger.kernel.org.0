Return-Path: <linux-i2c+bounces-5421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C5952DE1
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 001DE28591F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 12:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F0517BEA0;
	Thu, 15 Aug 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bVteA/AI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D5178CCF
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723785; cv=none; b=gGuhH/4bIscjYRf/bCF35BxsXDgPj23iEx5GLpBW/vr4JYbA4Z9tWajzrjTHxx6u7V5sVx3UnQr1N+YJIgZNqcOI5xabY4HAM0NT+hrTlcG38UWFIt6ag+KOBz1VzIaTAqq6UmRAlPRiBHAVzQCll4JOlWK9hqTOIzMMdtTsJII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723785; c=relaxed/simple;
	bh=44kl0z06S2x/PWPhuzeYSl3qiUMX8i8lLxTDjQoF3JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzojSlsPVskjc0k7JCueSInARuZqCZVtDshYwsObiW/nYf/jkm9Qvc+aHuoOzEl0y9qL9LYrLGoYKiqsU6KWQAb4QrI7j7PxC0CNWgL/QynOYLQ693yYLJYwQRqE+bQPGzb87oNszrFecIuwLiSMLcfxuiBRUcWAikdRqZe6P/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bVteA/AI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/fKIt7Q9Jn3u+qQ0WbuTYmgz3YNwoS3GoG32xXp/zMM=; b=bVteA/
	AI8g6hocgM7E2Muya8lZD6hH5wuh5z329k9SbLMxVAOAdCJ67BJXbr+BlfmdvWRW
	ub0ntK1YfXyUUUNQOkVw5iwK3zqZByRFJPBMRqchQkhj7+M+JrCWbMAsu8rm4H7C
	QTV4E5k4vcpB3RRYV9t93m/y0+LlM494JkzMKZ/qFa0yWVH9LQOc3cWkTDSmi92J
	de2c9hsWKv4RrHHm9PJVx4tvFFQzuEN99M8lzP7RQfCf3fiQtODTd3u7Q/83a9WU
	o010SCBkpJnWrnSfmudXBoh4JGZpABz5m5g0ERYPKBEsS23H5D89thv5rCifesRj
	XbDBM0RDOAIpNsNg==
Received: (qmail 2282006 invoked from network); 15 Aug 2024 14:09:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 14:09:38 +0200
X-UD-Smtp-Session: l3s3148p1@KouFt7cf+NBehhrc
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH dt-schema 2/3] schemas: i2c: clean up interrupt descriptions for I2C targets
Date: Thu, 15 Aug 2024 14:09:34 +0200
Message-ID: <20240815120935.5871-3-wsa+renesas@sang-engineering.com>
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

Schemas should be OS agnostic, so don't mention what the "I2C core" will
do because this only applies to Linux. Also, drop the generic
"smbus_alert" naming because this belongs to controllers not targets, so
we don't want to describe it here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 dtschema/schemas/i2c/i2c-controller.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index e475ead..7eb6b0f 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -171,8 +171,8 @@ patternProperties:
 
       interrupts:
         description:
-          I2C core will treat "irq" interrupt (or the very first interrupt if
-          not using interrupt names) as primary interrupt for the target.
+          If not using interrupt-names, the first interrupt will be treated as
+          the primary interrupt for the target.
 
       interrupt-names:
         anyOf:
@@ -181,10 +181,10 @@ patternProperties:
               enum:
                 - irq
                 - wakeup
-                - smbus_alert
             description:
-              Names which are recognized by I2C core, other names are left to
-              individual bindings.
+              Generic names are "irq" for the primary interrupt and "wakeup"
+              for the wakeup interrupt. Other names are left to individual
+              bindings.
 
       wakeup-source:
         description:
-- 
2.43.0


