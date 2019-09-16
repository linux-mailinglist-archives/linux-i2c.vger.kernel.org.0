Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC9DFB40AA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2019 20:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731897AbfIPS5w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Sep 2019 14:57:52 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35981 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbfIPS5v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Sep 2019 14:57:51 -0400
Received: by mail-pl1-f195.google.com with SMTP id f19so312200plr.3;
        Mon, 16 Sep 2019 11:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=6GJVYZVizFOmWLLKqyhFFsbLlhsFFaEZLvX1m6HHdmQ=;
        b=I2ODjOZtODyDxCuxv9Azmvch8XWnHyHBkZLIvGGLKBnK+xe8mBz7AUmsZbetzEKiSf
         mU0/fAVe+cY3hDnXF+EytNRchkE3J6AN/rhVeicwz9itdCQM5mYbCBE64uSyYNgU24XF
         qI5p5fV5bSfSlVaHm8i/oE+bRJQP1Ymz4tv5jaooUnloLU9zo6vJAOgNYQtBTub44k+X
         mpiE3Ds/3VYIuDamma6QXIqpF8FKXn+7YDmr8bvwN9TvSywg5icx5eDtAOfEpcBWNcv0
         56B03WGp2kF2sFDip/imxIqnOoqJ8P22xtt1zEqfI0gkRxP/xI0hw3AwUJncYJugPgya
         bcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=6GJVYZVizFOmWLLKqyhFFsbLlhsFFaEZLvX1m6HHdmQ=;
        b=lw4MMUTvQMMQTMN4sJmiNCvs6BMjXrv1s86xq7OEpTtA+sSVZo0Oa9nuKWDPOVdo15
         5JinqnTIJy0kH1jmFGSW7uu1ScL4xNsVClQYeSVxpTVEpHl9SDacgZ99hmtIghYuqtX1
         i+ZSDoUBCHJ9ETDZ/P1OLywJpHHuTITcIuo5+DYoUELpPh8Zpc6eBUdhW2ACQ5PQpVjH
         ScsSoYacIMYPenrD4EOffi57afA9JdwBbYTqbKaWJ+unBbovT5dQ19HHhYm/C5PqEsSS
         Izeb8G+J3jveh4Zu9auZZEpRnKfftAGwdzvOM03Yls6soqvT5OCucpDHjyTXkBK4LT1R
         3jMw==
X-Gm-Message-State: APjAAAXkSGlDBM/VoKqB8Nt3T/VIQWUl9mV7oJ3gf+x341tl9QRSQI3E
        zziq/7S02y6ZKg8qKwxz/BlW5ZOg
X-Google-Smtp-Source: APXvYqxmnd5GnSCMZVjER7vamuWcS3us87th6uFhPbNTynSl2UdOuNDRDypWrVPLy9Pzzz0BdZ00WA==
X-Received: by 2002:a17:902:654a:: with SMTP id d10mr1296534pln.199.1568660270725;
        Mon, 16 Sep 2019 11:57:50 -0700 (PDT)
Received: from SD ([2405:204:828a:aaec:8514:49dd:92d4:793d])
        by smtp.gmail.com with ESMTPSA id s97sm315727pjc.4.2019.09.16.11.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 11:57:50 -0700 (PDT)
Date:   Tue, 17 Sep 2019 00:27:38 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] i2c: qup: remove explicit conversion to boolean
Message-ID: <20190916185738.GA14035@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Relational and logical operators evaluate to bool,
explicit conversion is overly verbose and unneeded.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
 drivers/i2c/busses/i2c-qup.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index e09cd0775ae9..5519c19bfd9c 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -961,10 +961,8 @@ static void qup_i2c_conf_v1(struct qup_i2c_dev *qup)
 	u32 qup_config = I2C_MINI_CORE | I2C_N_VAL;
 	u32 io_mode = QUP_REPACK_EN;

-	blk->is_tx_blk_mode =
-		blk->total_tx_len > qup->out_fifo_sz ? true : false;
-	blk->is_rx_blk_mode =
-		blk->total_rx_len > qup->in_fifo_sz ? true : false;
+	blk->is_tx_blk_mode = blk->total_tx_len > qup->out_fifo_sz;
+	blk->is_rx_blk_mode = blk->total_rx_len > qup->in_fifo_sz;

 	if (blk->is_tx_blk_mode) {
 		io_mode |= QUP_OUTPUT_BLK_MODE;
@@ -1532,10 +1530,10 @@ qup_i2c_determine_mode_v2(struct qup_i2c_dev *qup,
 	    (total_len > qup->out_fifo_sz || total_len > qup->in_fifo_sz)) {
 		qup->use_dma = true;
 	} else {
-		qup->blk.is_tx_blk_mode = max_tx_len > qup->out_fifo_sz -
-			QUP_MAX_TAGS_LEN ? true : false;
-		qup->blk.is_rx_blk_mode = max_rx_len > qup->in_fifo_sz -
-			READ_RX_TAGS_LEN ? true : false;
+		qup->blk.is_tx_blk_mode =
+			max_tx_len > qup->out_fifo_sz - QUP_MAX_TAGS_LEN;
+		qup->blk.is_rx_blk_mode =
+			max_rx_len > qup->in_fifo_sz - READ_RX_TAGS_LEN;
 	}

 	return 0;
--
2.20.1

