Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6F038B683
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236505AbhETTCl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236600AbhETTCi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:38 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606B5C061763
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:15 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so6023066wmf.5
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t4TZ9u6oAq4SZBg4hZTxMATDAwTOPHS9ZK/AyDLn4d4=;
        b=e2k7VHb12sv3hOQCa7LrwLF05Pkak+LDDNKPB6Uz0X6RrE6BoBttoxgMaxR6QONNME
         rTRW9po870y8+6j/Z7p4TRsSMyD4CIU5rkF4UYFndGVcopi9ebh919F3nd9cee2pn9/+
         bRCW2X80fPY8kwz0htp4hC0OjP5Rdl8aZcpSCeIykhQQ9tFWQKgOvWIagJHJXzhK4kiQ
         rnjAJrEWDtY/9HC06X0ez/WO5me95KlF8agImRmmEVpfPGewoJgoENGyN0ZGIosuUYC0
         6gjU9RejlXrTaU2PcqnTCSf7r6QCDtCxAK6CbBVzeu35Mu+iAjIogHqnr+z8qwwMU0RS
         iMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4TZ9u6oAq4SZBg4hZTxMATDAwTOPHS9ZK/AyDLn4d4=;
        b=nhSTiG/8DDrS16jmGxCWAikw+InnM/t4pTctrBcxVBvnwtXqQdNZOvoyUoRF4wEtx9
         HiIUw6uDhGlaxpTYlBoEL9WDK+KGwzvsA8i0CjJvRjAWOiLiWEpxFh/h2v6DhR6gzOps
         7KgvDGG84mv8PacTJ3jwObgyYOdZyIPJWtnnSwHI3JExW/2vOLv+yD0/BBIB36hItkdD
         J1pyKkqme+Nx3RWVKs6CF4U398XH2zudyzLsTYWnJJbOfF140oH+cMJt7cnDX10miwgH
         F8tkGgu7yPeUrmvkARphZ1HPHzdMwoa2GlJFgFTmI4Xqb/GgZ6j22wEp4MjoTB+Ocy31
         zIVA==
X-Gm-Message-State: AOAM532SPMhUhVgq1aNq0GRuaPLOTeei83W89CBRoqTDWIlpYYgHhTx8
        JokSAtqwZQzJrnr/0DzE3LPalQ==
X-Google-Smtp-Source: ABdhPJz4CKOgYEBopEhSdxOI2co+mVFSiVPNKK7nPotOyXV3KvTjfbVyKNEt3BbiSVQ/pjeACFJT9g==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr5149019wmb.155.1621537273966;
        Thu, 20 May 2021 12:01:13 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:13 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Thor Thayer <thor.thayer@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 04/16] i2c: busses: i2c-altera: Fix formatting issue in struct and demote unworthy kernel-doc headers
Date:   Thu, 20 May 2021 20:00:53 +0100
Message-Id: <20210520190105.3772683-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-altera.c:74: warning: cannot understand function prototype: 'struct altr_i2c_dev '
 drivers/i2c/busses/i2c-altera.c:180: warning: Function parameter or member 'idev' not described in 'altr_i2c_transfer'
 drivers/i2c/busses/i2c-altera.c:180: warning: Function parameter or member 'data' not described in 'altr_i2c_transfer'
 drivers/i2c/busses/i2c-altera.c:193: warning: Function parameter or member 'idev' not described in 'altr_i2c_empty_rx_fifo'
 drivers/i2c/busses/i2c-altera.c:209: warning: Function parameter or member 'idev' not described in 'altr_i2c_fill_tx_fifo'

Cc: Thor Thayer <thor.thayer@linux.intel.com>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-altera.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 7d62cbda6e06c..354cf7e45c4a0 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -55,7 +55,7 @@
 #define ALTR_I2C_XFER_TIMEOUT	(msecs_to_jiffies(250))
 
 /**
- * altr_i2c_dev - I2C device context
+ * struct altr_i2c_dev - I2C device context
  * @base: pointer to register struct
  * @msg: pointer to current message
  * @msg_len: number of bytes transferred in msg
@@ -172,7 +172,7 @@ static void altr_i2c_init(struct altr_i2c_dev *idev)
 	altr_i2c_int_enable(idev, ALTR_I2C_ALL_IRQ, false);
 }
 
-/**
+/*
  * altr_i2c_transfer - On the last byte to be transmitted, send
  * a Stop bit on the last byte.
  */
@@ -185,7 +185,7 @@ static void altr_i2c_transfer(struct altr_i2c_dev *idev, u32 data)
 		writel(data, idev->base + ALTR_I2C_TFR_CMD);
 }
 
-/**
+/*
  * altr_i2c_empty_rx_fifo - Fetch data from RX FIFO until end of
  * transfer. Send a Stop bit on the last byte.
  */
@@ -201,9 +201,8 @@ static void altr_i2c_empty_rx_fifo(struct altr_i2c_dev *idev)
 	}
 }
 
-/**
+/*
  * altr_i2c_fill_tx_fifo - Fill TX FIFO from current message buffer.
- * @return: Number of bytes left to transfer.
  */
 static int altr_i2c_fill_tx_fifo(struct altr_i2c_dev *idev)
 {
-- 
2.31.1

