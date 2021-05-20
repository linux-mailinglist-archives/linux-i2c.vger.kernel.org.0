Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B9D38B68F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237460AbhETTC7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236896AbhETTCp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:45 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4205DC06138B
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:23 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so6023270wmf.5
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNl0TWlb/d8Kz2EbzgNPnXTHheMEm6iTFjb4mkLXVgg=;
        b=cweL21sTrIdENzyBjbborhA49uE2ipRCdgcwxowe9KOMrycs2dDLqF52GV+t90hRys
         IoJFqt7C4RAHRco24xXERn5nErc3/2rKcViylH/knoA36dFnenR8Yk7fa5K9LJyvLZPG
         +zl0Yye1+p0am3ozSkKClsbDZf9FATUp7VcvtMudJNq8zxdrja1ue5QMFoy/JoPG/L4P
         5aCGsvvB4nM4CnJW5XwcOSMmKGRBlEzvrmFh9w0X07ywQuRY/fgrrbVmThddpI9T84rp
         C9x0JnIxFl5iAxMV6ozehCNRcPzX2mZWaRDgXhXham+/jdMdcWRa6PhjlnmEq4xSt1DT
         134A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNl0TWlb/d8Kz2EbzgNPnXTHheMEm6iTFjb4mkLXVgg=;
        b=sbfmTLiyyhipqQTnblykeB8vNT6ZkuaU6AIIgavBU2o9fUxVecLvBJFZNvsPwq6YQ4
         BD3wmpYYvjynxtD5Y22G0jKdjlcCLLfIvlVfjB9mjSXIzxCoud0HTB5tIbbSA5npz8EU
         yRS0EDoI3ArHrjPhMjjM+mFbEzdpabXVItbE+QH6xjMKzkRAPpOsVhwzR1IeMVHeBRuo
         gkeRUgzL+qpCKI5Buy3dP1KRYOTE6o14ESn1lQFZttlBDEaQuJgHT5yfa+oXednUL/Fw
         4zLpex27vgxZiL0/gN6awtzfs5BtLnPxNuN6Qac7VwWKZW1WhpHxQM2Ub3b0uK+93HIB
         1iZA==
X-Gm-Message-State: AOAM532K0iROvtAsAmZdumjoOiXNq8h6mvZxZNgOJbJkNxb0vPujMKYI
        BTSCztAxscW9wYWgYHS84vuAnQ==
X-Google-Smtp-Source: ABdhPJzxHkukShLJhUeulLdekCTyvrfuCDAywra0MTyFXRdW/ggmRXuGa47tGMYh9e/r2Cojvnu4XA==
X-Received: by 2002:a05:600c:ad9:: with SMTP id c25mr4876956wmr.56.1621537281856;
        Thu, 20 May 2021 12:01:21 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:21 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
        Dennis Kovalev <dkovalev@ru.mvista.com>,
        Vitaly Wool <vwool@ru.mvista.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH 11/16] i2c: busses: i2c-pnx: Provide descriptions for 'alg_data' data structure
Date:   Thu, 20 May 2021 20:01:00 +0100
Message-Id: <20210520190105.3772683-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-pnx.c:147: warning: Function parameter or member 'alg_data' not described in 'i2c_pnx_start'
 drivers/i2c/busses/i2c-pnx.c:147: warning: Excess function parameter 'adap' description in 'i2c_pnx_start'
 drivers/i2c/busses/i2c-pnx.c:202: warning: Function parameter or member 'alg_data' not described in 'i2c_pnx_stop'
 drivers/i2c/busses/i2c-pnx.c:202: warning: Excess function parameter 'adap' description in 'i2c_pnx_stop'
 drivers/i2c/busses/i2c-pnx.c:231: warning: Function parameter or member 'alg_data' not described in 'i2c_pnx_master_xmit'
 drivers/i2c/busses/i2c-pnx.c:231: warning: Excess function parameter 'adap' description in 'i2c_pnx_master_xmit'
 drivers/i2c/busses/i2c-pnx.c:301: warning: Function parameter or member 'alg_data' not described in 'i2c_pnx_master_rcv'
 drivers/i2c/busses/i2c-pnx.c:301: warning: Excess function parameter 'adap' description in 'i2c_pnx_master_rcv'

Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Dennis Kovalev <dkovalev@ru.mvista.com>
Cc: Vitaly Wool <vwool@ru.mvista.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-pnx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 8c4ec7f13f5ab..50f21cdbe90d3 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -138,7 +138,7 @@ static inline void i2c_pnx_arm_timer(struct i2c_pnx_algo_data *alg_data)
 /**
  * i2c_pnx_start - start a device
  * @slave_addr:		slave address
- * @adap:		pointer to adapter structure
+ * @alg_data:		pointer to local driver data structure
  *
  * Generate a START signal in the desired mode.
  */
@@ -194,7 +194,7 @@ static int i2c_pnx_start(unsigned char slave_addr,
 
 /**
  * i2c_pnx_stop - stop a device
- * @adap:		pointer to I2C adapter structure
+ * @alg_data:		pointer to local driver data structure
  *
  * Generate a STOP signal to terminate the master transaction.
  */
@@ -223,7 +223,7 @@ static void i2c_pnx_stop(struct i2c_pnx_algo_data *alg_data)
 
 /**
  * i2c_pnx_master_xmit - transmit data to slave
- * @adap:		pointer to I2C adapter structure
+ * @alg_data:		pointer to local driver data structure
  *
  * Sends one byte of data to the slave
  */
@@ -293,7 +293,7 @@ static int i2c_pnx_master_xmit(struct i2c_pnx_algo_data *alg_data)
 
 /**
  * i2c_pnx_master_rcv - receive data from slave
- * @adap:		pointer to I2C adapter structure
+ * @alg_data:		pointer to local driver data structure
  *
  * Reads one byte data from the slave
  */
-- 
2.31.1

