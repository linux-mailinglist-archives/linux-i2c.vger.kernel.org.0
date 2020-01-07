Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFBCF132CB6
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728503AbgAGRLd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:11:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbgAGRLd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 12:11:33 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 581DA52F;
        Tue,  7 Jan 2020 18:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578417090;
        bh=GMxGBNWltkL1QH1mxL/WI5x9rZZ0zQiXw88tDKzihJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DfUxXK86xjPXWK1gfyLM6AZmy4Aw5GufsdM1IAwuuULAu6UzPnbRXKngTbRZTJQyB
         UwcQ6ZvDZCg7rXcFSHUibMdpq4pmRYRgwI47WJtjs6z3RqQWKjDeFXVXr3dhuBefc2
         4BIkobm8VS4H8OSgFw1myHbnSITTOvmgNKCBLsCU=
Date:   Tue, 7 Jan 2020 19:11:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran@ksquared.org.uk>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200107171119.GN4871@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <6760a242-ff0f-c981-68d4-7b9665124e21@bingham.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6760a242-ff0f-c981-68d4-7b9665124e21@bingham.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Kieran,

On Tue, Jan 07, 2020 at 09:40:35AM +0000, Kieran Bingham wrote:
> On 31/12/2019 16:13, Wolfram Sang wrote:
> > Some devices are able to reprogram their I2C address at runtime. This
> > can prevent address collisions when one is able to activate and
> > reprogram these devices one by one. For that to work, they need to be
> > assigned an unused address. This new functions allows drivers to request
> > for such an address. It assumes all non-occupied addresses are free. It
> > will then send a message to such a free address to make sure there is
> > really nothing listening there.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++++++++
> >  include/linux/i2c.h         |  2 ++
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 51bd953ddfb2..5a010e7e698f 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -2241,6 +2241,28 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
> >  	return err;
> >  }
> >  
> > +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap)
> > +{
> > +	struct i2c_client *alias = ERR_PTR(-EBUSY);
> > +	int ret;
> > +	u16 addr;
> > +
> > +	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
> > +
> > +	for (addr = 0x08; addr < 0x78; addr++) {
> > +		ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
> 
> Are all 'known' devices on a bus (all the ones declared in DT etc)
> marked as 'busy' or taken by the time this call is made? (edit, I don't
> think they are)
> 
> Perhaps this is a constructed corner case, but I'm just trying to follow
> it through:
> 
> I.e. if say the adv748x had in DT defined aliases at 0x08, 0x09,
> 0x0A..., but not yet probed (thus no device is listening at these
> addresses) ... and then a max9286 came along and asked for 'any' spare
> address with this call, would it be given 0x08 first?
> 
> If so (which I think is what the case would be currently, until I'm
> pointed otherwise) do we need to mark all addresses on the bus as
> reserved against this some how?
> 
> I'm not sure how that would occur, as it would be up to the adv748x in
> that instance to parse it's extended register list to identify the extra
> aliases it will create, *and* that would only happen if the device
> driver was enabled in the first place.
> 
> So this seems a bit 'racy' in a different context; not the i2c_lock_bus,
> but rather the probe order of devices on the bus could affect the
> allocations.
> 
> Perhaps that is unavoidable though...

But it's a real problem... Could the I2C core parse all the addresses on
the bus before probing drivers ?

> > +		if (ret == -ENODEV) {
> > +			alias = i2c_new_dummy_device(adap, addr);
> > +			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
> > +			break;
> > +		}
> > +	}
> > +
> > +	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
> > +	return alias;
> > +}
> > +EXPORT_SYMBOL_GPL(i2c_new_alias_device);
> > +
> >  int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr)
> >  {
> >  	return i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index f834687989f7..583ca2aec022 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -441,6 +441,8 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
> >  struct i2c_client *
> >  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
> >  
> > +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap);
> > +
> >  /* If you don't know the exact address of an I2C device, use this variant
> >   * instead, which can probe for device presence in a list of possible
> >   * addresses. The "probe" callback function is optional. If it is provided,

-- 
Regards,

Laurent Pinchart
