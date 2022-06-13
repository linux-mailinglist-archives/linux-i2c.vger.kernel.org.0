Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72E5549B88
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 20:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245543AbiFMSat (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 14:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245572AbiFMSaa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 14:30:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB63CB82F4
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jun 2022 07:47:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C76E61411
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jun 2022 14:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CC9C34114;
        Mon, 13 Jun 2022 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655131641;
        bh=8NrOTFkr6UjbhKP0ucbJXtgrRbExlq44n0JdP1jbprc=;
        h=From:To:Cc:Subject:Date:From;
        b=VaduQ+V0WESbvUq2PGsiJYmXlDU7mHboEqCs+eW1ilQvMFzjzTqcBcq79efYssnSW
         6jlN84mTBV6wuEP/rb0i+18h9mQkZ3uiuovxtin1ieenkaQCFH+j9qWC1yex4o81IQ
         ImFY7yJSc5HW1zURaxTQLlU049o6DSdh5a2779FYH4ckA9cLMxaAgjsMOoyaybaRnp
         vIaJA/sDQ24t9GsuRvQVoBIS+2cGGd7tgJt7jwhSspSt75Jl3gPKRq9VLgW1l4L4em
         PXfTyDQfeb09TXIENrnfjEt4PhmR/nkAngW2dQuKKYVp0ocaCrgeo3Hxhu5XVY7t5G
         NM/OW3vUgJBiQ==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] MAINTAINERS: core DT include belongs to core
Date:   Mon, 13 Jun 2022 16:47:13 +0200
Message-Id: <20220613144713.23501-1-wsa@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

I think it is complete now. Thanks to Lukas for the pointer.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6de26c5bd5d..c512a083d659 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9268,6 +9268,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
 F:	Documentation/devicetree/bindings/i2c/i2c.txt
 F:	Documentation/i2c/
 F:	drivers/i2c/*
+F:	include/dt-bindings/i2c/i2c.h
 F:	include/linux/i2c-dev.h
 F:	include/linux/i2c-smbus.h
 F:	include/linux/i2c.h
-- 
2.35.1

