Return-Path: <linux-i2c+bounces-13126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABACB976C8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 21:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D30C17BC58
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 19:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADB6302CC0;
	Tue, 23 Sep 2025 19:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HZe8WrQs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEB2D838E
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 19:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657233; cv=none; b=dpnRotqqFbtO3zOPdVVIJq6o7NLDK/9oK8x5niBXc+CgxtG6SASydwN5Ok2kWotoRBAzHb74d49m2b2ET7zqrMIvzLAyOWMtviBj/8i+JzCV8lJTbPH6wS7mu0V/abJMMOBg8llWZK2u4JH1TTmXcx/I/Pj8PSIvuZx35MIir9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657233; c=relaxed/simple;
	bh=0mBis1ZnHz5kuXTa0qhxPoN39RlWHxLzYEKVGbcdtmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzT23pyDiN3iu+Rr2Wa2NzcTPdrcY87oUsHxdy6xD7Rk0NpYlZfgAdhVS9DVuHxUJaGJwENP7kvHG0GEoHuTc1Vy8UU0rBbEHDGBqntw5LngEjRveA2Py8klP+2pNwgEefmpZRbdtEoUe+Z/dt8gwfDq43qMwQpThSzv3pa/APc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HZe8WrQs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bL/H
	Qu99e0loUqX4/EAdPey3KBU4E0QmfqrUkhK6tZA=; b=HZe8WrQsacmJfb75TrUq
	9RzTsUMPFrYqllnHCrRudUXiw47TScoCmWpbbC2sHzbHK4r6yzE95dEyryT/970j
	B0YclNHdrVfQYK8GD1x7MqpOECIXS5X8xRYrVLvqTTFLHHD1tAsD6Or8LgPslhQG
	UmBlq20NUU/7QbcAG/Gkoyt+ca76wo+G/9Sa8aM66oDim9XPUEISvVZF490nUdcq
	kqpEAIDNkbN7I/ii6DRIkjL7N1YkdUUuSPAgPFTN0UM35a1oWhlrQsZgETYT7Rt6
	QpCqfx4zLu8LyAX2NrMrHiXJD+ixyQaB3pQzpW63lvBYviqJ4ywAWDVhrTx9JZxb
	RQ==
Received: (qmail 1226268 invoked from network); 23 Sep 2025 21:53:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 21:53:50 +0200
X-UD-Smtp-Session: l3s3148p1@RUU4S30/ju0ujnsp
Date: Tue, 23 Sep 2025 21:53:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace
 cleanup in example
Message-ID: <aNL6yd5QLQzW8b0h@shikoro>
References: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>

On Thu, Aug 21, 2025 at 10:32:06AM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to for-next, thanks!


