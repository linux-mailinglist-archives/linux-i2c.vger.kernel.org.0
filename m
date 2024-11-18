Return-Path: <linux-i2c+bounces-8032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD49D1BC6
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 00:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD6191F22667
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 23:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFB3194A74;
	Mon, 18 Nov 2024 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVNlbLU7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DD7147C71;
	Mon, 18 Nov 2024 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731971868; cv=none; b=iGfrT8woWQ7LhtxvS8lP3v917iT1/+e75SSV5uyI2zgajjHz1m4krr6XeuTokzs/CI4r1QF9KL7x8WQli50aaokTJyas6qISAdc27hVEaJwIePsofXsH7Cw53Ad1vO0b0P+nBNF3/kbZZIiiWcyI5nqXOxmhkvtlvXnNR7/ztE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731971868; c=relaxed/simple;
	bh=OvXvM2E99DSjnfFLyji29EGenbkDcaiD6/Z4ll6N810=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ijv7sF2GE/TBUNQ4/UrsBm77GfBeUW36LX6zgQZzm377kgRL7EA+CrNXkExbEmdqRCjeB+izZIS1p+HidlDc3yN0RFBJ5p9dVxUT9DERXEJhTcPHpQ+/bXKhD6PpYS55aJ++COqo9EUdNU/4CCnE32CzAghRkY4LAr2rtiMi0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVNlbLU7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3DBC4CECC;
	Mon, 18 Nov 2024 23:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731971867;
	bh=OvXvM2E99DSjnfFLyji29EGenbkDcaiD6/Z4ll6N810=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVNlbLU7uvgL1I1lpXX2yNW271jc670eqjyWSoSS7UPVU4ScBaHX3plMdtTm/0AQy
	 bgPP8RxVfjWgrkL59tqU3VJ2Hns80D2rhBsAyHL3zJTba3K8Zoupq/2Ihb7mcDTPY4
	 JLh5z1qALMvI4y42rasDHdYfh1hWFH2bUS1f6/5NtVVCOh9MR7Wo5IJZ9aM2mFha/B
	 3kYgZMs8UiMYIPMJufqmitKZsPqSVWayux60OPcBnt3Tu/0xz+o1dyYSKhj0Jv4AQs
	 6FIs6aEnQCi4BtmWtC6roFDfJkIUtQf+0YtzfWMSG+0lcXa29/3zsYij8/MblYBSzI
	 fjVV1eu4VSaJg==
Date: Tue, 19 Nov 2024 00:17:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 0/6] i2c: nomadik: support >=1MHz & Mobileye EyeQ6H
 platform
Message-ID: <gmntz3etrrxvngvp3dk5aoq65lrfe3fiulcalvx3brjj674wjp@xyupnszzsfvr>
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>

Hi Theo,

> Théo Lebrun (6):
>       dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings
>       dt-bindings: i2c: nomadik: support 400kHz < clock-frequency <= 3.4MHz
>       i2c: nomadik: switch from of_device_is_compatible() to of_match_device()
>       i2c: nomadik: support Mobileye EyeQ6H I2C controller
>       i2c: nomadik: fix BRCR computation
>       i2c: nomadik: support >=1MHz speed modes

merged to i2c/i2c-host.

Thanks,
Andi

