Return-Path: <linux-i2c+bounces-6273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C096E32C
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82E2428AFBC
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 19:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FAD18FC92;
	Thu,  5 Sep 2024 19:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpMd4Xpa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A221494D9;
	Thu,  5 Sep 2024 19:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725564494; cv=none; b=fbXvNPqoQ1gW1ccOE/4NCLCAaFX1D+BZbepTBreEjsNP2/uxkkeQGm5hVSP5y2+b8nAvTkYljx72GETPKxX8Hnoz5tsGnkkZgJ5r992Q502rnUAPoyK7L5gO//jfKdJ9Ow71h2VF0NpexpWYcemRWh5IdoGIYP/GQKuoKkyMlLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725564494; c=relaxed/simple;
	bh=GP/EYsIa04ZRzCtq5f6AP5GT6XD3MKU3ry8CRFsdUmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTBhUu+AW7NRZk5Pn4rfC7vpL9b58Ut9sVOXnXYA7dI/7hmfcgJWcum61saz5VU68hhoT9UHEAC7/hclkoHz3Jqt46zvpmuQhhv/qHKI0xjulooqI6BiuEMn2Wzpn1e5+WX0DgKwPigL9old2upMMUCmJS9AWN2NYS/LX09oU0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpMd4Xpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C338C4CEC6;
	Thu,  5 Sep 2024 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725564493;
	bh=GP/EYsIa04ZRzCtq5f6AP5GT6XD3MKU3ry8CRFsdUmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpMd4XpaRaFZEAEVPG0pYWcrD08L4YhqKnPMDvqhjGWiogv7mM0jxRTjFsKXyNub4
	 QU8ORbfUJFBV643sjDGdaVPcPRjIAbJch1833Cq/C+7p2TQ5YYkGe18KEaEE7q6Mt2
	 0wyDo9pl/CI9D7lsL03l+CzQj4fUQEzbqYhlv+OInwUyDI5IdCJOhUOPFhHUgmnFCt
	 uxoMr6o2ndJUeOo1JCSaSdjtmwiBoFaAZEWUiRPQm3DAp+JzObK+6AEAeu9VK3qaOF
	 YSBEzVadvi1hNBKTPUc29JtwKmca39MkoB7GXZCVmQeXrEu8xiSHYEl8FhRq/LTIhI
	 gBfzySipJ7R+w==
Date: Thu, 5 Sep 2024 21:28:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, tglx@linutronix.de, 
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jassisinghbrar@gmail.com, 
	lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, cristian.marussi@arm.com, 
	rui.zhang@intel.com, lukasz.luba@arm.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 15/21] dt-bindings: i2c: document support for SA8255p
Message-ID: <is7hoj7s6su4sycvrbwknyf7cj4bgzrarfpdblrjt3w5i4h3to@jzfmei7z2dje>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-16-quic_nkela@quicinc.com>
 <7fc1e4c3-ca09-4a0a-b072-0c4f1d21e44f@kernel.org>
 <ZtgSd_SLndvLLVYF@shikoro>
 <24d4676f-4385-406d-9728-54afc3144e17@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24d4676f-4385-406d-9728-54afc3144e17@quicinc.com>

Hi Nikunj,

On Wed, Sep 04, 2024 at 05:45:05AM GMT, Nikunj Kela wrote:
> 
> On 9/4/2024 12:55 AM, Wolfram Sang wrote:
> >> Just to clarify to I2C maintainers:
> >> This is incomplete. Missing driver changes.
> > Thanks, Krzysztof!
> 
> Driver changes are going through internal review and will soon be
> posted. For your reference, we have pushed driver changes in CodeLinaro
> git branch(nkela/sa8255p_v6_11_rc2)  in kernel-qcom repo [1]. You can
> take a look at the changes that are in pipeline and will follow soon.

Please post here driver changes along with the DTS updates.

Thanks Krzysztof for being active here!

Andi

