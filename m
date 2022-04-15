Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF10502B07
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 15:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354071AbiDONkM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 09:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354092AbiDONkG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 09:40:06 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F06BB0AA;
        Fri, 15 Apr 2022 06:36:13 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u15so15361421ejf.11;
        Fri, 15 Apr 2022 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=amdgP1E8jI48xcX0gtNjukSdpBZkmgF/3KYhKkZ9D2Y=;
        b=phIEbvNYcustLt+DT+i+53RPM3x2Cxnt1PyGCb4C8iuLNT9EgEcuNiTouDwaTRaYZL
         dgJhhoabcpBQumuClKSY6K+lkUQNwOl/wNW9rzaa19QkEMV/KbUFlxP0Cc5sGXjR5rJc
         grbeW9IrKOsVSg6YQekb9q+jxhp7/CmblDSJbGM9q4tgC0ang6igqtwIfFlW4TcQrXuw
         QOfT9ULVd/j4EIb8qd7ysiLbMelDpLKkVXifU2jJJImBWk5LzUxDeUxRmIx1CZCCHByT
         o9RoEISLCRpXEqQGP/pF3OMCsTqzCRjtGjuqHTDIJa0bzZthNVuO+qB5hlBXEtCgnNiU
         7/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=amdgP1E8jI48xcX0gtNjukSdpBZkmgF/3KYhKkZ9D2Y=;
        b=QmzFwq22D1cXeVObdrgkSfnt851NXuKrDq4XgeXnyG3siEb/QOI+VMWta9kZYkDjH2
         BB/FJzdsmtZr8qydLZzkkbsnmN+DiE0+SnxqjPbyz4qA12cCltdywoePjyLpsPMjxVxd
         OVRRFRE+emIerP9MmLp1fOywV3MLqOAaZTH4PChMubAXlEYubRB9qk+KKXqY7284S969
         Iubglxaxg8/bsE0J0LD2JQ7cuSfMRsJWnXb75PVeGxDQIl5W9+mJP6jGGdtEU7Tuqn5f
         PfwysmsptOrRqVawY0uvwlTDrkkPyQ2PbOSJBucYIVjZ8FKInCaQNlsm/BtWgjYYKYiX
         PXmg==
X-Gm-Message-State: AOAM533GgHFqI7IfhL/sQ5M+Zg5vbPIjgLKRoDjaZS98KfmehTLAVTuq
        ir/+M7EYTcfTWkSuGp4dxTk=
X-Google-Smtp-Source: ABdhPJwIKphohRo2zS1j300g6jgdjZcCvsV+fD8ssn26M5KJQYG1UQ9exWV9XqJmUBMiyBDTCnYkLg==
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id nd14-20020a170907628e00b006d9c6fa6168mr6272970ejc.132.1650029772003;
        Fri, 15 Apr 2022 06:36:12 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id e9-20020a17090618e900b006e8669f3941sm1677778ejf.209.2022.04.15.06.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 06:36:10 -0700 (PDT)
Message-ID: <ff31e0c7-6a59-72c3-0e46-9231ec90ce9a@gmail.com>
Date:   Fri, 15 Apr 2022 15:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 1/3] dt-bindings: i2c-gpio: Add property
 i2c-gpio,sda-output-only
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <bc229e73-52aa-9f5d-c6fd-e84b64a589ba@gmail.com>
In-Reply-To: <bc229e73-52aa-9f5d-c6fd-e84b64a589ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This documents new property i2c-gpio,sda-output-only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
index fd0402845..25cd1b260 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
@@ -33,6 +33,10 @@ properties:
       open drain.
     maxItems: 1
 
+  i2c-gpio,sda-output-only:
+    description: sda as output only
+    type: boolean
+
   i2c-gpio,scl-output-only:
     description: scl as output only
     type: boolean
-- 
2.35.3


