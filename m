Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B433215909
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jul 2020 16:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbgGFOCB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jul 2020 10:02:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728940AbgGFOCB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jul 2020 10:02:01 -0400
Received: from localhost (p54b33253.dip0.t-ipconnect.de [84.179.50.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 096662070C;
        Mon,  6 Jul 2020 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594044120;
        bh=7uN3mPcmvjOBmfGsWWZczPL5+7Cn79fIi7lbBC5K+tw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c/wYlsilLYD00xmJFQsjKbknrRTIM1zd2hpvDYJfiCdd4FETwEDS2b+wiv/NIx+G2
         yO2MpZEJJvQEhHBbj3LoWE0lbePgW6iz8l8n2Naccb7DaA90RxI76QJGNyXd+jc/pB
         2qxrABhkz+9BKod8b4FX/CV+GF63etuLBCLJcnHY=
Date:   Mon, 6 Jul 2020 16:01:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, joel@jms.id.au
Subject: Re: [PATCH v2 2/2] i2c: fsi: Prevent adding adapters for ports
 without dts nodes
Message-ID: <20200706140157.GE1046@ninjato>
References: <20200609201555.11401-1-eajames@linux.ibm.com>
 <20200609201555.11401-3-eajames@linux.ibm.com>
 <20200704063918.GH1041@kunai>
 <4c1aee77-c544-9688-f679-5cd8b5405fb7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dFWYt1i2NyOo1oI9"
Content-Disposition: inline
In-Reply-To: <4c1aee77-c544-9688-f679-5cd8b5405fb7@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dFWYt1i2NyOo1oI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Hi, it does change the behavior actually. By checking for the device node
> pointer, it would proceed and create the port for a NULL device node, which
> is not the desired behavior.

Brown paper bag, please...


--dFWYt1i2NyOo1oI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8DLtUACgkQFA3kzBSg
KbZ8JQ/9Euwnd5KJxETrhE06qQLcylzYP1hUEh7d4Xl0o9jwnr7GyJ6ypdSimJB2
WMiG4dzRupIGyu4uUDZ2cYzDoAqcqM5VepQBXTbttYd3sScQ12KzhQIgcYCh8Sy8
+0Chd+cHAL6jHgXVPPwAyipcBA8FYX/kLYxdu4NJ8nlaoeM5+xJGee/5j65b4pk2
+6XjrhzANIi51+bj+R6FyGAn66Z2vS6hKr2ObFY2hWmN9H4O3ftRoZu5NSnvKoSq
q0LG39Xiv7PuZYoFRFs0Bg6w2DhyctJa8uk/oTtFtAL0hIbnL4se/Re+Nm8VQN8k
z8OX9hNJ8mDWjaCHVPaIyemJ3h1jaXsbQQu1P/t/6Q3eXlDW6aF2IhVVvbrwTKvf
iyciDn5pWt5o/b7Scd2vCJP/1MNwqUIWeeFst7e0X5EiuFwl9zT/V2y2j4HN23Es
Ct66oVEOOmvizqoEyN/JdqWsqPeGrRbMtBxzdzwoavpgIna2ffOVNL66RNM2CEXE
v9FM7c5vDqPBEfR5HrEivY4XH0CvI1S/7/Pfh1/EgbZ3hGVOBT3JLQat72VEY1JZ
KaztACohQw/h46WTY0NIjVt3LyPvLGulSiinWNaFUsAA3eDwcAJOVkoIzDPKFsSD
uF7OQqd3rKdbpSyOdxBpe1i1Jc7JGrL8073ZFfd5gUlr+zPJWPo=
=+yAc
-----END PGP SIGNATURE-----

--dFWYt1i2NyOo1oI9--
