Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FA74187FB
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 11:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhIZKBZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:25 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:34999 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230300AbhIZKBY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:24 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 32A1F580FC6;
        Sun, 26 Sep 2021 05:59:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 26 Sep 2021 05:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=NSjoTG7uIR9X1
        ggtIrb/y5LTCesEdfoXqS6PV7z9nz8=; b=oPm/T1qe+gvtr4k7fdYRk/qk+rSeH
        PKBrYlnGJUpEypAz/deYDIYNDp5/57KWK0ky9VKatAu2DGxj+vfmfffpoGxEp3bm
        x6Prazck1vZTf2L03BMxruqnT0QKm6PSumoIluiLMBgWBuSk4HAsUQ+Db0ODQLE8
        OkNkf1PWvI6HJlCsxUpIytB+WsWS5KFzS+UK5PU2x+U0VA/Su3BxdIdn0jmyFrw4
        b1ik0IukCbkiKGbXCWaY4qKAl5DKCHRGYWvzB3eyqp0B7lS0OynXPIRAiybjDFcB
        vGPZE3So3/lTWtd9Fgdn8WhzRwyt5FBmzEa5oUeBkh4xtv4csy95Xya3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=NSjoTG7uIR9X1ggtIrb/y5LTCesEdfoXqS6PV7z9nz8=; b=j4SnXb6r
        mFXGB/0Lk4s2BkgGeQa696+18pEJDTdgr8j/i9N18Dtv1ApVT0nnq7ElishSaewr
        vV0yTQq1bfAaT58TSjSPgep1X2TlfxqOqRnjE3NvGMx4mpfl7SzCO2mJg7/Q1+is
        fprJ6FhfNjsf3oE8oAg1LWy0oP9/g6CeLa0HTih9gHaNYbuapUuJgbXmoy4RbX65
        PUurgalZ/xd/vHCMXE3p3IUt4ulNEsIhFA1YfD4pi/VS96Gtj1WP/oce+nrq/lMq
        7IIsgUe9HV2Mnbo+JqtA94r5BXTq0j3h7DBSCU1fj1DPSq26oUEDISZyQAR4LrkW
        DA/p+jJVgu9Byw==
X-ME-Sender: <xms:lERQYQlYXdavBivTINqZm-m2SM5jfRI36xOx8b71NEVI1RDzshar8g>
    <xme:lERQYf2tGGHtsT9W-euk7HVnsauThksZw2A1M4GnEgrJnEPlh7q_2U8TXaE2bh9NL
    pSJIoJgOWFJIdRQH9k>
X-ME-Received: <xmr:lERQYeq6b0bWuyH3foqX5g32BwxGm44pXLWOqsDGh_fLQbMIKlo1Qjcukge5qx_HkZ_DwY84tTlVVu1U91mELAmwXEIVhhvNa1_QYtKGx6_2pQm0gzPzsqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:lERQYck9HOAdlBt6QQb8wsY2G0Uqup7Ucp9yQIPniqtRq5NcIE6ltg>
    <xmx:lERQYe2oGEtYuie3afy8v3s7irmY-jqvguIm8QjB-meno06fdhFp0w>
    <xmx:lERQYTt3p-Jk8j4OpURw7xpDhfd2VUxpAt6PbhS8EhNfiK-9vMjsag>
    <xmx:lERQYR35ZVt_mqwxy0tB5Tofxsnjk0AZ40EIDrWA2DRhB-ICongtTA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:46 -0400 (EDT)
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
Subject: [PATCH 04/10] i2c: pasemi: Split off common probing code
Date:   Sun, 26 Sep 2021 11:58:41 +0200
Message-Id: <20210926095847.38261-5-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Split off common probing code that will be used by both the PCI and the
platform device.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi.c | 39 +++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index 5a25c2e54b9e..9d69ff63f674 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi.c
@@ -329,6 +329,30 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= pasemi_smb_func,
 };
 
+static int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
+{
+	int error;
+
+	smbus->adapter.owner = THIS_MODULE;
+	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
+		 "PA Semi SMBus adapter at 0x%lx", smbus->base);
+	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	smbus->adapter.algo = &smbus_algorithm;
+	smbus->adapter.algo_data = smbus;
+
+	/* set up the sysfs linkage to our parent device */
+	smbus->adapter.dev.parent = smbus->dev;
+
+	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
+		  (CLK_100K_DIV & CTL_CLK_M)));
+
+	error = i2c_add_adapter(&smbus->adapter);
+	if (error)
+		return error;
+
+	return 0;
+}
+
 static int pasemi_smb_probe(struct pci_dev *dev,
 				      const struct pci_device_id *id)
 {
@@ -358,20 +382,7 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 		goto out_release_region;
 	}
 
-	smbus->adapter.owner = THIS_MODULE;
-	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
-		 "PA Semi SMBus adapter at 0x%lx", smbus->base);
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
-	smbus->adapter.algo = &smbus_algorithm;
-	smbus->adapter.algo_data = smbus;
-
-	/* set up the sysfs linkage to our parent device */
-	smbus->adapter.dev.parent = smbus->dev;
-
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
-
-	error = i2c_add_adapter(&smbus->adapter);
+	int error = pasemi_i2c_common_probe(smbus);
 	if (error)
 		goto out_ioport_unmap;
 
-- 
2.25.1

