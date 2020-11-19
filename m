Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32072B9EE4
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Nov 2020 00:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgKSX4z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Nov 2020 18:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgKSX4d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Nov 2020 18:56:33 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0730C0613CF;
        Thu, 19 Nov 2020 15:56:32 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id i19so10384211ejx.9;
        Thu, 19 Nov 2020 15:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1h6P1QikN3J5Ulnh/K5E2kWxaa4W/09pB7gk/9QfbjI=;
        b=X/kUtJLtbxrbyjnumQHqDxC6I9J3H17CWF5MpH0pyzRM+eHaOvi/vdzg5Io61l0zGC
         6735WIc01Vx/Ydcor/idJQLrWWHRZnMqGcoNk2HnvxpAREAoueAp84h+0b/QUJZouaLA
         9O2BT0upREOHH3jRg3PSFHD1mr2EH0xkRtAdRLAljRBng/OVe6GRdilt2ym39ZZhj0sW
         dMwhMwI9ZdV/f9WjVCmovYIWhfpYDx1FoEgBJt8N/NQSkSwZ3VPhNkI9HlzKgeRHMvAD
         O70rn2UqotWoFTMxnY8iMdMKbKWYVu7i6hD99JdPaXpQlM9A4L+suh9Btjw2becp6q0K
         tesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1h6P1QikN3J5Ulnh/K5E2kWxaa4W/09pB7gk/9QfbjI=;
        b=B8tv85mwcbqsMbgMtbCRA6uKBOMdd7EmfAk1VQLIv+Sj9e9vnkOw0OzVlCXJ89NPVn
         3GCZAKnv7C7qN4y8sNsJkDUwyyarYlBymg6i3DdNbfZ2SUy46it1/KqT0IKatXjTDY3n
         qJGknHMR0BlSx1zPtdC+eibQeqUVjQxCDvpCOxrsWWl1zSmMhQ5HFceu872x8wcuaKkF
         lUsI2T6gvu2xfwPQkYQTICbn7/PErP028pl823M8GnPRK3PlLuqFLp2ZAdkC51odcTfp
         Ig9rnw6Ysl4r2BuDyPVxVQrXhKEfmgtX9CmeaLxurjcE4IEdaRAvRL1ayi55S3zIuMY9
         eOhg==
X-Gm-Message-State: AOAM533CdX832t50cJaRABuJmcrvoh3vRWDUnf9f6GDed5JfUQLVasiE
        i772ujn+96Q9nfE26vjiA7A=
X-Google-Smtp-Source: ABdhPJyKZOxL2NS/91sGBoLVZf++K080GJopsYfpL9Go4vv1m4eZXEMlnzZEGPh1bWpWVMzqNtEiYw==
X-Received: by 2002:a17:906:f10e:: with SMTP id gv14mr30113393ejb.346.1605830191554;
        Thu, 19 Nov 2020 15:56:31 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i3sm452987ejh.80.2020.11.19.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:56:30 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 12/18] i2c: owl: Add compatible for the Actions Semi S500 I2C controller
Date:   Fri, 20 Nov 2020 01:56:06 +0200
Message-Id: <7622fae80d12d7f423fc25190159af494c359200.1605823502.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add S500 variant to the list of devices supported by the Actions Semi
Owl I2C driver.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
 drivers/i2c/busses/i2c-owl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 5cf5a119a6ad..98882fe4e965 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -508,6 +508,7 @@ static int owl_i2c_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id owl_i2c_of_match[] = {
+	{ .compatible = "actions,s500-i2c" },
 	{ .compatible = "actions,s700-i2c" },
 	{ .compatible = "actions,s900-i2c" },
 	{ /* sentinel */ }
-- 
2.29.2

