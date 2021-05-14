Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411F83807FA
	for <lists+linux-i2c@lfdr.de>; Fri, 14 May 2021 13:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbhENLEK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 May 2021 07:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbhENLEH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 May 2021 07:04:07 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4169C061574;
        Fri, 14 May 2021 04:02:55 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id h16so11624037pfk.0;
        Fri, 14 May 2021 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JbtmVlFegu/yEOkgo/QoQ3O9Y1pQZgcP2L+SCuXVqL0=;
        b=fp1v09Fw8o/YJrDM0ISr4sBVIAh5N8cQ5ede5YPsHlfph256kamuUPI8xN6w8baQ6j
         TWvGKzsgItfyZDBLU8d6pnm3TN586CAJzzDJd8uYY7dw3T/Hs6xwnpPalxEzPvFgKrMJ
         TyEkVpkZy929j0ARWFkghwfAs3M5tDYY+YD5RvLqQqV8LuDWyf1UKNE9guc3vJzuUv5F
         ILa89dPd6jLhdF7+X/czAmaH1ZwO2aqqG7vahRqb9QZHzECaSRN4Xl8gurEGJzjx8AuQ
         485rHEglAlqGca8kkJWVpC4jgvV4eorjccCXgyjRLT0hnJmlOqLBCt8pXJ4m2R+q3E50
         Aarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JbtmVlFegu/yEOkgo/QoQ3O9Y1pQZgcP2L+SCuXVqL0=;
        b=NPD6dWxqs9BgikLImZ60iqanxLeTgBh/j1SekaOq01yHS1OYGkkX9gDh5Ww7GbKaJs
         2/aMBCjkrHaitNnc7ndPJavgt1xkMRb1yPSYYaChTV8Ybc88Mixv5B4Mcos2s3TLKfRN
         Rzf9pWSGsDIDPPDiA/+U2+m4VWTsKC9WAqtSDbKwrND2mh8+eqMLnwnJxbskOTN/Idar
         HYneUe+aGtqAf2uuqbwkp42CT1g9tP7LWAgmCBP/aMi3ZiGBcNUk5loxqAay57QGD42t
         h6u4KlMtCqAAOLuwBx0SKMU5SNQDJPetS9neVUsRBXvLxkfUMEfMQN3c9Xj82/6wZ7t2
         YqXg==
X-Gm-Message-State: AOAM533nDOqsI6xgEmRxsJw/iURkr9UPKJafQUr12KUV5zX7xao1OWK5
        MxAu1/f46vkgch7Gs5cgh75cKNSnCRIoa/oN
X-Google-Smtp-Source: ABdhPJxqI2KKH4oJ6y3qHsv0zSC7+p7HNCpz1OvYKNLOB5TRihvLmt8HQDIN8MLwI+mNHsDbnB1E5A==
X-Received: by 2002:a62:644d:0:b029:2d1:1c84:dae5 with SMTP id y74-20020a62644d0000b02902d11c84dae5mr8511892pfb.77.1620990175080;
        Fri, 14 May 2021 04:02:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 202sm4193402pgg.59.2021.05.14.04.02.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 May 2021 04:02:54 -0700 (PDT)
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
Subject: [PATCH 4/4] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after kernel startup
Date:   Fri, 14 May 2021 19:02:32 +0800
Message-Id: <1620990152-19255-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

stm32's clk driver register two ltdc gate clk to clk core by
clk_hw_register_gate() and clk_hw_register_composite()

first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver

both of them point to the same offset of stm32's RCC register. after
kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
---
 drivers/clk/clk-stm32f4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 42ca2dd86aea..f4156a8a6041 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
@@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
@@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
@@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
 };
 
-- 
2.7.4

