Return-Path: <linux-i2c+bounces-2185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4762870BF1
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 21:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2254A1C21D54
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 20:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC2A10965;
	Mon,  4 Mar 2024 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7ur/Atm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C8F101FA;
	Mon,  4 Mar 2024 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585807; cv=none; b=Itc3jJVvaPKH/7bjuAH8gXBHIGyNblnTRIw1+9PWCdELSzVeEFgjEakWwjADwCyZ3AX/9kQcjbwUeqTff9wlck7NAF/ltoe6vk1TwG3Xd3ZWdWmpjkwqFy8KXzUXZCbNK9kONG8EdPlsUesRjkigY5RwDa8WM1PTh4XXXG9lLWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585807; c=relaxed/simple;
	bh=PGm7I2xBC8apFwuKMKOhBF/0kgBpWxKJP5GaEquNHBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0Nb0DHLb0w1CfHjigyhCZWC8HesO9TmEyRhrA5q++YDeCZfoQ8ERUBDoWUZTYHcf3NMzRk6Vnz21GBBTnREA7UoayA31KQTIwngPydUn76WeIRWdSjWdynjv/g94SiBNj9sepVL/8rIKLKSiYfd2ZIkFYvcxnpXLzah9CzgWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7ur/Atm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3ACC433C7;
	Mon,  4 Mar 2024 20:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709585807;
	bh=PGm7I2xBC8apFwuKMKOhBF/0kgBpWxKJP5GaEquNHBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7ur/Atm+F0BRx2XjbW/RLO681jkixxNDlhtmnW7AaqfZK5wOt2MFIoSLzPfIvTrZ
	 Zi+nwZHsw3Bcbh+Es7vhBqmOGVB4apczXij+ftNj6iUdqhxQ4MHDeKR5HuQdWZ8KSj
	 KxBU3C08oPCt1+UeaFrru0GO2FL3YnxlGHRBY3Oe18D8eS9ANJ1b0LMJ0Z2as/AyS5
	 NF514VkFKLg9TMBJ2WS63FZ83dOisQ029009jUSYccwpubO86aWLatNTLgqxsmlRdP
	 jAqVWw/BQx/Gr2CRvhmXq9PEUey6KArf0gc9eRC3gDG7KsVrXvwUQdgn66nzNP5HX7
	 EVrWQeLBkZNHA==
Date: Mon, 4 Mar 2024 21:56:43 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	"brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Message-ID: <ZeY1i9_liCIjqNYL@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Tommy Huang <tommy_huang@aspeedtech.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	"brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
 <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
 <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>
 <v4nawwb4rwjiy2g7xv2sfyhc545mhk4izb3g22f7jupcevjuzb@nxmqgf2zjyqs>
 <TYZPR06MB61912715EE2869DDB7C3763DE1552@TYZPR06MB6191.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="avejMe9/B1mBt2nB"
Content-Disposition: inline
In-Reply-To: <TYZPR06MB61912715EE2869DDB7C3763DE1552@TYZPR06MB6191.apcprd06.prod.outlook.com>


--avejMe9/B1mBt2nB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> 	Sure~
> 	Below is my re-word commit and fixes tag.

Please resend the patch with the reworded commit and the fixes tag
added.


--avejMe9/B1mBt2nB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXmNYsACgkQFA3kzBSg
Kbbq4Q//W482FjqPLlxS98dtd5kekeRzwCXdh6wotwierJKOu6De5uec93delN3u
JurwdgVTBV6vASmQSt5Ljl+JsKvRGL44fBLWeItzhTKgnEcUfF5rETgNTXbtiN0U
uMhIcys10oiWK+68nzbycbiIdxU3hdP14TsDn2JI6h4QSqA8H6zJa6u2Cwff19AP
eglXzL0/XxyyUL4wxjSk7Mq7KPql02xZq+S1zw50kaMTiNA28iXOh7zv7MXXMbe9
TK/f5iXsijAhjt3MhkBIvQM9O+0Q3NcDS5P0ByVte3QDv34mHkdS7srfmkrN4d9M
7mHlg0Nqbbst9sRHJXzfqyXrkEciOtIVPw1/03/wYDY4A6r0RxTQwFhXdkT1OgYo
q+ejx44+jXLdAQ/t5qmlG28FNSybIyzSIqE5J85jWnMXdqcv2ulBC7oJJPk/hy/L
IxDwUhgUvVySHyP2gx6M4GBrcGAIQcNedmoGQr5ymo4Kw7zJHru1fnG2cuBMEasv
YeSWQOd6TKoPgmTtA/66i09gem/vzJbyK08JWElhqQZjowmiRwLoztZtTdQ9t4PJ
J1KJkt8EwBPdD43kmPpm5khvU53z6zc0pHZ5T/x36++E5neY/S1O4R/HVKl2VTkM
g8NqxMuMSpawebBzjtH7Klgu8TYAN/csxSuvUjLtTvAqzYVvbCw=
=U+OC
-----END PGP SIGNATURE-----

--avejMe9/B1mBt2nB--

