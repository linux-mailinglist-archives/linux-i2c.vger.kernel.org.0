Return-Path: <linux-i2c+bounces-10573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF38A98370
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 10:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 172585A51F9
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 08:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C24280CE3;
	Wed, 23 Apr 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozVjPv2E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114C280CD9
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396485; cv=none; b=oZSnLYKk56MVxy2BTAT/MP90WXlJqxpDPvH7/6K87YLr3BNHFPEJgBRbQA1DBh93dthzNiAnP29OXHkYR9l4p+yX+DPfbZ0kWLHP4kdYnGaVniCja+bxl9/UqzAwKsNJrTVN2zEK/9l4qVERJZvTWu5kxRTeLMx+o5W2HD5aL08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396485; c=relaxed/simple;
	bh=0XEqfSAxlPY5os2nxDoIwRW/AGhrDkurjFzqdCvEZyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZ++WKbadHjMqLTKVFkfG8iykjl3kD3L/65feaqFu4uz1rICfX4QhdZfWYSXqo2+8IEEKrQgcUF1V62rrnulWDcDnNUkeK0ToR68oErmDD76xy4GUdTtHRQmjjd3X0/mABrfTEo99QnonMm3b3i4KKa0CZ3z/1g5KsTl3toXMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozVjPv2E; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so49606995e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396482; x=1746001282; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8gf1/v5lhBj3nTJ7U9oiBRoFIhc/ib+8WshbuHJPe0=;
        b=ozVjPv2EvWvqWbFFDCuonjx+z/Lz6ZvSEDHCzbc5Nvo+TyqVBFmVK+BbmUqi/H3Roe
         8mPR5AVbtjfD26khBXumkCKjd5Yv1A3qg54Ko8heYdQIVHzLZJybbGQTuheMHwEd7Q0l
         NmNyldolTZZOnMFRAZtKu3M7tpiBIOIybRD8GRFeh2H7QoBAHY1UavFQnH0HtiCWdP+P
         /mOdAoGQp7ux3IY0XL46ZC6WYYicT3i2l4cScUfeCWsxl36nF3mDrCVnNMiVQGN56+Qv
         VThP5gs7A8TtKPNPWZem3XjY4fAM0ZZBqEtl91bUCwxLrAFIQo4S6puIRaCg2Enhzvf0
         +B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396482; x=1746001282;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8gf1/v5lhBj3nTJ7U9oiBRoFIhc/ib+8WshbuHJPe0=;
        b=UqFxiDAWDW/BmpOKF/7ix10rRbDh0jOnvx+SYM52C3uM1rWbF9mR1w+YYrt46/MDrx
         Ct4VmYccJgnoql5p9dI6AEspLZVRlgoQHXUoxeYSAi2qnvq27sJwxgqNV95JllaEXC2H
         9/8mCVJaicSSBRSubcX3VwO+wa4FObCkeSRjr4y4Zz7tgeD5iFxVdXHqdt4Z/aLy6txA
         +xy1ZX9sfWoG/q4lWUeCGIzo8WqhIbGPRKsA8lSPgzo/y3mN8d/UYnHTECL+34ZIwQWB
         AsfXQ1c2tcK1o0hU7FaH3oUB8TG/tM4W0ux1s0PllrSS1aTlHWl75Xgi3UMSEQWfgJqf
         hq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4/1TwVFCchZm1uRXleJVJA++uq4QSPL83LXrxSolkHHwOuDcVsEYnSSBjEia7xS3as+8xZaOK+Gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJO7mtoJUHPQUwE1gKQ7QLKQLBa3KrpHr3Qhy1I0RSKyphSB12
	AIYTKQSf2WQOLa6TOo+hJxSXSDYi+WVOcZEI/Pz4S1sPdV8awFqOTmbLU1Q2568=
X-Gm-Gg: ASbGncs05t1hSLlfNWoZpQE3sGF/oqshPMjPRJdegtUQo6ezYUWV1uAPHH/QvtTNX19
	gqThiFG5aNR296GOCZPfZGYCQHFrr3q+N85Qjnxb94kypRdg7uL5v2zt+sVYBYuc6eoUSZFW8tL
	MWFDqauuYkyEsxrKuael6xjZ3NRHzDwAEGZOTAPEKNG+A8004efP41ajsFFTuDRwdwguLZM7xmK
	1WdhMggxedhrEVNGPLXi1Pg0q+Xuds6K0RxCohoGR3orlj9MGwnFiDevlfgDJnUl1UWQGOH73ml
	fL0gQ8awwDgGkPQWvoD0NOPGzfbJ+iNr2rYP5PtLGRMgdw==
X-Google-Smtp-Source: AGHT+IHWYSrmnac2ZIJgkK3CcnsC+6t1hYnQGT7QpTZYVmOgik/OcS5nSxSw/Lh3KD6scYknsYVhAQ==
X-Received: by 2002:a05:600c:3c85:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-4406ab98242mr134584375e9.8.1745396482254;
        Wed, 23 Apr 2025 01:21:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092db2bd5sm16760175e9.26.2025.04.23.01.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:21:21 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:21:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] i2c: Fix end of loop test in
 i2c_atr_find_mapping_by_addr()
Message-ID: <aAii_iawJdptQyCt@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

When the list_for_each_entry_reverse() exits without hitting a break
then the list cursor points to invalid memory.  So this check for
if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
variable to track if we found what we were looking for or not.

Fixes: c3f55241882b ("i2c: Support dynamic address translation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i2c/i2c-atr.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index d5aa6738370c..1aeaecacc26c 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -240,6 +240,7 @@ i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
 	struct list_head *alias_pairs;
+	bool found = false;
 	u16 alias;
 	int ret;
 
@@ -258,11 +259,14 @@ i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 		if (unlikely(list_empty(alias_pairs)))
 			return NULL;
 
-		list_for_each_entry_reverse(c2a, alias_pairs, node)
-			if (!c2a->fixed)
+		list_for_each_entry_reverse(c2a, alias_pairs, node) {
+			if (!c2a->fixed) {
+				found = true;
 				break;
+			}
+		}
 
-		if (c2a->fixed)
+		if (!found)
 			return NULL;
 
 		atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
-- 
2.47.2


