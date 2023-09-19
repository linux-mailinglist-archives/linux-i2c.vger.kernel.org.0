Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22DD7A6730
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 16:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232889AbjISOq4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 10:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232832AbjISOqz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 10:46:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75412BF;
        Tue, 19 Sep 2023 07:46:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CD7C433C7;
        Tue, 19 Sep 2023 14:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695134810;
        bh=kNiCJsCewFz4TLCsqksrAT4cC3PggEcrjWbgkKxvCjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PYqk1G+jPr5zv/QpaLp4AA6V9a4GL1VwF37uS6Xrbc8ReE7oRYrubpdPFOjJM8K3+
         hRS1IKB4RXa9s8nGXa6u/pOsUdxWBlOdYHlGhFeCm1Gpp3jxKzEFzwi4a9xZ0wslNY
         Nb7xVfEUKVR6L1I2j5A4H2rDkBtTuYw/rR63P5djPMVPiHVfrNGC441JpFyumuwhtR
         39JtOgpjOmcPqbz9VbPJYEMJCQx+WWsYPiRfd7k0ymOXIxfen89DpdaYpjyhfUiIyP
         Q0fkCmOIhipggzdJjgk6wih18EH+KsVvbMOyfu5GLtNTz/6Ps5yA1ysWadfr3/WZa2
         xpWAcQZ2DMKNw==
Date:   Tue, 19 Sep 2023 15:46:44 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, rafael.j.wysocki@intel.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL] Immutable branch between MFD, I2C and Reboot due for the
 v6.7 merge window
Message-ID: <20230919144644.GX13143@google.com>
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enjoy!

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-i2c-reboot-v6.7

for you to fetch changes up to 510f276df2b91efd73f6c53be62b7e692ff533c1:

  mfd: tps6586x: Register restart handler (2023-07-28 11:33:20 +0100)

----------------------------------------------------------------
Immutable branch between MFD, I2C and Reboot due for the v6.7 merge window

----------------------------------------------------------------
Benjamin Bara (5):
      kernel/reboot: emergency_restart: Set correct system_state
      i2c: core: Run atomic i2c xfer when !preemptible
      kernel/reboot: Add device to sys_off_handler
      mfd: tps6586x: Use devm-based power off handler
      mfd: tps6586x: Register restart handler

 drivers/i2c/i2c-core.h |  2 +-
 drivers/mfd/tps6586x.c | 50 ++++++++++++++++++++++++++++++++++++++++++--------
 include/linux/reboot.h |  3 +++
 kernel/reboot.c        |  4 ++++
 4 files changed, 50 insertions(+), 9 deletions(-)

-- 
Lee Jones [李琼斯]
