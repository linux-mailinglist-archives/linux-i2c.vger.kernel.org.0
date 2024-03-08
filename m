Return-Path: <linux-i2c+bounces-2285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366C87643D
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 13:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEE7C282C19
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 12:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE48E56776;
	Fri,  8 Mar 2024 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2FEtCCw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C4E4C84;
	Fri,  8 Mar 2024 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709900744; cv=none; b=kOoV/tPDFeue748X0I7uk/mN2kns2TdGG6TsQuMHJ3VzroBOsBWFkzQZmvs0DKeDB6Y7vz/bhSlXV0pLwJeCj4j/OmAsleesIidJvMEV1WPEY6JiFUnQl1XykmF5xu7iW/RsyUy165+QKdlRtKEfXM6UiHY6RyB1sPKXW1GcaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709900744; c=relaxed/simple;
	bh=8D8kuY3yd//sQlXmc6hr/rMSlVVWZ9oszjDcXmuV+T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1r+tt4cyV1PD2aW5jou5p+qN7rQtFFoO90kF5J2JH3B907CddRfKGMc1keSTpkli4/K0jngL6coQSfLgXAVd7sG8cWFRM1VoT32tJiafQCo5dIVaqvmHWhBlXlyStp1esAMUMa67gDzegRjsmXNabCPXNa0+PhR8ndztB589nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2FEtCCw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43998C433C7;
	Fri,  8 Mar 2024 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709900744;
	bh=8D8kuY3yd//sQlXmc6hr/rMSlVVWZ9oszjDcXmuV+T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2FEtCCw6oPjlepHRFrJiI5QTlCAGZEGLwjRu55agGY+tGVExYhS6E1BCzXglpHtV
	 fW/JUq1CIt6YSAWBVlTicj1mvqDcGgF6nz0ZF1ucYUtO8WKLbWwILyKIkbVFQj6pcI
	 VzrPy72fKG0ZaCove/oP1yrBQc+wfItD9aifm42tRM6exVmkXYRYb7luGDk07/cizu
	 YxwCxITSvO5oMukm6S/uV69EmeyZceXqUQMoZELE/suw5irk+3LIRz9tFQ8oFAL2dD
	 WnOPMF4iQtnqQSr8+hV2LT+J53OZg8HiXAP81Q7lDHcP/r4jIX6SkqJxPcx/eX3cei
	 xSN9W2NB8K5uw==
Date: Fri, 8 Mar 2024 13:25:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 10/11] MIPS: mobileye: eyeq5: add 5 I2C controller
 nodes
Message-ID: <dizc2zenbfspugjj7g7fdahjjlr4iiltcozzjmnqmjcnvqiotu@ziyqywzlugx6>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-10-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306-mbly-i2c-v3-10-605f866aa4ec@bootlin.com>

Hi Theo,

On Wed, Mar 06, 2024 at 06:59:30PM +0100, Théo Lebrun wrote:
> Add the SoC I2C controller nodes to the platform devicetree. Use a
> default bus frequency of 400kHz. They are AMBA devices that are matched
> on PeriphID.
> 
> Set transfer timeout to 10ms instead of Linux's default of 200ms.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

