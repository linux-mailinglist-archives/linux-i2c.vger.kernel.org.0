Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD058426F22
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 18:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbhJHQis (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 12:38:48 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51511 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238771AbhJHQib (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 12:38:31 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4CF92581015;
        Fri,  8 Oct 2021 12:36:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Oct 2021 12:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=EqH0ZsHiaEtwh
        Gi9zyJrCeQh7KgGC2k47TQ9WU71+SM=; b=qHzfzmqzTb5HjdBSQQUrPULx3wCyo
        vkDYdYvnmjYNIRJpNS6cgV3O1A5Wd96nHW1bzrhFRSZDNS2ZN5oPebwyQzSpWthn
        e21+jAVFN/zSZ6aYqA+18Cr5XHLu4xR9lnS9za8X9quhQUjbT0BdjdzEHNuVb5pl
        77iWZx8O+x0ZuqdplbIxIFUg1GZU7GnnJ5Hf7RHwuiIVdDUkWxoVVKt3WNFhMv8C
        iTYiVUllWaTeYMg0eg40XGjNY9k+d6ARTn5p9GfUd89Y+8gR+qDIGJV7NUSdaSCl
        2c/lRnZexw6HrcKewX1AtPkLdUpPCsAErWceJuUAkXQcKHOM+75YHBk1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=EqH0ZsHiaEtwhGi9zyJrCeQh7KgGC2k47TQ9WU71+SM=; b=NvieJBEY
        AqZCkkdT9cfTcHNcfv3MrAOB8DwlF13r3rjCasDMtlNTGNy1sLqplD6iFqTR+f2B
        6CdP4+zNaycV9ENcsLtr/wNvB8b49MJzrr4gMgAcwL0Ls3HLGBLO//8duqEwRhmg
        0oalKDfWcIp6jOWoXAGcNTi62ro+OWxwFkiZdBkSUbg9dlKTIKRmYXLE3s/AreqK
        ADWSGjjA2QFpD0vgOesbE6YLG0Zgi2SPB6y/gN7tzOP0FtM0jdUrDgGbFG14Fs9c
        mD9Q5NaKufYF8fRDS1RW/PS+86yVzdDOD7EajMgbbe/EI/Q0PewOZx0PK3ZfYVSW
        9P5e4FgYqfyJeQ==
X-ME-Sender: <xms:k3NgYY4Nq65ExKaZ6SRkRVCCPIJb0rHWsKhpvU0w_mHBLNxSx52IRA>
    <xme:k3NgYZ514PeCc5k96MhLQs3abyyO9bdjcvgVSG_58mOh6q3qMaIxccKd7GoixMmLb
    XVoV5w9DGr5Oij_rdA>
X-ME-Received: <xmr:k3NgYXdgRp1qsdyU58xOZlXu01o1WmJzVgP18LKCjqQgnyXKYGwqibN2yCmj9rhRoBIS1t5ZxLY1_AP2YsGS_1J70K4WocOrGRM5OOSmprwktNsaEejues4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
    jeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:k3NgYdJoOZYzZQJ4e37ZrgXc5_cYq04CJIL8Jauurk07vuWdrS1wqg>
    <xmx:k3NgYcIReoRbNBBfE4CxTd4z9lbHlfBWoR2YwzuggpzfniB1Y96c2Q>
    <xmx:k3NgYex3rC-H4EGr_JOb79L_Wa4RI8QosgdIjgR_3kQOGH2A7M_5tw>
    <xmx:k3NgYZ4AlFG08KKEOFy8jHziMXlxJcGnJyWbzU7MjDAHjNr1HR5gcg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:33 -0400 (EDT)
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
Subject: [PATCH v2 07/11] i2c: pasemi: Move common reset code to own function
Date:   Fri,  8 Oct 2021 18:35:28 +0200
Message-Id: <20211008163532.75569-8-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Split out common reset call to its own function so that we
can later add support for selecting the clock frequency
and an additional enable bit found in newer revisions.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 drivers/i2c/busses/i2c-pasemi-core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index d1cab11a4d50..232587c70a38 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -61,6 +61,12 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 #define TXFIFO_WR(smbus, reg)	reg_write((smbus), REG_MTXFIFO, (reg))
 #define RXFIFO_RD(smbus)	reg_read((smbus), REG_MRXFIFO)
 
+static void pasemi_reset(struct pasemi_smbus *smbus)
+{
+	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
+		  (CLK_100K_DIV & CTL_CLK_M)));
+}
+
 static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
 	unsigned int status;
@@ -135,8 +141,7 @@ static int pasemi_i2c_xfer_msg(struct i2c_adapter *adapter,
 	return 0;
 
  reset_out:
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 	return err;
 }
 
@@ -302,8 +307,7 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
 	return 0;
 
  reset_out:
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 	return err;
 }
 
@@ -335,8 +339,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 	/* set up the sysfs linkage to our parent device */
 	smbus->adapter.dev.parent = smbus->dev;
 
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 
 	error = i2c_add_adapter(&smbus->adapter);
 	if (error)
-- 
2.25.1

