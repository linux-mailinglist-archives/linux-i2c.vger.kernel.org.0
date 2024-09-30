Return-Path: <linux-i2c+bounces-7098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98598A5D1
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 15:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81C7F2823AC
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 13:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D80D18FC75;
	Mon, 30 Sep 2024 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayS6bjx2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1849F1EA91;
	Mon, 30 Sep 2024 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704136; cv=none; b=htFP+YsUI+EAXpaw/5O/iaZ/IUeItf8ERrbYtX4YHmk1C9UyXAlPcosfa80wzX288eC4VAUVj2g4/YGyYKN2zLbJ3Rveqa0+9GQI7fybD1NppNMSyNvxF3SapKeefyJqRxdcpe98PHwVolQDi2Ag6j/Pd6Rhx1P/d6r63hz8qzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704136; c=relaxed/simple;
	bh=mLxOv40+thabk1P2b32vNUikvJ6eQGXWajpc61FvYNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meE8nTsCjygMwYS5cTqX58L2Z6xadw9hekFWwH6OCnqMK12bJuIknF/X6eha60TXAvHqT/I4e/wI90LzJOBpIfBoj4hw/mZDu53JYIPUUji/i8pYzIICwJv3HEF2V4YHecKGuFcW/WxUkYHjNDUgoX/Zmt9spHVA08VBDyKK+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayS6bjx2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DCFC4CEC7;
	Mon, 30 Sep 2024 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704135;
	bh=mLxOv40+thabk1P2b32vNUikvJ6eQGXWajpc61FvYNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ayS6bjx2YId3rnhgA9QtkiJMUfIFDG0/uTe//BDRDTA4WoWSwAXLER98bXAupPJD5
	 H3uWwA/ReTdToHdIQiPrzd1tinyirhIvquDjZEJ5m8hxh51ulBbWrR8J4beQb6Exp1
	 BtSvdKwWziw30Ga/fjoZoEYGXYdhefn0ddI93yb0L68r9s3zK4QhLEjAJA/3vV1eGY
	 S7K+8xVGRYNAH/tnQemESmyg4WHzVoGGCtFPDwxbTCPN7MgQSYsoetWCoax0vlyWJa
	 LhUYFntwsqI/jj5lkQUv7CVMPgpxnSO+YoIvqMC2rdcsvmzAPZOgzFDn7IAxVjY0zC
	 v7gHc867uVeBw==
Date: Mon, 30 Sep 2024 14:48:51 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 10/20] dt-bindings: i2c: microchip: corei2c:
 Add PIC64GX as compatible with driver
Message-ID: <20240930-hunting-outthink-f8627440e467@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k080Mv3kRXZMROiA"
Content-Disposition: inline
In-Reply-To: <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>


--k080Mv3kRXZMROiA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:39AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX i2c is compatible with the microchip corei2c, just add fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--k080Mv3kRXZMROiA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqsQwAKCRB4tDGHoIJi
0t7YAP9aDUIuBl8jWcIIhjpW26o6UvJxAOQG38tKO4CTvFfKZQEA2ay0zWhPrzvm
GKaKQvG58A/nuXv/xPthr9/IGACkxQM=
=B153
-----END PGP SIGNATURE-----

--k080Mv3kRXZMROiA--

