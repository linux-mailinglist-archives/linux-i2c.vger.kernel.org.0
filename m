Return-Path: <linux-i2c+bounces-3201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FADE8B3114
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 09:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1C8F1C2238D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 07:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C45113B295;
	Fri, 26 Apr 2024 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SDDMwoVU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3DB13A898
	for <linux-i2c@vger.kernel.org>; Fri, 26 Apr 2024 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714115430; cv=none; b=NJliq20Ixi1ooqVXMHg/yTQZJAo3uKDrsqhORYMfBLh1wvck9jw/k/oQSMAoNB8jgQOskDEfIOcTSjPsEMmZUqm63+NX5KR4vMuTRvFb9lN/V38qiG9ia8zf+7mntJFiI6ZwaOi4qitjF3KOj7gJzUPHqZxjKi352MN0rgBS2Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714115430; c=relaxed/simple;
	bh=F4nJnCeMeJbzdSAttCiiXn5l5cLsIKYVH7U5G5ZIats=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdZtsuAKi1041wwtB+albbI9D0e/ny8B6TZI7oAdG5bG8aUpYl9LCvzYEM18eJJFjEnl3OD9lxD5AmVl562kS0LVsY829IQt3Noib0GRVpv4YmPe4zlpkZNmiRE6tDk+cFNQTYfUYW4sOFvTHJiz+LE3c3UFON4FSyUXduT0sX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SDDMwoVU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cYhv
	w8wPCJiy34fg1AjO1KQ4LfdL7d8RjCi2kla6Za4=; b=SDDMwoVUwhRgHOSt/l9b
	Icnchdha5Yk8t27jh2saXGUzV1XtRCt5+aSqIRDbdWuRUmkfcxYjajHyOamJZidH
	YE+Y71vCQ96ETaKpTM8u0L6mxCzGuUNtbPDsLC0HRkM6TOOfgl69JIDWhPao3K2A
	jchqs9jdwtu3v6+ue38c7toQIcQHuvKhPIbe1GjVEb0mToLyXxHjk1xHkCoyA9/9
	odkqHKhjUCEtRqZxW4IjFZ91ttM7uFp7nurRT8Obgi2xxbB+lfb2zAZNj/IZcKEt
	kAJ+bZ86qvangzDE+4aloGOS5fjEBVxta1PxNP1xOaxMOly1hw7e9C4KF9liazsq
	yA==
Received: (qmail 1213087 invoked from network); 26 Apr 2024 09:10:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Apr 2024 09:10:23 +0200
X-UD-Smtp-Session: l3s3148p1@WfbgmPoWvpUujnvp
Date: Fri, 26 Apr 2024 09:10:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jean Delvare <jdelvare@suse.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: Add (LP)DDR5 types to `i2c_register_spd()`
Message-ID: <20240426071022.lqapnn6uzcypezrp@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240327083356.74246-1-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qexz6bcsbtp276vt"
Content-Disposition: inline
In-Reply-To: <20240327083356.74246-1-pmenzel@molgen.mpg.de>


--qexz6bcsbtp276vt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

(adding Jean)

On Wed, Mar 27, 2024 at 09:33:55AM +0100, Paul Menzel wrote:
> On several systems Linux logs:
>=20
>      i2c i2c-0: Memory type 0x22 not supported yet, not instantiating SPD
>=20
> 1.  Supermicro Super Server/X13SAE, BIOS 2.0 10/17/2022
> 2.  Dell Inc. Precision 3660/0PRR48, BIOS 2.9.3 11/22/2023
> 3.  Dell Inc. OptiPlex SFF Plus 7010/0YGWFV, BIOS 1.7.1 08/11/2023
> 4.  Run `git grep 'emory type.*supported yet, not instantiating SPD'` in
>     the repository of dmesg reports for various computers collected by
>     Linux users at https://linux-hardware.org. [1]
>=20
> Add 0x22 and 0x23 for DDR5 according to section 7.18.2 (Memory Device =E2=
=80=94
> Type), table 78 in *System Management BIOS (SMBIOS) Reference
> Specification*, version 3.6.0 [2].
>=20
> I use the same name as for DDR4 out of ignorance.

So, you didn't test it on DDR5 on your own? I'd like to have it tested.
The document you referenced does only mention I2C but the wikipedia
article [3]  mentions I3C. It will probably support I2C fallback, but
I'd like to be sure.

[3] https://en.wikipedia.org/wiki/Serial_presence_detect

> [1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134=
_3.6.0.pdf
> [2]: https://github.com/linuxhw/Dmesg

[1] and [2] are mixed up.

Thanks for the patch!

   Wolfram


--qexz6bcsbtp276vt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYrU14ACgkQFA3kzBSg
KbaQHxAAlcfN1CJgz+8hKLyiImddE3Qz5/cJhvjTdggh/B8Hp/onVlgseclViPVA
/t7aXXnbHMwjomUu9i0L+/Di73LLT+Ms7Kzc66QB/HC6wGPALYjpsOuAkD8bvbJq
Xzt4FuJ3hNznz8FOLo/iEvV7UCFsy0rppsfj0plxOl+xzuGh152SAR3NSieAoPdV
NXjEfYRobiFrC6gy+sG/GfqfRnXNeK+SJiUiB3jBWUSydTPD6pOCsOl9YNHqFISY
5xY920E/3tQBKShRR8x9AM65AtV43Lvr6pn63ifS3K74zkFeclFAoetb6slP+smV
//matVFSFTqJstQah1t1VlupzdkCRr6pJrdcZQPlJr5J1ZDhLtPN+ESU9lfhOeU1
HYzQ3S3FpuMrN9zq47ud2xm1+60BPEw7cPubMVSp4W8Uyo8x4ogmeUTVdI2AAEPd
sZfkHAIIU1inmLS9lVwckhE3k2I6YkwXd1UU5rZx64q+JcLluGU/fjVyYHAFrvfH
LeEg4wDRg7vlWR3uPE20Z8Ayc9cEsU4bpjAeMJMPvXa/n5GrqkVFQ/bxURCiBaQO
hkCY7YWB9ZYQiwANhiqiihc4mTBMEEjqZUqgjAZclTlXYeTn8nq8jvI4NiAISy9d
EcMQ5r/Qtois3AwJQUG8QAGh3jfpWmV40oWxaomfdwe8SlRpMog=
=C3Jd
-----END PGP SIGNATURE-----

--qexz6bcsbtp276vt--

