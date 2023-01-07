Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6106611D7
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jan 2023 22:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjAGVl6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 16:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbjAGVls (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 16:41:48 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4B2271B8
        for <linux-i2c@vger.kernel.org>; Sat,  7 Jan 2023 13:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=dAUrCyqmCpW9NfB9wRpmj6DpYny5Ku47B1rkN6iCgwA=; b=XMqakxSGzTXFgL+s2Wg0l0Xk91
        tV88NxJ25RfRW3S1yQpBc6RriGj7DjW2smCWco00IMceEyz5uojje52oL1Xr7ifjY18eMxLt1OcMa
        208fA5aTTlj1FO7Ko7YVJTzXTGcVCKECKOZ2HE1F/xMLiDy8le0s1RRd3DxgN9y67P30KG+29L06N
        kQRs3rCuoxKyYUeCPGUzBahxIeKnUdUHQCZ4v2yv+fHbmFVPPxZA757MaaBKiBeEzBVJu5a6Fh0KL
        QrcYd1UyyoUqnSg32V6NK7XOlpnZ7ZTdMKEw+zLe/XFP720G0n8Tf2l6/JUZCjBqerpysRFcy5P/6
        h97AlceA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pEGbB-000IU2-Cc; Sat, 07 Jan 2023 22:19:29 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pEGbA-000KM5-SJ; Sat, 07 Jan 2023 22:19:29 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 4/5] i2c: cadence: Remove always false ternary operator
Date:   Sat,  7 Jan 2023 13:18:13 -0800
Message-Id: <20230107211814.1179438-5-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230107211814.1179438-1-lars@metafoo.de>
References: <20230107211814.1179438-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26774/Sat Jan  7 09:54:43 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When selecting the clock dividers the Cadence I2C driver skips settings
where the resulting I2C bus frequency is larger than the requested
frequency.

If the resulting frequency is lower it will compute the error to actual
frequency. When calculating the difference it also handles the case where
the resulting frequency is larger.

Since the resulting frequency is always smaller or equal the computation of
the error can be simplified by only considering this case.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/i2c/busses/i2c-cadence.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b5d22e7282c2..bec50bfe7aad 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1030,8 +1030,7 @@ static int cdns_i2c_calc_divs(unsigned long *f, unsigned long input_clk,
 		if (actual_fscl > fscl)
 			continue;
 
-		current_error = ((actual_fscl > fscl) ? (actual_fscl - fscl) :
-							(fscl - actual_fscl));
+		current_error = fscl - actual_fscl;
 
 		if (last_error > current_error) {
 			calc_div_a = div_a;
-- 
2.30.2

