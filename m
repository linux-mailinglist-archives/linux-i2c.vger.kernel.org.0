Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD7359F551
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 10:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbiHXIbP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 04:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235275AbiHXIbO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 04:31:14 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12220C50;
        Wed, 24 Aug 2022 01:31:12 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id C362BE000B;
        Wed, 24 Aug 2022 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661329871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fp/LvLni8L5ia8eUl9lx0vqRfmrsJnYcSLIKmlvSrRc=;
        b=XaG3W7hzfaVuelr8ijlwv26usPmpRDEhLkBqblTU+DhdeFBU8UmS2OmR/pUBgKa9XL+i6J
        C5utpOhAnUl6E0dULa8xd4dRD91Tg5hOZy/4zxGldDpbQa/KlBEato7bJgkTAg99P+TY/y
        6cohUSAsp9OXwNJ2GYCc5QXlkNFrd3OdMqz4SZrJwzOB64xapwwOHO+2allpnNkcYyaS5Y
        I9D8tjaDQl1WvJK+tIPZ50HRDU4J6ZLK+ng5WoMv+CuDsOJLIP7uFTxEJoHc2vvRH/dT3k
        r+O5YcliNWTvAK70EDra5RX5K9zC8KysVhLv+9trtO/468KGmGgI76fnlSSzFQ==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v3 1/3] docs: i2c: i2c-topology: fix typo
Date:   Wed, 24 Aug 2022 10:31:02 +0200
Message-Id: <20220824083104.2267000-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824083104.2267000-1-luca.ceresoli@bootlin.com>
References: <20220824083104.2267000-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

"intension" should have probably been "intention", however "intent" seems
even better.

Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Acked-by: Peter Rosin <peda@axentia.se>

---

Changed in v3:
- moved as first patch (Bagas)

Changed in v2:
- this patch is new in v2
---
 Documentation/i2c/i2c-topology.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 7cb53819778e..c9ed3b4d6085 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -103,7 +103,7 @@ ML2. It is not safe to build arbitrary topologies with two (or more)
      I.e. the select-transfer-deselect transaction targeting e.g. device
      address 0x42 behind mux-one may be interleaved with a similar
      operation targeting device address 0x42 behind mux-two. The
-     intension with such a topology would in this hypothetical example
+     intent with such a topology would in this hypothetical example
      be that mux-one and mux-two should not be selected simultaneously,
      but mux-locked muxes do not guarantee that in all topologies.
 
-- 
2.34.1

