Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1270C3E9243
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhHKNK5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:10:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230002AbhHKNK5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 09:10:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D81D460FA0;
        Wed, 11 Aug 2021 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628687433;
        bh=VLxJSiYkuMQJlbjgftwfIXkDtw3Fg1DeAeWp7KIVHHE=;
        h=From:To:Cc:Subject:Date:From;
        b=PKymWaoAYmCM2RgzNJl4VhHhxDaeprWD4alXWT6vbhTSwL0iWGXOGfCwWsQjDcViN
         Eq12DWOfVY0OlcMdHlVMFUCBOz+YH0DpkTADDs+Ohcm07I8vFlqoO2ZGW5A+OyhgXs
         M2LRwDtjR6lt3w2uT64qje6cADPtYk6WxeRbjPOOp278V9WrsXEtzDjNVSvLisAoVz
         5eokCGJ63vc4qyMs/wOlRrVdgQwo6hi4zNqT44iWfAvBxxFsH2mh9TnsMn5u4ghlk6
         3bgosxF4Z6oeDsE7w0JkyO/X8tqEXXFg8YMFQJ8VATsuJGYAnTf7k5Wovr4/VLywXm
         opk1ja2t1zGjA==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Wolfram Sang <wsa@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] i2c: at91: mark PM ops as __maybe unused
Date:   Wed, 11 Aug 2021 15:10:02 +0200
Message-Id: <20210811131002.2201-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver uses pm_ptr(), so the PM ops could be unused.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: dab4b0e8c9a5 ("i2c: at91: remove #define CONFIG_PM")
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-at91-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 9f3c3e8e8011..2df9df585131 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -333,7 +333,7 @@ static int __maybe_unused at91_twi_resume_noirq(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops at91_twi_pm = {
+static const struct dev_pm_ops __maybe_unused at91_twi_pm = {
 	.suspend_noirq	= at91_twi_suspend_noirq,
 	.resume_noirq	= at91_twi_resume_noirq,
 	.runtime_suspend	= at91_twi_runtime_suspend,
-- 
2.30.2

