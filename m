Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED9B4E9982
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 16:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243824AbiC1ObV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 10:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243820AbiC1ObU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 10:31:20 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284C83D1F2;
        Mon, 28 Mar 2022 07:29:38 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3FCB9C000B;
        Mon, 28 Mar 2022 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648477777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p3NiSvA7v2bm7VGGIXeyl2Gyk0azu36w+C8pKD/U2OE=;
        b=T5nzcd6xh9Mdsyz9hOoK2u4VdMYUBeiCeXm0+J75YdZV1k0PkUOgXkT8giUfobn5vCLEAS
        OyqmlsHRZMFlHtkefQuOX9iGkoHKupBCR2yfwUcPh6AOs2BGRMpb8jPNt2PFkjsYp1kjC7
        SOIsq4QkJcWyh1FNHbi5qiY2b4XJj5WhaNo6ExgbxxPZB97mGyyU5+77dXWWoYfJ0YrxSw
        JyhqPLRr0rbwv+pznjpVHbLqCSVZCkJshijEutC/0ksr0aCkXlOan7YUqmbcrE2fr84egg
        gkfbHGHdL1DmLcqmDCYUchm9KeRtg+x+Vdw16bzFqw4kpYE5MYbuork8dQgXRg==
Date:   Mon, 28 Mar 2022 16:28:12 +0200
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
Subject: Re: [PATCH v3 3/9] device property: add index argument to
 property_read_string_array() callback
Message-ID: <20220328162812.16deac92@fixe.home>
In-Reply-To: <Yj3SFYdUQ4r7GXqs@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
        <20220325113148.588163-4-clement.leger@bootlin.com>
        <Yj3SFYdUQ4r7GXqs@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le Fri, 25 Mar 2022 16:30:45 +0200,
Andy Shevchenko <andriy.shevchenko@linux.intel.com> a =C3=A9crit :

> >  	pointer =3D property_entry_find(props, propname, length);
> >  	if (IS_ERR(pointer))
> >  		return PTR_ERR(pointer); =20
>=20
> > +	if (index >=3D array_len)
> > +		return -ENODATA; =20
>=20
> I was about to ask if we can check this before the
> property_entry_find() call, but realized that in such case it will
> shadow possible errors due to wrong or absent property.

I think you are actually right, the check can be done after
property_entry_count_elems_of_size() since it already checks for the
property to be present. I'll move that check.

>=20
> ...
>=20
> > -		of_property_read_string_array(node, propname, val,
> > nval) :
> > +		of_property_read_string_array_index(node,
> > propname, val, nval,
> > +						    index) : =20
>=20
> Dunno about the style there, but I think it can be one line.

Seems like the complete file is strictly applying the 80 columns rules
so I thought it was better to keep it like this. However, I think the
ternary oeprator is not really readable with such split.

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
