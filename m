Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB424A6761
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 22:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235740AbiBAVzW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 16:55:22 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:38102 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235804AbiBAVzV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 16:55:21 -0500
Date:   Tue, 01 Feb 2022 21:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1643752520;
        bh=91s3sGuD9seTYS3Ogxew71E+mOhxkkUpmHyteD5lQYM=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
        b=Nj2VpdP9IUK4HWRBFBe0ppWR8BeLgyd7zTXh2q9IK+6d+2YUPyJyv8Iic7GUrFc1k
         9eDmYS5GlnGLQLdEpQaXGoloKuW98BQLzBLxBtBCT4Ef8Ca9bT6ayuZdcIM4aRTQxF
         y89V15ex58Lo+DPUhE7kl2l5f1EvMtDMIUrFKvov9YFxW8WV5e0QwB0e9TgBZCMvW2
         qZFHJ2YScB32TyldQZNI2Lxgfo9IXFSTdETuO13GdeSzrScLpddU7mLaoBPRRzZPQs
         ddY6Xc+yTdwSA9oYKUTE6FgCFl99x/6tT6sNs5Im75YvJ+/SoFpMTVXSm0ucOD1lKr
         nhMw6v51t5rrg==
To:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Wolfram Sang <wsa@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Subject: [PATCH] i2c: pasemi: Drop I2C classes from platform driver variant
Message-ID: <20220201215435.61967-1-povik+lin@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drop I2C device-probing classes from platform variant of the PASemi
controller as it is only used on platforms where I2C devices should
be instantiated in devicetree. (The I2C_CLASS_DEPRECATED flag is not
raised as up to this point no devices relied on the old behavior.)

Fixes: d88ae2932df0 ("i2c: pasemi: Add Apple platform driver")
Signed-off-by: Martin Povi=C5=A1er <povik+lin@protonmail.com>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 1 -
 drivers/i2c/busses/i2c-pasemi-pci.c  | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-=
pasemi-core.c
index 4e161a4089d8..7728c8460dc0 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -333,7 +333,6 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 =09smbus->adapter.owner =3D THIS_MODULE;
 =09snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
 =09=09 "PA Semi SMBus adapter (%s)", dev_name(smbus->dev));
-=09smbus->adapter.class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;
 =09smbus->adapter.algo =3D &smbus_algorithm;
 =09smbus->adapter.algo_data =3D smbus;

diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-p=
asemi-pci.c
index 1ab1f28744fb..cfc89e04eb94 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -56,6 +56,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 =09if (!smbus->ioaddr)
 =09=09return -EBUSY;

+=09smbus->adapter.class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;
 =09error =3D pasemi_i2c_common_probe(smbus);
 =09if (error)
 =09=09return error;
--
2.33.0


