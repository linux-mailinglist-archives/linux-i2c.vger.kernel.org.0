Return-Path: <linux-i2c+bounces-13745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6A7C009B5
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 13:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 763D6359B12
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 11:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF3526ED44;
	Thu, 23 Oct 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfJzA+IB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D29B30C343
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217296; cv=none; b=lCmXazXoCpRG6GvyMBPj2uV+u29x+yZI/to76w2INMKeKJX7ERcdk7nDBdFDF2yFOysopGOZnM7J8aNa4ssZJtQ1RBf8YfK5aQruVLug48z7lw3Evc5E6eyPpYPYvNCUsCyP1x8lMvg11K0uoMsBTrvGAwyqs/80UvDfUvAGc8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217296; c=relaxed/simple;
	bh=ckT98u80k2JPgEu+6Gv0oxnOuy5Dosa++TXfIwkXVAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=owRewZOJsBfz7M/Ikg9k20Z8X+7F/pjPSsXPqiSHxs+8gyAkIK0TsVG/3EOhZlqbcpwFZJqhfgA+Y1DO+fWEmgniSZR0TTr6KCEKNby2FqvtrTSRro6coSjgG5REnZ1DTnquoUkU8+5XY/NdjvxHorodKx0IsDrwKauydMMHhws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfJzA+IB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so6753155e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217293; x=1761822093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owxL1umZEz3jsHmxQLyhIGhFWsk4nNmdHrzJn8PWwkM=;
        b=lfJzA+IBszt379wa/2JpSY+SFoQTORwl7DWkVfuOcH47HZkbXrqs+8mT23c6pps6dH
         71zNlAz54HWxbMzICgAV0MucUii62oCJk+pD8LDB4MJvh+MEWEvSXSzh1/u5wl3SB0by
         Ek898SPNpB6Rj+Gb8OIMGO46fXuPKqNtXrns+8eodyByUo4zt6Y8QBXnztY5dTtYjz0x
         ra+nnIQwEKcohi36w/eg2eVU4cFmYhkj9WH5/MzI46+Ujf7SSdYXdrPaSqACBNoUUUq6
         2509US43cgD8BfpK/DXfPKpM/x3BNft3JpRW6Erq13Y8mBpDFedlzb6+TUmZ938tbFJD
         4KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217293; x=1761822093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owxL1umZEz3jsHmxQLyhIGhFWsk4nNmdHrzJn8PWwkM=;
        b=LdshG8q1iiUbUplGlE8SMgVi/uWLdBrU4rGk7mKUO3fat2WPMv+viiWDvWNqRzGuIk
         cwTGR2TSZKirfiJ6urivYVrbvnj33+tZ2UEDz6IC+N3wTvjroxtZ1XuhBZ+pf+9VoWkH
         xZcv/2kgR7pPJ5ApmIL+jAtsiTbLIxtP/GnJYPKeMNDMYf+q6p+bq2NjaZar6irCIbAu
         mUygx0gj1cDmLkmLDIcAcxezkRiWa/tf6RZRUuW8NJgYw/asx8qNpLkGptkTsyrHaAld
         y3EvekP3mXgkit2TeNOsKaLee15uRkWD+VdC3p9ui7/kPdNNbSHm23aQrghb+ASOaQdH
         rg7A==
X-Gm-Message-State: AOJu0YzyaUURUQvBeixVbufPnDQfWUl7i0GW8a5Zh1fCx7uf2OpvcE2j
	plQiVCoQxdZoNZcXVd/wkOXfjn3NhZUm/9gEFehCIBXSgQ+gGK6RoT5G
X-Gm-Gg: ASbGncv7AwN9Al5Xp5OPiJaIX8HNaeyj0XgUtqmkAbLM5u3lmq1LG7iURHUz7oflvVr
	FxzrX3lpoNNg2yR/7ZNA7Dv7YWuXiHnXNGt4tlbY95rOwI4Or1wUmn7SOrxuxMPwi3lvntMeIRl
	UWdk5qwEjUpVjcALbOGh90mFSzsmC82G0eWUNHZaA7vEslkq7bW/pNN3lFLzZhqx+aR+/imUUTq
	R6h28pNHEvuRA133MBv61fqx/lbX+sWI9BmBaN183vfXAG7KmwSGrjHztrD26n2DcKA3rL3IwFL
	mndiKo4okZ6d3jrWfPqUdZKkr7jClV/jf3QaySiZBBN57/VGnth2Yw1FiIkpQHKnVxYpAJT1SaI
	8wRilKIYuHEiFDeSOXwbzvbCkkdb+fgEAnt6EzsTpdZPRN5he9hFGaoddMTC9WLtUaV9tu6a1UF
	aFfozu
X-Google-Smtp-Source: AGHT+IG4jDcJj8/UVPX8uaNqcl2k5SJb3kroiwvAz8vuEMgmB/p84+nOmThVkFeBVC9mV9z+ryZanQ==
X-Received: by 2002:a05:6000:4205:b0:401:70eb:eec7 with SMTP id ffacd0b85a97d-42704db8ccbmr14342758f8f.43.1761217292775;
        Thu, 23 Oct 2025 04:01:32 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf78sm3596420f8f.32.2025.10.23.04.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:01:32 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v1 1/2] i2c: pcf8584: Move 'ret' variable inside for loop, goto out if ret < 0.
Date: Thu, 23 Oct 2025 14:01:16 +0300
Message-ID: <20251023110118.7940-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023110118.7940-1-chiru.cezar.89@gmail.com>
References: <20251023110118.7940-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require spaces around '=' and '<'. Add spaces around binary operators.
Enforce error fixing based on checkpatch.pl output on file.
Move 'ret' variable inside for loop. Then check if (ret < 0) goto out. This
improves usage of ret variable.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 41a81d37e880..06b9fd355bff 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -183,7 +183,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		i2c_outb(adap, buf[wrcount]);
 		timeout = wait_for_pin(adap, &status);
 		if (timeout) {
@@ -272,7 +272,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -284,9 +284,10 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
-		pmsg = &msgs[i];
+	for (i = 0; i < num; i++) {
+		int ret;
 
+		pmsg = &msgs[i];
 		ret = pcf_doAddress(adap, pmsg);
 
 		/* Send START */
@@ -321,6 +322,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
 					    (i + 1 == num));
 		}
+
+		if (ret < 0)
+			goto out;
 	}
 
 out:
-- 
2.43.0


