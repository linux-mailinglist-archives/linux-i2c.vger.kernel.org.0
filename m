Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6B24852C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 16:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfFQOTx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 10:19:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:47868 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726005AbfFQOTx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 10:19:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 86ED4AD24;
        Mon, 17 Jun 2019 14:19:52 +0000 (UTC)
Date:   Mon, 17 Jun 2019 16:19:51 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Add Block Write-Block Read Process Call
 support
Message-ID: <20190617161951.56510723@endymion>
In-Reply-To: <877aef82-eab1-dc0e-a0d3-d7aab3135c14@nokia.com>
References: <20180829161810.2147-1-alexander.sverdlin@nokia.com>
        <20190613111310.3be13499@endymion>
        <877aef82-eab1-dc0e-a0d3-d7aab3135c14@nokia.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

On Mon, 17 Jun 2019 08:40:27 +0000, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> On 13/06/2019 11:13, Jean Delvare wrote:
> >> Add SMBUS 2.0 Block Write-Block Read Process Call command support.  
> > I have never seen any SMBus device using this command. Which device do
> > you need it for?  
> 
> That's our in-house FPGA design. This device is not otherwise publicly available.

OK.

> >> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> >> ---
> >>  drivers/i2c/busses/i2c-i801.c | 43 +++++++++++++++++++++++++++++++++++++------
> >>  1 file changed, 37 insertions(+), 6 deletions(-)
> >> (...)  
> > Looks good overall, except for missing an update to the documentation
> > file (Documentation/i2c/busses/i2c-i801). However I will only consider
> > applying the patch if it has a real use case.  
> 
> But the support for the new command is long-time tested and reported to work fine,
> that's why I thought it can be of interest for the community.
> 
> Please let me know if I should update the documentation and re-spin or this is
> not of the maintainer's interest at all. 

It is of interest. I just wanted to make sure you had implemented it
because the need exists and not just because the controller happens to
support it. Now that this is clarified, I'll be happy to review and
approve the patch, if you submit it again based on a recent code base
and with the missing documentation update included.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
