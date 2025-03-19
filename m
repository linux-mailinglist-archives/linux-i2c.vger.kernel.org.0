Return-Path: <linux-i2c+bounces-9910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC95A68921
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 11:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F493166EE3
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 10:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B02252901;
	Wed, 19 Mar 2025 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esiuPKIB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB21F4CBE;
	Wed, 19 Mar 2025 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379067; cv=none; b=FBJv3TwFdoY4F30B1gCjC2Wqbv+s+YmsVEJm4FnrWcwIxjTCdadFr9wL00n2G95nVI5/Z97F47zCt/pWK2jFMkUPboB2p1OYQkDSDVE4PCcHiwQZ7urdDPRuUBKO5w9jHDuS/HF7DsdGfWC8SsmYtyz2gsjmMXom4y3qIFGeE5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379067; c=relaxed/simple;
	bh=J7lDusEhyFVBUCt0DbwGwbatIfq4oeD6ugpSusq1F8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7hlJASmiY/6qB4QG7inV7+88jsWbL9av1bcPtTh/FlLfskhdFmqS/qD18sIZBbrXn8bgcgFXS0NkEDq8RxLkVVE55JwSdDn01Z6jYZm7DCMv6QROevlcc+ryGXcXnZFqD82TyWDIuUSMgqpxVQciuvXBqWTqraCmxzwhZzQI1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esiuPKIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAF3C4CEEA;
	Wed, 19 Mar 2025 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742379066;
	bh=J7lDusEhyFVBUCt0DbwGwbatIfq4oeD6ugpSusq1F8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esiuPKIBZFnKnARch6KmA/f5BHQpFlcJZO81OkNXMYhskDfeX2gvmEdb50Svuyuqn
	 foE47+ekxsHmiSK4XO8WAMVDA3INIgjDA3qw9VfqIWorq38vuvCW7mTgXHF/xXt6Jk
	 62t1/7fDP/13jK8bGD674Pp825JDWTZMDDaroAXLuqw5DVAH6yjuihTFKVSLTUd2oR
	 CioKCtTEGfpw/o4cTEwkbVJiqXPTYrScGz2Fg302Z3DWMDsRvibdY1lJgSUcRn1iE0
	 V5dxJS2NX8hmvTbxT6/D4ZEI2JFuQA0QR9GhwvEPBx2mbFqdmlGBgZkDmLqTsX59d7
	 DAdSMHLmcyVew==
Date: Wed, 19 Mar 2025 11:11:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, 
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	jmkrzyszt@gmail.com, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for setting MUX for I2C lines
Message-ID: <2tadkkxph5o7wuj5fzd37q4wnv6jgjgvaqgnanpiy3mgt6wasf@vgvpu5fkvpdc>
References: <20250318103622.29979-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318103622.29979-1-j-choudhary@ti.com>

Hi Jayesh,

> Jayesh Choudhary (2):
>   dt-bindings: i2c: omap: Add mux-states property
>   i2c: omap: Add support for setting mux

merged to i2c/i2c-host.

Thanks,
Andi

