Return-Path: <linux-i2c+bounces-887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB98191D0
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 21:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BBC1F22089
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 20:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E35E39FE0;
	Tue, 19 Dec 2023 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRTNu4af"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5939AEA;
	Tue, 19 Dec 2023 20:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3859C433C7;
	Tue, 19 Dec 2023 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703019362;
	bh=bI7eRgyy5+ORKYRMoLdIMmfFqNe12oOLtPUfljOSAyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRTNu4afzfmyVVxHDtB7hzC5xvReRXGZC3oX6gzfNCDxJV9dmI0Qx+K0XKecETC6y
	 9maVdCXBahsp2UOvHWiQgrzHt+9fpBmshww7mD0gGSvxXCWp0Xv5XgCVzUsiX4unQb
	 2jBBsQt7f1jfU+bT93hf+je1VMnkQW0WB9vvhxYHmdvkEQi7T91f4xG3JHbB7j3nMb
	 fJlzoDmOzMJaFsMA7u9vMZC04S37LRZKw9bf+rGzR/YkAYlPbVIuQ67tCmFSCE3yFp
	 xuaoo0xRMCxtVl/p/82ntXh2VNF1URJ6GVGAvtqZiWPC/UOx1qq1dM+8LSEq5dGQbO
	 HP0GDTKTyR+Qg==
Date: Tue, 19 Dec 2023 21:55:58 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v4 1/2] i2c: aspeed: Handle the coalesced stop conditions
 with the start conditions.
Message-ID: <ZYIDXru48jqk6MH0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
 <20231211102217.2436294-2-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EnB+dRLs7i+8f3ip"
Content-Disposition: inline
In-Reply-To: <20231211102217.2436294-2-quan@os.amperecomputing.com>


--EnB+dRLs7i+8f3ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:22:16PM +0700, Quan Nguyen wrote:
> Some masters may drive the transfers with low enough latency between
> the nak/stop phase of the current command and the start/address phase
> of the following command that the interrupts are coalesced by the
> time we process them.
> Handle the stop conditions before processing SLAVE_MATCH to fix the
> complaints that sometimes occur below.
>=20
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled !=3D irq. Expected
> 0x00000086, but was 0x00000084"
>=20
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C dri=
ver")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-current, thanks!

I'll wait with patch 2. It seems there are issues to be solved before.


--EnB+dRLs7i+8f3ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWCA14ACgkQFA3kzBSg
KbZyCA//ccM+CCktAPNx6R6VzRFUXc9PKW3sgI5UZ6kuiBU+ntqHpNArrKZRxWFj
owkYvvBdo2tg1YZQWQOAEwdzOz3mEQ2py3faQRIEL08bihsZhgSR43jR/D2d9fpI
tssJghX3Hu3VMt1m0O2PUqX+20IJhYxjuQIVB5VEm7gSvlRoDcl+nqps/xEyICv5
A+Uftt2ZWHRGVgQ+RZB98BSsfFbPIgw64BfG0iKUF2bVqjPBCAMfPs2bZUSoGdxl
I9cSyIzWqKmQ3R2R84S+tJw6xCy1aENHHXAaXHDFLtiXieoZrcBSvs3U2YaBcFeA
VvZNMxPnGETYPsn8Hze1En1wJFimMzxEcpRRu380W+GphZa38oJyfadRh38oh8yf
pYgu9hsL4vAUefT28PvBTC75T9AabggQifj3KqdxAEWfolcsB219lDgsC8qPnOKI
IhU4bbtgGNM2z8pUN8zvFxWx9oJGONR8yibrkWhpSAsM1Wi1JREvxfdhOhlJ+84Y
8j5AhARou0HEOb0mtaIBAT37UWyBX9/HlZatXFeSi4p9AktTpKS9A014Zw5rp3OS
rZci0/iUupGoc7tg9KkbTQ0Oc4zMA9FhGKnWb+gXFw6lZPVs6w9O+EidfBCKG7iq
mgpWX0bhPwIsr7IKgR29OeKEbWiD2Uye033m5dfBTQ8cnaL0yuc=
=mbba
-----END PGP SIGNATURE-----

--EnB+dRLs7i+8f3ip--

