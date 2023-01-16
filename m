Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485AA66BB8B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 11:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjAPKTQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 05:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjAPKTO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 05:19:14 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CFF4EEB
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 02:19:13 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id b4so20548483edf.0
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 02:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qpFaSguiiG5sSHfQpXcgWAbjptbT0uDYsnZiuy0reew=;
        b=Fkm4AffZNk48McGdW+1Y8+1FGAHhY1hGahKH/oAorEqzl7rgGtEe2ea0jeZBUxnDow
         hF53GMkNMxVz8g5R3IywO3S/ZgYqxOalrADzSEh+3pK3mKWX6ma1Z8jihu1dlEry3JYB
         YU7HXiHYmgQL9DhHJDpZXi5fqz3Lj6tJr7CFqnW+YbK0j552jjhbwFSjV9P/Sav87zeN
         r6N7upl+wYglr6gCQ/GS9/lfucTz4FLi+BhCdcj0LYpQAS+pGLOfFvZn8z82Q4kmOu+8
         WKMLiC2xytUGg+2yQROFHv/Cd4jyxpC3U+QRV2bMT3sNQPFrqSte0HpwXezWPkegpAUs
         kAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpFaSguiiG5sSHfQpXcgWAbjptbT0uDYsnZiuy0reew=;
        b=czL85CUXfQQ9pa3PtT2WpFFx/fRrEHl/uE0VEpDoLTT0V/U4ZsBWQMD62mhOuu/53B
         0m0cSuQbFJh/jtAs1RK3CHRwcG6pEhs2/LkmattpfNkoAtmy5pWspvH6jp7cgal613lD
         dqAC4et7oK+Twb2d9T9PMRtMgYy/apcbue7mIcfC6SWQOa3nnxxgqPOZV2PFKq0qiKf2
         UIRl5V6cZetYqEEtqpNHNOnCRA/tI+k8yl6vO4tz/ojLs7CrYtsGJ7HdiIwIkMW1f4iV
         iVbsfEd/Nra693jvwM7kPPhrJErw4M4+QgReZgBv9B7uqimev6BFAOLihLSvSOV5xk2T
         qGkg==
X-Gm-Message-State: AFqh2kp9UAvZIASSSs3gc1ILopqGJ7/hoVsQ3ktENXP5AFrWlKVNflQL
        mpNip6iT1vkNSh7t152if9jS+SZg57BCakDeed4Apg==
X-Google-Smtp-Source: AMrXdXs8lFkjin3Xc38VxLUZ1H0RxVFbJcO8t+nYz/ev+BVDBbRsh9NWNIrb/degGGcyXJc5Q1LYxjrVid8GoTL+Seo=
X-Received: by 2002:a05:6402:f29:b0:499:b3b2:cfbf with SMTP id
 i41-20020a0564020f2900b00499b3b2cfbfmr263340eda.145.1673864352024; Mon, 16
 Jan 2023 02:19:12 -0800 (PST)
MIME-Version: 1.0
References: <60a52348-7d50-1056-a596-e154f87c99d2@amd.com> <Yyt5LSxSz+6QeWF1@zn.tnic>
 <YywvmueFj/ibyZdf@smile.fi.intel.com> <YywwEvkZK1R9mJfE@smile.fi.intel.com>
 <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com> <YyxrdpUyc+kp48kX@zn.tnic>
 <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com> <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
 <YzG657ZFeEvLd6hm@zn.tnic> <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
 <Y7v2j92Ol6dL3FLE@zn.tnic>
In-Reply-To: <Y7v2j92Ol6dL3FLE@zn.tnic>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 16 Jan 2023 11:19:00 +0100
Message-ID: <CAOtMz3PG4nku-O7dh+1U_DA05HAmQboTqwUQkCkrXQLV9bFjPw@mail.gmail.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
To:     Borislav Petkov <bp@alien8.de>
Cc:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Borislav Petkov <bp@suse.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Yazen Ghannam <yazen.ghannam@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Borislav,

> Make init_amd_nbs() arch_initcall_sync() so that it executes after PCI init.

I described earlier in this thread why such option is not working -
let me quote myself:

It's not enough for running init_amd_nbs() to have only
pci_arch_init() done. We need the pci bus to be created and registered
with all devices found on the bus. We are traversing through them and
trying to find northbridge VID/DID. Due to the above, we need to run
init_amd_nbs() only after acpi_scan_init() that is invoked from
acpi_init() which is registered as subsys_initcall. That's why the
trick with switching init_amd_nbs() to arch_initcall_sync will not
work.

We have a kind of chicken-and-egg problem here. Or is there something I missed?

I wonder if there is upstreamable option to control order of the
drivers' init by forcing link order?

Best Regards,
Jan
