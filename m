Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAAF961BF6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 10:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbfGHIxy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jul 2019 04:53:54 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:62516 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727636AbfGHIxx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jul 2019 04:53:53 -0400
Received: from [85.158.142.103] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 6E/A7-10067-E94032D5; Mon, 08 Jul 2019 08:53:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsUyo1hfUncei3K
  swZfPHBZ/Jx1jt/gy9xSLRfPi9WwWU/4sZ7Lo+PuF0YHV4/evSYwe72+0snvcubaHzWP/3DXs
  Hp83yQWwRrFm5iXlVySwZhz8FFZwir1i38m/zA2M31m7GLk4hATWMEp8eruHpYuRk4NXwFhi5
  rNPTCC2sIC/xK/+b8xdjBwcbAK6El13TEHCIkAlTXvbGEF6mQWWMkpMmjgdrJdFQEXi5romRp
  B6ToFAib1tWRDz+5gkjh+aBDaTWUBTonX7b3YQW0JAQ2LDzWNMEHsFJU7OfMICUSMv0bx1Nth
  eIQFZiaOXYiHKFSTObpnICGEnSZzru8I2gVFgFpKps5BMmoVk0gJG5lWMlklFmekZJbmJmTm6
  hgYGuoaGxrpgUi+xSjdRL7VUNzk1r6QoESirl1herFdcmZuck6KXl1qyiREYCymFDIU7GD/Me
  qN3iFGSg0lJlDckVT5WiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvHjC6hASLUtNTK9Iyc4BxCZ
  OW4OBREuGtZAZK8xYXJOYWZ6ZDpE4xKkqJ8+qCJARAEhmleXBtsFRwiVFWSpiXkYGBQYinILU
  oN7MEVf4VozgHo5Iw7yuQKTyZeSVw018BLWYCWlwXqQSyuCQRISXVwBR0KcKzwVVn2Yu803tV
  hAwVDK68tDj4cvo9pv5jh416bm7cG7/QKWlNwzHJuqm1zTbNXz1/zin2bnjw8YjqvYmtmjzLM
  hRve2/9ubdxd6mP93/pCI3ZX/17uo9uZZeJN7VZ7sUm3Rf/6/ekKVPW168Oz360IWz39n/LJn
  TcqT8WMi3eR5I/qnbhHIOK+ozOPo9Yu46AY7fiZs3rlLBezFZ659LKxzvKtvA8dai3vB96bem
  9zEPVT3S/zGEp0Qp751WmYZH599eNossZOpVHy1b/Pf7rwLqeD1vjPv7wvZPXnKR+bu6bsw7z
  VGe947nvKskmqH/qYMOc7z86HxvEsuZKJbvr5HerJjJdS6vy/6/EUpyRaKjFXFScCAAH0QhOg
  AMAAA==
X-Env-Sender: cst@phaseone.com
X-Msg-Ref: server-8.tower-228.messagelabs.com!1562576029!154416!1
X-Originating-IP: [152.115.47.25]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26456 invoked from network); 8 Jul 2019 08:53:50 -0000
Received: from unknown (HELO Exchange2.phaseone.com) (152.115.47.25)
  by server-8.tower-228.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 8 Jul 2019 08:53:50 -0000
Received: from cstu16.phaseone.com (172.16.2.207) by Exchange2.phaseone.com
 (172.16.1.180) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 8 Jul
 2019 10:53:49 +0200
Message-ID: <1562576029.10420.2.camel@phaseone.com>
Subject: Re: [PATCH] eeprom: at24: Limit gpio calls to when wp_gpio is
 defined
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     linux-i2c <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 Jul 2019 10:53:49 +0200
In-Reply-To: <CAMpxmJVX=x5ed9yTyczEqiaEp8nfS1VWZkMaBwToqMX9nMu80g@mail.gmail.com>
References: <1562347885-58349-1-git-send-email-cst@phaseone.com>
         <CAMpxmJX3x5kOi63+cs5JFHp2Eu5W+0=zKBURcde7pZ5K_2=3nA@mail.gmail.com>
         <4359efb29daa2a6922e651bba90908794190de07.camel@phaseone.com>
         <CAMpxmJVX=x5ed9yTyczEqiaEp8nfS1VWZkMaBwToqMX9nMu80g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.2.207]
X-ClientProxiedBy: Exchange3.phaseone.com (172.16.1.184) To
 Exchange2.phaseone.com (172.16.1.180)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2019-07-08 at 10:26 +0200, Bartosz Golaszewski wrote:
> sob., 6 lip 2019 o 19:57 Claus H. Stovgaard <cst@phaseone.com>
> napisał(a):
> > 
> > 
> > On lør, 2019-07-06 at 19:33 +0200, Bartosz Golaszewski wrote:
> > > 
> > > Hi Claus,
> > > 
> > > gpiod_set_value_cansleep() doesn't complain if the passed
> > > descriptor
> > > is NULL - it just quietly returns. Could you give me some more
> > > info
> > > on
> > > how you trigger this warning?
> > > 
> > > Bart
> > Hi Bart
> > 
> > If you don't have enabled gpiolib, (E.g. CONFIG_GPIOLIB is not set)
> > gpiod_set_value_cansleep ends in /include/linux/gpio/consumer.h 
> > 
> Cc Linus Walleij
> 
> I see. This isn't a problem with at24 but with the GPIO API. I Cc'ed
> you on a patch I've just sent. Please take a look a possibly test.
> 
> Bart

Hi Bart

Have just looked at the patch and it look good to me.
Will test it, and answer on the separate patch mail, but think it will
work great for me.

Claus
