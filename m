Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0E0766AD4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 12:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235978AbjG1KhB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 06:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235355AbjG1Kge (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 06:36:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2C44ED0;
        Fri, 28 Jul 2023 03:33:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8210C620D5;
        Fri, 28 Jul 2023 10:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F4DC433C8;
        Fri, 28 Jul 2023 10:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690540433;
        bh=De0OBn9WOW/3B2pyULgUhwXszW9Q66YIYLoomDnSz0A=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=s40RjITnwRE+UpjErTp94GWb29V+u+SmEbqR0uyoFiZ3xkMSjVe2/kHLv7R1pac4d
         W/3R9F3RmhhOvq3xpLOp6pZRkh4mDYj0uNAZWgL9PYkx8VwCNcewPhP0chbgYGeodn
         T97/1IzzNglMCq+KaDqNrYW2rZEMKby0iEhWahLqMnTDOSpEweWADjvUa5yE/hn2d3
         vjem3Nd/PC4ZHYaIZvucc5y0sGlbEgsgXYqb7clt21r2+8KlZJreZZSAQtw+7eO1Ry
         A0rJ9f6dyl8Psr0UxtF8WLgPmIAi9NZBN/OKvvi93GnavA5+wFF9eJLmGf5bCen/0r
         BXZAJcdn5s8Cw==
From:   Lee Jones <lee@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Benjamin Bara <bbara93@gmail.com>
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org, Nishanth Menon <nm@ti.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
Subject: Re: [PATCH v7 0/5] mfd: tps6586x: register restart handler
Message-Id: <169054042966.328674.7411378579702852995.b4-ty@kernel.org>
Date:   Fri, 28 Jul 2023 11:33:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 15 Jul 2023 09:53:22 +0200, Benjamin Bara wrote:
> The Tegra20 requires an enabled VDE power domain during startup. As the
> VDE is currently not used, it is disabled during runtime.
> Since 8f0c714ad9be, there is a workaround for the "normal restart path"
> which enables the VDE before doing PMC's warm reboot. This workaround is
> not executed in the "emergency restart path", leading to a hang-up
> during start.
> 
> [...]

Applied, thanks!

[1/5] kernel/reboot: emergency_restart: set correct system_state
      commit: 60466c067927abbcaff299845abd4b7069963139
[2/5] i2c: core: run atomic i2c xfer when !preemptible
      commit: aa49c90894d06e18a1ee7c095edbd2f37c232d02
[3/5] kernel/reboot: add device to sys_off_handler
      commit: db2d6038c5e795cab4f0a8d3e86b4f7e33338629
[4/5] mfd: tps6586x: use devm-based power off handler
      commit: 8bd141b17cedcbcb7d336df6e0462e4f4a528ab1
[5/5] mfd: tps6586x: register restart handler
      commit: 510f276df2b91efd73f6c53be62b7e692ff533c1

--
Lee Jones [李琼斯]

