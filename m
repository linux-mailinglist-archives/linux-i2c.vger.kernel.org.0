Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF1E20060E
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jun 2020 12:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731636AbgFSKLb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Jun 2020 06:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729718AbgFSKL3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Jun 2020 06:11:29 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA969C06174E
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jun 2020 03:11:27 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so9134790wrc.7
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jun 2020 03:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=oh31r0K/K3CT9MYgBFOewV/gZpoVlMPsOgGKiFbX0eQ=;
        b=emVnALLwTYguGBxkfYeZcZTrcXLWxpkv7QYdxDCigEhOUEXlVtKTBQULcI1aSib+ur
         aXrg37XGlJEmtC5tw+f+4WLAlZNOs95BtVkDuxJdPqTfSVQmhO5/EU1uPT81bRSu5th4
         PPBwK3dHeYEUGFNxigc/WhsI13StOBIDBGZ0Y+HqHF+oYWNP8MrEm8x1zteLSozzf+UR
         QFggtkqgAjgb8q/9tnMxXtZeT0UikMwbWIotWbq/bVCVAj8sA1o+iJFDebcV+3W5SjDU
         Va6FJphW+3/4TvI9oVV1tpZQhMPr3G2VbQ+hzhlHte0jgvHW+W0X5z8QVo7QkoJixdDK
         B6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oh31r0K/K3CT9MYgBFOewV/gZpoVlMPsOgGKiFbX0eQ=;
        b=olO19GpJoM8VcTvgbhJ1x1/2K6vAOabXokSTVcpaDlTGb4av9mSYd01BdtqFiBEIyy
         n65H7ZJY1NEd8G0zcB0P5jk0HReoBNas+8HWqoh4Ev6/jqufnqryAgUAQ1eGvUC3b3P3
         M8rc6qTJsCfFSdwNX1tCkMrX/DORhQ/En+tcl3eD4vCL1q/UCGsYr2bgWXKIJpKYXBqs
         yYqpQhpSY7/efIGOQGtJ+R0YcWWOwkfipoBqd1hxHR1qVB7/F4BX1Cd/cQUlB4SZ72Hh
         //IaEgLDErrWtBDUiTPwSmvkxnC41X85IdfUJxOzY5P5TD7rAxAfFaJ8eLieClm4WUAu
         sqJw==
X-Gm-Message-State: AOAM530XRLfriV3BFDjaKh8stczbkApGDY8FVKKZISEpwGG1TMNnUDyP
        bla8Rzak28DrGaCIvsslOCFubQ==
X-Google-Smtp-Source: ABdhPJyw5PfUHxStU96xtvCpX9NysPkH+Giw1xZ6Ctq0DggW18sfMcQPubA22JIVJHmpy1OUM2SGeg==
X-Received: by 2002:adf:eec2:: with SMTP id a2mr3145241wrp.136.1592561486175;
        Fri, 19 Jun 2020 03:11:26 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id y14sm6033437wma.25.2020.06.19.03.11.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 03:11:25 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, robert.foss@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] MAINTAINERS: Add robert and myself qcom i2c cci maintainers
Date:   Fri, 19 Jun 2020 12:16:35 +0200
Message-Id: <1592561795-6243-1-git-send-email-loic.poulain@linaro.org>
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

