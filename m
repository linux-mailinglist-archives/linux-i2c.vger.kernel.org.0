Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D884FE7256
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2019 14:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730529AbfJ1NFg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Oct 2019 09:05:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5201 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726816AbfJ1NFg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Oct 2019 09:05:36 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 045BF4DEF3DE6ABFDDF8;
        Mon, 28 Oct 2019 21:05:28 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Mon, 28 Oct 2019
 21:05:23 +0800
Date:   Mon, 28 Oct 2019 13:05:15 +0000
From:   Jonathan Cameron <jonathan.cameron@huawei.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Jakub Ladman <ladmanj@volny.cz>, Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-iio@vger.kernel.org>
Subject: Re: [PATCH][RESEND] New driver for TLV493D-A1B6 I2C chip, input and
 hwmon class device.
Message-ID: <20191028130515.00003bb0@huawei.com>
In-Reply-To: <20191018205637.GS35946@dtor-ws>
References: <966f09b8-0936-6d90-2ec8-bcb1b94c81aa@volny.cz>
        <20191018205637.GS35946@dtor-ws>
Organization: Huawei
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 18 Oct 2019 13:56:37 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Hi Jakub,
> 
> On Fri, Oct 18, 2019 at 10:10:19PM +0200, Jakub Ladman wrote:
> > Dear maintainers.
> > 
> > As a linux-patch newbie i made some mistakes in my first attempt to send
> > this patch.
> > This patch contains a new driver for i2c connected chip, Infineon
> > TLV493D-A1B6.
> > The chip is 3D hall-effect sensor with thermometer.
> > 
> > This particular driver senses magnetic field rotation in X/Y plane with 1
> > degree resolution and +/- 1 degree error.
> > 
> > Input device is created for the angle sensing part.
> > Hwmon device is created for the thermometer part.
> > 
> > Input device axis must be configured by device-tree. There are also optional
> > parameters regarding absolute/relative mode switching, minimum step in
> > relative mode, filtering and thermometer calibration.
> > 
> > We are using that device as high reliability rotary encoder.  
> 
> I wonder if IIO subsystem that support s magnetometers and temperature
> sensors would not be a better hone for this.
> 
> CC-ing Jonathan.
> 
Hi Jakub, Dmitry,

Sorry for slow reply, was on vacation.

Anyhow, from a quick glance at the datasheet this looks like a fairly standard
magnetometer, be it one designed for use with an associated magnet, rather than
intended for use to measure the earths magnetic field (compass type chips).

These devices only become an 'input device' once the relative positioning relative
to the magnet is known.  We should probably figure out a way to represent that
in DT etc for devices where it is known.  Whether we then do a bridge to input
using that info in kernel or pass it all up to userspace to deal with is a
separate issue, that position information needs to be described first.  My suspicion
is that it would be hard to handle the maths in kernel, but I've not tried
working it out!

So this would fit in IIO, even if the eventual 'use case' is classic input
(I'm guessing a rotary dial).

We have a driver for a part with similar support undergoing revisions at the
moment:

https://www.azoteq.com/images/stories/pdf/iqs624_datasheet.pdf

There might be other hall effect devices like this in IIO, I can't recall but
I certainly have one in my todo pile.

+CC linux-iio

Thanks,

Jonathan


> Also, your mailer mangled your patch pretty badly, please consider using
> git send-email next time.


> 
> Thanks.
> 


