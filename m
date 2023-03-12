Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBD1C6B6755
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 15:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjCLO4U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 10:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjCLO4T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 10:56:19 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF08F367E2;
        Sun, 12 Mar 2023 07:56:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4B6A0CE018B;
        Sun, 12 Mar 2023 14:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344B0C433D2;
        Sun, 12 Mar 2023 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678632975;
        bh=O9VyONJV8bXTAXAxdO735juF7mWGhqxueQgOPD3Zlm4=;
        h=From:To:Cc:Subject:Date:From;
        b=TkhbKouQoYVY70rnKG1cvJ7droHy3VCb7v7YFdXd9jNqnliBVvH5cUWNv8yd9oJ2c
         jDPIq1tLBWM0B3pzVqJL+rMgtxWjVipSbCRqojuOC6Vn2DqHJgkR51oFYQZU22leFl
         KMUgn9yhIYHmDUOAqJc+RzV0/iU011B7fDqHuAKP2zNCMvD4ZYb8VfvWXulJIA4Jxr
         Q8I3qcZ2qrlgPp3/SsY6aen6vbGU65eyeQDCr66sgOu43+sjHb3RSV0Gp6yHZ5HfOh
         R3+mROzUfqKHGE3Z+bsyFAHvCmucaU/v+uhhfiQ71Fe+NKBdHGa6EkaSV7S1pdeWCy
         8WUPijadr5unw==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 0/2] Add the clock stretching i2c property
Date:   Sun, 12 Mar 2023 15:55:44 +0100
Message-Id: <20230312145546.262492-1-andi.shyti@kernel.org>
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

fter a discussion between Krzysztof and Ryan[1], it has become
apparent that the i2c binding is lacking the definition of a
property that needs to be added at a more generic level. This
property is also used by the mpc i2c controller, which has been
updated in the second patch.

The DTS schema change has been sent as github pull reqest[2].

Thanks Krzysztof for the review.

Thank you,
Andi

[1] https://lore.kernel.org/all/c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org/
[2] https://github.com/devicetree-org/dt-schema/pull/102

Changelog
=========
v1 -> v2:
 - Removed the binding patch and send through a different channel
 - To ensure back compatibility, which was broken in v1, the
   legacy "fsl,timeout" has not been removed and marked as
   deprecated. In the driver the that property is checked anyway
   as a fallback in case the main i2c-scl-clk-low-timeout-ms is
   missing.

Andi Shyti (2):
  dt-bindings: i2c: mpc: Mark "fsl,timeout" as deprecated
  i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c property

 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml |  3 ++-
 drivers/i2c/busses/i2c-mpc.c                       | 11 ++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.39.2

