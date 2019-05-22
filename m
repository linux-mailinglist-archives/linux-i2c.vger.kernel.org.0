Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C29269E6
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 20:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbfEVSdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 14:33:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33538 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729483AbfEVSdi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 14:33:38 -0400
Received: by mail-pg1-f194.google.com with SMTP id h17so1760396pgv.0;
        Wed, 22 May 2019 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+s+DmZIyyyo+qkPPae5sUO6k73P9MlEz1b0ln8T2CEM=;
        b=r+8UnKWWKQu3xDRM6dqq6H2tx3R1LmjWojpjKqrUh6GPjkJUY6MZoP6748LjDguJCc
         2E5RbdyAJn98t0m91DEX/iVmGS6TXVVGp5frSHuMhkdlyDCPo3NJl142OJsa9FWk8Ojj
         lhoQDHuFMtcElYn4Qq6ndtAplQDO9SAn7vG+QQw8wgpWLkfln2XUwKhNvjIuwDJwKRvm
         UR6FPDcPdOqOFduxfl/1KkuwbWHR2S14P0d6RkJSINwfm8F77rxPyWee0KUMNaCr2L1A
         UOWnHrrDpIer9G4ZCJBQkK2CESnWQw/30JhYPl1WZ2LI07Gj18WoEOqADXlOXAfYoTg/
         6ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+s+DmZIyyyo+qkPPae5sUO6k73P9MlEz1b0ln8T2CEM=;
        b=ic7NFKQO5wQvDNZUIxeZrAX6806CdBNG7B2bLG8vusROZMgjG1XkP+svSNcERIupB0
         XzZTNrl+lqMbNqlZj9yRidkLk0yejnqf1irvqvbXcGECTueRVwmeGtTYszDd+Vw++Qax
         c43O5Co//7hYWxfiNKB3HRvVUQEeMZ1iINoyztA1bjhk6/x6NyIp2w8aklqLLuZazb11
         EOX4MU+AoTaXjS0QXAIjQE/ZMlu6gERL0orK8pDrOoNjZdicUdQQ4aaN/eFLPPUhRE+q
         f3JgT4CLCaGypArNkLbT7TM04BZhzYdzqkLHdmZwqu2ak1QpttPf/BO7CEL9I+L7P+J1
         ke+w==
X-Gm-Message-State: APjAAAUx8C/tInix8/bAa97VNNsmzeX4RQJQpqwAX5KEDSNaoTHttvkm
        s81ZMyB1ojgKhQqnpeMWgS5wr/61ITQ=
X-Google-Smtp-Source: APXvYqy126bYA6YOJMC0w/jX7oEZuowWtzQPG1iadAoJ5sDno3uSMLsYfnkBphFc+dHo4NW4r9QIMA==
X-Received: by 2002:aa7:8683:: with SMTP id d3mr52001783pfo.145.1558550018258;
        Wed, 22 May 2019 11:33:38 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c76sm46138294pfc.43.2019.05.22.11.33.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 11:33:37 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v3 1/5] i2c: nvidia-gpu: refactor master_xfer
Date:   Wed, 22 May 2019 11:31:38 -0700
Message-Id: <20190522183142.11061-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522183142.11061-1-ajayg@nvidia.com>
References: <20190522183142.11061-1-ajayg@nvidia.com>
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
Changes from v2->v3: None

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

