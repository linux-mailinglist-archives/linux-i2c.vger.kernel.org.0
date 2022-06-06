Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E6253EF59
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 22:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbiFFUOX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 16:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbiFFUOU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 16:14:20 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D053913AF0A
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 13:14:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u3so21304219wrg.3
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKndGtfRMJoB9VZHAXJ3155b6Ocgr/Z/0m5W/nSp3fk=;
        b=R3sETjnSuiHTlG/IUAzV7fv8dB2d7Wfi3qLYLNc9aIyzyelXvPU2/mkdqHiJ8OxdOK
         9EjpPrT+BIuW9BnpUX5pJVptwi19xM1aqlQ3ntH2S40hkm/uJRXdQVZ2TmJvQMr4XbcF
         VdIoxfrs97B8KLigTlKKPvrC5tp6w+YaeOg06kxlzvWW885WtneFPzVamFPzvto1kl5J
         vu0AV4mMAvhrfjf9qxND5ndORn1bpfOaJhqU1Awf4OwE7Sw7DDLNBxys18uyxQ/GpZwe
         95O9Dx832MZjcqSiJ39v5GdixKb9ETtsnviT6fuZDmmM44dK4epNnYyydTHlDDHRy08U
         Yhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKndGtfRMJoB9VZHAXJ3155b6Ocgr/Z/0m5W/nSp3fk=;
        b=mJFezf7IU/fqW6sKKviBCWD1DuvYExapK8oeaI2EbmQfzju7UhjJAdtOg5WIiL7n3m
         LO0+Ib182I0vEoJIvfDOajBV3NKyFk/C2WK21kz14igAkAJhF79gJve9VbF52xyO4T5B
         jKqKBUm0mHojSeR4o4WxMhIn4R3Fku/xaYQh/VLgdejUga1/RlT0bCO6l+VOOQeSY3UK
         lFPkde5BU+ftNsX+GQX919G/h+/Vwzrb+s/V402GEnlc40XKZoXFfGicfpgiiu5occ5S
         GPg3QcINm1yfBkUuCToYFVp07zoSiqM1D16rUqTcis+Ef76Dy8cFrRekFaZeWhobhy/1
         vu4w==
X-Gm-Message-State: AOAM533XKvwhizyCWr9ANLrskJaIfMi/z48nDo73YnaTcmhCXr/lllVX
        Dqm/+uHC4mwHLaqyiACJ7Ay0xA==
X-Google-Smtp-Source: ABdhPJwht5UACwjuoVJK2k9+/Vd37V0UwaPay+ABBXzqJFR7D3rCMgEzfyarZa6XGbyJAiiVBloG5Q==
X-Received: by 2002:adf:dd0a:0:b0:213:ba65:73fa with SMTP id a10-20020adfdd0a000000b00213ba6573famr18855142wrm.521.1654546447347;
        Mon, 06 Jun 2022 13:14:07 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d4589000000b0020fcf070f61sm16038489wrq.59.2022.06.06.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:14:06 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
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
        Atul Khare <atulkhare@rivosinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Date:   Mon,  6 Jun 2022 21:13:44 +0100
Message-Id: <20220606201343.514391-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606201343.514391-1-mail@conchuod.ie>
References: <20220606201343.514391-1-mail@conchuod.ie>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

