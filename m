Return-Path: <linux-i2c+bounces-15184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB3D24A54
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 14:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AD4F301F028
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 13:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151AE39C64F;
	Thu, 15 Jan 2026 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iz/XQYvw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B903839E16B
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482137; cv=none; b=m4aSb2DSaBPU3ESTRMRfIVOeS5NhWqKDM+81eKsCJwGbc57Ojuck08kVFMbTurD8mKac1CmVhyocxHEDvXaUh8u/yobkPDyJLTe+5uoXpMkf9ryZ1U8gojTFesXo/pt+O73dRtsna4HKmmheagQfbkUWw4/16OJ1AYxEePwbBjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482137; c=relaxed/simple;
	bh=YPmY7QPoZfRorZ9rGpWqmN+LnQoqUt5j9BiIr5w88ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9gtE7fGGEW8FwGL5LGygLI6CbhDQuEAe5EfOqvFp2BgGcxxLgqDOvqzetAo0XLQedz8OzKPIG0LzFeDFXse1+DlLZoqLmnd2NI3lv2KW9oXv8sAhZuaCDweY1HZuRPb/Ak0k8G51liLA1e67Zwun9OYjzpomEY7bk3K1YBiiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iz/XQYvw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4LNz
	Bon2fBCdQ9dNweOmhq3o3tSN5XtZPT0mnB3DKh4=; b=iz/XQYvweb1ilfVJK/ub
	/3emkEw2H70mlHSqqCU2h1Ewc/IG0RcsLmR4O+Frt28oltv4AZNxUqNhcK9FFzCf
	cdew9No1iTI6xImopcsEgonmNLOFIYwmvoqGve4LXIRqcwyyb95N2ShCcfRMV7VJ
	wiHYja3plL8fWY0BtSH1lGSS2a6jqmYpXwHJIdWX9M5IMY4RIRg8hYrYPmvCHUpG
	ZI4DVN7kI1m/nrJ093Wh32B5JU77Tl7Uc8X1yEptzSRV/ovoDosSHSMDB+kYHIA7
	yb1+H8MZBWg158iNU+RLTy0i9JdC2F8MF4NXWjmAMBp8N9qxw6As+IM5EC2VH3Wa
	QQ==
Received: (qmail 2544332 invoked from network); 15 Jan 2026 14:02:05 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jan 2026 14:02:05 +0100
X-UD-Smtp-Session: l3s3148p1@DGrY1GxIjq8ujnvI
Date: Thu, 15 Jan 2026 14:02:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: add ACPI support
Message-ID: <aWjlTKrM34lfDsfC@shikoro>
References: <20260115002846.25389-1-abdurrahman@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115002846.25389-1-abdurrahman@nexthop.ai>

On Thu, Jan 15, 2026 at 12:28:46AM +0000, Abdurrahman Hussain wrote:
> Use generic device property accessors.
> Make the clock optional assuming it's managed by firmware.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

On which hardware has this been tested?


