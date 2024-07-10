Return-Path: <linux-i2c+bounces-4861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E974792DB5A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C1D283411
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F23613D886;
	Wed, 10 Jul 2024 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0c70xtT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97E13C3D5;
	Wed, 10 Jul 2024 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648657; cv=none; b=WGkH4eQQo7DVl2e0JS0z6mjh+YR6BcWorRZ7p5FDvVjwJBA/+NIRB7+rICKzOGWICio+yylyKgoPFJRf2WMfw73Wfa2rrpWxsvuetv4Do4rDAMLC3RYO07QrwrRZgN5s72o4T056azlvcsWLGPZ/wKmQo8APqDFG8okrRr2vQQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648657; c=relaxed/simple;
	bh=CHnXiBghSixHoW3zfLw3jk2H67d6Bu10OQZlLE97t98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0yboRUG3aOEEfAdT2HjJIfYrTxmvTgS5rqNjILQNCiDMYye7MKQN7UuRMj3P5vr4xIRCL1JPfFuw2jAdCLmUvnGaKqQA0e66qzH4at79GEiIuxc2l5Z/CSHtQpgfgElY+tukbW36z+7qLp6H3KiH/bcB8/Xis5cijXn25t9js0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0c70xtT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6EAC4AF09;
	Wed, 10 Jul 2024 21:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720648656;
	bh=CHnXiBghSixHoW3zfLw3jk2H67d6Bu10OQZlLE97t98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0c70xtTrXPu88Ecynkzj2WfAVqxL9z4jWpD2aAb69SN0taAAJYhLHdp0kEskP2vz
	 TMq0s8VlmsCS5u8CgOHMFUpoSr/yXaUxv58betqjRxfgNEet9CfJv2CmKbdYKgLbPq
	 GwZbmdJ3Xdaf/CQxaIst8ymtnEaPZOZOq5SvK7pUCv0ldK+bILLvZ8Q/35+yVH6Xp2
	 g7gmNSBM0Jes+3yrZ8s1+rxIgnPy/oYP7d4qXX5nSLLO+zY8/wp/+oCobY5rkzdvwT
	 zPzV6IEMTpDeDvsMBbvDYMnwbFh3zwhBkxs6WmnBJnU5s3uGuF2/RGSb5UilMCL6mO
	 RnIgJTwTVQZDA==
Date: Wed, 10 Jul 2024 23:57:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>, 
	Michael Shych <michaelsh@nvidia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 29/60] i2c: mlxcpld: reword according to newest
 specification
Message-ID: <x5owkczfrjf5begpwg2cs5wa2rxwlawfut6yunoels773rwdw3@tdmqlck73faz>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-30-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-30-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:29PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Vadim Pasternak <vadimp@nvidia.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

