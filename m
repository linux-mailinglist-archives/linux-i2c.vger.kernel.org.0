Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8897C4E78A2
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 17:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345725AbiCYQHp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 12:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376788AbiCYQHn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 12:07:43 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D353DADD4C;
        Fri, 25 Mar 2022 09:06:03 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 22A2120017;
        Fri, 25 Mar 2022 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648224362;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OmLCCG+BLT1iz0t7B8XkvPihtZK0nCtLSKmw6H7JeSY=;
        b=jdDyuNnMEmgkeUFI2N7CJss/jqgouRRA1Igq+hum5gfUlrEFmhXzpb8hN8So6b5rnwTFvQ
        MHBsBaoKLqGTnSh0zHXblsx3zoEwqLeyn3cpfe882FyhTNeEu4X6vOlnNsvIaKJYkwwtmo
        o8Po3UonYgE2uqjEEkf6PIranKPc5Ag2bcWbSg1bEgweCM805edyN0JIelzZEUM+/qeVO9
        uiS9eX0LRfd5LL73s1t221Zw39QU3rzkXy1dF0fsd+x8kXyw8jXxRWJAE/16HUTK8doCFJ
        10RzkslJGcH6pHDtQOmVIkPJZQytZQddSpYW2bC61urYiGhakwQZJqVWyFQ4oQ==
Date:   Fri, 25 Mar 2022 17:04:39 +0100
From:   =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/9] i2c: fwnode: add
 fwnode_find_i2c_adapter_by_node()
Message-ID: <20220325170439.75ce012d@fixe.home>
In-Reply-To: <Yj3mO/Co/RdlZnV+@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
        <20220325113148.588163-7-clement.leger@bootlin.com>
        <Yj3TSBEY/P7d8XJj@smile.fi.intel.com>
        <20220325160927.30e5aef8@fixe.home>
        <Yj3mO/Co/RdlZnV+@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le Fri, 25 Mar 2022 17:56:43 +0200,
Andy Shevchenko <andriy.shevchenko@linux.intel.com> a =C3=A9crit :

> >=20
> > Can't tell, I would not want to introduce some behavior wrt to parent
> > node for ACPI since it was not done this way. Might works in 99% of the
> > case though.
> >=20
> > If ok with that, I can drop it. =20
>=20
> Let's ask Mika and Jarkko if they know more on this. I think Mika was the
> one who introduced that (sorry, if I'm mistaken, haven't looked at the hi=
story
> carefully).
>=20
> P.S. Interesting enough that Mika is listed as I2C ACPI maintainer and his
> email is not in the Cc. Please, check how you form Cc list for this series
> and include all parties next time.

I'm using get_maintainers.pl which does not return Mika nor Jarkko. I
was using --nogit which probably ruled out some contributors but not
them apparently.

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
