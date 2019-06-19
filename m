Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F344BCD3
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 17:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbfFSP35 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 11:29:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:35588 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729072AbfFSP35 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jun 2019 11:29:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9FECEAE08;
        Wed, 19 Jun 2019 15:29:56 +0000 (UTC)
Date:   Wed, 19 Jun 2019 17:29:55 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Francois Cartegnie <fcvlcdev@free.fr>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] decode-dimms: display MAC from DDR3 SPD
Message-ID: <20190619172955.40e97a5c@endymion>
In-Reply-To: <20190614130043.GA2831@kunai>
References: <20190614125814.22260-1-fcvlcdev@free.fr>
        <20190614130043.GA2831@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jun 2019 15:00:44 +0200, Wolfram Sang wrote:
> On Fri, Jun 14, 2019 at 02:58:14PM +0200, Francois Cartegnie wrote:
> > JEDEC Standard No. 21-C, Annex K, Release 6
> > 
> > Byte 41 is specified, the lower part containing
> > the MAC value, identical as DDR4.  
> 
> Adding Jean (the maintainer to CC)...

Thanks Wolfram.

> > ---
> >  eeprom/decode-dimms | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
> > index b976442..2c33f0b 100755
> > --- a/eeprom/decode-dimms
> > +++ b/eeprom/decode-dimms
> > @@ -1703,6 +1703,12 @@ sub decode_ddr3_sdram($)
> >  		tns3($bytes->[27] * $mtb));
> >  	printl("Minimum Four Activate Window Delay (tFAW)",
> >  		tns3(((($bytes->[28] & 15) << 8) + $bytes->[29]) * $mtb));
> > +# other information
> > +        my @mac = ("Untested",
> > +                   "700 K", "600 K", "500 K", "400 K", "300 K", "200 K",
> > +                   undef, "Unlimited");
> > +        my $mac = $bytes->[41] & 0x0f;
> > +        printl_cond(defined $mac[$mac], "Maximum Active Count (MAC)", $mac[$mac]);
> >  
> >  # miscellaneous stuff
> >  	prints("Optional Features");

Must be a recent addition, the latest version of the specification I
had did not mention it, I had to download an updated version from Jedec.

Looks good, patch applied, thanks. I changed "Active" to "Activate" as
I believe "Active" is a typo in the specification, and moved it to the
misc section as it isn't really a timing.

-- 
Jean Delvare
SUSE L3 Support
