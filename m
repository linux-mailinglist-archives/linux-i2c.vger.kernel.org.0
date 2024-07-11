Return-Path: <linux-i2c+bounces-4906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E1892E490
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F0401C212C5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106BA15958E;
	Thu, 11 Jul 2024 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nG22Q85L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD80158A1E;
	Thu, 11 Jul 2024 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693439; cv=none; b=o41R7eRdgPJKxEehOU0DuQ6XAj1iEqVitUa44l3eGbOAwesBXHByAYng2UA4zMr+RwcXb3XYsbCt9znpJz+WIvQGytUEWhFQnOtnqjS7sBAqGeavY7/CtbvNAXJbKLVZu0VoVxcVyZ2y10nIyP/dZt0wift5o0gu8WjhmgDf+HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693439; c=relaxed/simple;
	bh=JUZwngdAcBE21WSB3wbqSdlLDUxB8/DcHowFU02MaFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRl96OcHBgs4ERgvY53glKDAvJQTjua8cCMdiuXl65JSb3bzU+tRdq1OLg8s8ezu3cY7WfRzGq0gcc1g/Kcxyaj6WijoFgqeZo2xKmvsUFjNyYAcleExt1povfoO4uenpichYmt7EyJtJeivWwbxOMRpG2Kka8BMAreGYmyzPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nG22Q85L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B76C116B1;
	Thu, 11 Jul 2024 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693439;
	bh=JUZwngdAcBE21WSB3wbqSdlLDUxB8/DcHowFU02MaFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nG22Q85LK2eLbepNDAITqRlvnm5S+jXhQ9DcjYgYU97h+N8pK256x9odigWXHJMIw
	 ufi0NeP2gduqmjTODiYjG9uzUEbcqNQEJGsIqjwJF3+IDjePfFF1OxW3giT9Ehoxp1
	 plUnqOX/j2c4hv21PDOK3PkEaR6Pf16DNn064FATWqYzgNwLsss4l/Mea7SOsGg4Y3
	 Mi4fdy20WdVvuFq4catunvlJjDvRXWS6DPsM5XcOIfXBQ6hepcEBGR20uuQZ2mT55U
	 WRKBGOy/NGklNq/E7XYZV5Z/wZrHOJ/CM481uubTHeQFJXJpMv/gvs0As9D32CerB9
	 YZOceTd4kGg9A==
Date: Thu, 11 Jul 2024 12:23:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 44/60] i2c: rzv2m: reword according to newest
 specification
Message-ID: <mvdni3nx3as4cqw2hcqyo7qfl2yipccwi27p4wg36cgus6pqeb@ylhhgzd6fyqn>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-45-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-45-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:44PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

