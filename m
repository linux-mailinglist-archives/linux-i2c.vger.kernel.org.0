Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B35B6B2EDE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 21:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjCIUpS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 15:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCIUpQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 15:45:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64FA8E980F;
        Thu,  9 Mar 2023 12:45:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1F1CAB82085;
        Thu,  9 Mar 2023 20:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599C0C433D2;
        Thu,  9 Mar 2023 20:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678394701;
        bh=u5HrkJoM01HJpWVGHj+Y7aE+TF4vFOZRUTxy1c4JAOc=;
        h=From:To:Cc:Subject:Date:From;
        b=MEA3brRST4Nj6JTrmoJEv+/Oy6Hy84lUH46wriyVP63sdzbXVTBdnOkk8UMMZz+sZ
         n7YTcHbmjTKmDC7SFqSqMRDqa6QsKxdEB1ZzCePXjnS2KutyCpKm7sW7+5VDlnXVzg
         3XJmtRbnolE2KxuGPsjuYbyopWbZpAkwuJbV3adTmvJxmvS3SV+vk4GE8knyx89avs
         rf83gYNfny9D9MavVnOFdUeSM8uIZG7YyOpvCc8PXVa+DJt3SGMiUdky61JUMDDidy
         7pjQa1PPjU3l2efovEShCdS6joME0lEiLGTEaTC6704Wt2WNK892YEgB693LB856A9
         DwxGo+ZjIdpGQ==
From:   Conor Dooley <conor@kernel.org>
To:     linux-riscv@lists.infradead.org
Cc:     conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 0/5] Convert users of SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date:   Thu,  9 Mar 2023 20:44:47 +0000
Message-Id: <20230309204452.969574-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=conor.dooley@microchip.com; h=from:subject; bh=fbsHV5OsNcnAsQ+2KHAjCrmCBL7OVWku43zpXUdUXc8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs61rIlim8/kx+6V3+lmfedAZRcPwxmHmrulDGGuq QZ2Wxk6SlkYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJGmAwx/eA892HH+wo3b5/pr jB7uZ/q0S21zt+KpCTPLEyx4JHml3zH809ZpZjz2UCypRaxye+w/btUDh1tv9/Yeitc2WyD352o kGwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

RISC-V's SOC_FOO symbols for micro-archs are going away, and being
replaced with the more common ARCH_FOO pattern that is used by other
archs (and by vendors with a history outside of RISC-V).
Kick the conversion off by converting the Microchip RISC-V bits to use
their replacement symbol
There are no dependencies here, everything can go via subsystem trees.
We've already added the replacement symbols to RISC-V's Kconfig bits.

Cheers,
Conor.

CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: linux-clk@vger.kernel.org
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: linux-rtc@vger.kernel.org
CC: Bin Liu <b-liu@ti.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-usb@vger.kernel.org
CC: Wolfram Sang <wsa@kernel.org>
CC: linux-i2c@vger.kernel.org
CC: Daire McNamara <daire.mcnamara@microchip.com>

Conor Dooley (5):
  clk: microchip: convert SOC_MICROCHIP_POLARFIRE to
    ARCH_MICROCHIP_POLARFIRE
  i2c: microchip-core: convert SOC_MICROCHIP_POLARFIRE to
    ARCH_MICROCHIP_POLARFIRE
  mailbox: mpfs: convert SOC_MICROCHIP_POLARFIRE to
    ARCH_MICROCHIP_POLARFIRE
  rtc: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
  usb: musb: mpfs: convert SOC_MICROCHIP_POLARFIRE to
    ARCH_MICROCHIP_POLARFIRE

 drivers/clk/microchip/Kconfig | 4 ++--
 drivers/i2c/busses/Kconfig    | 2 +-
 drivers/mailbox/Kconfig       | 2 +-
 drivers/rtc/Kconfig           | 2 +-
 drivers/usb/musb/Kconfig      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.2

