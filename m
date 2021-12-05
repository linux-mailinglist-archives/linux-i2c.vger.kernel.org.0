Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DC8468C1D
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Dec 2021 17:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhLEQbn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 11:31:43 -0500
Received: from smtpbg128.qq.com ([106.55.201.39]:17984 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230137AbhLEQbm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Dec 2021 11:31:42 -0500
X-QQ-mid: bizesmtp54t1638721682t50lv2i0
Received: from wangx.lan (unknown [218.88.126.113])
        by esmtp6.qq.com (ESMTP) with 
        id ; Mon, 06 Dec 2021 00:27:55 +0800 (CST)
X-QQ-SSF: 0100000000600050B000B00A0000000
X-QQ-FEAT: 7n1F6iTG2FHkQyoU75K0VgWVOVG7CDjpU6U//v44NIc9UdF+dtAIyEd9KCqV0
        TNiJVPr78WIUA20MZAdwG8ACKmg7SjkJBgaFwewmb5URibWldMBVXUZnU5gcKJGPlH7vwvb
        RjFTI6LxFau8D5sWln7yrI8wdLCM14mAQWDbbpaZa5j8d/fgnM/PlLFIINZw+CQoSth1zHs
        p/ocWjktyYy3dqGqFo2XafRMpRenUQ+yW95ghcp9b20oc8oNjNFTv2cRs3WEcTzTphfPAWW
        2xcSr5zJCsTQMUwUgYQnChmBECtl9xwFgIYfFazcwuCAgaYALjp9EHd2wCWa+4OdrQfo+Da
        gPRg5MTJ1bp59wiiBJvQ5IrHKTtqw==
X-QQ-GoodBg: 0
From:   Xiang wangx <wangxiang@cdjrlc.com>
To:     bleung@chromium.org
Cc:     groeck@chromium.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH] i2c: Fix syntax errors in comments
Date:   Mon,  6 Dec 2021 00:27:52 +0800
Message-Id: <20211205162752.14066-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam5
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Delete the redundant word 'to'

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 790ea3fda693..892213d51f43 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -107,7 +107,7 @@ static int ec_i2c_construct_message(u8 *buf, const struct i2c_msg i2c_msgs[],
 /**
  * ec_i2c_count_response - Count bytes needed for ec_i2c_parse_response
  *
- * @i2c_msgs: The i2c messages to to fill up.
+ * @i2c_msgs: The i2c messages to fill up.
  * @num: The number of i2c messages expected.
  *
  * Returns the number of response bytes expeced.
@@ -131,7 +131,7 @@ static int ec_i2c_count_response(struct i2c_msg i2c_msgs[], int num)
  * We'll take the EC's response and copy it back into msgs.
  *
  * @buf: The buffer to parse.
- * @i2c_msgs: The i2c messages to to fill up.
+ * @i2c_msgs: The i2c messages to fill up.
  * @num: The number of i2c messages; will be modified to include the actual
  *	 number received.
  *
-- 
2.20.1

