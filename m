Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 274123B101
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 10:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388011AbfFJIm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 04:42:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37330 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388341AbfFJImU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 04:42:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id v14so8252100wrr.4
        for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2019 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qYq7mFFCoR+D5QhtdnXfa7L63GrDNr+4aaRo7anMzNg=;
        b=HAQGPWUrBC+m/uOp1ExdylTBwwXMRfgop11L7pNji5XWXcPZW+6ErRLi511mBcytaZ
         W3UqLkpw33YmjBArJFkiHuEHbOEyKduZ+bAn1mEZaUDLiIz0ME6BhyAqU9BZvH7w4t+c
         rfxKHG3Vi1cDONkuWZlhKKSyjl21utH0TeuiZXwU6bY4c5DqQm23B1Ij/Kf+CFiZQdZS
         1IreLq1aIZRV0ksEv4kfk4qGpXympkIsPxtlWW9qyKWS8h1amE5syenHSK7Z1CX4qH63
         7iKFPjYSg8pCpTER+gxm8AcOcrvXC8eg15KcJ/txMHz4kDbhbyfiQ5AM02XS+7GT4M7B
         8oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qYq7mFFCoR+D5QhtdnXfa7L63GrDNr+4aaRo7anMzNg=;
        b=i7wD75U32J9qvypXCPft5H6F0MKeNW5PNpj1r7s3W1mF9ZOXDKrZPApPwkiBnUyKFu
         d8whaiJdug4MaWjuEf9zXlgIGxAc7zMsnl2fsskQcubc22CXsX1CknPJOOhqCulrTAeR
         o/QFq7WOWWwDYorp3JELwRf4AVGwMmyWYwYsWKeyT1bqG/1ZwZc68apr3B8GL2P6pXsh
         ZIw4aZCtRkgiDFnijE8uredeOcZUmTB/AbAQI3SBr6gnRSvM8nPGqhhJymhARg08kVBI
         FVi7V1B2RqqJqsDX8q4pLBbhGzr3Oo/2BbO8fb6D3A8wcxlX8ydePfU/DuLVUHtrGsiq
         Oz4g==
X-Gm-Message-State: APjAAAXwtiFvR3h5JYODygvxySYARfZrzwsxk5tVEgEYWuDnntiNCFqx
        tCfuXOSJ+SE3AFagW2UvkGl7gg==
X-Google-Smtp-Source: APXvYqzd94XuV2bw5qRr4c4SqMDr5KX6F6dDBrqoRThTieNRJaWBshe3NLdMg2h1vW6jj1+Btr9Plg==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr28476611wro.162.1560156138478;
        Mon, 10 Jun 2019 01:42:18 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a125sm9929670wmf.42.2019.06.10.01.42.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:42:18 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 3/8] pinctrl: msm: Add ability for drivers to supply a reserved GPIO list
Date:   Mon, 10 Jun 2019 09:42:08 +0100
Message-Id: <20190610084213.1052-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610084213.1052-1-lee.jones@linaro.org>
References: <20190610084213.1052-1-lee.jones@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 18 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ee8119879c4c..3ac740b36508 100644
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
+		for (i = 0; reserved[i] >= 0; i++) {
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

