Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83708418803
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 12:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhIZKBg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:36 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58339 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230522AbhIZKBd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:33 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 06103580FD7;
        Sun, 26 Sep 2021 05:59:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 26 Sep 2021 05:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=MiY3vPnmv1t1u
        25vIPIu3crGvGJdIxD82pjD4t4lZP8=; b=Ud8bDaAItoP39qCj2/S6Td0uWjCJU
        8PEDSC65vYQtfb8MAlreERPbuTs26RSzT3Yu8kkj9XnkqAmCNNX1PlJm2cHULW0y
        zwZOT/jSB/P3YHrC4t1QznbWkalDS+GJJtq3U0didE5hMHGObO8XsZuYFfeIoFYg
        v42eVfmGyUNeIDGMKseKLUYTFNIDIunWkfNl3IIfltkMJdSwKcTQ/l9HvKPjzqBM
        FS40dvwCPnvnVH/YxQywVi0gSrOoVlCw+f3cWjUnEcPIYhUEl+1PXYm6A0TYIhFc
        17/1j+hS4HzUdXwTLoMf+la98GvaaJq2us0/NlljrOoKqFcrhpNIwaS3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=MiY3vPnmv1t1u25vIPIu3crGvGJdIxD82pjD4t4lZP8=; b=vKfT/rej
        EUAGjcr3Cnhu5x9rxt23tMGY5KAzUQqongzZI8H302dTNuMrP6jQr9Fmo+dWpOUe
        PvPiAmH8TSWMG5QyEdUVhru6EeaXHQI/MV4uhhmgtqdIwaehzgtD3wu6Wr1samd2
        1MVdHJ9rR1nphfamY/eiUEnBl2jwEbMV6FgKyer9bNAtpgtA5fVZECFd9a/hDw79
        /J8CP7Q7fxoJdMyEE8iJVxfTcIAATOAdQKOdnAVYiEfeC3jnqETgi2Pyw7U1NEeW
        RVjyqzSE0fJ4iuxYm/SbZtwr6WtHhbd5N5SjwDqFnIBHV1TBEHaR5pzkp/NwZ2h+
        qLLo3/RdnE2lPQ==
X-ME-Sender: <xms:nERQYUpTfC5MEFpDS3DekmMDvdxupz38HlXJQWFY7s4DJxgtyAo6Lg>
    <xme:nERQYaoO8rlLg_4Ku3-1gK9XtQ-ID6zQxHE04EEM8sk73BM06aqCwfJkKPcz9gOqH
    2UhNvomumkd61Tx8Lk>
X-ME-Received: <xmr:nERQYZNSVY3fpmElKZhtRP-yOlnbp3TXZDj0sKusorPYd9naToUmXIiikRNQ5MpoO5kr82805nHsH9LDLMWxac2iBNI9gF7ULFuOtNsKhVbd_VAmC5388GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:nERQYb6m67Nykz1DTBtvdibP1bJC-HS5-e_ZFUdyzndMLcuq26k5nA>
    <xmx:nERQYT53kApKFDmd-Ka1n3YKUK6XItQjkG5pKmp_r86fNUTT8CSHrg>
    <xmx:nERQYbgVs3zWL2pN7xckuWHRJFrVRg4n8juNaVM4URbTrVyszSf67Q>
    <xmx:nURQYaI3fkvhhqA0LyWzYdT9qYdMM-USZbY3yMLsKgw6WyMTLGccLw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:54 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] i2c: pasemi: Refactor _probe to use devm_*
Date:   Sun, 26 Sep 2021 11:58:45 +0200
Message-Id: <20210926095847.38261-9-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Using managed device resources means there's nothing left to be done in
pasemi_smb_pci_remove and also allows to remove base and size from
struct pasemi_smbus.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 10 +++----
 drivers/i2c/busses/i2c-pasemi-core.h |  2 --
 drivers/i2c/busses/i2c-pasemi-pci.c  | 45 ++++++++--------------------
 3 files changed, 16 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index a39e3258b162..0ec65263fd08 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -41,8 +41,7 @@
 
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
-	dev_dbg(smbus->dev, "smbus write reg %lx val %08x\n",
-		smbus->base + reg, val);
+	dev_dbg(smbus->dev, "smbus write reg %x val %08x\n", reg, val);
 	iowrite32(val, smbus->ioaddr + reg);
 }
 
