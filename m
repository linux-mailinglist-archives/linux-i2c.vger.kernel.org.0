Return-Path: <linux-i2c+bounces-7477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE919A3F8C
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 15:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2D81284275
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 13:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591A11D63F1;
	Fri, 18 Oct 2024 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhtNtEtH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6DD1CABA;
	Fri, 18 Oct 2024 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258076; cv=none; b=jrzRxHzGkiFxQWA8Wpy7JuWknO1NTANIGUcdUkXBI7wwqk2GQWgjB7qJyQJbkhV9P7ZRnAfVsPQl4mMg23A0R3ompUlJPbbrrJnYeaaHbAVnM/cknpJhxksd+yRU2v+1RKeQ/8D16qcL+Ew03ziseqnoTJOcjGl1Tl2Gb4WuFAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258076; c=relaxed/simple;
	bh=93Crq9pvRvCI3TSSZ1RZ5q/LnUBK1nheYs5r3Y8HAH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1U2Pfr2/U5oDy9ZGGF9zxM6EyYc4ipOEWHPH4NotBzxk+pDb+Cf0X+Tt+TFtcE2QvMG6pwMlmBLfe+C7NUk86zp+8LU6pnofW1jAbwpkg7xKpgOMPzK0RJsBzd+zLuMpp8z/NCHAz3oBhFNKhXscasvbmXFMINokuiqRS9mKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhtNtEtH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD78C4CECF;
	Fri, 18 Oct 2024 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729258075;
	bh=93Crq9pvRvCI3TSSZ1RZ5q/LnUBK1nheYs5r3Y8HAH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhtNtEtHlEakpP5R1pIw9UZ5oM1ituynxWMEvctzXmKnbeV1FY2lONn1GVE6DRFza
	 RRrlJADfH842o6VBzlLQf0K3aIMvZ8p0mPeSub3K5sf+ITk6Wy3ekuDQIs82IcBqD6
	 01CY+0toa7rmPcKlMqBBYPVIb/B3rkzEZWDs5oZS1D4AXTeZ4ZIypKMfFM7JUmsOeT
	 rnAelyUv7nX4L194y9PUp2wFN3CVD2RNwFABsjBPV9RKk5r8O+KWIFVoRRqJ7ifZhG
	 aFcfdOfxEoE3AkRBlQaFuwX/s4xzYVR2lLb3Ece0O88tevIsijTSpcBxhYdniM4nv0
	 XMhFKCg/qGJOg==
Date: Fri, 18 Oct 2024 08:27:54 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-i2c@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write
 lockable page support
Message-ID: <20241018132754.GA54765-robh@kernel.org>
References: <20241017184152.128395-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017184152.128395-1-marex@denx.de>

On Thu, Oct 17, 2024 at 08:41:25PM +0200, Marek Vasut wrote:
> The ST M24256E behaves as a regular M24C256, except for the E variant
> which uses up another I2C address for Additional Write lockable page.
> This page is 64 Bytes long and can contain additional data. Add entry
> for it, so users can describe that page in DT. Note that users still
> have to describe the main M24C256 area separately as that is on separate
> I2C address from this page.

I think this should be modelled as 1 node having 2 addresses, not 2 
nodes.

> 
> Unlike M24C32-D and M24C64-D, this part is specifically ST and does not
> have any comparable M24* counterparts from other vendors, hence the st,
> vendor prefix. Furthermore, the part name is M24256E without C between
> the 24 and 256, this is not a typo. Finally, there is M24C256-D part,
> which does contain 32 Bytes long Additional Write lockable page, which
> is a different part and not supported by this patch.
> 
> Datasheet: https://www.st.com/resource/en/datasheet/m24256e-f.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-i2c@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index b6239ec3512b3..590ba0ef5fa26 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -141,6 +141,8 @@ properties:
>            - const: microchip,24aa025e48
>        - items:
>            - const: microchip,24aa025e64
> +      - items:
> +          - const: st,24256e-wl
>        - pattern: '^atmel,24c(32|64)d-wl$' # Actual vendor is st
>  
>    label:
> -- 
> 2.45.2
> 

