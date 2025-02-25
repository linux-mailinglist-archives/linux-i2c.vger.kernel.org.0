Return-Path: <linux-i2c+bounces-9568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7378A43DD9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 595CE170165
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4CA267B97;
	Tue, 25 Feb 2025 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAujPyuL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAB1267B7B;
	Tue, 25 Feb 2025 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483592; cv=none; b=ZxxWMN47PtMVs7+BYqUpxN0B5QYCj1eq5RxprWo6mncL82Ca+ljxaV0uivdH1znA98j8O44QjA1ue66bFRnlIYpaWkV/iPb5+DuDFzVjYPqnjCcvNgEGe+g/GJjZI61HqUOSCw2/mfoPnWuD66VVQ3GZtbl97ZL6s774E2Ir8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483592; c=relaxed/simple;
	bh=Ehblm3cjI7Va9Jt7P+WkFGZKHXp6Yb7SLCvyloMtFZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbcrLg9XNrGoDfJCUEP/M+Gq0isWkN5/yl3egSamYu5m06T7PPuzFYuuawgm93EuRFyXblW1JAa6SiEYo2DDk3ZPmi6iw8PRBVLEZXnqreldxlsW3qQ27wXbz+tgrZyvP47p7ZjGDcV7i8tzIzJ0Mw5aLMXAMHQT9LNXhKUN4aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAujPyuL; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso941748066b.1;
        Tue, 25 Feb 2025 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483588; x=1741088388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjusgwzWvX4Dazg0IOWwufajBNnxmVFstpFXYd3AHkI=;
        b=RAujPyuLNxvtmEjYYnLh0qSwA0mo8LBuKXwDJfFH6lqv0Az5w6d6Tpltr6TDGgJcij
         PTIxc70OTkTcNQBqU5Cs6eYVIFr4iXzX0KfGHmzXh6V9M9Vndts3/utiqhrb/NBmTZjD
         p+gGbIOvrKvhpEr9jXB7psOnNdPWm2O9pH1W0T0+iNAYdviSQ/NHYkwz41TRnCm4Cd5V
         nhHoqw8NVvBWzeRYjbn2ocavzWI5udHUvg6V2yyPrpdt8UXLgV4S0bgAF8qofVe299Gt
         yxtp5HC+dhcPcUgCCjUrEyQL/r1TBIQqzcHk74TtR/BUbFKeKxKCdwnsVzcMc2YaEvCh
         iX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483588; x=1741088388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjusgwzWvX4Dazg0IOWwufajBNnxmVFstpFXYd3AHkI=;
        b=q21D7JGnWdfr70v6RpHEOesurbrSQmoSO644O4PYcZVmMOIom/g1+YhvwpHbOCAMej
         UaIrhUhMqwdjQeakUtOwptjd6I6IwUPziabuz0PfIat/l+VCecPOhtyE309O8dz5Nzdk
         yC1chYawVw/5tAcGRJ8Hm/UKKbr6oMsgphrddqh7POIHUh9dcpBenYUwlNd9NtwS4fAw
         huBAHhCSMPJfU0QCRBL7fRWYF3u+yZazxRBEwTthSs4TOUelkaAtqYEAtryHo5osbcTN
         PZuAMbPyyI8fdYuTjKBLg6l9jPkyDu60Za7uEydpc5fXGo5Cok+TUETrtkZOLw9cLnIe
         rW1g==
X-Forwarded-Encrypted: i=1; AJvYcCXRPOQgS8v1bCRjyyFMQE/siRoamGOkqThCRtvnu4I4WB01RivCPwPQEGJJIzO42dyCxoW4ywdVlds=@vger.kernel.org, AJvYcCXz4ptWQ+3ab/nMBQq00LjQdW1dulsNsBUZp74D4xqe9rz1ibaaqescwWPuHDKLSBYSLqBN9lF7/MYoyY9S@vger.kernel.org
X-Gm-Message-State: AOJu0YypxkV0eMzX2a3DzGh54p8v6/Gi/S00JOEl2RiOXHesRc4QPgKP
	+Er7SZuJGkPGigW5+nz3XHKsRG8G/FfO/26UK7P1MhxsoqqgtXBr+umxRg==
X-Gm-Gg: ASbGncsH21kWkEKE3AoFaN1T5MKh3EJ8p+k5UmNq3nGHR6hovdjolBPYgWUBBKbgYCe
	j21PVRoVZmJ8JtKXv2YZ2/YQaMXNSt/nnpYjcQJm0mvygOzq9Tsk8IFWOP/w222mcFJCvQXNsOL
	c9wvTeVuJJZoB/7zznvgI0Iwx64JeGdHkcOLRm+ycgl6hrvXlFdsuh4u/DaJc1r5eS++tZaGrpy
	++2QJ6X+Erc4V0N376ITsf7gobDMrhwtuM5wD/dBDcIHm13wUM/TPQYwkAIxs8uXlJ5xxf/CIoU
	FCjowIgBQtcU/JJelfz0Q9khNc1ijy7XjizLLiI=
X-Google-Smtp-Source: AGHT+IHYES91fca7Vq4SToaJTAXeyc8f6g6AC9MP0HMLBt2z65jydwpqk5YBylEDb6ZwrvDClcrXFA==
X-Received: by 2002:a17:907:78b:b0:abb:eda0:774a with SMTP id a640c23a62f3a-abc0de15e4fmr1586501966b.35.1740483588332;
        Tue, 25 Feb 2025 03:39:48 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:48 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 2/9] i2c: atr: unlock mutex after c2a access
Date: Tue, 25 Feb 2025 13:39:30 +0200
Message-ID: <20250225113939.49811-3-demonsingur@gmail.com>
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

i2c_atr_release_alias(), i2c_atr_destroy_c2a(), and c2a access, are
protected everywhere with alias_pairs_lock, use it here too.

i2c_atr_destroy_c2a() accesses the elements inside alias_pairs, which
needs to be mutex protected.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 39b3b95c6842..f6033c99f474 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -544,8 +544,6 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 		return;
 	}
 
-	mutex_unlock(&chan->alias_pairs_lock);
-
 	i2c_atr_release_alias(chan->alias_pool, c2a->alias);
 
 	dev_dbg(atr->dev,
@@ -553,6 +551,8 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 		chan->chan_id, c2a->alias, addr);
 
 	i2c_atr_destroy_c2a(&c2a);
+
+	mutex_unlock(&chan->alias_pairs_lock);
 }
 
 static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
-- 
2.48.1


