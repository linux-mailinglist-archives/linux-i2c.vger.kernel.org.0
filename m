Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F19426F16
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 18:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbhJHQiV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 12:38:21 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60093 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232682AbhJHQiR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 12:38:17 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 22692581009;
        Fri,  8 Oct 2021 12:36:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Oct 2021 12:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=3gVs60z+GZXZn
        xMyWBUAI98Vy1vUJV8dXTwiEbS9uIY=; b=RmuEne/F7tjZzGUT07pkBKHFK+fpy
        1rYBUjpzvmXxhNlBOZFnET+UqwezORS9olGwXcJb3C8LNtbF5oxih77H0gmEbMyD
        1luNlUbYVlxHmELdINlNjrFr18jFaIpYl3l3yL18sM1tbKpOzZ5UhkCjgbjcFxEr
        WxqwtEs3Arp3uIcC1cvn/+uMS+QtiNLLdrTru1DxREAcp+KGlL6ESwqSeFnDBc7j
        ZFdT/25Bso7VKm3SZKoZOUWTl2Dy0o3IBi2EG2KQzZvb35Dy+dRigcZZvoVLVgS8
        7mCFOS0Bd79lmCfLhi4d6HdpmjQcU6+5pP7xzKh/zxe4ibbfJ61D55UGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=3gVs60z+GZXZnxMyWBUAI98Vy1vUJV8dXTwiEbS9uIY=; b=H/rd2lmy
        /MZXkXI0uPT9k8Jzu0qZ0lW3aFVBcGdrtY+sN7jZOzETg03URd6Ndldgv6v9YjkO
        yiYv1xLDLTxHCX44bjEQn6kw8mfPo35fLzbpyU9Ks6h1+PBQbjn6jmo63LSJFmoQ
        VW/XFvhsoo56RDuyHODkf9VoTeP72X/jf2o9/3YayamhNUW2Fst1m2+4rBGL6KAV
        eSVspKcgHrHPQeRhORSAitRgp1R1xw62t0o5zCi3m+9AALbyWWI4ehCLk7usBrqe
        byYv+eiWBiLecAL8f+d1Okf0D303+XE8eRtGwSYNMbTuV8WhdALjlGQPF06b2DAt
        peQ58/MvDGoUYg==
X-ME-Sender: <xms:g3NgYcl4qb4fb2DnGc66uGQN5p4fB8uIqzIUxoGRex5SQ9YA5Hc36Q>
    <xme:g3NgYb0f7198RKlXdp359PmQFtDGJ7_266vvIfhgzZgrwNW8pak5Ow6aIqj7C6jSb
    yIvAAzQs3LNZlExtqs>
X-ME-Received: <xmr:g3NgYaqp8M7xogGY7x_jPoQ3bh_Ohnlpj7BBE3_hjI0IM0XzenYggYiM4yXJNkkAdNuSzFhAPBb7scDOxmz_21ci7iqnksNfg8sAXJOullUmOVOjlmmP5zY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
    jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:g3NgYYllgm6C5UvPZECH3k0k_3ra92trSJaiMZyaAPxiBHzOHaXrdA>
    <xmx:g3NgYa0VTtmBnMDnWxRQDJzYU5YoFDuPdBivsmhwo13-G1Fz0ayNQQ>
    <xmx:g3NgYftEGzDjQlr6Yy1qyO1ypQhnG8xSuI5oRsfsW6XG51niwWMviA>
    <xmx:hHNgYV3tkezvN0V7k-8FV6c7RwL5xHOIAzJDP0BDVZh8nZTTleJmcw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:17 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] i2c: pasemi: Use io{read,write}32
Date:   Fri,  8 Oct 2021 18:35:23 +0200
Message-Id: <20211008163532.75569-3-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In preparation for splitting this driver up into a platform_driver
and a pci_driver, replace outl/inl usage with pci_iomap and
ioread32/iowrite32.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: replaced ioport_map with pci_iomap 

 drivers/i2c/busses/i2c-pasemi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index 20f2772c0e79..39fcc584264a 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi.c
@@ -20,6 +20,7 @@ static struct pci_driver pasemi_smb_driver;
 struct pasemi_smbus {
 	struct pci_dev		*dev;
 	struct i2c_adapter	 adapter;
+	void __iomem		*ioaddr;
 	unsigned long		 base;
 	int			 size;
 };
@@ -53,13 +54,13 @@ static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(&smbus->dev->dev, "smbus write reg %lx val %08x\n",
 		smbus->base + reg, val);
-	outl(val, smbus->base + reg);
+	iowrite32(val, smbus->ioaddr + reg);
 }
 
 static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 {
 	int ret;
-	ret = inl(smbus->base + reg);
+	ret = ioread32(smbus->ioaddr + reg);
 	dev_dbg(&smbus->dev->dev, "smbus read reg %lx val %08x\n",
 		smbus->base + reg, ret);
 	return ret;
@@ -351,6 +352,12 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 		goto out_kfree;
 	}
 
+	smbus->ioaddr = pci_iomap(dev, 0, 0);
+	if (!smbus->ioaddr) {
+		error = -EBUSY;
+		goto out_release_region;
+	}
+
 	smbus->adapter.owner = THIS_MODULE;
 	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
 		 "PA Semi SMBus adapter at 0x%lx", smbus->base);
@@ -366,12 +373,14 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 
 	error = i2c_add_adapter(&smbus->adapter);
 	if (error)
-		goto out_release_region;
+		goto out_ioport_unmap;
 
 	pci_set_drvdata(dev, smbus);
 
 	return 0;
 
+ out_ioport_unmap:
+	pci_iounmap(dev, smbus->ioaddr);
  out_release_region:
 	release_region(smbus->base, smbus->size);
  out_kfree:
@@ -384,6 +393,7 @@ static void pasemi_smb_remove(struct pci_dev *dev)
 	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
 
 	i2c_del_adapter(&smbus->adapter);
+	pci_iounmap(dev, smbus->ioaddr);
 	release_region(smbus->base, smbus->size);
 	kfree(smbus);
 }
-- 
2.25.1

