Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11DB7B2D5B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 10:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbjI2IBN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 04:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbjI2IBM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 04:01:12 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87371B2
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 01:01:09 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so872814266b.3
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695974468; x=1696579268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C28erFu3B139djkq6tJ1VDiSF++V0llFIYietOujFec=;
        b=A3lCJKacXyFUp2c26x5eIDSX79vujXTFwMcaypqQykSnK992oLkScWJmdl+j46TAju
         Hw69GVba9lgttLfRMfEo0MoJMpOkWDm76JQ7KV7/afU2babRNCubNZOFgQW4Ubh3CsnY
         SEl8Zsx8QQ99hTlx+DpnZlYWzDmIwnLO8MHd+MQK8DqIB6EJSOKgM3V9JnbeDbr0F5PX
         VoRWZhFtjhvZXH09P2UrskXZqr8Zo9q+xfwLj8uZlLlCY6B5TWJcKoAYONCyLJJUzCYe
         R829Qb/W3ims6P3FR0TFjvj6i+mLGf5EVqcQ6DtVFYl55BL5w9frEiCYhwnkn7LANEZr
         I4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695974468; x=1696579268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C28erFu3B139djkq6tJ1VDiSF++V0llFIYietOujFec=;
        b=v+Nw5tZpRU7yiiRJPxmHNllZMpw3TjoFyLzQa20uVhpd9J7bLuZ4DzLWmjMLzntA9e
         gulQmHHAOL58seMpCFZBrKFTZ/RoxIZI/7XhrBHASUD+zmtWQTRpa6S8cA/1Lc4x/QhU
         4SKoUWvbZxBmZk/tfeJBENG6Q5Tv8huul3tFbWnV8QOqJ82xfMgQR4l3TNVWHMudP9Kx
         cRKcR0IJ7mM1K8ZfPri4SJv8exqXREYKJwoVuTg8IpS19/UbU2MvM77Uc3VHlS8nLKwx
         kOq3tJwxir1DIW2KYTWdRk48lEk0lyIVgQdT1hOH9qad/2koZIXkZ9APlvXjdy8EyAsl
         EnvA==
X-Gm-Message-State: AOJu0Yxx0/Jd6fiS5AyVXhKShxeh07FwjBHQmg4vsEa+86QD+n7CfO+1
        DBcHcFfcAaPXlNd9rYSUXdB/TQ==
X-Google-Smtp-Source: AGHT+IGcPNVNSQxWUc41wvX5rNkwu0RZEcFdSMwOgz/orbiDS7oqer0CThTY8123JuaQk0L8alLyig==
X-Received: by 2002:a17:906:2012:b0:9ae:6632:a8c0 with SMTP id 18-20020a170906201200b009ae6632a8c0mr3275480ejo.10.1695974468233;
        Fri, 29 Sep 2023 01:01:08 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j6-20020aa7ca46000000b0052889d090bfsm10825040edt.79.2023.09.29.01.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:01:07 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 10:01:05 +0200
Subject: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document SC7280 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-sc7280-cci-v1-1-16c7d386f062@fairphone.com>
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
In-Reply-To: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the compatible for the CCI block found on SC7280 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 042d4dc636ee..158588236749 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sc7280-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci

-- 
2.42.0

