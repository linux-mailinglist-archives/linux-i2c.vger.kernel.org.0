Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C185A53DBA4
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 15:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245490AbiFENd1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 09:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245731AbiFENd0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 09:33:26 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC92239691
        for <linux-i2c@vger.kernel.org>; Sun,  5 Jun 2022 06:33:24 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a15so7869801wrh.2
        for <linux-i2c@vger.kernel.org>; Sun, 05 Jun 2022 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvovknsG3pTwsXPXVn/vDXoAWBD8w8aZsXWfzyMtSBs=;
        b=NETA3GgPfVm66DpPaF2S0nTHcRlk3BDIbRN52sR4sT6nmMn3x8IhGjo7skosK2o2Rw
         0yYBfruS2m6oFrSu91XMhZEWRJlnF+hKkihrEeIyIS+lSymdFYTDyeQX3c9lecWfIfx+
         UCkpuQHSKoYkbEXyjYI/3ZF9VjqP0oNBRgQXs3NoqsN7tLB8hVnqXjoP6A1y9QxPlOsw
         ufvA269uijRyeoA2gNbGtQVH+/gYVCrqWuQfZ+CLHOrycRMDP2LwV6HsVu2GZTfUyyH7
         2SvjMSpxa8kKULKjRuh09rMb9w/KMnSRMKihpk0bT6XI7vcMmtgf9agmS8Cx9CnLpEUh
         gU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvovknsG3pTwsXPXVn/vDXoAWBD8w8aZsXWfzyMtSBs=;
        b=1JzoaXY8X8QJAclG42CU6ul+EHmwLBcPiGGyAGzRjd0OIXVxGJOcIzoZUz783jiOJ6
         IhkYifP3Eh2IUzU2Z8NPH0ZRe/Nd8ftSDfwE3SUvsUHDVxizAEyPHKxLnFr8GC/v94dc
         78ICKFzOpAeSBGhlnXk1Lp0FkFSHnzsjhCrQenZ/4b/Qa+gOUUsHQrRV9f9KhS54ePOg
         ETM9nofrRJELz7h1Ufa3b536HPdvXr40ZNRYm3eM2L4D+/VjKIxGBLEl5iuheIDAK5Tr
         Nd/pTPqtNaB/LwDSMQhby1WLMu/LbTzTMlD8J5fs8oOPERF7hH6BDOQeFb9qEOVTE3IX
         kO2w==
X-Gm-Message-State: AOAM533nwcI2b1YCAuOQIuBZFiROHeD2rtAMllKJHkji5/mBvIggPuxL
        sr8qObQN7vi33RHz4UyBS7q5BstkvgsidhW3
X-Google-Smtp-Source: ABdhPJyYqVnx0lY8GU7GcUNjnB/0IheYVlGhFGrMvBppFTA/r5QA2twLfKyEZ/k7oTzicp7A7Zjlkw==
X-Received: by 2002:a05:6000:168b:b0:20f:d4bd:cbc3 with SMTP id y11-20020a056000168b00b0020fd4bdcbc3mr17543214wrd.580.1654436003025;
        Sun, 05 Jun 2022 06:33:23 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:22 -0700 (PDT)
From:   mail@conchuod.ie
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v1 6/6] riscv: dts: sifive: "fix" pmic watchdog node name
Date:   Sun,  5 Jun 2022 14:33:01 +0100
Message-Id: <20220605133300.376161-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

After converting the pmic watchdog binding to yaml, dtbs_check complains
that the node name doesn't match the binding. "Fix" it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index c4ed9efdff03..1f386b07a832 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -90,7 +90,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 
-- 
2.36.1

