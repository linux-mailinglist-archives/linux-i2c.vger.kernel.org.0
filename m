Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BE825A4C3
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 07:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgIBFAG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 01:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgIBFAF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 01:00:05 -0400
X-Greylist: delayed 443 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 01 Sep 2020 22:00:04 PDT
Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [IPv6:2a01:7c8:7c9:ca11:136:144:136:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8940FC061244;
        Tue,  1 Sep 2020 22:00:04 -0700 (PDT)
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
        by outbound5.mail.transip.nl (Postfix) with ESMTP id 4BhBPv2YpgzGnth;
        Wed,  2 Sep 2020 06:52:35 +0200 (CEST)
Received: from barney.ruun.network (unknown [IPv6:2a01:7c8:aabd:3e::1])
        by submission2.mail.transip.nl (Postfix) with ESMTPSA id 4BhBPt54c3z18GZb;
        Wed,  2 Sep 2020 06:52:34 +0200 (CEST)
Received: from cpe-98-14-166-248.nyc.res.rr.com ([98.14.166.248] helo=localhost.localdomain)
        by barney.ruun.network with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <jeffrey@icurse.nl>)
        id 1kDKl6-007yQx-U9; Wed, 02 Sep 2020 06:52:33 +0200
From:   Jeffrey Lin <jeffrey@icurse.nl>
To:     jeffrey@icurse.nl
Cc:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: [PATCH v2] i2c: i801: Register lis3lv02d I2C device on Dell Latitude 5480
Date:   Wed,  2 Sep 2020 00:51:37 -0400
Message-Id: <20200902045136.527776-1-jeffrey@icurse.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200616234130.814499-1-jeffrey@icurse.nl>
References: <20200616234130.814499-1-jeffrey@icurse.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=icurse.nl; t=1599022354; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=5JEWEx3Qke6aF+s01WxEPtBWHgZEy/95n0ms41kGazc=;
 b=W2wjWynmPYEzwjIrwFknEcsB2E/d+4SbwHSmz9pfHu3cT/YMaG6ZQw1Gp9/zqKmiVx72NU
 D1HvNjv6FWVpqPYCA7oRtj73gFJU2XdmsT/zHdzDDN56VUpbPgQLKPXad1+mS52kL0gbOW
 Ked7gpiIE7B8r56yUG07N4/izxmq3kN5iaOVhwbghkCQQq9pfUDo+pNQ6mdP3Rf+4qaG5a
 G12Oc1xC0itqiohvXiHGVCwl621+O1nmK5Jfw0F6WpcTgSCQ1LxKKiPhFdjSo/r1mvWBK5
 cOC2eSaucc6/Vy9LXemARCz5U8JeFZP9di/UvsCQ3nOw9t7di/cd3vjowYRROA==
X-Report-Abuse-To: abuse@transip.nl
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Value of /sys/devices/platform/lis3lv02d/position when
    Horizontal:     (36,-108,-1152)
    Left elevated:  (-432,-126,-1062)
    Front elevated: (36,594,-936)
    Upside down:    (-126,-252,1098)

Signed-off-by: Jeffrey Lin <jeffrey@icurse.nl>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---

Changes in v2:
- Added Jean's Reviewed-by

 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index e32ef3f01fe8..efab1e71ad6a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1274,6 +1274,7 @@ static const struct {
 	/*
 	 * Additional individual entries were added after verification.
 	 */
+	{ "Latitude 5480",      0x29 },
 	{ "Vostro V131",        0x1d },
 };
 
-- 
2.28.0

