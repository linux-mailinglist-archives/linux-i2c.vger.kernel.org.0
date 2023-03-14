Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C585C6BA1A2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 22:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjCNV6E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 17:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCNV6D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 17:58:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537D73B3ED;
        Tue, 14 Mar 2023 14:58:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF3C061A02;
        Tue, 14 Mar 2023 21:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C062CC433D2;
        Tue, 14 Mar 2023 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678831081;
        bh=FKDGeVBRwaxoOWMBCt8fO3bP4w/Sb6a/4zz73HfW2GM=;
        h=From:To:Cc:Subject:Date:From;
        b=Js33LhEUeTfXfH9hZTAVw07WzJTPANlJ7RUdDjxkyxPUSkPT7HEVGPdRYwyUc5ldg
         bwRPkCAI8QwyGCUyIXNbzn3DE3kEwkc8/7EduQn4uC/IItbgAs+u7lmQautBt4Dejn
         fdED3Bs80W+2WsscQ9OD3JQS9L9l6UKspUeKOhUQ77/SrjAhcQHtFccdbPhk79ug+O
         uSQsQNOFyuM4403yFnyWg5Grc1yUvmnpJ/r3LPzhhPedwnT2Hvv4suAojKJewTZQDF
         FMB4oPr2/eDWi5SMzCwXjWf10pqRdwNWcQAMnbZlzmpI+8sNZHshuhV28E6oUEGCyN
         L9bLORqYy1gnA==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 0/3] Add the clock stretching i2c property
Date:   Tue, 14 Mar 2023 22:56:09 +0100
Message-Id: <20230314215612.23741-1-andi.shyti@kernel.org>
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

The DTS schema change has been sent as github pull reqest[2][3].

Thanks Krzysztof and Chris for the reviews.

Thank you,
Andi

[1] https://lore.kernel.org/all/c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org/
[2] https://github.com/devicetree-org/dt-schema/pull/102
[3] https://github.com/devicetree-org/dt-schema/pull/103

Changelog
=========
v3 -> v4:
 - Replaced "i2c-scl-clk-low-timeout-ms" with
   "i2c-scl-clk-low-timeout-us". Use microseconds instead of
   milliseconds.
 - Add tags from Chris.

v2 -> v3:
 - Chris recommended to use of_property_read_u32() instead of
   of_get_property(). Because there were two use of it I added
   the suggested cleanup in a separate patch.

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

