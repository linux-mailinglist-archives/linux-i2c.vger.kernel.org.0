Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4651139ABC1
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 22:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhFCU11 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 16:27:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhFCU10 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 16:27:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE3466108D;
        Thu,  3 Jun 2021 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622751941;
        bh=14e4ANwC5usN+7RNn9d1zueQxt3zXg2RzNznhChwp28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AO4Smmr1c730nbLDhch/dZyD7ed0xEprHQ/ZTN7v7dZbgbyyF+5B8w+0IVWh5g2gW
         ThGqfU1oN0IracroeMGZLW/tHFx8WAZ4vcHbp37hITyghxsoD/YFSXuIJAMRcYDSJa
         LaaOWdECV6o1nEjqc1WUKwZnFYEa8Z4lDbpqTmhjZmZe+L1Ek2544WAO4UlsiRvJbh
         qXhir2ged+fzXrvlR3HBHfsi89/V7GHapL+f/gxwlo7WSjAcCgIiPn8DRMI9872eJU
         Nw3AG03gT9TlMDEsTI/O276pMq6qRL4SXEFO9gyZ3N39g9OswqV936a7/XH3rGmDwE
         5KK9ejPg17pdQ==
Date:   Thu, 3 Jun 2021 22:25:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Thor Thayer <thor.thayer@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 04/16] i2c: busses: i2c-altera: Fix formatting issue in
 struct and demote unworthy kernel-doc headers
Message-ID: <YLk6wgE0o9f9WQCT@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Thor Thayer <thor.thayer@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/sWLq9UAENoQS1je"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-5-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/sWLq9UAENoQS1je
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:00:53PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-altera.c:74: warning: cannot understand function =
prototype: 'struct altr_i2c_dev '
>  drivers/i2c/busses/i2c-altera.c:180: warning: Function parameter or memb=
er 'idev' not described in 'altr_i2c_transfer'
>  drivers/i2c/busses/i2c-altera.c:180: warning: Function parameter or memb=
er 'data' not described in 'altr_i2c_transfer'
>  drivers/i2c/busses/i2c-altera.c:193: warning: Function parameter or memb=
er 'idev' not described in 'altr_i2c_empty_rx_fifo'
>  drivers/i2c/busses/i2c-altera.c:209: warning: Function parameter or memb=
er 'idev' not described in 'altr_i2c_fill_tx_fifo'
>=20
> Cc: Thor Thayer <thor.thayer@linux.intel.com>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--/sWLq9UAENoQS1je
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC5OsIACgkQFA3kzBSg
KbYwlxAAjtOk+RWF1LLBMIWxdpvmoiZG3q0c6jlyKGUXyni+ZxT8Y0r70YOqLL1A
PAkI4P3+r6b9fdpd37G5T71MmwUfFk9WUWKe/v4iGDy9XwQLCmUMrQm9efDjvOmu
Fbhsgb+Q1DHyQ3YfpjaeJYf+ufeYot7ZclNEKUkHzE1cDOfigNXXJ2zI945uUkFh
DtJVCAZJ8EJv+6BO6ccSuXytL3TJIV08dwbMiDUROs5DoXy+9aECwKBUyCvt/j2L
oshNd1shanwp/+VKXgjPIwo81ji2nPKPbICVDcJ14taV5lmR3H75mpBhtAobHtUx
YC8zMaCL7lU0ByoH1ROVJKf+PQBGumh0BSTiUSf4VUBSGaObu5PeqCTxwbkfGp0I
PwuWXvdTWPsGK/ee7HolQqA+vc9QnieqGRPMDhER5lhL3Hw02LP6UUlZuaWv2UKz
Ac9zHc4DZlauAFaGGVm+USCwcuv4NIIYSne21kfMPf6hct41yl39Shd7QtsqE9q4
n2SqctQj/N7sKlMid+rpK+SWKui89Sg7kK1q+RoLDiqScO5OGMaKfabhz3IC7kvz
963XjX0x6wssOvo2WKUmDXfVOVifNdq0hbK5zfM8f3YGTyQb+qaMfXzRv+OAXei5
wGyruv8vvmBdWUtRIVQYJCj0OYp2Lgy96AKt0M3sFEsc9GI8MwM=
=3bbQ
-----END PGP SIGNATURE-----

--/sWLq9UAENoQS1je--
