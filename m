Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA41379143E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 11:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238049AbjIDJBs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 05:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237586AbjIDJBr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 05:01:47 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC325131
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 02:01:43 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31f4a286ae1so332263f8f.3
        for <linux-i2c@vger.kernel.org>; Mon, 04 Sep 2023 02:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1693818102; x=1694422902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VR4ei5RXxp6hE8HhmGBliPMh9J2qP9uued2t8ag0Rik=;
        b=SDzuzxiOfYd3qp0mtOLvPy/HuhELeUbOhrfPhzZQG12iu5rUPTe1h9nZ8RKv9L12cV
         TmFKX0M6F3aaO1pcy1jmIFfswOI/AvHDHfwi7ARxxcmBr+bJgo/n1Ah6LA9UhiI4dRoj
         ZPRmDNQ0JhnlR8gIloROm1kzYMgp2Zb+DcpO2sWe0mVdkTN9rg0/HNusvAkaJ8tlUTTf
         mKMV3gsmGcbkxMWzbivfFDdAetAV0Vs70xMObNW3VV+0TAwlIGzyzPFhaL6Kfsq6v/qT
         NzHYWUdZYqPFIhIQ3unhkVjrYa7VhgU3UHTh2JlCra6jFdeTU1Xtp81+L8nYf4AA7NU6
         FwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693818102; x=1694422902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VR4ei5RXxp6hE8HhmGBliPMh9J2qP9uued2t8ag0Rik=;
        b=fm3SgVw8mYtAk16636DGF6OnUeLvloq/9zjdgoHcL4lGtDpLjNoIjqLQoZIJwQgHkE
         YhlXu4usSAhBfbmcsv94jxb3sriy24H+T4S6KPoQrtMcJipbebUtOPaWo0O25l4t1eY9
         uXUGE1Qpeb5qAnf2xnqAVY+XVqU86tFFrWDuxW1eAosXhkwJOF55CG3SJeHPwPKwHnZd
         XCtc08hTOdm497zy+I/EpPkZJHiUfxoBiJvbXSSx5C1TJXQF5sV5Ajj1AXf6gAdtRtza
         ahuZtEnjBLwKyWKBx+NKi4mPiKqrbPKtknjz6CiolbVJKg4WAbqajVvPOLdbS22IeO5J
         aKjQ==
X-Gm-Message-State: AOJu0YwMx3KdHvpZ+4XexoUr5IuRwK6cVFu5qE0KHWTkD0grKmfpjqKB
        sDqqu7t8TcdahkmF7e/iHlXOBp81eH2vlMumbaOUwS/XkIppFFxho7ce0HIADVrWYaXxX0rxdA0
        h357EbU2KiM49vA==
X-Google-Smtp-Source: AGHT+IH9t4MpH2Hcj/Pj11rdFZxn0IvPgWBb2fPsrtoePxPEQnUxUnUqYgTLhR2TuCqlUGE/eRZ1hw==
X-Received: by 2002:adf:ded0:0:b0:317:6a7c:6e07 with SMTP id i16-20020adfded0000000b003176a7c6e07mr6809861wrn.32.1693818102285;
        Mon, 04 Sep 2023 02:01:42 -0700 (PDT)
Received: from localhost (dslb-088-076-253-094.088.076.pools.vodafone-ip.de. [88.76.253.94])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d4012000000b0031c79de4d8bsm13914399wrp.106.2023.09.04.02.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 02:01:41 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@bisdn.de>
To:     Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>,
        Kevin Cernekee <cernekee@chromium.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: iproc: reset bus after timeout if START_BUSY is stuck
Date:   Mon,  4 Sep 2023 11:00:04 +0200
Message-ID: <20230904090005.52622-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If a transaction times out, the START_BUSY signal may have gotten stuck,
and subsequent transactaction attempts will fail as the bus is still
considered busy.

To work around this, check if the START_BUSY bit is still asserted, and
reset the controller in case it is.

This is also done by the alternative, non-upstream iproc-smbus driver
implementation [1].

Works around situations like:

    bcm-iproc-2c 1803b000.i2c: transaction timed out
    bcm-iproc-2c 1803b000.i2c: bus is busy
    bcm-iproc-2c 1803b000.i2c: bus is busy
    bcm-iproc-2c 1803b000.i2c: bus is busy
    bcm-iproc-2c 1803b000.i2c: bus is busy
    bcm-iproc-2c 1803b000.i2c: bus is busy
    ...

where the bus never recovers after a timeout.

[1] https://github.com/opencomputeproject/onie/blob/master/patches/kernel/3=
.2.69/driver-iproc-smbus.patch

Fixes: e6e5dd3566e0 ("i2c: iproc: Add Broadcom iProc I2C Driver")
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
The iproc-smbus driver does some additional checks/mitigations, but
since my I2C understanding is only very rudimentary, I didn't add them,
also the reset was enough to fix the issue I was seeing.

I was a bit conflicted about the Fixes tag, but since it fixes/work
around misbehaviour seen I decided to add one.

The issue was happening only in production, and only once per boot (so
far), but with 100% probability within a few hours.

 drivers/i2c/busses/i2c-bcm-iproc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bc=
m-iproc.c
index 05c80680dff4..69f9c199fa3b 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -796,6 +796,15 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2=
c_dev *iproc_i2c,
 	if (!time_left && !iproc_i2c->xfer_is_done) {
 		dev_err(iproc_i2c->device, "transaction timed out\n");
=20
+		/* check if START_BUSY did not clear */
+		if (!!(iproc_i2c_rd_reg(iproc_i2c, M_CMD_OFFSET) &
+		       BIT(M_CMD_START_BUSY_SHIFT))) {
+			/* re-initialize i2c for recovery */
+			bcm_iproc_i2c_enable_disable(iproc_i2c, false);
+			bcm_iproc_i2c_init(iproc_i2c);
+			bcm_iproc_i2c_enable_disable(iproc_i2c, true);
+		}
+
 		/* flush both TX/RX FIFOs */
 		val =3D BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
--=20
2.42.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294

