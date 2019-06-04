Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5FA3448E
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 12:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfFDKpJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 06:45:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51657 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbfFDKpI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 06:45:08 -0400
Received: by mail-wm1-f65.google.com with SMTP id f10so14344948wmb.1
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2HLapY/4ckHjahK5LJcjODvHB1d03rrvr/gU9+ztXyQ=;
        b=h3nEBCdfV7YoBlTlbe54J+YSDIvFJyXTob8NuoluPo7EfSZZElzYcZr6vSJWljnUnv
         dWRhGXI+d9hH5RgiAEGyaeZmndgWDOABLjIe3Fmy5TenMX9By9v01G8ZKdnulQokaH6A
         FKRiNN1x249LHRm8hy9rPBQnyYz1oVhCtEeYxPQomujeraH88eVU2RDpZYk8KZlLVtqR
         SOc/OCn6T89mrbQHSERwodJdfezyYN4154BMhcEWEUhOTb5rv7f8twOa0IADvr5wEn8c
         MacizzPwwOcliiupf2xtn0WwMsVCTUP3KKg8y95UkCtqVxXdgJrcDkPOTEsE0rsVuYCR
         c/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2HLapY/4ckHjahK5LJcjODvHB1d03rrvr/gU9+ztXyQ=;
        b=XDYu5UcMgE728TjnCEEp1PMEYIF/iS7GlNrKPjN5xlOTkaqumTqj+ay59ldAb3XH88
         l089tUeQl8LPdYXdPrAZ3+pb/6KtLmpMB/VF/STkBAAXXUCdqDxCP4WcwPZ6fTaTd7oj
         B3H5JMEzO6Skv+4rgU7GkokmOWz/NH5isJ7vskNa56DNAZF7Gz01bIXoTwgr3eZhxQMt
         zQ2PyfoVh2IqsRn7IwfmLuO0qNjiBt/ZlgW6Ao+qlET10kzGNcyU9Mcq+Xp/sHOBqgvm
         kRFmSO6VjSFZz/txv4DCrSIqZ7MrPaudD0J3u8wpqEqq+Hm3NOY1OKQFb2XM+jbOTFrx
         t5vQ==
X-Gm-Message-State: APjAAAXs+LZXb8taZor1X9EdRCd81yI6YOhkhVNUB+F1eWrxutONnCJ7
        0vLsLxSn0bK2sniV/Kjl2tqSIQ==
X-Google-Smtp-Source: APXvYqwAauLGrWOKVC2+6EC+g6TCNYY/YXSe0eNOWSn2KLwlCqvwxZRRPlOIe8/uut8i0itw+ONz9A==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr18294440wmf.34.1559645106162;
        Tue, 04 Jun 2019 03:45:06 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:05 -0700 (PDT)
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
Subject: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
Date:   Tue,  4 Jun 2019 11:44:54 +0100
Message-Id: <20190604104455.8877-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When booting with Device Tree, the current default boot configuration
table option, the request to boot via 'host mode' comes from the
"dr_mode" property.  A property of the same name can be used inside
ACPI tables too.  However it is missing from the SDM845's ACPI tables
so we have to supply this information using Platform Device Properites
instead.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 349bf549ee44..f21fdd6cdd1a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -468,6 +468,11 @@ static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
 
+static const struct property_entry dwc3_qcom_acpi_properties[] = {
+	PROPERTY_ENTRY_STRING("dr_mode", "host"),
+	{}
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
@@ -603,6 +608,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			goto platform_unalloc;
 		}
 
+		ret = platform_device_add_properties(qcom->dwc3,
+						     dwc3_qcom_acpi_properties);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to add properties\n");
+			goto platform_unalloc;
+		}
+
 		ret = platform_device_add(qcom->dwc3);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to add device\n");
-- 
2.17.1

