Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03332F589F
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 04:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbhANCqe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jan 2021 21:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56604 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726903AbhANCqb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jan 2021 21:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610592304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DPxb5ET8kJn+yePURBnBONcqbnXWa5runmC5LYkViy8=;
        b=F3kHFHw6ov8ebfic2yhPWd33xng2cAIlQhOO7prF0QDcX4rM5WROhGELGwHdhp6HIjX/rK
        ggz51nMZVFpiDJ3vVHOEDFK2+/u9noqzEJItd/fh+8BftEtGEcJahvDeI59WnNK5DcIkeQ
        z8D525AAVHKPFPIXBibUqV9umMKVH78=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-yPCKRuWmPGmrjGVL6P_LlA-1; Wed, 13 Jan 2021 21:45:03 -0500
X-MC-Unique: yPCKRuWmPGmrjGVL6P_LlA-1
Received: by mail-qk1-f197.google.com with SMTP id w204so3268263qka.18
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jan 2021 18:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DPxb5ET8kJn+yePURBnBONcqbnXWa5runmC5LYkViy8=;
        b=BcW5p/efaOEXUa+Zqt9RODcjMYeq1wgtkKI8mXFaSiytiVk/TpIObkrvImBTc5dwB5
         LDURDJNBnoZH/AWFAUR/0YfZbEygDs9QnTTN20iU5VAu5jJfqkZHPDRlvqoosHOM5DDK
         tkC15wON7nIPhcthBvBn1GtMMd/p2mWqDDEtjiZICyAMIcedmqS6gZLS+4ZjThwCbKrR
         8NTAQRFvNaayKmHxPNR4sosx0TX6OMvCnI5Vq3aITDhVCpjCUb2wGBKWHM2lVcUjPYcG
         FBIil31WzPE+mwzwOjv2Co86/6JdZB+ERSZExCXiM4qvh52gLMjRm2Hr9kQIZzqZLwL4
         tpQA==
X-Gm-Message-State: AOAM531ETCKi9nD11E29rlAONwUpMQMzimu0uzcjfNBOQsuopWBv34/5
        zo9FEWu7gG5beZdXqq6yV86pbyvX3d2fNQlZ/k+tFwCCj3/YYdV5JmAwr/57Mhziqyu+2NHhWsk
        MGpFv/3liGgghMKNdmCM/
X-Received: by 2002:ad4:4c50:: with SMTP id cs16mr5318530qvb.33.1610592302795;
        Wed, 13 Jan 2021 18:45:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+1amknm7XoeuDWHpBHl9NiMhA4zFWaDo79pFp8Tc44/hCK+5BEiyXCVvTtM3oh5/uYV8nIg==
X-Received: by 2002:ad4:4c50:: with SMTP id cs16mr5318522qvb.33.1610592302587;
        Wed, 13 Jan 2021 18:45:02 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id z26sm2230591qki.40.2021.01.13.18.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 18:45:02 -0800 (PST)
From:   trix@redhat.com
To:     jdelvare@suse.com, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] i2c: stub: remove definition of DEBUG
Date:   Wed, 13 Jan 2021 18:44:56 -0800
Message-Id: <20210114024456.1752286-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Defining DEBUG should only be done in development.
So remove DEBUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/i2c/i2c-stub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/i2c-stub.c b/drivers/i2c/i2c-stub.c
index 537a598e22db..d642cad219d9 100644
--- a/drivers/i2c/i2c-stub.c
+++ b/drivers/i2c/i2c-stub.c
@@ -7,7 +7,6 @@
 
 */
 
-#define DEBUG 1
 #define pr_fmt(fmt) "i2c-stub: " fmt
 
 #include <linux/errno.h>
-- 
2.27.0

