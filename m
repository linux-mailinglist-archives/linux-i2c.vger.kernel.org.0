Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09B3272A41
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 10:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfGXIhx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jul 2019 04:37:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:45558 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726031AbfGXIhx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jul 2019 04:37:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A6585AEBD;
        Wed, 24 Jul 2019 08:37:51 +0000 (UTC)
Date:   Wed, 24 Jul 2019 10:37:48 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andrew Cooks <andrew.cooks@opengear.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Cooks <acooks@rationali.st>,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>, Will Wagner <willw@carallon.com>
Subject: Re: [RESEND][PATCH v4 1/3] i2c: piix4: Fix port selection for AMD
 Family 16h Model 30h
Message-ID: <20190724103748.078eab19@endymion>
In-Reply-To: <be68c29f603153cf047cd893c6b9d6423073632d.1519601860.git.andrew.cooks@opengear.com>
References: <cover.1519601860.git.andrew.cooks@opengear.com>
        <be68c29f603153cf047cd893c6b9d6423073632d.1519601860.git.andrew.cooks@opengear.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andrew,

Sorry for the delay... What can I say :(

On Mon, 26 Feb 2018 10:28:43 +1000, Andrew Cooks wrote:
> Family 16h Model 30h SMBus controller needs the same port selection fix
> as described and fixed in commit 0fe16195f891 ("i2c: piix4: Fix SMBus port
> selection for AMD Family 17h chips")
> 
> commit 6befa3fde65f ("i2c: piix4: Support alternative port selection
> register") also fixed the port selection for Hudson2, but unfortunately
> this is not the exact same device and the AMD naming and PCI Device IDs
> aren't particularly helpful here.
> 
> The SMBus port selection register is common to the following Families
> and models, as documented in AMD's publicly available BIOS and Kernel
> Developer Guides:
> 
>  50742 - Family 15h Model 60h-6Fh (PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)
>  55072 - Family 15h Model 70h-7Fh (PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)
>  52740 - Family 16h Model 30h-3Fh (PCI_DEVICE_ID_AMD_HUDSON2_SMBUS)
> 
> The Hudson2 PCI Device ID (PCI_DEVICE_ID_AMD_HUDSON2_SMBUS) is shared
> between Bolton FCH and Family 16h Model 30h, but the location of the
> SmBus0Sel port selection bits are different:
> 
>  51192 - Bolton Register Reference Guide
> 
> We distinguish between Bolton and Family 16h Model 30h using the PCI
> Revision ID:
> 
>   Bolton is device 0x780b, revision 0x15
>   Family 16h Model 30h is device 0x780b, revision 0x1F
>   Family 15h Model 60h and 70h are both device 0x790b, revision 0x4A.
> 
> The following additional public AMD BKDG documents were checked and do
> not share the same port selection register:
> 
>  42301 - Family 15h Model 00h-0Fh doesn't mention any
>  42300 - Family 15h Model 10h-1Fh doesn't mention any
>  49125 - Family 15h Model 30h-3Fh doesn't mention any
> 
>  48751 - Family 16h Model 00h-0Fh uses the previously supported
>          index register SB800_PIIX4_PORT_IDX_ALT at 0x2e
> 
> Signed-off-by: Andrew Cooks <andrew.cooks@opengear.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> (...)

Looks good to me. Unfortunately the patch no longer applies (my fault
obviously), it needs to be rebased on top of commit
24beb83ad289c68bce7c01351cb90465bbb1940a ("i2c-piix4: Add Hygon Dhyana
SMBus support").

I also agree with Tobin's suggestion to remove unneeded parentheses.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

This patch should also address Will Wagner's (Cc'd) complaint in another
thread ("[BUG] i2c_piix4: Hudson2 uses wrong port to access SMBus
controller").

I believe this is stable branch material.

-- 
Jean Delvare
SUSE L3 Support
