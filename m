Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E915122AE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Apr 2022 21:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbiD0TaV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Apr 2022 15:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbiD0T3A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Apr 2022 15:29:00 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F046C4ECF2;
        Wed, 27 Apr 2022 12:25:18 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d5so3859990wrb.6;
        Wed, 27 Apr 2022 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=0W3gP71n1MpZQMJz0XuN2Q/9yyGOAs5p7ZQydj5TXzM=;
        b=IopDI538q2NMk/iwKb7awj5KfPdKiaM1XdpuM9nkHAkyvoji6a83CyYMnOnB68MYpN
         Ut50K3HFUOgy3rCVTGq+yZGRUMUzPY/HHa8GAThXKVnFdQU82ZT9NtHh2LOVHPZs8dP+
         yxLEeillobzoDqW/KJkhTOEQV52p7QcqN+/xXZz+ekIC+u7RNOAcwL9kQV3WEg3+vHPR
         WhOwr/NlYCOyrCY6LXssKZsIA4T/DwUUJEx80UiuIFoja5EMNP2XrEhAdNOOyS8BFrSG
         0/qT20j3hA6TizkAgAUwc9SjWi5gr9jcqA5kEL+bznCRKIkEKdf8TUXbFvOAoO5w2Zu5
         eZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=0W3gP71n1MpZQMJz0XuN2Q/9yyGOAs5p7ZQydj5TXzM=;
        b=Fi3Oj5/iQzn43cINgBPf0Jcc+n8HOsEHriAskmHqynk+JSpiN4U19ldXKcJh7l2Vgp
         Vslakm/WbHEwvNfYbbfk2Ki68D86OLMM+wYZf9jSu/DcalTkHMhf4iEpxzLT6deOZCFT
         D6xpFsoLkUFsTCE7ar+qCsQaHNX0Pjb3+7QftIyIjmn1uNSEgkvJXdfaHxMxydb2WezP
         H/WgfxLf7Xax3ccW33j4d1KbSyrkTRjFv+88+r5QRqLyKSUtLSkWH780xdvwX1C0bEu8
         HnLdCsjCrh5JslOUWN0VcTziNQwXKNOntiZH3W7tR+xVo19XJLf0DjVHbBBEWn3f+dQx
         +Sog==
X-Gm-Message-State: AOAM5316jojx9vn8JsRa8hFGTbcANXMegwDc8xmYEbfuVHq0ttqTVbPm
        FY6eLmjwhdNc8asqQziQTW9tqK1wjG8=
X-Google-Smtp-Source: ABdhPJxlQSR42melvpN8JuJWA3iGQzH2dKFKRtRFwARgPNEKySFm88SLBQBfG2iWXu5+dJel1mP9wg==
X-Received: by 2002:a5d:6e87:0:b0:20a:c40a:cda4 with SMTP id k7-20020a5d6e87000000b0020ac40acda4mr23215366wrz.370.1651087516222;
        Wed, 27 Apr 2022 12:25:16 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c002:fc00:393a:1fdf:a518:6420? (dynamic-2a01-0c23-c002-fc00-393a-1fdf-a518-6420.c23.pool.telefonica.de. [2a01:c23:c002:fc00:393a:1fdf:a518:6420])
        by smtp.googlemail.com with ESMTPSA id p3-20020adfaa03000000b00207a1db96cfsm15067055wrd.71.2022.04.27.12.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 12:25:15 -0700 (PDT)
Message-ID: <e2e30c3b-21db-72d1-1b40-d1f2fbcaaa43@gmail.com>
Date:   Wed, 27 Apr 2022 21:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v2 1/3] dt-bindings: i2c-gpio: Add property
 i2c-gpio,sda-output-only
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
In-Reply-To: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
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

There are slave devices that understand I2C but have read-only
SDA and SCL. Examples are FD650 7-segment LED controller and
its derivatives. Typical board designs don't even have a
pull-up for both pins. Therefore don't enforce open-drain
if SDA and SCL both are unidirectional. This patch makes
i2c-gpio usable with such devices, based on new DT property
i2c-gpio,sda-output-only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improve commit message
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



