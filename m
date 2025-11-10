Return-Path: <linux-i2c+bounces-14038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA6DC47E99
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 17:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961031887F87
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 16:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640E127BF93;
	Mon, 10 Nov 2025 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jQPWGKyM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC526ED5B
	for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762791754; cv=none; b=srwApsJrmGWlga8zRgScUu0E8L2mYB+pf1UIubieCyqiDe240J76vj25yxzUBXxODPEh/u8M+w76SH6iK+dn2MxqnJvIOMR9grK9QASs8icsQKjQIHi+uJaAp9sodlh40gOLxHDsnlGmFXCEygEtilITdaF1/NgSIFvx7UnHbNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762791754; c=relaxed/simple;
	bh=OOjTP2OrtUsSpIBfOSf6kI+JfqR039BAaADGSCeG8O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNE2KCN8l6UwmAt8l7kZBRIzq+0RCshVvZ+8IUbAVCH3awzfIyzYIsOokIKfnj9NmqZN7/0Q6JspPFLCitmIKaBOV2ka/jy1VzpWDcfsvPaZQJ/+E3fJXCUYMmf3ZzW7ijbKxNtlmNfivWkBh7EbtuyZDFJCa8+6DeS0UDSjofc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jQPWGKyM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OOjT
	P2OrtUsSpIBfOSf6kI+JfqR039BAaADGSCeG8O8=; b=jQPWGKyMN5lMrkbEpSfY
	ItNdmVY4PJF89aqEqiSrmNuP89n/u0nIe8Y5kTqdX3elEPXSagELcfDb6wg5Er49
	lHkO4aBIr5wj3KG70xxrg+L3AXgfzHC2m52ecLUfe8AabJsdiF4GqsuJOO092sR/
	8pLjiTC4rB4PH5+Ct1qM4gEmFwKPujyAqTSq6MFQviVGXFaL+W/ZVLqG54dQhNiq
	dRKdCw7zjaIQapoEXYjevmGmXMdDQwdmm8ittEPTiMfcQxX9RfHbLXwWRfuHBQks
	L1TgXBSCltxj8IAGvUhXrUZ7Gzo2b5t6kKyjyuvQLnowHsf0afpgs4qMv78Pz3K7
	ZA==
Received: (qmail 771340 invoked from network); 10 Nov 2025 17:15:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2025 17:15:44 +0100
X-UD-Smtp-Session: l3s3148p1@jMrm1z9DsIQgAQnoAGHgAP/+LxryKr+n
Date: Mon, 10 Nov 2025 17:15:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [RFC][i2c-tools] Accept device-node path as alternative to bus
 number
Message-ID: <aRIPsOOgs5jtxv9D@shikoro>
References: <DE53PTBTBBBY.24N093ZM03IKQ@sevenlab.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i4Cec8xaw1asKvpe"
Content-Disposition: inline
In-Reply-To: <DE53PTBTBBBY.24N093ZM03IKQ@sevenlab.de>


--i4Cec8xaw1asKvpe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 03:57:34PM +0100, Gero Schw=C3=A4ricke wrote:
> I'm working with multiple hotpluggable I2C adapters and have the
> following proposal:

=46rom my side, this all sounds reasonable. But we need Jean's opinion
here, too.


--i4Cec8xaw1asKvpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkSD6wACgkQFA3kzBSg
Kbb1RQ/+LDiEorKGsfWun0knyjeoVSsXdSjA5lHGvZVNQjgQQ3xcvL+fJ62Y/vie
ZZLn7/j8E8RDOdKEwgto2P4YXeFEF3EdpqDXfWw2qTetTulTe/iTqt86ByyPnufJ
nTgGZq8/2FGvOfVfF1XuTSPWBeJHBtURHhRR14UUTx81NufbR60/fZy69HeBV9Xf
/rKQb2Tk7DT/4+jB9FR0wu3WJI50Mm6ruUW7VXu2wV/SWTOtrllMXfueZRuiWUCt
EvOiY+OBZAnJ25C5oQ+M6grXbatzJatiEpc5jqTgh5uVfJ6menw/3HuNYVHhCdh3
xbPU3OaAluXhzWaGAZpEJ+u481BGiWp6YOpx8lxpPsqiO+IiE7KDtHc5JuZeKmrH
0buaopBou7C/aXtIK2aUC4B2+H2FIjODwtCInuZTt8RhSDYWNYCxi61TMtaWeOuT
Ucx9n/dtC3q+KmWaEF0bd+Od7o4l3WReDsDkqeeofNuQBIDR23RWWxmecgy4foj0
5dt0zqBITtSIbaHLFHCRIoZdTmrsu0nBIujkFfc0IK6NtkKv5lmfNDZIW7cJcm03
SSidLXMoxNeLp90hcM9SsI67tXzi1dYX0OPVxnCxmhy+k0W0GJ8cTAxz8fhOubx1
71Lq0EohwhwLu5HIwcmkB2EL/bwzjHir7zcYRkcHcy+sb1o/7II=
=RT0f
-----END PGP SIGNATURE-----

--i4Cec8xaw1asKvpe--

