Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12FC4E516F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 12:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243918AbiCWLl7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 07:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbiCWLl7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 07:41:59 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56EF79381;
        Wed, 23 Mar 2022 04:40:27 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 50A64240002;
        Wed, 23 Mar 2022 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648035626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qZUV/TzHFuBA7PT65sAi92Pvx6d6R0ZEOHwpVbAW3pk=;
        b=pje82F/U6FOu2Sq9GGG2GcXmgly9FslvMlgYhayqWmQM3maqGWMjghMSJ/N5E2yks6V07t
        wmHoT1mwJzDOZZXQwMbhCN3rHJunJ2en96UWdGZoocbzyFgDyuaeZRE4CD1bJi7oxfgwMN
        bgA8DTZx4e+sNIucp4H7s67VvSBLNapH9cVXk+PbFlo8Y1HMTGDX0/Raf2HLJv3ZuTjIqq
        zocXhlveejxkXmGjnz07HExGnmJQfwjEefVDawQuX07xyOXP5b7X0A5XLMzrpNbQRVM6SU
        +wN/NlZwCgl8O2+0PaH24s78TuNl4OC8Q6dwthTzUdGw1AQ327Iuq14AAP0RVA==
Date:   Wed, 23 Mar 2022 12:39:02 +0100
From:   =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/7] device property: add
 fwnode_property_read_string_index()
Message-ID: <20220323123902.37e45f78@fixe.home>
In-Reply-To: <YjsFr4m/7pspMxD0@paasikivi.fi.intel.com>
References: <20220323091810.329217-1-clement.leger@bootlin.com>
        <20220323091810.329217-2-clement.leger@bootlin.com>
        <YjsFr4m/7pspMxD0@paasikivi.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le Wed, 23 Mar 2022 13:34:07 +0200,
Sakari Ailus <sakari.ailus@linux.intel.com> a =C3=A9crit :

> >   * @get_parent: Return the parent of an fwnode.
> > @@ -123,6 +126,9 @@ struct fwnode_operations {
> >  	(*property_read_string_array)(const struct fwnode_handle *fwnode_hand=
le,
> >  				      const char *propname, const char **val,
> >  				      size_t nval);
> > +	int (*property_read_string_index)(const struct fwnode_handle *fwnode,
> > +					  const char *propname, int index,
> > +					  const char **string); =20
>=20
> Could this instead be done by adding an index argument to the
> property_read_string_array?

Hi Sakari,

I guess I could do that. Do you expect the string pointer to be
returned in "val" ? Guess a -1 index would mean that we don't care
about the index but want the array to be returned. And if index is
specified, nval will be ignored.

>=20
> The ACPI case is a bit more work but it guess it could be implemented lat=
er
> as part of a more general cleanup there.

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
