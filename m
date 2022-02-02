Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8984A7046
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 12:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbiBBLs5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 06:48:57 -0500
Received: from vps.xff.cz ([195.181.215.36]:38674 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230257AbiBBLs5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 06:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
        t=1643802535; bh=/hgS+imZp3qk+AdUYYHI9PR8cjgjAJL5NVJsn6Y/Qfo=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=OUAQ0Y9X5VJIeaAlKm6JLf233KpCdiNhEK913DmP088solZNxLLJ1cHObgtdaByCt
         RVo9X+LxOKl0cfpryd8OLNqFVhw6SWitYp0Ectv/sZTaOY48gAqckVW7XaiX53OhX5
         Uq/PX26yq/eCN+3os6vwMC7TqB4zNAb0edMfuDAM=
Date:   Wed, 2 Feb 2022 12:48:55 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 2/5] Input: pinephone-keyboard - Add PinePhone keyboard
 driver
Message-ID: <20220202114855.p36wlh4s3plpdyft@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129230043.12422-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello again Samuel,

On Sat, Jan 29, 2022 at 05:00:39PM -0600, Samuel Holland wrote:
> The official Pine64 PinePhone keyboard case contains a matrix keypad and
> a MCU which runs a libre firmware. Add support for its I2C interface.

I had one bug report from a user that reminded me of something that's
missing in the driver.

Please add a regulator support for power supply for the keyboard. On Pinephone
the keyboard needs USB-5V regulator to be enabled, because final version of the
keyboard is supplied from the VBAT POGO pin and not internally from kb battery,
as on the prototypes.

If this regulator is not enabled the keyboard will be supplied from battery
- voltage drop on a boost regulator diode, which causes very frequent brownouts
of the keyboard MCU.

Users don't notice, becuse MCU recovers quickly and only a key or two is missed
every once in a while, but it should be fixed. And this problem probably only
shows up when the phone battery is either quite discharged, or random load
spikes push its voltage bellow what's necessary for the MCU to run, temporarily.

kind regards,
	o.
