Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E8F257D9E
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 17:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgHaPiu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 11:38:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728555AbgHaPaP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 11:30:15 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1614207EA;
        Mon, 31 Aug 2020 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598887815;
        bh=d5CrpnaLe/hzDWsm51N0bFeSs/nJtCjmHu60f90JOmk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fwVqPwEijAmw69jDbAngpKi0LonGj0bGRlL63ri1+6y6qxzRnF1iXfJmDp/ZElVJ5
         i9P3pF8HEVvCfjclsW24L+FEEARvgK5k02HDakrZ54gXU/E+I2C6vcqjnQxpdOteCp
         mrtpc9HPpacEuq7hKK0/BDtJxiO8nABFk0yFoj1k=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ray Jui <ray.jui@broadcom.com>, Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.8 27/42] i2c: iproc: Fix shifting 31 bits
Date:   Mon, 31 Aug 2020 11:29:19 -0400
Message-Id: <20200831152934.1023912-27-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831152934.1023912-1-sashal@kernel.org>
References: <20200831152934.1023912-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ray Jui <ray.jui@broadcom.com>

[ Upstream commit 0204081128d582965e9e39ca83ee6e4f7d27142b ]

Fix undefined behaviour in the iProc I2C driver by using 'BIT' marcro.

Reported-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
[wsa: in commit msg, don't say 'checkpatch' but name the issue]
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 688e928188214..d8295b1c379d1 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -720,7 +720,7 @@ static int bcm_iproc_i2c_xfer_internal(struct bcm_iproc_i2c_dev *iproc_i2c,
 
 			/* mark the last byte */
 			if (!process_call && (i == msg->len - 1))
-				val |= 1 << M_TX_WR_STATUS_SHIFT;
+				val |= BIT(M_TX_WR_STATUS_SHIFT);
 
 			iproc_i2c_wr_reg(iproc_i2c, M_TX_OFFSET, val);
 		}
@@ -738,7 +738,7 @@ static int bcm_iproc_i2c_xfer_internal(struct bcm_iproc_i2c_dev *iproc_i2c,
 		 */
 		addr = i2c_8bit_addr_from_msg(msg);
 		/* mark it the last byte out */
-		val = addr | (1 << M_TX_WR_STATUS_SHIFT);
+		val = addr | BIT(M_TX_WR_STATUS_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, M_TX_OFFSET, val);
 	}
 
-- 
2.25.1

