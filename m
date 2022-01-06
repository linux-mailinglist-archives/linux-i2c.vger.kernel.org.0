Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57FC4869F1
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 19:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242834AbiAFSat (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 13:30:49 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46802 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242813AbiAFSat (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 13:30:49 -0500
Received: by mail-ot1-f43.google.com with SMTP id j97-20020a9d17ea000000b0059069215e85so3998623otj.13;
        Thu, 06 Jan 2022 10:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jO+eguqfmGf5pi00MAsfJ6vjkTO2C4qOS/bN4M0iDpw=;
        b=DAi5yAWkHRAgn2uX/yqRKRnEs45zdtib/RtgtzJRQm0W6MZHbZUNEtPaPd7Bo/Ekzx
         mYBUjtVhp9Bfv9P2i712k7jbueNx8XLZq2/7nsqjyNYHqbtPZUF9nPIqN8ECaneei7zc
         zolziRZiIVwNb278GNplPJMB3GPfKUVMlBboGVcMCYCc7DTTuEUaYVKKlZxaiSPWr0Pj
         kA7VsMIGzQWGLguGKEC9CBvBUaBbZ0EoaytfRw6jzmxkHgH7ScacI+/BY7Ug6PBuOHyb
         JKRy3H8igNid/G7L9+vSw2/H33J9eWyMNTff6+rlCwrmkTkloouCwSlk2MYlScrfjmBx
         DOPQ==
X-Gm-Message-State: AOAM530B4Ijf6dTa5x0n4oSB43QHLnvZS8HYMsz5YUiTS3HSpiYC/kBN
        ANgBc8uz1d6oP2kiDPYBNA==
X-Google-Smtp-Source: ABdhPJwRHmskJrvolKwtpLzlY7qGfudTL81YkdkwIKjkAYmdjppy/ap0Pp1Ye0/aRlf02WmvHRa6gA==
X-Received: by 2002:a9d:70d1:: with SMTP id w17mr7228971otj.100.1641493848891;
        Thu, 06 Jan 2022 10:30:48 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id g2sm472767oos.47.2022.01.06.10.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 10:30:48 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: st,stm32-i2c: Make each example a separate entry
Date:   Thu,  6 Jan 2022 12:30:36 -0600
Message-Id: <20220106183037.1443931-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Each independent example should be a separate entry. This allows for
'interrupts' to have different cell sizes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index c07289a643d8..46b62e1c9273 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -112,6 +112,9 @@ examples:
           clocks = <&rcc 0 149>;
       };
 
+  - |
+    #include <dt-bindings/mfd/stm32f7-rcc.h>
+    #include <dt-bindings/clock/stm32fx-clock.h>
     //Example 2 (with st,stm32f7-i2c compatible)
       i2c@40005800 {
           compatible = "st,stm32f7-i2c";
@@ -124,6 +127,9 @@ examples:
           clocks = <&rcc 1 CLK_I2C1>;
       };
 
+  - |
+    #include <dt-bindings/mfd/stm32f7-rcc.h>
+    #include <dt-bindings/clock/stm32fx-clock.h>
     //Example 3 (with st,stm32mp15-i2c compatible on stm32mp)
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/stm32mp1-clks.h>
-- 
2.32.0

