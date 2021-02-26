Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D441432614B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 11:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhBZKcD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 05:32:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:47764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230495AbhBZKb5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 05:31:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 039B664EF3;
        Fri, 26 Feb 2021 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614335476;
        bh=rvI3gW6tejFx8m330zT52/NRf4E5vx8z0GaMSpp4ou4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PKCqNpCL9GnbzoCjb0HAt6McQt5hQMs6/CN6xVhDeMyIrOub2XeGdkT+YsiWkdGLc
         TUFNpfvtugA1CnmHqaj5gMftDuvl245lX/TuVRWRauDqRm9FBiZ7aIoRm0anFUmwKJ
         4TRXWCbQrZU1PQW5POOTPCE7rZAFX4S8u16TDz8PFzDDWX5OB+MTwM5qqbujg6ta6Z
         B/lfq7ut/ChNrweHgTxNk+lXKsYrIli+6cvbgsYS6x9zsnosE1CX6yk0r8yHBNDEX6
         Xm7zFNXDEXIy7ZoU90TREkxvdDhCIG5RHLCtZgwzR8vQo3I23ZTz98pUCMfjywGln6
         1eXTlCm5tY0bA==
Date:   Fri, 26 Feb 2021 11:31:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "i2c: i2c-qcom-geni: Add shutdown callback for
 i2c"
Message-ID: <20210226103112.GE1014@ninjato>
References: <20210224092313.2238-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Content-Disposition: inline
In-Reply-To: <20210224092313.2238-1-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 10:23:13AM +0100, Wolfram Sang wrote:
> This reverts commit e0371298ddc51761be257698554ea507ac8bf831. It was
> accidently applied despite discussion still going on.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA4zfAACgkQFA3kzBSg
KbanIBAAsTrlkP9m0Hs7QoKF5EnNxCB2V2K29DWkQJLyFL+7ZCv3tHirnR4a8cfi
Yk2WTL7PvS2AEtMe63JcvW/88L4pJE9g84+qjBVeFcV+PLbW4+vNyZZFUTRefQJw
yte7LuZRE+QBRdiOXfrvpynwkAew5tUQS6KPV9oVCamA2BB2Lrn300hgt2I2qMlS
RisJT9RDK7JziKKxX0ZdFeFug/1elREeB93QuUqHdqZcUEDx/83ZAKzQXcs7bo7J
Xw+IulsW2OgvD16HdkI7t4+10OPzt33CTf39LEpZJhAv2kA6Nr74+e1s0kv9XwhD
f/kelVQ/XbGtXbJ6PESOcrBM9nKrd6gwqBsE1En7h+Fblm0hENfuQHKOLrJ/jirj
0o0bxNgmkYl/eSYbgW8jCEuyTCIf2sAnaQtAuqg4/nsfgN9YnAxXmEsvSh6O3JY3
mIgzW7Unj7pUrHD/D6OA/qUUouzc9bqhjmejNRsovwdumUBWf/1sdCZKrlnhGVhT
3oqWcia3oE0PJfeB3DJ1jmYAJkwrrnod/7B4e1v/iSCMrvbqZAdPnaJcr1Foo82D
kPq/aV4vnRLYKu2VWJysBavijRBuijspikc3luXB2HT6rvRQR0EDelSlEoJsxFtV
MCr/++GVV+sHiFzl5+S7Y2Iah4WrFRt/TrqZcoa7QubwzFc4L9k=
=l7Ss
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--
