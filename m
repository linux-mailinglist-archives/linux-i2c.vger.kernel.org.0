Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF2BF19BE9F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Apr 2020 11:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387935AbgDBJ2Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Apr 2020 05:28:24 -0400
Received: from sauhun.de ([88.99.104.3]:56018 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgDBJ2T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:19 -0400
Received: from localhost (p54B333EE.dip0.t-ipconnect.de [84.179.51.238])
        by pokefinder.org (Postfix) with ESMTPSA id DB7882C0590;
        Thu,  2 Apr 2020 11:28:16 +0200 (CEST)
Date:   Thu, 2 Apr 2020 11:28:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>,
        Rob Herring <robh@kernel.org>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
Message-ID: <20200402092813.GA986@ninjato>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
 <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200401143254.GA2409@ninjato>
 <AM0PR06MB5185F8F51316FCD5213F0ABED4C60@AM0PR06MB5185.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <AM0PR06MB5185F8F51316FCD5213F0ABED4C60@AM0PR06MB5185.eurprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaako,

> > My best bet is to introduce another binding "single-master" which says
> > clearly that we are the only bus master on that bus.
> >
> > Both bindings missing means then "unclear".
> >
> > I think this matches reality best.
> >
> > Opinions?

> I agree that this sounds like the best option if original binding
> can't be used, even though it can also be a bit confusing to have 2
> similar bindings.

I think it becomes understandable if we emphasize that "no bindings"
means "unclear". We need to document it.

> How would both bindings existing simultaneously be interpreted? Maybe
> both existing simultaneously should be considered as an invalid
> configuration, so that it would be enough to just check the one you
> need? The other option would be to treat both existing similarly to
> neither existing, which would require the driver to always check both
> if checking one.

I am clearly for saying that this is an illegal combination. I'd hope
this can be expressed in a YAML binding. Yet, my research didn't give me
an answer. Adding Rob and DT list to CC. Question is:

Can we check if the boolean bindings "multi-master" and "single-master"
are not applied at the same time? Any other combination is okay, i.e.
just one of them or none of them.

> Should the new single-master binding also be a general binding for all
> I2C drivers or a binding just defined for the XIIC driver? Having it

It should definately be global.

Thanks,

   Wolfram


--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6FsCkACgkQFA3kzBSg
Kbbvtw/+L5wD8ARrOmtDVYzMRtJvbyu1XsD4cZdfx/fHNB3oOKbL65t9dnKWiuRy
Np7KViYB9VbVGTYtRWPT5EPWUqhtNbRWfEoxONZ02IVVBq8qfl9iIgcXpvrbVU2J
7m3AJSB8x2A9FJ4iE1o3hPw7zkUKtnXui1nn7MIFO34d6QaU7UgxpQ3pIdITKtIm
BqUedfcI2zj0cV+V4RsZFUlZLZ7QsVUkcXDd3tsXt/yKnBxPVV/pzqmsQzNrXI3Q
evWAjIFHmBJzM4B3teelLwsE2toVGVtK/j4x5ZhTSkEpPBnkA++02xAVq+krdM+z
AMBD8ZIoHwQzjoSNGcoEXprLkQmN2nbfl1dgvRGUPotJ8LDIYo5NyaRy4WYBh6xF
QjnMQFg29QuuWCfXDKC8vNG1BN/DYUh+8Bzo7HCGiEPd7B/unsFqz7QxW6WCg29G
MmHi+253Xq9LKDvC6OqB2+Dvc764BGI2xiVu4t4/iXXvWI0VkhCeoZkUdLkx19OR
LKEw7ipKmhiX4sPvhtD38J6c4XKz1izB+4rzTq7ZZH+Vg1cNtYL3/riIfE9BwxjF
A6KwJi6vXetZxROIxWTxj8BX9qjbhErOYDCTWPxFlj815S4RfDgqC5oiHIhGGr4m
Vv3egui9LAtlne0QsqmR0PjP5hQ4fFp+78rjdoHgyyFAtKA9fnA=
=KFqX
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
