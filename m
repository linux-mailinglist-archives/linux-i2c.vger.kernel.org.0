Return-Path: <linux-i2c+bounces-3116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 462228B15CE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 00:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F21DB214BC
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 22:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286C815ECEE;
	Wed, 24 Apr 2024 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gglyjX2m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC366143878;
	Wed, 24 Apr 2024 22:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713996460; cv=none; b=ic3Zv1h5TcH5bNPt3EK+txUeql7eJ6jOC5RZXA1RHGNjGnXxPFUakHMJisJ/c+kjhHrCr+DODzq7I+5y+vqWz26nos4Ht7+tS6EmHznOcsr5cdLVttM9XUltxncgiTPq8fwfxh5CU5nnpaC6rZMYIvrIXe1T2Ld5G06Y8WFXfoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713996460; c=relaxed/simple;
	bh=/DPND3sRbUXqaVE2P6wR2XgSsepaOJWscaAY5a5eyRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5qyYDZFj8Ivo6sBE9ry+JDqGRS4TU+MFmoOU/FFwCVDHdmCyTWjINtdP4S5/WXBUOC98FjoP65cFDCQKkvgs4/GKiX+pj0UeIIZq6e/0AsBHonCEf5BtN5xtPsbfKFj/9QjFqcqnezBMzSriCdvDgCerjYgxanKP9m2SjmZlK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gglyjX2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB78C113CD;
	Wed, 24 Apr 2024 22:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713996460;
	bh=/DPND3sRbUXqaVE2P6wR2XgSsepaOJWscaAY5a5eyRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gglyjX2m1EEcHcu16zyVOtVS5vT7Ft2xxOvv0GSxSJEEwy0Y8VvLmvArojs/uNBtD
	 OmJLT2dN1cUfnFl5iV5SDSmtQ25fjK3YnthCvaRVCFYjgGs75DURIxJvdAtMQVX9oS
	 DVP5m84/teTSf10XHdMUx9u4PnwaF/kZViVkIcYaZF7y3fcTMzjTevmaIprYZCMhmX
	 y8FlEnZYDq0j7UIjX90IXodcEQ+mWOiJQISuavS0EsWNXKvHMMDzdm82hp4esAtnmH
	 Xsf2yEpMjSNWtCCkA8tVFXzHV4bbM3S2cd/ybS8+x/GAfZ8rULp98vC/6MEihLZkX0
	 uAZd8QoU3GrLg==
Date: Wed, 24 Apr 2024 17:07:37 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jean Delvare <jdelvare@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Lukas Wunner <lukas@wunner.de>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Andre Werner <andre.werner@systec-electronic.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-doc@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: hwmon: Add infineon xdp710 driver
 bindings
Message-ID: <171399644638.795828.16272649417536972099.robh@kernel.org>
References: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
 <20240424095604.3425857-3-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424095604.3425857-3-peteryin.openbmc@gmail.com>


On Wed, 24 Apr 2024 17:55:58 +0800, Peter Yin wrote:
> Add a device tree bindings for xdp710 device
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


