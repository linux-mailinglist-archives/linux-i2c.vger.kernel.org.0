Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7D322FA00
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbgG0U1B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:27:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgG0U1A (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jul 2020 16:27:00 -0400
Received: from localhost (p5486cd33.dip0.t-ipconnect.de [84.134.205.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72D56206E7;
        Mon, 27 Jul 2020 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595881620;
        bh=pVSPbWxessRIZurIuOzZlz0KujjZbQXyIwrU4wU3nho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HHDXbeTgUuQKU/1fh2JKFe1u+W+apYXRf3ojvY/mqvZ3x00kNVHI+NkJzWiEld/IU
         jiyfKVZijeQVkEZ5WJMIv7m34ay9cfqAIcsM9zZlBOlFUTCVzasWbUS0YLgGF7jfnh
         z8UuGYEkXwxot+xcckTK0VzO/gsGFyfWWiH2x2mM=
Date:   Mon, 27 Jul 2020 22:26:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
Message-ID: <20200727202657.GA18997@ninjato>
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
 <20200725101815.GA1519@ninjato>
 <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
 <20200727181346.GA1034@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <20200727181346.GA1034@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 08:13:46PM +0200, Wolfram Sang wrote:
>=20
> > Can you confirm that even if we have irq pending at the i2c IP core
> > level, as long as we execute Step 2. below (to disable/mask all slave
> > interrupts), after 'enable_irq' is called, we still will not receive any
> > further i2c slave interrupt?
>=20
> This is HW dependant. From my tests with Renesas HW, this is not the
> case. But the actual error case was impossible to trigger for me, so
> far. I might try again later. But even in the worst case, I would only
> get a "spurious interrupt" and not an NULL-ptr OOPS.

Let me explain how I verified this:

0) add a debug print whenever the slave irq part is called

1) Put a 2 second delay after disable_irq() and before clearing
interrupt enable register

2) unbind the slave driver in the background, triggering the 2s delay

3) during the delay, try to read from the to-be-unbound slave in the
   foreground

4) ensure there is no prinout from the slave irq

Worked fine for me with the Renesas R-Car I2C IP interface. As mentioned
before, I couldn't trigger a bad case with my setup. So, I hope this new
fix will work for Rayagonda's test case, too!


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8fOI0ACgkQFA3kzBSg
KbZ2mg//ZffoljqCUbULydJcx1FgcZDwTaniwi7AmmFMvl8rSVkihNTlBHi6mt39
Feh+yk6Je7+A/nQm554rrkMHjqc6c7B+LtwzXbBIAIz99U75QPS9bSRhAofitsMX
+4ixLRywn2cwqSTtgGIb2J5/M24zM3F0jw1ifdi6xzGajrLKVzOGLemxp2WUCirU
hey2hVLyq9j8iTYev7Vg+BKQJhHqUu4/uxM3Z47ymE4+KhMBmc0mAN31SE7hceps
7VBVX7elaIKWn8HfoqDjmmaLnne6A+yqK4ep7Uuh/1uz24jcy15f0XZ0dvN4baOu
z1k38J2B9C03eAEsuR15gY1kSbEI1Ce5Mi34Z4b6qhjpI8jj6mdzYrBxgu4euCA8
2yYcG0z2k27jmqFl+7O4te9chDSxpJotYEF0bPLGkzduNMjeBF5PAPzvxsN/ZPaP
cAwuOkYwiQTbOpKYYLNREIe0+KzuvVGGhhWcJapxCZhj1Hv73lu+HJiCTzmzDat6
gVi59UWhyycjMFuU6rewotnpJYS8YN6bFJGPfBgCsTl3vl8IJc2YBpw+goikQ1E4
Y05RMGcE5dn/2x7eR9u8owH/lL4JkcQGksj0xJLkQQ1BQg1IkTWCmHAlMHD6GGal
qS+yQqAudo3/HPbC4TtFMamCgzNwDtftu95Mf0E3H1QhTc0dLTg=
=0k9R
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
