Return-Path: <linux-i2c+bounces-10777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 644AFAA9CF6
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BD151A807D7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 20:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF89225D539;
	Mon,  5 May 2025 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOo966Ko"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66081F7575;
	Mon,  5 May 2025 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746475470; cv=none; b=ehBxhFSnik9XatQLUAgYzjQpemMkgxwWmkpUz3b0k5T30eCdUNkFsf74WYTm5Sl6CCfoQ/qVUBAmbR141SSSJF1zXT53z9oIOAugKDMFQHnCc73jA29MRWbe2RbYv3ebxcnD+0TzjPjgN1XVcAua3A7FiWYSPLWzyDHjVFRycT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746475470; c=relaxed/simple;
	bh=g8P/5YESNc2yPifNkAcmzvCrXKnr2yjpGlHFSKAky70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gekMqCQcM71swDpvZWnNud65UYAPjLM0Holm4cySGczBbq5SwCux9kXjS0nHSdvhqmVVZrDBJRNoEksognZIlipemY7LVB7NxFqTze7gSgsco+8bPFHAu5bFZqOaRz+tSGB1llHsrVR+fw/zN1H50N5z5b68f6mR9h9u7/Hqk6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOo966Ko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD546C4CEE4;
	Mon,  5 May 2025 20:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746475470;
	bh=g8P/5YESNc2yPifNkAcmzvCrXKnr2yjpGlHFSKAky70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOo966KoK/I+4+9rci6oaQgOmrGGUUGC84XI/ugfAv9AZXApY0dciw7PSdcrXSamx
	 0M4bT7YdUe2SKH6O3BUbGDHhPIwsDG5e+V+lGzoRwS4VcuyWnYAHxE/kjmQyTb7KpQ
	 20/TKT9hwL4ih/D1tNzLIl8c0rnM5zEV8aUjJ6CgSIbVo2nHLBky56ixO8JxhHol1T
	 LJrmQd09Nck/3HQytTQR7vsOebZSiZ3bVeeU+0c3fVuK4INPEg9NnRjjIstAQE7BYt
	 N2tMdAWbkaOAIg14+HKYCLarwZbETHdMYKz6kSfUQRJwVPxynr7TgTr5Y0HAACKH+i
	 IOnZRMeXPqb4A==
Date: Mon, 5 May 2025 22:04:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org, 
	prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-corei2c: add smbus support
Message-ID: <7q4gdh3jcbnsptmdv6fywnwqta5nekof4wtut35apw5wphhkio@veeu4ogcm44h>
References: <20250430-preview-dormitory-85191523283d@spud>
 <3421bf4a-afa1-4b4c-8421-bad7187d3d8e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3421bf4a-afa1-4b4c-8421-bad7187d3d8e@quicinc.com>

Hi,

On Wed, Apr 30, 2025 at 05:06:09PM +0530, Mukesh Kumar Savaliya wrote:
> On 4/30/2025 4:53 PM, Conor Dooley wrote:
> > From: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>
> > 
> > In this driver the supported SMBUS commands are smbus_quick,
> > smbus_byte, smbus_byte_data, smbus_word_data and smbus_block_data.
> > 
> Write completely in imperative mood. something like :
> 
> Add support for SMBUS commands in driver
> 
> Add support for SMBUS commands: smbus_quick, smbus_byte, smbus_byte_data,
> smbus_word_data, and smbus_block_data.

yes, I agree that the original commit log is a bit lazy written :-)

> Also mention below limitations here .
> SMBUS block read is supported by the controller but has not been tested due
> to lack of hardware. However, SMBUS I2C block read has been tested.

Smbus i2c block has not been tested? If so, can we leave it out?
What is the interest to keep it in?

Thanks,
Andi

