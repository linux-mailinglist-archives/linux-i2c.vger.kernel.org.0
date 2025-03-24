Return-Path: <linux-i2c+bounces-9996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A74A6E342
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 408761893E09
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 19:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E393119AD70;
	Mon, 24 Mar 2025 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eaRDCsZY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786401990AF
	for <linux-i2c@vger.kernel.org>; Mon, 24 Mar 2025 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742843977; cv=none; b=c6gu3H9p1txQBNOyYm48n7zxAWwUH0+Js78OGp9om884g7LOxDaxcQxznEh6/roShPsWd1XayTapmTCrmRgVkeyCbxmNFDutUnPGNbWcaRTIRJ6crXHljVCjLBN9zgNr80FgKIApHjqE20VgOLgUGZNUCCa6CoH8AY7fDpPIpo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742843977; c=relaxed/simple;
	bh=P/hwBBn+ky1Zya+g5OHKD1ly/i5ipwUmNOgXdV7PMjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kr2rb2umVSPikvpWSv9XuwD1SU/Mxjq9O9Nx1KVduXWNo6KPaFidj3l/pHGMAXFnmeFTPdfJqqVBTr5TCUPClZxYkQSnmnJTwynGfyn4sHlHbkolqILcOoBU+tD8/gPBJKDFZUFwkvbu7YYL81Fv7KAQUDfuQeFwaU3NJXl+JnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eaRDCsZY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R9G+
	9YMCrVAXcN/A7C/bnMd2N4uDf2n66715z7MwFmw=; b=eaRDCsZYKRjAOXENBFxD
	NUusBd6dFIL3ifBFA03P08hKISn6A9QsJRRvbuQNOU0oJl+/YXquxnokwvGh2CJE
	sOu3xT/5XDTIBL0Y367UgEDsSiBKjAP1yoiQzIoFcXgEP228pEQEhvQXQJ0mHJw9
	T93En2Cxp/qcceaHSzTk916pvva4ydL1Y9FybICqPe5JTCzPIxi9tYNwCibAd7j0
	lbtrdNyts/7aDGip5RWvWRL9KFXjQe/BKVD0y5N4WQeQ6pHrwAHECnrg+8zHqATE
	aBPvLQSirazxWy7oe1ro2eQGIkZv9Ezm5reeDQfITAiJrfKT2/cUwY2e6r8ubkEh
	iA==
Received: (qmail 2701050 invoked from network); 24 Mar 2025 20:19:32 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2025 20:19:32 +0100
X-UD-Smtp-Session: l3s3148p1@u5LfexsxQF1tKPAv
Date: Mon, 24 Mar 2025 20:19:32 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
Message-ID: <Z-GwRNe8NIigXYtS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
References: <67e1a1f5.050a0220.a7ebc.0029.GAE@google.com>
 <acfa19a7-9d24-4cd6-9d1d-580a9ac7473c@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D3w7yJPKb+YSZTp1"
Content-Disposition: inline
In-Reply-To: <acfa19a7-9d24-4cd6-9d1d-580a9ac7473c@rowland.harvard.edu>


--D3w7yJPKb+YSZTp1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> As far as I can tell from the source code, the dib0700 simply isn't able=
=20
> to handle 0-length reads.  Should the dib0700_ctrl_rd() routine be=20
> changed simply to return 0 in such cases?

The adapter (I assume the one in dvb-usb-i2c.c) should populate an
i2c_adapter_quirks struct with I2C_AQ_NO_ZERO_LEN and then the core will
bail out for you.


--D3w7yJPKb+YSZTp1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfhsEAACgkQFA3kzBSg
KbZviRAAgwc9tdRFJkCUrclcfUuNms0E4rHrMGo76Al74WtC9ycZe4+exceZP1F2
mtb2SM6PGPKsYkx0vsOej7tUW6uNBeVNFH/3xIhjJTXq4n5JFRaw9kB3DU93qaMt
Zi57qC2fsJtKW7Zbu3AWtN9cyWf4qw7ihjOH+bGYl9244oUSpbqaum/GlErPkPdq
S6k4mKtAsNvN+KvSB8m7HqdGknO8Ma6UJBIr2T+/X8ywKa+Dp7RgHcPYAT41eYWP
aDxwJvIlKKK7JsIz+/f8knqRbTND15tcPfgTEeL6EFUp86u9ppa0UM9eYS4VC7AC
kvwq9qwmHCOVfye+nc4iO6mQRjIW/V1MWqiQvLXH3V/aig8DC12mSLA/JnWcJ+n8
6KVPfVEymOKXn0W+GiKRnlFuxdd6SkKN6K3G5nssV9Jmbn891T6LX3QPeIfUqGyf
avDqHKpBfv59HacrKdsxzd6IYx773UqUELkTanFfcIfn9BSQa1DwUxdvDaI5YPze
+IB0JiW7vFERAv/qje38LKI5iFAzidSHbam4k5GH8Q+nkXG6wv+fDLJSQvm7TFiY
1YLwn0KmiAJKLeEJTgUOnc61E2I5Dc0yUZVRpeMLrR85v8zNLvy8IMU8E85utgyu
YogWdIhRXHdKZR4Ql7STBE7gwHcPoCQf2v5jL88vzKRMRWB2u3w=
=Ixnu
-----END PGP SIGNATURE-----

--D3w7yJPKb+YSZTp1--

