Return-Path: <linux-i2c+bounces-11707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A50AEE1DB
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 17:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C97627A2916
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 15:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8409C28C03A;
	Mon, 30 Jun 2025 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRRH9WZM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF728C2D0;
	Mon, 30 Jun 2025 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295894; cv=none; b=SZqDdD4Vco2cInpeKK2dQRSWqmmYMSeb8lpcAyyjaaLd8odD1Q9mDqR3OdAJ9ybzcMe8PjiV3r4TP+w92tYsHZkSqG8T1tIa/+FpjFIHHdhPQ87MPGXLA2zqP0OQzfs7VTsoHTVC0FK2RVF2+FqqzlxmKQ8ZU6xnDwE6Hzrxf/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295894; c=relaxed/simple;
	bh=dmoVYvTI3+suazAoJzq27ljT7xSAxYdGrhj8BhZXzhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rn92UhRGIHxAasrPyzOX8Bk5Y20Dl7XVg4wnOXDVeAYcRNr5d24Hse5En5X9f9SArj8eKBPu7ZOKExlHAO5mNbJRahNeSJ5q5vxSbXAj0+jTyAg84NnupCYxQaibd11n4cN6+RA8fNncSC7XZZaJ+clntepfKBwh/B/vA1Yr//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRRH9WZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202AFC4CEE3;
	Mon, 30 Jun 2025 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751295893;
	bh=dmoVYvTI3+suazAoJzq27ljT7xSAxYdGrhj8BhZXzhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRRH9WZMZqUilBsRpDjeMtMNqXZ0LHhifC0TD6l5LuDwMakLrLuHgzJIZkYFPWLkC
	 hwK4o7Tb6qRqldG+zz7Jr/ckMv5CoNzGIT9eTuGjDHX8XsWdyhK3UzAmMYrAnU7UO1
	 peE7Y4ieGhAqW+Z2pdycmJKS7YPepFhmQ5DaSjhJhXnoviwtipvGQwuo1iVbfCxUAj
	 N40ISc5VfmNirwrZD44lB2K2NzxYY7ys9AafBNpijv2h/7fugfnottKR37ojbDHRx7
	 BR65DzOUWzD2pMcoPjhyFAX0c5bTnyt09EDqNxptWiI3Ck33ztZUrLm5l+xfq1XaNa
	 4R0G98O9HW5dQ==
Date: Mon, 30 Jun 2025 16:04:49 +0100
From: Conor Dooley <conor@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: linux-i2c@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: microchip-core: re-fix fake detections w/
 i2cdetect
Message-ID: <20250630-carnage-portly-8ac978efd2b9@spud>
References: <20250626-unusable-excess-da94ebc218e8@spud>
 <202506282209.FXWbPIPz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NC8mWXRcgp0oSWpd"
Content-Disposition: inline
In-Reply-To: <202506282209.FXWbPIPz-lkp@intel.com>


--NC8mWXRcgp0oSWpd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 10:28:45PM +0800, kernel test robot wrote:
> Hi Conor,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> [also build test WARNING on linus/master v6.16-rc3 next-20250627]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/i2c-m=
icrochip-core-re-fix-fake-detections-w-i2cdetect/20250627-001626
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.=
git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20250626-unusable-excess-da94ebc=
218e8%40spud
> patch subject: [PATCH v2] i2c: microchip-core: re-fix fake detections w/ =
i2cdetect
> config: riscv-randconfig-002-20250628 (https://download.01.org/0day-ci/ar=
chive/20250628/202506282209.FXWbPIPz-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf=
1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250628/202506282209.FXWbPIPz-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506282209.FXWbPIPz-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/i2c/busses/i2c-microchip-corei2c.c:510:6: warning: variable 'r=
et' is uninitialized when used here [-Wuninitialized]
>            if (ret < 0)
>                ^~~
>    drivers/i2c/busses/i2c-microchip-corei2c.c:438:9: note: initialize the=
 variable 'ret' to silence this warning
>            int ret;
>                   ^
>                    =3D 0
>    1 warning generated.

Oh damn it, I accidentally committed a version that I was using to
provoke the WARN while trying to understand why this was corrupting
the workqueue.
V3 incoming.

--NC8mWXRcgp0oSWpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGKnkQAKCRB4tDGHoIJi
0pc7AP0Y1GnupBJXRKJmeDyieIryx5crjwTM8DvEYXXxWecZ4wD/Y/34zvdE3lva
D/89ILB25nTD6c/WWh+D2eKcBd7wFws=
=IHf/
-----END PGP SIGNATURE-----

--NC8mWXRcgp0oSWpd--

