Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31DA5E54BA
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 22:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiIUUvK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 16:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiIUUvJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 16:51:09 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9309F8EB;
        Wed, 21 Sep 2022 13:51:04 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id DD1331F919;
        Wed, 21 Sep 2022 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1663793462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YY7dZM2RgswCeE+tarol02HEAaXHE+xMggA7bqRg/GQ=;
        b=lUxIcBlbUr9nD7t0diiiPo8UE30tv/6bQJq3I405zPUljr8JoVFwaJAA9UkNLOnvidbHTN
        rceDp+cvM6qQNIsaKfozsRFWV8jnhnG41mxaA7TVWgGcOTBZFX1vKEQFgNGVOhYINrlhNc
        HgbZgablgus2YdWj+3DqQA14hTZp5dc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1663793462;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YY7dZM2RgswCeE+tarol02HEAaXHE+xMggA7bqRg/GQ=;
        b=PArShemOXqTCZirUDlrE4yJ/kebXi2P73ObDavm1PzoCefruqs4Lc6fEbtXcexN0yMTeIK
        bz//wiT1R7ZWvCBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D123613A00;
        Wed, 21 Sep 2022 20:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id xmkHMzZ5K2OkagAAMHmgww
        (envelope-from <bp@suse.de>); Wed, 21 Sep 2022 20:51:02 +0000
Date:   Wed, 21 Sep 2022 22:50:53 +0200
From:   Borislav Petkov <bp@suse.de>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <Yyt5LSxSz+6QeWF1@zn.tnic>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
 <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
 <YytwNvSyhq380YNT@zn.tnic>
 <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 21, 2022 at 03:19:26PM -0500, Limonciello, Mario wrote:
> Jan mentioned this in the commit message:
> 
> > The function which registers i2c-designware-platdrv is a
> > subsys_initcall that is executed before fs_initcall (when enumeration > of
> NB descriptors occurs).
> 
> So if it's not exported again, then it means that we somehow
> need to get i2c-designware-platdrv to register earlier too.

So I have this there:

/* This has to go after the PCI subsystem */
fs_initcall(init_amd_nbs);

as I need PCI. It itself does

arch_initcall(pci_arch_init);

so I guess init_amd_nbs() could be a subsys_initcall...

Or why is

subsys_initcall(dw_i2c_init_driver);

a subsys initcall in the first place?

Looking at

  104522806a7d ("i2c: designware: dw_i2c_init_driver as subsys initcall")

I don't see a particular reason why it should be a subsys_initcall...

In any case, this should be fixed without an export which was crap in
the first place.

Hm.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
