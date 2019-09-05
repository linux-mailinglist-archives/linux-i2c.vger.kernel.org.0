Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 652D3AABE7
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 21:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfIETYS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 15:24:18 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:39361 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfIETYS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 15:24:18 -0400
Received: by mail-wr1-f50.google.com with SMTP id t16so4065180wra.6
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2019 12:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=19vbMBbLeKgWt8VsEseKuJu+9+rmeS/Lh0ZhXOFWQYc=;
        b=j/6kUy9psCaV+YLvz8j0kAZ3/WrmOU3xyh5rDOj0TwK0TnwjLtaLil9Q+C9KpFvvVG
         h4R8p4cZFB0U4b/PAfc9Xt4p4xJNkAIpTzL4QRjM+nkXdDcYyiwUGkr9BRJnJmO0lyZB
         zmylqwjRd1oOrTQ1tPvwqUV3OUR5u6WA+rDyhn+A516vskkns0bEICMG787HdDEwjigd
         +3SR4L9u7swSDpNhqxtfPsn9UFP36sehUfgx32xUcjUhX3ls4RtX+6HCZU+rkeQuILt5
         0qlmqliIuKXWkQe+ii/gtrK+ulFQ7lEl76YfDJyqXVo4Z357rIhVFAz+mooVn5qpscmU
         E+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=19vbMBbLeKgWt8VsEseKuJu+9+rmeS/Lh0ZhXOFWQYc=;
        b=cq3HijGLFpU9MFW0MERim5tbYs/VJTf7WoGHHBbI/Sh8X/OF4jZxgFxK8ILNqwPDdM
         hBruZ/DRZNJ9p3bZsaM/H7L2AYs75zSKu4E1/LAFbYnowJPo162YX8p7GRHNNi+Q31yD
         b24cGMgqX0GBfjq+04TvSGsPXIwn93kZMu8B/rshdMa5Yk+V56805V6G5mHvCKPaeyis
         edoIp37AYxl27U2RbTWiEt2OR5Kr6541NuI5hKpcbMkamTxPwscwL5uHK2y6aAYOzgae
         P/Njl0ditPgx1ieKQoMOg7B8UlUp5qrlqZd4X74i5cDD0TVVn6lKbSAnCQwWNWjiL6Zs
         kbYQ==
X-Gm-Message-State: APjAAAVkmTZB/cD1ndMf3FQGT5lST/R2eWp6BWMnmjIQNNL75pEaIlGR
        Nm/iIT48ETU4OqLWqnQPwN2YbQ==
X-Google-Smtp-Source: APXvYqyThx0kWliMdrjc7dedZ/+AhabFi7TIc04exnxhWAEkAOh7foRP8Cz8ZjjhxGJCvUyUPA4lFg==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr4172788wrm.172.1567711455933;
        Thu, 05 Sep 2019 12:24:15 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id q24sm7942378wmc.3.2019.09.05.12.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 12:24:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org, vkoul@kernel.org,
        wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga C630
Date:   Thu,  5 Sep 2019 20:24:12 +0100
Message-Id: <20190905192412.23116-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have a production-level laptop (Lenovo Yoga C630) which is exhibiting
a rather horrific bug.  When I2C HID devices are being scanned for at
boot-time the QCom Geni based I2C (Serial Engine) attempts to use DMA.
When it does, the laptop reboots and the user never sees the OS.

Attempts are being made to debug the reason for the spontaneous reboot.
No luck so far, hence the requirement for this hot-fix.  This workaround
will be removed once we have a viable fix.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a89bfce5388e..17abf60c94ae 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -355,11 +355,13 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	dma_addr_t rx_dma;
 	unsigned long time_left;
-	void *dma_buf;
+	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	if (!of_machine_is_compatible("lenovo,yoga-c630"))
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -394,11 +396,13 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	dma_addr_t tx_dma;
 	unsigned long time_left;
-	void *dma_buf;
+	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	if (!of_machine_is_compatible("lenovo,yoga-c630"))
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
-- 
2.17.1

