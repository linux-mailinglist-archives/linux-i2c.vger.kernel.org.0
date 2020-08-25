Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F5B25129A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbgHYHIO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:08:14 -0400
Received: from www.zeus03.de ([194.117.254.33]:56236 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729197AbgHYHIN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=YJS/xz0ThCVdJGHDNqkSlS5uIiYb
        WAnoZvAO1EDmnOc=; b=Zp0/ohTKcx8wZYdqDcQEunU/KqRKJFCCI7Xmnnbz/xmj
        5dF+6IkUtDZtKLpQNM8exP/aI6v67865LMdUequ9HiKLhVdSPYv9lsPbMLShlq6k
        qQQs7EOMKTQw0nsNazm16jbuh1y1/Sf6zLyLNFUxi4v8RbtYTDWfnGc5ZdGS6HI=
Received: (qmail 120444 invoked from network); 25 Aug 2020 09:08:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2020 09:08:09 +0200
X-UD-Smtp-Session: l3s3148p1@zv+WXa6tfLsgAwDPXwyVALCfLslKKFLZ
Date:   Tue, 25 Aug 2020 09:08:06 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] i2c: Remove 'default n' from busses/Kconfig
Message-ID: <20200825070806.GA1861@ninjato>
References: <20200820080525.2767120-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <20200820080525.2767120-1-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 11:05:25AM +0300, Jarkko Nikula wrote:
> The default value for a config option defaults to 'n' so it doesn't need
> to be set here.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9EuNIACgkQFA3kzBSg
KbZtJQ//c1VybnI76X8uh4I+4o6dA9FwzvDJEvPoB3wsID8vp+8/kNS5Bq6Ybo2V
YQ0l1vuouICQCUufI5NRXzeYA/OSGkZDScZVuymuTFcPzK3yMbN5FNVncCPMutei
NVGiLQABB6QN3MtHHzAEjPD7GoccdFjkoaMTcP4ckRXCN+29MwPjH2oBEgqvI0Pa
g1P32OhoBNtYOBi371MpjDrWEJZYRpufx1J8S+8IBVnYNWZfUNZLq5j2p+RBoU1A
/o2sDmSAxdFD3LwilMFeB/voC4+mrUfVWmy0XPuwhQytOOaKVtJCBpFGuSEX7H+6
mcpoz6o4zkUM+nkcV1Vy8JmBj5YGZrRVVsv9jcPjK77vDvrdeLqA/1BcKloGL/bC
0keXreNSJZaaDHz84FAk051FsWyitDCtcewxVLWTlPYIv7dbKCNXoo/Namqn+h1L
5UCo+nX5QTvnpJgnErSH0iFej5nJoDB3RMVcciTNUDZR2hXgzyjVzWgnuVZqiJxW
YYD+sOCsV9l1yDOpA6rREG+/UqN+l7q9U+Px106WvzPIvYuD8ZqPKnSIGBmvPrx/
Aem/kFSELXngAfp+PcjL0dLLAistKDXep0FSywvakFkj6A4UyZJOdM9PDHdJ6yTn
j+KcvRHu94U0B51AxK7fvso7Mzr3LuPIPpEFUMVK0jbD3DvR85o=
=WDlW
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
