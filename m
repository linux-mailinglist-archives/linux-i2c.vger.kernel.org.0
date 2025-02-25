Return-Path: <linux-i2c+bounces-9569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7B4A43DDC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C351E3A5978
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE370267F62;
	Tue, 25 Feb 2025 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjVqzy+A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D2267B82;
	Tue, 25 Feb 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483593; cv=none; b=ta/2H5//hunvJByXqJNQlT1TL/x2e7LQG1CdiKSy2Wpb8y4lD2t0wMxQ081gAs72o6UM64SDRGFJUXfA+8vYgpsE7JP7Ry24GFYN5PBJqjkHuj30unxTBiVbrj30sqecmqnx4UnbQw8x13NHQwyTuGfrFwpumL1En/SVILIWa9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483593; c=relaxed/simple;
	bh=PISapsmI9qRM5gfeVkdF4JKCyiQMUadO3rWiMlD7RFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o70VDE7cwKfcyb+13NmB49QqY7oTOQX0zV8pjquRpfwnm1PLR6Bbo38SKvULgGm72fKzWcY/ri0LGim4cGRx6p/GYWGtRzJ1n8fINvlOY+B0D3G5EvxdBdA1aM3KQMf768xOj00buxf2E7s7PTgNu1HlMchoOQRoPoAHAKPUr/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjVqzy+A; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso8253332a12.3;
        Tue, 25 Feb 2025 03:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483590; x=1741088390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02Nk7Tu7oSWRbXywdmWr43MleXDMMaL38pYc/cnl7sc=;
        b=NjVqzy+AF/dHukYneZaAYkt9oy4uPPDb6nzIeUXApsUGJx10bEQD0hh50Uki+qy1gf
         90Nicuoi0+8lhi7knvYSIYifgXzzHo+XYIQcVDYZx23oBuq857P/FE5bGC1Fzk0qkxxB
         md/U/LVvo2pv6IDvEo1dR6bLfMJScTCdV6EiK6pyMkCY2l2TQYbf/jBel6HQnroHG+Jy
         gKmysbnM/uQUX9ZTPH+LTjRr8lCfZvWCAq3zXVMT9y8/TZH+D5FE3s/O01AUOUYp/RRP
         pNU+4giiUSNbWbDq/aMnjfKOURNE31Jto2bgROeBlVN5L7+7vqEK30R/f7JPcTaMUmSs
         VSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483590; x=1741088390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02Nk7Tu7oSWRbXywdmWr43MleXDMMaL38pYc/cnl7sc=;
        b=euWwVuyCyP+LM/bHwGR4lMEstLtsOZH3Z3fbigZZllIS+Plos2WHSUgFzVglfYukY3
         sfkFnnKPcTX1HjUppEyrrcMy/a0Fkg5tWxf8efa8fJblnTViDhX3QvB0bTg9K39pv8qm
         xKDFrl3vwIDWp3/KioDYqem9qr15uRn9fx5G8tFU2gnRUmlF1ARY6lEQEw9gDM19huAe
         XHJ6EmxLyn6A79G5wsFwOe/9UGjdYgWP7qwWffdQynMcNvbeDRbF9xv/tfun46yEbj89
         aJy/3FPR6rYRXB3KHK1zHV9ONscE26AogdePERxPtro92aSU/R88xfaPjKWOqJTpycrB
         eebA==
X-Forwarded-Encrypted: i=1; AJvYcCUesDH8RkYHzfewJI5CVLwjQvCzq4O8wm/QPcI7YAPqYYXryLz0o7c4IsGiIoU4AnKVt5ck1B/nbvS2Uzka@vger.kernel.org, AJvYcCW4qZCNrHx6dt8trNP1JFOBsooKOa+lNnbbVTLLIGKWXtKhYp/SBp9T/yH7g9pqTFPBSZlB9+Ky1so=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXd+ZXNQuyxYb+QoYcOy1Iu2VJ7UYfKJNx/38HEIIZUXzpLfsg
	56Z9mKQDf2+D6Svf5aI+3Bmj2Z/IDjZLF89PD/gwJ7IgiQVqTQI2
X-Gm-Gg: ASbGncsHUEQmAsh2bMFSR+TRAhu+ey7t3589qKyUAJXNwpiWaRw1fdP+cm8x+o7/q3r
	8pK3kg61+oMNUBKpjTiX+TDkkeO9AyXktT3iChoPdjNoq/hORhjTWaYTyxarN3qLw83PPdCtLly
	uuYvhuvK2bBgpcqtfs8hhdWliCY9y7B+pGGiiRzAloXA0Y0GgLpOG/bmn7vglhEkFguo5hnTo4l
	udSmMC5/B+1ZqfiCYo/Mql+7+eAzKkRbI4WUDJZ3prmTeKN4fjLZoh0eVtIKV6vnNjGJORabjsI
	+NrHcmcJv+7e+biDVm6V9LpnGrAPfj/tHzAIlAk=
X-Google-Smtp-Source: AGHT+IGEtrP1t7R3oNNfJRkyQQplkyx3FK3zYN2M9tcnU9p8vq3Z/aM29j1E1o2X1xj8tJPaMGrq8w==
X-Received: by 2002:a17:907:8a91:b0:abb:9a1e:47cb with SMTP id a640c23a62f3a-abc09e49525mr1488485466b.55.1740483590034;
        Tue, 25 Feb 2025 03:39:50 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:49 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 3/9] i2c: atr: find_mapping() -> get_mapping()
Date: Tue, 25 Feb 2025 13:39:31 +0200
Message-ID: <20250225113939.49811-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225113939.49811-1-demonsingur@gmail.com>
References: <20250225113939.49811-1-demonsingur@gmail.com>
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


