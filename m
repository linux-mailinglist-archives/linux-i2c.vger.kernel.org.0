Return-Path: <linux-i2c+bounces-12331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ECFB2AD61
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 17:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18BB8565B84
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 15:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A4933473A;
	Mon, 18 Aug 2025 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSiNvhzk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C854231E119;
	Mon, 18 Aug 2025 15:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532264; cv=none; b=MPPCM1x0SWtu+pFAI5167MjzRnE15FHP+ReH71wAwrytY3+sEg5V/5NutT3BA8LnkjeqKEF00rjvoR9nAxI5nk8KdRhhyNIHXDazT1KejYla8b1jDLP3lqtmo4hGSsRiOqV9XAS4cr4NwA1CUTyRMjrLhUge3xAUt4PyBDHCH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532264; c=relaxed/simple;
	bh=r0yvrAIAXkXKJt14/95ZaNgQUPwCBY8YO4aKifN9lhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiiUa56yhW+90p6NG7KZjKxENmYT+eisXD6sd7L4zN/wOZP1lyAkuJYmASLUhgctow7hhmB8kYR89ZwZR8UwhVlwLCyF/+sTSYBV60U31Uql0yrrBAjXKJr+LeRllH132FM02gzi8yxPgr6gSXM+eGhcfa5tyhMwWFGjJiI/WxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSiNvhzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744F0C4CEEB;
	Mon, 18 Aug 2025 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755532264;
	bh=r0yvrAIAXkXKJt14/95ZaNgQUPwCBY8YO4aKifN9lhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSiNvhzkqt0xqOWA/qUE5I8bsWGAB7vxvG5ef9otr2GZUiRn+2WLLbjzC2StcldWv
	 Lcy7Efri0ZTxF6NJWBnMtOTu/3zhBb80CdR6KX5lAZ19uLEGY7+RAvcEIfgDTLuEUl
	 jsvwGFmxZGaECOwxZ5e9hGg4bhtciWK3lhQTCekNc0ZxQmLVu1Z1Rdhyybj7c4WI26
	 OXZQROnhEKBmelrPhM75MvFfh+J7pdRd9skmis55oRvI3LeTQB9gE48uyzm2EV+ZOl
	 d2WtuOWtGbBlw/jqijHHbt/gxHRGaqEPS5vlMzmCxoL6OW2BAl97eHlF8Fr0sMCzfL
	 8Yu1OD3u3Bgiw==
Date: Mon, 18 Aug 2025 10:51:03 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: eeprom: at24: Add compatible for
 Belling BL24S64
Message-ID: <20250818155103.GA1272375-robh@kernel.org>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-3-e83f104cabfc@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-msm8953-cci-v1-3-e83f104cabfc@lucaweiss.eu>

On Sun, Aug 10, 2025 at 05:37:54PM +0200, Luca Weiss wrote:
> Add the compatible for an 64Kb EEPROM from Belling.

It is generally not required to add a compatible here assuming 
"atmel,24c64" is enough to identify the specific device (i.e. read the 
device's ID registers). If it is not sufficient, then some details here 
about why would be useful.

> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 0ac68646c077790c67c424d0f9157d6ec9b9e331..1e88861674ac8525335edec1b214675c8efa3ffe 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -131,6 +131,7 @@ properties:
>            - const: atmel,24c32
>        - items:
>            - enum:
> +              - belling,bl24s64
>                - onnn,n24s64b
>                - puya,p24c64f
>            - const: atmel,24c64
> 
> -- 
> 2.50.1
> 

