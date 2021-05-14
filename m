Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5DB3807F4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 May 2021 13:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbhENLEG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 May 2021 07:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbhENLEC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 May 2021 07:04:02 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A3EC061574;
        Fri, 14 May 2021 04:02:51 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id t4so16011777plc.6;
        Fri, 14 May 2021 04:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OOicQDUMq21UM0Ud7C95oVsNtJIeM7ZkfF7dwnsXfEg=;
        b=nQlQZxXGeUQ4gP81dPpiXkTEbHY/alLIvR5F6WhN+zlLpm6mPmYEsPD7dMTThV4qOy
         Lu3K3rLeKTHEacia78TX/Hdt2rBlb4lOQqAsQ4b+wijc3Ww/kT7uizjRXhS+P3q48+Cp
         dtLuqZEn2UJf5xt9LDMXNbeKj4hGfwbdnRWffqbp8Ronq3HXVKlM5rEOh4xRnVKzG/zN
         /6W2u1Iv8g3qfhH4mzed9kdG1ndtMCoaW3jTxXhHxv+Jlhmuw0dhqZE/u4zaQVk9kOHT
         1t6MtfHHeQ7ruu8j3Q3J+ITWWWkwWDS+Fn3itNosCln8R5qCcZ7J9HHiSs1Y0XgijcV+
         dRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OOicQDUMq21UM0Ud7C95oVsNtJIeM7ZkfF7dwnsXfEg=;
        b=eSw+B/e5FF46SaCg9rahiDdZ8XWgpns2Y1Dltgcb4DfCWjrtAHrrKJcGF+EY+DKeRy
         ggwetlh0AGNuNdlxauFt50uCt8dDDxa28pGP6nt/lt7KBAgN5fxiW1rJY+fp6JhrrJPJ
         zxzznprarU09SQunnU4hxd2TeoglO2aTjO3XSuN2CoRXXVlqcLMnwoQ0UvooEQyNeCgY
         9Oz6CuZJpLBx+dO97XSr5bTHbRgl44XUpBvLM5CkB58HyZ6EhXYN+pNyI5nx6KoNbFgb
         xkvCXII2DAPojUbQBvgCq5B3+Jp1XCXQZF+yrnn0K5e9ZaIsg/mqe908OVEmD9tyI3NM
         P4tQ==
X-Gm-Message-State: AOAM530O/fnx+E4v/mEpmt8vctQBvuOyIzD6L3BWjf9dZXT9d79Pj5je
        mp8JW4vAkbKSIRdscxAGiEE=
X-Google-Smtp-Source: ABdhPJx0Ynnvv8lCfWgGxjHnaXYOCPih7/zTgEt/rhl7yOCbB0MgfG7zmIHpo+UWX7GF7sX1k5pYfA==
X-Received: by 2002:a17:90a:4092:: with SMTP id l18mr10534045pjg.35.1620990170835;
        Fri, 14 May 2021 04:02:50 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 202sm4193402pgg.59.2021.05.14.04.02.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 May 2021 04:02:50 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     patrice.chotard@foss.st.com, pierre-yves.mordret@foss.st.com,
        alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, mturquette@baylibre.com
Cc:     sboyd@kernel.org, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-clk@vger.kernel.org,
        Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH 3/4] clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate
Date:   Fri, 14 May 2021 19:02:31 +0800
Message-Id: <1620990152-19255-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This is due to misuse ‘PLL_VCO_SAI' and'PLL_SAI' in clk-stm32f4.c
'PLL_SAI' is 2, 'PLL_VCO_SAI' is 7(defined in
include/dt-bindings/clock/stm32fx-clock.h).

'post_div' point to 'post_div_data[]', 'post_div->pll_num'
is PLL_I2S or PLL_SAI.

'clks[PLL_VCO_SAI]' has valid 'struct clk_hw* ' return
from stm32f4_rcc_register_pll() but, at line 1777 of
driver/clk/clk-stm32f4.c, use the 'clks[post_div->pll_num]',
equal to 'clks[PLL_SAI]', this is invalid array member at that time.

Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-6-git-send-email-dillon.minfei@gmail.com/
---
 drivers/clk/clk-stm32f4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce5ff85..42ca2dd86aea 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -557,13 +557,13 @@ static const struct clk_div_table post_divr_table[] = {
 
 #define MAX_POST_DIV 3
 static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
-	{ CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
+	{ CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
 
-	{ CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
+	{ CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
 
-	{ NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
+	{ NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
 		STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
 };
 
-- 
2.7.4

