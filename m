Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F367D32659F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 17:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhBZQgQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 11:36:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:32976 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229954AbhBZQgP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 11:36:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A26B6AB8C;
        Fri, 26 Feb 2021 16:35:31 +0000 (UTC)
Date:   Fri, 26 Feb 2021 17:35:30 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Add support for Intel Alder Lake PCH-P
Message-ID: <20210226173530.5e7dd1cb@endymion>
In-Reply-To: <20210209104517.GD9698@ninjato>
References: <20210114143811.1820137-1-jarkko.nikula@linux.intel.com>
        <20210128085943.GD963@ninjato>
        <70c0c886-f8bb-1179-3bb9-f805ac7f4800@linux.intel.com>
        <20210209104517.GD9698@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 9 Feb 2021 11:45:17 +0100, Wolfram Sang wrote:
> > Actually need to avoid patching it and Kconfig for each new chipset variant
> > and make them shorter was my motivation behind commit 80d943ab19e9 ("i2c:
> > i801: Consolidate chipset names in documentation and Kconfig").  
> 
> OK, I'll try to remember next time ;)
> 
> > > And maybe we should add Jarkko as i801 maintainer because Jean is usually
> > > fine with such changes?
> > >   
> > I'm not sure am I up to the task? Meaning I don't feel I know it so well.
> > I've been mostly adding new PCI IDs to new platforms.  
> 
> OK, I was just asking. Jean seems to be MIA, so:
> 
> Applied to for-next, thanks!

Sorry, I somehow missed this thread. Looks all good to me, thanks
Jarkko and Wolfram.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
