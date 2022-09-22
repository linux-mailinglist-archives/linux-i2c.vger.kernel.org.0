Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08CB75E64A4
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 16:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiIVOEp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 10:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbiIVOEm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 10:04:42 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5808BE06;
        Thu, 22 Sep 2022 07:04:40 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 072CB21999;
        Thu, 22 Sep 2022 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1663855479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yu2dqhupNEC5iZs4+QvOOYP9YrBIF4Tg60Iod4b+qF4=;
        b=UqI9VdnJrGsbX9aHUXUR8RH53iDpu1pKXLbsNGDSjUCj+SGI/3OX2vQwDxftUd3QB1N+ew
        i3P2oY7o7EpyteyY4CCQUxBub5c5qGabAyn9jwjzdBa37W/XSmOJxHswmxKWGY4vP/L3oi
        lNjClDQL2+zZ+xWgCDnf4U0IT0YQPb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1663855479;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yu2dqhupNEC5iZs4+QvOOYP9YrBIF4Tg60Iod4b+qF4=;
        b=ks14P5/57VzpYLvOWbdOQ3PzH3gualwQbiRB/GcAchUs+0nt+dFi8c8atQVZ53LLzlHGHe
        UIOBIbtWBuGwwvBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECDDF13AA5;
        Thu, 22 Sep 2022 14:04:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 3xLLOXZrLGNUCQAAMHmgww
        (envelope-from <bp@suse.de>); Thu, 22 Sep 2022 14:04:38 +0000
Date:   Thu, 22 Sep 2022 16:04:38 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Message-ID: <YyxrdpUyc+kp48kX@zn.tnic>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
 <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
 <YytwNvSyhq380YNT@zn.tnic>
 <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
 <Yyt5LSxSz+6QeWF1@zn.tnic>
 <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com>
 <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 22, 2022 at 03:48:07PM +0200, Hans de Goede wrote:
> Right, thank you for Cc-ing me. At least on X86 there are several platforms
> (and 100-s of device models) which use a PMIC connected to the i2c-designware
> controller and this PMIC gets poked directly from ACPI _S0 and _S3
> (power on/off) methods. So the I2C bus driver needs to *bind* to the controller
> as soon as we find its description in ACPI, otherwise we get a whole bunch
> of failed ACPI OpRegion access errors as well as various actual really issues.

Thanks for explaining - I couldn't find the reason why it has to be a
subsys_initcall.

> So please keep this as a subsys initcall.

Which means, init_amd_nbs() would have to be sorted to run before
dw_i2c_init_driver()...

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
