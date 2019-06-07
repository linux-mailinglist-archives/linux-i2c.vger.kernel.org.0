Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A59638634
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 10:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfFGI3Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 04:29:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36877 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbfFGI3L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 04:29:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id 22so1020533wmg.2
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 01:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=D1YI3KbYi08Gt53137zQUvYaTjAlj5pAkcVwiE+DyoM=;
        b=onAIZ/TOMn7vu8edA+Q0maMV3YC0CutOaiTQNG8U24Hc/kDK9jS/fHAe1a20UhN0fo
         7cNBfiTEtfbcSLzpHgMkUSMC1YIVfogH4tTE/eLQukkLUqAGYI0rilKVlpKmsXpmHS+h
         6IlLik8qVl5LgO9Vj0+ZcIBb3HCFhBAS05RmRB+Wb6MimlzNof589ejFsF2jCViPAMlp
         l6n4mF6y4W3R7NMRsous4rjXQC6Z/VnK87t4T7yzjnoxlLkj9oPQxofR4cn6zbLRpyeM
         OPYYEyhi3L76+sQ3G3maREXu+j/KZuaeQ79HK23oR43rcClTk7b235we0Bd9jZccRP8L
         PNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D1YI3KbYi08Gt53137zQUvYaTjAlj5pAkcVwiE+DyoM=;
        b=rg8mnzl+oLatLpQvN33CqhbRPJWszRflzpfLkPs007zVpwEltQgqnmI1s32mKCtxY4
         7PkhQmTH0AuIJDv4eJhLVo2fPbgMv4J+yudMV9biZbdbXAgP5OdbdC5JW4lt5lR4FzaA
         AW8r1rbvgBAgD+gR1qC/ThWxTKiiXYVT3gyO/7jLZC+m78gdu7bwN5utRn9NvJaENvEG
         lzanYQCvazytsyxlhouz2CHz+rKpVVtmdIse2dq+MCVtHurYpQJfluszN55Qxi+h7HZ/
         pM04QvXUzmObazd9JbZ598GoDmVosnRLvcFEowAXAEJ+SnLmA7pEFwWrbxuOmSYTG+me
         69GQ==
X-Gm-Message-State: APjAAAWlDPb1jNNCQRMH2vngbKJlT8+Z4ZiHfn8J1q2ytD8TpENXlUGC
        asGQjRmCUktCuJ5PMFwnDPo8+A==
X-Google-Smtp-Source: APXvYqx2NoYMMtqWa8ReJN5TrwKSrvBHd3ZkYJmk385TGGdhyyq1kjQl0TAzcvNbMTlyHzWbu6liKQ==
X-Received: by 2002:a1c:b041:: with SMTP id z62mr2942302wme.113.1559896150318;
        Fri, 07 Jun 2019 01:29:10 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a3sm1092946wmb.35.2019.06.07.01.29.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 01:29:09 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
Date:   Fri,  7 Jun 2019 09:29:00 +0100
Message-Id: <20190607082901.6491-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607082901.6491-1-lee.jones@linaro.org>
References: <20190607082901.6491-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When booting with Device Tree, the current default boot configuration
table option, the request to boot via 'host mode' comes from the
'dr_mode' property.  A property of the same name can be used inside
ACPI tables too.  However it is missing from the SDM845's ACPI tables
so we have to supply this information using Platform Device Properties
instead.

This does not change the behaviour of any currently supported devices.
The property is only set on ACPI enabled platforms, thus for H/W
booting DT, unless a 'dr_mode' property is present, the default is
still OTG (On-The-Go) as per [0].  Any new ACPI devices added will
also be able to over-ride this implementation by providing a 'dr_mode'
property in their ACPI tables.  In cases where 'dr_mode' is omitted
from the tables AND 'host mode' should not be the default (very
unlikely), then we will have to add some way of choosing between them
at run time - most likely by ACPI HID.

[0] Documentation/devicetree/bindings/usb/generic.txt

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1e1f12b7991d..55ba04254e38 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -444,6 +444,11 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
+static const struct property_entry dwc3_qcom_acpi_properties[] = {
+	PROPERTY_ENTRY_STRING("dr_mode", "host"),
+	{}
+};
+
 static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 {
 	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
@@ -488,6 +493,13 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 		goto out;
 	}
 
+	ret = platform_device_add_properties(qcom->dwc3,
+					     dwc3_qcom_acpi_properties);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to add properties\n");
+		goto out;
+	}
+
 	ret = platform_device_add(qcom->dwc3);
 	if (ret)
 		dev_err(&pdev->dev, "failed to add device\n");
-- 
2.17.1

