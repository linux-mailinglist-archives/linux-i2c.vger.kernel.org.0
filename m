Return-Path: <linux-i2c+bounces-14189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3636CC72AE8
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 08:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AC5B4E94EB
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 07:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1FA307AF7;
	Thu, 20 Nov 2025 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJwT9epb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFD184E;
	Thu, 20 Nov 2025 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763625324; cv=none; b=PN3LVxRE15AZ9aJH4BdZhfSLV3VGDqnhwlPyr6+00FfME7VoRGM4EGWS0Hqdco3sU7BegHK/5Jwvzvesi0YokWzNBkH+lT+zxqlDGFswyMaiAvY+YrL1BagCn55ZfsZskL9QQti1eq5a4Xfs2Sp40XS57cbccLcZZDKHZBJnLtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763625324; c=relaxed/simple;
	bh=3MJTLL2jvRU91p6wVEUoe3Zsr/EBDozQFEsbAVHw1Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsfzTuqdTuzgWE1xrNbr9OLhmO54pTWivYz3puRHv+xVgBggfygEroJgwIOgUL8kNKjcAH7fpUeK/Dn/ofUsVRNhNU/+DyFtpXAM0jDvgvQi+Qpmi69FeMQQ4zbiAM/KNilIBfkpcfAJnoEGY5vOBqZ+gJ8Xpy9o9GEUG6vdB8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJwT9epb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EC9C4CEF1;
	Thu, 20 Nov 2025 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763625324;
	bh=3MJTLL2jvRU91p6wVEUoe3Zsr/EBDozQFEsbAVHw1Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJwT9epbVXUn3nkO4Oyn+/pcx8uxSOzbQcz89V+Bx/++xGPVEO4WNh7l5k4NELThz
	 WGa4EQ+hCMcPRdmp8MWFTC9IK4raaK2q9PdnkhEoMCxfdTMYx3XTGBtmNeQynFkq0I
	 lxT55lVuyiuTxqz/W4yPEeS7tkHjvKc9o+UZtFtjL/WPpH0tElV22L+jbThWzU3bBK
	 bTcNU9Ngo21IxBCT9FI6lHSkv+p7zb7TEyAxHNONddg9yhjihHL8/BJRh8Mr7uBQGn
	 lkLL6VhEh/+mdlCxeeDY01qWNAzX16FCctCOSeUO8gtTU8o0ST0EuiRMOWwiRsiW/+
	 HEA/EAwuvFt9Q==
Date: Thu, 20 Nov 2025 08:55:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 1/7] dt-bindings: i2c: dw: Add Mobileye I2C controllers
Message-ID: <20251120-tough-sturdy-woodpecker-7dcbdf@kuoka>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-1-bc4bc2a2cbac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251119-i2c-dw-v3-1-bc4bc2a2cbac@bootlin.com>

On Wed, Nov 19, 2025 at 04:05:30PM +0100, Beno=C3=AEt Monin wrote:
> Add compatible string for the DesignWare-based I2C controllers present
> in Mobileye Eyeq6Lplus SoC, with a fallback to the default compatible.
> The same controllers are also present in the EyeQ7H, so add a compatible
> for those with a fallback to the Eyeq6Lplus compatible.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 7 +++++=
++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


