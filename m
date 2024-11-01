Return-Path: <linux-i2c+bounces-7709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7739B8BDA
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 08:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CD2282ED8
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 07:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069C7156649;
	Fri,  1 Nov 2024 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOb+4i6U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDE14F9F8;
	Fri,  1 Nov 2024 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730445143; cv=none; b=McPlRVq5hv804ljR3mUBmdJNaQ+l3KXQXaSet/G9p2rRaPLrwvVTag/p0npdxEUbOI0FFBP91GH0j4pNIR6C6W5Lg3ANpFZ6Vp3J+0EkbDCedKjy81i75nls23iud/H6DD0LaW1J2rkl3natwFjLfmnTzd916rPQxdJun4xZAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730445143; c=relaxed/simple;
	bh=dWCKs0aRQFm39+oKGSqLft+Fhb/qVC99EUYoWJQ/GZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Se2a1UyrB86LVmToIVTXGHDhEs3tNYlpveeLD0bKL2wz9VoibSa9EoU6wHaB8O6BE1sUmZ9ik7FOFcI96jPFnx6yDR/QSjvuVHhWU2MlEV5LsSbzwgwI08DcBUGuRBRpoTiymYTGEvf9mw4cozB8S5GeZWh0ddaKbPNv3GaX80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOb+4i6U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460E0C4CECD;
	Fri,  1 Nov 2024 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730445143;
	bh=dWCKs0aRQFm39+oKGSqLft+Fhb/qVC99EUYoWJQ/GZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOb+4i6UJfOWCdEVLOIYgq2VdWt6XSJFzyxtN8KLZ5c2omHa3V/NDrUcBCVeNDTGs
	 wdNEohgV3PZMLyWPd1i+6iksF/vZwvqxhWmE1laJ3DFLlxZb1kLSej7iNZPvZSCnwY
	 Ep9TpjN5Q+1yexuf/NwqHVG/xKkYKllL6xpdz8WjUC/SJ0HAJKmozHB4Bvd4NkywcH
	 tpGKQhrLu0sPh4fNULVXa/wlZ+kyHWRZ7iRoJlwRf9uhfc81if1Hs2bAfKcN+GbbSF
	 R2vZ1R5WbSh1CB5NvRqQGXfD6pdYimo5ObamM4695dOP/oL98fbd8VPhGO3Tynkf7R
	 xGuFi5gqzOFPA==
Date: Fri, 1 Nov 2024 08:12:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v8 1/7] dt-bindings: reset: syscon-reboot: Add reg
 property
Message-ID: <pn34ntvni34erkws2j4xjd72w3umb7liin62ru6wpls5w6ktzj@7oopreffqyul>
References: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
 <20241031200350.274945-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031200350.274945-2-chris.packham@alliedtelesis.co.nz>

On Fri, Nov 01, 2024 at 09:03:44AM +1300, Chris Packham wrote:
> The syscon-reboot binding used 'offset' for historical reasons. Having a
> reg property is appropriate when these nodes are children of a MMIO bus.
> Add a reg property and modify the constraints so that one of 'reg' or
> 'offset' is expected.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Notes:
>     Changes in v8:
>     - None. This has been applied to by Sebastian, I've just kept it in the
>       series so that others can see the complete picutre

No, this only creates unnecessary review / traffic and might lead to
duplicated patches.

Provide link to commit if you want to give a reference. *Never* send
already applied patches.

Best regards,
Krzysztof


