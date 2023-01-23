Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 476916787D1
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 21:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjAWUdH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 15:33:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbjAWUdG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 15:33:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E1972B7;
        Mon, 23 Jan 2023 12:33:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2BAC4B80E6A;
        Mon, 23 Jan 2023 20:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96966C433D2;
        Mon, 23 Jan 2023 20:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674505982;
        bh=QhnEPxkhIoB5AL1s6si5LjOz1IGKtZAqrA+asLUn8FI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=gwtNM6jGkxlUisq9aAkYxJACTKqQU4x1mx6Vp9P2XuifV+cXG0CNCOHqc8OnLPhJl
         kA4MTFcy81ZB7EgrsbJXs+wfEKNoY/rPMw/Cp6dr0h9u2uQqpeBmLaLU69muMRQOvj
         jybP04arwRwe1HF760C5Y3YdGP7WM3E9gHyyUNU95pthMyA/SS/cits8VmDBwWnex4
         rpOqN2lG3w/4GQaFtMFABykUmWBYinTch6W7LGoMC72eQ7XC5iPXxhXI6szQEqCG+R
         n6+ipnrTp50V8SdbFwQsDHDY2GrI/XWrje6aNb8Eyr4dIW5hhTlzHeKCqxtZ7wcWxs
         +5ZXsmuO6UY9g==
Date:   Mon, 23 Jan 2023 14:33:01 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v3 RESEND] acpi,pci: warn about duplicate IRQ routing
 entries returned from _PRT
Message-ID: <20230123203301.GA909338@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230121153314.6109-1-mat.jonczyk@o2.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jan 21, 2023 at 04:33:14PM +0100, Mateusz Jończyk wrote:
> On some platforms, the ACPI _PRT function returns duplicate interrupt
> routing entries. Linux uses the first matching entry, but sometimes the
> second matching entry contains the correct interrupt vector.
>
> Print an error to dmesg if duplicate interrupt routing entries are
> present, so that we could check how many models are affected.

It shouldn't be too hard to use qemu to figure out whether Windows
uses the last matching entry, i.e., treating _PRT entries as
assignments.  If so, maybe Linux could just do the same.

Is anybody up for that?

Bjorn
