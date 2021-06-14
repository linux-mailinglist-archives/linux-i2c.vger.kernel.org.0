Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA803A5E4B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 10:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhFNIWn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 04:22:43 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:35675 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbhFNIWm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 04:22:42 -0400
Received: by mail-wm1-f44.google.com with SMTP id k5-20020a05600c1c85b02901affeec3ef8so12412847wms.0
        for <linux-i2c@vger.kernel.org>; Mon, 14 Jun 2021 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=LnyZct2DknKWMe0DrvvVwa4q+qiNZ1cnJSHPV8njmHg=;
        b=gcL5i7lv7XQSoR2mGCFsUxne/Mm5adkEW0IpITDX+aZt6afsabyLAoi1r5M1TbfyVd
         NsK8XIIe9l/JSjAR4TbfrprHbUoAmFcPtOeKgp/qRSXIfH4PcWda2sOmhsjcMrG2WQe7
         WZd9pb1dPR7ADI9up7l/QUxsDGVJ3tLzgHxD4QuvkJHViufAqA/Bmapx4e6bfGr6C3Kh
         ypelF+rrIPp2TL3tkq/GCKkv+0c4iVHHcnG8NiMJUUSiYYGbnJk2RSHPMJYVvKGw6CwY
         vpxygbZrjQa+6kU7b4+uzd1Ys++PzYd5rpA9cvJh+qqVkSrIVdU+/OMxA3XpVIUJoNnd
         dTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LnyZct2DknKWMe0DrvvVwa4q+qiNZ1cnJSHPV8njmHg=;
        b=moYancDHnpcpsW848+Axp1k52Ipr7RUPRMrn5OR4056riErfxwmUL1PxjV4kUNGOiL
         BzR2YX1k5wxE+ArbFdliBCpnmb/ReCKh9FUBM95z+HJbUNwTv5meVtryMBz8SQ3GGLJz
         vpCsm66zQdQCqWUNRhlOHTItma6GNYlxprB5y8dImjYO/yBIYnmr7rvgdl0mJs7iTt3q
         jjnLQ4s3FUL5a0hjrsyCbzN8rcnO2XZUu2Fw0LAkcUDYlrlgsptOvCNv/XxBeDJks4Il
         KHQ+KuLWeTooEzmbhRfmZ0MG7iU3tlMcl5SGLUOFw6K9llCq+ke51186LRLIj8+ph00t
         XSCA==
X-Gm-Message-State: AOAM532iraDPqbpevrf+3AVSZiKvOZAsGO9ea5XdnKhdTacpsI9q2R6e
        0fOe31I+cs86hyX/k2hNqhqBi4jpvLk+qQ++
X-Google-Smtp-Source: ABdhPJx+hBxfgyrM2GohZAizyI5qpBrzMSBJQ/tABRCmbQQK68yQrqfbNBLKeh4+v1WEjfnpbNTNvA==
X-Received: by 2002:a7b:c25a:: with SMTP id b26mr15467485wmj.31.1623658766848;
        Mon, 14 Jun 2021 01:19:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:85ed:406e:1bc4:a268])
        by smtp.gmail.com with ESMTPSA id p16sm16011227wrs.52.2021.06.14.01.19.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 01:19:26 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH] i2c: qcom-cci: add sm8250 compatible
Date:   Mon, 14 Jun 2021 10:29:01 +0200
Message-Id: <1623659341-21954-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

SM8250 CCI is the same as SDM845, add an equivalent compatible for SM8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 5 +++--
 drivers/i2c/busses/i2c-qcom-cci.c                      | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
index c6668b7..7b9fc0c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -9,6 +9,7 @@ PROPERTIES:
 		"qcom,msm8916-cci"
 		"qcom,msm8996-cci"
 		"qcom,sdm845-cci"
+		"qcom,sm8250-cci"
 
 - reg
 	Usage: required
@@ -41,8 +42,8 @@ PROPERTIES:
 
 SUBNODES:
 
-The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996 and
-sdm845), described as subdevices named "i2c-bus@0" and "i2c-bus@1".
+The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996,
+sdm845 and sm8250), described as subdevices named "i2c-bus@0" and "i2c-bus@1".
 
 PROPERTIES:
 
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index c63d554..c1de8eb 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -769,6 +769,7 @@ static const struct of_device_id cci_dt_match[] = {
 	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
 	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
+	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, cci_dt_match);
-- 
2.7.4

