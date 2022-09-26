Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9605EB379
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 23:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiIZVrk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 17:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiIZVri (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 17:47:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A21AE9DE;
        Mon, 26 Sep 2022 14:47:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0824E6147F;
        Mon, 26 Sep 2022 21:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43234C433D7;
        Mon, 26 Sep 2022 21:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664228856;
        bh=ctLhJppD55XlU1Ayb1sGbBYR3KPeJbjfX6+6mVLpJxQ=;
        h=Date:From:To:Cc:Subject:From;
        b=aF/iIgO7J82RcvVzbgUbO0FpQSzhrLOg/7udOApBEKaNNWwwzx9bswLeVpFfNxMYv
         +AQ7B/md82Yl27QCLLB5WtkToCPhIjbLBkRoohXNfRjIi+7ZspXouIU6rXD1XblOOk
         wTG8E3HKa3wNDeP1sXBMEGvD6CV4Ik5wfAzGZqNOD+cltJaJwJ1KoosievRFzB94S/
         /d9SOpFaIb9C9TAjSz8iYrppLnXUwHGlEdqWniZYZiPQMhvrtDfImLwFEd3nMeijFS
         1UluPBtf9ExYtcj610paZk/68Cl4sOZ+nzGIaagGJtkEktug3QwV45oBPeNOoVNyeV
         TI/9/F8YS0hHw==
Date:   Mon, 26 Sep 2022 16:47:25 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH][next] i2c: acpi: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <YzId7dQGWxMyXHEU@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Zero-length arrays are deprecated and we are moving towards adopting
C99 flexible-array members, instead. So, replace zero-length arrays
declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
helper macro.

This helper allows for flexible-array members in unions.

Link: https://github.com/KSPP/linux/issues/193
Link: https://github.com/KSPP/linux/issues/218
Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/i2c/i2c-core-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 08b561f0709d..da6568a20177 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -26,7 +26,7 @@ struct gsb_buffer {
 	union {
 		u16	wdata;
 		u8	bdata;
-		u8	data[0];
+		DECLARE_FLEX_ARRAY(u8, data);
 	};
 } __packed;
 
-- 
2.34.1

