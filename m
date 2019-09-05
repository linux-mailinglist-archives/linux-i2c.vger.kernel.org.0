Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1AFA9F88
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 12:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733112AbfIEKWw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 06:22:52 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:42777 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730839AbfIEKWw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 06:22:52 -0400
Received: by mail-wr1-f46.google.com with SMTP id q14so2066633wrm.9
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2019 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8xEVf00Y33lenJGWE1WtURKsjjiVID11MePd5b0emho=;
        b=yAw6iuIOSuOZ+YXKeJEQQfn6wzRLUND3C/Q+xp+Go2IqXw7O0y1G/s8YOYuFi5e9+y
         lBvutzg4MJe8da4PkCcQz73BqztCf0iujT17EuwKLLWB4R+Fr0MefM+4spDMtuxQFLx5
         zk2gyYDyP/H+Q9nXMujL/l1wG6HdhxfZCO/4mlH5xRw0n8JvuwIEElv8AUYmyPk4Ypv/
         gEMmY7av3rkYg8EBijSJShFm0ukmzYoGlUM6DpABiGDNrsKAbO0BQaYx8S7VKJp7hA8c
         +IMuRTJicum2UfBMhAsU87uuqHtGd7mXUoVWGsKRJHw4XVu91Xbb0cFmoCJ/QnxxfyI9
         HM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8xEVf00Y33lenJGWE1WtURKsjjiVID11MePd5b0emho=;
        b=iqbj2O4e+rtdeAb4/whF8YsNPfd8OiaMOGACI5Wm4QKEJP/Yo0QKWf+pl/OEVWPWmr
         GGjIb/TEfGw0CSVwTiLxBcTW6HdT1PIK3xEwDRRTyorIYvTbRMkC8ONm8/Py37kHojFD
         sSIwyZWTEF+k+/nW8Q4yS+lykltodxmMGF/HssiWyUig4I/oB07VmCNY2PMySntD99Jv
         s4wpXaR/0vHMqw8ktG5ms7y4VEyM9nSEjAgPw/38W2ySjwaccsAno39f0QR8UWz/Tdwy
         fXiz4dwQq9ibis/FPgXodzDVLF+kECN7eRX5qIHVf+AGJ6UK3Lz6kmP+6OEebc84Qpw9
         Z42g==
X-Gm-Message-State: APjAAAVsBIwwUsA1cIdHyIGHZrrTUmeD+wjUlPr5Ik6q0v9jDjvIKZJl
        sY9YDaTK8933zsWXzbtRpEeEFg==
X-Google-Smtp-Source: APXvYqzmbJAh9A9AFOK7TMEJNJgAkDyKpZ3l6Gm+oQLOYe2+z/aL96Z6LnhW/H/QG2oOLwJCl34d2A==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr1883163wro.83.1567678970169;
        Thu, 05 Sep 2019 03:22:50 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id i93sm1779947wri.57.2019.09.05.03.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 03:22:49 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org, vkoul@kernel.org,
        wsa@the-dreams.de
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 1/1] i2c: qcom-geni: Provide an option to disable DMA processing
Date:   Thu,  5 Sep 2019 11:22:47 +0100
Message-Id: <20190905102247.27583-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have a production-level laptop (Lenovo Yoga C630) which is exhibiting
a rather horrific bug.  When I2C HID devices are being scanned for at
boot-time the QCom Geni based I2C (Serial Engine) attempts to use DMA.
When it does, the laptop reboots and the user never sees the OS.

The beautiful thing about this approach is that, *if* the Geni SE DMA
ever starts working, we can remove the C code and any old properties
left in older DTs just become NOOP.  Older kernels with newer DTs (less
of a priority) *still* will not work - but they do not work now anyway.

Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
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

