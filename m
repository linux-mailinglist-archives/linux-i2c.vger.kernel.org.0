Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858F4670B44
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 23:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjAQWIk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 17:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjAQWHz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 17:07:55 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB0E3B0F1;
        Tue, 17 Jan 2023 12:39:49 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id vm8so78208197ejc.2;
        Tue, 17 Jan 2023 12:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4MB9gYHHvO/URFrL2sVTmvsjtm52IsGtkoIfgFunyw=;
        b=aQ5bf3JPO/x0ABVhocfiJuvlbutLp5tpmeLyLxysP4CsEqqwcr0Z86DLInGv0aTS3M
         oupPz5VJeIDfMTwFkAJGLbaUMm05FKTceINKlNay4Ad1rx0vTneLXvr+pt/5Ka2EBNM4
         3U+17JijVdmEWaJ9UIkDsFyXMnTj4IJa4FO04C9lcGSmKQeF2n7koztZh3Zwwu3zYrmB
         mML1EJXHKoImK5LP6ISxqR6dC/88kL3A7ojNoRh5lKG5A/R99OqRNlZiqFd3fCP67AFV
         el9hSqpAjZbzIhXyEK7HDaN1uUhZ7oFF6InPcgwFKihN19gs6vhmj6HG2r9EYWs4+LHp
         ZIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4MB9gYHHvO/URFrL2sVTmvsjtm52IsGtkoIfgFunyw=;
        b=ceimlehRYjqzQIruVymYI0f+xXHAQgwvLaxZ85LJRi2riyJLXWv3We/yOqMpdMIPZc
         9dwzYwFYOk90QMBCT6y1Ulp81+kR2flq8/Cbr0RxEQr21UPhIdCHGoxWf3zjPPNw5MV/
         sta0ahY0Forn1lxMVfUnVt0XZ1+ADqkHbHlh42ZTCukim64WSNt4JN9D3UF3UMQcG2I6
         5Ydd5X96f5GGAkRWvXIlzUlvL8vzAEqQ+F3NC35E5KjZ5bHiq0dw75i3vijdtwi+jP3y
         3W4Shi0NMu3i1dlkH8ZKZ3G+1IQcOktoUWCM0WEK0hJ9ignL9vMqX+9QAb5hOPcBhuMG
         XeFQ==
X-Gm-Message-State: AFqh2koUNBzo1GebZdKa1KLXXDL86ZwsmUxk4pDbs5N/hYNpOdxwYb4J
        SlHGoSMprazmXUHyvpmfvbZsLTDSPG0=
X-Google-Smtp-Source: AMrXdXsXIN2VEyV1CuJe6y2c72bWj6jGxPRQ2DDzvklk6m9dKGv0fz4bq2wZpo8l19x5UsJjP0E9SQ==
X-Received: by 2002:a17:906:948e:b0:870:8a70:d630 with SMTP id t14-20020a170906948e00b008708a70d630mr4771915ejx.17.1673987987909;
        Tue, 17 Jan 2023 12:39:47 -0800 (PST)
Received: from ?IPV6:2a01:c22:7346:8100:11fa:3b53:e36a:9e73? (dynamic-2a01-0c22-7346-8100-11fa-3b53-e36a-9e73.c22.pool.telefonica.de. [2a01:c22:7346:8100:11fa:3b53:e36a:9e73])
        by smtp.googlemail.com with ESMTPSA id e20-20020a170906249400b0084d4cb00f0csm10813009ejb.99.2023.01.17.12.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:39:47 -0800 (PST)
Message-ID: <fa28a480-1980-16dd-0263-ae4866e7c7cc@gmail.com>
Date:   Tue, 17 Jan 2023 21:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v4 1/3] dt-bindings: i2c-gpio: Add properties for dealing with
 write-only SDA/SCL w/o pullup
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
In-Reply-To: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
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
---
 .../devicetree/bindings/i2c/i2c-gpio.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
index e0d76d5eb..67898cc52 100644
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
@@ -63,6 +67,18 @@ properties:
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
 required:
   - compatible
   - sda-gpios
-- 
2.39.0


