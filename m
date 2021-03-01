Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3C83278A8
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Mar 2021 08:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhCAHzB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Mar 2021 02:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhCAHyy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 02:54:54 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817BCC06174A
        for <linux-i2c@vger.kernel.org>; Sun, 28 Feb 2021 23:54:14 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id r5so10893755pfh.13
        for <linux-i2c@vger.kernel.org>; Sun, 28 Feb 2021 23:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=y7NoMzM0sGyIs2FMcekFuA4e+Ei1kTpOGjkzqkYpvUw=;
        b=J1AuIyTPO2yBM9PTImvBN53BFKGSi03fWjJe+pu6m0aI3TY83UGhCvJ2T4jNV2LCuL
         K5O9/KWVFyuVM6HhELfnzTZ1TJcU8HbZNmf2hJ3qRV3u31MYDE3UuqbocXOEt3GhujuP
         ERivRFVVTC+NqbiU3007p3s3sj1Oo3CZsNyFNK8sv59BUFl6dmBu95SbIXiQwadzN7g/
         VK5SyZ3kO2VI66uuFId5e5OzUwaNBvT53twZzxxOQRBe/i+aAarCROLHR26g+8kdWOaD
         n2KJpQHPOemfOVgxsKhrJM/lHj2cNWyyq92bcTBE7XjN+RUSrCbBxkR4GiuSmwydFGYV
         0vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y7NoMzM0sGyIs2FMcekFuA4e+Ei1kTpOGjkzqkYpvUw=;
        b=tTUwV/dft0XbCu+LvcfjCYHmS2QjykDoQN3Z/20no+IKNQ2/XfTEARr2nkPcAWjB4/
         V3cjkVbl1+LBSNYTmpuEQQYCkplErHM3yzpkA1tK5QGuCVGzx7rzh6zUin+HSTjb/2ja
         7WVJioauNQiOwPXALy9OXkFzuaC0+pTmeCelIausVh/6MZkvnjwMrO+cza+l+FWWVxKN
         0i5stGxEKl9ggVHV0sNFy7GT3c+SwZ+x6Vdod9hWlQMcYQ9Y0b/Vu/f/bj7eQXCc9RfE
         uL3cRkYnZabBrHv0O1Bwk8Z4Es0Wm2dTbMzMR6FM0oElmBJnxLvDdK4O0u6EJAlLAjkD
         uS0Q==
X-Gm-Message-State: AOAM533eAfe+FrCU9m7f1tVb1nXHWCJlSde9RIhT7/FynmhGjIMNDehD
        HGICAvJIZw/atw//uD1ndER42A==
X-Google-Smtp-Source: ABdhPJwL8x2C5vKMR63IT5KmPWjkD40UFc8YTWPb8HZE1H2ejXFMf3lCHDDF2PgylJbVNzSLHs+bcQ==
X-Received: by 2002:a63:d506:: with SMTP id c6mr12764945pgg.77.1614585254125;
        Sun, 28 Feb 2021 23:54:14 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id d16sm10689414pfq.203.2021.02.28.23.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 23:54:13 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] i2c: qcom-geni: add ACPI device id for sc8180x
Date:   Mon,  1 Mar 2021 15:54:06 +0800
Message-Id: <20210301075406.20423-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It adds ACPI device id for sc8180x platform, so that the devices can be
probed for ACPI boot.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 214b4c913a13..a71568c4903f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -512,6 +512,7 @@ static const struct i2c_algorithm geni_i2c_algo = {
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id geni_i2c_acpi_match[] = {
 	{ "QCOM0220"},
+	{ "QCOM0411" },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
-- 
2.17.1

