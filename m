Return-Path: <linux-i2c+bounces-15123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C9D1A367
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C7833042075
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0432ECD1D;
	Tue, 13 Jan 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mwn/OaAA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4F2EB5A9
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321539; cv=none; b=noGgFiN3xh1eYDb4uSseMscKB0JmtinzSu5kcJcGGvZs8C41/C3XPxozPL9kRf307eIsnDb6hJQ+jChmiK9J3VN0+CKeZbH48SlBDwqqyPv8eUztn22AJ1HfxEKDp5dU1bt8lMLe0SOifJ7LOyEx0rYWvK+UNunmoN9BiwJl21Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321539; c=relaxed/simple;
	bh=iv6Rri7vu2VgNSIIb1X/DUdXOYqJAwHLyEshSD21dVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpG4joP6Hv2TVSLmc5UL3i8fLVYB7Do9O1Z/wlINdylOb4bEGc8UOlg5ttT3COpEiJ5c5Lpia3XeUibYrpBwwwhEIUu0aG1aBsQYTCgRk1whArX4GLhE7WheiP68tw7Y0OhreuD9QYxYBjeJDCcYz0F3T5f+qDiv8KUtDYu3bHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Mwn/OaAA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=S3iR
	qAo9rKjqGVaIYnRuiQR16oJX5eZLBG/W1+wgijA=; b=Mwn/OaAAW3TWevCaqvWV
	tIyI7BZQwQiQP/8HootQC8t02kN+M18z4eOuuSB2JRBbnOJokIhrf2SaLCSbierz
	2vOxB3aV7uz8ty1LlIboDqJUv6uxBEqrlIu31/ZGcC8vaecmgemRD7vLzm1OxOPI
	9ObpkCtXHxc08zHx47xMQCg7w6I6DMlGLV2a2AzXgMSAPVa5bOPybpRc4b2Scrvr
	Fh8+GPEvktZlMyAf22sirMPJginI/mhH+Iw0XyiW+XnvvLVS1VRU4V7iIbsloJ+R
	evZYhOfZ6n2gS4lzhuj7sVg/X7sQBvFeEQh5IPfPsKF4Hmk2GkklTbVwj0r6WKx/
	Rg==
Received: (qmail 1777439 invoked from network); 13 Jan 2026 17:25:35 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 17:25:35 +0100
X-UD-Smtp-Session: l3s3148p1@R1XucEdIIqQujnvx
Date: Tue, 13 Jan 2026 17:25:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] i2c: core: Replace custom implementation of
 device_match_fwnode()
Message-ID: <aWZx_iugtM59C6-0@ninjato>
References: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
 <20260112132346.4087258-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112132346.4087258-3-andriy.shevchenko@linux.intel.com>

On Mon, Jan 12, 2026 at 02:22:41PM +0100, Andy Shevchenko wrote:
> Replace custom implementation of the device_match_fwnode().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


