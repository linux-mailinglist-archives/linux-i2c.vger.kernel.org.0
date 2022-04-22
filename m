Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF94850B580
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Apr 2022 12:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446841AbiDVKsh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Apr 2022 06:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386716AbiDVKsf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Apr 2022 06:48:35 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA052A24A
        for <linux-i2c@vger.kernel.org>; Fri, 22 Apr 2022 03:45:42 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id y21so3037071edo.2
        for <linux-i2c@vger.kernel.org>; Fri, 22 Apr 2022 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E0mPDFRf2yGCYjXvBv/hrY8X7EKal2dOh8Gqauv0y1o=;
        b=hMffFfUZGHLuMf4xjuCqC0todGSD5kRTFeTjJ/Kiq1GvDKE7GYPQ3BHfEWcc0+BLRo
         zfNfU1rBTvTUXATzcYtX/G3CPWoziz3HoJYMc7cipZ/SWumhn3QqeoYtqqyMZlGr3WbV
         56kHys/Ez8+9AqYfP78EOQGF8z5jZuNnJCl9IOPLFu2v/38oq2PZOFA9hlupunvO1zDY
         lTAjSXpPU5bqtAkqFbdpdHl3OJngGxgPeFSWr/RBrI33GnVBszAQEjEXLmiT8G1azlst
         xEuBRQlqa0Npblv/r4aiHrALyWxVk9RR5TE/8Addh8txKNshI89Vnr+oT6BqIuKRi4lA
         Kxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E0mPDFRf2yGCYjXvBv/hrY8X7EKal2dOh8Gqauv0y1o=;
        b=KiP+SdHmbimLgLYW7jw7/RGFwPHgTi6qvK5RKI2+6GmHQLQulxzINWE4iufpl8/V2O
         1Zp8Rn3QwWqG8Q2pPXcFqfBTivzBeyu1LDPpM3L2jaW1vZ7v3jZaKYY/T98kxqq5hPXG
         y7PKz8MAIV0Kb82sqsTPhOYI1EBYSyMa+T8WMqjVn8omvsMco6nEpW7cLDaPRI3MbBBo
         y9XmRN++9O0LjLOTQwG57wcOYVokmUtoJ8VFUpB+iFqp36ao1VdcUk0cVDvxuPB+gbmb
         pv4Iwpd6+gF4bQx95OO/1aKObwin2yxRhTO8VaLNtWysIDNcleMUvD8Lb9Jg2ALQEYNB
         jQsg==
X-Gm-Message-State: AOAM531+LPn6Ic3tPM0HQCM64+/vZecawIkCcK130AAwAVas3EHKBuz1
        8C56y6b7jmLdZeWwRJGdOKPu/Q==
X-Google-Smtp-Source: ABdhPJzJD/7be1sR2YX5lXMsY8HObXb/T1c5dQYSajPOBst6CqwP9QEnjh5GfF1c3sLUGXKVJ3qfyw==
X-Received: by 2002:a05:6402:1107:b0:416:439a:6a9e with SMTP id u7-20020a056402110700b00416439a6a9emr4059032edv.382.1650624341298;
        Fri, 22 Apr 2022 03:45:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cn27-20020a0564020cbb00b00418b0c7fbbfsm744502edb.32.2022.04.22.03.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 03:45:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] irqchip/aspeed-scu-ic: Fix irq_of_parse_and_map() return value
Date:   Fri, 22 Apr 2022 12:45:36 +0200
Message-Id: <20220422104536.61451-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422104536.61451-1-krzysztof.kozlowski@linaro.org>
References: <20220422104536.61451-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: 04f605906ff0 ("irqchip: Add Aspeed SCU interrupt controller")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/irqchip/irq-aspeed-scu-ic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
index 18b77c3e6db4..9cf67541828f 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -157,7 +157,7 @@ static int aspeed_scu_ic_of_init_common(struct aspeed_scu_ic *scu_ic,
 	}
 
 	irq = irq_of_parse_and_map(node, 0);
-	if (irq < 0) {
+	if (!irq) {
 		rc = irq;
 		goto err;
 	}
-- 
2.32.0

