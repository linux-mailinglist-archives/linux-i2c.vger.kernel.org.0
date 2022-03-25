Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A704E767B
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 16:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356099AbiCYPPY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 11:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377068AbiCYPNx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 11:13:53 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE880DE096;
        Fri, 25 Mar 2022 08:10:51 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 24EDD20013;
        Fri, 25 Mar 2022 15:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648221049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mRSu3/wCSc0mFe5FcrRdKJwcESMddFQbMLzRELsBR8s=;
        b=hMz7NELw0O7Eshl2v7fb3IkN3WvOyeshGV6GPeE/yPHTYYvRjZ578GsMwRojhMfu0kfX+D
        sP30KveX3L7O/GzQOdGFTq+svSkt1sCW8XVzQ5WnsL7V0PfOXEhiLflowM5hZM2j47POuH
        6beC1zmgcaBQnrqSgBgPO+v8wpfJvQB7m5vd/J31AJ+GAt9a+Qyeo/9xgpNrkp/CnZfIoO
        rud839RjG+a4BQNKOsumBr1Agv3Nvl5H6XsFzt9cssfO7dtFYb4LRfLP2j0CvuCL3PLQdO
        HssRZAKVO70ab9HM8VBv2KJzxdO5WQgyXlBf+biUKnkSG01Tax1baBX1QCkr9w==
Date:   Fri, 25 Mar 2022 16:09:27 +0100
From:   =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
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
Message-ID: <20220325160927.30e5aef8@fixe.home>
In-Reply-To: <Yj3TSBEY/P7d8XJj@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
        <20220325113148.588163-7-clement.leger@bootlin.com>
        <Yj3TSBEY/P7d8XJj@smile.fi.intel.com>
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

Le Fri, 25 Mar 2022 16:35:52 +0200,
Andy Shevchenko <andriy.shevchenko@linux.intel.com> a =C3=A9crit :

> On Fri, Mar 25, 2022 at 12:31:45PM +0100, Cl=C3=A9ment L=C3=A9ger wrote:
> > Add fwnode_find_i2c_adapter_by_node() which allows to retrieve a i2c
> > adapter using a fwnode. Since dev_fwnode() uses the fwnode provided by
> > the of_node member of the device, this will also work for devices were
> > the of_node has been set and not the fwnode field.
> > For acpi nodes, the check for parent node is skipped since
> > i2c_acpi_find_adapter_by_handle() does not check it and we don't want
> > to change this behavior. =20
>=20
> ...
>=20
> > +#include <linux/device.h>
> > +#include <linux/i2c.h> =20
>=20
> Missed headers so far:
> acpi.h

Indeed, will check that.

>=20
> ...
>=20
> > +static int fwnode_dev_or_parent_node_match(struct device *dev, const v=
oid *data)
> > +{
> > +	if (device_match_fwnode(dev, data))
> > +		return 1;
> > +
> > +	/*
> > +	 * For ACPI device node, the behavior is to not match the parent (see
> > +	 *  did not checked the )
> > +	 */ =20
>=20
> Would it be harmful to drop this check?

Can't tell, I would not want to introduce some behavior wrt to parent
node for ACPI since it was not done this way. Might works in 99% of the
case though.

If ok with that, I can drop it.


--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
