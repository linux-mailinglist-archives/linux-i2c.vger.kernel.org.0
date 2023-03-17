Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B45126BF656
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Mar 2023 00:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjCQXd7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 19:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjCQXd6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 19:33:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FDE2BEF1;
        Fri, 17 Mar 2023 16:33:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 93E14B8271A;
        Fri, 17 Mar 2023 23:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65FFC433EF;
        Fri, 17 Mar 2023 23:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679096033;
        bh=9prhwRKhzG2EriELrZKrFDwG1YyNTCyqWnQwXfavk0U=;
        h=From:To:Cc:Subject:Date:From;
        b=X/lv161amq/lnmmvbUSTTL6jY5rEQoF1flM1svRuRvYRctUrDUCYI0g6lOaM8c3jz
         /FEbH2bDlORF2PVFD/FR3CBYugEx0bW5dV34NXVBz0VXf05w0JvE3sTZAE19p7tJ8D
         ytBmlvDz/tWYzrrun7PREYDO/9x+oc5xlky5qhBsGbMHjIoSCm9TiAUs2RC6yWOLAO
         3e7xV1jN4992gC/V4W89zdSPZe4Jk9U7TWJcKH30vWGLKhqXAe/vXcIiMe99c9lrk0
         wQABPmdq+oFT/HEg9F94l65mvNrN8sKzzqc+otuMO+EITFQUb1ozudlMuE61M03L9V
         rJqUippVZynuQ==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v5 0/3] Add the clock stretching i2c property
Date:   Sat, 18 Mar 2023 00:33:35 +0100
Message-Id: <20230317233338.424864-1-andi.shyti@kernel.org>
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

The DTS schema has been applied in commit c83dd2cb836e ("schemas:
i2c: Add the clock stretching property").

Thanks Krzysztof, Chris and Rob for the reviews.

Thank you,
Andi

[1] https://lore.kernel.org/all/c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org/

Changelog
=========
v4 -> v5:
 - Add the clock stretching i2c property
 - Added r-b from Rob Herring in Patch 1 and from Krzysztof in
   Patch 3.

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
  i2c: mpc: Use i2c-scl-clk-low-timeout-us i2c property

 .../devicetree/bindings/i2c/i2c-mpc.yaml      |  3 +-
 drivers/i2c/busses/i2c-mpc.c                  | 35 ++++++++++++-------
 2 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.39.2

