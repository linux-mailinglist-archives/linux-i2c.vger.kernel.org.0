Return-Path: <linux-i2c+bounces-9650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3522A49D12
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC27F1886626
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDD9271816;
	Fri, 28 Feb 2025 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kfx+Y2uq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B7270EB9;
	Fri, 28 Feb 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755864; cv=none; b=SrhS3SgTPDKDjAiyYCk3FRwD1looCz0RO+5KHCfJ6U5Z+vrR6TYjbiAczOR02KKkksWiRcxpKie2BkR3uRsa9j/SG2fo6dNEsnwTQJpqbcL7Ohj6M5A6eZ6M0BtgX7zr5m/QDzIpyyUyr03OsXmxb95OPjmjQhbHOmU1uXKW1+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755864; c=relaxed/simple;
	bh=PISapsmI9qRM5gfeVkdF4JKCyiQMUadO3rWiMlD7RFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAuhc82GS9yetCmOVnTwBDyaKkNZxYH3mZm58FxJKy7Y68Krvi3MV8jb+bYNPSUIvpbqRA+VMajpNUSdf0bL9Nyk6EKLPJfv/BnQ5V8NxzR5eGqFjyY1/9/BpkVFNKwQstXs8ur+Vxc7Mxqc5azQP4FFUklJgVO+4jsVKLlnnkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kfx+Y2uq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948021a45so20943745e9.1;
        Fri, 28 Feb 2025 07:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755860; x=1741360660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02Nk7Tu7oSWRbXywdmWr43MleXDMMaL38pYc/cnl7sc=;
        b=Kfx+Y2uqOeSYkCYg6i7Z7mz+wCagYaNAWzUQaDuMdUnFFQ5GThC2FfqDslSRy6xBpr
         4uPzxk9ULoeFbS9zXfAxmafaUMOjzePKs1NxErmLYlcJoitGqU36K0N9wtW+yDb5zDy0
         n5CaC4tXyf/c5MsFJaW8xmD7KRkNo7RTblewDrcELjQyM6I2f9eUywORjZAOceAi/Ctr
         pPmTfk+yEvrql3TCPSwpvzEOFe5CBMRySvdzdfzx7gH4+pTQBLutJIkZEtyCbGmsMZP9
         0aPUtBHjCcHR+MWXLBSql70h6HYKBaUPnleWAU8ljRIhF37H3kMKbjE2+HCbCkRCCptf
         u2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755860; x=1741360660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02Nk7Tu7oSWRbXywdmWr43MleXDMMaL38pYc/cnl7sc=;
        b=mLpKMReayU0vS407AwogwNnShUn07q1oFlkYd01tVZw2J86Kjb0ZnqRNX2VHyx6u+L
         3X18KeYLjyPen3I8hhKbW03XVg07tXmz0UXkhlkNLx2vxpXT75NiB09f9dSkllQQzf++
         LYeZgMftxYYp3EpK2GcRDGsD4UDCxZsI1MAipyeVbyhDvYLeoQOpqpWG2E0/44SQaJo8
         /tJ5QhoLtJnI3q3Mghdrq9H0dg20KFr5sPjLDDuP5HUMEYfpwfXPUv76uwguUQgQE1DM
         sJewOkdXGd9gmgc2ZPwYRmW8ahVR9MQZmwc2RkbOGU4lrNwqwqVEKb2vWiwLZlqkiWOC
         w7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVb1Esf95XSv6eHOqEFh0gOCjqVJdEtc6BajbLG+E71o/XP5XgJlDRav9mFAjYfFy/d30utDZz4PTBaa3c=@vger.kernel.org, AJvYcCWEcGZylbDgj/hUWDb8cnvvM1ypG5QUwUfXOoUrGvchdPL4XyV2N/vUdlKYPkmw3Q2yy7nMYUKR/nw=@vger.kernel.org, AJvYcCXf2jVrgJJ+egj2NQ84HQNAMTStpPYIundu4iCw53AArXP/EuxmIpfXT9nmW6RSn3/T5AvmwT8NFAYsDE6t@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQ2lFyre4hwsylaWcppxQlm7eJiGAHv/fjS08iySNez+agHJR
	D8Z9TTqpl2FWKhR+UMdMcdfqS0RiJIr6F2FGAYUX0SAxBdS0dfVI5FzOqg==
X-Gm-Gg: ASbGncufXJ0XRp1/wID4THgEC8NfPAfXmS4F6JEPAUaq7WWqnAjIk32L/zc2tUeaXmr
	2ZAIhxT6wSCb+gzIQPaLobVWi+dnjfi3CP4TSRArLsH4bAHc7eBRAenik4vZ1C/I9dizwqaoEFH
	VPV2YwhNrjI2Z636b+EfScS3aQ3+c48DSYkPO6melUj4oDvQlcBzBwHtWhFvVzN2Ndvu857PRw1
	TU8G4S42sB+Yu7bAM8Jb+vHGIP5iPpuuxVHr5NE9flhJNBEHpmpQcj1j6jO+AKzpJ+G0lMgLzCr
	41ri8uHR/vblLNzEedlqGcrMp/yqiqx/EuoB1tU=
X-Google-Smtp-Source: AGHT+IHcIB5ih5Ak8ppnNtMqhEvkT6Vs/Y4qVpmCkLaNLy1wDcK5il5rG5f5hboByH0/Kq+vw747Bg==
X-Received: by 2002:a05:600c:5101:b0:439:44eb:2d81 with SMTP id 5b1f17b1804b1-43ba67107c4mr34481015e9.15.1740755859451;
        Fri, 28 Feb 2025 07:17:39 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:39 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 2/9] i2c: atr: find_mapping() -> get_mapping()
Date: Fri, 28 Feb 2025 17:17:19 +0200
Message-ID: <20250228151730.1874916-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228151730.1874916-1-demonsingur@gmail.com>
References: <20250228151730.1874916-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A find operation implies that a null result is not an error.

Use get naming to clarify things and to prepare for splitting up the
logic inside this function.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index f6033c99f474..f2485d1670a2 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -241,7 +241,7 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
 
 /* Must be called with alias_pairs_lock held */
 static struct i2c_atr_alias_pair *
-i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 {
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
@@ -335,7 +335,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 	for (i = 0; i < num; i++) {
 		chan->orig_addrs[i] = msgs[i].addr;
 
-		c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
+		c2a = i2c_atr_get_mapping_by_addr(chan, msgs[i].addr);
 
 		if (!c2a) {
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
@@ -428,7 +428,7 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
 
 	if (!c2a) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
@@ -536,7 +536,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
 	if (!c2a) {
 		 /* This should never happen */
 		dev_warn(atr->dev, "Unable to find address mapping\n");
-- 
2.48.1


