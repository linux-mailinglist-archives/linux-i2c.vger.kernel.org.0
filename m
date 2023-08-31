Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846D378F25F
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 20:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244692AbjHaSSM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 14:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242148AbjHaSSM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 14:18:12 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825E8E5F
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 11:18:09 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 293E480702;
        Thu, 31 Aug 2023 20:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1693505888;
        bh=SSyy5p6GBLWM4WJD7NXGqgc/zib0LYrCgS3OTnqMioU=;
        h=From:To:Cc:Subject:Date:From;
        b=CPXh4FbxZ0i/RKRclYd94/I8Y8icAJKBpLeOGnjhQFMraWtWdoR/OIfVInJi5rix+
         R0jYcY4Z/6QvRRP8dLX3+oMiUjGsJJvtdYlHvW7b2rb9wyO2lvSC+mfYEecbp9YtDU
         kIxs69wwvspBDaxJblvJbloNY0R+DJqMdpJQMlv2geFvEYGU/1jDPWTgCz4ItrzMfh
         UjHMy4D7nxCMWued6MGi1/E5uPuUejBg5F7nZRrEsjDYUJxNpxd3chobvIPcl3WF9x
         cRN61z00ipY7X72MNaxibiz6F2nhfPEIVCgt/2l5wSXV90cXM0ounNI0s3tGqQaCF1
         Xtu5PT+kY3Qnw==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 1/2] i2c: mux: pca954x: Make sure the mux remains configured the same as before resume
Date:   Thu, 31 Aug 2023 20:17:52 +0200
Message-Id: <20230831181753.154787-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The current implementation of pca954x_init() rewrites content of data->last_chan
which is then populated into the mux select register. Skip this part, so that the
mux is populated with content of data->last_chan as it was set before suspend.
This way, the mux state is retained across suspend/resume cycle.

Fixes: e65e228eb096 ("i2c: mux: pca954x: support property idle-state")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2219062104fbc..97cf475dde0f4 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -620,9 +620,9 @@ static int pca954x_resume(struct device *dev)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int ret;
 
-	ret = pca954x_init(client, data);
+	ret = i2c_smbus_write_byte(client, data->last_chan);
 	if (ret < 0)
-		dev_err(&client->dev, "failed to verify mux presence\n");
+		dev_err(&client->dev, "failed to restore mux state\n");
 
 	return ret;
 }
-- 
2.40.1

