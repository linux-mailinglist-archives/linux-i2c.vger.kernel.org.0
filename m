Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B178358F1A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 23:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbhDHVXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 17:23:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhDHVXG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 17:23:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C2916115B;
        Thu,  8 Apr 2021 21:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617916975;
        bh=usgujaDbzXIRYTYizJLHMzZlfLvuwu+IBbDi8a6scwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q0sU1bdl3LY852OxCfVxM+4TSUTgUjykpzUMC9RcivOTcikzuwZO66KUiUSZ2p/yF
         XQe0ZQaLt/qeAIjHUqS6s3kfDbJt/Wl+gccpgHKlaWQrGIwbHccjvOBhuhQLCkZ7fF
         2zMGqLjmwz5pjjOzql8BpyJntHuAGjkFyYReEt0myeY2cbKBVpyQMSFq7R2qCeqahh
         owrr+uIsi7/tc0OPgwMd8+VxreLoGgGZETLI18AvDQG9qpYT5biJJEY/2dbH+DT1s5
         ylD1tfP++/vi4ryPJRuVQWSvEYDlceFYh/ZXirgmcrIPFO7r+evqrpSVKtFGHdAT2b
         bDL1rOZX/LFgQ==
Date:   Thu, 8 Apr 2021 23:22:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Max Staudt <max@enpas.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] i2c: icy: Constify the software node
Message-ID: <20210408212251.GJ1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Max Staudt <max@enpas.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-10-heikki.krogerus@linux.intel.com>
 <20210330155856.3cf32fce.max@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="apbmkPN6Hu/1dI3g"
Content-Disposition: inline
In-Reply-To: <20210330155856.3cf32fce.max@enpas.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--apbmkPN6Hu/1dI3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 03:58:56PM +0200, Max Staudt wrote:
> This looks great, thank you for constifying this.
>=20
> Finally it's clean again, yet much more flexible than the original
> platform_data approach when I first submitted the driver.

I read this as "Reviewed-by" ;)


--apbmkPN6Hu/1dI3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvdCsACgkQFA3kzBSg
KbYn0g//Q7Ds6Iml2k/8B+V01/8h6pj8RlYMqtIefYNHN3TI5b7DOgXE/6WzwIs1
GUfNwlSqCg2xjkdlKtVgc/LPnNRqTqUwHx1PbTpQG6QJ4nZJHkjl5okyMoaJVbXK
aFWhrRDC0t+/KXcO+sheTAXj3nzAJFtrT7k5gqLKE7p1ZJCsgb2GmAEl1qO+wlYi
z/tCAex/fBKLU9YX+H4pKVwbUkjiliTDonlUZ9MgayuUT1BmrwSeqmdrbeySJSq+
gr6aI9i6numN4dpRYmcVUznewU2OSMVYmuVIDE5pUi2xzuQd71JjaH7So/oU46n8
T1DTp/kOFNAchwmw9Sd2TxvysoDu8IQvdW0HcVEvCam9n+6X/qYAxLW5wZwUf56L
nmowVU4z2AAuShElKKvS/pIi9tSBBMEr5WY8jG34Jf6anO5GIiuMtWuRei12ZWh5
Rz8XPD7MTSyLJINH9YknBfjzdYp9Kcds4j1nvrVjhjOWQS/fTt1Jb4KacsCy6T+r
JHTQQ/i/MW8grxzRhv6CA49fqA8nGitOBQS40/wCt1oQqMofi6s1LHRbH6OAZTQ/
39qrmITOddI6p7gNRr7PvPpF9h3pQZ03AFR59CTmMvnRvmytg5JZVJMlursoGlJD
pgg/8oQLVsl6bvv2vU1CKY29r8Q3Ff3GDgnMCAYMLS++lV7QYjU=
=Y4sv
-----END PGP SIGNATURE-----

--apbmkPN6Hu/1dI3g--
