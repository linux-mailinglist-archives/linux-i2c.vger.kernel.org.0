Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94D94997C7
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 22:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348391AbiAXVQX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 16:16:23 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:57150 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353803AbiAXVEY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 16:04:24 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EC79AB812A7;
        Mon, 24 Jan 2022 21:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E437C340E7;
        Mon, 24 Jan 2022 21:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643058259;
        bh=xrI2Yd8Z85VtM/EHXSuSj1x1uMSh4WRSVCjNSh83i40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rt8P/37acGeRdawKBy6Kot2gVMpJ+i0SnNoPhIwd4LveC2Y1I5GK7pJURL+ksEa9a
         1OtFYXPb+2oX2ZGxcObiOhFerPRCUaPd24D77pBN/xCm1StLFBKRKScWtv/T1Rcf27
         acbyaIRW1hdWYlgbQfyeygahiL1S1F+ZnBBDUdYsTnfmvdPUeLKaAG+WbSchocKDg3
         1zVtG6McE9y19BFccX/KcgMyeb0ex+0SRWPJnywmmHQCOZ2XLVSws8LEN1KNu7gcOJ
         Yw41rGlg7gehEssffEoCyHNfum2IyBaGvur2eHV9hTCnYgTXJPJi8Z+Kdu+06zxh4u
         NjStG0Lr9WgNg==
Date:   Mon, 24 Jan 2022 22:04:13 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Akhil R <akhilrajeev@nvidia.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 0/3] Enable named interrupt smbus-alert for ACPI
Message-ID: <Ye8UTQlHphVtAYUW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Akhil R <akhilrajeev@nvidia.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Ve-zYz27baJ9SV3wcyKS5iMnxFO61gGE2LXQPU_hTt+qw@mail.gmail.com>
 <CAJZ5v0guL4nk21gvvs2K9Ak6sjhDSzMvDQZJvmnq6Frsj3+7yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PQ+Di6JU9ZkrkCPn"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0guL4nk21gvvs2K9Ak6sjhDSzMvDQZJvmnq6Frsj3+7yA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PQ+Di6JU9ZkrkCPn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> It looks good to me.
>=20
> If no one else has concerns regarding it, I'll queue it up for 5.18.

I'd prefer this to go via I2C because it touches the I2C core. And SMBus
alert is I2C material anyway :)


--PQ+Di6JU9ZkrkCPn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHvFEkACgkQFA3kzBSg
KbYS+A/8ChbXO2Eu9RSZj1oeAp2Y5/csPWUB7EIozmvoC8o3JmK5mQPk/nu+QpPo
txvkFIK6NJM41Fhxp+yqq1cxLotOWSoA2rdHYv08mfj5uL0lxfYa6Zn6v+DJ0A6l
RRpSjbHq9pT/I4JLqJP+EqVq2FvJ0owmaOi28gBDiqdH/fqg5oa5cxoA9vD9Z9oK
r3RHDPOgM+aFxY4qRYEFtEi3T4NkK9yet+zpp5G9DtPz0qhxtVi8H7boOdGtPUyB
3gjp3KgR3sA2IQaFYbbCstYUXDsgu6/heina/rqv48M7TCC0M4lBMAzQemDSMs4t
ZveLjhwYNXbBwWVRMfuENLWFUJvYeXEFyD5A+RYMRDrQZo9ObGXRpk6YCfYNZ6UV
h90V+U0C67snDIcoQ31lbLyXZeAStvcIcEWPnk2RJ5dFvyDAkfz734HVD7xT2e6P
+0M4+/M9JDXEMAzV8DNi6YSc3IHhf88MmczYNS5APIWKhXzxQ6p1jGp94xIRXIK0
0fw18VxniVD27aWnxb4EmxwCf73NbzrwzbYY6whKQgXIgMHjlOqw/XRVbV3WyNKh
c3py3f6aad/mipXjUdKYpDDK+V275qa9n1w2OSks+XirXnJqedYRumiUncD4af+q
MrKRbl09XzdEkjRg6bCwQkZI9EW/bwLPskxdvHo1vC5/cWaMvkE=
=VNXV
-----END PGP SIGNATURE-----

--PQ+Di6JU9ZkrkCPn--
