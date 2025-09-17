Return-Path: <linux-i2c+bounces-13004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B488B7E09E
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 215793A6139
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 07:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532C62E2DFC;
	Wed, 17 Sep 2025 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="KZvqpnXt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1023AE9A;
	Wed, 17 Sep 2025 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095452; cv=none; b=UpOsFTaMq1VIVCVPLojn+0205sNC/F02yU/Qk7DP8Ct0gx1wNS0zfcqbbJoZHK5pJhCKFZ/oor/NYjs7+da81btNqqMbOD1gHg22PCX8aEDP5dr0OM+7D/xxk4oLrLGKEIMGo7PiaIEOIWqE7rJdojF7+GDn9F+w+hwiq36bU4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095452; c=relaxed/simple;
	bh=f1hZSSv8RRcFWnWU1u8ALs0G4QC2D0vWizfbU53WVsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxJdZnfrJJ+22dl5oQY3FWbffNfVXtNnyb1olzuybJhu3+/+wlaUra7xCEOUMvfipbiaDwR5bMgTn2IavJ4tU8wQLYjTg3btkLihGzHlTsgW/PwWFnFNj25DV2Go88BP3auC5oxDcMwx+c9ztZN5vP3vqQeKTaCZ2xFsEniP5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=KZvqpnXt; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758095410;
	bh=9zb8bG0zqIEOxhdQgpYL8pRl5cp21PGqetg4qySjTPM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KZvqpnXtnCI81jVvAtHoshMgai8xuWxSGyT2nTsevWC851081SOJNZ8PU+2zea/hO
	 fzERwT9+yHpo6vd8Mbw91vKwGFvyQgsnQEvvPn+6dnmbk0Jv/LLsk+Q5CYw198rRJy
	 cscoG7MEgangNCV+Jjqohb+SSsJoWXgRrgEe+zMM=
X-QQ-mid: zesmtpgz9t1758095408tac496626
X-QQ-Originating-IP: hoMmYmM+iXM9vjSWP534S9eL48TnmbgB6K21OZndabo=
Received: from = ( [14.123.253.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Sep 2025 15:50:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14088576248179835359
EX-QQ-RecipientCnt: 17
Date: Wed, 17 Sep 2025 15:50:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] dt-bindings: i2c: spacemit: extend and validate all
 properties
Message-ID: <F28733C699531788+aMpoLx-bCpo9-ZsX@LT-Guozexi>
References: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NNt1TDPmsCHksvhqgwcUQlsjkKReYbqTHTGx2NADfmIHTyCRbcsgUJSm
	j55BSnZ/3CFe/UyLd0Z8rSTg45doZKGq5A8EERAl2iA2Jok+77boh6gvv+POGcyMb8w46DX
	rXU3Wch89k5J8gVOlozCjs2dtPErn+Fvf+JlZwZQYoEp/A/gsRAHYqWq1mebweSIxrVRXMD
	8ODQmaIAWaxIqnC+PmMMhnAGYzdxBMgGFLwwkUZfNMtg2C6Z+uMRUOQ8tK/qdke6SL4gdnq
	KPVogjSriFNnTBrcoSQOEByZoV6fP0SJaPYMNX7OnbF9jrEtBJNeVNlLEthmhxyU/uhXNGS
	9di1XQS1fw3l9fZ16ICvZ516vjL6V4pj9sfkZU1S45mN4sd51bqjdL1h7r+c2gE1vy0E+CC
	U7j1n7TgQvDqZz2jpqoWk27DqvnhgLLETW0ctRDyKMxOci8+bURNDO0Iuf3rgkdtc8MFgMc
	/1kcFET+Ucwq8jPdcMbzqFEBV1oKSM8MDh/IG21iTKtktwl64NmtKrj2/9dIJWXag0wltbu
	qalakYhgRcdTiw6VCTjDJAqQVYqdbYA9xebmaSoChPWLXXNywoIQVfiA1ipXmLSNTlcevCy
	3wheNcZsTg8LHmbhziIaNnkmGre1Jd7j0gwuvLA8nHjYGkNqjy3Of4hHXG5MoIiaTxx/FlX
	qf1tcWNw84ApRa93FTxlV9lbSZG/BOWnSzLcR6wgTXiRSfJTETKz1p5RxMBZKlja+gvt/Vo
	D7QSjpRswuN22LVP3jVldRgK9fNb2P38J9v2ZVIcUr7GEpwIzSKnD/nfSMFYH8JzjCM2L3z
	mjD6sdsQe/I2+K1DSc+z/VDGDTm3SVd/ajOvPh6pB4vwonb2RCVCw8rZIimUZhztlpApK/S
	Zqte5tL0gnqqLxW6QduaJtWLug1Gj7ZMaVh48i9hc2FepEzFgA6Mabo4mYmEc6uy0W2DJtv
	aENXAesO95Dg5PsyNzgdejLl6+pGWTQvG1dzwQmdy7hebpIdx3EwG/ixToRF4EonYK81stD
	1ACX2FIi1pH+45xbKDKepGEQGk4WQKCyrm/KKljlfD2vKZukyYBWkJaVbLIwcM5aIM8E20e
	+Zj1/TDfJ5s
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Wed, Sep 17, 2025 at 11:38:13AM +0800, Yixun Lan wrote:
> Extend the K1 I2C properties by including generic i2c-controller schema.
> and this will enable it to do the DT validation check later.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@41' were unexpected)
> 
> Link: https://lore.kernel.org/all/20250825172057.163883-6-elder@riscstar.com/ [1]
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index 3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3..226c600deae142413277117e25baae09f0918381 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -9,6 +9,9 @@ title: I2C controller embedded in SpacemiT's K1 SoC
>  maintainers:
>    - Troy Mitchell <troymitchell988@gmail.com>
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
oops, I forgot to add this..
Thanks for your fix!

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>  properties:
>    compatible:
>      const: spacemit,k1-i2c
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250917-01-k1-i2c-schema-faf6715d7b88
> 
> Best regards,
> -- 
> Yixun Lan
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

