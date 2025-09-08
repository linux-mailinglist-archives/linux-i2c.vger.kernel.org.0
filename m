Return-Path: <linux-i2c+bounces-12787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF884B497C8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 20:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B17A17B60E8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 17:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C085313E2E;
	Mon,  8 Sep 2025 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhU4VGlZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25735314B77;
	Mon,  8 Sep 2025 18:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354419; cv=none; b=own5+JWBIBoYyjnjJpvDoFc2Tm8+Au5ZBJmFKW3KyBFA2MC3iQVUc7sbGH7HWGneIL/aT/22Oy6UU2Tcf+gTMNKqhyQFG1+R2T8wNx5FKZ4QGwecNzDuZq2yocadY/Pjl4RdM23k+tFSWuO68HW4Hn/b/yCX43tUQXOvGKUW2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354419; c=relaxed/simple;
	bh=c3CLTRu0keerVDXxScL4MPXF/RzwAi06iMw25dy2vD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxvGLIXeKNbVqcxmA9cdkOLbgkDkNBnxeb5w6Zy/kp06nig8ynLhLUtEpVd0+POMsRDqWXSZMCxvU6VFMHjZRSEGegxlcWNHKFqRu3sXzXeJch+XkYilIYdFdaRgEa6Um6kRU2n6XAmVlK1WXeg2q080ttYu6rTeLv75GNlUSuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhU4VGlZ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b043a33b060so744658166b.1;
        Mon, 08 Sep 2025 11:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757354416; x=1757959216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gxls2EHYjPxxhdiOjpth02s9db2rJFVFZtqLIMQlq5w=;
        b=lhU4VGlZLi68rEELeo0dvNJCDZa9+mZF/oO0aBArI+3ktO2x9yRcUP4UpsPXvY7mPt
         +mp/QbhMp1MFgpgRNpAALjO1zivERjTFV97VLwexPlmQQdcdRDpoRSudBUff0+iaHuQE
         MCzc93UdchCzr8nZVy9d9M6ai6Cf0WeVL84Dg8jtMOOj06/LAqWcCcpPSTNL5jJIMnvQ
         WDK/OA+AqbO28pOn9nIE4FcUSThSjRGGTJcRpu1CPqt8Px1026PFN2HM05ytnVNNTJl8
         8l7PTaG/rs/RWhZXEfuLr8t+m3FvJx1MbefoGC0JhhZIt6oJhEq6xoUDB/LHZVxPMSDH
         kFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757354416; x=1757959216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxls2EHYjPxxhdiOjpth02s9db2rJFVFZtqLIMQlq5w=;
        b=EsXPbsQeemQKyqVayApN4FBhebNrAIaQ99vn16L5VaFrX2SY0gmDjvYwYfa1FGR+J3
         14a/29F7PHKxgqacgKZ6rs0E2sx+ZgBytM0ODO3NjfitKE4XNLermMYC+VXYHhO/tu/q
         AiUPPkEInHjteH04soAbYO8C8V7qpFianwyClIRTCQ5djOjI9zxvCewvlQqgcM2DZrAC
         xxymoD0ir4fQkf+K7QPV70jtKnOvcwYYtGzT/I93i7rYDhQcxgxtEdJEokwccCWYuQ6P
         s+cTUmHDYyZAbeUUyzYprTc6aIcerWcnJw7Mqs8uiJENbSpd1iQtBZe91IbYJeHZZzZM
         RbXg==
X-Forwarded-Encrypted: i=1; AJvYcCWgXrfZLeCFT3aIY5+N8k2Ef5W0mDju/yfzJUYnnDQ8uW0IoiFPRjfpiRi2pdT6HgEuuTezprihgs/FcXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4LHqoUKxIxOlfltP9FkDXM8xd7Xu7XVhADbuyUFMAtjd0dKsB
	EGo9V5BHp68noJIWBYm9G72ObVzw0fvv0PKMxVteNgqECQ/Bru/L+O5V
X-Gm-Gg: ASbGnct7+b0ihqNRkaPAWHVfB1LkdR3Vvofr+UIpLW8+NjvF+yagwV0sCzuUEyvRnhJ
	NBEqpxXMGu7Xq/sSflQXaljRVus7qVQigN2jaMLH6Ii7hvwCt7GurRpEZWZJh29uWs65HnMgq86
	9acmzJ7XsW23Bw0paGnHi4UHdFX24+6+7HPjDoWsa0/jupHlGB86yJx6TsvXsVnQAhUF4N0LuOX
	ifPojHjzNTsuHo+pI+mNCDNear9obHgckGkiKieo7eAKT/dyDg6TabyYXhxhDx6wuIAq1lZGg1S
	AK5T/MyM8caihZIXZcKroojnk3fmCWgSN8/A2nZMd7lHHnjfPIaP/LIrFeMPtJa7wIhotUAHNZ0
	E7xgtXqft13v+fm3Ldp/7QsqQdYmkSybjYxs/+pop
X-Google-Smtp-Source: AGHT+IHFEMaJLE1CEX8SL7Z5xYZVh6yct8N6dbiU6ZOkNHy9CTsMFnVSWf4yFWdjV3EayIwo8/EYOA==
X-Received: by 2002:a17:907:9414:b0:b04:a852:4f41 with SMTP id a640c23a62f3a-b04b1687cd0mr909967266b.31.1757354416154;
        Mon, 08 Sep 2025 11:00:16 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041565ca98sm2158185966b.86.2025.09.08.11.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 11:00:15 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v3 3/3] i2c: PCF8584: Fix space(s) required before or after different operators
Date: Mon,  8 Sep 2025 20:59:02 +0300
Message-ID: <20250908175902.214066-4-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908175902.214066-1-chiru.cezar.89@gmail.com>
References: <207f485f-df06-43a6-b91d-8153b8922089@web.de>
 <20250908175902.214066-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

operators: Require spaces around or before or after '=', ';', '<' and ','.
Add space(s) around or before or after different operators.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>

---

v1->v2: - Removed space between [subsystem] and ':' in subject line.
        - Attempted to change commit message to imperative mood but I
        didn't understood how.
v2->v3: - Formulated again the commit message to imperative mood.
        - Wrapped commit message to 75 columns per line.
        - Changed subject line of patch

 drivers/i2c/algos/i2c-algo-pcf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 598bf000bf4a..3439b7387a54 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -223,7 +223,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
 				buf[wrcount] & 0xff));
 		i2c_outb(adap, buf[wrcount]);
@@ -314,7 +314,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -328,7 +328,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
@@ -373,9 +373,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only read %d bytes.\n",ret));
+					    "only read %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n", ret));
 			}
 		} else {
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
@@ -383,9 +383,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only wrote %d bytes.\n",ret));
+					    "only wrote %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n", ret));
 			}
 		}
 	}
-- 
2.43.0


