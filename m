Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A7F25751B
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 10:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgHaINp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 04:13:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:53536 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgHaINo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 04:13:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7BB3DAEBA;
        Mon, 31 Aug 2020 08:14:17 +0000 (UTC)
Date:   Mon, 31 Aug 2020 10:13:41 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     wsa@kernel.org
Cc:     Jeffrey Lin <jeffrey@icurse.nl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Register lis3lv02d I2C device on Dell
 Latitude 5480
Message-ID: <20200831101341.476ce06f@endymion>
In-Reply-To: <20200805093347.GM1229@kunai>
References: <20200616234130.814499-1-jeffrey@icurse.nl>
        <20200805093347.GM1229@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, 05 Aug 2020 11:33:47 +0200, wsa@kernel.org wrote:
> On Tue, Jun 16, 2020 at 07:41:30PM -0400, Jeffrey Lin wrote:
> > Value of /sys/devices/platform/lis3lv02d/position when
> >     Horizontal:     (36,-108,-1152)
> >     Left elevated:  (-432,-126,-1062)
> >     Front elevated: (36,594,-936)
> >     Upside down:    (-126,-252,1098)
> > 
> > Signed-off-by: Jeffrey Lin <jeffrey@icurse.nl>  
> 
> Jean?
> 
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index fea644921a76..d7c802e20ae6 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1268,6 +1268,7 @@ static const struct {
> >  	/*
> >  	 * Additional individual entries were added after verification.
> >  	 */
> > +	{ "Latitude 5480",      0x29 },
> >  	{ "Vostro V131",        0x1d },
> >  };
> >  

No actual code change and not something I can test, so pretty much any
kernel developer is as qualified as I am to deal with it. But yes, OK,
I'm listed as the maintainer for this driver, so I should have replied
earlier, sorry.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
