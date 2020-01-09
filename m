Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68155135655
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 10:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbgAIJ5v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 04:57:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:38054 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729944AbgAIJ5v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 04:57:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 702DBC27F;
        Thu,  9 Jan 2020 09:57:49 +0000 (UTC)
Date:   Thu, 9 Jan 2020 09:42:28 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/12] i2c: taos-evm: convert to use
 i2c_new_client_device()
Message-ID: <20200109094228.2e058653@endymion>
In-Reply-To: <20200108115822.20871d77@endymion>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
        <20200107174748.9616-7-wsa+renesas@sang-engineering.com>
        <20200108115822.20871d77@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi again Wolfram,

On Wed, 8 Jan 2020 11:58:22 +0100, Jean Delvare wrote:
> On Tue, 7 Jan 2020 18:47:40 +0100, Wolfram Sang wrote:
> > Move away from the deprecated API and return the shiny new ERRPTR where
> > useful.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > Build tested only.
> > 
> >  drivers/i2c/busses/i2c-taos-evm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-taos-evm.c b/drivers/i2c/busses/i2c-taos-evm.c
> > index 0bff3f3a8779..b4050f5b6746 100644
> > --- a/drivers/i2c/busses/i2c-taos-evm.c
> > +++ b/drivers/i2c/busses/i2c-taos-evm.c
> > @@ -49,10 +49,10 @@ static struct i2c_client *taos_instantiate_device(struct i2c_adapter *adapter)
> >  	if (!strncmp(adapter->name, "TAOS TSL2550 EVM", 16)) {
> >  		dev_info(&adapter->dev, "Instantiating device %s at 0x%02x\n",
> >  			tsl2550_info.type, tsl2550_info.addr);
> > -		return i2c_new_device(adapter, &tsl2550_info);
> > +		return i2c_new_client_device(adapter, &tsl2550_info);
> >  	}
> >  
> > -	return NULL;
> > +	return ERR_PTR(-ENODEV);
> >  }
> >  
> >  static int taos_smbus_xfer(struct i2c_adapter *adapter, u16 addr,  
> 
> Looks good to me, although ideally the caller should handle the error
> instead of ignoring it. But that's out of scope for this conversion
> patch, I'll look into submitting an update on top.

I take that back. taos_instantiate_device() is instantiating an
optional slave device on the bus. If that fails, the bus is still
usable, therefore failing the whole registration would be inappropriate.

Makes me wonder if return ERR_PTR(-ENODEV) is the right thing to do in
the fallback case. The i2c-taos-evm driver was designed to support
multiple TAOS evaluation module types, even though the only one fully
supported right now is the only one I own (TSL2550). The driver can
still be used with other modules, just no slave device will be
instantiated. It can still be done later from user-space.

In my opinion -ENODEV should only be used for "I expected a device but
could not find it". For the case where we simply don't know what slave
device to instantiate, NULL seems more appropriate, as it's not an
error.

What do you think? Either way I agree it doesn't make much practical
difference in the end as i2c_unregister_device() will deal gracefully
with both.

> So:
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> I'll also try to revive my evaluation module to give it some testing.

That I did, and it works fine, as expected :-)

Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
