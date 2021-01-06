Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F8C2EBFBE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jan 2021 15:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbhAFOoN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jan 2021 09:44:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:40278 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbhAFOoH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Jan 2021 09:44:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9FC51ACAF;
        Wed,  6 Jan 2021 14:43:25 +0000 (UTC)
Date:   Wed, 6 Jan 2021 15:43:24 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     trix@redhat.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: remove h from printk format specifier
Message-ID: <20210106154324.78e005da@endymion>
In-Reply-To: <20210105100942.GC2000@ninjato>
References: <20201215183327.2072052-1-trix@redhat.com>
        <20210105100942.GC2000@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tom, Wolfram,

On Tue, 5 Jan 2021 11:09:42 +0100, Wolfram Sang wrote:
> On Tue, Dec 15, 2020 at 10:33:27AM -0800, trix@redhat.com wrote:
> > From: Tom Rix <trix@redhat.com>
> > 
> > See Documentation/core-api/printk-formats.rst.
> > h should no longer be used in the format specifier for printk.
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>  
> 
> Adding Jean to CC. Jean, I'd think %02x would be better, what do you
> think?

Agreed, 0x%02x would be better.

If this is done then you can add:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

> > ---
> >  drivers/i2c/i2c-smbus.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> > index d3d06e3b4f3b..5cd2cf84659e 100644
> > --- a/drivers/i2c/i2c-smbus.c
> > +++ b/drivers/i2c/i2c-smbus.c
> > @@ -396,7 +396,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
> >  
> >  		if (!IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL))) {
> >  			dev_info(&adap->dev,
> > -				 "Successfully instantiated SPD at 0x%hx\n",
> > +				 "Successfully instantiated SPD at 0x%x\n",
> >  				 addr_list[0]);
> >  			dimm_count--;
> >  		}

-- 
Jean Delvare
SUSE L3 Support
