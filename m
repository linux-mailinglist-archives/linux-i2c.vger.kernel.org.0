Return-Path: <linux-i2c+bounces-6395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B839715DF
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 12:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5981C22E4C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 10:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227C51B5335;
	Mon,  9 Sep 2024 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LTWq9Lo8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A425A1B5EA0
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879524; cv=none; b=TLfQLfYSVdwnpCnEyNH0whl+KGnI2+kSScXjP7LYQgo00sO7ogLJVZ7g2ZM1DMQBV0zWo7iI6J7W6/xoNKxUIw28LkOS7ZDoqcdtZFQA52C8cqSV1PH+yjh0TzEiFExkvjxxB8LIm9rRwJ7se2/QpDNvecjZBg0AjTRI1Y/GdVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879524; c=relaxed/simple;
	bh=4ffm+7cR1ZRKXI4mD63W8SZwQQnR+sPYghebbp8Yw6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bnJTgI7pjxOhvqzpPdaqhZRypgD4H5co+jzxMd+xe6k91wVWfzmELLophtk0Qd0Hdf1e+VxINnmmnKdZ/Ef5IgUQ1U982eBCxRvLB0SvCWVje1QJJeZI3IQFTniEOCAucgwdH94C6oVsQ0VoFGiY2Jq7XdROsIJ++sUvnOZexXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LTWq9Lo8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=+SZh6Xd3HzMOgs
	tqqLmZpchNLWCCiq+A1Oa+4OeKqug=; b=LTWq9Lo8xGbLjUOZbef7YIF/xH5QRC
	JFUeljW/Mn22obZLzKdY3ho3LpOt1b6YNJwkk+C+z07lLhdzAYKiGciZ9dcAZpxC
	CtR8dLvA8YhW/ep33QQ3/Njev64TOx1GfJ8UH+ONGk3pfvKmZMsPrs+Y1H20zAF7
	y1+Dgo3H29DxTWg/hqLxyu/4TtEiRtBIv9vFV3RsNO2nHz29Snz8GGb1s4gjGd93
	aqHpw2mqE2uAeYPouPaNVSkKkpu2C9d3CcrXebWxJ6dVYLUTX9bFbCu1hLn0yLNh
	uPnP+qOUFXiehj/KDuLevTCwC20Xl7dQssFTgT4+ousNlAV4l24FP/EA==
Received: (qmail 2045066 invoked from network); 9 Sep 2024 12:58:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2024 12:58:38 +0200
X-UD-Smtp-Session: l3s3148p1@QaGeo60h0JQgAwDPXwlaAFpYOMUD2VTJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH dt-schema] schemas: i2c: add optional GPIO binding for SMBALERT# line
Date: Mon,  9 Sep 2024 12:58:35 +0200
Message-ID: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most I2C controllers do not have a dedicated pin for SMBus Alerts. Allow
them to define a GPIO as a side-channel.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 dtschema/schemas/i2c/i2c-controller.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index 97d0aaa..487e669 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -135,6 +135,11 @@ properties:
       use this information to detect a stalled bus more reliably, for example.
       Can not be combined with 'multi-master'.
 
+  smbalert-gpios:
+    maxItems: 1
+    description:
+      Specifies the GPIO used for the SMBALERT# line. Optional.
+
   smbus:
     type: boolean
     description:
-- 
2.43.0


