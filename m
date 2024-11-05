Return-Path: <linux-i2c+bounces-7782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4739BCFFF
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B485B2294C
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 15:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CDF1DA60F;
	Tue,  5 Nov 2024 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnKCQfcj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35451D9A6E;
	Tue,  5 Nov 2024 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730818967; cv=none; b=FyjrSIkbUcuEQNNDBjjuwws8PGeJpIMGw+Vpxlzw6dO303BtDBPAGigH+su/1Jrhorvt2eAJWZW7BS50jACjUnufKMhgNvepznZKzt/0vcfaiKLXiGsQ6Y6olDABk6Y6PD0c4de75+EghQfnZBgimfgvAeg4UfAGZx3l1fwBkR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730818967; c=relaxed/simple;
	bh=F4WltQA5cg1waDpTGeUJMLZeM55/Ra2Tw+9xSUZNrPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oga+wL/TZUxnjwsN48BzHxveqmp0InOGh8WGuoGP+G1jgukidFkwp5NEaLyIYKR9ubNCfIk0BP3J/MmlSyPpMYbijjLdz0Zs6Yk/cHv63vlvjLZUJng2w9lazDuUukVi1YXRIAqSntBpWsKA0llXuQgRSU9M+BviV8J4mJKgJaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnKCQfcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F37C4CECF;
	Tue,  5 Nov 2024 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730818966;
	bh=F4WltQA5cg1waDpTGeUJMLZeM55/Ra2Tw+9xSUZNrPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnKCQfcjgccBD0sDZsefLbxoJ6gIKqphICvj9eBlJCI40IImHiiuETIG4v+5lI39n
	 UFvNzzzq5UHQ36Ch287qG3mseAlo4zKR8clCaBZbRXOC7xMA53KWoro8XoXqT9Y5IJ
	 c99VsROCKwcUtr05772b3TYBpEvr3moWV6e9wInKKrnThRuLLa0U5DJFKfVcJltiva
	 HFyEQ9wX4EaxKFrXCqj2TS+3pQju9clS4WdZ5MTdZgcsU66byoRIdpE8J67GDxt6yK
	 8AuylbZ2Eep6jSfmCQMnPKfcmctQAdnWfpCVs77n6U8JbWIxcSddPVU9qxQkMza5BW
	 23o7+FZF2ojCg==
Date: Tue, 5 Nov 2024 16:02:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH 0/2] add I2C support for S32G2/S32G3 SoCs
Message-ID: <b2nsny2ipcd37ke7jzbjptal2b63lcss5gs2galrdfqdu4u7y6@v3swrb3vzs74>
References: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

> Ciprian Marian Costea (2):
>   dt-bindings: i2c: imx: add SoC specific compatible strings for S32G
>   i2c: imx: add support for S32G2/S32G3 SoCs

with the change proposed by Frank in patch 2, I merged this
series in i2c/i2c-host.

Thanks,
Andi

