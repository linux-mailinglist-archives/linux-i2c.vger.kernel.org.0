Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19ECF38632
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 10:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbfFGI3Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 04:29:24 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37285 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728032AbfFGI3M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 04:29:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id v14so1234498wrr.4
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 01:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=qS6/gC3g0ivDxQeYTAyAXWuKblhoYJyrn1fhCTmRyYAb/dWfOeXaEtzpJDpgr4/keC
         y9YxUUGJsjTMzcLV0Xk+Gm3yNRHp+YTAA8eMqqZOxwkj8MByuQQdEKhqYlEO3weOrF7m
         Jm8HKR9UNUcaw6GVDTJe18vTDeIrxL/txUdpmREfkl/zV1qCJggDJ0qvOs0oFjXzfDhX
         QYmnCarRktfnHTYRBX9mOzCN0H8TbcO+skVCCW4zXhp9qmRFsbGuiOiABEgUZFpnmzsi
         uv5c8stevPakNzYje7bhOZlX4YXx0QxavvOfiqJC9mF+9fxItWO/Uh3ILMCG9Vx4dVGM
         pHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=uQ1kOuQXuFaK9hp/TmsQi09nQyK0/Q0RIXhL/XckS+YHhU15TrQm+Kc/hfKtD/vHyY
         9FsRkl9wbVOMDBQyZtn6Azihp0Sp1E9+B6OUpSnZI5z9DD5kFH+qgvf7A2cYX701sfzQ
         li61Wju83tUW1mgub91i7590tCxAFI7C6r/Pv8ZUY/3zHqNilCqAuuW7NSUQ7dYOiUDL
         PvGZ5TyhD58+clHmwJuRNtn6DlDAJj5O/Silb9cg02ur21c1lcxzgasewOvr0G42hjea
         UTAMlDzAmUn0KyMlnLl24ITeyTsSWAyyDLrpnm4kJQadTTo9OUPttGD4fGigps3ABwZV
         lFYg==
X-Gm-Message-State: APjAAAX5eYKQtXFfXTE5SlbJveR8e91LSmHgqvTt+2kAERFhm6YvlUvC
        9vHnxUHyKDvun+HSl1cnyzM0/g==
X-Google-Smtp-Source: APXvYqzSmJjzWO+MJ9nCzabQMhjV+5XfkNRztLbNtFMbdchLDJu2eVByL+7ShB6cmtMge7GBvY0Nug==
X-Received: by 2002:adf:ce8f:: with SMTP id r15mr21014523wrn.122.1559896151288;
        Fri, 07 Jun 2019 01:29:11 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a3sm1092946wmb.35.2019.06.07.01.29.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 01:29:10 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 8/8] usb: dwc3: qcom: Improve error handling
Date:   Fri,  7 Jun 2019 09:29:01 +0100
Message-Id: <20190607082901.6491-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607082901.6491-1-lee.jones@linaro.org>
References: <20190607082901.6491-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dwc3_qcom_clk_init() is called with of_count_phandle_with_args() as an
argument.  If of_count_phandle_with_args() returns an error, the number
of clocks will be a negative value and will lead to undefined behaviour.

Ensure we check for an error before attempting to blindly use the value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 55ba04254e38..e4dac82abd7d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -409,6 +409,9 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	if (!np || !count)
 		return 0;
 
+	if (count < 0)
+		return count;
+
 	qcom->num_clocks = count;
 
 	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
-- 
2.17.1

