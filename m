Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC1B23A121
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 10:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgHCIic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 04:38:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:36608 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgHCIic (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Aug 2020 04:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9p0wjjtVJo1IZVX+LclcBZyqnL5w
        iaumTf9nQOowo8E=; b=PFfhygVKPJaPt1J6AC8DAMto28qOkTG1ual3YkiKCPcS
        o+6OaPwoRREpFN1so7g45PA5jIPumU+WD3ZzNIBh1ucAmPQnVMCLoZC8mUnWs5VQ
        9b5DFAWUpIKLjhWV50a2bquk9nh/42xn9xYamwWu68tUuWqfB4JyDnaoNvlDx4U=
Received: (qmail 2319798 invoked from network); 3 Aug 2020 10:38:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2020 10:38:29 +0200
X-UD-Smtp-Session: l3s3148p1@O+MnEPWrvsJQT+F6
Date:   Mon, 3 Aug 2020 10:38:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Daniel Stodden <daniel.stodden@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] i2ctransfer: add support for I2C_M_RECV_LEN
Message-ID: <20200803083823.GA958@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Stodden <daniel.stodden@gmail.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200802192842.13527-1-wsa+renesas@sang-engineering.com>
 <C5EC2F45-41AD-465E-83F9-BDE3640B02AA@gmail.com>
 <20200802213828.GB13339@kunai>
 <C82A0A94-A06B-4D42-B71B-F14D48D5E029@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <C82A0A94-A06B-4D42-B71B-F14D48D5E029@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I have just checked existing I2C_M_RECV_LEN handling. Quite some drivers
> > do it wrong. And there is no consistency in what they return. Lots of
> > things to fix there...
>=20
> Would be curious about what variants are there.

1) some do it correctly
2) some hardcode the new length as recv_len + 1 (or recv_len + 2
   if they think about PEC). But they don't do extra_bytes + recv_len
3) some don't touch msg->len at all
4) some also remove the flag I2C_M_RECV_LEN while processing
5) one driver always sets length to I2C_SMBUS_MAX_BLOCK_LEN no matter
   what the device responds

=2E..maybe more, but I gave up.

> Note that msgs[i].len isn=E2=80=99t updated, you only get <extra_bytes> o=
f data back,
> so the difference would be severe: msgs[i].len is what guides copy_to_use=
r().

I think you can clearly see what was actually tested and what was coded
after the specs without proper testing (or maybe just kernel-space
testing?). This is why I hope my slave-testunit helps a little by
providing a device to test against.


--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8nzPsACgkQFA3kzBSg
KbaCvBAAtGxjjEvdloISDiNZAiNIFaQOIYcZdP9Up4JlSOnFpw68+EEwmX7N732Y
3335lcb4jLpilPciQQLakpajKGeC7yeofGmPI82UhjBiiWAg4tydKRVojJEUDl/P
FSR7FBoGHhZnfxwMsL1zcGheMvTdc0XnM6it31s9Nf6+WyfBrYw1aQ6r5zYJie0A
1PKBszxg/aEgXCPR1TJxlg8v4B238qukVUC2wMH99BS+fjXtTLqN9E+ZnITR46rB
UKq3t1xm8KeqLuz+Llcl/QunZBk23qgyuHLFzER+Kbvd5pbmWKULQjgIqvYOdgDT
aWXfMa3BL5iCYAHxogRKDKLcMBzhB2D4CbBawcA87cBeS5UF+q/oEf351d63YKRm
RSsmwvX+BuYLo3y5Jxp1b4LnnMzICsynqIKnhkIP/SzBaMr3V4oYNcQMHE39nMCG
fQUl7p44Gnst3cHyxynGpvEK1rwc0D8OZpg2wU0N+k9F5O+cfGuNJKV87NJGYQxM
uIcvjSRzAZ9YL6yt04AXD19yIDkzxbo/M9Su3egEnCMDqGXzwaRaxDfKoEfJiAUr
yUNfch5A9grmqtv7wttzULAuLG/vH77XiUU3fituEF1iizhxfas938TCh0iLukag
qw/EmthDF4/iWcMrG0Vze9te2fnZGrRujrjIFAt58i6KYtDq0pk=
=vkOU
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
