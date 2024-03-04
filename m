Return-Path: <linux-i2c+bounces-2137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB49386FDE7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C70452839ED
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630E51B819;
	Mon,  4 Mar 2024 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxKQHh55"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2492A18EC3
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545576; cv=none; b=aZ8VKsvZ+Unx/jESb3NI2ZVt6I3SRESamvnTBhqTXJNCwDGbfaSaaTM+pO735KRvd+0k9NxbbTOpcOi17Fib0MwqxjcQqKkjpVHj5c/wdxr8qw61dbXxelqb5wdXpEzbFttvmbbuyQiFyMMOtMEtoETTAEHZSlfoHtzNXLYkgGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545576; c=relaxed/simple;
	bh=vkNPXhSTEOjCzGirZAQCOMPJLkI7j10aTQU6XfNoKDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgL2+91kMQxqfrkuNhKG8DkZr3bsosyVx2UKX/d5BzJtNzU8aIJQG276muvBQoOUPhcAlCpegCXjYxgkkseQlWEcDBXyypEDMP8HZE646HekGlQT/Pn/Dn/ZoMa9w+gG5+xulmcDhqFqIMxTYKpkuo2/b5IXOA8ubABct8HloxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxKQHh55; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F3EC433F1;
	Mon,  4 Mar 2024 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709545575;
	bh=vkNPXhSTEOjCzGirZAQCOMPJLkI7j10aTQU6XfNoKDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IxKQHh55G6eO9fK1jmzVJ4S9iuyZMDR2itlSlMKD+UfGS+yzWkBCBuLMldE8gP+v3
	 g/pB1hIsIlGXrGWeevZfhyfYvTCDENMQ3h26kmhxFajbcG9U2Q/7cUYFV5YSDH1CZD
	 5j5CSen6cpP1WyHrQsEBMv5bz09rlBxMcKjNMKYbqHYtOj1FQJdjzPlNOPR+nzEFwt
	 Mdb1cprgxI8ZRKZbnXo1VWVNgl/DRpbM83ukXD6fa3SkWi9NLjkV/WdvUwoMzjMVnF
	 2p34NDR4PWLgcgH7n3tGc88FbXVaQvFfgZK/4qpUrHHj8p35zoqfKYqv2OLjIXy3L/
	 lfyhaqIhaVs1w==
Date: Mon, 4 Mar 2024 10:46:12 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
	hanshu@zhaoxin.com
Subject: Re: [PATCH v8 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Message-ID: <ZeWYZImtMwTSZ-7p@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com, hanshu@zhaoxin.com
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <b0e3571e961f0725a4be064942fe0c6dc24b519d.1709014237.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQZS3HC4XyA6pWwF"
Content-Disposition: inline
In-Reply-To: <b0e3571e961f0725a4be064942fe0c6dc24b519d.1709014237.git.hanshu-oc@zhaoxin.com>


--qQZS3HC4XyA6pWwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 02:36:32PM +0800, Hans Hu wrote:
> Enumeration variables are added to differentiate
> between different platforms.
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Just glimpsed it, looks OK:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--qQZS3HC4XyA6pWwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlmGQACgkQFA3kzBSg
KbZ6jw/+NocM8zaiEOBbb+YHMOumtApV4HxDftv4zhkgtmU2udCzLuCL+l4/cF24
bRAHzlfhtB8fc0GKQzh274Lb59kr+U/7vH53OIWx9KeNbY/e8Gg6f31qSSQCsRNA
QcIpt7caEoCu8r+vVnii0iXD8Ijm2LQseNZ1KbayPat0MgYoSV7kp//rFMqLYZXF
lEEP+Tq8spXxMVL6f9fXN7Ou1HLjHmRgYa69mbqiV5WwAFRiAiZvIV67GIBF9JbO
efKIw3e48kRC73CMyOSyTqX5nncbHyX7JbbLGd1K7VLfIwzgGrg1A+t6LZ8MQdDU
/NyYLSaT9b+FY8D3NBgcWxz09oX8ahHfnO7SaJo0GK7MIeis1ArCxWGoQmu6HYVs
YQ40szn+KEcVI1uFxkJ0z54oJteGgk2Ppn1HErnksxq12ooigNCEOWXKWyM5+XIc
JrEE50jJjnT1xV2HRhI22blnLQv5zgYDTSQFZPC9FErtwqCXlPv+9XCekv5riGxg
M4IseFE7vdBQb1hxXs3MSNAx/f9dxslSCs6y68+OcW1kHAZiQdyCTH29Dx0tdLxn
v/Oj2RwFNYHGLdPRKUvUNoLqeLaLotavJ8r+yxDqQANDvv9IzS1YgnQBKU6YuW6W
pLjHVVra/JxvVpF/4hINGROWEQ7H/iH1f+YvfXQAMBWi3IX/Mo8=
=8Mr8
-----END PGP SIGNATURE-----

--qQZS3HC4XyA6pWwF--

