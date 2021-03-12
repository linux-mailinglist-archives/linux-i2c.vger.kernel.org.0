Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC4233889D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 10:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbhCLJ0U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 12 Mar 2021 04:26:20 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:57501 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232885AbhCLJ0O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Mar 2021 04:26:14 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-246-bXCeiKEdM4OAsnjZn57_UQ-1; Fri, 12 Mar 2021 09:25:02 +0000
X-MC-Unique: bXCeiKEdM4OAsnjZn57_UQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 12 Mar 2021 09:25:01 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 12 Mar 2021 09:25:01 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Guenter Roeck' <linux@roeck-us.net>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Wolfram Sang <wsa@kernel.org>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXFr5yGwPv8sFHu0aW8iQkc3zyi6qAERyg
Date:   Fri, 12 Mar 2021 09:25:01 +0000
Message-ID: <1a7d43e6a16c46cdbe63b497b29ac453@AcuMS.aculab.com>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
In-Reply-To: <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Linuxppc-dev Guenter Roeck
> Sent: 11 March 2021 21:35
> 
> On 3/11/21 1:17 PM, Chris Packham wrote:
> >
> > On 11/03/21 9:18 pm, Wolfram Sang wrote:
> >>> Bummer. What is really weird is that you see clock stretching under
> >>> CPU load. Normally clock stretching is triggered by the device, not
> >>> by the host.
> >> One example: Some hosts need an interrupt per byte to know if they
> >> should send ACK or NACK. If that interrupt is delayed, they stretch the
> >> clock.
> >>
> > It feels like something like that is happening. Looking at the T2080
> > Reference manual there is an interesting timing diagram (Figure 14-2 if
> > someone feels like looking it up). It shows SCL low between the ACK for
> > the address and the data byte. I think if we're delayed in sending the
> > next byte we could violate Ttimeout or Tlow:mext from the SMBUS spec.
> >
> 
> I think that really leaves you only two options that I can see:
> Rework the driver to handle critical actions (such as setting TXAK,
> and everything else that might result in clock stretching) in the
> interrupt handler, or rework the driver to handle everything in
> a high priority kernel thread.

I'm not sure a high priority kernel thread will help.
Without CONFIG_PREEMPT (which has its own set of nasties)
a RT process won't be scheduled until the processor it last
ran on does a reschedule.
I don't think a kernel thread will be any different from a
user process running under the RT scheduler.

I'm trying to remember the smbus spec (without remembering the I2C one).
While basically a clock+data bit-bang the slave is allowed to drive
the clock low to extend a cycle.
It may be allowed to do this at any point?
The master can generate the data at almost any rate (below the maximum)
but I don't think it can go down to zero.
But I do remember one of the specs having a timeout.

But I'd have thought the slave should answer the cycle correctly
regardless of any 'random' delays the master adds in.
Unless you are getting away with de-asserting chipselect?

The only implementation I've done is one an FPGA so doesn't have
worry about interrupt latencies.
It doesn't actually support clock stretching; it wasn't in the
code I started from and none of the slaves we need to connect to
ever does it.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

