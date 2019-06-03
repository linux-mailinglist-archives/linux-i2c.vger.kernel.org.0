Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0738F33619
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 19:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbfFCRIi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 13:08:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40438 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFCRIi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 13:08:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id d30so8634932pgm.7;
        Mon, 03 Jun 2019 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0oU8V6DHCR89gYiqXIzSDaMJIWmUkeY1uDMM7H1JXJ8=;
        b=BH+934U03paTWpgYHnODuk2QEsJUD3bGa3+pPwbDAlPgUbx2PueKlO/Y7IcwV+2URH
         mxHaVW3uK3ZtoxKy2xM7q2hZdr8vjxn50Kx0D199SeZrjATqL9r1s7oatRgDDm8/eSzx
         5HTrFx7qpliZv+x1XIedStFfmqe5juxhCN4dCEh9hD2uqxVMtlAP3untT7l7LovpYyrO
         mzKGxR49CkpJS/szD4FOdFSE0qsI7V2mQgTIh00ZqZ0kE9FHXBfeTNff7iSEn5QsvO8y
         6lbs8NxLwKB6D/JleM48yih3c3CzwFoK1Xew23q3fPSZO/iEQUgqJp1D7+0JWxKNhXpa
         xWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0oU8V6DHCR89gYiqXIzSDaMJIWmUkeY1uDMM7H1JXJ8=;
        b=KBVKWDtQ7bDbj6GKY2Y4BG3ukZgDrXIzGjjVttn9TuZ9T2P2D2qxMMjdJiyFAe4k2c
         BsGyg1F/ZQS2s2pvCIfMsYbsTxBzItCijUE14MA2QbaSxO7NB1QKtfHbufsCPF4qDnoC
         lez1FgqnZJfWWxbRsBbLJ/isMUlEMwwDkeEaTmVV0zX8QSsOEhgsKBEVOdjYW6rvYG2p
         8iODH6RLRKTebgRWG1AX1seXXxksnH7PG7ZXVoC5thju6n16MhnT7y5F/K6tGEHOrP1K
         xsu9dJa1lyfSufm9zSAt5DCR1V35k+CEkr+47IXGlT9tW7gYW9xYWHUoGgmynCgZxvWv
         A5HQ==
X-Gm-Message-State: APjAAAUfW6jFZX3bfQO+27Syhzx4Lk0cu6+pBHxahn8xrLRDvDUtFe3W
        5/S0aHuV9gwb7SRcLZu/DDE=
X-Google-Smtp-Source: APXvYqz5i5RreVE9yQJZloTTnO8Ece6e1MNgR6/repuV6J+v3X99eS003QoXVuGLayJYv89ZKj+nDA==
X-Received: by 2002:a63:eb55:: with SMTP id b21mr29044717pgk.67.1559581717263;
        Mon, 03 Jun 2019 10:08:37 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id p63sm17988814pfb.70.2019.06.03.10.08.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 10:08:36 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v4 1/5] i2c: nvidia-gpu: refactor master_xfer
Date:   Mon,  3 Jun 2019 10:05:41 -0700
Message-Id: <20190603170545.24004-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603170545.24004-1-ajayg@nvidia.com>
References: <20190603170545.24004-1-ajayg@nvidia.com>
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
Changes from v3->v4:
	- Further refactor master_xfer based on Wolfram's comment.

 drivers/i2c/busses/i2c-nvidia-gpu.c | 30 +++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 1c8f708f212b..f1771beb75ea 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -169,6 +169,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
 {
 	struct gpu_i2c_dev *i2cd = i2c_get_adapdata(adap);
 	int status, status2;
+	bool send_stop = true;
 	int i, j;
 
 	/*
@@ -182,37 +183,42 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
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
 
-	return i;
-stop:
-	status2 = gpu_i2c_stop(i2cd);
-	if (status2 < 0)
-		dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
+	send_stop = false;
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

