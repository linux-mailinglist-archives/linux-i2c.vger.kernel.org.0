Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224504A974B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 10:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbiBDJ7q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 04:59:46 -0500
Received: from hutie.ust.cz ([185.8.165.127]:60112 "EHLO hutie.ust.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237578AbiBDJ7q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Feb 2022 04:59:46 -0500
From:   =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1643968784; bh=HuUso6bEMXsKcUMes12+B/JL6MuAREtSTqsS7Va9Yk0=;
        h=From:To:Cc:Subject:Date;
        b=pSRVUIiVwm0AXy91+5lijVS54FRSb2o9brQR9V7QClMK29mhiL9ZXtFeTutwu9zSJ
         7afb2w59owbu7AHcFPPp1RtExaFC2VLtI5oPJkV6mo/E9MOEvzSxfxdRVDS9m6UEUO
         5kueD++/ApYD6EItRf65B1YfsP/oYiDaG0/cM57g=
To:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH v2] i2c: pasemi: Drop I2C classes from platform driver variant
Date:   Fri,  4 Feb 2022 10:59:14 +0100
Message-Id: <20220204095914.5678-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drop I2C device-probing classes from platform variant of the PASemi
controller as it is only used on platforms where I2C devices should
be instantiated in devicetree. (The I2C_CLASS_DEPRECATED flag is not
raised as up to this point no devices relied on the old behavior.)

Fixes: d88ae2932df0 ("i2c: pasemi: Add Apple platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
I am sending v2 as some people got their copy in v1 encrypted with
their WKD keys (by accident). I changed email provider since.

 drivers/i2c/busses/i2c-pasemi-core.c | 1 -
 drivers/i2c/busses/i2c-pasemi-pci.c  | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 4e161a4089d8..7728c8460dc0 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -333,7 +333,6 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 	smbus->adapter.owner = THIS_MODULE;
 	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
 		 "PA Semi SMBus adapter (%s)", dev_name(smbus->dev));
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
 	smbus->adapter.algo = &smbus_algorithm;
 	smbus->adapter.algo_data = smbus;
 
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 1ab1f28744fb..cfc89e04eb94 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -56,6 +56,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	if (!smbus->ioaddr)
 		return -EBUSY;
 
+	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
 	error = pasemi_i2c_common_probe(smbus);
 	if (error)
 		return error;
-- 
2.33.0

