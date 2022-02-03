Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9214A88F4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 17:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiBCQrF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 11:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiBCQrF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 11:47:05 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2092C061714
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 08:47:04 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id u6so7169504lfm.10
        for <linux-i2c@vger.kernel.org>; Thu, 03 Feb 2022 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=npRH7vRKW6sr8ga77ZpB533YBv6nJOMH1HOGWpxJJcI=;
        b=e7EbWgjxdid5lXnkoPKdVoMyRMXw6MVrUbkyyKb2/dSYFi/Wdv4EZdp31RUmxrLJd3
         2A1rbICAOqawWk/Dhdu2BXbc+y/+jRcSsLfTdOv1O8wuMZnePO5p0zoZcpt5XN3/PL0w
         F321/cw73+Mk+fvw0wlAGVNQwe+Ej+T5YL7rmObAlZkwKJwrxPgkGvKOlhPCZ6O3CUqa
         jP/mXZavbzTa3KS9Oa4BclfnYgfdVBoAnnbfubCY8/c7YvJw2VGfCz/CS+hrVKeoAQYh
         kDC1CugIbuHHrkUaVm00mlDuJ+219SOTe7BDkGUxvGrwEdB4bW2caemdNImal9EFL2Et
         ED+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=npRH7vRKW6sr8ga77ZpB533YBv6nJOMH1HOGWpxJJcI=;
        b=RYoyp22T80mK+Yxyv3LQ29LR228mJ/+gPjjllwOw3ZQx2ZWLmgFiV+wigCHo3umWGA
         7lMaFzEh+Se39Pg3AFV2Obz/qmiCpKaS73klZFq+LY19UXQ1ZA/y1GjcmIKoo+/jGsr4
         99RmeZG+L0KMvoptcyvPasEJrvpw+urZLibg4BvwY6ueMUs0LZvQVOsi1sHgIldhSM19
         o3tQhjTVshowP99o3gdSZTkh2KbCGnNrqlRwGVe+0t9KB91SG3iwv84zr9JmILezfBJY
         OhbR18zcL4JDYRaMHygih1R8gkSSMpG7vkXGxJp2OOk8yeKTfS55Ch4qVwv/2Gbzkfpv
         5ivA==
X-Gm-Message-State: AOAM531m3G0znq3t6s0Muftw6SE6qe991o79HSLw9Jb7M3ZbmV3gnwRW
        Z8aJPFuCng2SUR75A3yAsE/vXQ==
X-Google-Smtp-Source: ABdhPJwlb9LKAPt+1JJZfwzI5qnxiLn1plPZB/hVTFD7Wsr9En8QaO8UILxVT11UIzG7DUYveun9cg==
X-Received: by 2002:a19:f24a:: with SMTP id d10mr27531787lfk.649.1643906823163;
        Thu, 03 Feb 2022 08:47:03 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id u9sm4328650lfc.168.2022.02.03.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:02 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/9] i2c: qcom-cci: don't delete an unregistered adapter
Date:   Thu,  3 Feb 2022 18:47:00 +0200
Message-Id: <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If i2c_add_adapter() fails to add an I2C adapter found on QCOM CCI
controller, on error path i2c_del_adapter() is still called.

Fortunately there is a sanity check in the I2C core, so the only
visible implication is a printed debug level message:

    i2c-core: attempting to delete unregistered adapter [Qualcomm-CCI]

Nevertheless it would be reasonable to correct the probe error path.

Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index c1de8eb66169..fd4260d18577 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -655,7 +655,7 @@ static int cci_probe(struct platform_device *pdev)
 	return 0;
 
 error_i2c:
-	for (; i >= 0; i--) {
+	for (--i ; i >= 0; i--) {
 		if (cci->master[i].cci)
 			i2c_del_adapter(&cci->master[i].adap);
 	}
-- 
2.33.0

