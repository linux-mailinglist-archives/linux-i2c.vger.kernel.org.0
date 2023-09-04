Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA537916B1
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 14:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242882AbjIDMAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 08:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245746AbjIDMAr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 08:00:47 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1095B1BE
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 05:00:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:593d:4b41:8edd:4ba9])
        by michel.telenet-ops.be with bizsmtp
        id ho0d2A0044Sq5qr06o0dSc; Mon, 04 Sep 2023 14:00:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qd8Fj-002WI8-El;
        Mon, 04 Sep 2023 14:00:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qd8Fx-00AOXJ-3g;
        Mon, 04 Sep 2023 14:00:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] Restrict Mellanox platform and i2c dependencies
Date:   Mon,  4 Sep 2023 14:00:34 +0200
Message-Id: <cover.1693828363.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

	Hi all,

This patch series makes the NVSW_SN2201 and I2C_MLXCPLD dependencies in
Kconfig stricter, to prevent asking the user about the corresponding
drivers when configuring kernels for systems where these drivers cannot
be used.

Thanks for your comments!

Geert Uytterhoeven (2):
  platform/mellanox: NVSW_SN2201 should depend on ACPI
  i2c: I2C_MLXCPLD on ARM64 should depend on ACPI

 drivers/i2c/busses/Kconfig        | 4 ++--
 drivers/platform/mellanox/Kconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
