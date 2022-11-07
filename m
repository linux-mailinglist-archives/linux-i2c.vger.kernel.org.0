Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C541E61F85D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 17:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbiKGQHF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 11:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiKGQGW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 11:06:22 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573D120375
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 08:06:18 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id p16so7176303wmc.3
        for <linux-i2c@vger.kernel.org>; Mon, 07 Nov 2022 08:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKkGanfErhlV5mHrMqbRP0uwulJPPEG7DEmhVp/Qms0=;
        b=etjpu8zEt7ZExNWzH7ZrOo9UVdycXv8AO1R3ZfiZbX/Rm6pFVwow+68LI8VWzIold/
         0GJqZ3vAozWmZItmLR8jZzhEXmMLRTqyUcEM47XL5VJIqFcGbjemJWsUETVrHpkwVgKJ
         oGFC4W+H4CizP6hj3LAvlkQkREaGFUj/OpzDrxCYeXippBCB3kptadn65tcB7GCcGcE9
         imzLaSOKSnc0OoJPNKF8KoEcdLEIN1LlGQJxwTriTVwF7ccbYyWTyJN5qFwQtaLwUnze
         mRsWpIB3K2Hd2KK6m2U2LY5f1oCVR9ZqNvVlSOOLbi5kO0BKxay3k9sjeLFxRQYwaMZL
         a3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKkGanfErhlV5mHrMqbRP0uwulJPPEG7DEmhVp/Qms0=;
        b=ir9xrMkw5ATYD6x+EAKbdevhRqN9GaWM+WxuRi1AxqQa4lSPIyWz2rtoesibHOlGCX
         jrkPfMKXrZVk27t4jg2DfXqGparj8TBuNZiLidWiwTtzRhbzRLiVaciEZ+oBzkXXdUTz
         8kglc/5VuLz2AkDDcmbdCIQqGA0ayXdtekEIeNwm/gwLAgA4U0MCpmGevUbo2kEQmVBk
         LkOQqcFPPYhqocT+Oef7iVBch8t6VDsbT23l+024GHfgGU/9uGNFqcVP9cLItaLJkhec
         VBFzXaCErDjcVKXK8fMLohnlBUEsB5bGOgvmGj19IPIQGkBg10P8LjKq7rYOol5gf6iZ
         ctdw==
X-Gm-Message-State: ACrzQf0A25c+5NGPEQ1qzWMzaBhcbCf+3MMaDZ6dyLYKdGybBnjJLrL7
        NjUdtDqxL7HE55AbKM/eOt66Zg==
X-Google-Smtp-Source: AMsMyM5qxUxi1hy66Hsl1b/Y3LEl94Vnk85I8Vjw4USufUawO98NJwdSQZX9z9GEAhEGqiE2tqVCYQ==
X-Received: by 2002:a05:600c:3781:b0:3b4:63c8:554b with SMTP id o1-20020a05600c378100b003b463c8554bmr44226823wmr.25.1667837176906;
        Mon, 07 Nov 2022 08:06:16 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id bg20-20020a05600c3c9400b003c6bd12ac27sm9183347wmb.37.2022.11.07.08.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 08:06:15 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     wsa@kernel.org
Cc:     jdelvare@suse.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] i2c: smbus: support new RAM variant for SPD
Date:   Mon,  7 Nov 2022 16:06:02 +0000
Message-Id: <20221107160602.1912225-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On my x05 laptop I got:
Memory type 0x12 not supported yet, not instantiating SPD

Adding the 0x12 case lead to a successful instantiated SPD AT24 EEPROM.
i801_smbus 0000:00:1f.3: SMBus using polling
i2c i2c-6: 2/2 memory slots populated (from DMI)
at24 6-0050: 256 byte spd EEPROM, read-only
i2c i2c-6: Successfully instantiated SPD at 0x50
at24 6-0051: 256 byte spd EEPROM, read-only
i2c i2c-6: Successfully instantiated SPD at 0x51

And then, I decoded it successfully via decode-dimms.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
The result of decode-dimms could be found at http://kernel.montjoie.ovh/zoo/x05/decode-dimms.txt
Since RAM is DDR, I wanted to add '/* DDR */' comment, but I didnt find any document with
proof that this 0x12 is for DDR.

 drivers/i2c/i2c-smbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 07c92c8495a3..6dca19c994db 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -362,6 +362,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	}
 
 	switch (common_mem_type) {
+	case 0x12:
 	case 0x13:	/* DDR2 */
 	case 0x18:	/* DDR3 */
 	case 0x1C:	/* LPDDR2 */
-- 
2.37.4

