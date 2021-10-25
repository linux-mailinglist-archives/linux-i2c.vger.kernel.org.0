Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53BC1438E95
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 07:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhJYFFh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 01:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhJYFFh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 01:05:37 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BD5C061745;
        Sun, 24 Oct 2021 22:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=1h0WaOdivaQpGou6EXOqToxlTtTFUc2nlylZntQctDc=; b=hJZpOBftPioI3dFTzAQ7dGaSbf
        LHbKuw1LZuCsojNXhLsC2IjNg5KrT25HpyaOO9d6duevEOWd0fg3rS0r1H6LLiIiGQtc4Mb0AqDH9
        xVvtOuy8XVLOnks0Hs2pcPS5ezaAt0vT9YJ6QILJtPDZnzlor0Rfwb6opTjKZYE3keltj3M7DDFWJ
        7wv/PmSCVki4XXDxVUdWKFalTfszEOz9hEkSORczUDVC/u/8A6DkRXiSKQczlxOLDn65wyQxXYyDE
        L+KZubKz/lIo9n6LKbU8BGGJ3TBTJkNJ8egQDjtG9rUaNtcTsy6wxfMxAqTl+4atcYKPXPUm4cPfe
        JiGs0C3g==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mes8g-00FI3I-La; Mon, 25 Oct 2021 05:03:14 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-i2c@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] i2c: qup: fix a trivial typo
Date:   Sun, 24 Oct 2021 22:03:13 -0700
Message-Id: <20211025050313.32409-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Correct the typo of "reamining" to "remaining".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/i2c/busses/i2c-qup.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211022.orig/drivers/i2c/busses/i2c-qup.c
+++ linux-next-20211022/drivers/i2c/busses/i2c-qup.c
@@ -1290,7 +1290,7 @@ static void qup_i2c_write_rx_tags_v2(str
  * 1. Check if tx_tags_sent is false i.e. the start of QUP block so write the
  *    tags to TX FIFO and set tx_tags_sent to true.
  * 2. Check if send_last_word is true. It will be set when last few data bytes
- *    (less than 4 bytes) are reamining to be written in FIFO because of no FIFO
+ *    (less than 4 bytes) are remaining to be written in FIFO because of no FIFO
  *    space. All this data bytes are available in tx_fifo_data so write this
  *    in FIFO.
  * 3. Write the data to TX FIFO and check for cur_blk_len. If it is non zero
