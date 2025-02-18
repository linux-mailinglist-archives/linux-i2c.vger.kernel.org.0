Return-Path: <linux-i2c+bounces-9488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24151A3ABB5
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 23:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B535D3A6B70
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 22:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3E91ACEC7;
	Tue, 18 Feb 2025 22:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWdX7jDj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3162862A5
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 22:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739917922; cv=none; b=LBpfdiZA6K0pWC+yGTn30BsJEpiFCi2rlqLVY7qTH8ZvQq8D410OiEw+qD41WPLnSwqRElh7uLAZDhy7pkDgTzJbrDkh+ySmlneny4AL7NqAhfBkOSePUsFkSB9xTryRN+Y2lRJNTBk/425deEjWrJZ9Vc0+UYcnwTjZYONSyv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739917922; c=relaxed/simple;
	bh=CSPuGLefOb7oNVnl6yPdvdlU849jdxO2Kw9huBTNbIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmWZ6JIsybDob9asrxsuozStzpgfI+XGJWnjYWDuy4uwlRJAy55k4rzijG0TmrmbPamNrfZmUrMcz0yP6mYi6515QFErrwUE1OaC45i1TNrd4Icx2nWfp7E8TnPJiOsny+x6xewwKmZNFW3SR9mhUag+4Rg4zvv+T6WIeIPhixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWdX7jDj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EA4C4CEE2;
	Tue, 18 Feb 2025 22:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739917921;
	bh=CSPuGLefOb7oNVnl6yPdvdlU849jdxO2Kw9huBTNbIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWdX7jDjkCT5u2Q94kL17vplpSIYBLjXLkjguEyBCnmO2ttsD7m61VzdJ1g177Hw+
	 QbLwBGgFQVKX4S19G0xKktdrzCYFA0HDT31CSC+hSNDXL/2FJL6uuTl0U2zz23ZRIJ
	 BCGI7Ld5VFOVNUfIluPc48KyoSCzF714JMmBp+pfXCunlWPdWhFm4x/shAulzLqHim
	 +xSHUSUMOVm3S49IQ5NDW4tCl8sRgdQfbFH9P3NMT4/jHgjyq7HXnw2kv4mNbodLpv
	 Vi0GonOAmxqvmki4gTlJxyE/bZJEfxzC9exRkh9d2PiMpDMF2Ph9mejfo9UIv2UFem
	 avYmHg1ad7lUQ==
Date: Tue, 18 Feb 2025 23:31:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com
Subject: Re: [PATCH 2/3] i2c: amd-asf: Set cmd variable when encountering an
 error
Message-ID: <nzfjgw7q23fjy63vzptsj6tbdbvh4m6ervlpyp3qot2aykyrfh@ml36y3n2mcs3>
References: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
 <20250217090258.398540-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217090258.398540-2-Shyam-sundar.S-k@amd.com>

Hi Shyam,

On Mon, Feb 17, 2025 at 02:32:57PM +0530, Shyam Sundar S K wrote:
> In the event of ASF error during the transfer, update the cmd and exit
> the process, as data processing is not performed when a command fails.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

merged to i2c/i2c-host.

Thanks,
Andi

