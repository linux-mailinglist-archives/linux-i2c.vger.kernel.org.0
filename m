Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF14428E6
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 16:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439656AbfFLO1K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 10:27:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34474 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439685AbfFLO1H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 10:27:07 -0400
Received: by mail-wm1-f67.google.com with SMTP id w9so4419294wmd.1
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2019 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=K+P6qWGcKWtU/iGNHzOV9jjR+RXyRp8egtBtmeeUZNHtvIIVBJLVzsH3Vy3gAMuwgR
         Ao6Mudj+9wGNnHwdrOfxdgHdBdIcy5MyVOGRSFy+u/wbSjuIQHDF55F9J3zqhVi/3bzW
         5HtveVGkaSLRv+2iEeE0w1LhFjT4UWtVB79zLW2+qAbLhdEdMRRAWva9Df2T5N4cUgds
         7+g7+Wl3XKZO1rJ7uvAaX/LDxFQBwuJvjUCgufBdOzBsYf9UsfRDcBji+JpUDqmSS7Q4
         /AWCGhD4M9fDnPW+0gkmxkwUaYgWL72BfJzZ7ePa8q3MSEccMjIXUPf0b5gg6hRk1f2l
         pkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=A6rzQECfYgOf86wJvP5P0lHTJqhni6nGxc80TZ9nh9UvM17dXj8Kx0CDcxTuGpMefB
         UwZlQ0cAOc5ISEyGUZxioxH8hMkbH1wvbcC85AXV0zb7U7wWFLgFupILnD+yy0pEra3M
         SLGNVcxa380OfCeOW5UkURFZ5AxwltMwbt5oOpd9zvs3IOd4lEGvXzWudj/haA0ryU1s
         GLhSVLBDXed+0lf1voHCwzKFyFPCSLVcb0gQrTdEo7lQfwvz0oOHX24AnAEuNlloJzRn
         e0KMUUNuztozLo4NT9xeWFEWikHE0nIwJ0KjJtyrnbxwJCkWF64wfI6/ES927YDz1anS
         lhaA==
X-Gm-Message-State: APjAAAWSo60mVAfRLopImfe9KYHKKp+H1sNSolRkM6n+0c9tNNWmFDwX
        lQLi7ur7V1i71DsVKSrldwsD+w==
X-Google-Smtp-Source: APXvYqzjB8dEwMcpuK7RiZ75qjBQSuVJatCq0iH0MPFGa+TZG6aAniFlqCXSYhHK14VPYk4WNlKsjA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr23429895wmf.154.1560349625039;
        Wed, 12 Jun 2019 07:27:05 -0700 (PDT)
Received: from dell.watershed.co.uk ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id y18sm203959wmd.29.2019.06.12.07.27.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:27:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 6/6] usb: dwc3: qcom: Improve error handling
Date:   Wed, 12 Jun 2019 15:26:54 +0100
Message-Id: <20190612142654.9639-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612142654.9639-1-lee.jones@linaro.org>
References: <20190612142654.9639-1-lee.jones@linaro.org>
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

