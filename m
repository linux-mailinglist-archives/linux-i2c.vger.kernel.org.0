Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB54355C4E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 21:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbhDFTjN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 15:39:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:56274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234889AbhDFTjH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 15:39:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98EAF61158;
        Tue,  6 Apr 2021 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617737939;
        bh=1nAJ4ebONi+kqQk/MQuXkdwBD38kW+SEHPkr2f+I+gI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q2ComW25g2sN3JEDMIMEOlXJ3qWy1bTKAmq9glL4sF+1m4KfeWiyPGR25henPSmH0
         WiqWiLlU5gIrFu1NcUYRQNJaLQXT8B8VQl56NgCq/gwbxTQIRm3ZjvNJTm+pgs0UH8
         SK5Ja3+zNKktaRJTV2+pozJd1o3K0n14EPGXw3QxO7X9x0/4KV35wDZm3wrco/QS/d
         MWAikDs5bhxnfZjhm8whA2Ebz4us41G52zfj7MfL1+M7SMIgODj/3qRlxcW1cXDXoa
         kPCdy1k258itr6bWspdxxBBGQdHzyY7JB59SaAWSedxOAfE8uqhKz7ZXAJreJmKbpd
         JbOO7ybIPu8cg==
Date:   Tue, 6 Apr 2021 21:38:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 02/12] ARM: davinci: Constify the software nodes
Message-ID: <20210406193855.GB3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <20210329105047.51033-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 01:50:37PM +0300, Heikki Krogerus wrote:
> Additional device properties are always just a part of a
> software fwnode. If the device properties are constant, the
> software node can also be constant.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I like to apply it soon. Can we get an ack, please?


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsuM8ACgkQFA3kzBSg
KbZHRQ//V8ngdgKJ6YAUU8LP7+maL0xlYDrLRosoNxVZUyEjTT7iyvqlg8mpZ44V
puzForjzOMGrmBn4Jse6kA/zDdoOrf1/GiZQtBddGq1H0gWdD+eahvmAHvW5E9QP
NpzQ1YTOAeHxuA0Qug7mC8THxyF3/YogIYQHCy8JmNT8L21sFqxdZMY/vrPWJX4v
NCii+NLwJd7KyPM2h/OS7pG+THmZvO8tj/UaGe0hQp1kWJFWsrePhFUw+iqmBQK0
/c91sjDYOrh7rDgZH4Pjh73/JuRooJB+59rrSoTW/s74PQeF3E5ipI4mZHHAa3Ur
GQZwtSKO8qC9cxAezN7C6JtWPzUmDRIFv2OUVeRr5P9lFoXiUirsRhBam8PRu0sy
7ILhaY7+6OlwL7i4OrOXttkYWvYlOVE4fxMEpq4aCQi8/18x1K5UXU4gibkngJSP
fgaoLYxrMkwMqEvbBb78wjXxGUm9SI7sedsIfHE5YtxVWGiukJxhKcl+Q6HNKOIK
zDCottvxGmP4xDxGhw1IwFEFM6A9VYLl+SUk87GqTtNCvy8Q/WwEVMojkJBDX54R
FH599zaXZKUz02oG3jmIzZXCa0pPz6kswf9gKcpt50jkjA0ZvIaiW4+2AD1NiRYI
cmjIt3CHYHcLSK67mgIk13RraCWOBgjVW4f6IlwrHKhl+zjNH0E=
=YZ+O
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
