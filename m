Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 767F65F2322
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 14:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiJBM35 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 08:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiJBM3o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 08:29:44 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CEDA47D;
        Sun,  2 Oct 2022 05:29:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a8so13058812lff.13;
        Sun, 02 Oct 2022 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JGB1ZM5jp4Wd/f3Soa04BQKNJMQfCr+/ee6e5E0crXc=;
        b=ENOZ6YJ9ZYuRybN/zwcRCY5qToCf532j5Zwc/ouZR6722Ooci195qg0ieJD2agRn8p
         zb6aYOlUz3xehzr79dbXJl9yVt1HW7AqM9njEL6zCi4ewiyMFUhQ5XTRfqQVE2YhF+VU
         k1k6bd//xQxQeqboMT+bUXkQgGHAe9y2gQUmKUa/yGxGk5tVR64rAP2Hnag1FnGvPT8c
         Fv77Bq0puOlYg6zlI0OjbrUldhxNguPc9PixtHrVcjKUhAugNrG7V3xH232+11TXsN1y
         JZdU3yZ3xQ1UI2AUBBrlcqx/L2R8r3QqwUJhJ/YcmIOVv5do751Vw5D8MF6M3IWKpvj6
         fhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JGB1ZM5jp4Wd/f3Soa04BQKNJMQfCr+/ee6e5E0crXc=;
        b=WhenlK5U4X74s2W7mHonKOsmHxp36nA7RNjzJjTeCpTyXdKVZf/22P5kRjNwA0z3Jz
         NcJ1n//wsjVdcqUZcyTElbyq1S9cQpOF+aFOmjYK3b3TEyfBk2CRm+HRLuFUIZxunJh0
         lwkjAb8Il1wPJJddYquImT45V8bm6f8NSfCGARssliIgoI5GHfBs5tUXRfCB/hZCHyf2
         GHaFwAV9a2gMPaOaaRjsAqvfnINHly8cfl4i5vC/DU+xJ6LVCkCBaE0tB0qzDuglJCon
         rPttrclp4cl3TCQwXMcUvIIe8BQukqQukBSLvmVevQa7gmvc8ZjmmiqCjVu2yVI6nEl5
         ryvw==
X-Gm-Message-State: ACrzQf1tjSugZVJNDjUJm1ETKXAl9qZRLVDtxKorwWtLrZZqqtHXg68P
        RcT2OIdHIvJsENguc7oBz1dfz0MDmd/+qg==
X-Google-Smtp-Source: AMsMyM6zup3t+cumnpI0YlukJ9eWABiBU3LJsEf237ETLlnSQf1NUeqxLfYMMjIgwNersBXsWZ0Ejw==
X-Received: by 2002:a05:6512:290:b0:4a2:209a:a11f with SMTP id j16-20020a056512029000b004a2209aa11fmr2285753lfp.413.1664713778871;
        Sun, 02 Oct 2022 05:29:38 -0700 (PDT)
Received: from i-vetokaappi.home.lan (dsl-hkibng42-5673c7-93.dhcp.inet.fi. [86.115.199.93])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm1064948lfe.181.2022.10.02.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 05:29:38 -0700 (PDT)
From:   =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rayyan Ansari <rayyan@ansari.sh>,
        =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] i2c: qcom-cci: Add MSM8226 compatible
Date:   Sun,  2 Oct 2022 15:28:56 +0300
Message-Id: <20221002122859.75525-5-matti.lehtimaki@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
References: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rayyan Ansari <rayyan@ansari.sh>

Add a compatible for MSM8226's Camera Control Interface, which is
similar to the one used on MSM8916.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index ea48e6a9cfca..87739fb4388b 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -807,6 +807,7 @@ static const struct cci_data cci_v2_data = {
 };
 
 static const struct of_device_id cci_dt_match[] = {
+	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
 	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
 	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
 	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
-- 
2.34.1

