Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6279D344A8
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 12:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfFDKpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 06:45:38 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45021 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbfFDKpD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 06:45:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id w13so15238788wru.11
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 03:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=A0dgN5hMyM5nxH9+M3vRRIGFYdtXHLmFGt167GY3zJI=;
        b=DHDjY8W7XNwgZLrWs6Tbaf/vx11sNga7Bt6FMHM9T7hwa8GkndNSQBvuVNxuhwVnLC
         CmSYL3dxuhqZfnAng9Fj6BbpLFcDcCeFXCKhWKDEHRJTllPxEK/xFxJLgnTVkupDLvQs
         2+FLplp7gSQ1nlMo8mCnf+3tmok03BTwcuEtLI9n6LgUQ/RQVxhuS6PmOm35rtdI0uLj
         MTJE0qn6O0nQecJCUQgO0dajMXH90s1mNhc9Ax9vsrvbd/7VnruOU44JAk3lClJF2uEY
         XxCS1L4nRHo2Tdd1zgkaMv0onf2ZyNa9nq21lCWcHh/79BqgateHE8PYQwdpXhXWSi6B
         00Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=A0dgN5hMyM5nxH9+M3vRRIGFYdtXHLmFGt167GY3zJI=;
        b=SWtRxB71IiNvdXS3MDSq29C5+s+yj8CWSJ/63yphKUtoPR31BOzLQb/+bN4pOUQBst
         i3aOd0tojpsZAz71dzTmOGBDif5GIh14Leaf8OkMawQCh3rH/TwuOOqhRmldMQexKU+p
         IM6hOrCOp+6H/G4ChP5V7GYpv24sDDI0K18Xry10wGdMMuX0ic46hInrHFS+X9zaISBp
         c0u6bFYp+pMIH1eq30PtLTVxO9/qO8/t6aJbMwPdRbA5AoDkg6WQWADEKIqz19TrVaOH
         gsUSzZJuL8JYhJBxQtjQnefJ2tdJnF9clFk9eIEewb48ynOsF5w+Z72L4nMgPzRpaufz
         i6AA==
X-Gm-Message-State: APjAAAULSipr8yoKDDSlV1vtnn/BYp2Ks5Lg2QAC/5O+mtGE+LcJR9iB
        7qRObK/lJcbl6u5Z/VSWPm3WFA==
X-Google-Smtp-Source: APXvYqyfSmVLg+r7QIrO4AzYchY6fMxXo5LCqOKirQ0x3FpS7LhFRv57ogismPjwpMqYflYeC8wQFg==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr1508854wrr.317.1559645101648;
        Tue, 04 Jun 2019 03:45:01 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:01 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 3/8] pinctrl: msm: Add ability for drivers to supply a reserved GPIO list
Date:   Tue,  4 Jun 2019 11:44:50 +0100
Message-Id: <20190604104455.8877-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When booting MSM based platforms with Device Tree or some ACPI
implementations, it is possible to provide a list of reserved pins
via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
However some ACPI tables are not populated with this information,
thus it has to come from a knowledgable device driver instead.

Here we provide the MSM common driver with additional support to
parse this informtion and correctly populate the widely used
'valid_mask'.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 18 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ee8119879c4c..b77f22348907 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -607,8 +607,23 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
 	int ret;
 	unsigned int len, i;
 	unsigned int max_gpios = pctrl->soc->ngpios;
+	const int *reserved = pctrl->soc->reserved_gpios;
 	u16 *tmp;
 
+	/* Driver provided reserved list overrides DT and ACPI */
+	if (reserved) {
+		bitmap_fill(chip->valid_mask, max_gpios);
+		for (i = 0; i < max_gpios && reserved[i] >= 0; i++) {
+			if (i >= max_gpios || reserved[i] >= max_gpios) {
+				dev_err(pctrl->dev, "invalid list of reserved GPIOs\n");
+				return -EINVAL;
+			}
+			clear_bit(reserved[i], chip->valid_mask);
+		}
+
+		return 0;
+	}
+
 	/* The number of GPIOs in the ACPI tables */
 	len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
 						   0);
@@ -964,6 +979,9 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 
 static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 {
+	if (pctrl->soc->reserved_gpios)
+		return true;
+
 	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
 }
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index c12048e54a6f..23b93ae92269 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -121,6 +121,7 @@ struct msm_pinctrl_soc_data {
 	bool pull_no_keeper;
 	const char *const *tiles;
 	unsigned int ntiles;
+	const int *reserved_gpios;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
-- 
2.17.1

