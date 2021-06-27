Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D05F3B52C7
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jun 2021 12:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhF0KN7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Jun 2021 06:13:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:55256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229761AbhF0KN7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Jun 2021 06:13:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35C7B61434;
        Sun, 27 Jun 2021 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624788695;
        bh=geqeUpYGgeO82Sq1pBbdsdaMqPXReFPvy1oXGb9cyd8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a1y0o4ScDqLlhqZ08twcA3TDrl6IfCmPIJ2slBt8JHdmzFxLIHFiNGgAal6C6bX7R
         RVOBHfvFY8W6QP+/mknkg8oTS/ec95sNXatrWigWgvT9OWaFp7h81+5F20GBzQtcBx
         pL8b+JPJ2KAikFjdDbvL44noAdOFFIh1LY6pt7SqEX250+x7e/ppn5iWJNYKi13Fuf
         gsXYXt/J/uTWM6BQMQQGwqNTO3O++XG9fZgElNo4HXdX6mO2Dqof5KS4G/EGshVokV
         4umg/ptviy1y+CAfBszohIqbLWUeoHSLwR+ORtVwLzjgIJoAwPJFmz0CwwSRn40ktc
         fnf8QDhTWvVEw==
Date:   Sun, 27 Jun 2021 12:11:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/7] i2cget: Add support for I2C block data
Message-ID: <YNhOzo6AW4/PwxB+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20210608172338.0cf520a1@endymion>
 <20210608172858.0fbd301f@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n2W2Ff2Cvu43+S3A"
Content-Disposition: inline
In-Reply-To: <20210608172858.0fbd301f@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n2W2Ff2Cvu43+S3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		"  LENGTH is the I2C block data length\n");

I think it would be good to state the allowed length values. Same for
patch 2.


--n2W2Ff2Cvu43+S3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDYTsoACgkQFA3kzBSg
KbZRvQ//SRm5932ka3hs5pUsMUIZuUVMcp1I5hK1miPErfoygqCPL6bEUFBfzA3W
tPFbQsU39J1qDt6gAvY7d0TcwfoEMA+oe88x5xm0RPJR7goUJ23lO7BJ6aLaObzD
PMG7Xj384oo0K174tyRpztJNoD24U+NmkNPrSQG90q0sj4SsTmZlPDK0Se03Kztg
/Oa2Aqj3lPLwZgWQLVtNBB4xK/4sJZ3Hqith4mphhZBWrKrCkUfw6PiVfXKETCBX
GKpU1eU4p2h/fPldDNXUuviz1GcyqsgiuQfjgBAD8v7udT8577874BOjzfYxXcYp
cxAEgRbO0ZdZnogHf293B045QzwyhwkHeHHGC1QniOunU+Y2pLgztCMS/SNnbCme
gGAEpPJPFZrL4xlBjWRaaTdxSREwspfZuVTwArJrkn/Wnn9OZMAyc8zlR/1ouyQS
Xb27iGTy+1B2ua3UrXHxhRtRSAUxkTzebfucWJo7xatNyDtOxM41rbkenyVDi4Jy
bqNxNE91UDY51hdQmXu7KogFAVjW8CuxhfqOgCTcmPUtwkCGtXRm/NSf+Y2VHxtH
nantB5taPLPuFzYHgEMqEGl+8FRDNlfj4gdUX9BFjKNG480TVOQ2+A6bAi5toSTJ
i6U88Q/OXHXCfNts7K8COBV1D+X04qhQphlrf1lTyR9Bl1zD5dM=
=0Re/
-----END PGP SIGNATURE-----

--n2W2Ff2Cvu43+S3A--
