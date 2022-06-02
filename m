Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9336453B321
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jun 2022 07:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiFBFtE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jun 2022 01:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiFBFs5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jun 2022 01:48:57 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02809261468;
        Wed,  1 Jun 2022 22:48:50 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id A28D95C018C;
        Thu,  2 Jun 2022 01:48:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 02 Jun 2022 01:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
         h=cc:cc:content-transfer-encoding:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1654148927; x=1654235327; bh=ZkWyiuMGaq
        hYzjNzOrV/RtlVeW8kwzCl9Ncn1BIGaC8=; b=aa+qR82WJa1/b7eBx0E27Gq0nQ
        mhW1I88Jx3jHQuA/NgaG3e0+It9i0mNXJnvIYdOBkH1jfsM1ZDGlh0HvYh4Lr/oY
        y9oFauoMrmB3wOcDKSZYnaMHHZX9hkLvQRRAG9BiqrCx/qwe5wH+CJYyVml6pHgg
        rqPGhZ7JwYLkh2lEHAsPGxqkVc2ekMqeKQLrR9IZfX3B4JXdRpoHZeaRbAd+Urxp
        y4dsenCXNg80jMulda4pu7d+MSRhdm1R19BlyZp8WleJoOa6lyb9Mb9ohGbUb6dw
        V2/zPW9c1DOaB/xrI4uHqiKQ35+4YRAr3T8YIyqxdym0tBOJPFFmlFb5bn8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1654148927; x=1654235327; bh=ZkWyiuMGaqhYzjNzOrV/RtlVeW8kwzCl9Nc
        n1BIGaC8=; b=op4rbspCGhxXAGklNZ+NAoUzZ8fJhc0zp7Y17aNbOTnHEuWHDwJ
        MgMsmR9Zf+biBtHOScoc7X2gvZ+wM1dUnSVZasNJLJZ0V/oYuRSA2uCur596VGnJ
        LwLXo5xFm/uxioGSi7wB5HW00Bq1H2tasrtWEiV7mSgFL3EgpDy8YaWKiPmnu+tP
        wfhvZ46FNNzHgwV6eXXg8xS+1vodDhrIZM8eD+jK56ZUe2fG9R75sxkBCDNJoKGe
        jCE95JGdKb9AVQdtOV67eN6srP0UZSHq1Tm3hwe+l4g9KSxiA4BdxE5ZNBLPY+iX
        a6PsWyEUHsAFQnSsQIrcYD8NT5SxHnMLtwQ==
X-ME-Sender: <xms:Pk-YYoEx-IwVmjlXsMOVtprieeO2TuziQUrP5zSiart8wSgeD442jQ>
    <xme:Pk-YYhUWCctqIECKG1yQBnncHD2RQt6qFug2AYUzfu02QvMLOT611bIyVW6c4796a
    wB5i10drcT-Bz2bRZU>
X-ME-Received: <xmr:Pk-YYiKdcSXF3_X14_BUQjy0Y1NYiniN66fUpGSCnYY6SuU9JnEH2g9SyhTespBISx2A91CaMggJoGhKJ-z3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
    vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
    hnpedtleduhfegleehleeltdejffefjedtleeuvdfgteevffegtedvveekheeiieekteen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
    hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Pk-YYqHfx6DImBe0zMCShFo1uLiaaGs2mE6j_V1FYwqOVUxIYPN1Rg>
    <xmx:Pk-YYuWhtAq3v55W-v3Nt-G_SL3v0x-E0hmSoAWuyesSG6VlKK2b6w>
    <xmx:Pk-YYtNIXy5nCtdYo-KPk2Js84B-eDYSYwjipv0ROkztQdKjGMJpWA>
    <xmx:P0-YYnN3S-3FgQyPeZPx06hAacFFbzy9naLt4BeLQJ_h2mK_A8bhUA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 01:48:44 -0400 (EDT)
From:   Klaus Jensen <its@irrelevant.dk>
To:     linux-kernel@vger.kernel.org
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Wolfram Sang <wsa@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Klaus Jensen <its@irrelevant.dk>,
        Andrew Jeffery <andrew@aj.id.au>,
        Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] i2c: aspeed: do not mask SLAVE_MATCH
Date:   Thu,  2 Jun 2022 07:48:42 +0200
Message-Id: <20220602054842.122271-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Klaus Jensen <k.jensen@samsung.com>

When commit f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed
I2C driver") added slave mode support, the SLAVE_MATCH interrupt bit
(bit 7) was not added to INTR_ALL and so will never be set by the Aspeed
I2C controller.

Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
I am working on slave mode in QEMU and noticed that the device would not
generate the SLAVE_ADDR_RX_MATCH interrupt. This patch fixes it, but I
do not have a spec sheet on the Aspeed, so I am not sure if this is the
intended behavior?

 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 771e53d3d197..7f432babcd72 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -86,6 +86,7 @@
 #define ASPEED_I2CD_INTR_ALL						       \
 		(ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			       \
 		 ASPEED_I2CD_INTR_BUS_RECOVER_DONE |			       \
+		 ASPEED_I2CD_INTR_SLAVE_MATCH |				       \
 		 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
 		 ASPEED_I2CD_INTR_ABNORMAL |				       \
 		 ASPEED_I2CD_INTR_NORMAL_STOP |				       \
-- 
2.36.1

