Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EFC200613
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jun 2020 12:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbgFSKMh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Jun 2020 06:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729195AbgFSKMg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Jun 2020 06:12:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A1EC06174E
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jun 2020 03:12:36 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a6so4536557wmm.5
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jun 2020 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=oh31r0K/K3CT9MYgBFOewV/gZpoVlMPsOgGKiFbX0eQ=;
        b=zsN8a4zvbDRomw1I9151eZAje2+AObvHXJ6+WqkdtqScx9QrPwAVSmuHt351oTanbA
         xKpBu5T4Jzm0mJg9yHhk2qdCNlG++lW0fjMrRkxW48L7mCFy6N7Uo1w2IPuWpucXD/3l
         +Fr2BJBOlvyYRiimx91ilPQb27X7H6dMCUBcmNjeSDT+4EYYHIpridzqGhUQWzAj5RkU
         x4+pJd9BVDti64mY/sU5kzoJM3Y2FZPMR3yBQ1gRc49+NQlK3Wjhdbjbkg0014pgcKMh
         U55T9T280DWmbKgOS+Zn8nqI123neNHirbwjYu4LQdkVJnyqlkcWHfagIBIHyHFfyGUr
         KtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oh31r0K/K3CT9MYgBFOewV/gZpoVlMPsOgGKiFbX0eQ=;
        b=HmqrVm5tNuUuiym95K6NYSgYQcvLKFU8VAfvhw+bra8014c6w5R5mMHXpzex0kzCEX
         C2pmu7xJCurBALZjr/zBy+avyo+dfJB5YvnbQ7MNLri8oy6HmBItfXHg6aHQ0kIZyxe2
         FievdX2ogakA0ZxENHMUeYffr9P0e1igISIwMuaCMqdfLhzA2IbgkYiA+jCFK7zasYB2
         VpQOKO2hFn7jUbd6slUXzNIfLXMfrNZthknUJw3+UVGlL7u6dXFRjZjIKIjNOjXSIVDd
         vgu/DRD4qubLasz0icaer+/Ggk3jrWVxS7alIgK/mjxBkxiJwCjtCpEskFxuAAGvEIwI
         8EjA==
X-Gm-Message-State: AOAM533QSuSaHaJ4WDS2PCwSTb2R/sznfZh6WTTRHszyZyD1Mh3rGuN4
        Z2c3G+3isyss3fFMHNo38hsVAovdPTe/cg==
X-Google-Smtp-Source: ABdhPJxq1sL2oCp8QYLlPAPU3STAyp8CE9V17BMEikMweUCoCgpbkRU+tjfg1X7BkhfW3nbMvIjAhQ==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr528602wmj.117.1592561555147;
        Fri, 19 Jun 2020 03:12:35 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id y6sm6605051wmy.0.2020.06.19.03.12.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 03:12:34 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, robert.foss@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] MAINTAINERS: Add robert and myself as qcom i2c cci maintainers
Date:   Fri, 19 Jun 2020 12:17:44 +0200
Message-Id: <1592561864-6406-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50659d7..632c441 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14023,6 +14023,15 @@ L:	dmaengine@vger.kernel.org
 S:	Supported
 F:	drivers/dma/qcom/hidma*
 
+QUALCOMM I2C CCI DRIVER
+M:	Loic Poulain <loic.poulain@linaro.org>
+M:	Robert Foss <robert.foss@linaro.org>
+L:	linux-i2c@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-qcom-cci.c
+F:	Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
+
 QUALCOMM IOMMU
 M:	Rob Clark <robdclark@gmail.com>
 L:	iommu@lists.linux-foundation.org
-- 
2.7.4

