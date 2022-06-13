Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D90548794
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 17:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383308AbiFMO0E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 10:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384004AbiFMOY1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 10:24:27 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33351638D;
        Mon, 13 Jun 2022 04:46:28 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id r187-20020a1c44c4000000b0039c76434147so4423518wma.1;
        Mon, 13 Jun 2022 04:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=nzaFuqeqvJmB+vA6LsJ/YIozE1oz1rXm/JebgazMuEU=;
        b=IAqpgc2xZnZ+91W8mYh0XvQIRGp7yMZMBwyhb3u+Foh3q0B0bl3569VjsdWwxgV1nj
         dkjaEnc6Lo/OTbaFFBXlL8YFHq9t6cRKOyuMFNl1MN9DEfPWnutQUnNVaBo9YAyYOIhT
         SRWhSrwSOpalMGtmb9GmtEZVWnrrvIp+pyespACJtJVsqxE1idVR9f2HIMOYtN9rdg21
         Y3RQ5qRUb1jwV0sEqTh4VXOOs+RfdiQSUSF40nSEPqVtanfgr8NjRUp2WRgvoEu8wuMI
         etlVQkzv43kwRfLEaHqS7SvUarzl/24SJ+wddjBtA8lB4U/75QsRV6gnXlY3FX0a24ho
         aU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nzaFuqeqvJmB+vA6LsJ/YIozE1oz1rXm/JebgazMuEU=;
        b=RXIwHMvnZ78kmVn55Zbb1P9cL5O9YRGx2ncD0zhcClmwNsmuKPLDyVlUV5OPYiADBb
         os9i8OTHvfbzFFuEQT6VVRFIRfVuB/uUkdv1G4h7GpMP5ASLVNozuCTxjAI7vMFTrpQ1
         1EzyTmSLkJXoCdpoNQORjx31Q0m8NBdTYVs1cI6bBY2j12EvbZo2kfDgsmBzbgP2G0yO
         vwoBta2MOuyU/hutw9GfKw4Ei2pPU66hu0nVZO2/kAEBqXezxL64PUMJfq2kl231x1+Y
         0HpBV3/rUuFmM0FU4zRn16bcfGTfwbAcTisELPYpfvBOSWgNVpY3D/XvgvELOtmbLSQG
         Qg1w==
X-Gm-Message-State: AOAM532foy959KKaWgbv19tPgsBTmuW8TvVy04dRPVeSG6ps/Q0k6giB
        Qc3qMq0q3iL9GyQ+g0llxbVD0voJNQw=
X-Google-Smtp-Source: ABdhPJy0C/teHFxhSocotTFSMCKEjUpwHCBJ3epDSRMMDU5ZO7byMB8eGZhDeIBmW+HpQDRdVu4C8A==
X-Received: by 2002:a7b:c404:0:b0:39c:4389:5834 with SMTP id k4-20020a7bc404000000b0039c43895834mr14333606wmi.70.1655120787320;
        Mon, 13 Jun 2022 04:46:27 -0700 (PDT)
Received: from felia.fritz.box (200116b8260df50011e978c0f780de03.dip.versatel-1u1.de. [2001:16b8:260d:f500:11e9:78c0:f780:de03])
        by smtp.gmail.com with ESMTPSA id q16-20020a5d5750000000b0020e63ab5d78sm8263311wrw.26.2022.06.13.04.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 04:46:26 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: add include/dt-bindings/i2c to I2C SUBSYSTEM HOST DRIVERS
Date:   Mon, 13 Jun 2022 13:46:14 +0200
Message-Id: <20220613114614.21510-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Maintainers of the directory Documentation/devicetree/bindings/i2c
are also the maintainers of the corresponding directory
include/dt-bindings/i2c.

Add the file entry for include/dt-bindings/i2c to the appropriate
section in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Wolfram, please pick this MAINTAINERS addition to the I2C HOST DRIVERS.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d04e74ade88a..2b8aec742e6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9331,6 +9331,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
 F:	Documentation/devicetree/bindings/i2c/
 F:	drivers/i2c/algos/
 F:	drivers/i2c/busses/
+F:	include/dt-bindings/i2c/
 
 I2C-TAOS-EVM DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
-- 
2.17.1

