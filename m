Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B04131039A
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2019 03:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfEABDn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 21:03:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44467 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfEABDn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 21:03:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id d24so13666355otl.11;
        Tue, 30 Apr 2019 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D8JqNmSTPQ6nq3IPohV0pejJRJM2MdP7k52Jd0Iy06I=;
        b=OBgRMPrlGwfS7BnihWgRMRHXpInxhXEtdURsse3KRkc+ZvM7i+knOFRaKLwH21DYa3
         F8UCOqLxraAdLbdy9FpmTRvT7k5NEQ3I5fSV04bHvxOuVMjbQE6bGffD5UCSXQFhP4fk
         jvV8/JeY2GozDuEVwgMYeYUggtShvpZ1ghFVFNLCDtFxZTcgBuyyEj9hPnd461uKmZm0
         mVhVRpkbMQwDxpnDzAPhIEXy87g2HfnRurVJm7duPv9x7hOcUXchjiHKKPrWvMveC4Th
         lApuqLjs6Iy4qw/sugSJop+SMp9YU4aMK3n9tD/bLz+hKPc+miWeeImt04Tb+azg6GVc
         thqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=D8JqNmSTPQ6nq3IPohV0pejJRJM2MdP7k52Jd0Iy06I=;
        b=QHebUDaYhGVU1UWNvy6+RQvMEtxzj9QPbdyefgxYb/ETHEPtsOVik1vMphaMpJFVMB
         JGvGA/aYR+FV0AzNJam3K1MFJXnBG9Zp7Bv/+Mcr15NxntS3U3gR5X0P5Iv/CIVrHx9w
         8P2xfjYwhcM4KpBQiR/QnGpSt0Pz3vyGTn7MSH0Kwwpa7vamPsUcaoJ56nnmX2AW8e8i
         mDlGIIQ6nM1q0YEEkASU8YIEWceXJkjElbP3ZR8JzyhxvTjYB7M98hP8D3SOraPEcKOV
         m6RUB0Nggn8ZCxb4co0tytvQqJef1z5r4i9XFMtxxZnPrNL3lVDHr5MSjzEfCEMZlU0T
         kYeQ==
X-Gm-Message-State: APjAAAUVuQC64Xc00xYnABtEjl9injxa8gfuxiUuSxNRTAT0+eY3cbiC
        8GslL685Onx8Z6PNcqAH672C2ho=
X-Google-Smtp-Source: APXvYqxqXy3iiWcj3hNDa625EQ39pvs4cZ94rXpyiwWPjpEjxEXyzXcmeRt2XoUGq9xTYbSTAq8o4Q==
X-Received: by 2002:a9d:6519:: with SMTP id i25mr7244981otl.287.1556672621912;
        Tue, 30 Apr 2019 18:03:41 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id s63sm15756259oif.52.2019.04.30.18.03.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 18:03:41 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:d5e:aa5a:44d8:6907])
        by serve.minyard.net (Postfix) with ESMTPSA id 8FDB61800CB;
        Wed,  1 May 2019 01:03:40 +0000 (UTC)
Date:   Tue, 30 Apr 2019 20:03:31 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4 0/1] Add support for IPMB driver
Message-ID: <20190501010300.GG6623@minyard.net>
Reply-To: minyard@acm.org
References: <cover.1556645340.git.Asmaa@mellanox.com>
 <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 09:24:29PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Asmaa Mnebhi <Asmaa@mellanox.com>
> > Sent: Tuesday, April 30, 2019 8:59 PM
> > To: minyard@acm.org; wsa@the-dreams.de; Vadim Pasternak
> > <vadimp@mellanox.com>; Michael Shych <michaelsh@mellanox.com>
> > Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org;
> > linux-i2c@vger.kernel.org
> > Subject: [PATCH v4 0/1] Add support for IPMB driver
> > 
> > Thank you for your feedback Vadim. I have addressed your comments.
> 
> Hi Asmaa,
> 
> Thank you for your comments and added doc.
> 
> > 
> > 1) You are correct. This driver is not specific to Mellanox so I have removed the
> > Mellanox attribute.
> > 
> > 2) I have added a documentation file called IPMB.txt which explains how this
> > module works and how it should be instantiated. It is very similar to the existing
> > linux i2c-slave-eeprom module.
> > 
> > The HW for my testing works as follows:
> > A BMC is connected to a Satellite MC via I2C (I2C is equivalent to IPMB). The
> > BMC initiates the IPMB requests and sends them via I2C.
> > Obviously the BMC needs its own driver to do this which I haven't included in this
> > code. We have no intent of upstreaming that at the moment.
> 
> I believe you are going to do it at some point, right?

This is a little confusing to me.  Why wouldn't you use the same driver on the
BMC?  IIRC, the IPMB protocol is symmetric at this level.

-corey

> 
> > This ipmb-dev-int driver is to be loaded and instantiated on the Satellite MC to
> > be able to receive IPMB requests. These IPMB request messages will be picked
> > up by a user space program such (in my case it is OpenIPMI) to handle the
> > request and generate a response.
> > The response will be then passed from the user program back to kernel space.
> > Then this driver would send that response back to the BMC.
> > 
> > 3) You asked the following:
> > 
> > "Is it expected to be zero in vaid case?"
> > The 8 least significant bits of the sum is always expected to be 0 in the case
> > where the checksum is valid. I have added a comment for clarifications.
> 
> 
> > 
> > "why do you need this cast?"
> > buf[++ipmb_dev_p->msg_idx]=(u8)(client->addr<<1)
> > This is because client->addr is of type unsigned short which is
> > 2 bytes so it is safer to typecast it to u8 (u8* buf)
> 
> Better, if you can avoid cast.
> Would compiler warn if you use for example
> rol16(client->addr, 1) & GENMASK(7, 0);
> or something like it?
> 
> 
> > 
> > "It could be only single ipmb-dev within the system? Couldn't it be few, like
> > master/slave for example?"
> > My understanding of your question is that: what if we have multiple instances of
> > ipmb-dev-int, that we register it under different addresses?
> > This driver only works as a slave so it will only be instantiated once on the
> > Satellite MC under one slave address.
> 
> I mentioned some config like:
> BMC1 (master)  -- busA --|
> 			Satellite
> BMC2 (standby)	-- busB --| 
> 
> Since this is not Mellanox specific driver, maybe it would be good to support
> multiple instances of it.

I second this.  Especially if it's on a BMC, you can expect to have multiple
IPMBs.

-corey

> 
> > 
> > Asmaa Mnebhi (1):
> >   Add support for IPMB driver
> > 
> >  Documentation/IPMB.txt           |  53 ++++++
> >  drivers/char/ipmi/Kconfig        |   8 +
> >  drivers/char/ipmi/Makefile       |   1 +
> >  drivers/char/ipmi/ipmb_dev_int.c | 381
> > +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 443 insertions(+)
> >  create mode 100644 Documentation/IPMB.txt  create mode 100644
> > drivers/char/ipmi/ipmb_dev_int.c
> > 
> > --
> > 2.1.2
> 
