Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4DB7DFD51
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Nov 2023 00:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjKBXk0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Nov 2023 19:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjKBXkZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Nov 2023 19:40:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEB2191;
        Thu,  2 Nov 2023 16:40:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A8C433C8;
        Thu,  2 Nov 2023 23:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698968422;
        bh=NdBaVe8E7k1WjcKG0b4vnvhpNx9zEYT3xHY1NMvuThQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OVp6d6dhoQslWu4XfXGF/k2e+Tu2fx7P9Quixm1l9dSKBy2GNAHBGC94cID0vusvr
         dfsfxhQ1Ew3bn/igE1VZXpAdP0V8to14ASS2NcoxZ2LgOyTRPmFQixqhnhwrYGuzbB
         XT2/xCU+VrbaEDTFqJjSbCWIsuxCj9ZnUquKV6tn+G7nC9XNj62hkyJgSm0/eR3LuF
         a++LIXTn9XUFQqYyTfuemdutXfx/ZF2zzDkdK3d6mK/weTZjM5HrsBIIm40lJ5738Z
         8ufa6PsdzN3E8iBsVCS0AGjIjJQxDFFumqcEta9KDk73F++TbYcasr0sRVB0Otmyc6
         ZbQAMaD1QAbPg==
Date:   Fri, 3 Nov 2023 00:40:15 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH v3 3/3] i2c: s3c24xx: add support for atomic transfers
Message-ID: <20231102234015.zyzbhpvbq42ztp6o@zenone.zhora.eu>
References: <20231031144252.2112593-1-m.szyprowski@samsung.com>
 <CGME20231031144300eucas1p2edfb098f7dba134cdfa637abbf632987@eucas1p2.samsung.com>
 <20231031144252.2112593-4-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031144252.2112593-4-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

On Tue, Oct 31, 2023 at 03:42:52PM +0100, Marek Szyprowski wrote:
> Add support for atomic transfers using polling mode with interrupts
> intentionally disabled to get rid of the following warning introduced by
> commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
> transfers") during system reboot and power-off:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1518 at drivers/i2c/i2c-core.h:40 i2c_transfer+0xe8/0xf4
> No atomic I2C transfer handler for 'i2c-0'
> Modules linked in:
> CPU: 0 PID: 1518 Comm: reboot Not tainted 6.6.0-next-20231031 #7453
> Hardware name: Samsung Exynos (Flattened Device Tree)
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x40/0x4c
>  dump_stack_lvl from __warn+0x7c/0x124
>  __warn from warn_slowpath_fmt+0x110/0x178
>  warn_slowpath_fmt from i2c_transfer+0xe8/0xf4
>  i2c_transfer from regmap_i2c_read+0x58/0x88
>  regmap_i2c_read from _regmap_raw_read+0xfc/0x260
>  _regmap_raw_read from _regmap_bus_read+0x44/0x70
>  _regmap_bus_read from _regmap_read+0x60/0x14c
>  _regmap_read from regmap_read+0x3c/0x60
>  regmap_read from regulator_get_voltage_sel_regmap+0x2c/0x74
>  regulator_get_voltage_sel_regmap from regulator_get_voltage_rdev+0x64/0x15c
>  regulator_get_voltage_rdev from _regulator_do_set_voltage+0x2c/0x5a8
>  _regulator_do_set_voltage from regulator_set_voltage_rdev+0x90/0x248
>  regulator_set_voltage_rdev from regulator_do_balance_voltage+0x350/0x4d0
>  regulator_do_balance_voltage from regulator_set_voltage_unlocked+0xd4/0x118
>  regulator_set_voltage_unlocked from regulator_set_voltage+0x40/0x74
>  regulator_set_voltage from _opp_config_regulator_single+0x44/0x110
>  _opp_config_regulator_single from _set_opp+0x118/0x500
>  _set_opp from dev_pm_opp_set_rate+0x108/0x20c
>  dev_pm_opp_set_rate from __cpufreq_driver_target+0x568/0x6cc
>  __cpufreq_driver_target from cpufreq_generic_suspend+0x28/0x50
>  cpufreq_generic_suspend from cpufreq_suspend+0xbc/0x124
>  cpufreq_suspend from device_shutdown+0x18/0x230
>  device_shutdown from kernel_restart+0x38/0x90
>  kernel_restart from __do_sys_reboot+0x12c/0x1f8
>  __do_sys_reboot from ret_fast_syscall+0x0/0x54
> Exception stack(0xf0fedfa8 to 0xf0fedff0)
> ...
> ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>

Thanks!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
