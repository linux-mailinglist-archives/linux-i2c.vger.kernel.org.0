Return-Path: <linux-i2c+bounces-14163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93776C6E664
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 13:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B17C4E754C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 12:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F84357A5D;
	Wed, 19 Nov 2025 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="E49KPFCX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D3D357A5A;
	Wed, 19 Nov 2025 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554307; cv=none; b=tTlPxSyE5xj0cmec/BhVpzajjyD9WWHvHDrzBbLLG4ZqYj4gb+5byQeuGw0OGMsSXQT4XZ2rab2kE+PpqDWA+ITbeq/VaZbW5KdBdiWZAy4JMGTqPn1M17dstGYPPhEMahrJ/kFdr/N0irciflYAeoO8uZQVpnB8miZfrWS5Ezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554307; c=relaxed/simple;
	bh=n5mJzyEJpZf6fqalF9hIXzkxFJSVhz9cDOeea883DRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWkSE1GGLKDXeTABijy2n5CiWrqal1yozeA7VVPJApdZ8kCJ2HN+4RCgclc/wXw7n0kj+0fXpPDUBKEEOoS6MiSSkZvywtjH79oFQ1rZ0QVwEDoGBxrCBi5sc+bkwAesujxr8HJzkxgnL1Tv/0caz2DYJjFRKDNMEPIOa9q659I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=E49KPFCX; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763554219;
	bh=bUQYuuw3y4ylwNNm7Ww+mTzQaIT4JX3LMF2wR4G9rGs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=E49KPFCXn0Bg1iNI7syy2aazbMnhvuCC2xOsPmE47MzAT+FtCVJ7vOt0hbDJylx4+
	 Ry8lSSLnpbntep+ivDAAuZRr3mj9hio0U7YDnjXqusvLgGYK9JmVzYffXQobbSa+Nl
	 181cJW09Lnm+m7POKjxsjs3Wm1YSSMkvDMEsKx9U=
X-QQ-mid: zesmtpip2t1763554212tc95165fb
X-QQ-Originating-IP: aGGf77+LuksBe9vkhr+82kA7Jz0VRutUqIXAUATstnM=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Nov 2025 20:10:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14706882879652884450
EX-QQ-RecipientCnt: 18
Date: Wed, 19 Nov 2025 20:10:10 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <676C7338FF05B310+aR2zoh1uDortXS9h@troy-wujie14pro-arch>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
 <20251119-i2c-k1_reset-support-v1-3-0e9e82bf9b65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-i2c-k1_reset-support-v1-3-0e9e82bf9b65@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N4WhQbLQyIqSygHmBIqDmq+iB2BKjHgA6ta1L7S3xu7e5V4hQFJ7WYVi
	XsCaXMC9FMsZZfbRIVzvS29JRyB18nxw9Q6b0w3PoW3r5nNSH9CzhH/t1WVuUGq/SKr9L8O
	qQ1PcfsfWM91FZvBdCsQLiwsiDLQHj/8JG8PvACW9tPxSLlM3RtulUCghpBRbTrzVFdKNrb
	2vm08DsQkdKBupfXRLRCUPovgJKHbUW6eAlMEXNWzwJnb5OYB2/uOeprvKtwcLFpEbnMcGV
	vw7KY2tJNWABT/9E7T2L2P3cRF5YcU2T37thq9SFdluDhGdDTPwPRjECzGp37xKyDw+Pn+1
	4s10lbEXbcHhIE1MOOA1eIfFEDBAgRof0YSjnIY9k27lpVL8Vi41xVpKB+sUBosrf8gMSxV
	RBt8Ufxd+kNNw+dwN8CzE24rmntU9gaqAFPT3RbM9pzEvPvgLVP06xB41+ohBSlgxn2BlDt
	FWgA0jS5DcwIlSnwc8sQFaOGSSY/yHQh9VaWU/+NLuruIuye6vhyaPTeVbPiqvWsj7Lmuo7
	fyHRq2oPggT9lRDeIz4ZoTssgV8DAfWgD0WHS7AGi2lUG54nIUktItslp/g1co4a8/Cq2Br
	B86l1TM0uABxZ7Ag52R01Vu1RjdCtQUszrfyADrh4L5iMuNOZADaH9zCvgweFqoH1sINyod
	s0ey7YbNptNnlnnh7DEgt3lBnpeFQG5qoyfzsZRiZ8WNJoUMQOMfkRh4Ekss9+08VNXDanr
	fE/Eprsr0qJ/EEIyRZOC51Lgc3dIZAJVmFeSExIO/b7WLcND5H2oFuCDhXK/JpZU1Pyvxei
	E8tT4JguCcowx3YviyvNlshYgxrU0LeMe+F5SUDI+yXzri9jSCe5ll6AR1X0y5m4K/A/JPK
	sPqfuKPmEFExU7g7jolnqSkgsveBoySefbimVxU0QFQwMYDCWTbb6Yz2Xkz0rmP8AStZb+R
	rrSXZ1vq5mnl45WwYRgVc57CS6zWlTL5YOSkYTa9F6VXBuOUmzdxMcL8iEcukSdXEH6//i+
	L+NZFs04EhGmxSt7sS3vf6AR4hNZerO6CPeJFWVAdwRG4OmASX6Wb84pwwv9FGSRNvA531W
	3JnmmJPBF9qoV/EYviu5qiYFC3N2GxJqA==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Wed, Nov 19, 2025 at 07:46:45PM +0800, Encrow Thorne wrote:
> Add resets property to K1 I2C node.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index af35f9cd6435..2b84dc276ace 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -468,6 +468,7 @@ i2c2: i2c@d4012000 {
>  				 <&syscon_apbc CLK_TWSI2_BUS>;
>  			clock-names = "func", "bus";
>  			clock-frequency = <400000>;
> +			resets = <&syscon_apbc RESET_TWSI2>;
>  			interrupts = <38>;
>  			status = "disabled";
>  		};
> @@ -481,6 +482,7 @@ i2c8: i2c@d401d800 {
>  				 <&syscon_apbc CLK_TWSI8_BUS>;
>  			clock-names = "func", "bus";
>  			clock-frequency = <400000>;
> +			resets = <&syscon_apbc RESET_TWSI8>;
>  			interrupts = <19>;
>  			status = "disabled";
>  		};
Since this patch has been merged [1], you can add resets property in all
i2c node.

                                    - Troy

Link: https://lore.kernel.org/all/176294559674.467363.5417599191009488468.b4-ty@gentoo.org/ [1]
> 
> -- 
> 2.25.1
> 
> 

