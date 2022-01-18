Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BAD492679
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 14:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbiARNKE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 08:10:04 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:60220 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238429AbiARNKA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 08:10:00 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B43C31F3A1;
        Tue, 18 Jan 2022 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642511398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PXNNbzROyGOSXu3Z+k6OKKBWDzl97aAmRM32qh7TiVQ=;
        b=wtX8HGOhrFg0h3Q5UneoMzpKaWzZ2O7xu1bx++vWf5YUR4mGGw4PIis3TkNuuTFF3qqav4
        XIKf+DbGYgVJAYQpiJ+ANqXBq16ddcBm5SUJXu68ZJ/8Mxl1PFRvVewxYkQvISnQZuCIjr
        8lwF+r2pFdWjUSr9Oje/PG55MkXp5Tg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642511398;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PXNNbzROyGOSXu3Z+k6OKKBWDzl97aAmRM32qh7TiVQ=;
        b=e84QMXHBR7/VIHEJGkDVe/22kUYzDpnRD/Uw7Q5PumQYp089doYlmFTiiLpYSRLElbB9Ua
        WYeVXtn5qdB4TrCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4418B13DC7;
        Tue, 18 Jan 2022 13:09:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id jNnaDSa85mEvCwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 18 Jan 2022 13:09:58 +0000
Date:   Tue, 18 Jan 2022 14:09:56 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Terry Bowman <Terry.Bowman@amd.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <20220118140956.1e0538e7@endymion>
In-Reply-To: <CAHp75VeR4sL1URhf+Vj6_fUjw3wgG98nZd8Mu20NzH1zM590SQ@mail.gmail.com>
References: <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
        <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
        <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
        <YdoG+en5Z/MaS/wu@ninjato>
        <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
        <Yd16cw0AaYcf7eSf@kunai>
        <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com>
        <CAHp75Vfv9kgxu5u1YfjEuRmwj=jSybmZ92bpt30jB8MX4LFHaQ@mail.gmail.com>
        <CAHp75Vf3G1ftL6VrCchCTC7UbEyWD65wdjRjYOwxY9ONxZ=DCQ@mail.gmail.com>
        <74eb7c8f-7072-495a-fc26-b60bf0a1f51a@amd.com>
        <Yd/X6DlWjACLODe2@ninjato>
        <CAHp75VeR4sL1URhf+Vj6_fUjw3wgG98nZd8Mu20NzH1zM590SQ@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 13 Jan 2022 12:24:41 +0200, Andy Shevchenko wrote:
> On Thu, Jan 13, 2022 at 9:42 AM Wolfram Sang <wsa@kernel.org> wrote:
> > > > On top of that I'm wondering why slow I/O is used? Do we have anything
> > > > that really needs that or is it simply a cargo-cult?  
> > >
> > > The efch SMBUS & WDT previously only supported a port I/O interface
> > > (until recently) and thus dictated the HW access method.  
> >
> > Is this enough information to start v2 of this series? Or does the
> > approach need more discussion?  
> 
> I dunno why slow I/O is chosen, but it only affects design (read:
> ugliness) of the new code.

I've been wondering about the use of slow (*_p) I/O accessors for some
time too. All the SMBus controller drivers doing that originate from the
lm_sensors project (i2c-ali1535, i2c-ali1563, i2c-ali15x3, i2c-amd756,
i2c-i801, i2c-nforce2, i2c-piix4 and i2c-viapro). So basically *all*
SMBus controller drivers for non-embedded x86.

I suspect that most of this is the result of copy-and-paste from one
driver to the next as support for different chipsets was added in the
late 90's and early 2000's. I wouldn't be surprised if most, if not
all, can be replaced with non-pausing counterparts. But I've been too
shy to give it a try so far.

I must say I find it pretty funny that Andy is asking about it in the
i2c-piix4 driver when the i2c-i801 driver, which he's been helping with
quite a lot in the last few years, does exactly the same.

-- 
Jean Delvare
SUSE L3 Support
