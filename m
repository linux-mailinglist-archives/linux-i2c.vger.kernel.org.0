Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7D7672AED
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 22:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjARVzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 16:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjARVzn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 16:55:43 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C7A654C3;
        Wed, 18 Jan 2023 13:55:42 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id y19so608189edc.2;
        Wed, 18 Jan 2023 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGp3fURHIN1KwNTqdNdjD2I+NMZ/HjTDkqRonIyKzP0=;
        b=Q7l9Y1KCwtVaG6F9kdtLyBSEuBe9Yq3gfImFqR7ha0I8Hs637R5+dp4JuFyFwqCLhO
         jdWNEGAN6CrCd4BgLoN5NV/kcE6BrjkevUpja9/Uzzaxq5qnVSOSnO1P9qlcUtjcjvr+
         bJ/27XJtmktx8uUC3R5KeY3QtEr+UIkI3cls+blmzmNUOVKUwUd1OQ+WG2ob507W1GbH
         7e7Phgr2uI3Hu2PLKsR3stHLwH1JuSPxWI6OY02cgdVE7zUfMjbDGEqYZW250KH2R5Jv
         WQhxCA6PcBEh1auAmWSlrmMHiw8XaJYZKI+Ff6iCVfyJh8GP9ERA+MFbx+c957OkLtMA
         kolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGp3fURHIN1KwNTqdNdjD2I+NMZ/HjTDkqRonIyKzP0=;
        b=sbmZL0Y+ExiTLMAePWa3C5QDsR7XuPHHaZ0JL34G6cRY/gkYHIVl1EF4J4fNqdHnUq
         IO8dX1yibKFsglqPxaVr0R6X5IzbO3u3jszcN4h2jvc0KSq18jOeL8mbH0vsmIsT7hHT
         rIaD0jMl33djlUbYGVLdCz3UeoAvaEncO+DWSJmWwDmdoYdkNceVbXkZFa05CJUJgDaz
         txGo5n9nuqLwksW7DFkpsiSYEjoQ/JT1virF893aC7Wo4PfPs08XrtDluGv674tBtq9n
         RCOWFX86bTbwJ4N9wGTh+cwKoy8sXrr2r5hxcVWN0yDCbbGVxttzyxglwjmFj5QHDcFg
         agKA==
X-Gm-Message-State: AFqh2ko3MIsmVqcdQ0q0NlUE4MBO1KxFpJA4BGnzTBpLdBPfeNq8g5JQ
        AogFotq0hqzmtIAF/NP4yOU=
X-Google-Smtp-Source: AMrXdXuqflzAwGKvmroxu08+OTiyKxYQ7H5wD0vfImmUnbT33aaMzx7ga+j2/CIdWWMADLRXdwWodQ==
X-Received: by 2002:aa7:c0d4:0:b0:48f:acd1:8da2 with SMTP id j20-20020aa7c0d4000000b0048facd18da2mr9071632edp.27.1674078940653;
        Wed, 18 Jan 2023 13:55:40 -0800 (PST)
Received: from ?IPV6:2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59? (dynamic-2a02-3100-94be-5400-80c7-5ea4-ed2f-1a59.310.pool.telefonica.de. [2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59])
        by smtp.googlemail.com with ESMTPSA id l4-20020a056402344400b004822681a671sm14775284edc.37.2023.01.18.13.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 13:55:40 -0800 (PST)
Message-ID: <8eb4fb92-ea53-fb4e-4cdd-daed4ad96806@gmail.com>
Date:   Wed, 18 Jan 2023 22:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v5 1/3] dt-bindings: i2c-gpio: Add properties for dealing with
 write-only SDA/SCL w/o pullup
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
In-Reply-To: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are slave devices that understand I2C but have read-only SDA and
SCL. Examples are FD650 7-segment LED controller and its derivatives.
Typical board designs don't even have a pull-up for both pins.
Therefore add properties for not using open-drain. For write-only SCL
we have a property already, add one for write-only SDA.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v4:
- add no-pullup properties
v5:
- add checking mutually-exclusive properties to schema
---
 .../devicetree/bindings/i2c/i2c-gpio.yaml     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
index e0d76d5eb..afd4925c2 100644
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
@@ -63,6 +67,28 @@ properties:
       GPIO line used for SCL into open drain mode, and that something is not
       the GPIO chip. It is essentially an inconsistency flag.
 
+  i2c-gpio,sda-has-no-pullup:
+    type: boolean
+    description: sda is used in a non-compliant way and has no pull-up.
+      Therefore disable open-drain. This property is mutually-exclusive
+      with i2c-gpio,sda-open-drain.
+
+  i2c-gpio,scl-has-no-pullup:
+    type: boolean
+    description: scl is used in a non-compliant way and has no pull-up.
+      Therefore disable open-drain. This property is mutually-exclusive
+      with i2c-gpio,scl-open-drain.
+
+dependencies:
+  i2c-gpio,sda-has-no-pullup:
+    not:
+      required:
+        - i2c-gpio,sda-open-drain
+  i2c-gpio,scl-has-no-pullup:
+    not:
+      required:
+        - i2c-gpio,scl-open-drain
+
 required:
   - compatible
   - sda-gpios
-- 
2.39.0


