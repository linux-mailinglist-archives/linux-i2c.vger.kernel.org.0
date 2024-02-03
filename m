Return-Path: <linux-i2c+bounces-1624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973168488D7
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 21:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E05283AF8
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 20:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2701078B;
	Sat,  3 Feb 2024 20:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LFseIOAk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660211188
	for <linux-i2c@vger.kernel.org>; Sat,  3 Feb 2024 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706993419; cv=none; b=tLtBS3+ycdm77PmKnN3L2LBRiqCxnWs5dU5s56DI9xDx0BjJlcaQaIwuk/SN4qH+aUMSjb8xUo6vgGbeWhrQo5htq/11o8Km7eeslI0MYtRRhm4p/N4cUtJVzsByUduhfZmBMCkc0XQzQ51RkaZ40H3ZLHy8vNEHdsNPqUyO9cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706993419; c=relaxed/simple;
	bh=POcFGkZdhFAWOoMj7FLlsK2U9C4n8sNZDphWcp7eS2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2+OC6jL6xf3z6StWJdFF6v2/C4s7xoClMhIURKgF1hT3Rr3cS+z6QwzT3Lu9BIhFR4VEVQoRvorl9i3JYPCLcb+zy4sSUDnv/1qlp0iJ2zaTbPllUxElIfoXz7IEioh3T4H6mSKIWpv+EKgews7JRG7ZM0DsGKCtzBvOZkJcVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LFseIOAk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=POcF
	GkZdhFAWOoMj7FLlsK2U9C4n8sNZDphWcp7eS2E=; b=LFseIOAkgqzjZXBbZb5a
	s690sz5kL0VyPxb6iKw9U6yMF9TRLij2L0Fysa2WS9k0QORXjCOCPfiPC7stSWjE
	MsOccPcaHueyYs++qUpgQDgQxb6a2IQAnAlPhEI/W7+LQS5h8X/twf4hkHC/zi18
	VuQ+CCCIUPHy2JD4c3o3JwKr7RPaQZRXlAFwfceX1QuW+cMAOCvYjx1sl4pPDnrI
	N8bSpn2D68q3QxIOf+Aidcl+OTdxb3Hk3E6hq4IAgOaShlmDoxrBo2DPVH+Pqj/3
	baKcNxDOp56HSom1hqHISHb/NpQyLbbkjAtG0EP3LL/eyMFgxCS0TD0EJrx/njrv
	ww==
Received: (qmail 318160 invoked from network); 3 Feb 2024 21:50:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Feb 2024 21:50:15 +0100
X-UD-Smtp-Session: l3s3148p1@9SEgYIAQNI8gAQnoAGo3AKaQ4acoehG5
Date: Sat, 3 Feb 2024 21:50:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mux: i2c-demux-pinctrl: Drop
 i2c-mux.yaml reference
Message-ID: <Zb6nBYTkZmXZ0G2X@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240124190552.1551929-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T1oybG2PuCa90Bg+"
Content-Disposition: inline
In-Reply-To: <20240124190552.1551929-1-robh@kernel.org>


--T1oybG2PuCa90Bg+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 01:05:50PM -0600, Rob Herring wrote:
> The I2C de-mux is different than an I2C mux, so i2c-mux.yaml is not
> relevant and shouldn't be referenced.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--T1oybG2PuCa90Bg+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pwUACgkQFA3kzBSg
KbaUdg/9HYOs6lORKt0/cJNLN2T1raXDeANsx7IVJ3GMVJLNcNawwn8VBFBfZbOS
QHvRWn2bB8sBLGgtgToR4gU8zzpLRqweO4fjo0KWxiKQeJgvPONtqQxN9ALBSVLX
XNCwfhbGmw8cM2Oq4h4hZpg7VFoYgIlUWlVzc3saVpWpJEx8fCS61UqT0nlwA2H9
y3nV4epjmqZ0tgrnyYAjViTfMW26nfPld/whirYmJ8t+Zkpw56dPtLs34I+AzhRm
KBxxfBG++ugVl3lUQcxsQtFtuUZCX047Kb9lwSzB8r3cGGN9UXaSX3OApCEdWUXZ
dLOiPidUayAYBtsazoAAKACA4u4jHhcyV0zqygMz2G/1Uqxp+CpCZVjtDIDI1BkT
8QT6Ni+IK7Ues9hbWEOOXwZfKeTf6bOnQgDlhMEN+cwKf0uhqLmdxH7dhBk0pgp1
4nlcUShPtJK7hKODaLb46cNRSOQ9kBcSHoU2ZkuBGPNjAslbD+bAECRcTXK4+LT4
OldmG9HGfE7pZOo0Q+PfbCF4/x7Wev2WDWJV1o9krHHWHjjkUqJMGBD+75IpVb6F
N9zrPQi1IesmVQDllXSiN0lqZRX5xqJKfpnvMCIRYVNrCZ4sO8QaIba8UkY8vXSd
cAp4w9+oDMQwo9va4Jj2ydkAcSyr3vCvtOAN4hg2tavwUK9RToU=
=IthO
-----END PGP SIGNATURE-----

--T1oybG2PuCa90Bg+--

