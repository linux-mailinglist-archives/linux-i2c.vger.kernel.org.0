Return-Path: <linux-i2c+bounces-12670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBF3B449E8
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 00:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9FE73BDC33
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 22:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635332ED869;
	Thu,  4 Sep 2025 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAFDxtT8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0FE2EBDF9;
	Thu,  4 Sep 2025 22:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757026006; cv=none; b=SLH2NVaUaAT9+fgT4HEWvFX1WZvZAQqz+owf7RmezQuVCGXk/D+5w+tbOE/v1C0fqKnINDJvdeUJ5waN3ra1icyfL/IVRKs2G35tcynXZEXcUSFm37O3Qt4azhDsNv1NJEamstVLYmlzLqTVbd3KQzs5hlqe/eWK4qNr1S6KzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757026006; c=relaxed/simple;
	bh=mK6Tl82kWaeGZqOf1Fw2XOVm2Dkc2dS0zYkmY3R5ZNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7D7XTphB0zHk87F1i26DQRxGIKsl7XQ6/aZjIHoQbHmAHP49ml3pdyvYYH0BZqnYgjC2SLX+rMOb58mLvvl918h7hSCSaDbBFCpQQ5h1YJnzNXdrlNq/CBRMEvV7K7O+1UVz5Zaa4n6HuxpMxfc0JvqCmTqFYhzbgxc83LBCw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAFDxtT8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FF6C4CEF0;
	Thu,  4 Sep 2025 22:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757026005;
	bh=mK6Tl82kWaeGZqOf1Fw2XOVm2Dkc2dS0zYkmY3R5ZNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAFDxtT8y47B33/evU9OcxgRCOx8yPYDru5nhcjrRPzG14i8B8Dg9SbzH84GaRQlR
	 BYCoyjjdpxGl6lEPo79GzqZyLkmQDekEtecsheL/BP2wPLb7XUUyqSvNpeAORpx+gx
	 /7T68BjMK7pG4VDTzwCNN7PTasIq5WYaqEWceyf4QLQV1fAM2HQsMSdauRbjXB6ldS
	 KBJ33LLg5GPjz2Z2ZuhIiOddeUs6KjOhbK5N3NAZqF87MXQMM3nWVn/O0ViD5rvnnB
	 h51qAx3sbLMVD27nQLvkLkB2UzTl88NvXqVTQXxi83hltElJLeWRSdmHUNWJky/VUG
	 UDD7C3KJ0cvAg==
Date: Fri, 5 Sep 2025 00:46:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: wsa+renesas@sang-engineering.com, peda@axentia.se, 
	linux-i2c@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation/i2c: Add missing SPDX-License-Identifier
 tags
Message-ID: <htv3e2umdjiwv3xu6wjasb3kkiu5wg4b5ljanev7i7dqgorria@h7gtkko6d37p>
References: <20250829140743.46710-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829140743.46710-1-viswanathiyyappan@gmail.com>

Hi,

On Fri, Aug 29, 2025 at 07:37:43PM +0530, I Viswanath wrote:
> Add the SPDX-License-Identifier tag to all the .rst files that
> are missing it

we are politically setting GPL-2.0 to these documents. I'm not an
expert, but I wonder if the right thing to do is to align
documentation with the documentation with the driver that is
documenting.

Andi

