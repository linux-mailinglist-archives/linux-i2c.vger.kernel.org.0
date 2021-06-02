Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97D1398FEA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 18:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhFBQ1L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 12:27:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:43568 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229852AbhFBQ1J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Jun 2021 12:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=NO+qec8VT5imdzXjeow9/TlZx5u1
        UPwldicing4vbe0=; b=p92CrZ79LDwQ7WVZ6P6D1fWqHeyJ0ZbROhXzvNb5U1za
        Huq2cORSx2wxgIFvVvl8MlMmWWiAcxsoZZcjD7SaNetMFVDEIyDXKFbWd2g6EIcB
        gVCzWb9BuNQdpfY/SUe2p0fTtItX7fhJSveBIxhQx+7VZKT2vBLZoO8p96Of5qU=
Received: (qmail 758722 invoked from network); 2 Jun 2021 18:25:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2021 18:25:24 +0200
X-UD-Smtp-Session: l3s3148p1@AOe358rD/rMgAwDPXxuYANASkjv/xjjU
Date:   Wed, 2 Jun 2021 18:25:21 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <YLew8cFWTRQKrBuk@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
 <20210226174337.63a9c2a6@endymion>
 <20210310204648.GA332643@ninjato>
 <87tuoe5zfc.fsf@dell.be.48ers.dk>
 <20210413125433.GA9879@kunai>
 <20210521132158.6e0689c0@endymion>
 <YK1fwC4aR5RKTPcB@kunai>
 <20210602110332.73f9cbc1@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l9YJ6QrJ7KdPJh2+"
Content-Disposition: inline
In-Reply-To: <20210602110332.73f9cbc1@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l9YJ6QrJ7KdPJh2+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jean,

> I've committed mine. Do you see anything left in patchwork, or are we
> ready for a release?

Well, I thought mainly about this patch "tools: i2cbusses: Handle bus
names like /dev/i2c-0" but you took care of it faster than I did.

There is only one patch left in patchwork from 2016:

http://patchwork.ozlabs.org/project/linux-i2c/patch/044b3af6a47dfa92e047f0ff57e39a5b61e00058.1463165295.git.leonard.crestez@intel.com/
"[i2c-tools] i2cget: Add support for i2c block data"

That's all what's left in patchwork.

Dunno if you care about the old patch, but I think we are good to go for
a release.

Thanks!

   Wolfram


--l9YJ6QrJ7KdPJh2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC3sO0ACgkQFA3kzBSg
KbYqSBAApnoHfSA5gw9IbfJyElQ2OrWycEyksamGPt/Rxsj++cWD2657tGPnrG/0
wjWeRpUSz8I2hA3k7PzitIcN/F6K72W3wvH/z/79HH5UbatqcGqrunf+jzV3w867
0Nt3fnfW4s7tjOiIicPqg4wqX9bCY5xgcULVgZeOrZw+hZCxKtdlximnmu+EXVG7
mcGxO+uUWz03IZ7Fee1AxGGM1lmP6dWbs0yCBCafvlhfsdDduv7kTifJ02tRRBcd
/DTiNsYSgFwcla2oiEFV74MfpAEHINQdGbj33pHfG+lZB2PQrM4pQ5t4U8oJVvqN
wtr5UQMB/91FUoQFk+hAiDGqv93JI992+UefWDgQZgeUl5jZSvXQP2NdyQ0kQxWk
1oWTMONsDny9/rUZRsPCCBQhQQhvNfww1nJy4YTALUHYdO6jKYIicaZTohug5Y80
uzn9E5nfBek9QAN7niq1gpQbrbrTxgsGcLrMdQWhkAyW5VbJHs9FSnaQxf9Vl4UV
HYZbVljcj47bLAb64YISpJunKYiNsD22OVpOJjWo8jpuBfswLbcIClkQzGJeVDU4
gx6JZg7vuZkwDVi6/bVkg4KA/SmB1ZSiIcAyWnsTcJq/4EIMEqmEUMhGh01qo53b
pvkAEagbOMNXoQbdkoqJiW/GLEW0wam97mADYkoDwJrDqf3g6wg=
=Fsm5
-----END PGP SIGNATURE-----

--l9YJ6QrJ7KdPJh2+--
