Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484B0ED5DA
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Nov 2019 22:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfKCVWJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Nov 2019 16:22:09 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48199 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728243AbfKCVWJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Nov 2019 16:22:09 -0500
Received: from [82.43.126.140] (helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iRNK1-0001xz-JH; Sun, 03 Nov 2019 21:22:05 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: qcom-geni: fix spelling mistake "unepxected" -> "unexpected"
Date:   Sun,  3 Nov 2019 21:22:04 +0000
Message-Id: <20191103212204.13606-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message string, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 17abf60c94ae..387fb5a83471 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -98,7 +98,7 @@ static const struct geni_i2c_err_log gi2c_log[] = {
 	[GP_IRQ0] = {-EIO, "Unknown I2C err GP_IRQ0"},
 	[NACK] = {-ENXIO, "NACK: slv unresponsive, check its power/reset-ln"},
 	[GP_IRQ2] = {-EIO, "Unknown I2C err GP IRQ2"},
-	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unepxected start/stop"},
+	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unexpected start/stop"},
 	[ARB_LOST] = {-EAGAIN, "Bus arbitration lost, clock line undriveable"},
 	[GP_IRQ5] = {-EIO, "Unknown I2C err GP IRQ5"},
 	[GENI_OVERRUN] = {-EIO, "Cmd overrun, check GENI cmd-state machine"},
-- 
2.20.1

