Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96369271EEE
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgIUJaq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:30:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:57818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbgIUJaq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:30:46 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84C0820719;
        Mon, 21 Sep 2020 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600680646;
        bh=QzdhJeMVakJ33SH/mR/ckJdt+OwIi74pdl2Bs0dhLDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FgubgRR1/cIhqPknHv652OSg9Te4AK6AH7khFhNx0r97WUf8tPU9OmQJx6S2uJS6L
         G3zgsQMcUfVubGQ64pR81d8s73NGtfyFpm7YP1p0J3KxzJfnAmAwvNRD+yjBEq+WWE
         aqk5cMHTpeZE5aDPek0JLMgfPAjRFsCb7mHcsnAM=
Date:   Mon, 21 Sep 2020 11:30:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Volker =?utf-8?Q?R=C3=BCmelin?= <volker.ruemelin@googlemail.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH] i2c: i801: Exclude device from suspend direct complete
 optimization
Message-ID: <20200921093042.GG1840@ninjato>
References: <20200910115708.263c8e02@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fCcDWlUEdh43YKr8"
Content-Disposition: inline
In-Reply-To: <20200910115708.263c8e02@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fCcDWlUEdh43YKr8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 11:57:08AM +0200, Jean Delvare wrote:
> By default, PCI drivers with runtime PM enabled will skip the calls
> to suspend and resume on system PM. For this driver, we don't want
> that, as we need to perform additional steps for system PM to work
> properly on all systems. So instruct the PM core to not skip these
> calls.
>=20
> Fixes: a9c8088c7988 ("i2c: i801: Don't restore config registers on runtim=
e PM")
> Reported-by: Volker R=C3=BCmelin <volker.ruemelin@googlemail.com>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: stable@vger.kernel.org

Applied to for-current, thanks!


--fCcDWlUEdh43YKr8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ocsIACgkQFA3kzBSg
Kba1HQ/9FhbIcvI1ZjUrxTAhWKvapOgGzxtvKBRx+UujgCUFowqK/WR1LlL0OK+n
SaZFJDv3TxHzLpjmjJwHpBs3MASs7W9uG1uc+bEZq89M8i8t9Ifq29MvZsWazV+f
ZH3Hy5B42he371PUlOeWiy/+cbgg+QImcXLvThOdFiTnQrebXZOOXsLSdI7tuL/F
EtmbcNAOa9MwifTyi5D23M/gMK9PSgTq2bsBUxM91RdVeGA8xvI67EodyCu6Onb0
y9or1jevrC5fkORpKxbm1wtkndc30h3tpy9F/G7wLQyTIGFN8Weff2DFOc84f9G7
NgMOY8FKmIdcBtF2YOivI1Fc0nBfIrVrAMoNShX3WIUEpZ62HnkbbsLtUC9bRAdp
6hym/ad9wSt4ogQ01g/I58gDhMoMPsXNdwb9I3URjeB8i4tS5BhVTp33c18k6QV5
48zMRmFb7LX5VNtVpSiBij6O/UDaRico+9pxbasQuP0DPK1JyV/p0uc3yQF3LKXk
P+p6gzllj/B05lKg0JPO0COsYLKbFsY1t2oF1/4yIPD6Uppw1A20vNiX2x45PnS3
WDpJCBLRj7XARcci56ApD/7JcAWZB9nC8WkCfnP1DjcfA5CPVkSrJc0H9KMWE7ju
UvEgyrF1t+d/SUw0mRSwbem6bDt/IDVdfIA6RijBabWxlUJ4Ras=
=Y1X9
-----END PGP SIGNATURE-----

--fCcDWlUEdh43YKr8--
