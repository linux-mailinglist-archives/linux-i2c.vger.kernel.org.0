Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6403B178F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 12:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhFWKCL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 06:02:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:50954 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230521AbhFWKCG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 06:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=tH4ntCeo8+p6tx
        E+q+FoUf1qitWqVlG7GVG1544u2Vw=; b=j8BaHz+ekAgFGCpOYh9rrAOuFTKvBy
        alyBMPArAamXxNb5Xch7PiNqBSbdhwvp+oPnxz2XDNSiQMfRWMkPvSuSQcrLKMsi
        RnI64T2Yz74T6JZgE3DyoJoGfRl+O7SKhUTVFKHtOM6KbeVIspn/IIRxIj/ht214
        P3bc+S/GGuiA0=
Received: (qmail 2552043 invoked from network); 23 Jun 2021 11:59:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:59:45 +0200
X-UD-Smtp-Session: l3s3148p1@AE9U92vFGKogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] i2c: qup: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:59:38 +0200
Message-Id: <20210623095942.3325-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Here, we want dmaengine_terminate_sync()
because there is no other synchronization code in the driver to handle
an async case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-qup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 61dc20fd1191..fcd35e8de83c 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -778,7 +778,7 @@ static int qup_i2c_bam_schedule_desc(struct qup_i2c_dev *qup)
 			ret = -EINVAL;
 
 			/* abort TX descriptors */
-			dmaengine_terminate_all(qup->btx.dma);
+			dmaengine_terminate_sync(qup->btx.dma);
 			goto desc_err;
 		}
 
-- 
2.30.2

