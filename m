Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2373415BC3C
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2020 10:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbgBMJ6W convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 13 Feb 2020 04:58:22 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:27682 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729422AbgBMJ6V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Feb 2020 04:58:21 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-31-urz-U1i-MRqONzuPEzu5jQ-1; Thu, 13 Feb 2020 09:58:16 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 13 Feb 2020 09:58:15 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 13 Feb 2020 09:58:15 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Wolfram Sang' <wsa@the-dreams.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC:     Thor Thayer <thor.thayer@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: altera: Fix potential integer overflow
Thread-Topic: [PATCH v2] i2c: altera: Fix potential integer overflow
Thread-Index: AQHV4k1iLqSOpbmHb06oJubj/a823KgY4cbQ
Date:   Thu, 13 Feb 2020 09:58:15 +0000
Message-ID: <c3f7553c759c46539065a8122538c248@AcuMS.aculab.com>
References: <20200211144704.GA6461@embeddedor> <20200213090959.GA2123@ninjato>
In-Reply-To: <20200213090959.GA2123@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: urz-U1i-MRqONzuPEzu5jQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Wolfram Sang
> Sent: 13 February 2020 09:10
> 
> On Tue, Feb 11, 2020 at 08:47:04AM -0600, Gustavo A. R. Silva wrote:
> > Factor out 100 from the equation and do 32-bit arithmetic (3 * clk_mhz / 10)
> > instead of 64-bit.
> >
> > Notice that clk_mhz is MHz, so the multiplication will never wrap 32 bits
> > and there is no need for div_u64().
> 
> Was there ever? With
> 
> 	u32 clk_mhz = clk_get_rate(idev->i2c_clk) / 1000000;
> 
> a later multiplication with 300 should not wrap u32?
> 
> >  	/* SDA Hold Time, 300ns */
> > -	writel(div_u64(300 * clk_mhz, 1000), idev->base + ALTR_I2C_SDA_HOLD);
> > +	writel(3 * clk_mhz / 10, idev->base + ALTR_I2C_SDA_HOLD);
> 
> The change itself is OK, yet I wonder about the comment above:
> 
> 'clk_mhz * 0.3' will not give a constant 300ns, or?

Depends on the definition of the register.
A count of zero may mean one clock period.
So maybe it could have (3 * clk - 1)/10 instead of (3 * clk + 9)/10.
OTOH nothing probably requires that much hold time.

If that is the 'standard' Altera Avalon slave I2C 'megafunction' I2C
master then it is probably so slow to use it can't matter.
Most of those blocks are crap, they aren't even small.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

