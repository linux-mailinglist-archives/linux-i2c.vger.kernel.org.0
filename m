Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457C127597A
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 16:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgIWOJN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 10:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgIWOJL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 10:09:11 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0C6C0613CE
        for <linux-i2c@vger.kernel.org>; Wed, 23 Sep 2020 07:09:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a17so175106wrn.6
        for <linux-i2c@vger.kernel.org>; Wed, 23 Sep 2020 07:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:reply-to;
        bh=kX0s0lKlAt9I/75DsRW7IUB5bjbInHnolZHA2f2gDHI=;
        b=HZVWbUV2P0j6RwqjQA552nOxje3SrTurgtTLuJKJhxzx5mNDRS+Z1qReK87LFMVc31
         2gOSM70duzrMZciNrrAytMgylL2LKopW7vfTBoxhM9zgSA1m5kOl4iuQOVSbwOGsWrxT
         LS4w0CLimDyXY0UwZe6BPBBVHs2dQjqSHssRd6LgE4oatomry/jA/LBMaXrhtfU8oqnG
         ZEaNe/UR5EuMbp3EuygJeRrEKYo6WApoW0ftmWPa5bB13+vuQfmuyJ1ohPNmRwhe6Bkn
         CFCTbgar26VgN+UAlQpxUaPqEB7JKmEalUkchwQ6R79JGA3BRJC419MFP6I0WESYvFsG
         4hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kX0s0lKlAt9I/75DsRW7IUB5bjbInHnolZHA2f2gDHI=;
        b=msyRnw1VbgCp/qLfOAGXcR3pXNi2fX2Y95mo6mZn3NUZGnNDoZmmIgj6/WBeMLaFZ7
         UYRJ5OkLSwfOunU85fZ/9r7WpMuktxta+H+MeI8ao3ZJ+jpQBFZvwdxi5IBk78pAtFUo
         Yvp6nWp5ZrJrsuH5lj7ioEltPUVqF53XpzQZ1Z0QTH6b8oV7wMtPDwYEWXGtpgImS23N
         tvXdBABPmbKEYWkhOuQw4thADvYgNZSzL+Mz/sJyiTEIX40ZXvgeLCGuGAvS9YJSJBdb
         xKjpVp9070i2cvwM99lf8jmAB8n2rrrK4uDHRVHtEHgVMdOO8O+2T+mT9tr7v0p6DDLN
         f1BA==
X-Gm-Message-State: AOAM5323Ojc8E3lHlHmFxnZS5hL7XJx9RBTj0DyC1XOMgHbouZY4Pcj+
        U3ZS+UACuIJwqRYeiUWtloWv3OOWppcg5Q==
X-Google-Smtp-Source: ABdhPJw+eMAES9Q6S42z8UePGJWtXHEdBuXf6CuSnXwa1gbzcKjD4IWT+yRgsb7sEbkYKLbbQY5LrA==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr1066794wrq.151.1600870150184;
        Wed, 23 Sep 2020 07:09:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:287:860:29d1:d0a8:b1c3:1cbf])
        by smtp.gmail.com with ESMTPSA id m13sm30088369wrr.74.2020.09.23.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 07:09:09 -0700 (PDT)
From:   nico.vince@gmail.com
X-Google-Original-From: nicolas.vincent@vossloh.com
To:     jochen@scram.de
Cc:     linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Nicolas VINCENT <nicolas.vincent@vossloh.com>
Subject: [PATCH v2] i2c: cpm: Fix i2c_ram structure
Date:   Wed, 23 Sep 2020 16:08:40 +0200
Message-Id: <20200923140840.8700-1-nicolas.vincent@vossloh.com>
X-Mailer: git-send-email 2.17.1
Reply-To: nicolas.vincent@vossloh.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nicolas VINCENT <nicolas.vincent@vossloh.com>

the i2c_ram structure is missing the sdmatmp field mentionned in
datasheet for MPC8272 at paragraph 36.5. With this field missing, the
hardware would write past the allocated memory done through
cpm_muram_alloc for the i2c_ram structure and land in memory allocated
for the buffers descriptors corrupting the cbd_bufaddr field. Since this
field is only set during setup(), the first i2c transaction would work
and the following would send data read from an arbitrary memory
location.

Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>
---
 drivers/i2c/busses/i2c-cpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 1213e1932ccb..24d584a1c9a7 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -65,6 +65,9 @@ struct i2c_ram {
 	char    res1[4];	/* Reserved */
 	ushort  rpbase;		/* Relocation pointer */
 	char    res2[2];	/* Reserved */
+	/* The following elements are only for CPM2 */
+	char    res3[4];	/* Reserved */
+	uint    sdmatmp;	/* Internal */
 };
 
 #define I2COM_START	0x80
-- 
2.17.1

