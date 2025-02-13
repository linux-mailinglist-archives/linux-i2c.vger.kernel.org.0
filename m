Return-Path: <linux-i2c+bounces-9446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BA8A3511A
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 23:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7DC16D3ED
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 22:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A0D245AF8;
	Thu, 13 Feb 2025 22:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp2fwWSP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9144C7C;
	Thu, 13 Feb 2025 22:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739485164; cv=none; b=P05gC7pBZyDs6gJDl5tfljVqMN58XiZbWZ0pSb1esw+4IgyRdcgAp9EzL0Q2yyPDTqnmMicvYHDDdOCDciI0lWIor1g1lpt9ZN/aqUK8u/aZs8/LZLrrbTKuOcit914Uj+rHt3a4F8z9XWbWCGBCiUJJyxpfMziDp/7Omag7dLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739485164; c=relaxed/simple;
	bh=kDP/eSc24qynCKY6xHzoOx05vk0vadh4xJTRxqwXXKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYXBqEQKiLQ8/qNCg9XGMeVtGYA8Ertn470xHUQkMSn0byiAaq3SySnxqO+Kf+6lD+cAGMPKOFyvudZbuTA1uIvpNhzLdw3ssCjSTZzTFYcG/yv7T884QwZyaq3Y4GjeD9uSwsqkGCFeAwYWixXBVCqNv5nUyu3Iifk+v3Cght8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp2fwWSP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE1DC4CEE5;
	Thu, 13 Feb 2025 22:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739485164;
	bh=kDP/eSc24qynCKY6xHzoOx05vk0vadh4xJTRxqwXXKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mp2fwWSPgc0JF294KS3hLdYPPtTxSzbLekrZWtw4nJJPDnbp5+wdDT89ExYzKvh82
	 Trimt5d0tpe1upaE6xBvdIj9oYoRjd33YPVWHb6lfqOGODvJeMq6LsvIVRU0vCNIYl
	 ETiv6ZSGYdJiWxKDy6tc6eQiQVjbykI5o6+1llyGuap4pr8UJpGmBVpTbFXT+wjhtO
	 edivBAKiDbxEUy1bjVpNBRP2aX7LGxKlYTiVVDduKZmyqXQixACpN1zlGvya2JL8kN
	 V//UL2ORVE+fq6o0zfOTBtQZ7GGqVNtS5Uy9hgYtGgdV19Za/vpAo/pPo9WRI7OQLF
	 NRh7uV3dG2/4g==
Date: Thu, 13 Feb 2025 23:19:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] i2c: octeon: Add block-mode r/w
Message-ID: <seom4yspcjnmdxxwn6wuyiqdy2ywpna6nw4rn36tsqinlncbca@jdehzfnznlsg>
References: <20250120023327.2347863-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120023327.2347863-1-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

> Aryan Srivastava (2):
>   i2c: octeon: refactor common i2c operations
>   i2c: octeon: Add block-mode i2c operations

merged to i2c/i2c-host.

Andi