@@ -50,8 +49,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 {
 	int ret;
 	ret = ioread32(smbus->ioaddr + reg);
-	dev_dbg(smbus->dev, "smbus read reg %lx val %08x\n",
-		smbus->base + reg, ret);
+	dev_dbg(smbus->dev, "smbus read reg %x val %08x\n", reg, ret);
 	return ret;
 }
 
@@ -329,7 +327,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	smbus->adapter.owner = THIS_MODULE;
 	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
-		 "PA Semi SMBus adapter at 0x%lx", smbus->base);
+		 "PA Semi SMBus adapter at 0x%p", smbus->ioaddr);
 	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
 	smbus->adapter.algo = &smbus_algorithm;
 	smbus->adapter.algo_data = smbus;
@@ -339,7 +337,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	pasemi_reset(smbus);
 
-	error = i2c_add_adapter(&smbus->adapter);
+	error = devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
 	if (error)
 		return error;
 
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
index 30a7990825ef..aca4e2da9089 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.h
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -12,8 +12,6 @@ struct pasemi_smbus {
 	struct device		*dev;
 	struct i2c_adapter	 adapter;
 	void __iomem		*ioaddr;
-	unsigned long		 base;
-	int			 size;
 	unsigned int		 clk_div;
 };
 
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 7405e0b48514..c1b8901110c0 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -26,57 +26,37 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 				      const struct pci_device_id *id)
 {
 	struct pasemi_smbus *smbus;
+	unsigned long base;
+	int size;
 	int error;
 
 	if (!(pci_resource_flags(dev, 0) & IORESOURCE_IO))
 		return -ENODEV;
 
-	smbus = kzalloc(sizeof(struct pasemi_smbus), GFP_KERNEL);
+	smbus = devm_kzalloc(&dev->dev, sizeof(*smbus), GFP_KERNEL);
 	if (!smbus)
 		return -ENOMEM;
 
 	smbus->dev = &dev->dev;
-	smbus->base = pci_resource_start(dev, 0);
-	smbus->size = pci_resource_len(dev, 0);
+	base = pci_resource_start(dev, 0);
+	size = pci_resource_len(dev, 0);
 	smbus->clk_div = CLK_100K_DIV;
 
-	if (!request_region(smbus->base, smbus->size,
-			    pasemi_smb_pci_driver.name)) {
-		error = -EBUSY;
-		goto out_kfree;
-	}
+	if (!devm_request_region(&dev->dev, base, size,
+			    pasemi_smb_pci_driver.name))
+		return -EBUSY;
 
-	smbus->ioaddr = ioport_map(smbus->base, smbus->size);
-	if (!smbus->ioaddr) {
-		error = -EBUSY;
-		goto out_release_region;
-	}
+	smbus->ioaddr = devm_ioport_map(&dev->dev, base, size);
+	if (!smbus->ioaddr)
+		return -EBUSY;
 
 	error = pasemi_i2c_common_probe(smbus);
 	if (error)
-		goto out_ioport_unmap;
+		return error;
 
 	pci_set_drvdata(dev, smbus);
 
 	return 0;
-
- out_ioport_unmap:
-	ioport_unmap(smbus->ioaddr);
- out_release_region:
-	release_region(smbus->base, smbus->size);
- out_kfree:
-	kfree(smbus);
-	return error;
-}
-
-static void pasemi_smb_pci_remove(struct pci_dev *dev)
-{
-	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
-
-	i2c_del_adapter(&smbus->adapter);
-	ioport_unmap(smbus->ioaddr);
-	release_region(smbus->base, smbus->size);
-	kfree(smbus);
 }
 
 static const struct pci_device_id pasemi_smb_pci_ids[] = {
@@ -90,7 +70,6 @@ static struct pci_driver pasemi_smb_pci_driver = {
 	.name		= "i2c-pasemi",
 	.id_table	= pasemi_smb_pci_ids,
 	.probe		= pasemi_smb_pci_probe,
-	.remove		= pasemi_smb_pci_remove,
 };
 
 module_pci_driver(pasemi_smb_pci_driver);
-- 
2.25.1

