Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9BA38B68A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237257AbhETTCs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236775AbhETTCm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:42 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20EBC061574
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:19 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id n2so18797597wrm.0
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8RN24loetVCGfbRYoJL7dvb31oLr87M1dl06DygrN7A=;
        b=fJjWAxmp5AzE7WH5LUpXOh0nYHestzcUBTRqFX99818kVDBaG5rBhoR7oPfnpA1e19
         aU1ebFxUxUdOR0QZ48gKVCdNeivmC4RgpVSFyy7QSe+HLjr2m+/AojVrlqHS0HD7GiOx
         dHZW4OfY7ZBekCn6UcogEh5psuDPj3vyHmdSiCh/b0yA7UTAroYxBPkB51G7Es9JtVsK
         jr7NIgLKuEcVkFEf+iO+pNM3d7eb1SDXNZBPPEKr0ho5i3oWbjMgo9RN7kCNTdAcMXg3
         2yBIi0d0K5hLYrdjRc6hFDs4uRewsKbq0E6sBCuBSoKHaELcHbSyP8IpgP1mcJMpRiVU
         vq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8RN24loetVCGfbRYoJL7dvb31oLr87M1dl06DygrN7A=;
        b=oNjejVpj//csxdxxuygy5G0SUVNe+YgLQS/oQ4GyGJw1qwV+Z01+7X5k7KTe8Ggftw
         XtjaIVzGZDwUbNeEM44rJndgczUD1nUE+y3cbbTb/SVmwaarWDj4gt2RPSiDmUv3PTLF
         09wzA0EKREHvq/bRzdBCHlOqkoDnyGJpVLpoXvYOxQI649DullYP2Upug+RIj3Jaclxs
         HmV1ypA0kA0I7grFUVEV4vE1SxDrM84Uq7V+3CeDfsFp1y2EsYQqThgTDrZAMMJZZ3dg
         4QtYx05BMhkjTCUVBOQuaFkUMHK+Xduahmcm59oPseUYwii5tE9/m1Z9t65YpAbF/0X5
         yBdQ==
X-Gm-Message-State: AOAM533sCMRczJXqAqBruHfLPQ/2aeVE/nsiuTMTA2VjePyx+Q7fGgwm
        lCmLWY4CRIiaYY6UcCiaJSOnpfHO1oD92z2f
X-Google-Smtp-Source: ABdhPJyNdxpH7X7Jk2MzvKRyg3+v76QsMGN1FJsGZc0DuEkpXKT0MhsC9zFwwfYe4C4YT6iF7z7kGA==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr5802664wrn.335.1621537278557;
        Thu, 20 May 2021 12:01:18 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:18 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 08/16] i2c: busses: i2c-eg20t: Fix 'bad line' issue and provide description for 'msgs' param
Date:   Thu, 20 May 2021 20:00:57 +0100
Message-Id: <20210520190105.3772683-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-eg20t.c:151: warning: bad line:                          PCH i2c controller
 drivers/i2c/busses/i2c-eg20t.c:369: warning: Function parameter or member 'msgs' not described in 'pch_i2c_writebytes'

Cc: Wolfram Sang <wsa@kernel.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Tomoya MORINAGA <tomoya.rohm@gmail.com>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-eg20t.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 843b31a0f752b..321b2770feabc 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -148,7 +148,7 @@ struct i2c_algo_pch_data {
 
 /**
  * struct adapter_info - This structure holds the adapter information for the
-			 PCH i2c controller
+ *			 PCH i2c controller
  * @pch_data:		stores a list of i2c_algo_pch_data
  * @pch_i2c_suspended:	specifies whether the system is suspended or not
  *			perhaps with more lines and words.
@@ -358,6 +358,7 @@ static void pch_i2c_repstart(struct i2c_algo_pch_data *adap)
 /**
  * pch_i2c_writebytes() - write data to I2C bus in normal mode
  * @i2c_adap:	Pointer to the struct i2c_adapter.
+ * @msgs:	Pointer to the i2c message structure.
  * @last:	specifies whether last message or not.
  *		In the case of compound mode it will be 1 for last message,
  *		otherwise 0.
-- 
2.31.1

