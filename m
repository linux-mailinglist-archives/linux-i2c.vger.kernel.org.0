Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E566446AB8
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Nov 2021 22:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhKEV5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Nov 2021 17:57:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231278AbhKEV5j (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Nov 2021 17:57:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 176FC611C1;
        Fri,  5 Nov 2021 21:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636149299;
        bh=ozLXL5/2PJL3zbRtU8MD/vvGcph5oF+8ijAGfOjyUqU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l4E1V4IyVRhANj+/5iOD/zho763+XCq9A47TQZ3vgq9wwmU3zu+aJpeYy0zgwvMP1
         0AePxgsviW7bL3zThVDvbEHf+wTHzVw5erAjhiCKtkM2aQOK27E5bQ9g0MfM8AXI2Q
         4tDEqerU7rnx7MTY4HAm+jgsVAXxMWw5Ub5c2it/YLxUptZX2CF23uxugFuPwBWMT8
         Eyrag+ShHuOAqkPO5qFF3IHb+PPt1Kl/I1bXYCafdDgE91wZYcNSwTcQozbq1IgQvS
         yrlv97ZglzH/ubdjjewEYfnzuojVM1i8fOR1LPmUJqJSjyUvfRbstB5sd1AgqTxs3X
         00f9sI/+jNrJg==
Date:   Fri, 5 Nov 2021 22:54:55 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, viresh.kumar@linaro.org,
        conghui.chen@intel.com, mst@redhat.com, jiedeng@alumni.sjtu.edu.cn,
        vincent.whitchurch@axis.com
Subject: Re: [PATCH] i2c: virtio: update the maintainer to Conghui
Message-ID: <YYWoLxrhMMYdJeJ8@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, viresh.kumar@linaro.org,
        conghui.chen@intel.com, mst@redhat.com, jiedeng@alumni.sjtu.edu.cn,
        vincent.whitchurch@axis.com
References: <00fadb64713aebd752dca3156e37c8f01c5ac184.1635736816.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p/3B1e8uB5Gz7BDf"
Content-Disposition: inline
In-Reply-To: <00fadb64713aebd752dca3156e37c8f01c5ac184.1635736816.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p/3B1e8uB5Gz7BDf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 01:24:50PM +0800, Jie Deng wrote:
> Due to changes in my work, I'm passing the virtio-i2c driver
> maintenance to Conghui.
>=20
> Signed-off-by: Jie Deng <jie.deng@intel.com>

Applied to for-next, thanks!


--p/3B1e8uB5Gz7BDf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGFqC8ACgkQFA3kzBSg
KbbLdA//SKDwfQfgKzLLa+x6RK61bqbX5LdqdDVpSPVaxGNSmNJZXDROjBb+t8WQ
swB3ZakcMIkLZHFbUoLKH+TN0SRos31DGtGhQf6W5/Oiz4lgFBnHGNw29IqxwEMh
oh+5ijcInSR61aUIXJ6jwj/FAHBH3NmcPE5sNLEn4OVctk5n1rGD2CLCdJ+LAJqP
KgCux7ib3m0QEvSpYMf2cIR1tb78SOxlaFTp8bofjDVDzh/5GHPHRaGej9Ja5Abm
gvzuUCOQjitWfJGVTldAg7UocC9QvazkAKM6Dcz10S0YdVg+b+pLKvDNO81IbmUg
oOl1Gg6LolSKD3+qI95kYLKJOa6305j1Sfr+EhjnzAU/CsuQBQv8c1ibOXL2fRap
Jc2KAudvUKeQPMbGaRDeDUs4JODY6d07LK5uSTu6Qycvh+Rl1dUCPGFQNKKanM6q
D4Qpaq03sKzzDQK1wdn4fotBIPjXcPGNa2kGiyszw+NWj1Oj867DqT7rBxYRMeYu
6E/D1lWnT+HIuDFn3sYju/97l6kt8xZ3O5p0H4uJvUXoEZD9PLlFs+0ZFzDRNpAK
7BjOo3Y261n5noosesW4QmrrcbvC/Ugri8+NdCUcKEcsX9ELeHvQ4AmKRR2pa2fE
JRxJ6gLFnVhx9EUsSHYfOOGQmep8eUMtlCAb9vCQnsmpmTAQDx0=
=kEyn
-----END PGP SIGNATURE-----

--p/3B1e8uB5Gz7BDf--
