Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3893A2F62AA
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 15:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbhANOEr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 09:04:47 -0500
Received: from www.zeus03.de ([194.117.254.33]:54226 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbhANOEr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Jan 2021 09:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XYkIYw8kXYr0WVS9+2HEs7b4ExRD
        AHL7hAMoLwRnuhs=; b=jEynJZOCa0wXW6Sxo/cdadXQbmnkFb0zCbxSlq2NLVRp
        FzkLrNbJwFB7vC59c7YZuCwh+o3/amsZmNp05TKfzLoQecioj4Gk2I1AKYcZP3MH
        m4JSAw6v+6MIYVmCwKAwjQ9fzSbCpPsEHXqLlvk016S5fIltsCfEkZZK0vQGbu8=
Received: (qmail 3538568 invoked from network); 14 Jan 2021 15:04:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2021 15:04:04 +0100
X-UD-Smtp-Session: l3s3148p1@3JJSuty4NNMgAwDPXwjsANskl+1DI0tg
Date:   Thu, 14 Jan 2021 15:04:01 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Corey Minyard <minyard@acm.org>
Cc:     linux-i2c@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        Vijay Khemka <vijaykhemka@fb.com>,
        Asmaa Mnebhi <Asmaa@mellanox.com>
Subject: Re: [PATCH RFC 3/3] ipmi: remove open coded version of SMBus block
 write
Message-ID: <20210114140401.GA973@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Corey Minyard <minyard@acm.org>, linux-i2c@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        Vijay Khemka <vijaykhemka@fb.com>,
        Asmaa Mnebhi <Asmaa@mellanox.com>
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
 <20210112164130.47895-4-wsa+renesas@sang-engineering.com>
 <20210114004822.GY3348@minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <20210114004822.GY3348@minyard.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I asked the original authors of this about the change, and apparently is
> results in a stack size warning.  Arnd Bergmann ask for it to be changed
> from what you are suggesting to what it currently is.  See:
>=20
> https://www.lkml.org/lkml/2019/6/19/440
>=20
> So apparently this change will cause compile warnings due to the size of
> struct i2c_client.

Wow, didn't know that my patch was actually a revert. I replaced now the
stack usage with kmemdup and will have a second thought about this
patch. Thanks for the heads up!


--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAAT0kACgkQFA3kzBSg
KbYBKA/+KGwiJWaUiU0+N17bTU/45Nmz2omMARKtrKFuDnxqUBSvbp0QVpMvtXvV
IP9YN0TVopn2OQ4TbUssjPKeF/bsRK9La45lvdDHOpeFKYdXQcTD2O+EWVKGneXR
Qp8dGNO0aMHcSi1Gmexd0OycizF9NbQ8vGSxXzvMgoLqjTe1RCFCNEEXgYQ+8sgW
3QMDPYVrDo53A5+d0au3PEvFdJtTI7yZuiG1M9+pn9j/awM26yIDU4+VCsQxoxic
6oh5DJVQUSzUL2VpEIlwbp32Jl7eDKTz7lrgSIObAY/IFz/siWlwFvaTxbQb9t6V
4hgZQ0ts4xX/OL64PlA706d6wHajmQ1rxDl0tSrhPMEyxVI20gIn/NxMkWeYVwv3
pI7FmNqqfHamZM6QTpODv4edzcNgYQvlXjVlFFe67mjmKVzTTsj8hRwVSM77WIct
FhozjJTQ1nL28UJwqYcbxd4NCUK7xmv/XbG/0LHdgEOE8J0QOwmj9S5CJoyRjz+A
hVv2elcCtEXFb5UxhZcwdD2lTExbzfJ2LmP54eTHR5iwLcS/HHLmEmMEDiQFbMBt
1iD5KZNjif+Ep2A3L2+o3AE/QzIMOfutwcZh0WcYw//WnHMbLzIc3pjjBt5l9+dl
u7Oqn7CsmdtU70IKAUjRFM/jwYMk3jaZwVKMU11ki6NyXZqQ59A=
=hJuM
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
