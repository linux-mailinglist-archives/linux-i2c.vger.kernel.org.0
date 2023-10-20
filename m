Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B297D12B7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Oct 2023 17:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377701AbjJTPa0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Oct 2023 11:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377601AbjJTPa0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Oct 2023 11:30:26 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8168D1A8;
        Fri, 20 Oct 2023 08:30:23 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 98EF4C000A;
        Fri, 20 Oct 2023 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697815821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=UnpnmeYe94FI9Jfaf1RckC7fZwJT75cGxhssDXRtfLA=;
        b=a6if/b3SxaI+6gCiPw/KJlnsg/xbge9hbOApvWT9BcBUmIPuNcGXH4DVGZmJtFBBofYzD4
        Sc8ahz78YsknF/xDUjPRcktF3h4jDhnneh86GA7DcoTHq44B7yu+92+EBMVFjKS+hQDPL2
        a/gKqbAcwAojaTnznhpm2O6POVI2OoXow+3FFr65mMWTpKg4Y1f4zMeq64dT1RSKLp95u3
        cDx0gUMG/qk5lY0IHks90EsEUYgu7rPdZfmMhQ2aAUFs8KYHVKLaxt83Qv9+q72CMexeIA
        QQf1HHc5tyaFfqDYQJ7AjooUAmOVAl4sKJprFDrgaxxIlBPjpCSvY15RXcjpGg==
From:   Herve Codina <herve.codina@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>,
        Stephen Warren <swarren@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 0/3] Fix i2c mux module refcount issues
Date:   Fri, 20 Oct 2023 17:30:10 +0200
Message-ID: <20231020153017.759926-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Some i2c mux drivers wrongly use the pair of_find_i2c_adapter_by_node()
/ i2c_put_adapter() to lock the parent adapter.

Indeed, i2c_put_adapter() decrements the module refcount while
of_find_i2c_adapter_by_node() does not increment it. This leads to an
overflow over zero of the parent adapter user counter.

Identified mux drivers impacted are:
- i2c-mux-gpmux
- i2c-demux-pinctrl
- i2c-mux-pinctrl

Commit 48e9743dd648 ("i2c: core: add and export of_get_i2c_adapter_by_node()
interface") introduces of_get_i2c_adapter_by_node() to correctly handle
this refcount issue.

This series fixes the 3 identified mux drivers replacing the
of_find_i2c_adapter_by_node() call by an of_get_i2c_adapter_by_node()
call.

Compare to the previous iteration
  https://lore.kernel.org/linux-kernel/20231019101017.425284-1-herve.codina@bootlin.com/
This v3 series:
 - Fixes a wrong <tab> char in a commit log message
 - Add 'Cc: stable@vger.kernel.org'
 - Add Reviewed-by tags

Best regards,
Hervé

Changes v2 -> v3
  - Patch 2
    Replace a wrong <tab> char by a <space> char in commit message

  - All patches
    Add 'Cc: stable@vger.kernel.org'
    Add 'Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>'

Changes v1 -> v2:
  - All patches
    Fix commit log
    Add relevant Fixes tag
    Add 'Acked-by: Peter Rosin <peda@axentia.se>'

Herve Codina (3):
  i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()
  i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()
  i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()

 drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c     | 2 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.41.0

