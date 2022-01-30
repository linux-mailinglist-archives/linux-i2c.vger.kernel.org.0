Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46D64A3371
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 04:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346521AbiA3DAg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 22:00:36 -0500
Received: from vps.xff.cz ([195.181.215.36]:38670 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233631AbiA3DAf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jan 2022 22:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
        t=1643511631; bh=4l/ULEc8ujmpLQWb+230r+2OesYWDoDMw0xwaEJn5aU=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=j9cHQLWIOywkDm5uJkaaeIL8VVycu8Lr6VbWxProd2fM2cmFILw341Fy6OzW1owXC
         y5n+ChHlLyiCTk27iju/oLj8tAdBokp5jPCuQwCzeGO4NkU+hBuurYd9Hn98SupMbO
         c6seK38ajL8BIXF4sPg+R4faGiqKBoLaFfNwhM7A=
Date:   Sun, 30 Jan 2022 04:00:31 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 4/5] Input: pinephone-keyboard - Support the proxied I2C
 bus
Message-ID: <20220130030031.v2jbebaz7rs2d6vm@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-5-samuel@sholland.org>
 <20220130020523.f7mx36yj6nlqthoe@core.my.home>
 <4d642ba4-bd34-814d-8ae1-c90c87fa4bc4@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d642ba4-bd34-814d-8ae1-c90c87fa4bc4@sholland.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jan 29, 2022 at 08:43:30PM -0600, Samuel Holland wrote:
> On 1/29/22 8:05 PM, Ondřej Jirman wrote:
> > 
> > Please use a single read transfer to get both command result and data.
> > There will be less risk that some userspace app will issue another command
> > in between command status being read as 0 and data byte being read.
> > 
> > Otherwise if you use this in some read/modify/write operation, you
> > may write unexpected value to PMIC. I2C register layout is designed
> > to make this as optimal as possible in a single I2C transaction, so
> > you only need 3 bytes to start command and 2 bytes to read the result
> > and data, both in a single xfer. There's very high likelihood the command
> > will complete in those 300 - 500 us anyway, because the timing is
> > predictable. If this delay is set right, it's almost guaranteed,
> > only two xfers will be necessary to run the command and get the result+
> > status.
> 
> I did this originally, but it causes a different race condition: since the data
> is read first, the command can complete between when the data is read and when
> the result is read. If this happens, the command will be seen as complete, but
> the data will be garbage.
> 
> This caused occasional read errors for the charger's power supply properties,
> because I2C reads sometimes returned nonsensical values for those bytes.

Oh, well. :) I guess the firmware would need to wait for any ongoing I2C
tranfer to finish before setting the command status to 0, for this to work.
Another lesson learned. :(

> > And if possible, it would be best if the bus was somehow made busy for
> > other users, until the whole comand/result sequence completes, to eliminate
> > the possibility of another command being issued by other bus users
> > around [1].
> 
> Yes, I can add a call to i2c_lock_bus() here.

Perfect.

thank you,
	o.

> Regards,
> Samuel
