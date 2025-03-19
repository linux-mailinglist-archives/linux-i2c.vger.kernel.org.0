Return-Path: <linux-i2c+bounces-9922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9BA69C22
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 23:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59E208A698A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 22:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273AE21C18C;
	Wed, 19 Mar 2025 22:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHURJnhC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078021A453;
	Wed, 19 Mar 2025 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742423719; cv=none; b=nLc1PTE5XSZZKlTYbYrj/WjczIFzlftWyY38va44SbK72IpavRRR2VOWvnL3bSF9cWbtIxkX16veglAbyDv38LwMONc85zBcLdjcQTZWgcKzRXwasbQYF8UDgJkmmeN2y9s82vW5hZsW/J1LIDntPe6c4AnnGOSIILabkRO5Bn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742423719; c=relaxed/simple;
	bh=A3iFvLtzRQh3dCCRxhX6u7YQ8Gd1PwoaAxY//GmR/TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/3T08PJ08O+6k0pWF1NAA+u3XNzO3E3TbsKMACScfU7woYR6iBzdnyjCTw6qKQvQDLGfLdzkQhoiRlvA63DyAUEuLPbhrJ3IDbU5jWLCHBYB0ZqalXHLc3IyflqbXPZjirK2bag+WqUukr6dnchs0pIniSig1jOoQDiriX5x90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHURJnhC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3E6C4CEE4;
	Wed, 19 Mar 2025 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742423719;
	bh=A3iFvLtzRQh3dCCRxhX6u7YQ8Gd1PwoaAxY//GmR/TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHURJnhCKSyrVQ20KD3r0sewq8kKaaO367PBbxMkBo9SGGZ8/1Mjl2vcTss/1dENx
	 C6g1t6n8dEZxREdpemXmfcs4lQUcHsq/z1FR/0Y+3uE5ZPGaM3jRIxQvpjtSeeIeK6
	 L2ZKXw0ViST+8qX4SlyBRJAww+EiMFSgF/nG4ACH92iTQm5RstBdIxM8he1u/VnYai
	 eS+gh+LTJv2QyYaY0R7OO7JJzWmmwPZviIX0l6+tnGC7rRfeHmDN1CllPSeHpwI6F4
	 pYuNSq9k284eA6rDy78Gwzu8iTSsL87hU9uyfOtQvqGuwy4E8dnh7LlFOpSLcEt/r9
	 LlSHIEnR8MAJg==
Date: Wed, 19 Mar 2025 23:35:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v8 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <iyefoqhlel7dwupjiidn2hcibkk6ooxcwpyjrb53f4tzup7r4v@2pl42nbgifof>
References: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
 <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>

Hi Troy,

On Wed, Mar 19, 2025 at 05:29:00PM +0800, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]

please, next time don't add the Link: tag here, I will add it
myself via b4. The link is not even correct.

I think this confuses b4 as well.

Anyway, I merged the two patches to i2c/i2c-host.

Thanks,
Andi

