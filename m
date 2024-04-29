Return-Path: <linux-i2c+bounces-3279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 028358B4EE0
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 02:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84FBF1F211B5
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 00:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C5539B;
	Mon, 29 Apr 2024 00:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipbD//LA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0AF7F;
	Mon, 29 Apr 2024 00:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714350142; cv=none; b=SG1IEK1E/cfYyo/NO/tTWg2Nd8n0kBm3hh5zYl+PY39tgzopdak0rv/eWr17kcTefjK+kqo3zO1fng03DpDeCNWlwTFrwqzdlcyNQB3YvnNgbw2kW1+zxjGHfOIksK2yw+8T6v/yus8x+ZzmGddrejqdWDNz/uO8EKFuMhLUeAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714350142; c=relaxed/simple;
	bh=snYWhy4FkDQdIs7CvF77J9b/ql16doTSO2/GqtojXXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pct2QxkdAptfUsW/MHDW7LUBQ+nhX+SF3iHIDTvhu+R1AOmiL8QJVVcTRZMLu/OiZ5UObOPWTsVnO6oJ9hGY84MNvBxCjEgUS73aUXMJeEQXKqs6k+Xy0hpzXK7mRB44t6ZrXJTd80smvZEMLRUdZeVhKWy4eVBKYEWFhYH6VMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipbD//LA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732DCC113CC;
	Mon, 29 Apr 2024 00:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350141;
	bh=snYWhy4FkDQdIs7CvF77J9b/ql16doTSO2/GqtojXXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipbD//LAYHV9kKfFu9W1Cx2zxhqSf/b668aYKpbm1myXHqFnR3ydJN1u3NuWIvVkS
	 fKXRzag+Nnf7334VFRAAAzD+3zDjDP73M+7juITT3ZQhC+hUXh3MQWgKTWtkhUSnDA
	 SAaPFhCG/au6UuDCfOVTLKl2rIe3vGckkYB5WXMV7daYSUgEwO7YMVmisJMMksZtB1
	 jvQxdC3U1ptMC9ANyuymqbQ/2GlwEXOFpY11ulrxEjNK/QxBvuOIy5pnx3M5ClzQ66
	 iY9s8A3br274sWzY7Vxv1MYy83VcGH4R4PiVrRNMwiupH2EqjWlV0M+H6PDC+14ndQ
	 7ly2aoqz4GR5w==
Date: Mon, 29 Apr 2024 02:22:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] i2c: remove printout on handled timeouts - part 2
Message-ID: <57s3pqbqquq6muaos5jkoqbnx4w6w3trwfoxotryfdodxx4age@g5dwfnik3qxm>
References: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Tue, Apr 23, 2024 at 02:13:17PM +0200, Wolfram Sang wrote:
> Here is the continuation of the previous series, largely applied by Andi
> meanwhile (Thanks!). I improved the i801 driver (only one debug print
> left) and added the three ali* drivers which I overlooked before. Hope
> you'll like the patches...
> 
> 
> Wolfram Sang (4):
>   i2c: i801: remove printout on handled timeouts
>   i2c: ali1535: remove printout on handled timeouts
>   i2c: ali1563: remove printout on handled timeouts
>   i2c: ali15x3: remove printout on handled timeouts

Applied to i2c/i2c-host.

Andi

