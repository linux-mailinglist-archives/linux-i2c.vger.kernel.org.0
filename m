Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51AA2A8128
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 13:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbfIDLgW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 07:36:22 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37697 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfIDLgT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Sep 2019 07:36:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id r195so3294355wme.2
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2019 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Uuq1eCLagqB7It6aGbezur+IR8biDO9SazdI7cqdaFI=;
        b=qp0yJe04jx2ivZeuIXUwlhAyXXeFSfk5tgqH6oCkHR05lDEik9mPR5v9927SPGcRcF
         Bqpd9uYWbP1lsr+hb7QvkpYLluhnrev870vk1hyz6CstDwPiqkr8mp4/e4g5uP5dShX8
         xdt0ym7tbVmwYwx2pgRVRGsEZ8C1evHUk9FGitl/8RMxdTyfqj6zxtwcIzKPbnKHu2ay
         q7f/9kZ1lQ7dZpPPtuumZ9QoFlwEHWVriNgD+6IQtn2ystKcFOD1L8ahTB72/zQlOPjj
         vijaYPmPpyVFjezLg3cx8drAtt4pP5Fz+cYk5fH1mE2O8yX+nvUAM681Qx1ltYOUjSXv
         zQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Uuq1eCLagqB7It6aGbezur+IR8biDO9SazdI7cqdaFI=;
        b=nUMPLO5y2aCPmUxljHyzo3PTv1S56l+GMAJXKCarxzZPCu0QDOqcdcmpCzLQJnpSKE
         Keb3hdbiGG9whuF9fhTcpIRbi7/O3xA0qhlor5tLneYlHRcwHMlFq9ebOTSxDr1dtySM
         vDGRT4/h/+x1pRrgQaScS2+ZMLJ4ZviCLpdt9LmKnVNJBCO99e8QxuKFv0GdPcPxXt2J
         j2DZVhm3EYVFmgmhzXcLHgty17M+Np+MMcS8MZSb+Vbp2YcsF5XL9s+g3iXNgIkFflpK
         GmizCBOLW5GcmaAKukPdmtK8HU91xspP4+XueRa+eW2mN0AUuxCTMqLfl2v94z06eMOw
         wllw==
X-Gm-Message-State: APjAAAUpfRgySlYYaNnJKSaSSgNjOI5fdWgNhgbzRL+i9PhOm2bt8Dh+
        gO6Frr+pEUAJMMBIOV7XJLeW+g==
X-Google-Smtp-Source: APXvYqxrVXn7NXLmsW+n0aD02675Wv9vt7hSV40SwdLs0RB8oNmnK6HhJ+4q7rd/GnqwtFaz3fRPdA==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr3812956wml.36.1567596978030;
        Wed, 04 Sep 2019 04:36:18 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id d9sm10823933wrc.39.2019.09.04.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 04:36:17 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 2/2] dt-bindings: soc: qcom: Provide option to select FIFO mode
Date:   Wed,  4 Sep 2019 12:36:13 +0100
Message-Id: <20190904113613.14997-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904113613.14997-1-lee.jones@linaro.org>
References: <20190904113613.14997-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Used when DMA is not available or the best option.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
index dab7ca9f250c..b0e71c07e604 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
@@ -40,6 +40,7 @@ Required properties:
 Optional property:
 - clock-frequency:	Desired I2C bus clock frequency in Hz.
 			When missing default to 100000Hz.
+- qcom,geni-se-fifo:	Selects FIFO processing - as opposed to DMA.
 
 Child nodes should conform to I2C bus binding as described in i2c.txt.
 
-- 
2.17.1

