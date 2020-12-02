Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6512CC0E2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgLBPb6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:31:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgLBPb5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:31:57 -0500
Date:   Wed, 2 Dec 2020 16:31:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606923076;
        bh=4VuGyn84oOsN2fMeDdIHrqZQusWZiW7KJN6Mumj/b/E=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=piRJGjDu8txP/cWnq+Sd+9SQJSBOGDC8fewMHuVhD+UalHSVTp3tFsXaAhduFx9fD
         PKQugzaXTGuTYtks8Rldx18y5b6N+9+XQ4kVkeDNw9IwUKuIpAdJ/OVUxTu2Fg+Uvh
         +cveDe8ojQ7++PKC8HhYF6xEDA54p5I5eb+WU1Cg=
From:   Wolfram Sang <wsa@kernel.org>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Bjorn Helgaas <helgaas@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v1] i2c: nvidia-gpu: drop empty stub for runtime pm
Message-ID: <20201202153113.GF874@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Bjorn Helgaas <helgaas@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20201107082151.58239-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
Content-Disposition: inline
In-Reply-To: <20201107082151.58239-1-vaibhavgupta40@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 07, 2020 at 01:51:51PM +0530, Vaibhav Gupta wrote:
> After the commit c5eb1190074c ("PCI / PM: Allow runtime PM without callba=
ck
> functions") we no more need empty stubs for runtime-pm to work.
>=20
> The driver has no device specific task(s) for .suspend() . The stub was
> placed just for runtime-pm, which can be dropped now.
>=20
> Reported-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied to for-next, thanks!


--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/Hs0EACgkQFA3kzBSg
KbZjJRAAlTj05bFsjhp2ZE6URRYK44l3P7fz8tEG9Ba8/SrY7f23aRs/lDusTqiJ
lzL9KZDd5cJ7iH3SQXTn0adpoYCnqVTX5eqOCD8VkwyqRBKMI9u+7yOvL94+16XW
2r542vmiNfNP7Km+DhqwxUnejz2sIEe/Se+aKgAdrAVztcwlpq5v4C+TgDDRRWYH
n9uDEB/zjBwE4RDJ+Vpmz9pk1QmiuHNoJR1/pMvS2ccxf3PzypfthfAYbE6f5inz
peWlZc9eF+AdTIsuoSGMPsflnHWU7J7KI6nS6VnW/I62IfAxopGawnfv/Mkz+kBa
8YJfEPOhFMZkT3f1Jl9eGFf48OBIkLhRJsA+VlnzUmwzx5opI5QCVITW5zHbKVkZ
VAz+Duf2Ze0ob9MG4QLYL7iReJFmNpruGPKb8rtftbp0CBl6AAPXW7GGEp/sJF8c
yRdtH9R9LXMChBLXQ3BUNXT8SZt1TH+GdJV+OpUg+bA3md9mSGteuUxGkNdRLGCw
XVk1GimTJnmRU5m7FTggZIR2rY9RRcKWmFKUKwblkANkg+ucXbjVhElhdFVAtzU9
2IKQ5q2BaitXQ6NajlLBjjcjAs8ocsapDfK62e1cLUOfSHRm3DrHOufbP5CpXe4c
4SSvqmJH9L9CCuXfAJl8RGOfEyUoKeEC3OcotfRG+YUqv3p4xpo=
=DpHr
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--
