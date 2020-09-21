Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6E52730E8
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 19:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgIURel (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 13:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIURel (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 13:34:41 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEBAC061755
        for <linux-i2c@vger.kernel.org>; Mon, 21 Sep 2020 10:34:41 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k8so9899837pfk.2
        for <linux-i2c@vger.kernel.org>; Mon, 21 Sep 2020 10:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Go0eeVplBMVuq25+b74pA3hyRnjG9iIUBEy/TC1mfvk=;
        b=PRRMVKvNZTwpVZeAn1Tum1OMESYl3yor7xZyvfF/SfvehrPeXrbqa1d0qq7nKRP8j4
         ibDlWGXNFIOcpcHR3+hPVCTmSqnwM+WvGhoeBVw7X9CcSgnvXefK3a5xEB6Qbc4I4F0N
         7n3zGxyc1AtWykZq42TLvqjhD2Fui9HhivfwmMQIchYhJ7q1guauBvAX3UGfl7KfvBDu
         f6gdUDHnHsJAaklnHIepRxJ6jaZRBJjiCj7VFUNXNWaJGXRh/HZXKRSI5j7sPAYPfLir
         BVJv8dljuCgf+o2A1K3SRXKBk53cRhW0QY6P5WOMan2qgh7q1QsqT+jKUOtGGWhC6uFF
         vpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Go0eeVplBMVuq25+b74pA3hyRnjG9iIUBEy/TC1mfvk=;
        b=q7Xht5O5VGaAhgx18hvbnFsddfs2r3Z2zIHaSZGSE5LCu2ZTbcN80p4fgjPqs62kKD
         AfBJzE1+thtbEi73keBPRYb9ooluabnSfX0AzXobkcjN5gwMD1h6/ZV5LKy9n4xNRjvl
         SZiJd1ivxg7e+uRMk0MaxPBYRxgIEwwGmxaf0KDfgRyof9xlhv+YwmLynmtx93mh2ow3
         SjETkn+baoXp7Zq6tmbLEA+3RsL0xjpp0e+mEkRyHfywrjoaJh2q3o6r6U30fX3bypL1
         KybIHuEDsX6E/0moeI+o+KoUzTPFCqUY1UCnVzBn0OabivDU3QLOLk8OMhWbdLbrUtfF
         n2Wg==
X-Gm-Message-State: AOAM5317MCdiGsVdAig08xHBjUguY+DkK/PMqDGeDe/hLrd+nqEBtvGH
        5lQFsNUZIFllAzE4W7wrdgiQI1lpDUywhA==
X-Google-Smtp-Source: ABdhPJykGWGQs6PrBEpwBsbNIq4VRvcwRT5BH8NKAOiVQP18F0u3076XPHwfDtPsNHX9LuDd4nH9dQ==
X-Received: by 2002:a63:c84b:: with SMTP id l11mr538709pgi.452.1600709680987;
        Mon, 21 Sep 2020 10:34:40 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id a9sm131923pjm.40.2020.09.21.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 10:34:40 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH] i2c: nvidia-gpu: use dev_info for timeout error
Date:   Mon, 21 Sep 2020 10:34:26 -0700
Message-Id: <20200921173426.2636-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Timeout error may be seen due to missing i2c client such as
USB Type-C UCSI controller on some NVIDIA GPU card. Currently
we don't have a correct way to identify these cards.

Tools like Plymouth (splashscreen) doesn't like dev_err so
changing timeout status log to dev_info.

Bug information:
https://bugzilla.kernel.org/show_bug.cgi?id=206653

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index f480105000b8..17a8cefe5c45 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -85,7 +85,7 @@ static int gpu_i2c_check_status(struct gpu_i2c_dev *i2cd)
 				 500, 1000 * USEC_PER_MSEC);
 
 	if (ret) {
-		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
+		dev_info(i2cd->dev, "i2c timeout error %x\n", val);
 		return -ETIMEDOUT;
 	}
 
-- 
2.17.1

