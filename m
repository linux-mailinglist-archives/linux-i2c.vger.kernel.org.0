Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58441849A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2019 06:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfEIEnz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 00:43:55 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36710 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEIEnz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 May 2019 00:43:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id a3so536414pgb.3
        for <linux-i2c@vger.kernel.org>; Wed, 08 May 2019 21:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=scFbWph7JHrKM6HxwUqzW/4Hy+E4AbiQZE3dZlFlEXQ=;
        b=KzejU6z/bMnWbc4nTdChjaRy5hh/WkrH8R6FLw32mOfxhbSvUqWnkCHjxUVy7RbBrx
         hUZwVYLtDDDoGsHz3299ofeiq5Ye9ZhdH3f0s14WawZJNoFWVGvXHyTG6TZqEG15Dnhr
         HFOzYnEIFPqIghh+tpcz8SXSm/gIL1vGazQCH9DxNc2Egq3TQLwgR0MGq5IJJHHt42Xb
         FL/DUn781vh/zbOVkZm7EQnitpPO3liEZcqsB6ok8pMZQl46ktUrA/m3820B5gFTVczC
         G2omrG+8ljOkvM/JjVzBTxJ8mdJ2E0AJZHEcvYohaIWZxFerjgyS7ozOwjOYFEAPrtGx
         qjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=scFbWph7JHrKM6HxwUqzW/4Hy+E4AbiQZE3dZlFlEXQ=;
        b=GZmcow6E3LemXCGXu23IbkP1WTO4JrnDkHk1APuGQfhnOKVzZReUi45thl4YtYyw5J
         jrDhl3vUsUBhZAaejY0VrskJMEPIHtgH8uuGlGsPow0R67CUCsRh8PjPWrWi4lSdsxPh
         8LjjYeFwSaPdXOc8Jqlt8x3cMXgagkY/vBNORl1F+J7kqH2okO6jW0QuinPmjRiD9ZzF
         CbW8gP8Y2MMBHvQArNnBBiRFYRLUgGtcQP+EbGUJMfHwnnR8jM+7SAuwblyIFWMwZv+w
         UFJz2vSCmZlFo3qCjkQS49j5l/4i1fQhs1hiZseyzPiOl3sbBDbHQ/eODZZGprs98FSP
         9Sxg==
X-Gm-Message-State: APjAAAWumCGif+cX0Ngut69MXYqovmoKghBEfh/rVw8GiVEUyTaXwMf8
        RrZGpHI1myjUDELgV3zd8PVXlQ==
X-Google-Smtp-Source: APXvYqzV+0CkkiDLf+k1unw85tkvpSJ+MfJTPDGU0ZVjs6Y/iHv0OKTrQElaAp497FA00+KeSVZtjQ==
X-Received: by 2002:a63:d345:: with SMTP id u5mr2699553pgi.83.1557377034409;
        Wed, 08 May 2019 21:43:54 -0700 (PDT)
Received: from localhost ([122.172.118.99])
        by smtp.gmail.com with ESMTPSA id c137sm1254639pfb.154.2019.05.08.21.43.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 21:43:52 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: sh_mobile: Fix compilation warning
Date:   Thu,  9 May 2019 10:13:46 +0530
Message-Id: <f526f90ea62741716de2ecfa310ba22d8cf1d3c2.1557377015.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This currently generates a warning:

drivers/i2c/busses/i2c-sh_mobile.c: In function 'sh_mobile_i2c_isr':
drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

Though the code looks okay and shouldn't ever use the variable
uninitialized.

Fix the warning by moving the code around and getting rid of 'data'.

Compile tested only.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 8777af4c695e..945eb8504fb7 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -369,7 +369,6 @@ static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_data *pd)
 
 static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 {
-	unsigned char data;
 	int real_pos;
 
 	/* switch from TX (address) to RX (data) adds two interrupts */
@@ -390,13 +389,11 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 		if (real_pos < 0)
 			i2c_op(pd, OP_RX_STOP);
 		else
-			data = i2c_op(pd, OP_RX_STOP_DATA);
+			pd->msg->buf[real_pos] = i2c_op(pd, OP_RX_STOP_DATA);
 	} else if (real_pos >= 0) {
-		data = i2c_op(pd, OP_RX);
+		pd->msg->buf[real_pos] = i2c_op(pd, OP_RX);
 	}
 
-	if (real_pos >= 0)
-		pd->msg->buf[real_pos] = data;
  done:
 	pd->pos++;
 	return pd->pos == (pd->msg->len + 2);
-- 
2.21.0.rc0.269.g1a574e7a288b

