Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21AA56B668F
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 14:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjCLNVp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 09:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjCLNVo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 09:21:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FF3DBD4;
        Sun, 12 Mar 2023 06:21:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0DA7660F1E;
        Sun, 12 Mar 2023 13:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AAAC433EF;
        Sun, 12 Mar 2023 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678627188;
        bh=/2pSrab/BdlS035nX+TR/7j8ix3IWMUEeMSxa/xOPb4=;
        h=From:To:Cc:Subject:Date:From;
        b=jLDPS9EwwB62fm+VNqlM4Uh6V4MtV1GhN5zvg9WklPTMHU0JqQjFalx81rRCSBbxo
         9BuY9EWlNpMbbggEls/7blerMi0LTZDmnksiKGyePglZ6x2t7B8L6OUm0LHcj8KYOG
         5Phcm7A+S+ttkHrvh9DrvQhS1WwjqOZPCk/IAowGQUf94yTPokTnf4EBHzoDZN31sO
         7X2YFF5jRxKF8mY+HoZRVcrLDrbnAACwjqmtPL20hvk31DKLct5wWG0TEU3pV0fi7l
         sdkj1tpyD2B2U3d6G7Wp7dR5d4/LaOmePnjhMn+VjASilU+8KgGDBBVFLXuSpRbF04
         jPbeCXPBIlrQA==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 0/2] Add the clock stretching i2c property
Date:   Sun, 12 Mar 2023 14:19:31 +0100
Message-Id: <20230312131933.248715-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

fter a discussion between Krzysztof and Ryan[*], it has become
apparent that the i2c binding is lacking the definition of a
property that needs to be added at a more generic level. This
property is also used by the mpc i2c controller, which has been
updated in the second patch.

As it has been several years since I worked with DTSs, I hope
that I have done everything correctly.

Thank you,
Andi

[*] https://lore.kernel.org/all/c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org/

Andi Shyti (2):
  dt-bindings: i2c: Add the clock stretching property
  i2c: mpc: Use the i2c-scl-clk-low-timeout-ms property

 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 12 ++++++------
 Documentation/devicetree/bindings/i2c/i2c.txt      |  9 +++++++++
 drivers/i2c/busses/i2c-mpc.c                       |  3 ++-
 3 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.39.2

