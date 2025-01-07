Return-Path: <linux-i2c+bounces-8940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C48CCA0389E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 08:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE3317A24C1
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 07:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905821DED56;
	Tue,  7 Jan 2025 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcYa9JFm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D72419E806;
	Tue,  7 Jan 2025 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736233912; cv=none; b=mHXcAEN4QssauzEoMs7PTz+19tODst81eInvpIEztfhTqgi65qRfcyjYau4Qgwh41iPM5rygTBpi0UzcDNQgDxwzww7QBWJ9lR7DpZQPn193ROwbj4nRkEYzw3mkAbFf8nd9eee6AKvi+Q1XVy31J0Nkhj1S/L1iASSnT65JEjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736233912; c=relaxed/simple;
	bh=kz4dkqGY63si1DYaVHHi6BHE15iPw9g7NKwyNebekAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmQ8F585CMTfuGgxRy6gbzliVJwpHmVLTxKRgmi44UXXEgvxCVrGRimab4Ch9+kSk/y/baACR8u+hy5qAsDSwyLQTQJDK1zGcEvr9wLPRXN7HZfSmIlJGwCeGSDSj+ClQoiscpSbgNY8MUsizgjAaIeO8nILfm8j1kVmkqQUYeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcYa9JFm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7E9C4CED6;
	Tue,  7 Jan 2025 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736233911;
	bh=kz4dkqGY63si1DYaVHHi6BHE15iPw9g7NKwyNebekAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcYa9JFmkH9J6YtIIyZoP8qmjyoPfv1xVKOC1FcX3xAI99vSrG++GpxetEtzc/6hY
	 2bjrSl7CQnWszl9f1p1T6QuyInt7amACuxSeaIO77JF/b0Q/oSecJ0vlOR7zUuVVAb
	 9etMUj2OuR3+o91OAkGqUAg2pKQr6cI/fBvDMZiAHhc1OqK13hBpQRKCOBdjQGw0Sp
	 djdDUyAzJVrrzsc/b5GgtTMIa1RPW92OoaF7OtNyJcQVRKT1GbvmnIXmvO7i3ZbsqU
	 gf2LWudNGF7PJh/GWewDDfBIzixTucb8z87Tnj22HS5u/VTuJHJ/CwuvdQyYJUSeU5
	 1ys+3RR+lMOaA==
Date: Tue, 7 Jan 2025 08:11:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: adm1275: add adm1273
Message-ID: <sl3eoqolbui4ce55v63ht3sc4k5o5jmvdvxnvwsmqwibawjbdr@4zwkr34gtlpd>
References: <20250106131740.305988-1-johnerasmusmari.geronimo@analog.com>
 <20250106131740.305988-2-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106131740.305988-2-johnerasmusmari.geronimo@analog.com>

On Mon, Jan 06, 2025 at 09:17:39PM +0800, John Erasmus Mari Geronimo wrote:
> Add support for the adm1273 Hot-Swap Controller and Digital Power
> and Energy Monitor
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> ---
>  Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


