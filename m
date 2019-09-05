Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13343A9C3B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 09:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731589AbfIEHwT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 03:52:19 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54194 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731162AbfIEHwT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 03:52:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id q19so1518798wmc.3
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2019 00:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8QTtt8+sGnSqf2GZqqr6eKF9qx6336YqhCVxZTe4hN4=;
        b=P3M2iaYypKmONmySetZUFaEg2hS2Zw4ANUaBhR6r5Ydm74kgAH+IhORp1ZlSO3+SvG
         bPCT3dkX2yVgIb96qqnsLFsYvscdlxnkL5q7N2vsbXFwuzu0KFsjgL2cm4cVMQIVCiHg
         E3HyFv/qZeAvK2dR5fvXAwdJ6ohLBAUxXUlpSrnwZygHBjnfzUXN7K/XTGA3fFhhPMLp
         aef7z4TL+zPCwYLGdxAx8P883nSG9rZIhxXDy0ApUIjVYUWVdz2yX3BC0F3ldwajVhor
         yFM9sHNlHvSqgAqu2mpD6gLSQXdhjL2FV5gmXWXcKoqfAWr8dBPfgBb+lndVXZwEXGIy
         zv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8QTtt8+sGnSqf2GZqqr6eKF9qx6336YqhCVxZTe4hN4=;
        b=BlW4NBs/86U/3senIyXCW0UUCvyc4bV7FOzOl9+qRiJ5YpU5VtO4pMkvFfFOXTsWmq
         cDD1YufawQi7AOg01g5UN814x7PUdNkdaHh8KZTDbU+KjABcxxHU8yyeNxxbClnym4iE
         znmWuVqCRXzK9FaaBCGJk4yro/52y8xLaoj9WFkjpiXXne/pW0Tz4U/qWHsw+5Ckk8EQ
         xBnhHiIC7YNTwwdb1WwfOdRLLpF+QF6lCs4taLVS5UEogB9K4HU0VJTLoW6z4mRLb+N7
         JbGf2gVA3W4voF50meb7NEJRtCPE8lQ9yGTG4LfBExb9aUScuCQ2/hfPMoak1DomDx+4
         BXKw==
X-Gm-Message-State: APjAAAWW4UuSjE+nsQ7B5FbrC8We1RnfO8OYk4SOXpndw/91USm4mzOQ
        WQKzZC8MoN5HncutANPtmJtTQQ==
X-Google-Smtp-Source: APXvYqwzQVlp8PCbFWrdVBA5xmrr3ZHShk2IdYXuGYRwilcld1G0FXOEOyA9G0LVuEDXC8E5xXtsSg==
X-Received: by 2002:a1c:7919:: with SMTP id l25mr1454666wme.23.1567669937202;
        Thu, 05 Sep 2019 00:52:17 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id a13sm3418784wrf.73.2019.09.05.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 00:52:16 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wsa@the-dreams.de, vkoul@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: Provide option to disable DMA
Date:   Thu,  5 Sep 2019 08:52:12 +0100
Message-Id: <20190905075213.13260-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Used when DMA is not available or the best option.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
index dab7ca9f250c..a14889ee76b0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
@@ -40,6 +40,7 @@ Required properties:
 Optional property:
 - clock-frequency:	Desired I2C bus clock frequency in Hz.
 			When missing default to 100000Hz.
+- qcom,geni-se-no-dma:	Prevents the use of DMA in the Geni SE.
 
 Child nodes should conform to I2C bus binding as described in i2c.txt.
 
-- 
2.17.1

