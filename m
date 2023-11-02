Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9EB47DFAE2
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 20:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjKBT1b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Nov 2023 15:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjKBT1a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Nov 2023 15:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A51136
        for <linux-i2c@vger.kernel.org>; Thu,  2 Nov 2023 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698953207;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8OfooQG8j7Zpd8EVU9D70gAoqy9uUumAdTwJG3fzo9g=;
        b=d1HSMwGLbhQuFXQ9WCERiBEsWBHoUXY4OwWHXiKXuS+YIFYv+1pTL2XGpmonONw36mA9t1
        ulkXywLgHs+teYm1UiazJ1QKKOKOdGh58i0J/LwdfNBMjUqVQ7TAc7KODQ/B+6Pkd6lzTl
        3CJQXNF5kFnq8kUaYRyPnCG/adnOSVQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-Z_oAnd9FMa6RP-mYAivmvw-1; Thu, 02 Nov 2023 15:26:44 -0400
X-MC-Unique: Z_oAnd9FMa6RP-mYAivmvw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4083a0fb583so1482955e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 02 Nov 2023 12:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698953203; x=1699558003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OfooQG8j7Zpd8EVU9D70gAoqy9uUumAdTwJG3fzo9g=;
        b=uBv+XFG3kb+icNESdEJkovQvxiqu7KPkeor90q785QwkRHLMKWiE/wMjXJ8hoMU8Q3
         S9i2u1eUv1lyZJLFJCpnSGWpflpraXDndx6XaTs8WdiwEHboHIAq6/nBC1PYIxB/knPz
         olNtApYa195yhKd21HiCELue+DMPzJdZQ7BnAaa6JSaa4HYDDrY84KnBa6Ze6ET9WTHC
         +39OWb6lha6cEV/2Aj6vwd+ZsJe+/bhqfmA79toqM7uaelPlkJvgf65dVY3SLjqWihhk
         fVUb15lmcd6VlLd8J4/OFx70TjIKQH3RFDD9pjvZvpjwWMqs+eQwJwk8a/N+i8DRqU/S
         2AQw==
X-Gm-Message-State: AOJu0YxJo6zhlTA1vGoTMUa0Igw8G+eSC81xpNoOZQFtWx0s63uwZk9a
        zwjLfbPqYEcH4RmCZgJSbINME1VXUhuhp4nSYwQmrcX7mkyzyaF8mRcJ3x2hrtFCiptcjeWEIoZ
        VVIl6qr4+JD3FnNpqGCHD
X-Received: by 2002:a05:600c:3d95:b0:408:3ea2:1220 with SMTP id bi21-20020a05600c3d9500b004083ea21220mr15802750wmb.1.1698953203483;
        Thu, 02 Nov 2023 12:26:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiBHZ99klFdqyLT232wErze/LSQj4LAtcCJLgnDebPvzxkC3Fh+K3OUHZv+BCrOFKtDSYBJw==
X-Received: by 2002:a05:600c:3d95:b0:408:3ea2:1220 with SMTP id bi21-20020a05600c3d9500b004083ea21220mr15802739wmb.1.1698953203134;
        Thu, 02 Nov 2023 12:26:43 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb ([2001:9e8:32c5:d600:227b:d2ff:fe26:2a7a])
        by smtp.gmail.com with ESMTPSA id r22-20020a05600c35d600b003fee567235bsm117354wmq.1.2023.11.02.12.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:26:42 -0700 (PDT)
From:   Philipp Stanner <pstanner@redhat.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Philipp Stanner <pstanner@redhat.com>,
        Dave Airlie <airlied@redhat.com>
Subject: [PATCH] drivers/i2c: copy userspace array safely
Date:   Thu,  2 Nov 2023 20:26:13 +0100
Message-ID: <20231102192612.54066-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-dev.c utilizes memdup_user() to copy a userspace array. This is done
without an overflow check.

Use the new wrapper memdup_array_user() to copy the array more safely.

Suggested-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/i2c/i2c-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index a01b59e3599b..7d337380a05d 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -450,8 +450,8 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
 			return -EINVAL;
 
-		rdwr_pa = memdup_user(rdwr_arg.msgs,
-				      rdwr_arg.nmsgs * sizeof(struct i2c_msg));
+		rdwr_pa = memdup_array_user(rdwr_arg.msgs,
+					    rdwr_arg.nmsgs, sizeof(struct i2c_msg));
 		if (IS_ERR(rdwr_pa))
 			return PTR_ERR(rdwr_pa);
 
-- 
2.41.0

