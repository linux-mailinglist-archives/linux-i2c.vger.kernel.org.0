Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3163B2B9ED5
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Nov 2020 00:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgKSX4d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Nov 2020 18:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbgKSX4b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Nov 2020 18:56:31 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F727C0613CF;
        Thu, 19 Nov 2020 15:56:31 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id m16so7720228edr.3;
        Thu, 19 Nov 2020 15:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QLSvf7jortkvUucGZ4O7AKH35gGfiUccjHt8tcAThSA=;
        b=QTvGW1n2BpQotU9A/CgwqM0KNhPNEgLNiWXY6BXvK7Z7RrWjITjXA6fXtMSPIlNoPo
         3YH02fylFGyw+bcdWk4swfW8dzUoLu2JFfL7mdtXXxOP3QJXhP0Hfgm3FUg6l0ioZG1E
         mXwE3pWHwX8uTxTVrN1kX1nOpnJlJtZhAgkcAcBjyO8ftkoxiYyWnlzpZXH5ommq8/6N
         kCEVUDafHQAjoG/SAJNPzoaUm1PKZMU+p7RvXJrev9MeXPK0Ri/5eCTU/qv4mbTjjtgN
         LzsX04E+MYXsY3im+oSd5Ckf8VUIFZG8PyThwKLkSE81XC7hFsB9gUU+57Wjkik+HYt5
         hyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QLSvf7jortkvUucGZ4O7AKH35gGfiUccjHt8tcAThSA=;
        b=iee0/teDk1RlNmuQOrkPvYEJCoFSRXvSiPnNe9Q5p4zdjRsLJmBhrYkK6PJLqm0s7S
         6QZqsjg6GHlXtdh5T8ET1UxSuu6FTEiRS/8v6Cn953AdXC9X1u9oPWqX2ARbWGjqQNS7
         Y1i0U6od2FjSHiE7Lky22zQxvqQoJAJlA/J62ytAGFq/7g4S3DLCIxv1Qozjr01lJLWD
         OU4a2WW9E6ompYEY986RUxJdJElwUeP6uE25xsL+IdciPGfAXrT1qRNB8l5zsUwcQg3a
         UZkx3SurGLc9qr0CGLF+ZO/Pl8OIttXAoyivK4ozfQQ9xeOgI1DDncmGZ0rJw5g9E21E
         Du4g==
X-Gm-Message-State: AOAM5337XHLQa/eSFU+lDtPuVJ5BbMj2jblqcm61HQQv4BmCOozQYg94
        W0oXSeV7GMYI7ylryRKbpDY=
X-Google-Smtp-Source: ABdhPJzmbQDp+Vj/e5t7/Pw1SSGFZicK7XrKf6qWtH/wWQrW+cRxkL+6pIre7X8MPj6wPO76hcRc+w==
X-Received: by 2002:a50:f742:: with SMTP id j2mr24937868edn.72.1605830190223;
        Thu, 19 Nov 2020 15:56:30 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i3sm452987ejh.80.2020.11.19.15.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:56:29 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 11/18] MAINTAINERS: Update entry for Actions Semi Owl I2C binding
Date:   Fri, 20 Nov 2020 01:56:05 +0200
Message-Id: <0fd6baffa255ab37853f738aca0c466f471002ab.1605823502.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Actions Semi Owl I2C DT binding has been converted to YAML schema,
therefore update accordingly the entry in MAINTAINERS.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e451dcce054f..a85c1881cf07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1501,7 +1501,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/actions.yaml
 F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
 F:	Documentation/devicetree/bindings/dma/owl-dma.yaml
-F:	Documentation/devicetree/bindings/i2c/i2c-owl.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-owl.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
 F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
 F:	Documentation/devicetree/bindings/pinctrl/actions,*
-- 
2.29.2

