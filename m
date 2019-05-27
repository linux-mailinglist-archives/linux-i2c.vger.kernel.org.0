Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732A62BAD2
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 21:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfE0Tpz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 15:45:55 -0400
Received: from sauhun.de ([88.99.104.3]:36392 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbfE0Tpz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 15:45:55 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id 0FAC72C04C2;
        Mon, 27 May 2019 21:45:54 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] MAINTAINERS: Karthikeyan Ramasubramanian is MIA
Date:   Mon, 27 May 2019 21:45:45 +0200
Message-Id: <20190527194545.20013-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A mail just bounced back with "user unknown":

550 5.1.1 <kramasub@codeaurora.org> User doesn't exist

I also couldn't find a more recent address in git history. So, remove
this stale entry.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

I'd happily drop this patch if we can get a sign of life and a recent
email address.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 429c6c624861..9e38c8be2de4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13043,7 +13043,6 @@ F:	Documentation/devicetree/bindings/net/qcom,dwmac.txt
 
 QUALCOMM GENERIC INTERFACE I2C DRIVER
 M:	Alok Chauhan <alokc@codeaurora.org>
-M:	Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
 L:	linux-i2c@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
-- 
2.19.1

