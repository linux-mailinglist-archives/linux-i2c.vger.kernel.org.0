Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF88271E89
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgIUJIa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:08:30 -0400
Received: from www.zeus03.de ([194.117.254.33]:36652 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgIUJIa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=WE274rrwtzEWCI3iqRn/Gx2FcRpa
        tHGfTEPgPUVzcOI=; b=PrpnBtfPil+KxliuJ90t5PAbWu35qCpfFBfl4+/G3ksW
        tb4ueM6DgFH+eGTPhmdgPdX5WX7dNKrJ7T3VoqFglMcvyNtNDc1Emg1LYfZdtVVS
        WV29C6QJVL19fz2qGJK7EzbeAzLZw4Mh+JY++2GUr9iQfHWXXPUgSagqrcQf7b4=
Received: (qmail 69723 invoked from network); 21 Sep 2020 11:08:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2020 11:08:28 +0200
X-UD-Smtp-Session: l3s3148p1@ukyXMc+vkLIgAwDPXwWzANnLaz0lJiia
Date:   Mon, 21 Sep 2020 11:08:28 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] misc: eeprom: use helper to get i2c_client from kobj
Message-ID: <20200921090828.GC1840@ninjato>
References: <20200919065615.4939-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline
In-Reply-To: <20200919065615.4939-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2020 at 08:56:15AM +0200, Wolfram Sang wrote:
> Slightly easier to read.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9obYwACgkQFA3kzBSg
KbZJ2Q/8DT4GBFV0d6h8a969J+qcT5FRvsFpM9h1SzGUI0IaHplmi8V1rUE3ceSi
atjMPmOX4ckNeNKkf8N1sfDgZn990PCOf2Hx4gOh1vMzp5kPHXWyvrdZkw5UCQyq
0Mi/YIjFtAYKbqoW2sajqPQBR0NNCSg+FtMt1bpamaSwu5UjT3gc+wjOFdj0ugcg
fU6sdnlFNJEEPJC7P3GZdN/bp3A5yUdq3H95bet4eTC41s9PqnKwkezHxMEyk1uY
M6refm/+UpUGuafXZYFA1JvJZqWiRheN+aGS+YzSf1egE1/NeTnuQA2PwBV9iVwm
9dnxRNzR0KNJTqC8gwqin/yMZCV1JXziIXINUibg6TcS7IfLdpD0El2qqRyFOq44
G5CYpqJujuv5zimJOV91eonkONG1fstNCJfhnSevTmHGV/iqxT3pnRNhasxyJqOh
DdsJ0PB1xMqkG4P2PCsFvUkCq09FaIU93Pm04gyoDG1A730TAhIXXWnyM6GRV3+7
c3qOxp3gtBt9s0vNiVkIA0r99cBtDcI1rqEl9TKYG6/bh8/iEhToPOlr8puSX58E
MpJ6ghVbK7SModmOKPBjCjRJOuLatPU2wr+ss4nX81hqvhv/TUI8/hFTY9PiNMgd
LWPKs2Ph/wKXN94tAknHoWe/JCd8J0k31ittM6lyriPx4v5ruuE=
=zyLv
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
