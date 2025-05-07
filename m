Return-Path: <linux-i2c+bounces-10866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A33AADED8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B99C1C06980
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3813625EF9B;
	Wed,  7 May 2025 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMNtY8eL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3896225E46A;
	Wed,  7 May 2025 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620369; cv=none; b=H0DzN6teLDPvv87Gh5GA6kZwgn2tipz0j6dHfO6uirP8f65K8M2qhWlsCMG8QgKfo3IrB+RjRXAuNiAGqiVf8qeXrJHLoxjyVivy7dwrUzd6X5iGOIFKwWXSAPzy8oCekk4cqcEBqv7bVrt6N8Og34ZXu12JZpgCCWaLSDx9KYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620369; c=relaxed/simple;
	bh=Z+tVSftXwckDmiKqRv3bbROINZNt9Bt3KdI8yT1ZnpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMjxCqqxe8hFfeZd+nVjrFbqj7/tuhajSFsQd67bvI6vuXeRLrZmKq5srLloaSjXICDxZHGqTkSgGxacE720bvlARSwrxu6CIg+EAK04tIltqnRvhd5zVqHPbNSMfYipnmQZN9PwxTEJ2rYhApWNvjozqGDY5m028MlH4t86Or0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMNtY8eL; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so2568370a12.0;
        Wed, 07 May 2025 05:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620365; x=1747225165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XbduvruUPEUAj/PBFNz8Mdx99O0o/ram7Wa9Kwv82c=;
        b=fMNtY8eL5XWvWvDTmya2DZORLdwftj+6+/RTfNNqQSkdqD0Vw69cXTh1kH3fNMh7TT
         uE/bWoGtK5w1xpZTAaCJ/4ulqFwAu1PDJx5PfQRPmtnbUexEMHANXycQHpEkopJ1/eEC
         gw+gcml8MvSZWZMMC4tB0PzXC57VrRN8tlvOg1ToFSU5ST6k1X7PU2hK02yGz8LAh1jP
         EMzSfcrrhLUxLxqZI0IRFI1f8hxYxzpN+krHtoLfRcwR3oCUuwjnszGUljPQzRDpQH/G
         G7TFvdEzfGyMdFWG9HsCxTI+Y/vRaGb2l0QrxsB+alzawi57cgzjxXieLBsDSWBr/hqa
         CTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620365; x=1747225165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XbduvruUPEUAj/PBFNz8Mdx99O0o/ram7Wa9Kwv82c=;
        b=Z3VQmhEW6nwVeYac77DZ3IUuJ2/kNm7kZs76Vs12/VnGUhMnxpxrLWTaHom19PvOSC
         9UeKXdZKdh5CtAJcYBKsMtue3cAwEkisPT9QfBdSDdN+JqJMTTKLagjRq7O8ANT4wqyK
         QyyRogggttLrPSyvFdcIT+dOGdM5fRtgNNHmddwkWUk+0aFDvkUkiP6lLKbgGLX0KNX/
         1N6amb0aJfy+9oDOAmci2DOK0dOiXlkSWom+T/s7BCx2DNguuyV4nZzfJioAy0xsdK79
         S/4jNGBaMHkU1JRtWbLICiSF8SrRTHgKcaJib7IQEb/V2rAseEl1akbTBtZ+50PWaZKt
         aRyA==
X-Forwarded-Encrypted: i=1; AJvYcCUZJ0//CE/XBzUqIeH+iYYoFcTQ24wfCtRnpmlxo4FWG1SN+GYUnK2JeUJD6lRMrYRDp70qg+f1iSUAPmZs@vger.kernel.org, AJvYcCV7opDyomQg1Ryhcu27QuOivfM60UdkmFoOXP76t4R3+2Gq0HFHSrrb1rNDh23ayLyoNt1TkGltGlw=@vger.kernel.org, AJvYcCW760v7061vDE/XvSxndnE4v2J0V5C0JI+3rWfiWLhm1bm+5oMAKKt3HeUJpwF4h1GpUwQCgjJnpGP4a6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4MseXrcua2PDfTDZIniFsn6BTRcSdoj/Ur2C3+QaBPPJDJu7n
	TKeVW23+1cL4OmVkuKv5gD4vbuBHgOikIpDKEqxsMoX14WhHmE5v
X-Gm-Gg: ASbGncuMwM9lhpmBVbYbHpilyhym5jSy4UZBwpq8RZMYqS8QPiK+H4XaOvwkWI9rikv
	1fAm013DxS+4PEhByDtEKRuYlJcsSF2G1eZ66thMeg/BdwkHRONIqVe73N0bsoaYLlFpbSuTd5Z
	Fm62J5GSv/JR5WhW/GLbCmJ5cHLyq3qGlsypd5x93vrxB6LLp6uDtrhHRMk+fOYoraAqpBz2pzm
	x3ScmdwLE0MHUOzJen6SnNJ3ulTNnTkyRkjJXl4ZUinAqFxiTUUUrDKtgDstbbWc8lRSZwh+aLg
	xXsuwv7eXFQ8ni1Su4ZgbYExxa2mWyakMA8HHcQCsRyajkb+tF8d
X-Google-Smtp-Source: AGHT+IEZpzoZE1uIN362rCbRLMB2kpdi6xmv0t+LFOroEHGSDg4Kxu1XEY+MtkIZr1FXwDzKReIDhA==
X-Received: by 2002:a05:6402:1d54:b0:5f3:fad4:fa75 with SMTP id 4fb4d7f45d1cf-5fbe9f81559mr2971623a12.32.1746620365327;
        Wed, 07 May 2025 05:19:25 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:24 -0700 (PDT)
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
Subject: [PATCH v5 2/9] i2c: atr: find_mapping() -> get_mapping()
Date: Wed,  7 May 2025 15:19:08 +0300
Message-ID: <20250507121917.2364416-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507121917.2364416-1-demonsingur@gmail.com>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index a79ca87e8bbd..939fb95fe781 100644
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
@@ -339,7 +339,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 	for (i = 0; i < num; i++) {
 		chan->orig_addrs[i] = msgs[i].addr;
 
-		c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
+		c2a = i2c_atr_get_mapping_by_addr(chan, msgs[i].addr);
 
 		if (!c2a) {
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
@@ -432,7 +432,7 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
 
 	if (!c2a) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
@@ -540,7 +540,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
 	if (!c2a) {
 		 /* This should never happen */
 		dev_warn(atr->dev, "Unable to find address mapping\n");
-- 
2.49.0


