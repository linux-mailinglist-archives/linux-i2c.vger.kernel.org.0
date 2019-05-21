Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCDB249FB
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfEUIPi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:15:38 -0400
Received: from sauhun.de ([88.99.104.3]:32894 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbfEUIPh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:15:37 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id 2B0F12C7769;
        Tue, 21 May 2019 10:15:37 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        George Cherian <george.cherian@cavium.com>,
        Jan Glauber <jglauber@cavium.com>
Subject: [PATCH 6/6] MAINTAINERS: add DT bindings to i2c-xlp9xx
Date:   Tue, 21 May 2019 10:15:09 +0200
Message-Id: <20190521081509.2586-7-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190521081509.2586-1-wsa@the-dreams.de>
References: <20190521081509.2586-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Cc: George Cherian <george.cherian@cavium.com>
Cc: Jan Glauber <jglauber@cavium.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c99b46e16b42..509a8e6d2dcc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17385,6 +17385,7 @@ M:	Jan Glauber <jglauber@cavium.com>
 L:	linux-i2c@vger.kernel.org
 W:	http://www.cavium.com
 S:	Supported
+F:	Documentation/devicetree/bindings/i2c/i2c-xlp9xx.txt
 F:	drivers/i2c/busses/i2c-xlp9xx.c
 
 XRA1403 GPIO EXPANDER
-- 
2.19.1

