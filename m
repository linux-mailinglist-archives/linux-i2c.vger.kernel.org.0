Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FB940E54C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Sep 2021 19:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344784AbhIPRKO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Sep 2021 13:10:14 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59228
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347416AbhIPRGn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Sep 2021 13:06:43 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 474B440192
        for <linux-i2c@vger.kernel.org>; Thu, 16 Sep 2021 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631811920;
        bh=WEwIdKqDOhsGSiauZ6vPE07vpywTOdEdV69P4JlTAfo=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=MBpnVCR7mm6nmmRtpl7lq34evvRHea4moRKiqPyWVlGxJJSyXmhVxaYsQep7KW2Yd
         7uPz9xQNBedXFshxj5c24mUfQXwrQJMMKY/CoQUPvT2yNAVPIz8cQ95U8N5x0+OYWD
         /TYp31ZTj6AUmMjAxXtnt9j+6Xrl/OTy5Yej55HhQZJvVlThuTf3Fk2IXXDfH0gKXc
         l8966MO+yrXHWnPGWlJdh3gRU/ye1YG0lcN0l9PVh1Sp+eqIJv+ZVC2QZibJTRWRJf
         EbiDaiD6SBUwyKTkY5wwZAFynIvrLns5IrgeNwO9sqTxxcPRX6EB/8kzz9miSv92Os
         C4KNFoxPpOnpQ==
Received: by mail-wr1-f72.google.com with SMTP id m18-20020adfe952000000b0015b0aa32fd6so2685737wrn.12
        for <linux-i2c@vger.kernel.org>; Thu, 16 Sep 2021 10:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WEwIdKqDOhsGSiauZ6vPE07vpywTOdEdV69P4JlTAfo=;
        b=Jrzjcq03FzVJRydqbqNs2Qqdz40OT4Sd5gOHgVtlXccnfX6V/12+LVUQq7PKFjFk1a
         ooRxUiSdJNPZBpUDnopmMzCunQD1GAeRRNUavSySsxZEYfA43U9BVfHGnauH8ItBmMOk
         Syan53gvSk7lkAxsU98hhibswI8Eu8D5b1JD8xYOLKcD9SRiQ5IWmXDK/NfbzGA1o9NT
         P1xmqWCH0KCrTQKYVrsfcVTnE1uDZ6aOu2u/365V53VAESnzdfR5eG8BNtEC4L060t1x
         I0+BFKz8o6vB00xabSF/+uF97saTjaSCoDLiHhrKUuXUaBkGLSBdeLjs5FihIZvWjN1I
         61IA==
X-Gm-Message-State: AOAM5331gnMQtIewUbpSnN/ANo5CDIKNVQ5Ep2r+y5JZBcwbAcne5+i6
        eHnCbLIrrQ2/gPL4oQ0u/l/a5FsgTtoX28ugQcxbPj6umQdEeUuI2T9bFQPe/XwUHuoB4t5RLPa
        lrpFd68uzwVAaugw9dIAI8EvMdhDbrmVjzjIMWg==
X-Received: by 2002:a05:6000:1379:: with SMTP id q25mr7284007wrz.280.1631811919935;
        Thu, 16 Sep 2021 10:05:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJza4Un1qIbgd83s0LDm87sII5+ldbJO9Omw8GYn0fxhGnS6TGyJc2gu5HCmFu6PiWMFx63Iog==
X-Received: by 2002:a05:6000:1379:: with SMTP id q25mr7283990wrz.280.1631811919808;
        Thu, 16 Sep 2021 10:05:19 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l2sm8553876wmi.1.2021.09.16.10.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 10:05:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: pxa: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 19:05:17 +0200
Message-Id: <20210916170517.138035-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-pxa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index a636ea0eb50a..690188a9ffff 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1547,7 +1547,6 @@ static void __exit i2c_adap_pxa_exit(void)
 }
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pxa2xx-i2c");
 
 subsys_initcall(i2c_adap_pxa_init);
 module_exit(i2c_adap_pxa_exit);
-- 
2.30.2

