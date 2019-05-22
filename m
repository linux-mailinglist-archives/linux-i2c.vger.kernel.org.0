Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB1F625F7A
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 10:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbfEVI25 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 04:28:57 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49356 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726552AbfEVI25 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 04:28:57 -0400
X-Greylist: delayed 3003 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 May 2019 04:28:55 EDT
Received: from [109.168.11.45] (port=47788 helo=[192.168.101.64])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.91)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hTLpp-001bvJ-Jg; Wed, 22 May 2019 09:38:49 +0200
Subject: Re: [RFC 0/4] TI camera serdes - I2C address translation draft
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
References: <20190108223953.9969-1-luca@lucaceresoli.net>
 <20190521144034.100f9f8b@coco.lan>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <f3346136-1fba-dd85-8448-ce8d0580f0d3@lucaceresoli.net>
Date:   Wed, 22 May 2019 09:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521144034.100f9f8b@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 21/05/19 19:40, Mauro Carvalho Chehab wrote:
> Em Tue,  8 Jan 2019 23:39:49 +0100
> Luca Ceresoli <luca@lucaceresoli.net> escreveu:
> 
>> Hi,
>>
>> there has been some discussion on linux-media about video
>> serializer/deserializer chipsets with remote I2C capabilities from TI
>> [0] and Maxim [1]. I took part discussing how the remote I2C feature
>> of such chips could be best implemented in Linux while I was
>> implementing a driver for the Texas Instruments DS90UB954-Q1 video
>> deserializer. My approach is different from both the one used by
>> Vladimir Zapolskiy on other TI chips, which look similar to the
>> DS90UB954 in their I2C management, and the one used by Kieran Bingham
>> with Maxim chips, which have a different and simpler I2C management.
>>
>> After that I had to stop that work, so it is unfinished and I have no
>> plan to continue it. Upon suggestion by some linux-media developers
>> I'm sending my patches as RFC in the hope that they bring additional
>> material for the discussion.
>>
>> I2C management is quite complete in my patches, and it shows how I
>> envisioned I2C management. For the rest the code is in large part
>> incomplete. Don't consider the V4L2, GPIO and other sections as ready
>> for any review.
>>
>> The whole idea is structured around a central node, called the ATR
>> (Address Translator). It is similar to an I2C mux except it changes
>> the I2C addresses of transactions with an "alias" address for each
>> remote chip. Patch 2 has a detailed description of this process.
>>
>>
>> A typical setup looks like:
>>
>>                           Slave X @ 0x10
>>                   .-----.   |
>>       .-----.     |     |---+---- B
>>       | CPU |--A--| ATR |
>>       `-----'     |     |---+---- C
>>                   `-----'   |
>>                           Slave Y @ 0x10
>>
>>   A = "local" bus
>>   B = "remote" bus 0
>>   C = "remote" bus 1
>>
>> In patch 2 I enriched the i2c-mux to also act as an ATR. However the
>> implementation grew larger than I desired, so now I think it would
>> make sense to leave i2c-mux as is, and add a new i2c-atr.c which has
>> ATR features without much of the MUX code. However the implementation
>> would not change too much, so you can look at i2c-mux to see how I
>> implemented the ATR.
>>
>> In the ATR (i2c-mux.c) I implemented the logic needed to remap slave
>> addresses according to a table. Choosing appropriate aliases and
>> filling that table is driver-specific, so in this case it is done by
>> ds90ub954.c. The ATR driver needs to know when a new client appears on
>> the remote bus to setup translation and when it gets disconnected to
>> undo it. So I added a callback pair, attach_client and detach_client,
>> from i2c-core to i2c-mux and from there to the ATR driver. When
>> getting the callback the ATR driver chooses an alias to be used on the
>> local bus for the new chip, configures the ATR (perhaps setting some
>> registers) returns the alias back to the ATR which sill add the new
>> chip-alias pair to its table. The ATR (i2c-mux) then will do the
>> translation for each message, so that the alias will be used on the
>> local bus and the physical chip address on the remote bus.
>>
>> The alias address for a new client is chosen from an alias pool that
>> must be defined in device tree. It is the responsibility of the DT
>> writer to fill the pool with addresses that are otherwise unused on
>> the local bus. The pool could not be filled automatically because
>> there might be conflicting chips on the local bus that are unknown to
>> the software, or that are just connected later.
>>
>> The alias pool and the mapping done at runtime allow to model
>> different camera modules [or display or other modules] similarly to
>> beaglebone capes or rpi hats, up to a model where:
>>
>>  1. there can be different camera modules being designed over time
>>  2. there can be different base boards being designed over time
>>  3. there is a standard interconnection between them (mechanical,
>>     electrical, communication bus)
>>  4. camera modules and base boards are designed and sold independently
>>     (thanks to point 3)
>>
>> The implementation is split in the following patches:
>>  * Patch 1 adds the attach_client() and detach_client() callbacks to
>>    i2c-core
>>  * Patch 2 adds similar callbacks for the use of device drivers and,
>>    most importantly, implements the ATR engine
>>  * Patch 3 adds a farily complete DT bindings document, including the
>>    alias map
>>  * Patch 4 adds the DS90UB954-Q1 dual deserializer driver
>>
>> There is no serializer driver here. The one I have is just a skeleton
>> setting a few registers, just enough to work on the deserializer
>> driver.
> 
> Not sure what to do here... I guess I'll just mark the patches as
> RFC at media patchwork, as someone has to need support for it and need
> to finish its implementation.

I just did it.

As I wrote in the cover letter, I was not actively working on the topic
and sent these patches as an additional input for the discussion about
I2C address translation and serdes chips in general.

-- 
Luca
