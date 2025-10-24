Return-Path: <linux-i2c+bounces-13769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5CBC04E93
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 10:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7590C3BF523
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 07:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538C42F8BE4;
	Fri, 24 Oct 2025 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="eTgClpl/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2A2F3630;
	Fri, 24 Oct 2025 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292577; cv=none; b=FfnxwjyYvgF/L3nhgWPO39biYHyKvEzWAeVv8OIkU1HkcwHvN4QtwKNYYgxxZLntQRAhVM8AoIMSBWQiGl9xb/9y1iTCfLeeAdDVp0ht7TY5uS+iOk4dPoG4ErwRuMRufHuhTOXwknAPqassLcV+3h1hoS9ORwzyFXcc5f70Kbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292577; c=relaxed/simple;
	bh=HvOaKA7yATNHviA11gu4zFrMYg2AOIM8mTYHs1HrhIQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nob/kcIsJNv4WEUJNW5JWdesImhY6wLk4XBdr639pxHEgGwWRA9+RLXobIlRX1qy+rcSMtwEa2ms7v6vQnxaD64wYQHOCoTBGKQahKzmPZdScnhZnU4VGrBk9g0TCTMzPMoJHQgFZAzqgg7K/rOSAUHAjD0+f7BoWI8TSNG2zko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=eTgClpl/; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761292565;
	bh=HvOaKA7yATNHviA11gu4zFrMYg2AOIM8mTYHs1HrhIQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eTgClpl//Z89Gd3mJ26u/c4wtzTyfWBNQOqpjPZtVQzGYTvZMQdVv1/Wpm/Rr2afn
	 ixqp5Glry95DeQ2s9NOePqNV048rEplCbVMt2Ul1jOE/rEOgl1Dg/zfWxmeQR5yNML
	 XNCBrPiNacSqWAd+MngipGJyTrP5Osv2FMm4YfJEGOPidCmGebP0fiXHOS6ZipyiFq
	 wbATJ/kvggqZTwHSbM7FPjb6+CADOaSZkY51KEnzJaLr4g3rrlSF/At0W9aPaOZU1M
	 w+v6N7CGvrjRFtZxssmUwbCS8reLoFtOy35NSpeH8uE/Jgx9uk/TT+312sYqmAeAzL
	 hAR2vW9ZYV+og==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1412F72F33;
	Fri, 24 Oct 2025 15:56:04 +0800 (AWST)
Message-ID: <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 24 Oct 2025 15:56:03 +0800
In-Reply-To: <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

> Although now I saw next patch, so clearly this commit is incomplete.

The split that Ryan has done here - by shifting to an identical separate
binding, then making the changes explicit - allows us to review the
actual changes without losing them in the move. Sounds like a benefit to
me?

> You just need allOf:if:then: section to narrow the
> constraints/presence of properties.

That seems like a more complex approach. This is separate IP from the
2500 controllers, wouldn't that warrant a new binding spec?

Cheers,


Jeremy

