Return-Path: <linux-i2c+bounces-10868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16376AADEE4
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AD8E9A2B39
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8177325F984;
	Wed,  7 May 2025 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUFJBmJ4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEE25F79C;
	Wed,  7 May 2025 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620372; cv=none; b=OOmOGGQF4PXJ9STx9wLUzLjNMAJ5snNMBBYt48mF8wMoBWNxK9S1nTn0OHdtzKtYomBzQSGw1HqcWvJGZLmpBxP/0CuyZeFmo5NLuXyYkywsH9ogXkg10S1a9Cf8RBk9B6c2Irnshh9zpSGPpnCqUJT5iKvLGAIXp5bLkLr7mhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620372; c=relaxed/simple;
	bh=lctrcFQ6u0h5yUi4JGVq1rQdGkWFCwASe2sFOWRpklY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pilLPCHwj4E4R8nE/flXiqNP5QmkF6Ru7ykVHPAEJofhtSo0b/+hNEXLRadgfSBFPsh8wo8QMY+kYSnbIhoqjJeECJCjUErSlz2g9ZteU8znxfoouapCq/pbgFgLWRwHF4OsElWgl1e3oNzEAROqEuRf7KD5Rm7u5xyI/ROR9RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUFJBmJ4; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbda5a8561so1907612a12.2;
        Wed, 07 May 2025 05:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620369; x=1747225169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9UBtmB9zYRXrNN2sqjqR5grKIOrEsHM+Wf3UFhuRp8=;
        b=mUFJBmJ4MR7E+qOnKpVXoSzLuQGpobi1y/TCQj5pPeGEAocnAY9rD4Lwj7nfZhQuGb
         t0lzc14Eo6BSc+xtpuHD/gFmP9s3dHn5hJbp6ngTkCxGkKMCGL98lz8gb5wX1uCl7fwU
         dLZRRpZM8LrWrjDA9SSWYBi/ajuJiKotntMPgZ91I7kzszVLb7o7MxTORCvVD9YC8LwR
         /tzXQcO3oTImyniRoxZXhklIrMp+zZX/ZXpi34AsbDtXQ8QUVraeWZc/KTd28k3RBWQq
         t8xxppHFzoz7MkjJhcu5mcQvCSvu+1galVvJfE2JS+cj0JJTasFunu2BdNfpOi3VRu2u
         nM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620369; x=1747225169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9UBtmB9zYRXrNN2sqjqR5grKIOrEsHM+Wf3UFhuRp8=;
        b=OxIt6DB3hBNhNEUm6Z2Ygqkz16MgIon1yVwKHSyjII/FfPhr5/F3mGQIrEkUhwpAyZ
         DBjek+iS5sSlnkfEJQ3cufzS40kxlqPCBbNl58GUGMhHVarEWGFBklEkFKHfyy3xJziq
         zA6LrUUvT9JChTFkRkY9brb9SvS+Tz1zGV8OOBomLMXw28eYhT5SeIpib78pdnprSIws
         /6n0uP8aaZIP3QCWLOBAgBHjx5kOqCdcNO81x+Ur3eJJZzXmFcKxMCkB4GbSbaG61A8h
         LwYahJkOW1BTXw/0o4zSV3hRC0LzM3mfFtNqnIxMI7O5MWQRIginu7gceWvARYD55GK2
         IwXw==
X-Forwarded-Encrypted: i=1; AJvYcCUs+N6+G3V+Z+bULwgy1o8T1ay6hDoRU68ipGivEpuTTTkLLje+rPzy+Aio1nZAxJyrb8I27dl6RiOo3JWc@vger.kernel.org, AJvYcCVDc/cwTMLNjyIiwVcWSn5BfFHz8/rdp18QRgCwtxISVTTu1+j2497jgPaDAIkAfGQz1B8bOAGB7zztKqc=@vger.kernel.org, AJvYcCVXKjK0wxsLaR2gQjBmkrMypLPLzMkUAW8M10zKkpdUdEW+IBMnaOA+JccD/1nWlaBh7GsCG9ntUCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa081eEWUJM86W4oZduzjFeAjAxCoPQp9SZ8HckGcCaA1z9X47
	WCH3/DvBYTA/sDE9QYa/ZfL2jsKR7K46PSxi7aM0xSvyLOp12CH0
X-Gm-Gg: ASbGncsB+jp2euOXsec3Rnjzm9pu/NQHq3m6kjnKWlgMgVTN2+vjX3lqYQMzqLau+O+
	6+U6/1A35hiYZL35Qiq3/9J5qfJHczalA3D1I4WSQhrdzc/KWrHi+rw0V7yEZi6E2feT35hfpuT
	p9Q7TcPKqXx1Kz6tSPkImqlaLD2UeZzcHaGlcAygnmYLtAFPm24FnTNY1IbawIMX1cjComV6m7H
	XB2onUFv8IcF4qZRx0cMy1+j6Ng0bb6GfCo6NOxJX/smrY7NvcjWtagNGgR1qTYuRKxBjHo6jjU
	U7q9XWHxeo+Tj+Qa8+EfXUc9jU7/8D4jlhTVT9ijvRmWG58L/8bx
X-Google-Smtp-Source: AGHT+IHo8QlU181o7K8+pmDxKCcN0PlkDif/QNKIrYLyBMZRtuBLcy6gkM3KLxlckajlARtewvq33Q==
X-Received: by 2002:a05:6402:4341:b0:5e7:5b30:3c4f with SMTP id 4fb4d7f45d1cf-5fbe9dfbeedmr2254052a12.14.1746620368727;
        Wed, 07 May 2025 05:19:28 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:28 -0700 (PDT)
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
Subject: [PATCH v5 4/9] i2c: atr: do not create mapping in detach_addr()
Date: Wed,  7 May 2025 15:19:10 +0300
Message-ID: <20250507121917.2364416-5-demonsingur@gmail.com>
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

It is useless to create a new mapping just to detach it immediately.

Use the newly added i2c_atr_find_mapping_by_addr() function to avoid it,
and exit without logging an error if not found.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 215b6773fe06..178b203c8777 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -586,10 +586,8 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (!c2a) {
-		 /* This should never happen */
-		dev_warn(atr->dev, "Unable to find address mapping\n");
 		mutex_unlock(&chan->alias_pairs_lock);
 		return;
 	}
-- 
2.49.0


