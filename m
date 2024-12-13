Return-Path: <linux-i2c+bounces-8487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210B9F0A6C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 12:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A7F3283A4F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 11:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C251CF5EA;
	Fri, 13 Dec 2024 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlcsphOa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11821CBEB9;
	Fri, 13 Dec 2024 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088133; cv=none; b=ROpWFdh5kZjkrprMPXfd/CNm5ThAOAonXUPb+NC4+O540RZPV8MI4dtozNYGA1bghIAL10z1WPNxzFSUnWDkmymZJEjiYUCXe073g3CpdFeGetpV7BrxNNLgzsTzz36fArIndj+iw8iTAXwGiKuEGjQWCOOMbuG+GFbHE55DqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088133; c=relaxed/simple;
	bh=Q0PS8MAQEZybHHbs6FZGtMT3Ml/Nc1Pc3JSPi4pTUNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Imb5Te4811pr9ds1Us8PYEdW7bT2tdeV4ukHQq2utUzigG3GF8H6bCgqXozoVQwSUROr3hlIj9GqFt5DsWBuh1GfdomaEsWraLBiQmEtnPTwUQLw6CyZX6Fm7cJ8z1/7o3ZTW7BaiIiraXbeg8p/bTKNYdXjREZPCO0p0mKLBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlcsphOa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CD1C4CED0;
	Fri, 13 Dec 2024 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734088132;
	bh=Q0PS8MAQEZybHHbs6FZGtMT3Ml/Nc1Pc3JSPi4pTUNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlcsphOaglpa/Gsl9aKRBly3XeRAr0If8i6t5nFnfRmgB6ceeGeNIGWtVi6G9/Frh
	 XuTUB5aSm5m+KNbzwd8wBa6Uj2Zok1IY/DflaxxbK7gWMc9YZbnDC65ZzHBMcnZQNT
	 qiat+WoiHbJiWvwxOZ2/rDl7VpSz8677MdFJWtxpR/IBNjTNIzHbJc4Og/5TdZRGm8
	 gfrWVUrp7HZMVvX9djfxSw1QuamrtXb35JV2bHlO1mr3ZbGjT+9+ezmAp/Wt7xYjOc
	 K0QoRvQL+Y9ZDrFau8tziqI8fQ3Ml6W5eaFlr5iN/mwgEhPyIBcNvk7N3uUh5yQMsF
	 UTzREiyjFn4tA==
Date: Fri, 13 Dec 2024 12:08:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net, 
	joel@jms.id.au, andrew@codeconstruct.com.au, Delphine_CC_Chiu@wiwynn.com, 
	broonie@kernel.org, peteryin.openbmc@gmail.com, noahwang.wang@outlook.com, 
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com, 
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org, peterz@infradead.org, 
	pbiel7@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
Message-ID: <au4mmpxa6tbznu3pcxeu7tri4elvcoyy7l5m5ujdpj7ah3xqrz@ule3ymdiisyj>
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-4-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212214927.3586509-4-ninad@linux.ibm.com>

On Thu, Dec 12, 2024 at 03:49:02PM -0600, Ninad Palsule wrote:
> Add INTEL Common Redundant Power Supply Versions crps185 bindings as
> trivial.

becuse they are trivial or you don't care? Some broader context would be
useful here.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


