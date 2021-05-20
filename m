Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC3138B685
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236739AbhETTCm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236547AbhETTCk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:40 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790F4C0613CE
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:18 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id v12so18713534wrq.6
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RpVbhWafhDfAhCBqKM1v2zsP0hh2DjzU2Yg5LH3hLkg=;
        b=EZ0KsGWzQne4hs45uN8L/lFUVZJXduGFoITKRcLGwS2wfTgEtl9xBhTOTGQsY56cVa
         x7yqQqbgirbIBCeNZNHN1sewRjW/xbI6A7yXxNe9x6cAPSl+514n6NtoFgqo2iqv69tz
         vj2QnLAGXcc3hZ3NjMsNDHlvh5VgWUnGGXbaq/kofUfNMABokBTg2jNAUVIM8oLwpT5L
         K/vSWSTBx+j/i2y9Fsno0C1l3TK16v2Wm/poO5OnQ1Lx9JmBbt0g4zZ5bTjyN4eTvnWp
         T/xKqNYVj6U3bPHI8e28PkYav8wZ4GFCBpfptsVYCuNH9NxwAyHBaSzWNpzay9IcL5na
         ymHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RpVbhWafhDfAhCBqKM1v2zsP0hh2DjzU2Yg5LH3hLkg=;
        b=Ij5qy9oATD26SeMHhdjQQwbFmpH910Ikksp13AOg2urQtT01Fb1WQn/ipSMAbqDs+I
         FacjF65k2aZlLh4b5u3/9Nlu14xdrgGUlQZGo8KPZYGi6+NZt/gK99DsDtASN7myNv75
         K+sZJw7cmcJrbVOKiZA607K8yycUSqsyqWbOuUzBG7a/qZpxpZrx9xjsJJilxXLVkCXw
         z6ANSbqkt0fe1HrlCPK0mH6Z3FqEkZmK+qDal3/Y9rB9pYJhMVRLiYJkGX+fHyT8zG7k
         YgBL3bg0ZhIRmnUl4JTyykn+fu0O+VwAwX3UTNSyRy6WSvg9VxkvcF6/CW/EGxcNXd/G
         S+xw==
X-Gm-Message-State: AOAM533strhyFuaUUsOYZozZijpvqG+8P85oznXJpuKqZVLe6Lb97bS5
        Jybmc/qz4jPFyJEvFRpiU1XknuVirKIpZI2t
X-Google-Smtp-Source: ABdhPJw9rwSRjBloZaZFVLBint6jIsNR9r3E8DceWoZhuyRULxJuKt0BUoxwITmuyK00V8fxdFNC9g==
X-Received: by 2002:adf:ebc4:: with SMTP id v4mr5616703wrn.217.1621537277066;
        Thu, 20 May 2021 12:01:17 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:16 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 07/16] i2c: busses: i2c-designware-master: Fix misnaming of 'i2c_dw_init_master()'
Date:   Thu, 20 May 2021 20:00:56 +0100
Message-Id: <20210520190105.3772683-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-designware-master.c:176: warning: expecting prototype for i2c_dw_init(). Prototype was for i2c_dw_init_master() instead

Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 13be1d678c399..9b08bb5df38d2 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -165,7 +165,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 }
 
 /**
- * i2c_dw_init() - Initialize the designware I2C master hardware
+ * i2c_dw_init_master() - Initialize the designware I2C master hardware
  * @dev: device private data
  *
  * This functions configures and enables the I2C master.
-- 
2.31.1

