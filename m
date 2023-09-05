Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCDFC79323C
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 01:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbjIEXE5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 19:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjIEXE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 19:04:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7946199;
        Tue,  5 Sep 2023 16:04:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E101C433C8;
        Tue,  5 Sep 2023 23:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693955093;
        bh=6qQVbNkerVVMaMLMggZVWXpqGYsIcbsX6eKhSvcBXIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cwsSipYKWBBCb8J2bKymiIrTgFmjJ5YRzPbQGLsL9nNZNy6BzMDmYivEaCWlxN6EY
         STPNnA+mP6flgRQGN51xMdTANcHHeAqErXmbcj3GUNY70URXrEck9dnSXIeRUKVvay
         2RLEwITtfpunxwf8AoB6KImGq/e2D80gys3AxP7LfIrrrXi05UltpwWSzY0N/dW1Oi
         g7/O/iONGyYbm7psSv67wI4A4k3rmqe8wE8NDWYxYaEmoJrD+JBQHCktVyfRm1w8gv
         jbwqddkF2l6cb+oRwsS63Rkaq3+1KeeZd8nOLYTq5zD0w+WlmL48ni4GaXxXCGzidP
         6NFATosIz1L3w==
Date:   Wed, 6 Sep 2023 01:04:48 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: I2C_MLXCPLD on ARM64 should depend on ACPI
Message-ID: <20230905230448.vftghlou2w62agqi@zenone.zhora.eu>
References: <cover.1693828363.git.geert+renesas@glider.be>
 <71c8d6d8c2c7ef31040ff5a0266cde0a6b3cd189.1693828363.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c8d6d8c2c7ef31040ff5a0266cde0a6b3cd189.1693828363.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On Mon, Sep 04, 2023 at 02:00:36PM +0200, Geert Uytterhoeven wrote:
> The "i2c_mlxcpld" platform device is only instantiated on X86 systems
> (through drivers/platform/x86/mlx-platform.c), or on ARM64 systems with
> ACPI (through drivers/platform/mellanox/nvsw-sn2201.c).  Hence further
> restrict the dependency on ARM64 to ACPI, to prevent asking the user
> about this driver when configuring an ARM64 kernel without ACPI support.
> 
> While at it, document in the Kconfig help text that the driver supports
> ARM64/ACPI based systems, too.
> 
> Fixes: d7cf993f832ad2a4 ("i2c: mlxcpld: Allow driver to run on ARM64 architecture")

I'd remove the fixes tag here, as well.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
