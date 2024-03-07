Return-Path: <linux-i2c+bounces-2246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7D8749FA
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 09:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C24521F22BDB
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 08:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70B882890;
	Thu,  7 Mar 2024 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nW5I1pcU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AA980632
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709801044; cv=none; b=EGXfMNsQtMXK18mx38wHxI2ooc6/0g8dSrpGqTcQyHzl8g87wGVDdUsiDhXBSJbqQpgizWfwz6CsV2bEy5hJH71Vw4+kYBXB5d9MCsckmeuR/LOe1VYqKv7QnB1dbs9r5wZJDjFEoeOmzk4hes0FG1Duxxs+s2ECoPzQx+wD+5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709801044; c=relaxed/simple;
	bh=YFF7B3Kbzli8WiQ5Lr0TgBPF6E1q2iAHUHHzJEr04w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKHNCygdfXeBdcBD+eYX7RN/e7YTFIy7I48RaOJzpu5HMyCe8kTKTM6IM/6rlXHvoMhoSpAbeLjq7jPlx//IXpyCFCSexSAWs9gg5SufzuIMmnJ9VwDhYGgbXHM8SqZpSljR8V+hnLAP/xqkvl1uLW7WZ8IqVZ0PBX3KoMgT0uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nW5I1pcU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D977BC433C7;
	Thu,  7 Mar 2024 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709801044;
	bh=YFF7B3Kbzli8WiQ5Lr0TgBPF6E1q2iAHUHHzJEr04w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nW5I1pcU0EBuTTu4Y2schg0HJ+GHmEb64Bp3bBCGTonh2KPkM3VPoERJeqxcDPg3F
	 95+p9HA4WWBQM9piajCR0sUD63mT+NQDEyWpEzmikbJdPvu/UHPURcY0qPT2g8UQj0
	 gjtJ5sevWlkR2AtGHsOVn6v1o2BO9tWjOKErHgGzM3RzYBUieg+wq70ZxROarDJLxr
	 jSpd9nAHc8cSIAzn1ZcgG3XBrmmAX8DbqEsUzbdJM3d7I/4OQxqF3vCcqTf0VG0TNY
	 jJe5g87Xz8HUCPbpLktz1BZOVcyZuFEGODbzJoDE+PgBuVPLKjBI3dpEOGCaXKDlXh
	 41IykiZC5L/DQ==
Date: Thu, 7 Mar 2024 09:44:01 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] Documentation: i2c: Document that client auto-detection
 is a legacy mechanism
Message-ID: <Zel-UYTETJ2vJbB5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <d013d57f-bd75-4c79-b829-e19740fa3848@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pDAfzi3NLdDtZ1tV"
Content-Disposition: inline
In-Reply-To: <d013d57f-bd75-4c79-b829-e19740fa3848@gmail.com>


--pDAfzi3NLdDtZ1tV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 09:44:21PM +0100, Heiner Kallweit wrote:
> Class-based client auto-detection has been considered a legacy mechanism
> for 10 yrs now. See following change:
> 0c176170089c ("i2c: add deprecation warning for class based instantiation=
")
> Change the documentation of how to write an i2c client accordingly.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Fixed this checkpatch warning:

=3D=3D=3D
ERROR: Please use git commit description style 'commit <12+ chars of sha1> =
("<title line>")' - ie: 'commit 0c176170089c ("i2c: add deprecation warning=
 for class based instantiation")'
#3:=20
0c176170089c ("i2c: add deprecation warning for class based instantiation")
=3D=3D

and applied to for-next, thanks!


--pDAfzi3NLdDtZ1tV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXpflEACgkQFA3kzBSg
KbYp6w//bvo30iubvnRwSTsUGnfViKQodsThTZjUJ5uNB50YU43SAuQ4QU0ww/5j
hoWRXU3zEqmOqinKEtP9xMA3/D5OWFfIaoBv226ZlmSZxkDuRjW5mAdauXPNDR4c
OD9uBH3oD+hoGXLTV10L8XBqWXuQSVuovQM7ZdG2QJu91nKhE9YU35EIIPALn3dw
M449L7cCVZS1b5idXRe1qAwz53GiJ6XnR1TLahiMp+EHJIFMDtu7mm01KPEqhSIX
zcLJ/zymyKsD28REBmcifhFpmwWzXWrV5TZ7ImPVF11TW9gf3hMOAvviZwRVsqAi
utp2ZPV/wf9vH1Zv5fixQ1ormagchNgNb0TUBDA4oniyhfwWRkGTTT0iR3njHFer
b7jP00R6D+6z71cu7Zo9aNv0SUqXQZrz/6i4ghUeTTfVHR1EHmrdbShZKbd5Ktkn
DCTK5nFkF1lq/a08fLdefhOtt48n7H/CIO20yAoHGxfiOEUr9hFR2kTr4xUeO9v9
6K1cQL8kpeCxqDHzqnge+WnABXjZK3TdveUW/nhaZzgkYNXkh10pKWI71za6V89g
hSGsdJ+RiYaocDZL9C6MHCFD1VGl+hpQOujp6KDHOkbQVkWha2yQ4KBkMUO6L3HW
IHRpc0khoUIFboIXpwxgXLQdtrqRc7SQBt7Veu7APffXMBVMRxE=
=W5FQ
-----END PGP SIGNATURE-----

--pDAfzi3NLdDtZ1tV--

