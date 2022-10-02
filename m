Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9FD5F2320
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 14:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiJBM3j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 08:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiJBM3g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 08:29:36 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C77BB4D;
        Sun,  2 Oct 2022 05:29:33 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bs18so7622427ljb.1;
        Sun, 02 Oct 2022 05:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Dk2IiPh91fpjlWFjrDYlxIa3PQhf+qigCe0+xfWcs5Y=;
        b=Z1UdzRub1K/IsYPk0DWGdeKpM4wePalnZDcwubIykYdW3wEI3+9fP5VRVU75nn+nrC
         FO8H8NInzut1UqtVYjiWfciNDZ++PVZFFGpMLmVt9ZjUSyVoIEZtkUiSAODvgzX7p4zS
         7Xm1+54vYMsYf6N4My0mkm2DjayWPN8y+vrZH0VK+GFZnycYkl+SJmG/25BrOVqt3IO+
         vXzhs9CjY8zwYP7ku5HehEW27si7kfLKZCelIXTsqMa1C0f6G+FKRHUeYJVA5QGrSv+0
         Yvh8UGmbuiMKp4aHNyITptvmjc+zBj6EYSEnGrqq1LftfbwdFB/0VkH5Ox3gD/SkHvr9
         tAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Dk2IiPh91fpjlWFjrDYlxIa3PQhf+qigCe0+xfWcs5Y=;
        b=vv55sHAlU/cV+VanYg4Pjiqll1GozbDii/Ipzvz/RVPk7M7ptOl5cx2eFPfcyi6UF5
         NeIMXL6ZpkMTA/kasmbswFnwR6Ffkrqat1K1UJ6M4y28NpHQxqk2+qI6xkqQmolWkbrR
         dovFHvURi+2tLT6YssKq5S/7qXpMy27a6GRkpEac1k8OqVCedJegCnU1YqY8o0ovWOXX
         5twI40/q2kFyYNAzmNnu3WSJzRT/jqSTtpL1Wc2RxGgnWusBi4Z40NRwT5vLMGEpa6Pk
         2kHsjsblRuxyTjHdUqH+MRI9hjn8HgH11tfwNZ0y/aI34IYKYzvW5HTDxqxQt0T1JT9Y
         Ur5A==
X-Gm-Message-State: ACrzQf10HIUZeJTplK0179m6TLE6oIhIB92x8wHP70UyDEAefaw1jmjH
        vfqgOD+2zk4ibi8VQzKRFzM22WO2IEGLtw==
X-Google-Smtp-Source: AMsMyM60RL/C3BusedRRuYpGyHN89K8qweOFvJl0+NfITULqA/KF6e1N8U78PTUUzq/WahYj84bQpQ==
X-Received: by 2002:a2e:b5d7:0:b0:26d:98c2:6ad2 with SMTP id g23-20020a2eb5d7000000b0026d98c26ad2mr5331750ljn.215.1664713771648;
        Sun, 02 Oct 2022 05:29:31 -0700 (PDT)
Received: from i-vetokaappi.home.lan (dsl-hkibng42-5673c7-93.dhcp.inet.fi. [86.115.199.93])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm1064948lfe.181.2022.10.02.05.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 05:29:31 -0700 (PDT)
From:   =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] dt-bindings: i2c: qcom,i2c-cci: Document clocks for MSM8974
Date:   Sun,  2 Oct 2022 15:28:55 +0300
Message-Id: <20221002122859.75525-4-matti.lehtimaki@gmail.com>
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

Uses same clocks as MSM8226.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index c0f9537a4bb1..cf9f8fda595f 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -91,6 +91,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8226-cci
+              - qcom,msm8974-cci
     then:
       properties:
         clocks:
-- 
2.34.1

