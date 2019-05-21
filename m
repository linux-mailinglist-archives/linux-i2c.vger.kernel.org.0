Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9321F249F7
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfEUIPg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:15:36 -0400
Received: from sauhun.de ([88.99.104.3]:32878 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbfEUIPg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:15:36 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id 1E4D62C775D;
        Tue, 21 May 2019 10:15:35 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Thor Thayer <thor.thayer@linux.intel.com>
Subject: [PATCH 1/6] MAINTAINERS: add DT bindings to i2c-altera
Date:   Tue, 21 May 2019 10:15:04 +0200
Message-Id: <20190521081509.2586-2-wsa@the-dreams.de>
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
Cc: Thor Thayer <thor.thayer@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cfbea4ce575..026f6ccdfb9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -696,6 +696,7 @@ F:	drivers/input/mouse/alps.*
 ALTERA I2C CONTROLLER DRIVER
 M:	Thor Thayer <thor.thayer@linux.intel.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-altera.txt
 F:	drivers/i2c/busses/i2c-altera.c
 
 ALTERA MAILBOX DRIVER
-- 
2.19.1

