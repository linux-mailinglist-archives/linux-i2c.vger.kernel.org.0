Return-Path: <linux-i2c+bounces-7017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB59986C9C
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 08:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C6741C2493E
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 06:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B9A188A16;
	Thu, 26 Sep 2024 06:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quN2xug5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE80424B34;
	Thu, 26 Sep 2024 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727332594; cv=none; b=pHJVcc6pBAuLcURME5PhsD70oKDtQGEpudE8WnCj98LG1zVjtaWip/l4XrB4g5ONx7puJRRBVf/iCjjLeaoB9+7EZG5rhY0ywfoGRp5ugQC2UWsNKBbicuRZ4i9+d7Z2Ib1WhT1omNVZzTOufIX4L89cwW3tIjw8b1JTlGc3Eeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727332594; c=relaxed/simple;
	bh=1Hd7yPHNRLBMx3rZdgWLQjhQPkulNnRvK5PyNWvAHcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiKAX1ic+RF51zZ6/w2cUixP4ZTA171glcL9wvu3a/dlIwINup/ebondrW7yiJC3U1QJWIA7+jmH5OIuHU8MeHI/9G+UAXBuB3M1KjMtazw31lib80750SHNlax7AXVB7ALcKWliVF3zfx/fa+h+NanareHU3X9gULh/4wPD2t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quN2xug5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85768C4CEC6;
	Thu, 26 Sep 2024 06:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727332594;
	bh=1Hd7yPHNRLBMx3rZdgWLQjhQPkulNnRvK5PyNWvAHcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=quN2xug5ySHjsi2fKmMqNGorwKvN8ULj2JgR/uDaKIdkb13WxbKVSxRqLBf3MBGef
	 W4ZSfBjrsJiHlm544dqG1OvuwsgY2OJILYOJqdcniHtpGDvfnkn1a0+ulEUvUacTX4
	 Cy8fuZr2ohT1NtjRlBI7ctfTpRHJeDf8uR4L4N55VxCvTdo30CfANb3lFdSX8Eqgza
	 wu5D5AiqAbj7vf+GE0ZVhon2ilWaapZRzCNQZpnsh42hRmkOl9XTXwp5Lg/250wqhq
	 nzh0u5k04fQoKiu3zslHVte5YHmEob8AVeybmgAylzEY+HUXRIGkbEjSRVjsfFh2HT
	 dSlUgXpSL5npQ==
Date: Thu, 26 Sep 2024 08:36:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals
Message-ID: <4pxungrwkjusdalmjbwvqcpjwmbsb7hw4452zqlto6sq54vfa6@psz3gge4uwy7>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
 <20240925215847.3594898-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925215847.3594898-4-chris.packham@alliedtelesis.co.nz>

On Thu, Sep 26, 2024 at 09:58:44AM +1200, Chris Packham wrote:
> Add device tree schema for the Realtek RTL9300 switches. The RTL9300
> family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
> have the same SoC differ in the Ethernet switch/SERDES arrangement.
> 
> Currently the only supported features are the syscon-reboot and i2c
> controllers. The syscon-reboot is needed to be able to reboot the board.
> The I2C controllers are slightly unusual because they each own an SCL
> pin (GPIO8 for the first controller, GPIO 17 for the second) but have 8
> common SDA pins which can be assigned to either controller (but not
> both).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v5:
>       I've combined the two series I had in flight so this is the
>       combination of adding the switch syscon, the reboot and i2c. It makes
>       the changelog a bit meaningless so I've dropped the earlier
>       commentary.
>     
>       As requested I've put a more complete example in the main
>       rtl9300-switch.yaml.
>     
>       I've kept rtl9300-i2c.yaml separate for now but link to it with a $ref
>       from rtl9300-switch.yaml to reduce clutter. The example in
>       rtl9300-i2c.yaml is technically duplicating part of the example from
>       rtl9300-switch.yaml but I feel it's nice to be able to see the example
>       next to where the properties are defined.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


