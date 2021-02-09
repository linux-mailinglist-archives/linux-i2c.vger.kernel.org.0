Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA1B314D6E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 11:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhBIKsG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 05:48:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:40772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231633AbhBIKqB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 05:46:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2626164E50;
        Tue,  9 Feb 2021 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612867520;
        bh=vzQGI2nY0iMFb5O+WrHZ4iVMMIj59oa09juYsjW61Uk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aIy0sA5W01M3hDdkNq1zBLcfJlDw/fu4Rp/n0bMigk2gJRvKgxXI/f/RjL1b0fWLa
         edT9y38qZSuVmjOqj0j/pBG5Z2FJECmWXBX6njRM2EekeT0iHm+0Qn1gycb+Ccn1DO
         8UNB0orYLlIOlGVEicZRIaGdwOYO/boxA2TRrAmsuBw9+Xuckt/G1uPFI8lgGwPOXx
         GhufsbyUs+Cz3nIxyUP5V2k5MJJ0FK3JtC76DcHoSCOyYRjb6dyKdhNpKfJJ3mfCqt
         WPyz//MGxI/QOJGiDU13NWZbmtsJTYSKXLqFGL56jkMh1pN3PKk73fkdwQFq4AixUG
         TrL1gC+vauhDQ==
Date:   Tue, 9 Feb 2021 11:45:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Add support for Intel Alder Lake PCH-P
Message-ID: <20210209104517.GD9698@ninjato>
References: <20210114143811.1820137-1-jarkko.nikula@linux.intel.com>
 <20210128085943.GD963@ninjato>
 <70c0c886-f8bb-1179-3bb9-f805ac7f4800@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline
In-Reply-To: <70c0c886-f8bb-1179-3bb9-f805ac7f4800@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Actually need to avoid patching it and Kconfig for each new chipset varia=
nt
> and make them shorter was my motivation behind commit 80d943ab19e9 ("i2c:
> i801: Consolidate chipset names in documentation and Kconfig").

OK, I'll try to remember next time ;)

> > And maybe we should add Jarkko as i801 maintainer because Jean is usual=
ly
> > fine with such changes?
> >=20
> I'm not sure am I up to the task? Meaning I don't feel I know it so well.
> I've been mostly adding new PCI IDs to new platforms.

OK, I was just asking. Jean seems to be MIA, so:

Applied to for-next, thanks!


--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAiZ70ACgkQFA3kzBSg
KbYVERAAm6x1NVjeUdc3/pfs7Rnc/6XT1QhFPRdZtJOC+IxYdC16avqoL0IGF7g8
CZewNMdO2zBgWpl3ftlSk5yBkCJeNenzNw7VTvES4XxdxdqijhdYpUlLwhjd/JK+
+j3x5CVK7l4n5EikDmBaQMw6nJFolYR87R9fzUWiivmTQoaWy3z8g9inI10NPGSZ
Bq5aO9CWRdKPcfFREXfHRWXpxaqftBhEmDhA1ZfSYOVnHEqo4XgpkdXWK27A6PTA
HA9whoXgSrp2arcFQnfngbgtvRFNd3L/XRQWb4Zp9KT3Vsh6XnhtgD8MC9CSiM4C
F06iIdfE72+J9oHU6ZBpJie0wDRTEA5VtMfxhg9sRBy4k7lFwfUwLtVMJAF3PE1e
3GeFRRArMb1zPSc0bqXsZauFwEQJMaBaagnO2qn8LLtOwV01jUCXY3yIwvYT1h/Q
SSmCKrdh5lSLlybARwnxcjF+VjRZUnDNIONir9VwW4N4Yl3tzDOBFN5mNdgoP1K9
Qo/2Xcb0JIgX8t9RqSS/Y4r3b3z6XTLkp94B8K6xuImG7YsAp/CkHEkTJZ2yHNEJ
hwSZei7ozRvdLmO7+VAmJDTmHYpe78w2P/ol+CD14RO8KrCa1JzcJPapyFAX9BaU
qLJpwCS5Nm/UD0MsM+p7sr+gLV98PZb/9Vw9EkcrlIYT8B5n8t4=
=pkz1
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
