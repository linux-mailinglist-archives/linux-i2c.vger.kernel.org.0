Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2669362BD2
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 01:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhDPXMB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Apr 2021 19:12:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:57008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229719AbhDPXMB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Apr 2021 19:12:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26728610C8;
        Fri, 16 Apr 2021 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618614695;
        bh=JEKOzu9GGFupcIyDX89yqxOvlDnV+0RTyJAVzFb2b+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TtcXutvTM3x/r98u5+LqIU9tujIORQJWjF51WkieCrC2livx39dLSahGb9e2jhMtX
         +hrdv08F4zuJmE8f/LsdfX/Ni8yJY4e+oe+MQJZ9aOymCfWGvcUmx7xKZAs2OPS/Mt
         Mkxz+8B/btRSya+S26JsrLINzwb4D6wa91xPFQ3gBf9cF0pkoXCy3B7X53iuh++Lhx
         kpLarByStNJuvWWqolXmlGOOi/bdOz+s0NqwZ71XNMfX2skRltQ0t9ZDoQuC3i0DQS
         4NeX8JZL6fPKKP99cUpSmFGzM8cYlHVNVIuKNua3xQYxxIiG89E8O6WzfMZ84Mh8LD
         KZjBRsljPaYpQ==
Date:   Sat, 17 Apr 2021 01:11:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Alder Lake PCH-M
Message-ID: <20210416231132.GD2680@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
References: <20210412134112.71752-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline
In-Reply-To: <20210412134112.71752-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 04:41:12PM +0300, Jarkko Nikula wrote:
> Add PCI ID of SMBus controller on Intel Alder Lake PCH-M.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

I recall Jean was fine with me picking up trivial enablement patches.
Applied to for-next, thanks!


--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB6GaQACgkQFA3kzBSg
KbaySw/+POdflO0JxcFDTSiou7m+FrF96GCIlk2PNXSI5eaGdVMrkyRdecL/B+hE
9vJbQoQyLCEutwlavVbXEcx9U613LfWZ38U+CI+MlrbfKO8n7hL9l5pdh22FyCLM
mLAyQLl+9ynGGCzl0LJ/bjnUZ9Vb/AwpOf89c/F2OQlohIonKk8aHk6D8kZKXR9K
BFr/jSX5OzOCjHV+kC/MUrkT+X5Hb/fjWG6CekMcSQuvgh13E6eehOueQOM1tFjF
vwkb5Pp29GPs0l8ILkzfbtbRfgROTASN0VJ2nCqIGTfcUCJslTFkr9aXyekbGxNI
Aw01ooDWMpLTycnXV5E14T/0pJaqtpCS+RLe/9cnveJAa9CLEWDJr0mAgMea9vQQ
f9CI+HNkEl5f7P4zQIkLW3BFcDLaXAirnjYJoOxbcBQThCmeZdGcch+vQhnqHpG8
4qjzHmbWbxbZ1awWYnHru8+FihlE1mu5wnGiqaMbrnbu+rTsHcEV1TIspeR9wg1c
e3sDIZI9fk4WPzydvKZDMsacqW72L58fa9oFGVzgYX88D4qP15fELLmi4oOkMv+Q
65wRW9fIhuB71FLkm90ebQ38G0sxa/HhY/v8WTW5bxvz+auQuCyronTTWOQKlp7f
sWsu/oujcJASj2JV6RF8PEJRzA2hAGELwjNLHUHTo2twJgntL8g=
=Luiv
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
