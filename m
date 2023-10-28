Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5669D7DA6E8
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 14:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjJ1MX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 08:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjJ1MX3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 08:23:29 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE337AF
        for <linux-i2c@vger.kernel.org>; Sat, 28 Oct 2023 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=PeFUeuZBfjRecm
        eODEBuCNomX22TEF9TzATVPxks+D4=; b=jSM36BMjWGWy2mQNtKaEnbYOvp44bz
        LnWvG5iAa62qBgWrngRFKc767CFvxanpu6WQesqNVxlzZlvKDauSiNRCSp9c7l8A
        gU40ve74ydaOauGJjvaWkpBqvTmd2Da3vwkfrix9gLJubBFSf0dTv0/ic1fEDc6n
        tClVB+ZJBqE/B5Odi52KCUmesSY6oY5VPmgv1L17wUqifMzESl6mqdBSChmUJ2Jf
        sFDWIPsqV3bRuaoubsdCA3KKVhCsZoXeq2qERzPi49Hq7N24B7Q+yO3SYbt3dxdf
        XvicZnhQwCg6XkocQp2emlWvFiOa0U9xX5T+djdM9Y95/4ZgZo+QPrHw==
Received: (qmail 3556951 invoked from network); 28 Oct 2023 14:23:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2023 14:23:21 +0200
X-UD-Smtp-Session: l3s3148p1@ZdLn3sUI0JZehhre
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add YAML file for i2c-demux-pinctrl
Date:   Sat, 28 Oct 2023 14:23:08 +0200
Message-Id: <20231028122309.9867-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf0f54c24f81..60c7d7d818d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8711,6 +8711,7 @@ F:	include/linux/phy/
 GENERIC PINCTRL I2C DEMULTIPLEXER DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
 F:	drivers/i2c/muxes/i2c-demux-pinctrl.c
 
 GENERIC PM DOMAINS
-- 
2.35.1

