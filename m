Return-Path: <linux-i2c+bounces-9278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57712A2673C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 23:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2029A188258E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 22:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D161211499;
	Mon,  3 Feb 2025 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7A8sNFU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE00211269;
	Mon,  3 Feb 2025 22:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623552; cv=none; b=uqnSL+A9KTjjxV/XjBvsakJd8H68Be3AFNRHkD+Z4/sIUiiPgbNWMh+INkrJXjK83mH0Zo2EH/PFMWjuGK7tfLTXW+l8GEy5lXn1WGUq/FLsKHzcY3uusKjGV22v7ZNsNhryadixTzDWpWiokoRsUpGiCF7qfSiVMuMLF6inlQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623552; c=relaxed/simple;
	bh=Dtkd0WAYGkVPRrGF5Fu+Nq3Fzg/LXYPrWsGtnHhnbJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldaZWRn8ddZ5MXxKGnRErepDqc7Xzqhtpw76zGOb6gPYhD8aeP9Kck+gDMdoqjCa+SzM9Gqe4o54xWy4zo7yZ1eE3ACZFfkux2Shi2xsoPwGn9yP3PUh4gAJ31BXMex5YELGJtkNN31IuezedEF2bgvPeYZ3AGJ3/A02DGKld0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7A8sNFU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1626CC4CEE4;
	Mon,  3 Feb 2025 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623552;
	bh=Dtkd0WAYGkVPRrGF5Fu+Nq3Fzg/LXYPrWsGtnHhnbJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7A8sNFUcxgG5i5mMHwDV3zrzzvcC2UMjjKDF3XYf9iqT0dDrKSj8bIRWo+VSXNUh
	 rMgRj7CVJG95Wa4T8uxdE7BO2gJmb4NMtXsfmz54K4omzFoKfePZtIcs1KI11PZkDW
	 4V12B1RN9lmdTkRqnIdEtvOV6XJ08KU7HXHeO2djuRkFliw7pVj68QPRU6mJz7sPDx
	 Uvvn/Jcy0F7PSUFEqs3ST27/9syZdTK/632zLd1ms75e9u1J3d8ickTLFJsl8Qmn2/
	 SeWX3bMeanPEStNzgXVkdHXf8x2qCeU6FkcRFbklIMU93uwBanfv6fiPbT0ANjO88R
	 Fe6Afb8x7hu4A==
Date: Mon, 3 Feb 2025 16:59:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: linux@mainlining.org, andersson@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, konradybcio@kernel.org, brgl@bgdev.pl,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C64F
Message-ID: <173862355055.499815.8730288713630470551.robh@kernel.org>
References: <20250203111429.22062-1-danila@jiaxyga.com>
 <20250203111429.22062-3-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203111429.22062-3-danila@jiaxyga.com>


On Mon, 03 Feb 2025 14:14:27 +0300, Danila Tikhonov wrote:
> Add the compatible for another 64Kb EEPROM from Puya.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


