Return-Path: <linux-i2c+bounces-2142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9471F86FEFE
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 11:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 500F92838DB
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0E023758;
	Mon,  4 Mar 2024 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RPoGrPO7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8C224F9;
	Mon,  4 Mar 2024 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709547907; cv=none; b=C8+jOb2QEcxPd22uKMBZf9iTtSJ5of0L7QxxxOJqYRr2PTdv2Ckhm1HEZb+L8P3W6Y5G0Tn8qThSfyvACNTyhDxA4Vd3rPjMn70A0Xb8zV4r+pcLxAlV+/V+PcLurM0ftWvNMaNSOwUy8zjDy5TAQiNBX3np+PYAD3N3Kh6KO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709547907; c=relaxed/simple;
	bh=JaiQtaNF1/PgiFULD7NI+iEq6L97TrPELreOk6gTc0s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=I68p49KY3z5cPOvf4BIUO7TxxVK1Hdlg5AY+7tRMQ+tqT36U5WtamTxKa1/1NZ8EpXyGfPj8/pfqZAlzEcATkEyLsacHeFs/uuUCGcfCWtvvN84fkm+OFQzjiMdxSSnnV6fFDaoMK9Ym4LHSptpdDrAv/FD5NMVdD4erMEBs0qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RPoGrPO7; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E501E000E;
	Mon,  4 Mar 2024 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709547902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDbbLkFjebj8+McjyxGMYNN3BxKTit6NKZsucO65PPY=;
	b=RPoGrPO7U8YgQEss13LXMhj1Zf1cj+cdcgzouTr22thcSST3U8FnIxIfor8Ld6HSh8+g36
	kS35ZYtx573ne6YJBMOhACPWyORzcoVpghTkShf6EwjM2j37mKETNnt7/XSvqBQHiWIGko
	h6QJTyDemFbvYIqEPK8EuYe3p+p68MfqBQowBsfW9eHOfmXVvF3HqU5zSkIHKPn9x+LVfK
	0TV+aJmRoaDMZsTB+277uxRrNK0CVCdGFPO6SrcldIFyd4tKlMJE/YvqeLq9ivV+6kdY6n
	WB6ZxXSOAlAdUxdoAwawiJI0iLaxE89/+M46GPh0al9+MA9nFAU/YYbd+ytQqQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Mar 2024 11:25:01 +0100
Message-Id: <CZKW5JVUA93W.30NZQ9289BXX1@bootlin.com>
Subject: Re: [PATCH v2 09/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Wolfram Sang" <wsa@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>
 <ZeWUF4P9CcovI3F5@ninjato>
In-Reply-To: <ZeWUF4P9CcovI3F5@ninjato>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Mar 4, 2024 at 10:27 AM CET, Wolfram Sang wrote:
>
> > +	if (of_device_is_compatible(np, "mobileye,eyeq5-i2c")) {
> > +		ret =3D nmk_i2c_eyeq5_probe(priv);
> > +		if (ret) {
> > +			dev_info(dev, "%s: %d: %d\n", __func__, __LINE__, ret);
>
> This is debug code, or? Please remove it. Especially since
> nmk_i2c_eyeq5_probe() prints something out on error.

It is. Nice catch, sorry about that.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

