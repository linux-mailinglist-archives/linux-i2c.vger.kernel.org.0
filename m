Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B4D6789D7
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 22:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjAWVoS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 16:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbjAWVoS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 16:44:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF10359A;
        Mon, 23 Jan 2023 13:44:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B99CE61093;
        Mon, 23 Jan 2023 21:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1FEC433EF;
        Mon, 23 Jan 2023 21:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674510256;
        bh=2Nica+qC+tDvR05sM0UelCmLU4kxZzufP2WsaZa4KFE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=s9FxECEaEJAtc37V9jN5q0qh4A4dvxn8lCGejQg/X/dPNhPx6cGZ3J5GTYXNzO3J7
         lJmVJoOQai0J6wYyMmsY2N5TmNVyRIQEP9GZeiw2gSKWI9kcMcF8ItazKHwh2pq4Uq
         2/vrSTwLOkkrt6iigSAV/7GCcig3bgJRC42+XrT0bx1VVygd6lCz0RzNoOWOTmbA6z
         EO6K29AVgYk0TjfkoktuAvHe/iOPZ+rDTuCYYF/WpVb8N1aF8QmazTp1WdRCJknMQX
         r7CoJuuCbGCBVh3rbqwKI8og75B8XedpiIUS5sQPVwFlccPbviGo4MAIU8/sN31DIa
         bAwLEPaC1kLlQ==
Date:   Mon, 23 Jan 2023 15:44:14 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v3 RESEND] acpi,pci: warn about duplicate IRQ routing
 entries returned from _PRT
Message-ID: <20230123214414.GA987407@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0113ca60-acf2-f4db-3230-959e9bb15726@o2.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 23, 2023 at 10:00:43PM +0100, Mateusz Jończyk wrote:
> W dniu 23.01.2023 o 21:33, Bjorn Helgaas pisze:
> > On Sat, Jan 21, 2023 at 04:33:14PM +0100, Mateusz Jończyk wrote:
> >> On some platforms, the ACPI _PRT function returns duplicate interrupt
> >> routing entries. Linux uses the first matching entry, but sometimes the
> >> second matching entry contains the correct interrupt vector.
> >>
> >> Print an error to dmesg if duplicate interrupt routing entries are
> >> present, so that we could check how many models are affected.
> >
> > It shouldn't be too hard to use qemu to figure out whether Windows
> > uses the last matching entry, i.e., treating _PRT entries as
> > assignments.  If so, maybe Linux could just do the same.
> >
> > Is anybody up for that?
> 
> The hardware in question has a working Windows XP installation,
> and I could in theory check which interrupt vector it uses - but
> I think that such reverse engineering is forbidden by Windows' EULA.

I'm not talking about any sort of disassembly or anything like that;
just that we can observe what Windows does given the _PRT contents.
You've already figured out that on your particular hardware, the _PRT
has two entries, and Linux uses the first one while Windows uses the
second one, right?

On qemu, we have control over the BIOS and can easily update _PRT to
whatever we want, and then we could boot Windows and see what it uses.
But I guess maybe that wouldn't tell us anything more than what you
already discovered.

So my inclination would be to make Linux use the last matching entry.

Bjorn
