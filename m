Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1294438B684
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbhETTCl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236610AbhETTCj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:39 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF1FC06138C
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:16 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so5621973wmc.0
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6u3rdbvD9PTfcCA7ACz3qmikp01AY6p3i41CuN7fNDA=;
        b=WEjFR9I20pFT5Qs9wmFrljlmfZP7vTI6gNIXTCFM20oq9F/DUik2fBKtZs4k9bxTrb
         8prbrwtGwVnJAmeeGi0/IzeLS3WJGvXWfN25xdZkSurkpUMUuWmzU+q2aOerwi0RaiTB
         UzJQql9bKf4n7vDydlZ5kx1CjHt8I7iXGv1QexF+9c/5SWrDF43APOAA1/wD/9DDgxoM
         hFDhvCxkZdfZme7MJOq+9Y7ySb5D3DjTs8qQeF7wjskM7mbH5SFCICIrSEdIY6kv62DX
         ZCRssTuXjaGaGGN+whln4J/t2UP8SSSctqvKPyCoZuK1MJ6veVnDD841dkgSKEFTcYRS
         qECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6u3rdbvD9PTfcCA7ACz3qmikp01AY6p3i41CuN7fNDA=;
        b=edwWezYR6Dl730OrOP3p39aJhlT17YYhNUhPMHphKdar5o/6/vWnf6KBLCe6YcVX/O
         ZDt2w7u47OP/sLLAyBTn5teAxf3i/gV7M74M59KyETCt/92kBtd3AondG+7CM1VlPtyK
         v5DZZGcoeqW6udasawy2Z/Di0U+VLpT6JXTQmqSmvEfzcSJ4QtV3KWnxktcQDWbR0YhS
         ivbk3Gjweuqn2F0/HQoPZQwlyXG8Bs3nibBQWSdekI4ljwnWMrNqfxVnm3xhZ1Aqs9Cm
         nM0eqEQyvSX6linp3yVgi5FfP3+Q2jvMAu7DyIIRvcaHpT/FMrmcuycHu2XGq0xxPmr5
         vHFw==
X-Gm-Message-State: AOAM532YnPEwHo5QoMJvVerR9GL6vPVliJlo1BPi3imbt/TyqQhwNBkM
        t5yNhZvNMQ4vWLX9BYU69ADWZQ==
X-Google-Smtp-Source: ABdhPJwUE62oZpZlO2TeEHcGYie95WLrxyWANyHZTIHe6jpYQB5Lb8+3bYUIwVlwntcgmrvjiGGyZA==
X-Received: by 2002:a1c:7210:: with SMTP id n16mr5389110wmc.18.1621537275193;
        Thu, 20 May 2021 12:01:15 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Anders Berg <anders.berg@lsi.com>, linux-i2c@vger.kernel.org
Subject: [PATCH 05/16] i2c: busses: i2c-axxia: Fix formatting issue in struct and demote unworthy kernel-doc headers
Date:   Thu, 20 May 2021 20:00:54 +0100
Message-Id: <20210520190105.3772683-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-axxia.c:135: warning: cannot understand function prototype: 'struct axxia_i2c_dev '
 drivers/i2c/busses/i2c-axxia.c:172: warning: Function parameter or member 'ns' not described in 'ns_to_clk'
 drivers/i2c/busses/i2c-axxia.c:172: warning: Function parameter or member 'clk_mhz' not described in 'ns_to_clk'
 drivers/i2c/busses/i2c-axxia.c:271: warning: Function parameter or member 'idev' not described in 'axxia_i2c_empty_rx_fifo'
 drivers/i2c/busses/i2c-axxia.c:303: warning: Function parameter or member 'idev' not described in 'axxia_i2c_fill_tx_fifo'
 drivers/i2c/busses/i2c-axxia.c:150: warning: Function parameter or member 'slave' not described in 'axxia_i2c_dev'
 drivers/i2c/busses/i2c-axxia.c:150: warning: Function parameter or member 'irq' not described in 'axxia_i2c_dev'

Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Anders Berg <anders.berg@lsi.com>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-axxia.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 5294b73beca85..946874e648547 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -117,8 +117,8 @@
 #define SDA_SETUP_TIME		0x8c
 #define SDA_HOLD_TIME		0x90
 
-/**
- * axxia_i2c_dev - I2C device context
+/*
+ * struct axxia_i2c_dev - I2C device context
  * @base: pointer to register struct
  * @msg: pointer to current message
  * @msg_r: pointer to current read message (sequence transfer)
@@ -165,7 +165,7 @@ static void i2c_int_enable(struct axxia_i2c_dev *idev, u32 mask)
 	writel(int_en | mask, idev->base + MST_INT_ENABLE);
 }
 
-/**
+/*
  * ns_to_clk - Convert time (ns) to clock cycles for the given clock frequency.
  */
 static u32 ns_to_clk(u64 ns, u32 clk_mhz)
@@ -263,7 +263,7 @@ static int i2c_m_recv_len(const struct i2c_msg *msg)
 	return (msg->flags & I2C_M_RECV_LEN) != 0;
 }
 
-/**
+/*
  * axxia_i2c_empty_rx_fifo - Fetch data from RX FIFO and update SMBus block
  * transfer length if this is the first byte of such a transfer.
  */
@@ -295,9 +295,8 @@ static int axxia_i2c_empty_rx_fifo(struct axxia_i2c_dev *idev)
 	return 0;
 }
 
-/**
+/*
  * axxia_i2c_fill_tx_fifo - Fill TX FIFO from current message buffer.
- * @return: Number of bytes left to transfer.
  */
 static int axxia_i2c_fill_tx_fifo(struct axxia_i2c_dev *idev)
 {
-- 
2.31.1

