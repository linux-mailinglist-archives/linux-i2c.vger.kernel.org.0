Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A56F38B69A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238008AbhETTDT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237472AbhETTC7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:59 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE66C06134F
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:28 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso6028639wmh.4
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HIrBOeC01necSSZBh3WJb8n11gnvVfu7DpmNSO/Nbdk=;
        b=S3VMEbyBQOtP5mk7L4Z0kvrmwSyAW1Az4ghiLWeUSLmnTheeBe4hplHB1pAfjXxk2J
         1pdySSLkVm+SbFZQqIcOqNLzRgLxn5Dw8p9ITAHRa62sw6sXKC6e3D6blDS/NwyJkHmi
         d3YGCv/Oe/75D6LdEeM5qVHnwKZ4YneLFby22O/hAjtfCWD9jHkAsQsSLXOOUZv43R7p
         K266NV2hzw1ZXt6YkStFZL72OD5a52ptCEgGG/wVx0q9yxogfUa45qb5iXZEET2V8Sph
         AKOpN+Ip03iiVjRhufVncdAvwW+Bax1bJL3KOBBSpvpNgYooC3uFDExasyMCr1gkLq2b
         hE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HIrBOeC01necSSZBh3WJb8n11gnvVfu7DpmNSO/Nbdk=;
        b=EQedPtZiOs7qBSYjJDLnuMvvd7sbVktpskwH5XazOqidHp2+MkcOst8eB4wcCWID5x
         TXycd2W1K0QNG+DknyWRu2r3A/IcVihdE0AXZEX3K/j6ZjynrLvEdc4NIIfWuTxK+amX
         0BaQ1Kpz3fjwaf46/stwQNSu1ZEH5gb2xjNULC7ojq4TIBitKlEt9cpC1xfne6cXjtLA
         BwbOn9IBjUDcu8GOuZOp5BL4LVzQLdtoZTnz7aO2auhdvJa0TsjhAT5ZwJ9w5c5EBcMr
         djNxhPfF3fBVIbBFYcuAJReleMnpNt3/GczeVfA3tPyM4aww5t+pDliOzrQMpHZa1jdi
         hQAQ==
X-Gm-Message-State: AOAM530fD1ejv7B3BObG08G+aU+OY9R336TLJNY+Vd1oBg1+xr816dhw
        t8E+j9Yg/tPjR068J+qW7Uqw+g==
X-Google-Smtp-Source: ABdhPJy8x+5IqIuAaGa3Pu0VZAqeQTQc8GGW/aqUrprIq9Qhf0ZRha2icrPTKw33qAJIeBV/l2AHhA==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id l18mr4974579wmc.142.1621537287095;
        Thu, 20 May 2021 12:01:27 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:26 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH 16/16] i2c: busses: i2c-st: trivial: Fix spelling issue 'enmpty => empty'
Date:   Thu, 20 May 2021 20:01:05 +0100
Message-Id: <20210520190105.3772683-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 30089b38044b5..88482316d22a0 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -524,7 +524,7 @@ static void st_i2c_handle_write(struct st_i2c_dev *i2c_dev)
 }
 
 /**
- * st_i2c_handle_read() - Handle FIFO enmpty interrupt in case of read
+ * st_i2c_handle_read() - Handle FIFO empty interrupt in case of read
  * @i2c_dev: Controller's private data
  */
 static void st_i2c_handle_read(struct st_i2c_dev *i2c_dev)
-- 
2.31.1

