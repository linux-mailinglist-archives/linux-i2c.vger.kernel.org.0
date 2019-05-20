Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB782408E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 20:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfETSjj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 14:39:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37083 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfETSji (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 14:39:38 -0400
Received: by mail-pf1-f194.google.com with SMTP id g3so7647886pfi.4;
        Mon, 20 May 2019 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u+oHAcGtZPY9MkX964m6K0jEbxGlXsOBCtw8/XdWJBc=;
        b=dTmdtBTu0KfU3JKjyHehh3qdTB2scmcJhxCj36zjcU+iTyZ8nBnIZfbo9f8tuMMZOx
         yYV2j34uWSPLOZqAF5DmmLAwVUyo3rxtGRB4dicZ7O91HqPw5eQL0gGv7qzaJFxD+ZeG
         NTRYUPl0hM4JZ6IvqI/oBgJ3AygxFaRh5GruCm29Ht+UyItUWHxwTJNW51oriky8lYjV
         KSarYVsQ1REdWLaNuI0bAGqZL/BvoNWl5Ewda4qYwo3e7XU7TbC0PbZW6v133YZSrQPn
         qvtthTltLJV0jGhQlVofLC9Y19k/06hKet0qr6AIUvj7N5joQiPOBxXGHUnq33J9HKSk
         oi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u+oHAcGtZPY9MkX964m6K0jEbxGlXsOBCtw8/XdWJBc=;
        b=Mf8ngkUvnyltR8jXYahB1gDgsBZCa8hEknsEcMjUIlGMOAWxADGfnbtpPuO3vmR0d2
         9+z5D9HP6xQSgP23aK6JZbT+92MSTfZ6JznrIuCVvx1FBdthlOQDOomoxGRFiqzcvg5u
         e1KJj3kf75xchgYb09A6TNAGXwAvUxBO0WP8W+6WAMETGQmqSGqi8VNiAe+FQh4zilSi
         Ke6+1EsBvHMXqh8IifMDZ8JwF/4oaSDdmXSKAIHUebkQJmnujig0QMZ7IyfFiijkDMr1
         KzpU17meCpMOvK9RE8A3NGrrf1Djibs79kAW49JH89sC8A0hZux4wAtthpXvxIfwpsdz
         FG1Q==
X-Gm-Message-State: APjAAAXD5dH/v8gmSRcTumE1GPlqws9etzSw5zzrTeNXFXYtjfj7fZNO
        zDJtisljndibzsFyNVB1Vak=
X-Google-Smtp-Source: APXvYqxnoFEGqhsuPeiYEh66EFNa4z6hrkx+5iQk8asm+b8U77y78ez+hQhdN/LWoWnygndHWI6nWQ==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr52887154pgp.372.1558377577936;
        Mon, 20 May 2019 11:39:37 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id o20sm22321288pgj.70.2019.05.20.11.39.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 11:39:37 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v2 1/5] i2c: nvidia-gpu: refactor master_xfer
Date:   Mon, 20 May 2019 11:37:46 -0700
Message-Id: <20190520183750.2932-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520183750.2932-1-ajayg@nvidia.com>
References: <20190520183750.2932-1-ajayg@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Added a local variable "send_stop" to simplify "goto" statements.

The "send_stop" handles below two case
1) When first i2c start fails and so i2c stop is not sent before
exiting

2) When i2c stop failed after all transfers and we do not need to
send another stop before exiting.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 1c8f708f212b..2d9561ec2320 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -169,6 +169,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 {
 	struct gpu_i2c_dev *i2cd = i2c_get_adapdata(adap);
 	int status, status2;
+	bool send_stop = true;
 	int i, j;
 
 	/*
@@ -182,37 +183,41 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 			/* gpu_i2c_read has implicit start */
 			status = gpu_i2c_read(i2cd, msgs[i].buf, msgs[i].len);
 			if (status < 0)
-				goto stop;
+				goto exit;
 		} else {
 			u8 addr = i2c_8bit_addr_from_msg(msgs + i);
 
 			status = gpu_i2c_start(i2cd);
 			if (status < 0) {
 				if (i == 0)
-					return status;
-				goto stop;
+					send_stop = false;
+				goto exit;
 			}
 
 			status = gpu_i2c_write(i2cd, addr);
 			if (status < 0)
-				goto stop;
+				goto exit;
 
 			for (j = 0; j < msgs[i].len; j++) {
 				status = gpu_i2c_write(i2cd, msgs[i].buf[j]);
 				if (status < 0)
-					goto stop;
+					goto exit;
 			}
 		}
 	}
 	status = gpu_i2c_stop(i2cd);
-	if (status < 0)
-		return status;
+	if (status < 0) {
+		send_stop = false;
+		goto exit;
+	}
 
 	return i;
-stop:
-	status2 = gpu_i2c_stop(i2cd);
-	if (status2 < 0)
-		dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
+exit:
+	if (send_stop) {
+		status2 = gpu_i2c_stop(i2cd);
+		if (status2 < 0)
+			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
+	}
 	return status;
 }
 
-- 
2.17.1

