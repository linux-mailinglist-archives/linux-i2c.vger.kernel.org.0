Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1D726851E
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 08:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgINGta (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 02:49:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:50064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgINGt2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Sep 2020 02:49:28 -0400
Received: from localhost (p54b331ca.dip0.t-ipconnect.de [84.179.49.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4C4B20770;
        Mon, 14 Sep 2020 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600066167;
        bh=1ovTmwaoGgAsU/YFwU7RKO8AxUT42bnKhpSGWhugXV0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q4o+AbBGIZv/xYO9CGR6DvEeUEpb3Lip/sqNY0SDF+vPDHm6ySIG2LIVa+Wpow+xv
         oPb0XOGx0ptbeG53x4tf/rBiTsiamWhFnQRxcPsIX0yWIaiFN0khLpN4MqtuncjPJk
         rwn208oOainxaJqRLMxpdD7KEY/YEFsxVmofCTpI=
Date:   Mon, 14 Sep 2020 08:49:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Message-ID: <20200914064920.GA1088@ninjato>
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
 <20200909082338.GC2272@ninjato>
 <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
 <20200911194526.GB909@ninjato>
 <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I'm happy to route it to stable@ if you think it's worth it but I don't=
=20
> think there's a specific Fixes: reference that can be used. The current=
=20
> behavior appears to have been that way since before git (looks like we=20
> noticed in 2014 but it's taken me 6 years to nag people into sending=20
> their fixes upstream).

Better late than never :) Thanks for sending and the heads up. If you
don't need it for stable, then we should maybe not send it. It would be
nice for 9665 but we haven't tested it on 9564. But I'll let it be your
call.


--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9fEmwACgkQFA3kzBSg
KbYikQ/+ILIiwrqEF6e2JO+lzW5f9Vqbix7JoNVk66HlXiJsWnRyGr6Y+wsRA2EY
ugpHK5p2N80WCDCCTWcPd3xA3cTZbPQjqP9czoq9JrGtBn7kX4nGyQosqnBU5j0b
oclTuesQ9y73y+TyTPg6tcisRAbTBaotCwzzz0DAndNjbpvynrk66xgUIteUB/4V
TGrAky58jYa+Ak+jfcQIPaPtNqemWP2bNHxFfPnEezybrYHUMojUhajVmJFAezCm
D0YOewjeAAHdrRYIgw1DAKFpCjXHEqAc23N6z3btu90l1kSjD3SuH+1LwxttVlSi
ThjAoEVTXQxjF+GH+XOJsH5p0HQEkGl2klHpqYqdPkZc9EyXiY/tKy1mcPwM74VM
mngoa9Om0dUCrCtwU76Z4aI/5z2z9OkS0zuI/EKRoC6uESF8YDcOAFkkAhh5CbJg
Yq42SM9kCSBHGIPcQa/sh878PT7DhGIPsrdSLKnTsMv5Y5b8tXQ85y0xaQSPb3yp
UVm5kXqFFgsHslj6noJ799KVf+k04Ctyra/S89Gn1F56x11T1ks0TOp3dCsa1Zvk
FjlVQj3dEZ3xQ1rBICc2wzgLgnlgZPvXOIEml4Z7rmvUFK4YriQjMdu49dwS421L
J/qI8RRM2j0AKkS2ymnLN/8pr03n0LjZlPGljp5YQS94O3DXpug=
=CKT7
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
