Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4AF47AC4D4
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Sep 2023 21:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjIWT0i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Sep 2023 15:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjIWT0h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Sep 2023 15:26:37 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB2683;
        Sat, 23 Sep 2023 12:26:31 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-690f2719ab2so988115b3a.0;
        Sat, 23 Sep 2023 12:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695497191; x=1696101991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mESRu0GuXaHEzFqpRAi905zewtFC1P8uosYJLAbeYcc=;
        b=gbHSe3Uc9pWfR6+Ee/1VOAhDUW10vrFxRl87Ne7YLO2LxzHMkD5mz8NpP93ewYQMT8
         0nruqagcU8q07pLP2NYUC+0dIYx75PGgxg29ZZWYVELomxbzrwAUiXh2TMiD6yWyskND
         Q/5QvVdRyiCxeFQlH/LS9PxhbilGSDDqzTJm+MHsQTwgMdmrP+nX6YH2BWj35oI/LgMS
         LWR1bnbSGqZEesljpn6TWlKFUh6itwviUrx4pY5vjbWJG8r2pR/6A7OJOWMEu5Gs3idC
         2v1QXdbud7RZ9oNcMOk/95XerOE8MsdrK7UZoBvoHCm1/1vE2rlRVL+d5IVUSAdadTN6
         NOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695497191; x=1696101991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mESRu0GuXaHEzFqpRAi905zewtFC1P8uosYJLAbeYcc=;
        b=qUlRvBy6ngaEgKnM7cT/r1AGq72z9IQa2XjYy7nINNab8Q1GVqOQ1is02lmoaEsH0j
         hPt5ZGpEPXdspDsnugH8a70lrObPIAdtjEkB3g4HirYoqlkfo0EDW4H/iGHXSBa+cDq1
         qo9hTqUdnDXr9buHxRhSN2ciO5lACF0AE4l5nbYF3R6rkn74tm3oC0X2Cbo9pb8I5vN2
         hLAnM2UB8YvJ6MrlD759il4ZDIoB8vQjSzttNJnIF1A6aTY+lEp+UdMlwFaZFhx9mtG9
         jrimos5d2tQ93miTU0Nz3TIfdIawlEMR64h8nK4sWbPHwwTpfG/2xprYGT7J3HFa88dM
         OKbQ==
X-Gm-Message-State: AOJu0YxKKer3odKa6sRfryqv398pzUk/vh3rAGYIMx73kZTcaWAQlABw
        uzPIbNvElSyyBNmF4E35new=
X-Google-Smtp-Source: AGHT+IG/g1HTPaULPi1w91UH/OLS91m/MxKQYGcR/YvBDJBSe4/RlYTKjxVrBf8rFgpcEi2boy5alQ==
X-Received: by 2002:a05:6a20:1614:b0:13e:1d49:7249 with SMTP id l20-20020a056a20161400b0013e1d497249mr4279630pzj.2.1695497190715;
        Sat, 23 Sep 2023 12:26:30 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d8eb:c6dc:fcf8:4b58])
        by smtp.gmail.com with ESMTPSA id k17-20020a637b51000000b0056b27af8715sm5148254pgn.43.2023.09.23.12.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 12:26:30 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     andi.shyti@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: i2c: mxs: Pass ref and 'unevaluatedProperties: false'
Date:   Sat, 23 Sep 2023 16:26:19 -0300
Message-Id: <20230923192619.601890-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Running 'make dtbs_check DT_SCHEMA_FILES=i2c-mxs.yaml' throws
several schema warnings such as:
 
imx28-m28evk.dtb: i2c@80058000: '#address-cells', '#size-cells', 'codec@a', 'eeprom@51', 'rtc@68' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mxs.yaml#

Fix these warnings by passing a reference to i2c-controller.yaml#
and using 'unevaluatedProperties: false' just like the yaml bindings
of other I2C controllers.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml b/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
index 21ae7bce038e..171a41407241 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
@@ -9,6 +9,9 @@ title: Freescale MXS Inter IC (I2C) Controller
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -37,7 +40,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

