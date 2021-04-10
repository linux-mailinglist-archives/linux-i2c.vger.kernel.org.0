Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7358435B037
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 21:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhDJTsf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 15:48:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:50070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234548AbhDJTse (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Apr 2021 15:48:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EE2D610A3;
        Sat, 10 Apr 2021 19:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618084099;
        bh=kJSTGGf2nz6yNk6E8TmDdedimXMqQy0Wh3oLnTh1+88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pq8w+X27R8E/X9E5tQCZA9dS72IOovDKrJ4ZkhXQ/LJvmGvx10T8jQhnDtlD/k3qn
         TQ8z72PxVXnPrhOQxHwvUtsZ5/yXyNaTjduqm5ldu3YIu5eHRr+u/uN+M8W6NtqxFM
         mrN/oGjAaz8UqyAUwrWUn3akRbXZfJAf4H9Ux02ISS2wapXhuvU0+CcrCtKe1dovuO
         qgu0d3JKoJmBHpFIFvEMD47Yum4V1OC3G7VQK927qpnlIwCfkMpgeusj7vVWUPk3lm
         hmAtRjoXKFLmDb88eJxY+Q5o2omJ14p5jqpsqQOe/cJpc+RCA8EA7YqloNmC5bwFpZ
         Dn9BsP+M2FQMg==
Date:   Sat, 10 Apr 2021 21:48:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] i2c: Adding support for software nodes
Message-ID: <20210410194812.GA2471@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 01:50:35PM +0300, Heikki Krogerus wrote:
> Hi,
>=20
> The old device property API (device_add_properties()) is going to be
> removed. These prepare the i2c subsystem and drivers for the change.
> The change is fairly trivial in case of i2c. All we need to do is add
> complete software nodes to the devices instead of only the device
> properties in those nodes.
>=20
> thanks,
>=20
> Heikki Krogerus (12):
>   i2c: Add support for software nodes
>   ARM: davinci: Constify the software nodes
>   ARM: omap1: osk: Constify the software node
>   ARM: pxa: stargate2: Constify the software node
>   ARM: s3c: mini2440: Constify the software node
>   platform/x86: intel_cht_int33fe_microb: Constify the software node
>   i2c: cht-wc: Constify the software node
>   i2c: nvidia-gpu: Constify the software node
>   i2c: icy: Constify the software node
>   platform/chrome: chromeos_laptop - Prepare complete software nodes
>   Input: elantech - Prepare a complete software node for the device
>   i2c: Remove support for dangling device properties

Merged the immutable branch (with added tag from Robert) to for-next
now. Branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/software-no=
des

tag: <i2c-software-nodes-20210410>

Thank you, Heikki and all reviewers!


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmByAPgACgkQFA3kzBSg
KbaY3w//Q4C/yR6w9Gchkx+3Xzsnm++Sw+I82MDLP9Nhe7gANQPpxsdfvhmcne05
qj0H1XJZQsXLLPkgCR/FK7AQej8WOP7NTdkH/Ix/QdIeZpO9rA09K3I7b+HulUBU
nABRUuW6uFSS0t0jvASK9XOwGmPgChF1q09/tpsxMEGVuiNFa1ZofnikI8XTc2HE
xysay+fXSe0D684PcXqMZiNL95Z2q4PCthQausCU2TV9OsWBrFFQYIaAqAvlnZuG
oDGombZrdNEqTZGnrwpeHY0GMX/BzAXvVcKtY/Do8eqUHBZjLQ1EdKPEfpZpd87X
SUvcmoCijWJt5KOGl7wPF/dkkW9ybm/HuF5HCx3jevWicj2MXypB7Ly9qhOOE17t
Q1/IBA3k2pBeRgoHkVD0CV4/++SeJtHjcse9RwZE+wLEeDoCcc6oVasVKerLam8j
fvX2e4ozKNP4ZK7kUzAousHegOtV8HRACiVA6/Q4zuFoK/rH1HmaS+BRqHDQ9q5W
/5jjwAmljVp9YEL5miHMRMMCRAz+TtwJl3mBGKvzOJSM4LD7U7PGDw2n4nKOb9J8
llfslY7cKoixPtpyqdUpV4gPA/V+F71K8YeUpMlFhkI58RUcdS279fzEx+1rinwN
3U9QaTb6Ih/QoNc+n3Vd3yGYkMbQIM9csc0iVKP+g3kaO1umRQc=
=9iRX
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
