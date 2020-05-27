Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1E41E3F91
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 13:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387902AbgE0LHe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 07:07:34 -0400
Received: from sauhun.de ([88.99.104.3]:55380 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387534AbgE0LHe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 07:07:34 -0400
Received: from localhost (p54b33011.dip0.t-ipconnect.de [84.179.48.17])
        by pokefinder.org (Postfix) with ESMTPSA id 84A462C2037;
        Wed, 27 May 2020 13:07:32 +0200 (CEST)
Date:   Wed, 27 May 2020 13:07:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Cc:     Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
Message-ID: <20200527110732.GA4875@ninjato>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
 <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200401143254.GA2409@ninjato>
 <AM0PR06MB5185F8F51316FCD5213F0ABED4C60@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200402092813.GA986@ninjato>
 <AM0PR06MB51857F4CDC7AE643CE160F9ED4A60@AM0PR06MB5185.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <AM0PR06MB51857F4CDC7AE643CE160F9ED4A60@AM0PR06MB5185.eurprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaako,

> The changes required to this patch at XIIC driver from suggested DT
> changes are pretty minor. Basically only checking a different
> property, reversing logic and some naming changes. I can make these
> changes already for the driver if this solution is what will be
> chosen, or would you prefer to still think about this?

I think we can go forward this way. Although I didn't find an example, I
am quite sure YAML format can have exclusive properties. If not, it
should be added ;) I'll try again to get some information from people
more experienced with YAML. But we don't depend on it.

> Regarding the device tree changes: I am not very familiar with the
> needed documentation changes, YAML bindings or what needs to be done
> for new bindings in general. Would you prefer to still consider them
> and/or get these subsystem level bindings done by someone more
> familiar with them? Another option would be for me to try find time to
> do the suggested bindings changes anyway, but it will likely require
> some effort from me to familiarize with device tree bindings changes
> and schedule the time for it.

No need to. Luckily, the I2C main bindings file is still text, so it is
easy to modify. I will send a patch out in a few minutes, so you can
base your driver code on that. Converting to YAML is a completely
different step, not related to your patch here. (Sidenote: I am looking
for volunteers to do that)

I think this covers it?

Happy hacking,

   Wolfram


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7OSe8ACgkQFA3kzBSg
KbYhDA/+Mz+QoufnY4EPCz5k/e/sII/jXO8cozIN4DhnrjHB/hm1ypYwvJxyQGnO
ajA/7vWPE5ZdFTff+DiaVu4btR0fZpUztvZOZnko7CVtgnhZ+2q44nY7kuOEJzo5
RqqrmWcNRDu5kDtfFKZqkQS2Lg8mkN7FKulq3VBXBhhov2G+OcIzjVW981QwFRFl
An9skXoQKUu7Jog7EwZEhPYPuVEDPsxIgwJjQW0RagIT3N4hiRAlPBUvy2hy1FWV
55b4Xf16A2lBnRrUPYvs4W75KAVdCgWxuJvNINKremjpZGkbile0nVKvyEUc8Qyi
scu180J5u6PFvjJO9x49unn7qf9XtcwtlE9oabUcOHvDa3U753m8RHrh+K/j1iYu
WntnYjpcKWqGmodj9JoiAXledcy/ntfd+9UJL4zihxAP6wgcVzpxl2W9Zn3aOgPE
PBowiHNZl9lwLm9uKCpi29+7Ne1Vt1v7J2FZ07S+bY+ytvDM1abvp5GfBzKRz7XA
q8aXZ2Amhh84dNha9r3VOiLRBAzHjZOVc6hR8mBnAjy8+1O0kyJn2GrPK9rGwDQ7
kqhe5uTlBmJyvQrJx0CnILXOuRS7rJTj7y2u5FHUZNZghROzEXn6PlmnL4WNeqBz
cgus7tOk4/Xz8ihlAGrKvNOvPkSNALVyW96kCkUT9EcOV5qmWKk=
=g4Yu
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
