Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6816122C3
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 21:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfEBTt7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 15:49:59 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44173 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfEBTt7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 May 2019 15:49:59 -0400
Received: by mail-ot1-f65.google.com with SMTP id d24so3211668otl.11;
        Thu, 02 May 2019 12:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d7+HVRFu2AM1fwp/Uxq8TRBExBNTog8jh7HtzwRzt94=;
        b=lXNG4ojT3BglYHazpv3qSM3NYPE1mD57Aeou3aln3uVU5dqizMm8TMaFk8WMB+Tvn+
         LTrPsYrfaH/PMfgCoZTo49152T4a4aWVo/AX3QWQWyllUqTqA0eLxDxDYAVWLC/dhck7
         yDcWwLw0x+R4bNKBnq3o0vinuEf5EfJEdyKHMIXCBwi4DLKehfIr1MRoLz8He63SeRRK
         lX04fQmbW8mmPaUucAXaBAPEnSdYkTbjMsaGThj+YAEdDF2l0+RqL5jOlwl9PM5X0q+R
         SoyOMKA+uvbW1z96NwVTp8MEb81gj/ptikBF1j8NXC9WuMG5DJq0UlDPwfXG8CzzlZBN
         /M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=d7+HVRFu2AM1fwp/Uxq8TRBExBNTog8jh7HtzwRzt94=;
        b=ghRg0jxhbIUi5jIvxSO3LzM2/SfcHsjeKStVRARJ3XBOx5mVmw3elrr/YXZ8tXaBM5
         MTLCh1MKGCgLcKYs9LNFH2UpygEAm/dORtu8IIrbemgdwZWh3SPokEiO8ZiZoOU4br9o
         OFcqom25Hjw81bQ+6EO2hlbE3cYu105AV4H9Ne46zmOLrXXUL1OL/w6idNqX0gov03RP
         zh4IPtORZziizxKOfRks/tYfzbI9QGFxz1M3jt1ABMI//l6c8ZUeE5HyVVmLClE4tAyw
         yB5wiW8pq38zT7V0hh4+eKjlYWG/6RDYUpIUp8Q6vnnq5BtjxZy8PrBgmM1OCCcPswXq
         yQwQ==
X-Gm-Message-State: APjAAAUq1CLcPv2A/OKJBCZtPzUjLc+m3neSexY3he/9fRPIyvDNIoiq
        At46SWxK3ofWhXrv1f0UUyvqUYE=
X-Google-Smtp-Source: APXvYqy3yUl1wopzjKHf7MOpJTgph/paN0jdERludfx+3GS9QCVlRhdPn2LWvW5MZjwV3ClkyV3lqA==
X-Received: by 2002:a9d:7411:: with SMTP id n17mr3699349otk.205.1556826598024;
        Thu, 02 May 2019 12:49:58 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id o5sm17085160otl.44.2019.05.02.12.49.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 12:49:56 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:d5e:aa5a:44d8:6907])
        by serve.minyard.net (Postfix) with ESMTPSA id C9A031800D6;
        Thu,  2 May 2019 19:49:55 +0000 (UTC)
Date:   Thu, 2 May 2019 14:49:54 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>
Cc:     Vadim Pasternak <vadimp@mellanox.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4 0/1] Add support for IPMB driver
Message-ID: <20190502194954.GJ6623@minyard.net>
Reply-To: minyard@acm.org
References: <cover.1556645340.git.Asmaa@mellanox.com>
 <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <VI1PR05MB62392EDC0FD3C960519C91ABDA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR05MB62392EDC0FD3C960519C91ABDA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 02, 2019 at 06:06:12PM +0000, Asmaa Mnebhi wrote:
