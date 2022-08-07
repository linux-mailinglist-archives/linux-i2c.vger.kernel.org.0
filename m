Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF1D58BB23
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Aug 2022 16:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbiHGOIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Aug 2022 10:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiHGOID (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Aug 2022 10:08:03 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652A26242;
        Sun,  7 Aug 2022 07:08:02 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso12241980pjq.4;
        Sun, 07 Aug 2022 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=XLqwqki/k3C7u8+512qwgIHUnUs9SX352ijc2YXNmyo=;
        b=Q6xwZS1QliChNp80WlGV80Ap4InNEJovH7Jy6o6SyJqeKRTZRjMzkQ3IaPqKN2/oiZ
         NtIAzyBUPcur0U6Xz4C9RG4n0q8AJqXw/cF/QfxjZHZoGBd9SgdQA5Iw8lhzSntBZqrP
         trc8/tdrb9kWrd5SUOg1jIRAjwr6eqEp1/cygeAXtANwXaFIvfkmRrCR7qgsQmfMB9xH
         G9vstMwrj5hlGa82r3NTggYwm/lDsATHEeoI5tsXVuKEC/I38L+Kba2mf7+EC4gg+eKc
         ugdIX4n+oVUzK0ikxT2vKpwzX8EzglcNFVeQimDSL8nlmN9qXSFFrOlOhGRBZ5XSBTRg
         9DgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=XLqwqki/k3C7u8+512qwgIHUnUs9SX352ijc2YXNmyo=;
        b=kFs2LrQ+hP0qQiGqpWL4RVaPisQsXQLVJq8RcHcMKE5cE3PBZENQPpaGaEOnkQMWz9
         oVDMsV+VsuzrnZpgUIWx8jcp9r261OuT9+2dwtH2vUKn1HgZTNKKxZ0Vi5DcQJv4XfSh
         +HYW6FdinR2G1IV/9qSz7UMWEI928iEio8qZ5RS3HOcCp5KKuSC0nhnOUfsO2U9fGPAj
         oHTxBf6MJwxcPkk1f6e8fkIIzb8/9fY8deMRZmOzwyZsg08JN6yrsBU8Yav0530qFkYT
         mpuH1dORLtsy4+r9Q9labHpbg7etJT8gez2QEwIwssFlN8mNIJA0Dy6crQu4pw3b/Bra
         mAyA==
X-Gm-Message-State: ACgBeo1ChR6j6uFJq/yI1n1kUlYTrYQY1nb4zj+Ly0Na92ez2YNQKElc
        Y2C0sgfliHk6YYO+LyWcKN0=
X-Google-Smtp-Source: AA6agR74Eu/frAH1DDF2DIi5PzdZPd93fll6q/Qkq8cKR83I4ccQyUB0Hz/ey+pGN/+akI8HnQZPDg==
X-Received: by 2002:a17:902:c406:b0:16e:df76:5267 with SMTP id k6-20020a170902c40600b0016edf765267mr14922969plk.8.1659881281763;
        Sun, 07 Aug 2022 07:08:01 -0700 (PDT)
Received: from localhost.localdomain ([2409:11:2360:3e00:d7d3:6cf6:2642:4646])
        by smtp.gmail.com with ESMTPSA id o14-20020a635d4e000000b0041d322b3bf6sm2761133pgm.77.2022.08.07.07.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 07:08:01 -0700 (PDT)
From:   Robin Reckmann <robin.reckmann@googlemail.com>
X-Google-Original-From: Robin Reckmann <robin.reckmann@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Robin Reckmann <robin.reckmann@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Date:   Sun,  7 Aug 2022 23:04:54 +0900
Message-Id: <20220807140455.409417-1-robin.reckmann@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix i2c transfers using GPI DMA mode for all message types that do not set
the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").

In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
and it has to synced back to the message after the transfer is done.

Add missing assignment of dma buffer in geni_i2c_gpi().

Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
ensure the sync-back of this dma buffer to the message.

Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6ac402ea58fb..d3541e94794e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -484,12 +484,12 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	if (tx_buf) {
 		dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_DEVICE);
-		i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
+		i2c_put_dma_safe_msg_buf(tx_buf, msg, !gi2c->err);
 	}
 
 	if (rx_buf) {
 		dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_DEVICE);
-		i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
+		i2c_put_dma_safe_msg_buf(rx_buf, msg, !gi2c->err);
 	}
 }
 
@@ -553,6 +553,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	desc->callback_param = gi2c;
 
 	dmaengine_submit(desc);
+	*buf = dma_buf;
 	*dma_addr_p = addr;
 
 	return 0;
-- 
2.25.1

