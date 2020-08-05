Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2529B23C90F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgHEJUB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:20:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728653AbgHEJR1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:17:27 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D41AE22CAF;
        Wed,  5 Aug 2020 09:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596619047;
        bh=4atq3NpZ3NyxQfC0rIaKcFvZNo61Zopt//ezNlUFBig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QxuAbc7cUdQ2gP6TQxX/DpPA2KwKuA4k2LdlA4b2KOtWgZZio7s+jf+/PgLR0Hsqn
         y5ktjECJpaxAE0zOgl0lgMO+7SAZGscPkj32NL7RcAm+z3LoDg1wH3CxUNlO7r9Paw
         u5xohgf2/tTgROaHwr5jt8WNg2AOHNlqO1Xv2bbQ=
Date:   Wed, 5 Aug 2020 11:17:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
Message-ID: <20200805091725.GI1229@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ray Jui <ray.jui@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
 <20200725101815.GA1519@ninjato>
 <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
 <20200727181346.GA1034@ninjato>
 <20200727202657.GA18997@ninjato>
 <f56b0f2c-f723-a4b6-8c03-4b397aaa375c@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SdaPbLtAangIkrMZ"
Content-Disposition: inline
In-Reply-To: <f56b0f2c-f723-a4b6-8c03-4b397aaa375c@broadcom.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 01:43:40PM -0700, Ray Jui wrote:
>=20
>=20
> On 7/27/2020 1:26 PM, Wolfram Sang wrote:
> > On Mon, Jul 27, 2020 at 08:13:46PM +0200, Wolfram Sang wrote:
> >>
> >>> Can you confirm that even if we have irq pending at the i2c IP core
> >>> level, as long as we execute Step 2. below (to disable/mask all slave
> >>> interrupts), after 'enable_irq' is called, we still will not receive =
any
> >>> further i2c slave interrupt?
> >>
> >> This is HW dependant. From my tests with Renesas HW, this is not the
> >> case. But the actual error case was impossible to trigger for me, so
> >> far. I might try again later. But even in the worst case, I would only
> >> get a "spurious interrupt" and not an NULL-ptr OOPS.
> >=20
> > Let me explain how I verified this:
> >=20
> > 0) add a debug print whenever the slave irq part is called
> >=20
> > 1) Put a 2 second delay after disable_irq() and before clearing
> > interrupt enable register
> >=20
> > 2) unbind the slave driver in the background, triggering the 2s delay
> >=20
> > 3) during the delay, try to read from the to-be-unbound slave in the
> >    foreground
> >=20
> > 4) ensure there is no prinout from the slave irq
> >=20
> > Worked fine for me with the Renesas R-Car I2C IP interface. As mentioned
> > before, I couldn't trigger a bad case with my setup. So, I hope this new
> > fix will work for Rayagonda's test case, too!
> >=20
>=20
> Sure. I suggest Dhananjay gives the sequence you proposed here a try
> (with delay added during the testing to widen the window to cover corner
> cases). If it works, we can just go with your proposed sequence here.

Any progress yet?


--SdaPbLtAangIkrMZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qeSUACgkQFA3kzBSg
KbYtQQ//QkREnHuVLP3ifjUbeQfUBSu+fvYe6Mn3lJDRVfMrQagKKi54gmoQlB/b
oka6AyjIoXJbuqh4N94t0MN70V6E9NvsQRahBIRYGTOCUgn67k/zh6941bjQX+9L
shJ+Xj1Wx0oTsCQOawdffX4hiyYUBCjx1t0Ymkc5074TUGTz+SODHKugp/XMidVN
NHPy7y2Xqa7uitu85A/QoqgdD3b/Wtb6o7zGXWvKVDX6V31ssfQxmj+e3zpVNhpJ
DYMInuaSx3JCDsMFt/v20zCmQCEpuZ6C0+3MOhUmQ/QhtS/AxfxCc0ArRaGapVp0
+qoEGJzYaHbjnR9f+A7R+U/b25T8c7xjebxOckxLmnXKvAi8Q+bul6hO0zTq8K6/
nX7vULvyUptqNK8ArQEw+LjQ8U5GzabmECs8czl9OyWDGlKgdmYvPiFYf+J48f9R
EPS8haW1sbLh92uBHKbJrVQ/zvD4RGXjpk+4/aWuXYyT6SOMXVGnAo1HLXYl7af0
vlM1UvqbtXnVFInMIrKX+R3+3bSGUuKgI3yA/qezjPrn1lGXOmEJpSwMPG+m67VV
VNJLjUrfojm1ydVPM3p/s+LGj7SAaEnemB39wsmrKkRYKRTJNEDLpJJ6yz1YlZOb
LTxX5bkY3MVi0vSoztmNjF1QbkL+Fg1B54OhgFQ6XZXSO+XtnoI=
=oqyX
-----END PGP SIGNATURE-----

--SdaPbLtAangIkrMZ--
