Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A706B6C94
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 00:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjCLXgq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 19:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCLXgp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 19:36:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38337298F1;
        Sun, 12 Mar 2023 16:36:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BA88EB80D65;
        Sun, 12 Mar 2023 23:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F45C433EF;
        Sun, 12 Mar 2023 23:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678664201;
        bh=AfguMXV3wShDapxuddDUc/QN7LO/Tpvnjh3XCp7WNHA=;
        h=From:To:Cc:Subject:Date:From;
        b=LCKOaW0VKSlJsBj2xi4Mvq4DfO1euPd1SddYnfYB68ETOSYnh/FV+twiGUJoM2Via
         ynf5QVNZZbAE+7fXy08tCa52TrvvrBScw+bg7ZIde7Yp7KOGRgD3tDeJJOwmatk1l0
         Dh3BnF20/iu87Y+pMDbVCh6sAY/18tDlzPWTwR7R5OiAKS3mSGJCg6GrRQ+4p9G4fm
         7x/9Ep/PNBAxazQ4krCCf+yuaaevvo95w2sC3qOKwto+B083EysXNXNPg5CqhNdtVn
         c9i02/u69JVKyz40oVq5Sb6Og91srpX/hFY7jhHjzAhtXOGLM9m0HiKutchOo1qbWB
         zSb95utvcYneg==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v3 0/3] Add the clock stretching i2c property
Date:   Mon, 13 Mar 2023 00:36:10 +0100
Message-Id: <20230312233613.303408-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
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

Thanks Krzysztof and Chris for the reviews.

Thank you,
Andi

[1] https://lore.kernel.org/all/c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org/
[2] https://github.com/devicetree-org/dt-schema/pull/102

Changelog
=========
v2 -> v3:
 - Chris recommended to use of_property_read_u32() instead of
   of_get_property(). Because there were two use of it I added
   the suggested cleanup in a separate patch.
 - Added Chris r-b in patch 3.

v1 -> v2:
 - Removed the binding patch and send through a different channel
 - To ensure back compatibility, which was broken in v1, the
   legacy "fsl,timeout" has not been removed and marked as
   deprecated. In the driver the that property is checked anyway
   as a fallback in case the main i2c-scl-clk-low-timeout-ms is
   missing.

Andi Shyti (3):
  dt-bindings: i2c: mpc: Mark "fsl,timeout" as deprecated
  i2c: mpc: Use of_property_read_u32 instead of of_get_property
  i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c property

 .../devicetree/bindings/i2c/i2c-mpc.yaml      |  3 +-
 drivers/i2c/busses/i2c-mpc.c                  | 35 ++++++++++++-------
 2 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.39.2

