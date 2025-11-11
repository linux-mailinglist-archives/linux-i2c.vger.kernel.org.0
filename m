Return-Path: <linux-i2c+bounces-14061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD6C4F3F1
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 18:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D3C3BD21B
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 17:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A2B369973;
	Tue, 11 Nov 2025 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jSl+qtrf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74B62777F9
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762882153; cv=none; b=RQqd+5wQq0jCpckF7xQS5j7efGvQ7jGGOsSsKxRlLyJJwNYuILJmOKTofMR6fWfYa+cS2gvf1Ox8qC5GmO5R0YYBz2AYQMf0bHRcAkNKBt4n27t4YmZqC4ABNb7yJ0InIxtaYZ3bV22xT00YYN4ZptDntP0XfIqm2KXlk0zmaHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762882153; c=relaxed/simple;
	bh=gQYNIkSoCQveyq8iBuUJfu1k6BgkhGy1r4EA1K90qGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jGPnuypWhCJtG0aETDfg1v8CyUQAILO6REumCr8hVOilhqRk461YCfXpbSTH66bQycuXj/UsSRwne/8MnGEsNNgWw4OZJnTlh4EEHiaDSviWbb6/ka94XHdECOx1cWv/ZPTW9F5X5e63lzh1S0ZOqd99KLOs82/IjxI8I25+Yak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jSl+qtrf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=NXuG5V+4H/BcLr
	lXoGV2olghbOB0oz7oy18xZHZqYbg=; b=jSl+qtrfW0dt6/YoW1/BX7zOEfDiCt
	B8jkt340mjAjAAh8KR+vN2A3mBA/1va1XUsJce0cy8hwRux5Bpcpf2VmidQcU+JO
	XOQ7+/4fj78vRfxLEUnlh07zmJQkUdEZh6ma9yfzWIE1QMY5uYYKEmo0WOsjMUfi
	81tEepoetxPfGAGdcTc8eLvQLFkr5e4hu0reETHLre1S7dwgWA9hg8C9/80x8UWR
	zShxdYH4Ai/dU2wL9r+MKNLpXdCnqPLZQiMOxUjUUWWvaItxfwDGtvsssD2lLllb
	lVP3X6tydT1s+5DG4sfZEYm9hD3UhBRuhxXIchj51DTSnSu9dVMoQp+g==
Received: (qmail 1192095 invoked from network); 11 Nov 2025 18:28:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2025 18:28:55 +0100
X-UD-Smtp-Session: l3s3148p1@A6h5+1RDXroujnuF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools] Makefile: allow installing perl scripts optionally
Date: Tue, 11 Nov 2025 18:28:43 +0100
Message-ID: <20251111172843.471954-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c-tools are used on embedded devices where perl is not installed and
rootfs size matters. Allow build systems to skip installing the perl
scripts.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5ac8a59..a0d4269 100644
--- a/Makefile
+++ b/Makefile
@@ -37,6 +37,7 @@ SOCFLAGS	:= -fpic -D_REENTRANT $(CFLAGS)
 BUILD_DYNAMIC_LIB ?= 1
 BUILD_STATIC_LIB ?= 1
 USE_STATIC_LIB ?= 0
+INSTALL_PERL_SCRIPTS ?= 1
 
 ifeq ($(USE_STATIC_LIB),1)
 BUILD_STATIC_LIB := 1
@@ -56,5 +57,8 @@ all:
 
 EXTRA	:=
 #EXTRA	+= eeprog py-smbus
-SRCDIRS	:= include lib eeprom stub tools $(EXTRA)
+SRCDIRS	:= include lib tools $(EXTRA)
+ifeq ($(INSTALL_PERL_SCRIPTS),1)
+SRCDIRS	+= eeprom stub
+endif
 include $(SRCDIRS:%=%/Module.mk)
-- 
2.47.3


