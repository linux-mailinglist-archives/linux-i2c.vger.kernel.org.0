Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B4A15FD70
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Feb 2020 09:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgBOILo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Feb 2020 03:11:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:38830 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgBOILo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 15 Feb 2020 03:11:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 1BFADAE52;
        Sat, 15 Feb 2020 08:11:41 +0000 (UTC)
Date:   Sat, 15 Feb 2020 09:11:39 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Robert Richter <rrichter@marvell.com>,
        George Cherian <gcherian@marvell.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: convert SMBus alert setup function to return
 an ERRPTR
Message-ID: <20200215091139.0311bc7b@endymion>
In-Reply-To: <20200215065018.GA1005@ninjato>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
        <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
        <20200215072020.75b1b772@endymion>
        <20200215065018.GA1005@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 15 Feb 2020 07:50:18 +0100, Wolfram Sang wrote:
> On Sat, Feb 15, 2020 at 07:20:20AM +0100, Jean Delvare wrote:
> > Hi Wolfram,
> > 
> > On Mon, 10 Feb 2020 18:29:25 +0100, Wolfram Sang wrote:  
> > > Only few drivers use this call, so drivers and I2C core are converted at
> > > once with this patch. By simply using i2c_new_client_device() instead of
> > > i2c_new_device(), we easily can return an ERRPTR for this function as
> > > well. To make out of tree users aware that something changed, the
> > > function is renamed to i2c_install_smbus_alert().  
> > 
> > I wouldn't bother renaming the function. Chances that there actually
> > are out-of-tree users of this function are pretty small, and if that is
> > the case, they can adjust their code easily in a way that is still
> > compatible with old kernels.  
> 
> Agreed, it is easy. But they need to *know* that they need to adjust.
> Build error makes it obvious. Otherwise, the code will compile and
> silently not work anymore, I am afraid.

The code will keep working as long as there is no error, which is a
rare situation. If/when it happens, they'll get a very visible error
message in their kernel log.

I understand that this makes them discover the problem later. But we
are talking about a case which most likely does not exist. On the other
hand, renaming makes compatibility harder to achieve for them in the
long term (#ifdefs needed forever), and it makes the work of the
distribution kernel maintainers harder.

I don't think we should make our lives harder to help people who keep
their kernel drivers out of tree. If they are not happy, they know what
they should do.

Just my 2 cents anyway, your call.

-- 
Jean Delvare
SUSE L3 Support
