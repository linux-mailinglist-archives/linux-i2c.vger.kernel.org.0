Return-Path: <linux-i2c+bounces-9863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA47A64CD6
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 12:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 832283B2E2B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 11:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E25D236426;
	Mon, 17 Mar 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9hMRnyn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22DB199E8D;
	Mon, 17 Mar 2025 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211274; cv=none; b=OKH4h6NZwXCTvzSMwLZYyv9zH7FXrMsGLuJaJNnS5ToTv3M1CoypwPPw+nvYP9vmhNx43qfIulU+hvSqmaahCrkSUUnrX0kB31lWJ2HA3XYYfkEzZ7JQ20tQoSSOJzu/dQkD7WHQRZLbDIWqBA3W63sIwoiB1AdZP6E8fKgpfyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211274; c=relaxed/simple;
	bh=kU2X5hEkiArRpt5luz4fnL6nLNPt8WVJ7YovczxVuY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhBqqmp2DoFA3/U8oSRw0T5UVyYtwFH+ASuRVyqcWTP8NNqKeP/i74d16dzjV4VCnH99MpwKfy4QIMlAGuO0jQU0+HdUEkdn+R4TQG7K/SWnVCgp84mMcKpqS/g9I0Km/a9r9D5o0Ks3DNdKOSn/TwlxLBKmlYN3u0ZxSeST2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9hMRnyn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DE1C4CEE3;
	Mon, 17 Mar 2025 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742211274;
	bh=kU2X5hEkiArRpt5luz4fnL6nLNPt8WVJ7YovczxVuY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C9hMRnynlROKeyYD1wVWI8FLRi7fw1bY/xuDeXPwBmhHKKCFVacTfQBt0qkz/4w7J
	 nKCfFv0hrTG3125R54zbtbPEIm5FTptWw3+k8u4Ss/FmWPd0Rfua5pr8ORHm/Lwc/8
	 WyXupXwD6/R2k+ZmcZAbk0r1NTEkTwCI8caSzQkZNpHfJyiMehlPH/JxpN79N56TX5
	 jvTDTUVD3uAvlaa60T+855LLAj1ftPJyEN7qVFT17HnWGrQHIToPCDgVl88O6K75rd
	 bZVkpB6r01mYCsQCeMp3hFuvWHviyAxm6TcWPlfZX0WO0ei6YSSd3HTyFrbEe0lL9M
	 DANv2006Ax0sw==
Date: Mon, 17 Mar 2025 12:34:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Cherrence Sarip <cherrence.sarip@analog.com>
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: ltc2978: add support for LT717x
Message-ID: <20250317-axiomatic-degu-of-chemistry-1c1cee@krzk-bin>
References: <20250317-hwmon-next-v1-0-da0218c38197@analog.com>
 <20250317-hwmon-next-v1-2-da0218c38197@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-hwmon-next-v1-2-da0218c38197@analog.com>

On Mon, Mar 17, 2025 at 01:02:26PM +0800, Kim Seer Paller wrote:
> Add LTC7170 and LT7171 to supported devices of LTC2978. It has similar
> set of registers to LTC3887, differing only in number of channels and
> some PMBUS status and functionalities.
> 
> Co-developed-by: Cherrence Sarip <cherrence.sarip@analog.com>
> Signed-off-by: Cherrence Sarip <cherrence.sarip@analog.com>
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> ---
>  Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


