Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A42F271EAF
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgIUJOf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:14:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:51780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgIUJOf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:14:35 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBA7B20773;
        Mon, 21 Sep 2020 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600679674;
        bh=BRbOoDphO4Ujz5VCwVbFOL8AVkUVG0gfMgL1+cDToMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G3hVa2bibzqtHJmwN1rce0HmRMSxRbxPN41zOlTSEg2XVOI9thEFbqoBqm+Xz6S5c
         ekMj4SOXhXWDOWhUIkSFKTNPW9csKBqXgyKc6Naxq+d9wbiOSy4rcuogNmNeid+gu8
         MMLtfJ/lU3WHq33n4Nj2esj7n7Ie3u/tbhXYWibM=
Date:   Mon, 21 Sep 2020 11:14:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxarm@huawei.com
Subject: Re: [PATCH] i2c: Switch to using the new API kobj_to_dev()
Message-ID: <20200921091431.GE1840@ninjato>
References: <1600133898-35883-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Content-Disposition: inline
In-Reply-To: <1600133898-35883-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 09:38:18AM +0800, Tian Tao wrote:
> Switch to using the new API kobj_to_dev().
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied to for-next, thanks!


--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9obvYACgkQFA3kzBSg
KbYt3w//TERvLUXD51oWjyD0NtmwkVNEnAbFRLYQLRA1A7xnytGxo9O7aQR7pB81
OzjM0e111nhv0/MI1kgxmo9F2/IhsZCtoXbiwO5Z/EUynz4vGe62nfIQu0k1oQTR
wzKJUz+OdJdS+oW2+uXD9nFpDUfxXw3+WgoIN48j3TdL1F58xRmKPpZjZ/quvNU3
ROxfGeLzphBXZwcLeKv8kN6m5fMkQgahhApQI/XtzcjvUEqHU7g+JLXTZHC9/TDa
kJusaKDiBrT0GNZK1age8DlO50FNgxRJL4OEjDk5PE331i3gDESR6YR/K0rKhw8T
m05EBl09WKMW0GC+nBxt4oLsmEG8L3QstgdI32JENqLEr/QNqsVaKKcbB/xhsJxi
92OroWgb490hRmCP2L38j1Qsh+Y5IZJK5d30CkcRagiDmZsjAugYbbLnGpmhH65c
0p7DAy8Fg8FiVMy52mTFeOWCPHpqsJsklIeY9NkH73nwRK2JAnJaFLRL9yrVsZHi
lWURzHhkO9k8SVdzkI4rjspud1W33ct0QxaGTqwb4B0pdRW4ZXrF+WgxUugWxGyH
2JgWYq89uOyeLfLMQD3J5WibVQnskxcGiy7KnERgrVobvctdtuVtP9GMDAyLCwAa
TR2uPxzhVB3GmujT5A653uAwo7PUHa+y15ZoJIJjxCRxxMFKjZo=
=OGlR
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--
