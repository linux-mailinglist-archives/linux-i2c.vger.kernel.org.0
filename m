Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0631D7F4C
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 18:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgERQzc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 12:55:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41123 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbgERQzc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 12:55:32 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jaj33-0000jG-Ue; Mon, 18 May 2020 16:55:30 +0000
From:   Colin King <colin.king@canonical.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] i2c: mediatek: fix integer overflow on an integer multiplication
Date:   Mon, 18 May 2020 17:55:29 +0100
Message-Id: <20200518165529.57821-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the calculation of sample_ns is using a 32 bit integer
multiplication and can potentially overflow. Fix this by making the
constant a long long to use a 64 bit multiply and hence
avoid an overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 5f1ae73d538a ("i2c: mediatek: Add i2c ac-timing adjust support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 702061805925..c93492b997ce 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -551,7 +551,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	const struct i2c_spec_values *spec;
 	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
 	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
-	long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
+	long long sample_ns = (1000000000LL * (sample_cnt + 1)) / clk_src;
 
 	if (!i2c->dev_comp->timing_adjust)
 		return 0;
-- 
2.25.1

