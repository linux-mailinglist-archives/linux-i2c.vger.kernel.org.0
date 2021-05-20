Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F8238B67C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234486AbhETTCe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbhETTCd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:33 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28ADC061763
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:11 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id f19-20020a05600c1553b02901794fafcfefso5399630wmg.2
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uDuZrk4UNMKTd6gnOhV3WWQzrwgx7DTKW4HaKm1ez8s=;
        b=OxzNzvSl5dKEJkHxeZLPOEiYfu84JT2ULxT0aBFA+R1FLe0OI0tceeEhC572Hl1bFf
         XPfA0V5ZcH8hRr9YWsLuduCFexwc0DXbXm3BODq+bTHOtYrmhjLRdeQ7pgRlfTp1rrX9
         vdow26GL+HV+vGUAtRovh7H/dJafI3fUZ7TutM6GQFQh9yX2JcByXnH8OzsWL6ihLGhW
         aVm51sDbseOXXwmRdEjfUDUXaCI3EQVRFbUA4LOcb3301ZfmaNEH8T6CeaWl/vXXHtOh
         1iBXdY3K1ck6dxFYTulP63PEAYfvtZU4pnKSj53DkQs4ES3NLdS1z6EoJjL1Mz6L4aGl
         eRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uDuZrk4UNMKTd6gnOhV3WWQzrwgx7DTKW4HaKm1ez8s=;
        b=L+fI/0ObJlGRvKjPUkoXV807P0ZpCzkUDTWsTIFM64k8WVZU6JuJYYPM1kGjCxTIDm
         shIHxRUkKIz7QiIxcAG3ToUSmI9i59/XXXthI9GP/SDCPH1qNHBGt/Vis6fTRnXOAoQL
         mY9mvKg2/O3yd+JCo0D9UJdm49qXqZRc/jJeNb+ynL7fe2zqkmKgN1nibCL1Y2E05oa8
         i1kR9UtD+jemfu25+HN4qWD9zysJd5Wkmin7iqxya0rYGYAKeDVdl83O/LIfl2AWfsjg
         GsA3vEG0lVamRJGJFyD40lHBNG8iu9pI+1sJ4fXTGJFfkLAytnXrzrtNoUVEtqh//kOO
         l1oA==
X-Gm-Message-State: AOAM530tBTl3s3n2TRF98OaXFHMSGerzigoF9yS1lPdqaFT7N08CZx/p
        37pzG9b7FfVMIrYyhQK3PjrZ4PQ/YL+QjKiB
X-Google-Smtp-Source: ABdhPJxkYe9slV0umxG1OOeypjcUJw/is/y1omVhYmkam/q2HJPQdvADPp/hCtt/a5wsfMW8yYA5Lw==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr5500694wmi.149.1621537270416;
        Thu, 20 May 2021 12:01:10 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:09 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Sachin Verma <sachin.verma@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH 01/16] i2c: busses: i2c-nomadik: Fix formatting issue pertaining to 'timeout'
Date:   Thu, 20 May 2021 20:00:50 +0100
Message-Id: <20210520190105.3772683-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-nomadik.c:184: warning: Function parameter or member 'timeout' not described in 'nmk_i2c_dev'

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
Cc: Sachin Verma <sachin.verma@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-nomadik.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index dc77e1c4e80f9..a2d12a5b1c34c 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -159,7 +159,7 @@ struct i2c_nmk_client {
  * @clk_freq: clock frequency for the operation mode
  * @tft: Tx FIFO Threshold in bytes
  * @rft: Rx FIFO Threshold in bytes
- * @timeout Slave response timeout (ms)
+ * @timeout: Slave response timeout (ms)
  * @sm: speed mode
  * @stop: stop condition.
  * @xfer_complete: acknowledge completion for a I2C message.
-- 
2.31.1

