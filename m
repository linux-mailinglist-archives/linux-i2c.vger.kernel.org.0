Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF7222F773
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 20:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbgG0SN5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 14:13:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:44798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729331AbgG0SN5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jul 2020 14:13:57 -0400
Received: from localhost (p5486cd33.dip0.t-ipconnect.de [84.134.205.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C393420729;
        Mon, 27 Jul 2020 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595873636;
        bh=Q2hirUvTbqyfdO2c1l+7H880rPTzv7pbDxberVjFwIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=olV0ZxqQEG2kZvaUeWb5NsPGbpFi2AqRm9s0tIi4IzUNmfXOzgZ+tE+SJxoDoF1xw
         uboHZVJA/qMbGjEIeV9LUajNShavUnShLeEwPNpBkX58VyGhBUsBS712UqYlcRHIyg
         aYdycbxnyStzSzPuaMCEJy/Hc7HIQoyIzTaCwUQY=
Date:   Mon, 27 Jul 2020 20:13:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
Message-ID: <20200727181346.GA1034@ninjato>
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
 <20200725101815.GA1519@ninjato>
 <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Can you confirm that even if we have irq pending at the i2c IP core
> level, as long as we execute Step 2. below (to disable/mask all slave
> interrupts), after 'enable_irq' is called, we still will not receive any
> further i2c slave interrupt?

This is HW dependant. From my tests with Renesas HW, this is not the
case. But the actual error case was impossible to trigger for me, so
far. I might try again later. But even in the worst case, I would only
get a "spurious interrupt" and not an NULL-ptr OOPS.


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8fGVYACgkQFA3kzBSg
KbaeZg/5Af3JYZ9tfZW77dzuVDhoNeDfy0/+iOauTNIu4ZJZl1qmDBWe2fc1oOpn
fM9uz6JPqiCEGxSQk+ZeP0LKVfPz0m7xcSMaJNqT4TFlddekGNeHKlEm0q0UkxoG
fQk9LXvzLfoJ9H4QyDOWrkhoj9+nYPWjPpsDtsEljupsxYIUfGpN79BwKf17KGZb
J3XQQ4uDk/czM2/Z8PEoDHwpclpmP7N+URj59NabB9dltkwHjlhevXYFNxUsQUIR
N8eYNcyFlmBzHO3xDblLILwerOO7M/3a9X5LhqbSrf1m439cOm1lW9fSxZ7l0gSh
6tab7IHmpqpPQfxCx7cfbNRN5JEjNNVWhbOHV/JX8jyczWNs1F4pdnYfzAraWUB8
5k670lPK4bcxy1uYNyB6uOwq7lCdrKjYoXeeJa3qUTZHFtMPhD8XWwlbLwU0PSi2
8y+Q+8a3wzJYLfbzTOsKdp5Yew0sgIr+R1IQvpsmt7X6+nuYrqQeAWHzd2ROzvdr
3wjx4prwVdKwsgefXMiPnUvQrpuNnq9uwcsWq3j+MVzZ0H9p0dZiW/LqujoomHmB
Ilc0clpTLqiYRBf9ZXy45VOPvYabUEfRVFFPRmIVJZ+oJ5t5IBR3jgqIb4ZdJtFt
qBmaY42V85rGyxOQSHHF05gCg/Is3MkAW59fokfzikWwn3vY/Cg=
=fGCe
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
