Return-Path: <linux-i2c+bounces-8777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C23859FD846
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 00:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62EB51883FA4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 23:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DC1158DC6;
	Fri, 27 Dec 2024 23:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bY0BWLKt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C17155352
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 23:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735342067; cv=none; b=kj577Wr/w1iYm/f5PSKMm72pA7OWr5HAC6GL0a3MaGV/MtCnMHs2illj//1hNWbX3mNwG5Qkkodz489q0VGhgvHKoh7Tok9T5gk6DS6CToere96GGa0g9F7CL2yGbWQceKkzrD3642RE/QU/6MLmz+sxm6P2Sv3fRkAdRyDnUU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735342067; c=relaxed/simple;
	bh=l1bt3gioY/SRJvkgdIR9/UbyqKiq3EZKPnl7Mh2rx38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUWLDxN0uuSeyYZ0t9p/HPP9kfohWFnoxR0IDm6XocThpr/7kVOdefNQyfLPPHk5SO6VO5T9makdJg2yEO5b/Bt132k4esNQFOER7/vwjYPCkGpGj3dF6Ziu/Iv7fc0vXbQrwo+ZQ/QxOmMl/xkyl08DIbTKCEU5iIrwk6LAJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bY0BWLKt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=l1bt
	3gioY/SRJvkgdIR9/UbyqKiq3EZKPnl7Mh2rx38=; b=bY0BWLKt8EhTZ5Cl2MDo
	lhuT5kYrAsdVB7EuQ0pSBiPffdqXlFNoRO4QE5PdicIBNDDScTPDJlV1uAfFqg/T
	upCN+9HufmlOzRaA3pXZOaX8aLwEt/4UFRmodPojLN3vOiSuPvNCwvKh5DQZHMaf
	2b4Z5vlwMoelQXF0UhrKY49negj8yLk6yNqJR1s4F4QZuDQYAJEcuwmJN+1GdB8Q
	41KIP+xPpGpZ2FjxaZwlJMsdscizwZe3PfLhudpiFzmDoUeR6LhxjU8ThWrW576D
	NmUY1c3jKHFmeypUj0MRVT8kyrAJpQve1++vbxf455lwMohgJj7g4ObDt0F9NBp9
	AQ==
Received: (qmail 3281739 invoked from network); 28 Dec 2024 00:27:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2024 00:27:39 +0100
X-UD-Smtp-Session: l3s3148p1@DegHz0gqqNgujnsY
Date: Sat, 28 Dec 2024 00:27:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.13-r5
Message-ID: <Z28360kVxXxkiPyw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <fznmpnkmgyh37tcpmjnvccjl5bc5sjpzspfwvyxv5k4hq57zze@ng233ic3mfye>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="685GEHycCtB1PTF8"
Content-Disposition: inline
In-Reply-To: <fznmpnkmgyh37tcpmjnvccjl5bc5sjpzspfwvyxv5k4hq57zze@ng233ic3mfye>


--685GEHycCtB1PTF8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Attached is the pull request for rc5. I have also included two
> patches from Conor for the Microchip driver. These have been
> waiting for way too long, and I decided to include them since I
> don't have anything against them.

Thanks, pulled!

> Lastly, I think this will be the final pull request of 2024 and,
> since I have the privilege of being the maintainer of this
> community, I want to take this chance to send my best wishes to
> everyone here for an amazing end to 2024 and a great start to
> 2025.

Fully seconded. All the best to you all!


--685GEHycCtB1PTF8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdvN+YACgkQFA3kzBSg
KbYs9w//ZOfteoeq4RoLKEHYGFUk1xaiiyatUFbENrFfNX1sTcRWHqJ+mBRpuUCu
LDWHZ6KvmfcEbPrzi/T34pw9RzoxCTqvmjYVwtgGzFRgFBKP8VNgh7UAvTDgWQyO
nxgubtcMHypqrObru3LzF5pydg43Ax4PeoubhvFCbzv/rluZU7tFdqmGZAI/WFlZ
YGRaGYvMWaj+8RQB783bDEgQ/PVX+03dqldyAdikg6FtoTgoUvHXVEvUNMYtk6N3
m1YNTezYOECcfTJfEDaAqf0YZo8yFoBz01DSVCywybdvkDfR1xKRh+gp7zGWfgus
71KkBLqKz9tl1kzD0cJIZEjFT0PG4++eVm7ppGR23fnLCgBO5FOlDMbRrp0kOtYs
rzZBda+SK2GFgExnmOHjM5bZLeAM/C5azBVEcIG1cFnj5VqSWplHG586uSPeHasm
/S/4MMPrnZHba6nEMX7koe5n4DlDF5HuzLPVEMywrsdJxyJL6b0G4ZWI+h3x2tq/
oKoNaZLLwD+8E639EL1bT/L/nVCwrc4oWbDOQ6unydi91xmHIlCpLZ5Dld9f5OIS
5u55HrIQ7HkXIwmo1RRoOXILbREkOaDUUD2yCb/vrDbKoAx3xYFs09JtzA3O5fiS
FsYfF4zGo5hTVmu2GHl3c4bSBO7zUr6HX79eOjx42X6Q1Jwk+bQ=
=WYeT
-----END PGP SIGNATURE-----

--685GEHycCtB1PTF8--

