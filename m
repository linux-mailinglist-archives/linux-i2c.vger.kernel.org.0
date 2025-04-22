Return-Path: <linux-i2c+bounces-10517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74AA963FB
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 11:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34330162D4B
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 09:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC4A1F130C;
	Tue, 22 Apr 2025 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpGVb0kt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF79E1E5B89;
	Tue, 22 Apr 2025 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313377; cv=none; b=aR6VqqoZpai+lVR3vnhkONQudockwZ9tJSVBNNDpxzQU5dy7W44Q2dPXeC9nMQuUQK9LcWAFtIBPDtGg4zExrDz9gP8nXNydaIaB0KgVm9MS9+D6kABPAnvrfbxSoG9taSxKhV16ABnyhIEev+xjO7bwWOEjmJJLyEEGrVwrg8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313377; c=relaxed/simple;
	bh=FNhxKZMiPJsSRSoVxUInTBZMwbEMCNxWVqfU2PiaY3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+frBAdua1HPKFXnzObCUeD7vd23ItWsAKI8wLfQz9IaoGEif/rO/veJI44A8B5B0u3giVaKf4AZt8tOVcRHL8qwfnORtN5mcuP0SdVl+mIl8MLBt4Lc6zdWmlZXJi/jLcwCYH/zr8CoJTUdEztkQzwkmyGQAMxjNCOFjPcIHHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpGVb0kt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECE4C4CEE9;
	Tue, 22 Apr 2025 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745313376;
	bh=FNhxKZMiPJsSRSoVxUInTBZMwbEMCNxWVqfU2PiaY3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpGVb0ktKWIsgZFaHuqw5cM/044YdDlZxWsIEeZduBhaDYSziCNCN+t5WV3ok9RZi
	 fhE1qMivQHu0rNli884RPNp748Q/RoFgFgRurnJSQTGuCY6cuoYOwvTCTFHrCkTnKG
	 Zl4ryt+iXVcfUKV5VwDH0bUddM/ajVkNROXqxA2/k9btno0RHvERx3nAfwSepxuHzo
	 giyDsQbzcNLLsP5H16SVK8U42bC8pxe5StHE3GGEnScNpOXB+M93dNQlj5+jaCnDRj
	 9mKbzKwApDlQ58P29CXGSwFcm1gXBnoUJY7VgVQ4LMFUwJlj7Xkhu+PKLOZSDqgGd+
	 Kc7SMj+YwjBqA==
Date: Tue, 22 Apr 2025 11:16:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: add lt3074
Message-ID: <20250422-coua-of-serious-inspiration-fbc9ad@kuoka>
References: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
 <20250421-upstream-lt3074-v3-1-71636322f9fe@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250421-upstream-lt3074-v3-1-71636322f9fe@analog.com>

On Mon, Apr 21, 2025 at 08:18:18PM GMT, Cedric Encarnacion wrote:
> Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
> Regulator.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,lt3074.yaml           | 50 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 57 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


