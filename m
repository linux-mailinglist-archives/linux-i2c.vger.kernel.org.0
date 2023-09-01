Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4522E78FCA3
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 13:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345137AbjIALto (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 07:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344742AbjIALto (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 07:49:44 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B029E7F
        for <linux-i2c@vger.kernel.org>; Fri,  1 Sep 2023 04:49:41 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a21b6d105cso226029766b.3
        for <linux-i2c@vger.kernel.org>; Fri, 01 Sep 2023 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1693568980; x=1694173780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5KnEJ23wDQrBX+Q/skDfs7xsPcC6Ms54YtdId73k2g=;
        b=f4MEw6E+M5s4FonzeXMjl61KauHY3kYciHCh9CX/iz9/dyKLevcqUNtA/EXO63lTc/
         f+ywMXs31szftRJlHjxPYTG2RL9KipCIzvl0iRKaKcAUpmfHauFLZ/VxvEa/fov4hVWG
         +TjR/egUaEI4tUD1ZVgzAnAZJ8qQG5Bo14MFNLx363ZQiUNaz+HQCwHmp7bT7vKPfohY
         7tL/qyj3nu2/8FJ2PFww1nTpdeZ3X4tsBdkp6fOM2FuV8tGUeFbBY4Zq/w6zuhNajJa/
         8Cds8UVmegkTap9DTFucZUEjpqv5NVipg+DHUqNa6wf0IjvzifJuDRkzw+QJ/JGE/9uz
         84nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693568980; x=1694173780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5KnEJ23wDQrBX+Q/skDfs7xsPcC6Ms54YtdId73k2g=;
        b=UyibaDWhfRITxIO4xSO3D/cIqK6VDv5dqpdc/vhscMeYPjUJE8bKfGwcpdeSsn1QSK
         vMUXvgnC0NGEvrY5IPxWnfjKucWpbJfatoyt7U0FayAcAdb5uF064qWWy6a+/xJpWX1n
         kO2VNfb4a4+njgoKkjsc00yZ7b4dZ0/tko24fCubGofERy+Fe0vW1TRYe6BLxGLVIJpC
         knPlEZW5wznJz2bdSBDINryoUNc+Do/KWuy3t7XzJOr/xAHHFbfbBPtwZ3iU1r/vB1DC
         qcSbRPTLiUVUsNZiqkoSNOkJgXTwIeNfWfeidfODvQmha1HGEXTxZWALXWBzH1CC1f2J
         +CSQ==
X-Gm-Message-State: AOJu0YyDgmn9ESvOZhcYyu0TEXK3NyifICTOSXTFIy4qAiyfa6jk0rwC
        5dWEBr4WvNgTBimmYBsJ0OlKbQ==
X-Google-Smtp-Source: AGHT+IHE3WEUr/ANccr+3kWR4PwDspoJ96QfkrJTdqkphFLGy/AEzbxBa/deDGlCsnoMb3L65434NQ==
X-Received: by 2002:a17:906:ef8b:b0:9a1:ddb9:6550 with SMTP id ze11-20020a170906ef8b00b009a1ddb96550mr1609104ejb.52.1693568979779;
        Fri, 01 Sep 2023 04:49:39 -0700 (PDT)
Received: from fedora.. (dh207-99-49.xnet.hr. [88.207.99.49])
        by smtp.googlemail.com with ESMTPSA id a25-20020a1709064a5900b009a2202bfce5sm1869532ejv.118.2023.09.01.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:49:39 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     wsa@kernel.org, codrin.ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [RFC PATCH] i2c: core: dont change pinmux state to GPIO during recovery setup
Date:   Fri,  1 Sep 2023 13:49:17 +0200
Message-ID: <20230901114936.1319844-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ever since PXA I2C driver was moved to the generic I2C recovery, I2C has
stopped working completely on Armada 3720 if the pins are specified in DTS.

After a while it was traced down to the only difference being that PXA
driver did not change the pinmux state to GPIO before trying to acquire the
GPIO pins.
And indeed as soon as this call is removed I2C starts working.

To me it seems that this call is not required at all as devm_gpiod_get()
will result in the pinmux state being changed to GPIO via the pinmux
set_mux() op.

Fixes: 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
I am aware this probably isnt the correct fix, so I am sending it as RFC
cause I have ran out of ideas.

 drivers/i2c/i2c-core-base.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..b34d939078a1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -359,13 +359,6 @@ static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
 	if (bri->recover_bus && bri->recover_bus != i2c_generic_scl_recovery)
 		return 0;
 
-	/*
-	 * pins might be taken as GPIO, so we should inform pinctrl about
-	 * this and move the state to GPIO
-	 */
-	if (bri->pinctrl)
-		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
-
 	/*
 	 * if there is incomplete or no recovery information, see if generic
 	 * GPIO recovery is available
-- 
2.41.0

