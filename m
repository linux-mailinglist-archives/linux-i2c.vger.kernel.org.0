Return-Path: <linux-i2c+bounces-6118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F64396B3AD
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 09:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 059121F26963
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 07:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9FC16F287;
	Wed,  4 Sep 2024 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lHJfC8NL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D19F16F8E7
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436549; cv=none; b=T8QWY91gJ8WNNlIlSBQ4ZshtmXiUqdYVlRDeHdzA11Tht+PWXx53xJzHREHbz19SCGlyUDY+egMUO1DMdD69KNbVBeUwTUx0mc+6ZO9eIeyVxx0OURFYu4x6toJvclR80hw2y1NpU8uxDJaW+bAH8n3ENIWwPe3xM6o1qNGfwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436549; c=relaxed/simple;
	bh=aKREuGuvO5ZHE1yHZZsfwqNwpc5ngWPlAvJqmQi/mFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCV1GY2QvWz5ApCxJDrUnrwaq1xo/qwh+l0Svko25NxEuxTjlZeDlfQLjt83/QQq81E9aSyE+hUDEQ1s+9W4zhOL8G9ke/qoxFnjnCF9G+HcKYZMnfPcy7JS1yPtoFBxeb/nb7tHChI2R/+85dZdJtz1iOPanJZ6SoN3cBz1VJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lHJfC8NL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aKRE
	uGuvO5ZHE1yHZZsfwqNwpc5ngWPlAvJqmQi/mFA=; b=lHJfC8NLL5hM1d99YWjb
	k8hDKbwT7sQf8dInSNM2O1kpA1swfRUSh15nms8BwX4XK7sQOPW/xU646LChoL7s
	MlL6mj1/2d4+GpkSgFJnakGliodkpCyjufupzv5XqiJo4TZN0ytxUDDuqoOtWhcw
	Ftacip61yFvUV0V9V8Eyu/o1oSEVbgN2RdE8+kWEb7GCFzV5oAi5AyzCYkfoebJA
	/7HgHZSVS4QsdZaaMW51/42QLG8Wzrtmb4XGaKBOfOAaMiycCkPj2/JN9DPa+haG
	ze9bm6J1gbHzupDjyCxJh3vuGJwM0K55flbm52CyxTjg8jfMmmuw6GBpIF2P5GCE
	Gg==
Received: (qmail 509259 invoked from network); 4 Sep 2024 09:55:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2024 09:55:35 +0200
X-UD-Smtp-Session: l3s3148p1@4iHCf0YhlpwgAwDPXwdRANgvu6DX4+2c
Date: Wed, 4 Sep 2024 09:55:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nikunj Kela <quic_nkela@quicinc.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	wim@linux-watchdog.org, linux@roeck-us.net,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 15/21] dt-bindings: i2c: document support for SA8255p
Message-ID: <ZtgSd_SLndvLLVYF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Nikunj Kela <quic_nkela@quicinc.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	wim@linux-watchdog.org, linux@roeck-us.net,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Praveen Talari <quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-16-quic_nkela@quicinc.com>
 <7fc1e4c3-ca09-4a0a-b072-0c4f1d21e44f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FHEJDPFXKqntwo2j"
Content-Disposition: inline
In-Reply-To: <7fc1e4c3-ca09-4a0a-b072-0c4f1d21e44f@kernel.org>


--FHEJDPFXKqntwo2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Just to clarify to I2C maintainers:
> This is incomplete. Missing driver changes.

Thanks, Krzysztof!


--FHEJDPFXKqntwo2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbYEnYACgkQFA3kzBSg
KbZVYBAAiXNxlHjbEKLTGAkGhtvJsfotjpV3nCHTOIX/wTow3SIk/EuRFp+rNX9D
bvnB135tiFbnLkTasCvFaDoz1L5wOf3pnguvdpQAIauuzlIznrT6k//2iFhEBwKV
FgaVWIWUvfGw6LMCubL9h54kRsAVjdMBb4pN4C0U4cQh63+3nbJYGsqgTaxVyFR8
1vBhtghAuAT9uFYeOPgP4GsV0wm4G4far6kM9R0wdaiu/abnMT7aiIa7T2eGps1+
N+NerB2mmf6E+XEDnK9eDRCNMUJcam4IfYVjaQzwC//aFSFdmVvvjXKfbnssf+JF
Vfn0hqkLmMSxL37rtuVH9v1JE+QJ8yPCwNzJpey+GWDInsux2gFaEsj5y7DNaXz9
rJl6yjzKGUEIaB3unQqDNIXOYa8t54sZOVPMiXyiwRf3n+itlcgM1UyIAhcJL62u
khTLRb01S4AJCQU0i/tkvtxjThP+U40p/2HWHcvNIdv+FAvNwpP3Hwbr7hthVHXo
yoOMh7BeGjoG2Kp9/5JanWIWUy4RiAVJiKKZA6wP+QQhnpRldvAbfv56htszdT8F
epR8Zsy8YVvVQbgzZcCmFkKY5tHrkfOYaURZFpE5stum6qKUSt/asnkEsDxqkCss
4D9DFaqxYU6zv5TvPEk8Ht4P+xoSS9D6XBET6SgXeNARud2kCSw=
=F3tI
-----END PGP SIGNATURE-----

--FHEJDPFXKqntwo2j--

