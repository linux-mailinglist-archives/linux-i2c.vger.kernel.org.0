Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DDB37FCF9
	for <lists+linux-i2c@lfdr.de>; Thu, 13 May 2021 19:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhEMR5Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 May 2021 13:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbhEMR5K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 May 2021 13:57:10 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8F0C0613ED
        for <linux-i2c@vger.kernel.org>; Thu, 13 May 2021 10:55:56 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id f29so14098846qka.0
        for <linux-i2c@vger.kernel.org>; Thu, 13 May 2021 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G6cunyyCAgFMO8WDuEbxdeQNabsoZvGD6x3wsqvioTQ=;
        b=HyrbNR3fsh4EG0A55QAyn5sRwI6IQPua85FUNamY/gY5lzI3leCTQdkonmPO4sKNU+
         8UO2l2vGtUzqXLr9fLE1v8TzWIfz1LAvbwOx+AkisxDO/lji5ddjM42rniKHuX8FBZp1
         Rx4cdtnAExzCBkW27jbPXOgL/08YTu+BjwqL9FFtme+tio5w5eW7ftpbe2TDEdAQdNIo
         onhRYs0spK2w66UpW4ggUJuUyjRLctLRKOcM/dZ2XjjhBsXo8dfQwm5AOsZSTF1C7VK+
         pG66ub4+spOoZ2YyQuXCH8X00s6SERuaT/5xFOdkaRUkVA9T6YAoQ75ABB7SVpWU4qks
         KBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G6cunyyCAgFMO8WDuEbxdeQNabsoZvGD6x3wsqvioTQ=;
        b=AMy7bZQjenytI6NCcszps/w1+PiFnDfMdHzNa6kOZCBdrIZECbgOR4zyXnIONggeRU
         F+WZsHI+A74ROwEuUnTk6P2UF/YDDuKkvtRqz5S18abKyfIQAanpongRJN2vxCE03E/I
         Li7hm1xxDGKr3FLQHT1hemhPZM2ACA6Wtnr9E7sP3DH3bZ7uPKoaIxTi2M+dclHr8r+I
         M0wILvEndRUbAGrv680tt5bQFbTVEdBh3c99iRzRCkFSeuCvOGrsXVS5O5A9RAopR+AI
         8qfKtPk4LaoObhuzlorxP4yJoUzXpuxdUXONOsqJhqcpzS0fMxH+6YV+aOtEC8fwZIAR
         OW/Q==
X-Gm-Message-State: AOAM531TSJ6K9Bp1mGPlnykpK2kEEoJFRlQskIkFYD9oBVu3Mz7oNEAN
        bVObgM8E3JkUFbwhXrywOtxtPA==
X-Google-Smtp-Source: ABdhPJzHv12G0x5hOV8M/Sof7AYXqEPgmkJQppEK1BFjto9Iyv6o8I7Jg25n8IpHNG3aiGWE2BmxWg==
X-Received: by 2002:a37:9707:: with SMTP id z7mr39366330qkd.407.1620928555624;
        Thu, 13 May 2021 10:55:55 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id 44sm2899114qtb.45.2021.05.13.10.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 10:55:55 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org (open list:QUALCOMM I2C CCI DRIVER),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: qcom-cci: add sm8250 compatible
Date:   Thu, 13 May 2021 13:55:17 -0400
Message-Id: <20210513175518.6023-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SM8250 CCI is the same as SDM845, add an equivalent compatible for SM8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 5 +++--
 drivers/i2c/busses/i2c-qcom-cci.c                      | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
index c6668b7c66e6..7b9fc0c22eaf 100644
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
index c63d5545fc2a..c1de8eb66169 100644
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
2.26.1

