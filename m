Return-Path: <linux-i2c+bounces-13410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C75BC38D5
	for <lists+linux-i2c@lfdr.de>; Wed, 08 Oct 2025 09:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50F773AF051
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Oct 2025 07:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDAD2F1FE5;
	Wed,  8 Oct 2025 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O6PSvB88"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A76B2F0C7C
	for <linux-i2c@vger.kernel.org>; Wed,  8 Oct 2025 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908147; cv=none; b=KntHKa5PpTI9tpIKlXO82WWisALJFb4O9JeyS6BefuYZ9UcB4Q9U4v+FhRoZBPERKpfyaEzShjV8PwStQ7POXytodrXT10fZOIDlwkA9RSrN9MMbXH3FiNx8kWEbR2ZNwXxZkDWfudy8GUjsfOhlz4jaqvo37HaL+Sf2D4rVYv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908147; c=relaxed/simple;
	bh=mcexpX3yq4Q3MMzxGyZRYDODjhj+STYTu1Yuea0dtl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWjo0R4sihnZHPnoc6Uw6PPwvlO7VD28dlrgClzDcXLSYZ6E4v7eeEMVvgGImjp9+Hd353nTcIpahhxMvNmTTMnjYtctTD5mEKNFp0lbpXIgb4259vKPHxhTiEwtN9npYh5Dv3qJmhxuvA6EJPJ0zVtx7V5jjSMh9gvdrh11qI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O6PSvB88; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5o9b
	75Q7T0RZfTO0p6lzlK4pNYoGjq29THsS5IEP6w8=; b=O6PSvB88T/CnWRpXCEfn
	nMXsCTnEw1TSWJBSyH2OZHBVMaZDi0i6GJ6cMIcLVNt3xxy6rEtiEnbZHYHZg9cV
	WH0janmFreUvnQ2PEpQ9WrY/rLVscP5vTMSmS6aSzke50UVaRP4H0E5y8YUJ8R+U
	h5nKCTDJP0mXQ4hYrQ1KLNW15ri9fDgUw3vA/kM6vmdbWB/OQGxdRFInvWcq45Fl
	2Lbk0rEiiKx1vtuQXCy/wdUrJDWCddVs/IGFzDJgacra75A3q+z/lVPv8eT7pF6K
	PbJhvsj63BODYO/9/ApqAx5XMYaK31mrFcoa5mFpe1Y3Cg3MMhQkYnPPyuw6vRrD
	4g==
Received: (qmail 561768 invoked from network); 8 Oct 2025 09:22:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2025 09:22:21 +0200
X-UD-Smtp-Session: l3s3148p1@n/aPi6BA7s4ujnts
Date: Wed, 8 Oct 2025 09:22:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kael D'Alcamo <dev@kael-k.io>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Yan <sledge.yanwei@huawei.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: hisilicon,hix5hd2-i2c convert to DT
 schema
Message-ID: <aOYRLCGv9_k8i_Vn@shikoro>
References: <20251004154808.116143-2-dev@kael-k.io>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TIHNeOzJaVf0rHY9"
Content-Disposition: inline
In-Reply-To: <20251004154808.116143-2-dev@kael-k.io>


--TIHNeOzJaVf0rHY9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

thanks for this conversion!

> +properties:
> +  compatible:
> +    enum:
> +      - hisilicon,hix5hd2-i2c

Question for DT maintainers: Is it preferred to start with 'enum' right
away or to start with 'const' and convert to 'enum' once a second user
appears?

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These should be left out because they come from i2c-controller.yaml?

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"

Same here for the last two?

Happy hacking,

   Wolfram


--TIHNeOzJaVf0rHY9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjmESgACgkQFA3kzBSg
KbbFqQ/9ExadYvrRHKWulIyZrfcfQ3n37wKyse2joBI22cpuVCHhJ7pnkl1N0EE4
gSY+TRV6zCSyu126Pt92Q/maA2rjxt3E4xLoC+4dS6cMNWhcLOIEPmEDUCaHMu57
8YSJz9cgFQv7rJJ/JFD0TcBaQG9gvDIjyvT3Keemy8CN3i6OLTIrnTECsW+wtMFL
k8XLcaIqR5KPAuo1X7NFJX0OQV2BR1yJ4XCnMpXadnpRJvIU5xZPHtE4NHK17r4P
vftIrG6d70h7sV/qvRnPsZ9yXlTdSiBUkNrFyYbi/5nDq8h4BUIpmnAx8x7V6Nia
fQvulIY9YP1T2PAkz1e3cpcnakDyE/fqSEfYy8PAKlRqP41qe5j+ZOOOVy3KfOZa
lmaYFNSfxJusgJ6MOInxO58HdFMSFIMJtqIEihrJlMg/BQPadkqPX4uYyn8pj99c
OeO7SrJyQvx37PlSNcfyNmOfzq0crowA0hIwHBpmiCWrgm9M/zqaB4Nn4ODYlU7b
oWV5rIxd4k44Al6sST8k0NC99RutkOjNuwS+2GQ41wH7ehygoDEG4q6iXiHkDIN4
tr5J15BEj2DeI/GSWbrAcgUJRe1hHjW7CkGt7Yl44ecWgZiQpFGG9MBWk76L6qX/
lvQD8ZmgqBx16OKex0+bbGSyknBfypEzvDfEP/Xy2oW2bqGFeWM=
=k+jW
-----END PGP SIGNATURE-----

--TIHNeOzJaVf0rHY9--

