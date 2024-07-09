Return-Path: <linux-i2c+bounces-4807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B250292C5BD
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 23:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CB2F283BE3
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 21:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07ED18562D;
	Tue,  9 Jul 2024 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTWypu0p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D014374C;
	Tue,  9 Jul 2024 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561917; cv=none; b=Ia8DznRDNB2TEeIbLJwaXos2T0YW1Fzt5WK6wfhvQAtElvkj2PULJaxk+FU69tU6csWvElSvTdOu9iI4vd6ZzzO4+cRCzbiCwZl/RwstfjptgXhmvg0jVsrHvQws9bve8lIwjEAG3/lzBb80DzcpFjWhSTlORyyuAxb/u9msOKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561917; c=relaxed/simple;
	bh=u3E9WjK2FpFGHtSMN9inxFlpKk9auyi+tnBWacROzik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT08kXQHn5pJxfsrOmYwFAsr+Ax3LS5ZfnwlC7AJ927ns88cJnNBYn8tttdmFRMFUeM89Ii2n5pR1uADW766UlS7DYPouGKH7hXXOxIjxZziECyUu9GLAs+lTwIfrPN1rAPU4rhuc9aKNoIweUdm/Fv4I33tSKvywIrxu5bRFhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTWypu0p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A49C3277B;
	Tue,  9 Jul 2024 21:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720561916;
	bh=u3E9WjK2FpFGHtSMN9inxFlpKk9auyi+tnBWacROzik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTWypu0p/Lhpo9xZLDEyaClBRFDQKtxOEOnlvCWyFeNPH934Q5HaN9vTAdGsKfSHr
	 fgLdRLtthcTNcvBvvOL7a5rtyCShLq7kkrClYMyCqBic7WfyIlqERD6QadtByL1FKO
	 +qxvkZpKBwQ0CWTi+i7Hwho/XRDZkajZVckEImOqx3n5zEmExKfwCQEvu6hI2N/Nvz
	 nKjM54aQIKUX3PLyrtiBzlcwsteViyqgbQDhNjWo0NZBFfjWzOndqAuSIjBHcoK3xO
	 UW2YaOPI+eJE5x4YEkA6mFCIGcD49zrQwSP848rtaNBXfCvcG9AloD+Wz5k/rL6I1C
	 0WEAX93/T92EA==
Date: Tue, 9 Jul 2024 23:51:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/60] i2c: bcm2835: reword according to newest
 specification
Message-ID: <belszm5tmqzcbs7gniga7dyucxn4ne634d56yfintcphnto2fd@erqjbbbux5a5>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-7-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:06PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

