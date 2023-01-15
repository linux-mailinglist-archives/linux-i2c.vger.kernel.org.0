Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3843066B04A
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jan 2023 11:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjAOKSd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Jan 2023 05:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjAOKSa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Jan 2023 05:18:30 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5777DCDE1;
        Sun, 15 Jan 2023 02:18:29 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso272628wms.3;
        Sun, 15 Jan 2023 02:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNZMQn185TG+Tx8tewhmSx+Qg1QuTVS0EFy/ikAT8rs=;
        b=HSn5ULbp18jNbEDsW2780oWNWY+ZUmSoShdVMmeX7zuQ41YBfpTXEqV6YaHd9OcUBi
         0AC6r68uaeOefJil7Q30wCVATb1c0zyiL87uXKvj4v+gVek/t9zZ+Wc/xEry9VsmIrNt
         YAJyqdNQnHHTs62U5/agkQMLWpfLlCZ5Axm1cnSJoXYvH46ad4Xtg5FGLJGiUe5qrXto
         sCgbDRWtEoqadsVotQqhRrS1RwCHw563kJr8C22Eqaj34z+2LYNzblfoHvaiWSjYYG6d
         fRwtZdNXmjNFhTBeFDoBRoZiRUVTOJtzyNuCPtRGKeipL1q65gJ7CQigJVMMpVGdVXzJ
         jDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNZMQn185TG+Tx8tewhmSx+Qg1QuTVS0EFy/ikAT8rs=;
        b=qlRm+J/azpFOt8ypXODXECRUyxMj8/FNSvoeGBq/+dVaynDPLrFWf6XReAHMnLJMuE
         zkiYdKt4+qzzEYDXJfmvH/CvURXjEYnk0zhwX3W6djaC7yXf2fYLyYwbwHtv2XpgUMRT
         VntlsvL45reoxi8y6dMgIf5TSRBJ6uUuhrRl9cvoS2Keb0aCTgm9XmY8hh2DkfMmsL1u
         GSjmDsArCEjl2xG+ywdoYly67NrNEjgtvOvOZNKmskVrC6ZJFFUmVbp2ZA+9qet0piDs
         jikrCHeHk1DG62zTq742IY3lBIMmm6wAtIRJiPFGweoQ0G4Kl17YhoHWwm8KVvgGUyaG
         1mJQ==
X-Gm-Message-State: AFqh2kp064AAv6T4V5S241/d41SSimOaaFXzKGiFidhbTgn0XivDofAz
        bpH40sg749FY58rddouffdUYBhp1qqE=
X-Google-Smtp-Source: AMrXdXuSX+U2cpCqO/uF7u+5F7m0/2cXk7pk8tLHcjNPlFW800Yny+G9d9TqkKnNQapyyuoZ/X89Qw==
X-Received: by 2002:a05:600c:4f96:b0:3d9:ed3b:5b3e with SMTP id n22-20020a05600c4f9600b003d9ed3b5b3emr20979706wmq.19.1673777907222;
        Sun, 15 Jan 2023 02:18:27 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id h10-20020a1ccc0a000000b003d237d60318sm30545648wmb.2.2023.01.15.02.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 02:18:26 -0800 (PST)
Message-ID: <60e3b33b-360e-94f0-5065-08589cb1cab6@gmail.com>
Date:   Sun, 15 Jan 2023 11:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v3 1/3] dt-bindings: i2c-gpio: Add property
 i2c-gpio,sda-output-only
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
In-Reply-To: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
index e0d76d5eb..fd84a60d9 100644
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
2.39.0


