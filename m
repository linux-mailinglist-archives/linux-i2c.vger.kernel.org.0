Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E66244FE6
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Aug 2020 00:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgHNWk0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 18:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgHNWkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 18:40:23 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABEDC061385
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 15:40:23 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id m7so9772512qki.12
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 15:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=S+Nq4NH8jPvnXfz2GyxerSue0wCYMn7S7LmKnPKVOT8=;
        b=JPlJwOyxCUlIU8uursfJxCa63kd5rWUfURylxigZ9fCMpK8ivmBXELZ6jo/4KQjGKE
         EsVQl3ZwOdVdD5ERWmY+zm0womFqwFjZrgvy4Dm4f3zbjmfUZSgNjNCvpoxS3ukBGxBw
         frGZSymSwOCdkJRHbIAE6PUpWNUGTbvV09Tw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S+Nq4NH8jPvnXfz2GyxerSue0wCYMn7S7LmKnPKVOT8=;
        b=BH0NTVYLMkCU/+Jt/9TzzPOC0iWcsgrGU7vDnboERdcfGiR6sQylGKD9axSQHztXDA
         6X44BlRgje1iU2PsMHNH8647pdUNJACLkltShQkU68XsBFLVDLY86KtgvAkwNT7RLUpJ
         BKP2EfeCGsCxmAfOEZIiamfKB3KQrvShvIzOBfEA8OwWrP3AEJpUebVjmXxfIgvlcWWE
         MZaOOZ9sIwGzm+1SIltAMlad/J34zoIYKw72vuw0Ku/IdjR2jjJ19DeYNF5vn+XYG9n0
         n/iN4CHq0LGGB42Jv6/z5moWlGhIFCc5xOPuFQYAWD8mxVFJr0pzSZm4WZGh7rX2KiEL
         sn7Q==
X-Gm-Message-State: AOAM530iKKUV5pDy6u0z1XP7bKKZhB1TASNTvNy6dKz95QKWsmhQ7+LA
        YRKt7wNMcRgvtRoRF4FKOX0H+9s72mAvRDWv
X-Google-Smtp-Source: ABdhPJx2pQHmDGGlxfcYQ9WzotzTKwUVTuGYihj3Wf/o5S6pc9v5a+U8H/ZWecmXhMFjt+eQOkU19Q==
X-Received: by 2002:a37:a64a:: with SMTP id p71mr4047056qke.296.1597444819686;
        Fri, 14 Aug 2020 15:40:19 -0700 (PDT)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id r18sm11909804qtc.90.2020.08.14.15.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 15:40:18 -0700 (PDT)
From:   Ray Jui <ray.jui@broadcom.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH] i2c: iproc: Fix checkpatch warnings by using 'BIT' macro
Date:   Fri, 14 Aug 2020 15:40:08 -0700
Message-Id: <20200814224008.107430-1-ray.jui@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix additional checkpatch warnings in the iProc I2C driver by using
'BIT' marcro.

Reported-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 688e92818821..d8295b1c379d 100644
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
2.17.1

