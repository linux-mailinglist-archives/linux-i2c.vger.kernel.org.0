Return-Path: <linux-i2c+bounces-8896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA50A00957
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 13:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8E163A3E00
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324EC1F8F10;
	Fri,  3 Jan 2025 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DmmHBGhS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358CF13AD0
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907936; cv=none; b=Z44raY8Y2ScYhGxSB5dFyRttgK07197MaN74bQ3DsyjFMncLomP3zDaEnQQTjqxQQYRFnXLweYfz8HpkCVbpAFvfEMzy+LZf40OH36sgZVX7SIY5oZWSdBkcCSkQrI1m/bloH7gWL729zhDh5d7SeStcBPXUc9Ewv0Ym+j1rxxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907936; c=relaxed/simple;
	bh=4JBEV0jTaiXPB1NfF9cvsEnt2Wd2NnsfqTWYyS7tU2I=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzeORUFgSBBtTpQf02pYp72J1GIt3Xf8KrTwwPqUiBj06mnERUJAgvVKREgs2RxnSZB9YaqMoc8zT5MxyoJFYLTlrqPc0mxF+J1Z+9hsDEehFtBJY6cluq3BFK5Nxx3pLHM7K8lfxyWbBlDA0kYrFctO5eBgIh2iWEUDLIkt7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DmmHBGhS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4JBE
	V0jTaiXPB1NfF9cvsEnt2Wd2NnsfqTWYyS7tU2I=; b=DmmHBGhSywDZcycVO17+
	P0GWep56yEm/yD9bltyUgEq+0CqU02XVUfQ1JbemKDWrYQ/NWpELwhyHc9Jb81Rl
	YFvDzH/+A+lUDrcOJMdMxIl3G6je7+svFMIxVf5809t8sfkjh4Ueo3BXlgQVlU8I
	5WeFqlUqlu0Va4/WboJbG7f4Jfztm+dWidCyhaWDfrCKnMd2hZaxxoOrraslB1t5
	QTfsv6nJFeAVoiOiA5BmWGRMoOxf4cAiXKr9rLQwGfnYtyPIQaCK5FpCqc6G/m35
	H1MCg/CxR38ytIxq0I4Uj3953b/4HL7rIWGb5PE8y2Q7ZouRpx0csHv2nFSS5cmz
	2w==
Received: (qmail 901559 invoked from network); 3 Jan 2025 13:38:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 13:38:52 +0100
X-UD-Smtp-Session: l3s3148p1@zmWnj8wq/JQgAwDPXw20AOMQ2KO98fSH
Date: Fri, 3 Jan 2025 13:38:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 0/4] i2c: Replace lists of special clients with
 flagging of such clients
Message-ID: <Z3faXNybCFNNHhfe@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
 <Z0NKtrqtJA-vo17k@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IncnI9KVZ9OCRmYF"
Content-Disposition: inline
In-Reply-To: <Z0NKtrqtJA-vo17k@ninjato>


--IncnI9KVZ9OCRmYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sorry for not having the time to review it in time for 6.13. As we found
> with the last version, this really needs in-depth thinking. We will try
> again for 6.14.

So, I reviewed the code two more times and added hacks to test
auto-detected devices. I think we can let it out now into -next for
further testing.

Thanks for your patience and the continued work here! I really like how
this simplifies the I2C core. Let's hope we did not overlook something.


--IncnI9KVZ9OCRmYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd32lsACgkQFA3kzBSg
KbYHVQ/+PCSURI2lDdIe/WH/eDYrRHp0CZwn1mMWIxd0VoDD2W2mi0PLoWXaEGy/
7VpGswRY0T+ERylD17ulffX39sp+Zk+wh9a6iR1V1icseZjvND13tarLUKag3oFe
6nDBYAImPZejwrjoc2nsLCBYLUWb8MEpKE3fCE9nYH1V5ImnOIPk+XTIMALMQiD6
Qi2L7iHV56BeUAhP9tjNXNcv4zOUaTOH/rcDqOFsz7zx6CO86tVLKDqC6PMxAaVg
CL90H2/vO+8sQChSTZqTKcYjnLcGo8BRR+bQbvf5moNxn1zCSp4UGIU8i5RwbogM
3t086E+s3Y1De64RVQ4MNs8jh+gO/RPG0EjttCpCXj4N0bhTtxQR8yagBCqoIhwF
MBFgzLSpR03lEbvrAOcTKvtr7QySmVbI1Pvdmb1g0h/V9T1TwSzBYVLxnYa7Xih4
i8onVSx4/65n3QRQg4szxBQwbbASgKMBnF5PgFgiznQ8vYZ7ShV03q52WApqd9nF
WSvYtO2kuaS9A1JeDTV9ptgifx+I842rwVtSK+9ukmdRgOknhyWoxdj5kBk0JHuA
0fSFDsa4pSaRizZRcNDLR3klQVEQwRhBZ5GtQ+ZYLgD/qTkPpXMAsA/s5CpxQgn0
q0YgyLFljPC1ppxbd9fvRjlJiK891oSPQeSRacGeu6D7Mhc1i/A=
=MSto
-----END PGP SIGNATURE-----

--IncnI9KVZ9OCRmYF--

