Return-Path: <linux-i2c+bounces-14383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B26CA15C1
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 20:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65A803053FC9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 19:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D85C31960F;
	Wed,  3 Dec 2025 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YP3CmCWe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E2311C0C
	for <linux-i2c@vger.kernel.org>; Wed,  3 Dec 2025 19:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764788448; cv=none; b=FsSFVyyZ6QkVmKqQmWqzD1MmS8SyXtbDvzI4prKQvqm/82PPDHHS5DEbkiUvpOVNh6PN61XStGTtu4ZLimJxanxZpaKG4SkErGo/52EnLvbFq6vSSqlrEIkq/V41IzTfFW3nCXpBsEXATnKL5OGNtxinvjB7ozzAof3mqiabw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764788448; c=relaxed/simple;
	bh=eZxd2PR/o6M/hydzOMws5LK12tDUpTIVvsNzivIOeKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmHa9/kgvHSnp7n47zliKrPQyOtZS9Ds3532ulXnXZ6HWTr26BWcUWO6iOOd5hGCj9077KMoJ6tUznvP2yYWJN1LhwtBXWsnoYamqT2UCjIiH43WQAKThX9yXPMKyXqCoO5Gtx19g/dvG1tUW75jVfC78W7e4X2VsS7OWBrSEoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YP3CmCWe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1E9C4CEF5;
	Wed,  3 Dec 2025 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764788447;
	bh=eZxd2PR/o6M/hydzOMws5LK12tDUpTIVvsNzivIOeKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YP3CmCWeU9oKDQdzwH69ED5zbkqj38HP3AtUjwKb9BPnSRQiUOVxYtKVyf5njTIYx
	 naGmxqweWApxPEslygGZHJe0+eJBERRHekX7P+aZSx6W3mzF+PaquLHlubuAIszwwU
	 dCa7kFONeTLJeDcPyoCjYLB9qpRAWs+URudbzGa21NnwUhqEWWxM7lu6sdFwdlcfcT
	 Nuqhz8BT+1qzUEYBYadShCn0trc+o2q3mGv8onmgwcpk/ZBujN/o9hWu5T2uGtJYxq
	 7CjnEmPVqubyXUMgHxZonSqt/XvwP3ppMwBvuarNUqNdecwvgiQbYUrFW/tc4NLdEM
	 niD1GHIa7WDyQ==
Date: Wed, 3 Dec 2025 20:00:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Add support for Intel Nova Lake-S
Message-ID: <rqzqctdfx7bkf5ypn5fi4ju7tho5cwswbgz6engjla4i7ayhwr@wlgsp2a2s6ot>
References: <20251124132816.470599-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124132816.470599-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

On Mon, Nov 24, 2025 at 02:28:15PM +0100, Heikki Krogerus wrote:
> From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> 
> Add SMBus PCI IDs on Intel Nova Lake-S.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Merged to i2c/i2c-host.

Thanks,
Andi

