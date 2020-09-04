Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C456125E14F
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 20:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgIDSG7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 14:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33048 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726184AbgIDSG6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Sep 2020 14:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599242817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=ZgNkYrXayCXVqunlsQHYlfke0k0uTa2/dq5wz4jdf0U=;
        b=JWXp42iJ5jirKaEb8/Zc3Cxaen3f/Q6n/BFMoQ+9qBU1J16QSWXlP3ROqMmGtqllfLxfzA
        GeDlath/UrdZKDBHgXZzg/HYsOyBKDyOstLEGp0HVp9e3XYsbR2X+SoFpvUzTnTHFNVopW
        1hplOU9veUkJ8aMpw7LJx2jdEnoVoz4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-rppPiNodOYOZSN93b9Mc9A-1; Fri, 04 Sep 2020 14:06:53 -0400
X-MC-Unique: rppPiNodOYOZSN93b9Mc9A-1
Received: by mail-qt1-f197.google.com with SMTP id z27so4886437qtu.3
        for <linux-i2c@vger.kernel.org>; Fri, 04 Sep 2020 11:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZgNkYrXayCXVqunlsQHYlfke0k0uTa2/dq5wz4jdf0U=;
        b=PracwDWbb+eMVqaCAn48jiNLs2HRIajwB6s0vHEtE6M2gG9KuVkCn+LSedwsLoKcIP
         yRQVsLvmFm6IFOU18Vc6FBPN1muWPMuRy+V2zUJbebOscco8FPABwqxVDQUGQwcdpabn
         S3QV7s3DfcrLwNPljsfXwmF7GBdeATH3W6EARawY8PGQnn15idYbze1u6FDJFq6/5dzz
         F8xFJ1YO1H6wDI2285wU4bhWcBRmoPxTNQYfXGWN1hdIGWyOAyRnnxA95ymP1fNhekch
         hZyhh8vt7GBuxV+adyuxRVPGj4aVnwY+Fut/MRqiO8hyOxEfxS1DrbdGDjKsJD3v3p4d
         xzSA==
X-Gm-Message-State: AOAM533npJyHgJBI2jITENUtjbfhiLU7shjriXwn12Ib0art++u5qFgF
        xjRRS5a8egWr5MO8/5OJym2Yh4PCUD9TgZItqpPV4bIZuyaz5sewlWcTf4oFwlcqFIAuArb3v+s
        3LmJZ9+GFzfj4lwhR2h1n
X-Received: by 2002:ac8:6141:: with SMTP id d1mr9801730qtm.170.1599242813496;
        Fri, 04 Sep 2020 11:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWhBlbyE5VCadyyCOxenZ/m0J+9H6xdaEWBkgVjqJvelX1jGZb3lv+vRmA3FJV8b2LL6X7cA==
X-Received: by 2002:ac8:6141:: with SMTP id d1mr9801702qtm.170.1599242813220;
        Fri, 04 Sep 2020 11:06:53 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id t69sm4879928qka.73.2020.09.04.11.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 11:06:52 -0700 (PDT)
From:   trix@redhat.com
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, natechancellor@gmail.com,
        ndesaulniers@google.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, Tom Rix <trix@redhat.com>
Subject: [PATCH] i2c: amd_mp2: handle num is 0 input for i2c_amd_xfer
Date:   Fri,  4 Sep 2020 11:06:47 -0700
Message-Id: <20200904180647.21080-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analyzer reports this problem

i2c-amd-mp2-plat.c:174:9: warning: Branch condition evaluates
  to a garbage value
        return err ? err : num;
               ^~~

err is not initialized, it depends on the being set in the
transfer loop which will not happen if num is 0.  Surveying
other master_xfer() implementations show all handle a 0 num.

Because returning 0 is expected, initialize err to 0.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/i2c/busses/i2c-amd-mp2-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 17df9e8845b6..506433bc0ff2 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -155,7 +155,7 @@ static int i2c_amd_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	struct amd_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int i;
 	struct i2c_msg *pmsg;
-	int err;
+	int err = 0;
 
 	/* the adapter might have been deleted while waiting for the bus lock */
 	if (unlikely(!i2c_dev->common.mp2_dev))
-- 
2.18.1

