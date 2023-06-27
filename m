Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF3C73F770
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 10:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjF0Ifl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 04:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjF0IeZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 04:34:25 -0400
Received: from mail.208.org (unknown [183.242.55.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82CD26A8
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jun 2023 01:34:23 -0700 (PDT)
Received: from mail.208.org (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTP id 4QqygH49rxzBJK3H
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jun 2023 16:34:19 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :subject:to:from:date:mime-version; s=dkim; t=1687854859; x=
        1690446860; bh=AVUeC2KFJQJ80unQBOeT1iMT0E/ys0sUKune3NAaX8U=; b=g
        fMv4Q1BErQso1Fg6kjt8FmLRNzSXy3JdUtRBH96kWR2sfyq03iF/cL9EZmGWyVgu
        kc8khQHLWqp5SNoXH0Vs++BByCsOaS83lwc7LSi4IwfarWXeFMPOy4sQsWpGbHNJ
        xWNWa7aLin6bTBumVz8JTp+kXC1CbuTuaHzW9M4DrBYCBkiLFLUyClFubyLNhNZE
        WFCX5/Yzc07Ik4ITOhGCjfYM4IG6Bee79i/CwYuBlZcvafJjGTCsLzc2vJ9CSuAq
        LI9g0CIcvIKAI1jbkyXhVNn1xJzYtLhzGNK6dajiDjQUZkQk9ynz22RSNbL9d/BW
        w5RExsFpv14Mnaa6abdNA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
        by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id R8ViUYi5Y_h7 for <linux-i2c@vger.kernel.org>;
        Tue, 27 Jun 2023 16:34:19 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTPSA id 4QqygH19BGzBJBHT;
        Tue, 27 Jun 2023 16:34:19 +0800 (CST)
MIME-Version: 1.0
Date:   Tue, 27 Jun 2023 16:34:19 +0800
From:   baomingtong001@208suo.com
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: mcp2221: Remove unneeded semicolon
User-Agent: Roundcube Webmail
Message-ID: <e180a7c6af0c569be9a950ff25667bc7@208suo.com>
X-Sender: baomingtong001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RDNS_NONE,SPF_HELO_FAIL,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

./drivers/hid/hid-mcp2221.c:1027:3-4: Unneeded semicolon

Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
---
  drivers/hid/hid-mcp2221.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 72883e0ce757..38e795c58764 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1024,7 +1024,7 @@ static int mcp_iio_channels(struct mcp2221 *mcp)
  			break;
  		default:
  			continue;
-		};
+		}

  		chan->type = IIO_VOLTAGE;
  		chan->indexed = 1;
-- 
2.40.1

