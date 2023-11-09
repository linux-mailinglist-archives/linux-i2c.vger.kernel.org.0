Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE3E7E6B9F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 14:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbjKINwT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 08:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234276AbjKINwS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 08:52:18 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877FC30D6
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 05:52:16 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id DEB2421986;
        Thu,  9 Nov 2023 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1699537934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ORL1Y/rH2R9x9+LOiCsDFxbicNae39H3TWlx2DOAhF8=;
        b=lrAOzq3oKeExkZiw6nc2G2G84ooi0KRYbz1qfzZvPH82ySh1SZOxN867zUovli+Vsyp4P/
        hLVpot1bS5/a+Burdeyd5qmo5n0Kv+JoR/T6CUfnHKWreBvV3YsVUko0FLokATgmP0DOdB
        +s0qgWAP3+eeGXf8UB8bj+sy8uujz2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1699537934;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ORL1Y/rH2R9x9+LOiCsDFxbicNae39H3TWlx2DOAhF8=;
        b=yQD+STqtBXyDr2Lo69dywrCYg6Iaw5p6eFnXIpOWKPr+jSUDghqo//xzK5LpeloE5mMrcu
        EvQ25Bj/ibQTPEDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9152138E5;
        Thu,  9 Nov 2023 13:52:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5OahJw7kTGUUXAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 09 Nov 2023 13:52:14 +0000
Date:   Thu, 9 Nov 2023 14:52:12 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] i2c: i801: Use I2C_CLASS_HWMON for i2c mux children
Message-ID: <20231109145212.01f7b597@endymion.delvare>
In-Reply-To: <a22978a4-88e4-46f4-b71c-032b22321599@gmail.com>
References: <45c5366f-cbee-4c7d-bb62-a446935b2729@gmail.com>
        <20231106155036.366fb752@endymion.delvare>
        <a22978a4-88e4-46f4-b71c-032b22321599@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Tue, 7 Nov 2023 09:04:34 +0100, Heiner Kallweit wrote:
> On 06.11.2023 15:50, Jean Delvare wrote:
> > There may also be a hardware monitoring device on the parent segment on
> > these boards. With this change, that device will no longer be detected.
> > That would be a regression, so I have to nack this proposed change,
> > sorry.
>
> Hmm, right. To me it seems we have a fundamental problem:
> The parent has no way to find out whether a detected device sits on
> the parent segment or whether it belongs to a muxed child segment.
> In the latter case the device may show up twice, as you mentioned
> before.

Indeed. This is a fundamental limitation of SMBus multiplexing, which
makes devices on the parent segment also visible on all children
segments.

> And the core check "supported classes of parent and child must not
> overlap" doesn't consider that we may have e.g. hwmon devices
> on parent segment and on muxed child segment too.

Indeed. This worked when I implemented it only due to the combination
of 3 factors:
* The only hardware monitoring devices on the children SMBus segments
  of the supported Asus boards were the temperature sensors optionally
  integrated in the memory modules.
* No I2C device driver was using more than one auto-detection class, so
  it was possible to partition auto-detection based on class flags
  (this assumption got broken by commit eacc48ce3acc later on).
* The jc42 driver was using class I2C_CLASS_SPD instead of
  I2C_CLASS_HWMON (something we want to change now).

The only safe and universal way to handle a muxed SMBus topology is to
get rid of auto-detection entirely and instead explicitly instantiate
all devices on the bus segment where we know they reside.

> > The only way forward I can think of (if we want to get rid of
> > I2C_CLASS_SPD) would be to remove device auto-detection on children
> > segments completely (.class = 0 for them) and instead actively probe
> > for SPD EEPROMs and JC42 thermal sensors on these segments. For SPD we
> > should be able to just reuse i2c_register_spd(). For JC42 we would need
> > similar code, which doesn't exist yet.
> 
> Regarding the first part, removing auto-detection on muxed children:
> We have only two i2c mux drivers supporting auto-detection, i2c-mux-gpio
> and i2c-mux-reg. Both do not support auto-detection for DT-configured
> systems.

Well, if a device tree has been defined then devices are listed
explicitly and auto-detection isn't needed.

> Only user for i2c-mux-gpio is i801. Only user for i2c-mux-reg is
> drivers/platform/x86/mlx-platform, and it doesn't make use of
> auto-detection.
> So I think as first step we should remove auto-detection support from
> i2c-mux-reg.

If it's unused, yes, we could and should, to prevent future usage as we
now know this isn't the way to go.

> Then we could do the same for i2c-mux-gpio, and afterwards remove the
> class parameter from i2c_mux_add_adapter().

Right now, things are a bit clumsy, as the same device may end up being
registered twice (once on the parent segment, once on the child
segment) but this does not prevent monitoring the system. If you drop
auto-detection without providing a replacement, you actually break
system monitoring altogether. So the explicit device registration code
must be ready before we consider dropping auto-detection support.

In other words, we must convert the users first, and only when there's
no user left, we can drop the unused code.

> So we need an "i2c_register_jc42()" only for use by i801.
> What's good, because we can make this function private to i801 and
> won't attract any potential additional users.

I disagree on that point. There's nothing i2c-i801-specific to
i2c_register_jc42(), and it should be just as public and usable by
other I2C bus drivers as i2c_register_spd(). Not only we don't want to
discourage people from using these functions, but with the removal of
the legacy eeprom driver, we actually want to encourage people to use
these fonctions, to restore the lost functionality.

My work on i2c-i801 with commit 01590f361e94 ("i2c: i801: Instantiate
SPD EEPROMs automatically") was meant as an experiment to pave the
road. There's no reason why other SMBus controller drivers used on
PC-style systems wouldn't do exactly the same. The i2c-piix4 driver is
a prime example of this. Not sure if there are actually other drivers
falling into that category, as I think all Intel-based systems would use
i2c-i801 and all AMD-based systems would use i2c-piix4 these days.

About i2c_register_jc42(), I'm not sure if it can be a standalone
function separated from i2c_register_spd(). While SPD EEPROMs are
mandatory to have on memory modules, temperature sensors aren't. Also I
think I recall that the JC42.4 temperature sensors standard is tied to
the DDR4 memory type. So, to be on the safe side, we shouldn't blindly
probe for jc42 devices on all supported addresses. Instead, we should
only probe for addresses which correspond to an SPD EEPROM which has
been successfully probed earlier, and only if memory type is DDR4.

For example, if DMI data says the system is using DDR4 and we were able
to detect and instantiate an ee1004 SPD device at I2C address 0x50 then
we should probe for a JC42.4-compliant temperature sensor device at I2C
address 0x18. An SPD EEPROM at 0x51 would correspond to a possible
JC42.4-compliant device at 0x19, and so on.

This is a little more work than probing all supported addresses
arbitrarily, but this will avoid poking at other devices in ways which
could have nasty side effects.

-- 
Jean Delvare
SUSE L3 Support
