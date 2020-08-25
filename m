Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537FB251396
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbgHYHvI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:51:08 -0400
Received: from www.zeus03.de ([194.117.254.33]:41238 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729558AbgHYHvD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=RkmN5oQVYbSXBWOCgctuDP1Bwdaw
        TRj4DTnGfBXTQjY=; b=D6I7TlJEvmoLzZRTJMWr7DaE9wrFzrNLskeHuTTomMlL
        pSfQmaYMh6yH3zCLxoorxiX5c7QKbMp0HXYMhXy8RbjeZlZMfHM/iDd6wSN8wJH6
        SQw3XzXrVGaCDExVgi4kAiZFSz0yRZSTC2YhT93Va0jN2pzjq55pSYfWAGUPvOQ=
Received: (qmail 132884 invoked from network); 25 Aug 2020 09:51:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2020 09:51:01 +0200
X-UD-Smtp-Session: l3s3148p1@BVrg9q6tXrwgAwDPXwyVALCfLslKKFLZ
Date:   Tue, 25 Aug 2020 09:51:01 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Remove 'default n' from busses/Kconfig
Message-ID: <20200825075100.GH1861@ninjato>
References: <20200820080525.2767120-1-jarkko.nikula@linux.intel.com>
 <20200825092809.2d826758@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VkqCAaSJIySsbD6j"
Content-Disposition: inline
In-Reply-To: <20200825092809.2d826758@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VkqCAaSJIySsbD6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Option I2C_STUB suffers from the same but uses a different syntax,
> which may explain why you missed it.
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

I removed that one, too, and added your tag. Thanks!


--VkqCAaSJIySsbD6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9EwuQACgkQFA3kzBSg
Kbb++xAAlVokBwGMSWXhT4HMl8tMT9MlVijQnCgRn3+VJd3nVuUiRha+FEAYpQWm
bmPW5oqVVz/8Gq9kPsFgEUH/xtcrhs2LLm2jdu0sI0ngdUp5BnK4vNCbOV+z92Ry
/QJQZl5EvH98J7psNleuv9cP0BcAwSQQ7NCbpLirSuCY78FeLgHJ9rG4thpxi8pB
uEIhXOFPwTI1v6c2pgl5tIctFZVfmm3AwVrkXmYFs3wxb7f0/VlKKsGjswpmYaSZ
AoERMvzmx9hYFySHSFxK0drXKIZ9pXxDwipyovIh/d/0C1BC3Agg3nwe+YVPAGii
AxBSyjdoqZsNSxA+qChq1GLg6grf3Znuv6xATLyFP+YneNhKsj6Bszu4yi6xIt2G
Wfva+YhaPOV9XlW82OmWQNHyMcyhXkr9ux3/+BPx5eozRshjWOtM3Rq/ttORTJ8x
oG5Koia5ahRT1AFuPc1urn7kjtP8afZUlp4UZxmrH59cmsrHabJPLsTotl7uLtzh
vV30L6fGLDk3edm4Dr71R1659dHzEahpF1D2ldK+STohRjS9NHUEYaOkZdQF7FEZ
MQ9ToyvQOzn43oNyd3ToQd6NcqJ74E77E6Xd6CAIuH+zJfTyxhRTKjdSyS3ky0P3
paHOctbnPyOP92+QbLN34SiCWW5dNXWWEd3pxIfm3O1zsCwc9oo=
=6ZPI
-----END PGP SIGNATURE-----

--VkqCAaSJIySsbD6j--
