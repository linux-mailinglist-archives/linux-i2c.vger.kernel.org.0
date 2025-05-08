Return-Path: <linux-i2c+bounces-10891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA3AAF796
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 12:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 255CA1BC2B10
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 10:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2249E1E520A;
	Thu,  8 May 2025 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/Hrp/IE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37624B1E7A;
	Thu,  8 May 2025 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699299; cv=none; b=shrRtdJ+fH1Jy5/asS2+8gqjGzYZki5W8ug9lPwY1rBoeqpg+q5PEHk7J14Ikk+WSXm0ynmjksQIfmGxaiRf2DWx6FYuDrtATyygUQd0ooxOdKCDYG/8/iID1RY2GuEoaYvbtn4Uwc2LWFmjnjZvMy/RjrEJY9UzMB+ouJYkEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699299; c=relaxed/simple;
	bh=NigE7x/6E6rUHawdEuPAYYIIAMT54gmRBOwwxdo6fy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKNDVwlTE7/WbaAHrrlZr6uqvkZ+30QlbyVdKchEEyhFLBEdbl9s+GYzI2ZsijAfCNHvNWqzFd3gLF8vy3BzEu9j4bNWNIYxbpUW/hw+ZHZ9LB+yrc+LWVVyGTGhYM3yaJ+OIQmM/DKxqYp2nUWv258baYC9QjcDKnOoxXN1Wdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/Hrp/IE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88688C4CEED;
	Thu,  8 May 2025 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746699299;
	bh=NigE7x/6E6rUHawdEuPAYYIIAMT54gmRBOwwxdo6fy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/Hrp/IEmPPSlT7dAeoIvmgk4Apur58eX2/BFB6iRIyRupslha33JX9E5vh3vI6B5
	 Goqi9m1eQRl7joFtaHEmrXrE5TnlmbK57jikQc8FzKoYsgrZDr1ZORAgInXn2uN1N9
	 tkiGmzv1Dq+Hh95VICQN6T+93wqwiCZ8uIJ53uBPJlSk/UovaoTMMmxgAbktsabgvu
	 +Q7ynprgWHfJP/g8tRY8xw0au8QbH4CprBgjwj7GAKfjTFmwBQUdPGfi1UkBJ3fRYM
	 lUrR0hDyXLutdelmVPeNPGiU2b13Wk4cPG6RzFIAsOMzjUIOC1QjijR/hoNvRpyWXb
	 d2jFssHeNY5hQ==
Date: Thu, 8 May 2025 12:14:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, 
	prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-corei2c: add smbus support
Message-ID: <pnvevhzu7jyhuk4vocul6o7kc46el6afeevwrhrytfdirhupyd@6taf66krx5dw>
References: <20250430-preview-dormitory-85191523283d@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-preview-dormitory-85191523283d@spud>

Hi Conor,

On Wed, Apr 30, 2025 at 12:23:39PM +0100, Conor Dooley wrote:
> From: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>
> 
> In this driver the supported SMBUS commands are smbus_quick,
> smbus_byte, smbus_byte_data, smbus_word_data and smbus_block_data.
> 
> Signed-off-by: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

merged to i2c/i2c-host.

Andi

