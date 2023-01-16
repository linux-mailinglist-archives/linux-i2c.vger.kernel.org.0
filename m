Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D931A66D133
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 22:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbjAPV7s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 16:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234917AbjAPV7r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 16:59:47 -0500
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A99224491;
        Mon, 16 Jan 2023 13:59:47 -0800 (PST)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A2B191EC0441;
        Mon, 16 Jan 2023 22:59:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1673906385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QHdyDsRmGsHeS5gc+1aFuObgPFEvnjm6n7kVGQTzBBE=;
        b=k8hpX5ws7B1G6075stAlrwc7tYOcUL2lIRbqWzoWbapv3r77i4GuEYrx2wy/3FJQeuzC/E
        g+7/9VAMRE9svrwVjNHFHeix2wWojRDdJS84wok+/rMoLsWufOgQqNQoEEaffm9op6O7rk
        i1tu52UWSRinzeRIEWUPqP/c2Mq/d04=
Date:   Mon, 16 Jan 2023 22:59:41 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <Y8XIri8/C1ITvDVu@zn.tnic>
References: <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com>
 <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com>
 <YyxrdpUyc+kp48kX@zn.tnic>
 <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
 <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
 <YzG657ZFeEvLd6hm@zn.tnic>
 <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
 <Y7v2j92Ol6dL3FLE@zn.tnic>
 <CAOtMz3PG4nku-O7dh+1U_DA05HAmQboTqwUQkCkrXQLV9bFjPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOtMz3PG4nku-O7dh+1U_DA05HAmQboTqwUQkCkrXQLV9bFjPw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 16, 2023 at 11:19:00AM +0100, Jan Dąbroś wrote:
> It's not enough for running init_amd_nbs() to have only
> pci_arch_init() done. We need the pci bus to be created and registered
> with all devices found on the bus.

And when is that done and ready? pci_scan_bus()?

Lemme see if I understand the ordering correctly:

1. PCI needs to be initialized and all devices on the bus registered

2. AMD NB needs to run and enumerate the NBs so that the SMN access which you
   need, can work.

3. acpi_scan_init()

4. i2c-designware-platdrv registration

Close?

Now, Mario, remind me again, pls, why can't they use the MSR to get the PSP MMIO
base. It has changed but why?

Maybe we should talk offlist first.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
