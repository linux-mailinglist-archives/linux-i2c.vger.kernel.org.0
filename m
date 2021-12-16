Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C47477EA0
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236548AbhLPVSp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:18:45 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58968 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbhLPVSp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:18:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 324D8B82640
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 21:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E02C36AE7;
        Thu, 16 Dec 2021 21:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639689522;
        bh=viFWY6W1WUbxedqXiyULC6e7EyEmjPf6qUobhybq4Jg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FFSe4sE5vp8uwsEt+oVyMdVLnRcLNfpb1HU5NObMHdYXfWcZ9+pezkJDkpAq0APVz
         HObFUMmGm7p9egI7uC97C9bJSHPK49oSIjptZnqi5yYRUVZFTyQie2fGXqv2gSKE2X
         obz7AhGGvSQF0dbIuQIW0Tm0zXEAYts75N9Qpq/fbIpafGxXfZNVs9GESVMsLxk6Tt
         Wc8SlewLZuRqN1OiAWCaOGYrVrHwfpfhKQR7fBwmBsQwlI//QU33yJ+hWSHrsWO9wK
         1zpJbvyu/Dj1mu1Ard5uMrembDBviqXPDMt6sriXxJRkqiivS/NOD5GvhHUWa2KtXm
         RcazieVL3KMtA==
Date:   Thu, 16 Dec 2021 22:18:39 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 5/6] i2c: designware-pci: use __maybe_unused for PM
 functions
Message-ID: <YbutLzWyeV7wwA2J@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
 <20211215151205.584264-5-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OByVH1OLcnSIn9MR"
Content-Disposition: inline
In-Reply-To: <20211215151205.584264-5-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OByVH1OLcnSIn9MR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 05:12:04PM +0200, Jarkko Nikula wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Use __maybe_unused for PM functions instead of ifdeffery.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--OByVH1OLcnSIn9MR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rS8ACgkQFA3kzBSg
KbYenw//XfWRu5E70CwVhJs3VnGsg8S8g7DOR6kOavFZd/uj7KowOCTTBsEeV4+V
rpj/QWd9JDnYKUgTVrhQmQ7tkrE7AQKrZw5xN4iqaTaSA7ti2lG0GPUBPBBNmTBS
mHKLPdry6lioNiCBQMmSP/BQJCkR6llZRMFR04zckQc8y67Ni8cnUOsdiXdfO5wy
2ChmrGdwHPdR8ZfHv0rwRqlp7drRNlLL8nlKidMtCSBnJ7ucOSYHzNPqD7kNo3Qz
mVZlPqy/9sx6D3wWEj0x3XKxT5jeYccMedCiLN2UAWDJsQ2WeZfU5D/aUKcf2aXu
h54sTPDTAX+ytZidq4Zmv17993dq/Tml6qwoX1AMOaa6NbnjvcaxePkqf4pfJr8n
GXjM1N+8Z4jSvyMZlRLFYEeyc5igqSt4M/ybQgwhZ4IhmocHOI8i5aqB+eooaeCA
tKO8UtBm9lSyWrUz3o+AvntYqzE+75gVdwJCVizSk8gW1MA3RYmxIa6Vt6rEEeGv
ACqXVZG+S3Ox9F75wLdAF5LSC25DaS/23DExAtMArqK6k/6RTQAf62rPIA0eniAA
qi9jfL5YPXjyup3i7Q8wgcsXgSYNqvo0FwYSOEG8gdN+0aeTLycuR66qNNhao9O9
1JNhCZ+cRcKzR1U0/sLhX/Yn8Jrd/DcInME53HWwCl+feCdmOgo=
=aNNk
-----END PGP SIGNATURE-----

--OByVH1OLcnSIn9MR--
