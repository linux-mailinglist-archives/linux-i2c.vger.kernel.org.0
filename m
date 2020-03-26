Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5CDF194A8C
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgCZV17 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:27:59 -0400
Received: from mr85p00im-zteg06021901.me.com ([17.58.23.194]:50513 "EHLO
        mr85p00im-zteg06021901.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727444AbgCZV17 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 17:27:59 -0400
X-Greylist: delayed 307 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Mar 2020 17:27:59 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1585257771; bh=1giZd2owGIj9cpPaRlxOyrqDeGF8FFFXZCqKHweT8Kc=;
        h=From:To:Subject:Date:Message-Id;
        b=KCSInXcjW3AwTJydl6bt+xudN4Eo8Vv+9YUY9qh89kVQihw7Na5Y/442yuCgpNPeQ
         UcLWOX6DvxX1l9TFfGk7nK/mwnFcG6LTDvgM6nJNldp9Q+cnEQ2ZjS37ctQf42nUws
         svtkyvF5N6ddzt0fhe7E+jRnYf871Exr8/GH8Kp3hHfqHABVbg5iXMJnRaN2FIWIGg
         BOVPzU4+HNkmpBkJ3RdCOnaO9cuDCTsbKnzK+hZo+uecfTvY5bo/2pyVnCfI2Fk4wg
         VEGZ9W8Tf8VAye3eeFMF+TZglM8YDGsO4zdLj3lN0Y7EcRH4dtHI2JAb1jcfmuPMta
         E+5jRVYJbHxAg==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
        by mr85p00im-zteg06021901.me.com (Postfix) with ESMTPSA id 6A424720842;
        Thu, 26 Mar 2020 21:22:51 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Patrice Chotard <patrice.chotard@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     avolmat@me.com
Subject: [PATCH] i2c: i2c-st: fix missing struct parameter description
Date:   Thu, 26 Mar 2020 22:22:43 +0100
Message-Id: <20200326212243.17363-1-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2020-03-26_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=968 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-2003260156
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix a missing struct parameter description to allow
warning free W=1 compilation.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/i2c/busses/i2c-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 54e1fc8a495e..f7f7b5b64720 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -434,6 +434,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
 /**
  * st_i2c_rd_fill_tx_fifo() - Fill the Tx FIFO in read mode
  * @i2c_dev: Controller's private data
+ * @max: Maximum amount of data to fill into the Tx FIFO
  *
  * This functions fills the Tx FIFO with fixed pattern when
  * in read mode to trigger clock.
-- 
2.17.1

