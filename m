Return-Path: <linux-i2c+bounces-10253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C92A84077
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 12:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B9633B09A3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 10:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D1140855;
	Thu, 10 Apr 2025 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="il0MjVZf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93409280A49
	for <linux-i2c@vger.kernel.org>; Thu, 10 Apr 2025 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280164; cv=none; b=alKpsTfH7mO/yowymI4KveMfGFSRAZwtqd72zLOqarvkH7TUX7JwpwnueajixYe70MMQA2efH5ljQnQDrFhyOANNYOgIpWzNerD85vlF92zXdas/jmtjvqPbQ8hWLmGtPRFfY5mapjlMHTFQW1P/gxAJczset+TLufE+2sbUfz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280164; c=relaxed/simple;
	bh=UOP7nn5Bvkb1xuqmR+wH5tW8BtJBPXYRK7Rb4gkU9YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hH4gkn4rJDLdIIgNI2oxSpxIJJPERvKCanKbsXd2PzgGhoocONUN4QjsyZ0RlHZtTT3qYQsmWTiIe9r5T6oSwtSb1R3l4G2CwSDki5YL0PO6Oe+sVEdE7s8rybbU/RdhV0CT8iRSelo9+s7JUuahHzeukzZoyD/xBYIgJM8zdqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=il0MjVZf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UOP7
	nn5Bvkb1xuqmR+wH5tW8BtJBPXYRK7Rb4gkU9YE=; b=il0MjVZfBDRZbpGI8xmH
	BLL6mvPDRca1jjXnjKe76ofx09QOM9s1sauM0Hnqz7Zn2EmyeRGR6m8cn0o+4DK/
	nbkppE5VuGfgw4x9BZ2QaMjTXMLIbah1fnQ8B9cTw3OHBYvKDjit055EzBC2itER
	N7udd6VSPrAwJ3s4tjKY5zdJxBFxYdahcn7fAZRlbc9U3Zzp0CdUWFBsp9ePBEEc
	wxZNm4VHddXYvdKYhGKhp34xjjaoJjlraoTlOkfvzJF1r14KDjWRIzKeGw8ABTNQ
	3Y7CxQzYNkYDhqc/G2bR16VdHJCghmSCBWPCxJtpPwPHcjJzLSjtjps3BNAK38P8
	Jw==
Received: (qmail 850729 invoked from network); 10 Apr 2025 12:15:58 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 12:15:58 +0200
X-UD-Smtp-Session: l3s3148p1@p1M932kyNLAgAwDPXyfYALbiJ46yNPq3
Date: Thu, 10 Apr 2025 12:15:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [RFC] Handle targets with different speed by the same I2C master
Message-ID: <Z_eaXhYqYaB7RSeI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <AS2PR09MB629642F8FF0F7CD6F3498E8C94B52@AS2PR09MB6296.eurprd09.prod.outlook.com>
 <Z_UOLq4OZsrliH5T@ninjato>
 <AS2PR09MB62965C94F5AD1F72FCAD281894B42@AS2PR09MB6296.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dXTP4yqwJYawQ6JB"
Content-Disposition: inline
In-Reply-To: <AS2PR09MB62965C94F5AD1F72FCAD281894B42@AS2PR09MB6296.eurprd09.prod.outlook.com>


--dXTP4yqwJYawQ6JB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> In my case it is bus powered by 1.8V VCC with lots of FM+ targets and this EEPROM:
> https://www.onsemi.com/download/data-sheet/pdf/nv24m01muw-d.pdf
> This EEPROM supports 1MHz at VCC >= 2.5v and 400 KHz at VCC >= 1.8v.
> Our experiments confirm it can stay silent when bus is clocked at 1MHz

Okay, I get the picture, thanks. Still, this is a corner case which is
furthermore based only on experiments, not on specifications. This is
way too vague to have this added to a generic OS. For most people, it
won't work. And this will add some complexity to the code base which I
don't want to maintain. Because the underlying principle is unreliable
itself.

Sorry that the HW design is flawed on your device. If you can still
influence the process, you could get the EERPOM replaced. If you still
want your software solution in your device (I don't recommend it), you
have to carry it out-of-tree, I am afraid.


--dXTP4yqwJYawQ6JB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf3mloACgkQFA3kzBSg
KbbPgQ/+KgY7bsVzVn6ITbexfc3V8WMrPcwc4jDKRv6d1LrszFSFvfubEXsSnvFL
m7TqVSJyYtaFsncF2WLZIov57bFdugbC7QnUmOInS19vdEqhUhPdvnHDs+r1fKtY
CawQ8v0bZORao/EOqaMmnSyva6ejqzl39BNcPqA5jFtOcK0klYwROiWjI1s5G1Re
IyqFJXnR/zKuRhESG8BJyf9pjhhxEXi60Y2njOkrn+0s2R/2M2oP/NFPhD614Gft
glFi5ZMFESg2biZizrKlhV83+5mSTN2U6b7wX1xE0n47g/f2j8CVAlOtOi94FXau
wImM6R0iXhvBLzcmex1Zc+gC+0tcgQULflbU8jKxA2bEjgwFN8lZSlqZE1poNF0q
KPTSEkCenz4KNof/ob92Z1SzwxeWycbdkugFg57+0JYbgdX22KdhBIyTjfuPVBAI
iPflYJp2Wobzhe9UHZf5+b0osfSlssk4UyfQc+7czNp7GKwDhO8Hp3zh59+9cD+0
L7f9tCUJ5MD/rqnuZ+bfKT1ZqwoNzTXnm3DIlh9v1MyJToZnp6l13Wx4J0c8UcGb
DNUZRYCXZ82BTuHEecYA35d0RRT+xD6OcrQJEuKqEjS0AMrIBkN1nA4XD6Ht87dU
dBR4Fn/FC8aAXion1DDl141VuaESi4JVOMOAXMYDqZVlEEkopZw=
=6VBN
-----END PGP SIGNATURE-----

--dXTP4yqwJYawQ6JB--