> Hi Vadim, Hi Corey,
> 
> Please find inline comments answering your questions.
> 
> -----Original Message-----
> From: Vadim Pasternak 
> Sent: Tuesday, April 30, 2019 5:24 PM
> To: Asmaa Mnebhi <Asmaa@mellanox.com>; minyard@acm.org; wsa@the-dreams.de; Michael Shych <michaelsh@mellanox.com>
> Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org; linux-i2c@vger.kernel.org
> Subject: RE: [PATCH v4 0/1] Add support for IPMB driver
> 
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
> > 1) You are correct. This driver is not specific to Mellanox so I have 
> > removed the Mellanox attribute.
> > 
> > 2) I have added a documentation file called IPMB.txt which explains 
> > how this module works and how it should be instantiated. It is very 
> > similar to the existing linux i2c-slave-eeprom module.
> > 
> > The HW for my testing works as follows:
> > A BMC is connected to a Satellite MC via I2C (I2C is equivalent to 
> > IPMB). The BMC initiates the IPMB requests and sends them via I2C.
> > Obviously the BMC needs its own driver to do this which I haven't 
> > included in this code. We have no intent of upstreaming that at the moment.
> 
> >> I believe you are going to do it at some point, right?
> @Vadim Pasternak: I would.
> @Corey: The ipmb-dev-int driver is not responsible for sending requests via I2C (unlike for example the ipmi_ssif driver). It is only responsible for receiving those requests and passing them to a user space program. Once a response is received from user space, it will forward that response back to the requester So in my testing for example, the source requester is the BMC, so I issue ipmitool commands from the BMC itself.
> 
> The driver that I have on my BMC (which I primarily designed for testing ipmb-dev-int) works hand in hand with the ipmi_msghandler and ipmi_devint to create the /dev/ipmi0 device file to enable the use of ipmitool program on the BMC. Once an ipmitool command is issued on the BMC,  the request message is sent to the Satellite MC. Once the BMC driver gets the response back from the Satellite MC, it will pass it to the ipmitool program which will display the output to the user. 
> 
> Please note that this ipmb-dev-int driver does not need ipmi_msghandler nor does it need ipmi_devintf to be loaded.

Ah, I misunderstood.  I thought you were talking about the IPMB driver on
the BMC.  So what you have is something like:

    Host                   BMC              Sat MC
    ----                   ---              ------
                       ipmb-dev-int <----> ipmb-dev-int
    Linux IPMI drv <---> ipmi-host-int

I assume you can use the same ipmb-dev-int on the BMC and satellite MCs
(assuming Linux runs on both).  You have another driver that runs on
the BMC that talks to the host system through some sort of semi-custom
interface, and then another driver that's on the Linux host that sits
under ipmi_msghandler and provides the host access to that interface.

That's a separate issue, as you said.

-corey

> 
> > This ipmb-dev-int driver is to be loaded and instantiated on the 
> > Satellite MC to be able to receive IPMB requests. These IPMB request 
> > messages will be picked up by a user space program such (in my case it 
> > is OpenIPMI) to handle the request and generate a response.
> > The response will be then passed from the user program back to kernel space.
> > Then this driver would send that response back to the BMC.
> > 
> > 3) You asked the following:
> > 
> > "Is it expected to be zero in vaid case?"
> > The 8 least significant bits of the sum is always expected to be 0 in 
> > the case where the checksum is valid. I have added a comment for clarifications.
> 
> 
> > 
> > "why do you need this cast?"
> > buf[++ipmb_dev_p->msg_idx]=(u8)(client->addr<<1)
> > This is because client->addr is of type unsigned short which is
> > 2 bytes so it is safer to typecast it to u8 (u8* buf)
> 
> >>Better, if you can avoid cast.
> >>Would compiler warn if you use for example rol16(client->addr, 1) & GENMASK(7, 0); or something like it?
> I thought it wouldn't be too much of an issue to use typecast here since other existing ipmi drivers use typecasting: bt-bmc.c, kcs_bmc_aspeed.c, kcs_bmc_npcm7xx.c all use (u8) typecasting. 
> But if you really think it is worth it, I could do that.
> I just think it is not as straight forward to read this code as using a simple typecast. Some might wonder why a GENMASK is needed in this case.
> 
> 
> 
> > 
> > "It could be only single ipmb-dev within the system? Couldn't it be 
> > few, like master/slave for example?"
> > My understanding of your question is that: what if we have multiple 
> > instances of ipmb-dev-int, that we register it under different addresses?
> > This driver only works as a slave so it will only be instantiated once 
> > on the Satellite MC under one slave address.
> 
> >>I mentioned some config like:
> >>BMC1 (master)  -- busA --|
> >>			Satellite
> >>BMC2 (standby)	-- busB --| 
> 
> >>Since this is not Mellanox specific driver, maybe it would be good to support multiple instances of it.
> 
> I see, I understand now. That sounds good.
> I added support to instantiate several ipmb devices for the purpose of having multiple BMC masters for one Satellite MC. The design consists in naming each instantiated device with the IPMBus/I2C bus number associated with it. For example, :
> BMC1 -----I2C/IPMB bus 1 ----- Satellite MC (/dev/ipmb-1)
> BMC2 -----I2C/IPMB bus 2 ----- Satellite MC (/dev/ipmb-2)
> 
> I added documentation for that as well.
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
