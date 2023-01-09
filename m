Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C389E6623DE
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 12:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjAILM0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 06:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjAILMZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 06:12:25 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACED1402E;
        Mon,  9 Jan 2023 03:12:24 -0800 (PST)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9E0F91EC0589;
        Mon,  9 Jan 2023 12:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1673262742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WvxdxW8ZHXLmCsU9EpE35YDlNZMGPm5wJIQfY7TWylQ=;
        b=lQCc6DDuUeoK44s+MIuuSls73wzOiBPbV9sWfB1M/tDY3xo+TA9dziLTnfy82wY5fyA4+u
        tH2rwrDYfEwvz/5JjDb/jJNaDWVKvlS4YaVPWYMvhXZF16Yh0NiU0Y81ONdQyaMLjTWc+3
        fAhEYwnIPe+w3kJkRwvDgo0A580VguQ=
Date:   Mon, 9 Jan 2023 12:12:15 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Borislav Petkov <bp@suse.de>, Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <Y7v2j92Ol6dL3FLE@zn.tnic>
References: <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
 <Yyt5LSxSz+6QeWF1@zn.tnic>
 <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com>
 <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com>
 <YyxrdpUyc+kp48kX@zn.tnic>
 <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
 <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
 <YzG657ZFeEvLd6hm@zn.tnic>
 <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Another forgotten thread... ;-\

+ Yazen.

On Fri, Oct 28, 2022 at 10:32:20AM +0200, Jan Dąbroś wrote:
> So to summarize everything, I would like below order:
> 
> acpi_init() -> init_amd_nbs() -> dw_i2c_init_driver()
> ^--subsys_initcall   ^--fs_initicall            ^--subsys_initcall
> 
> but I don't have a clear idea how to achieve this in a clean way.
> 
> The only option seems to be to register init_amd_nbs() as
> subsys_initcall and force it to execute after acpi_init() and before
> dw_i2c_init_drvier(). However the only option (if I'm not mistaken)
> for forcing order on initcalls placed on the same level is to modify
> their order within Makefile, so that linker puts them in the "init"
> section with addresses in desired order. This doesn't seem to be an
> option for upstream.
> 
> Do you have any clue how to solve this problem?

Make init_amd_nbs() arch_initcall_sync() so that it executes after PCI init.

By the time subsys_initcalls come, they'll have all the facilities they need,
prepared for them...

Along with big fat comment why.

Btw, note to myself as I keep wondering about it each time: the sync calls come
after the regular ones, in link order if you look at preprocessed linker script
arch/x86/kernel/vmlinux.lds:

__initcall_start = .;
 KEEP(*(.initcallearly.init)) __initcall0_start = .;
 KEEP(*(.initcall0.init)) KEEP(*(.initcall0s.init)) __initcall1_start = .;
 KEEP(*(.initcall1.init)) KEEP(*(.initcall1s.init)) __initcall2_start = .;
 KEEP(*(.initcall2.init)) KEEP(*(.initcall2s.init)) __initcall3_start = .;
 KEEP(*(.initcall3.init)) KEEP(*(.initcall3s.init)) __initcall4_start = .;
 KEEP(*(.initcall4.init)) KEEP(*(.initcall4s.init)) __initcall5_start = .;
 KEEP(*(.initcall5.init)) KEEP(*(.initcall5s.init)) __initcallrootfs_start = .;
 KEEP(*(.initcallrootfs.init)) KEEP(*(.initcallrootfss.init)) __initcall6_start = .;
 KEEP(*(.initcall6.init)) KEEP(*(.initcall6s.init)) __initcall7_start = .;
 KEEP(*(.initcall7.init)) KEEP(*(.initcall7s.init)) __initcall_end = .;

Mario, is that something that would work for what you wanna do too?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
