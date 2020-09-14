Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E2F26930B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 19:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgINRXo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 13:23:44 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46521 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726459AbgINM2w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 08:28:52 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 9EA355C0144;
        Mon, 14 Sep 2020 08:28:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 14 Sep 2020 08:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=yREPY9pTTI4hx
        qsqJj7QajLwVXGtjBqDjp9qr2mdgcY=; b=iza1dbjSNbn5h+pmrN7lZMWMQ9XB6
        PdcF+/1YiAuzYkmknN1ibvE0leS9vz3ayM1NaHt5RCknMkyWOe2WlbfnMpB2PHJr
        tmoYiC7adpZi9WXJ76UfEw05UineoQQsVJZW/BKdbX7qojGH+pX4YryQ9wlJ926l
        Rq2S73Xxqy01tuMuEcQJ7nGckcAiODyRlUmdbbp6KjZM8uX2M206DKh2QudLntE2
        HkwLSkstGYieJ4udFufw54cLmE6PwI8ycEps+S9kPxt5QX4rkL41Meaiylr+Joej
        mGRizB5rpDFdNTa112MGBqrISPns27AvsQRlayEYGL+p+XN6dV08L2ZOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=yREPY9pTTI4hxqsqJj7QajLwVXGtjBqDjp9qr2mdgcY=; b=YBcniPL8
        JBh8IoGsQg5cPEd3XPWM7GVMb+SkwomsBjwIpO3aOAgtQJw57wMoGkUrMPRPdeeT
        KV/fvnbX09+aeGnqv1fsFXH9v6aEFhgMsdxZvuUOxWYw/XACUJZCEoYevrTM0gi8
        sCb8f8kf3HZUxXR/E7QbEx/6QpmmAn8lsddBz4Df1eDwPeVPOlH6CezkWhVotDfy
        1WhmmSVhac4buCWXsmXctg7eM1hxbqdnJFoMouBy95H17jWY81sWeux2bD3MP3NS
        r5WhE/giElhwg/Y6cx7m00HlQSyDatpQrwEL0i+McA+lYum1XM0tPMhjt8ixNYOx
        a9cll6SLvXtsBA==
X-ME-Sender: <xms:A2JfX_lpxOT7OUW-ArS-vilJRorA1vP447IR-2SiWCquThwWIe3dVQ>
    <xme:A2JfXy3xWMb7Q_Eson0-Jm-ewuzc8O47DQ5VrK7wdOIVdhBdJBOzm1HYudMNA3UtY
    PezrQwL-jjRJx4v-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
    vehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:A2JfX1p2aa_WARNxGBOZrBZZGTys-iAv1NU_Qdpl_VcferONTqOPJA>
    <xmx:A2JfX3msF9yrUoP9jPer5nJkhdNIOYsEkovg0MJXXK25gmqAzDS6dQ>
    <xmx:A2JfX93p2CRXuw-4avARl181QJrNcG2426-TlNBFY6ZYnoS9ghXNBw>
    <xmx:A2JfX4Q2C6--YYjW9-1RmZ474RyCur6h7eastegQfwneT09pb_Kn6A>
Received: from localhost.localdomain (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id EF3173064690;
        Mon, 14 Sep 2020 08:28:48 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, wsa@kernel.org,
        joel@jms.id.au, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] hwmon: (pmbus/ucd9000) Throttle SMBus transfers to avoid poor behaviour
Date:   Mon, 14 Sep 2020 21:58:11 +0930
Message-Id: <20200914122811.3295678-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914122811.3295678-1-andrew@aj.id.au>
References: <20200914122811.3295678-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Short turn-around times between transfers to e.g. the UCD90320 can lead
to problematic behaviour, including excessive clock stretching, bus
lockups and potential corruption of the device's volatile state.

Introduce transfer throttling for the device with a minimum access
delay of 1ms.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/ucd9000.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 81f4c4f166cd..a0b97d035326 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -9,6 +9,7 @@
 #include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/of_device.h>
 #include <linux/init.h>
 #include <linux/err.h>
@@ -18,6 +19,9 @@
 #include <linux/gpio/driver.h>
 #include "pmbus.h"
 
+static unsigned long smbus_delay_us = 1000;
+module_param(smbus_delay_us, ulong, 0664);
+
 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
 	     ucd90910 };
 
@@ -502,6 +506,8 @@ static int ucd9000_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
+	i2c_smbus_throttle_client(client, smbus_delay_us);
+
 	ret = i2c_smbus_read_block_data(client, UCD9000_DEVICE_ID,
 					block_buffer);
 	if (ret < 0) {
-- 
2.25.1

