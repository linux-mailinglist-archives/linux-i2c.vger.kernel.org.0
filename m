Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD81426F24
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 18:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239288AbhJHQiv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 12:38:51 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45125 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239512AbhJHQid (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 12:38:33 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id BF049581017;
        Fri,  8 Oct 2021 12:36:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Oct 2021 12:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=wjaNOvoPfH5mR
        fPiYoh4MKVRamUagf3VG7kW7qVwEyI=; b=PVRXKF1MDnHNQ8uwHshftgIhfsaJI
        aPYojnjSAysotdtPE4uG4rVqDSwkfNWxMo0/MPrfOE2OkDcMyf7a87Nv8CRaFAuj
        brQ0MvI/CpTX1eS1ZBMf6e0Eu9DDj8Vm0pxG+mqf/PRiqidH0CASutdviTeHV1Dd
        D5egebv34yjpOFFxcdQZknWCh/mtJz2ZdaFqVyXKlPT34DXoax4eJKDwKpP0JUNQ
        TdtXu2Q1xv2aMaPCQYQESdr+kilumrM4wdThImE8b9LXPFV7dO5DGDcr+TXdrv/T
        9O5eHymO84HmljQx81CkFy/dy8Um3EuXGOvD8Pdds+g7RvjfDaUd64zsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=wjaNOvoPfH5mRfPiYoh4MKVRamUagf3VG7kW7qVwEyI=; b=GWgCb98T
        q6hh5DECoOk+pLf5s6cxti9ythS78R2SrH4KZpfzpp5jpYeglh8sCj157as5lqrN
        yDBy9+jnipIB7gruh5Mbdhw2jss+vPpEvzGu/aK1z07EH2mZaKI28ezjTuz/ccfU
        ox9ALfGBfIons666iCFICd7metvKeHiY4yxl04QITuXwKUo+hyLbrzDLwMk4oAtR
        INDuuB6qhMhADBEKHQVCcpWVVpEsaGJGkG/W6812C5PhIH76YfKyDEfwtyKJVwCC
        2I+3G6Sv780CHuKqhGyW0DsesBMOlL/4KhvgaWTGSrHf30hy0PZ+2HK3u1aTyTNG
        se1zZ0jUd4pXEA==
X-ME-Sender: <xms:lXNgYU52B-kzluMh4yrUtqf6bsLdz0HTnenUZ0MCOy1seZxO6as9YQ>
    <xme:lXNgYV6PVejOmsy9XjlZO2sZdsV4ouUMnxsVY7B9eRvX0E76GtpqtvAYBNYxGbSqH
    kHT5bEuDD03zGMQCBk>
X-ME-Received: <xmr:lXNgYTfXRHFK9UD49ZhhpSfeMIa_BUJtJxbiTmKlStZKG420XzSBDrDTd9rtGPuxjdCqYiojG36CfgaGeOMslMvTali7cliuoPt2vHlSQTdFLFHau-k595o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
    jeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:lXNgYZJ4QnEBFJsyTVqtymxw9zAwLAnQPSLMD0gIKa0BI3CHWo8Osg>
    <xmx:lXNgYYJGfPCbD6IAra3HYa4et8KQlrQO4kDY6mTHW6bYPDMH0vTxjA>
    <xmx:lXNgYaxtAUmJ7u6YM8Y_oNUBuFRYHrS1AZyZ75eUkfaIaaDKGPwCBg>
    <xmx:lXNgYV6CMnK6p61SFJNw8GFT--E8HibQvJWtLLM6Cf8-8jo4kSv1DQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:35 -0400 (EDT)
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
Subject: [PATCH v2 08/11] i2c: pasemi: Allow to configure bus frequency
Date:   Fri,  8 Oct 2021 18:35:29 +0200
Message-Id: <20211008163532.75569-9-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Right now the bus frequency has always been hardcoded as
100 KHz with the specific reference clock used in the PASemi
PCI controllers. Make this configurable to prepare for the
platform driver.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 drivers/i2c/busses/i2c-pasemi-core.c | 8 +++-----
 drivers/i2c/busses/i2c-pasemi-core.h | 1 +
 drivers/i2c/busses/i2c-pasemi-pci.c  | 4 ++++
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 232587c70a38..9fb8fac53f2b 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -39,9 +39,6 @@
 #define CTL_MTR		0x00000200
 #define CTL_CLK_M	0x000000ff
 
-#define CLK_100K_DIV	84
-#define CLK_400K_DIV	21
-
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(smbus->dev, "smbus write reg %lx val %08x\n",
@@ -63,8 +60,9 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+
+	reg_write(smbus, REG_CTL, val);
 }
 
 static void pasemi_smb_clear(struct pasemi_smbus *smbus)
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
index 7acc33de6ce1..30a7990825ef 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.h
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -14,6 +14,7 @@ struct pasemi_smbus {
 	void __iomem		*ioaddr;
 	unsigned long		 base;
 	int			 size;
+	unsigned int		 clk_div;
 };
 
 int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 644656e28012..96585bbf8c24 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -17,6 +17,9 @@
 
 #include "i2c-pasemi-core.h"
 
+#define CLK_100K_DIV	84
+#define CLK_400K_DIV	21
+
 static struct pci_driver pasemi_smb_pci_driver;
 
 static int pasemi_smb_pci_probe(struct pci_dev *dev,
@@ -35,6 +38,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	smbus->dev = &dev->dev;
 	smbus->base = pci_resource_start(dev, 0);
 	smbus->size = pci_resource_len(dev, 0);
+	smbus->clk_div = CLK_100K_DIV;
 
 	if (!request_region(smbus->base, smbus->size,
 			    pasemi_smb_pci_driver.name)) {
-- 
2.25.1

