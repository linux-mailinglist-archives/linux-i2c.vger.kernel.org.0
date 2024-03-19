Return-Path: <linux-i2c+bounces-2430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E15880AB3
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 06:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E18C1F22CCD
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386CF1B599;
	Wed, 20 Mar 2024 05:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmIx+hU+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650017BA1;
	Wed, 20 Mar 2024 05:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710912927; cv=none; b=GNBtbZJYpeSFost0+NBeiU9yMz4vJb3hPqQvDCctEnaSqlVgmqs4UYkPpmXkGn24sOVLernrW9NSlaSNp46YCg++DwvRSyQ2kt8chHjVqlewC7b9aBjX3Zxas/G2uqO2UMW6gXEqmvW4/NFwjR4RC7HcYoLo0gCEfB/XQn8FYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710912927; c=relaxed/simple;
	bh=Am4zE7z4HcN+wmSJsY3Azrgn2swXF4zvomMjAUCjKYE=;
	h=Message-ID:From:To:Cc:Date:Subject; b=iUjIX/vBqkLC0Vta35bwLTCs0gJA11yOs+qWyEZ2kqgpdntSfK96OoPczdxBsuxmEmsbhHNbbvZdt9QdyEwZQwjNLxWJDXYwawDw4XdFlMsnZgyKlKasPnxPZzspJxUUyo3dKGPpE4+OySQJRzrKU1G3MtNmJtwPfdXTlt77aDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmIx+hU+; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c8b777ff8bso160673039f.0;
        Tue, 19 Mar 2024 22:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710912926; x=1711517726; darn=vger.kernel.org;
        h=subject:date:cc:to:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fWtKmJ3MfVCnV+E74sqM2ekSX6lKZRkdLbepWZrZ6o=;
        b=TmIx+hU+wbltV/mR0gjmgfwSBBIOeNz/LwEH4WEoLM4+zvhTEh+j3kJAt1QovfqfK+
         BHSIR75zKIeZq+a1bQzSSv9BnlR2M/hahisY1z6i/O/nzX62BGHHUKSCFY+ER1w/yMY9
         i+ndWq8N6cs/V3AW2rDbgzUIIKfpz5VB8v5pmHMgoa+KvXzoTRHStBWPUKXm2/YVIvW/
         5aN5DQkIV4msTEuX1xRbCYkEx+hgTKCZbUYysjHeZVzo5mFb5Tvl6pgoDZX7h9iJ3RtW
         DnEo0e8GjGSH9PCvY40KfXRBMn1eMLUaAwbxCgDzQpa4xIRGlGcfVmwEY3Fdztl9ylxg
         9r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710912926; x=1711517726;
        h=subject:date:cc:to:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fWtKmJ3MfVCnV+E74sqM2ekSX6lKZRkdLbepWZrZ6o=;
        b=F6LUu99bkCLycrxSeoX8B9lsr7C+vSOQjJ+SpiYzqsVv7l4nF9NK95Lp3m5+Ze/1HR
         stJXUYvbvvjfNAMs5OuJ5LjwOj5b8OFXMujUsKRYb56kKoAEo/nClGjyXxzycE9CuCxM
         Xxlb5mimbagQMa4GLfkKbkJuR4WE8CkFDbp90CQvxUnRZEu5BELFX7M0XXJTY1oPdlsE
         mpKozO0cyu0+5oO2l5qHyXEprsjAmv0QP4DfYoTqnnfMPQGsu0pI6dtjkGDJ1UN2Xb30
         GZThPAM2DtM1ziaI8aOhwNYNZtkvpvZDo8iW3hnYmyr/o2xmSpuLjWFcgpp/P5HTMgKY
         bAcA==
X-Forwarded-Encrypted: i=1; AJvYcCWzdMuK8TNQMg7jkZmq2HnHlCw+Tgj4NcjupOQKNqG08OxFA6cHfjUiBZsjYtAu0vKbGrGaENjBsM/2lPGAJSE4xERPmkuxdlyIGvku
X-Gm-Message-State: AOJu0Ywe6FyoERJG8eIlZqSbALwRDx/rnVGuPct/NNyqM6vTNM8vrP75
	nSRwFsjc0QAOR/UyMvd+EqrilV+gAThY/8hFguVuPhfzcouZzGAG
X-Google-Smtp-Source: AGHT+IFKES2Uky1bgEuvMP9uVTfS556lGod7x+XvTY99r/zbRtvCkX+z+Y6EHGgnbRL1lsatJyU+OQ==
X-Received: by 2002:a6b:6a16:0:b0:7cb:ffe6:b320 with SMTP id x22-20020a6b6a16000000b007cbffe6b320mr5023095iog.5.1710912925663;
        Tue, 19 Mar 2024 22:35:25 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id q6-20020a5d9f06000000b007cc6af6686esm1679597iot.30.2024.03.19.22.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 22:35:25 -0700 (PDT)
Message-ID: <65fa759d.5d0a0220.fe5f7.1fa1@mx.google.com>
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <sam@turingpi.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Mar 2024 16:52:10 -0600
Subject: [RESEND v2 RFC 2/5] i2c: mv64xxx: Clean up the private data struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

There are many fields in `struct mv64xxx_i2c_data` with `u32` type
despite this not being the correct type for those fields.

Change the types to accurately reflect what is being kept in each field.

Signed-off-by: Sam Edwards <sam@turingpi.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index cfc16909fba3..bb048e655be7 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -83,7 +83,7 @@
 #define	MV64XXX_I2C_BRIDGE_STATUS_ERROR			BIT(0)
 
 /* Driver states */
-enum {
+enum mv64xxx_i2c_state {
 	MV64XXX_I2C_STATE_INVALID,
 	MV64XXX_I2C_STATE_IDLE,
 	MV64XXX_I2C_STATE_WAITING_FOR_START_COND,
@@ -95,7 +95,7 @@ enum {
 };
 
 /* Driver actions */
-enum {
+enum mv64xxx_i2c_action {
 	MV64XXX_I2C_ACTION_INVALID,
 	MV64XXX_I2C_ACTION_CONTINUE,
 	MV64XXX_I2C_ACTION_SEND_RESTART,
@@ -121,21 +121,21 @@ struct mv64xxx_i2c_data {
 	struct i2c_msg		*msgs;
 	int			num_msgs;
 	int			irq;
-	u32			state;
-	u32			action;
-	u32			aborting;
+	enum mv64xxx_i2c_state	state;
+	enum mv64xxx_i2c_action	action;
+	bool			aborting;
 	u32			cntl_bits;
 	void __iomem		*reg_base;
 	struct mv64xxx_i2c_regs	reg_offsets;
-	u32			addr1;
-	u32			addr2;
-	u32			bytes_left;
-	u32			byte_posn;
-	u32			send_stop;
-	u32			block;
+	u8			addr1;
+	u8			addr2;
+	size_t			bytes_left;
+	size_t			byte_posn;
+	bool			send_stop;
+	bool			block;
 	int			rc;
-	u32			freq_m;
-	u32			freq_n;
+	u8			freq_m;
+	u8			freq_n;
 	struct clk              *clk;
 	struct clk              *reg_clk;
 	wait_queue_head_t	waitq;
-- 
2.43.2


