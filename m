Return-Path: <linux-i2c+bounces-14104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8527CC62426
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 04:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 97122357657
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 03:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE08130B50A;
	Mon, 17 Nov 2025 03:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxVf4DPp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134A2367BA
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 03:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763350972; cv=none; b=RrwM9dpDU0eTGue3tF+nxhugXMsNnBi+JSludY6qrFlfdhJ4CkTlJb9Fw7ehczLIAJHWOB2HK/fEVR+vaOIvGkWxdaRip5FALVW0XxWgBlp8HNKs+eQhl8Rcdrmw0ZD2Q6TRJ6rXcnOm9cdqv1zfJhkiMDW+rCPdVmIiN/aRVuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763350972; c=relaxed/simple;
	bh=3I7JjgtjEcXutmrwvvR3O4ts1OPoTrC5aBJBBbGSU1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUz/7LT19AZimKNe70FfTZpW1uc9B4N7D5LrgnI2QF6x/zN6gsvw5HVK2ApKW4f0/yzukXoeWDJxu6yGBIp4bGJ8hYxIR2YXKEq0C3IisiwqqaGeSXsQgKJFb7Z1vkoyv+Iw6M6sUVcg2BZ4nHpowq3777MK94BAlKj4X8gTXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxVf4DPp; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so2822351b3a.3
        for <linux-i2c@vger.kernel.org>; Sun, 16 Nov 2025 19:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763350970; x=1763955770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJwG+OvVeP+oxmIi79vEgM0XhrkvDaX10R9YOhJIkpA=;
        b=hxVf4DPpDUpCdwy0pQX8ZaBeWIw4UVaw2PvR74575YUI0Icj3IPL3XdavaddzAVzhW
         hRxQ814RLzENBC4vf6k4ispCL3kFACn21s9IPYCR7RL6l884WnFPn1KrBqmJQuNcRcSB
         X8EdoUDXHFJcogrK2MRI3c36SWsXyHXcha5xnLcYi2C/+BBv33CgO1ubZJQNr+QWHpeE
         6oop/zo+Xqhdqxbb31A1k9IpJxbHFwjLVZr7S3OARtLF00MbYabt9iwCfmMo49nh6toF
         B9buMpTQnacrLjlTpJWNPgKwBDi9nlytHrUzK5IwjuealzHVCVXk51jK0kc1Sd0OMG2W
         Cpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763350970; x=1763955770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJwG+OvVeP+oxmIi79vEgM0XhrkvDaX10R9YOhJIkpA=;
        b=OX3DSiODIyrWYAlRbx9bmJt1+1kV07YOkVuiVCp7zRjH0bDAYfcnqHhQKexnLK23vl
         hgn2YAKjYt5mIl73XAcor0NnSp6hJsmXI2/DBrGFuqozWQoRpRkurQMfN1sCRTtI8Z6u
         iwuFtFBdTUggNE8jL2Ky++gU5xL8Pz+cWD2YhCaYlnnBZdkiXY4P/TBEucUxAP3VBvMj
         cQMcPno+DcpLuUYCfJyU4KtiVXfZDwg/2dytvf1ebn3ymhuxM73WvHJqRRhyiyX+D8qm
         e1Uo8jbOYiF/mLn0UJQSqV3gqsIB//Nnr3cghJiCGZcsCo5G7JEzyPNXGqE6f6jXIchD
         qjxA==
X-Gm-Message-State: AOJu0YzzMhDquuwm+/o01u1q4N5XuR7qApT32nCPiRl7YPvVOH83/3Cv
	yrh41WSAYVmTNfUmV54v1v+u1b6KWPX1Znuv+2eevJ3CLC4pORn4RwI=
X-Gm-Gg: ASbGncvQ1qNE+uHEx+kfiiSJefO9RLpS+Ax6vwQ+gNEzW0WvyCr+JIhyIOrhJorDwg5
	LcU8Yavz90NKzgQ/i+62akDImgHl6cLhSHgfPCHc4ZXoHhUqPdhO6j5OIbln0zjVCBdWTbwTvUL
	CdU8tyG/Uhwxnoiw2wxr93xQJdgU204nmSj2Q6cDO5SAZ/T+z56tXqp1QNbvqfF3NBj3YJ+dZgW
	/YJBxCqR0jrBfj4mCNeoFNU2FIaCItPlp1/G2lYZAvQiwZCZcz3CIvFhzm7cUXV49wQPbA6FOBY
	2GFlt26LqyxP7o8KCZHwnrOlUSwaeRZ989K3dmA4lWw17WVOORHuVFV98JlJCknIPDa8AOFAcoY
	KQgY+5wheH1fOR/Keiv89ryfmBQwR8iQueNtOlZWs/n9e+EnYawJGR2k8rIuW40yUoThp50pZZM
	E0io8+dy3zLOxapj0+0sor6KcrzDIHsdd6IyiAn+nBMhw2ryxcIz4lThj8pA==
X-Google-Smtp-Source: AGHT+IHgX99E9cv28vr8O1yrgmwh6vSZ55vKpp0MJT2JQrEOaj9jsqJ+YmNr+/pK+23KaGgy+6yRXQ==
X-Received: by 2002:a05:6a00:13a2:b0:7b8:7f5d:95aa with SMTP id d2e1a72fcca58-7ba3c17e126mr11857011b3a.27.1763350970478;
        Sun, 16 Nov 2025 19:42:50 -0800 (PST)
Received: from samee-VMware-Virtual-Platform.. ([2402:e280:3d9e:537:d8f5:3b3d:a52b:2ac5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9251d31c8sm11218458b3a.30.2025.11.16.19.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 19:42:50 -0800 (PST)
From: Sameeksha Sankpal <sameekshasankpal@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>,
	syzbot+76501d32a94a432940a8@syzkaller.appspotmail.com
Subject: [PATCH] i2c: core: prevent use-after-free in i2c_get_adapter by removing adapter from IDR earlier
Date: Mon, 17 Nov 2025 09:11:50 +0530
Message-ID: <20251117034150.6380-1-sameekshasankpal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_del_adapter() currently removes the adapter from i2c_adapter_idr
after device_unregister(&adap->dev). This leaves a window where
i2c_get_adapter() may still find the adapter and call get_device(),
which WARNs because the kobject refcount is already zero.

Fix by removing the adapter from the IDR before unregistering the device.
This prevents new lookups while the device is being torn down.

Reported-by: syzbot+76501d32a94a432940a8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=76501d32a94a432940a8
Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a6..229158401d54 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1773,6 +1773,15 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 			       __process_removed_adapter);
 	mutex_unlock(&core_lock);
 
+	/*
+	 * Stop publishing the adapter before tearing down its device/kobject.
+	 * Otherwise i2c_get_adapter() may still find it in the IDR and then
+	 * get_device() will WARN because the kobject is already at 0.
+	 */
+	mutex_lock(&core_lock);
+	idr_remove(&i2c_adapter_idr, adap->nr);
+	mutex_unlock(&core_lock);
+
 	/* Remove devices instantiated from sysfs */
 	mutex_lock_nested(&adap->userspace_clients_lock,
 			  i2c_adapter_depth(adap));
@@ -1813,10 +1822,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	device_unregister(&adap->dev);
 	wait_for_completion(&adap->dev_released);
 
-	/* free bus id */
-	mutex_lock(&core_lock);
-	idr_remove(&i2c_adapter_idr, adap->nr);
-	mutex_unlock(&core_lock);
+	/* IDR entry already removed above; no new lookups are possible now. */
 
 	/* Clear the device structure in case this adapter is ever going to be
 	   added again */
-- 
2.43.0


