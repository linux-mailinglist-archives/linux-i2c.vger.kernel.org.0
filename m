Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94CD2602B14
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 14:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiJRME3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 08:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiJRMEA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 08:04:00 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 716B6BEAFA;
        Tue, 18 Oct 2022 05:03:46 -0700 (PDT)
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 406E6203C6;
        Tue, 18 Oct 2022 14:03:43 +0200 (CEST)
From:   tumic@gpxsee.org
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Lizhi Hou <lizhi.hou@amd.com>,
        =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v3 1/2] i2c: xiic: Added platform module alias for the xiic I2C driver
Date:   Tue, 18 Oct 2022 16:03:37 +0200
Message-Id: <20221018140338.7080-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018140338.7080-1-tumic@gpxsee.org>
References: <20221018140338.7080-1-tumic@gpxsee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

The missing "platform" alias is required for the mgb4 v4l2 driver to load
the i2c controller driver when probing the HW.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/i2c/busses/i2c-xiic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b3fe6b2aa3ca..277a02455cdd 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -920,6 +920,7 @@ static struct platform_driver xiic_i2c_driver = {
 
 module_platform_driver(xiic_i2c_driver);
 
+MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("info@mocean-labs.com");
 MODULE_DESCRIPTION("Xilinx I2C bus driver");
 MODULE_LICENSE("GPL v2");
-- 
2.38.0

