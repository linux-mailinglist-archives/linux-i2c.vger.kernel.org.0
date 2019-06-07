Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B513923C
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 18:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730890AbfFGQhg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 12:37:36 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35589 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfFGQhg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 12:37:36 -0400
Received: by mail-pf1-f193.google.com with SMTP id d126so1507431pfd.2;
        Fri, 07 Jun 2019 09:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QcjUXz7nVEMbWa87Mu+IjeJIB5ntFwP9kHk2aKWjaXI=;
        b=a6oicHVL2xwsRWZhYX+ZVKCuTvcsjtLoFODV0F4nMg+2ba8FmPtw5I3/e1exV1ovA8
         zSnFoKd2DsYELZRCDlA3hJh38iV/6SdlZFZH0t4AupQRVHg1CfEweKylQpDFJJbJeC8s
         ml7EF5Py2s7Z2VHDbLkVyyEC9d3kGTJLSWzxuItPC4UWDyXrv62s1vP4bFhPMnCg4isb
         ujKLWAwlVkuvYcOL1t1tcum2Lqa56HT5FFuCL2mqTCOk00Vig2ScM9ua9IO6nJ/z0p/a
         q67BRvtmUb2A+OQxI160t58SUOboNr4+ZMsV9MJr7kH2cpMNp1EKyxBYfHc1i7OA/BRH
         D1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QcjUXz7nVEMbWa87Mu+IjeJIB5ntFwP9kHk2aKWjaXI=;
        b=tPjiK/vxzNXOuz1aFtgUEL+FK5/MGEw2k9Kn/XT9C50QpHCWCKVLwF6E85DFlzFwv9
         qpqWnX7DvInqQBvqKM3i9X3+pJy6TarbC2AUMpLm3oDPH/7aLPK2hjqncUjSMsMjitoh
         op8yTHsXrUIjA+soLpYw9fpP4Rf9lLoTZu9B5yurMJjgP1KJEuEPRmSlrP1wpxDd/L7I
         P41phD1zKf9NTjYq7Gfo8N4qFCr6PAlabJCR5SUypOzsmQ0PikwKxzq3+MBQuSqlKIZQ
         5A4wLNeTELcYOxDU2OPJZdFd6z2kZ34DmUGXe74Oe0Jz25lS7fvoePe+2LQWzJ1F1ccv
         oASw==
X-Gm-Message-State: APjAAAXAEMjvdhskjnmdMCHPXe28uM5iOz5qHJHgIY2Z4kmanIIrGLRb
        nzAaipKRfzsfeAO4wZgPbE8=
X-Google-Smtp-Source: APXvYqyMeTo3seKVxNORqzGwCsDmn9Cy/xZUmZgPMSSmtepAHTyl1CZv9og0unQJtVw02cB7Zf0phw==
X-Received: by 2002:a63:52:: with SMTP id 79mr3624708pga.381.1559925455245;
        Fri, 07 Jun 2019 09:37:35 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id t2sm1745520pgj.39.2019.06.07.09.37.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 09:37:34 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v5 1/5] i2c: nvidia-gpu: refactor master_xfer
Date:   Fri,  7 Jun 2019 09:34:19 -0700
Message-Id: <20190607163423.31860-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607163423.31860-1-ajayg@nvidia.com>
References: <20190607163423.31860-1-ajayg@nvidia.com>
X-NVConfidentiality: public
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
Changes from v4->v5:
	- Further refactor master_xfer based on Wolfram's comment.

 drivers/i2c/busses/i2c-nvidia-gpu.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 1c8f708f212b..7678a460bf9a 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -169,6 +169,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 {
 	struct gpu_i2c_dev *i2cd = i2c_get_adapdata(adap);
 	int status, status2;
+	bool send_stop = true;
 	int i, j;
 
 	/*
@@ -182,37 +183,40 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
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
+	send_stop = false;
 	status = gpu_i2c_stop(i2cd);
 	if (status < 0)
-		return status;
-
-	return i;
-stop:
-	status2 = gpu_i2c_stop(i2cd);
-	if (status2 < 0)
-		dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
+		goto exit;
+
+	status = i;
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

