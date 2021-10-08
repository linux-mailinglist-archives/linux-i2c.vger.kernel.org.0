Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A1A426F17
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 18:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbhJHQiW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 12:38:22 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:47521 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233392AbhJHQiS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 12:38:18 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9402558100D;
        Fri,  8 Oct 2021 12:36:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Oct 2021 12:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=OwK3RC4fOqjWl
        Xm4xt1aFkIyNma6xZxflBeyzs+OyHE=; b=YxUro9pLt/5PdYubed1b7e1a4icQn
        31MZZmP65fRAl/NEGYKaq3cyczEc+SMI9r3maOP5KzJgZHUtckufGt3vbkbkfFo2
        hwDNxwacOxqKHDZSyvCk2EVd7dj1lhjEylEU/NPe+Fui9LuGqg+0lrCA8Afy213B
        5mDZloDkGDaL1gCUHq62XI0ARbBJ6ceH1l7p6em5RzNUBVIGY0fOr/dzIJFXsgCK
        lGC3Rjl7bEqQpnfqILgKxA2cPfu3UwTUy4+L7Md6sNwCjamaG9WySkHZEyx/kFvF
        zak+9mFUfcQiwagdZTAhoZGq6rW81NGT2xRzv6hkD3R2UWCmWfCuXFe2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=OwK3RC4fOqjWlXm4xt1aFkIyNma6xZxflBeyzs+OyHE=; b=isQ9Mikc
        88/0MkVdkdB2pAeNOnd6KmmTMtbrv5iOI8Jfvj4VmJjGVNN/4mFaN6lJxxJYIMyL
        mUDW940vexg0qangYP0wZd7EYAaP6FqHpc1ApgzfUt60IF5eiW9vYUtyFNgaa2bq
        9Dmpl1/Ghs01quKtx7P2UxKN3k+F51zJnEe+T6pcRWjcX3Y44NaSbQFf7Mtz6n3B
        uEZPZdM31OGlh7HT+gZ+GAUP95Lo2zcN6FHlGQxcSHjDNNo4Xzx62cJCXyrrajoM
        RBG1W/DdAUIuKIgOmHaQG/0brBpuC5GQTwdE55O/ZXSFEAYBqjARJlZudKB+LFPH
        EVFHYPhDVH1FUw==
X-ME-Sender: <xms:hnNgYY5SPodqPp93a4DhAf9wCpHhP1Z8ezg2kl0ue-6FTQ7omlNDwg>
    <xme:hnNgYZ7WkhrQUVtsUpBHs42T8PASEc4SrZFkiya-utr9vGcyAUAvyp9PxX-1EIJBv
    6fjLuc78757GFqK_xs>
X-ME-Received: <xmr:hnNgYXetXxKne6oTCZBzkooKr5gnTQAbc90hdu6VBdgUHO3qVH7NfI5UnB-4QLxLoBhwGZmWWxodz59cBRFiRO-rL5TNYRxhhBoCp1xuidkbBE21jeEg8_Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
    jeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:hnNgYdIxLSlnEQVt7WFulQZ1a3aMaOQuwynOs-2bl3-4JtJd5h3yOw>
    <xmx:hnNgYcKm3GjLst2PdxSFPYQb_x2vYin0PANIm91x-yOrQJ4VfxSCCw>
    <xmx:hnNgYezog1sMjY8YhB-Pw9YYBdLf_4J62af-1-KpDno74R2wa0_grw>
    <xmx:hnNgYZ7BM5i_EaOSKqn7_DIj2MLN5DVRJeDC9hBpeCAX8ygmSv5K8Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:20 -0400 (EDT)
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
Subject: [PATCH v2 03/11] i2c: pasemi: Use dev_name instead of port number
Date:   Fri,  8 Oct 2021 18:35:24 +0200
Message-Id: <20211008163532.75569-4-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Right now the i2c adapter name includes the port number which can
indirectly be used to identify the device. Replace that with dev_name
to directly identify the device and to also allow this to work correctly
once we add platform support.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: new commit

 drivers/i2c/busses/i2c-pasemi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index 39fcc584264a..ca5a86cf53f1 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi.c
@@ -360,7 +360,7 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 
 	smbus->adapter.owner = THIS_MODULE;
 	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
-		 "PA Semi SMBus adapter at 0x%lx", smbus->base);
+		 "PA Semi SMBus adapter (%s)", dev_name(smbus->dev));
 	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
 	smbus->adapter.algo = &smbus_algorithm;
 	smbus->adapter.algo_data = smbus;
-- 
2.25.1

