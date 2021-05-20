Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDB638B67D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236585AbhETTCf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236547AbhETTCe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:34 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB68AC061574
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:12 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso6031251wmm.3
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OpCSticW7YPgZgJxCE8cbDx0EqQrxetbzAKz9peYyF8=;
        b=rum12OCXNeB91NHK8OZ7C8IAuERyHFgpqirkg8+/GdO9/4Aqq8IK2bdHC5hQnrQPCn
         8g6i/4sSK6ecIyG4wKapN0uXY2UnUBPijUZQtY2IotooG+y8Tr7zN2mCfUfDV/lmWZUc
         DTDDMadcQ1MT2W586OkIW4NRqrL5l8WgwoLgEAlaC17MNWCMg/0w1VlbejargJLBCcvA
         nwtTTBZ+MeZOZ4n/S33TEw98bUEG5PYdJxxo0BeJbdQc7lHrCyDnyJD0k88gHJY96KNv
         ftQUFOsluDrJCq/PcOdhz+AmD/mcOpn03wA125vbu9661mXoRiuJQC9sTPhBQ2fOkPy7
         61pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OpCSticW7YPgZgJxCE8cbDx0EqQrxetbzAKz9peYyF8=;
        b=Iuu8CO6cO3440SLK/Do22Ydr7lOTMx4euyH8koFAiovvSIkaRwQLhAeFd+FkYTMfk8
         3ks93hL4OXcRVgQTQggicGh09yyckIWMM3TXgrNt3IoipJxsIO+8hsmuZCvZBNecZHmd
         2pEan8F7F3bIMxUE9X7NNeiClvg1nyu6zXVvVQUPmgY57j+gfCi+x3PFdVnQAeMnUBgJ
         3L3k1QzuCsOWDu8eVe7/dotN0NnxZ3aXqdGO+e7D+hQm0a0pF8+UhCvuEadyrufY15/X
         0V+jZYTKi4mhYvoE27x6qEM0IBq24CNDq+NWV8yt3gvwOE67GbexdXl54deywu5Umcq9
         dYvw==
X-Gm-Message-State: AOAM530Nm0X3rVefPJ+5OH8o3hVWSFiQCwTLGuNlDxED5joJvMWFrk3y
        qMCbikW+amODKwi07XL/MzCG5A==
X-Google-Smtp-Source: ABdhPJyfYaIzCTa4ubV3n/89Vo1inkTDbjpp3dXp4x3SwQVTQl/7uPVasMjzAWaTRF2315tqrJfY3A==
X-Received: by 2002:a05:600c:b58:: with SMTP id k24mr5373590wmr.155.1621537271597;
        Thu, 20 May 2021 12:01:11 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:11 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 02/16] i2c: muxes: i2c-arb-gpio-challenge: Demote non-conformant kernel-doc headers
Date:   Thu, 20 May 2021 20:00:51 +0100
Message-Id: <20210520190105.3772683-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/muxes/i2c-arb-gpio-challenge.c:43: warning: Function parameter or member 'muxc' not described in 'i2c_arbitrator_select'
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c:43: warning: Function parameter or member 'chan' not described in 'i2c_arbitrator_select'
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c:86: warning: Function parameter or member 'muxc' not described in 'i2c_arbitrator_deselect'
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c:86: warning: Function parameter or member 'chan' not described in 'i2c_arbitrator_deselect'

Cc: Peter Rosin <peda@axentia.se>
Cc: Doug Anderson <dianders@chromium.org>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
index 6dc88902c189f..1c78657631f4f 100644
--- a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
+++ b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
@@ -34,7 +34,7 @@ struct i2c_arbitrator_data {
 };
 
 
-/**
+/*
  * i2c_arbitrator_select - claim the I2C bus
  *
  * Use the GPIO-based signalling protocol; return -EBUSY if we fail.
@@ -77,7 +77,7 @@ static int i2c_arbitrator_select(struct i2c_mux_core *muxc, u32 chan)
 	return -EBUSY;
 }
 
-/**
+/*
  * i2c_arbitrator_deselect - release the I2C bus
  *
  * Release the I2C bus using the GPIO-based signalling protocol.
-- 
2.31.1

