Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B314B114CDC
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2019 08:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfLFHoQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Dec 2019 02:44:16 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37987 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfLFHoQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Dec 2019 02:44:16 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1id8Hf-0002mD-IM; Fri, 06 Dec 2019 08:44:15 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1id8Hf-0007h2-3x; Fri, 06 Dec 2019 08:44:15 +0100
Date:   Fri, 6 Dec 2019 08:44:15 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20191206074415.r245aqlj4ysenh4z@pengutronix.de>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
 <f1d9e12b-2636-5624-bfde-ac556817b697@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1d9e12b-2636-5624-bfde-ac556817b697@lucaceresoli.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:40:15 up 151 days, 13:50, 141 users,  load average: 0.18, 0.12,
 0.12
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 05, 2019 at 03:45:09PM +0100, Luca Ceresoli wrote:
> Hi Sascha,
> 
> On 04/12/19 10:53, Sascha Hauer wrote:
> > Always add the (un)reg_slave hooks to struct i2c_algorithm, even when
> > I2C slave support is disabled. With the cost of some binary space I2C
> > drivers with optional I2C slave support no longer have to #ifdef
> > the hooks. For the same reason add a stub for i2c_slave_event and make
> > enum i2c_slave_event present without I2C slave support.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> I like the idea, but I have a question below.
> 
> > ---
> >  include/linux/i2c.h | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index d2f786706657..74ebfcb43dd2 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -359,7 +359,6 @@ static inline void i2c_set_clientdata(struct i2c_client *dev, void *data)
> >  
> >  /* I2C slave support */
> >  
> > -#if IS_ENABLED(CONFIG_I2C_SLAVE)
> >  enum i2c_slave_event {
> >  	I2C_SLAVE_READ_REQUESTED,
> >  	I2C_SLAVE_WRITE_REQUESTED,
> > @@ -368,6 +367,7 @@ enum i2c_slave_event {
> >  	I2C_SLAVE_STOP,
> >  };
> >  
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> >  extern int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
> >  extern int i2c_slave_unregister(struct i2c_client *client);
> >  extern bool i2c_detect_slave_mode(struct device *dev);
> > @@ -379,6 +379,11 @@ static inline int i2c_slave_event(struct i2c_client *client,
> >  }
> >  #else
> >  static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
> > +static inline int i2c_slave_event(struct i2c_client *client,
> > +				  enum i2c_slave_event event, u8 *val)
> > +{
> > +	return -EINVAL;
> > +}
> >  #endif
> >  
> >  /**
> > @@ -553,10 +558,8 @@ struct i2c_algorithm {
> >  	/* To determine what the adapter supports */
> >  	u32 (*functionality)(struct i2c_adapter *adap);
> >  
> > -#if IS_ENABLED(CONFIG_I2C_SLAVE)
> >  	int (*reg_slave)(struct i2c_client *client);
> >  	int (*unreg_slave)(struct i2c_client *client);
> > -#endif
> 
> Assuming I2C slave users are a minority, would it make sense to move the
> two slave-related function pointers to a new 'struct i2c_slave_ops' and
> store a 'struct i2c_slave_ops*' here? This would to set a limit to the
> size increase for the majority of users.

Would be doable I guess. I have no strong opinion here, but that would
be done as a separate patch anyway, so should prevent this one from
being merged.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
