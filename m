Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1BE776AEA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 23:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjHIVZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 17:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjHIVZs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 17:25:48 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8EE1724
        for <linux-i2c@vger.kernel.org>; Wed,  9 Aug 2023 14:25:45 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5865afcb825so4514247b3.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Aug 2023 14:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691616345; x=1692221145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDx0Hy/g05LsgjXJunLNKRIVZ1PiGzjJ3aP3yYS1SPs=;
        b=q95v/fDBA425ZRj8HB8knec/n4Wh3vXc8UbBeQ9+7ttjuOkZDgYRPpnfEmLqXf/K0c
         9vUIwMzhWqcCXcQ3ORw3unREK+rNDPA94GFJB3geeKvjgleAH2TJzWdB4aiD1AgfKkI9
         Z/bn4LDdalSqacEfSDlGVSB+SrKHJq+8AHxcNmoUPLE2evR/gffiSsW98OvDz7w+3DyV
         T8HJ4BVxsFz1/VC2CZS3v9TY2Ew85MTPbGOCkMlUSQk0LvyVWCWPQ6Q0CKtwX4rYn4Mz
         Bzrx5iddUJRYh3HidSo+HrZFmOUe4x5eekX/x5QVelGZKMWymoP1yjh830Hf898C+unA
         TkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616345; x=1692221145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDx0Hy/g05LsgjXJunLNKRIVZ1PiGzjJ3aP3yYS1SPs=;
        b=T+PbZ2w7b9cOIM/b9mpPjPPbCo+gfDPu+skLjs0zUTTdF7lhuq8biecPVjQqtwQavq
         q5t3FkrfRQnLavMMSr1+R+e7W0Jrt7Bbz9hnVNkcvalIuRWgh4FmLiDVC/OpjtoqMk+b
         ZTIe0fi4BSDE8pT6rypvP9Lc3ZXo+y6ffZ93RrI3Ouj66JtEygqiBHMV+JoB9EV7sbov
         bKYdo9aIaI7jRJlaiy6RZGtfEMHRwvgogdxL+BVqfK6/gs6cZwduc3rZicBfAs3VI24p
         p8ivANLTbya2f/IVwFNNY43R/J3CUgVpsmU94JLO0aD6rz5Ta6pBMsJe1ZAlze4YFzVV
         B5NA==
X-Gm-Message-State: AOJu0Yx2DCP2wMIkTA1J/8miVcQ+t4vv1Ky20wLGpsH3JctcwK5dKHQi
        RcNGNLsykRqWuc80u0doq+NBTEhBFHRmDp3UxQ==
X-Google-Smtp-Source: AGHT+IEsmlDYpjMBJObJR5jz4UIcD43JE1pStIMxSDRZxpyCeyJHub91Vaates1u0eDPesF/KIhjvHlbNAFHmDDJvQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:b718:0:b0:576:f61f:adbc with SMTP
 id v24-20020a81b718000000b00576f61fadbcmr8718ywh.1.1691616345223; Wed, 09 Aug
 2023 14:25:45 -0700 (PDT)
Date:   Wed, 09 Aug 2023 21:25:35 +0000
In-Reply-To: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
Mime-Version: 1.0
References: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691616343; l=1671;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=1jpubBEYs5G/kONM8KXG1tjVjaf45XD96u1TgLGh88c=; b=HD13U7Lf7gLBUJgdxnwIDWUS5iUmJBBrEtQkf3kdA3nIJwjjfZ/thVFMV1IjFQZf6I2y84s5B
 9rseL9CjIuVBaaF60aQ2gvWP/yFSYM2Erz2oCmo8XTvy/PYDz3u5bej
X-Mailer: b4 0.12.3
Message-ID: <20230809-cbl-1903-v1-1-df9d66a3ba3e@google.com>
Subject: [PATCH 1/2] i2c: i2c-bcm-iproc: fix -Wvoid-pointer-to-enum-cast warning
From:   Justin Stitt <justinstitt@google.com>
To:     Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When building with W=1 we see the following warning:

|  drivers/i2c/busses/i2c-bcm-iproc.c:1039:3: error: cast to smaller \
|       integer type 'enum bcm_iproc_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
|   1039 |                 (enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
|        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is due to the fact that the `bcm_iproc_i2c_type` enum members are
int-width and a cast from pointer-width down to int will cause
truncation and possible data loss. Although in this case `bcm_iproc_i2c_type`
has only a few enumerated fields and thus there is likely no data loss
occurring. Nonetheless, this patch is necessary to the goal of promoting
this warning out of W=1.

Link: https://github.com/ClangBuiltLinux/linux/issues/1903
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 2d8342fdc25d..3464f3a376a5 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1036,7 +1036,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, iproc_i2c);
 	iproc_i2c->device = &pdev->dev;
 	iproc_i2c->type =
-		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
+		(unsigned long) of_device_get_match_data(&pdev->dev);
 	init_completion(&iproc_i2c->done);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);

-- 
2.41.0.640.ga95def55d0-goog

