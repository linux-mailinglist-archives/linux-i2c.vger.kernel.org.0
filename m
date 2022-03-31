Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6514ED726
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Mar 2022 11:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbiCaJnX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Mar 2022 05:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233957AbiCaJnW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Mar 2022 05:43:22 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6191D207A;
        Thu, 31 Mar 2022 02:41:33 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4B0E02000D;
        Thu, 31 Mar 2022 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648719692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VbsxCOa9JzqELpaQ9PziPailes9HwLBLI2gZIQcLonI=;
        b=JRMitclP+ldhl0KYInG2ZqCFOIsMhLfD1uad+8wNS9RwXCiRH8wLk/xKp6TXafoFiCJxkk
        H+A0pU5Gf65OGTQS3GDo8a8lDlhTm1EXpj/8CU6AfBstfbD69/HKIZ3Pbd4CKBA8BresO3
        l9hYLR/ZDPGNRVLE0qn7NTthWAxu34+YOTudhVtC7U/AW6M1KfVgGNZaPWTzTihwhZtTeV
        jkKCw4yo9G4kgpFH8OFBBJA9WespPxe15OMAbjubVUafBti2s7ND10NbfvXZbogyzlyxa4
        C6RPmbiEBw0opSDNx504roXkNUCXLBdRsGFAEd7IPlUL5tNG5/rmVO54KMXaWw==
Date:   Thu, 31 Mar 2022 11:40:06 +0200
From:   =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 8/9] i2c: mux: pinctrl: remove CONFIG_OF dependency
 and use fwnode API
Message-ID: <20220331114006.0c7bc47a@fixe.home>
In-Reply-To: <6f519f94-9185-a29b-2eff-fd6c9a36cfaf@axentia.se>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
        <20220325113148.588163-9-clement.leger@bootlin.com>
        <6f519f94-9185-a29b-2eff-fd6c9a36cfaf@axentia.se>
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

Le Fri, 25 Mar 2022 17:48:19 +0100,
Peter Rosin <peda@axentia.se> a =C3=A9crit :

> > =20
> > -	parent_np =3D of_parse_phandle(np, "i2c-parent", 0);
> > -	if (!parent_np) {
> > +	parent_fwnode =3D fwnode_find_reference(fwnode, "i2c-parent", 0);
> > +	if (!parent_fwnode) {
> >  		dev_err(dev, "Cannot parse i2c-parent\n");
> >  		return ERR_PTR(-ENODEV);
> >  	}
> > -	parent =3D of_find_i2c_adapter_by_node(parent_np);
> > -	of_node_put(parent_np);
> > -	if (!parent)
> > +	parent =3D fwnode_find_i2c_adapter_by_node(parent_fwnode);
> > +	if (!parent) {
> > +		dev_err(dev, "Cannot find i2c-parent\n"); =20
>=20
> Why do we need to log this as an error?

Hi Peter, sorry for the late answer, your mail ended up in my SPAM
folder.

Regarding the error logging, you are right, this is not needed. I'll
remove it.

Thanks,

Cl=C3=A9ment=20

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
