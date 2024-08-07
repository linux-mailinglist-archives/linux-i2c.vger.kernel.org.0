Return-Path: <linux-i2c+bounces-5201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702794B381
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 01:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F3A01F232BF
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 23:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AAB1534EC;
	Wed,  7 Aug 2024 23:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSgH4eMk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618CD250EC;
	Wed,  7 Aug 2024 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723072598; cv=none; b=Xt3f0dkcLUFBrMQ4nquMqgacLpeJPoYVocMVcjvXIS2dibIZ9licgDIAenz+Woh0cpIrH/RJTqqKo9hkfwNrcQZ9VyTqlLwRbwvNImqOO5FTX4UBBspdBmgCi5JpCXyEhYhwJWgKq+rT5Vr4Cgu9Ts0UihxpX4qm18tgyOQQ1Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723072598; c=relaxed/simple;
	bh=tVrQbLodhWOToVUEw0A+Ys8dUigw1wEgNmHeFQPpVHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLs4sosxkX/tdwyLXcr/IOBUc87zV9I/MVTl/FGdFAFazEICjsbtZmJ5e4DWZBqHQ0HG5Afnxmkx2iEpYQSIx522K0GdX8l4rV5rbjNM5s1qxjnO88Npo2koxgj2oOApSe8BQV9y5rxll7/KCQdzmOiJQW6bgWu+GCyPFEbaImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSgH4eMk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD1EC32781;
	Wed,  7 Aug 2024 23:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723072597;
	bh=tVrQbLodhWOToVUEw0A+Ys8dUigw1wEgNmHeFQPpVHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSgH4eMkO4oC8mqXeBx9FHWTYct1Pg7yI3Kpw4ixiVkqMlhDEqz+GMUtrqP+JkMoA
	 h25YDpLKU4J5cA6qoaph9xkRN4zb2g8R1CprxuUX15eAU+PLQsRo5J+dzuFbKTWpQx
	 DsRq1l5K0BlpTVEApPaHaR7Us0GUl4BUQ4BlYOpm3w/M3HTImnSppV6hf1t06ihF0B
	 RSL+S6iLCecgvDnjTF9TRIR40D1rvANoLwKQVkVIhQlsJS94kCycqtFnW7JP/l9HFr
	 t54hdWYJ035KOBCY/JnvwDdI11C26C3hLLcrcVtAYbhtfweU6zoKmyDBYJqT4yqDUi
	 Xo+SXrydtYd1A==
Date: Thu, 8 Aug 2024 00:16:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org, lee@kernel.org, 
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH v2 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <wnseb55uslmash6itj46u7uttltgmins36u7qhqauvfhbvavmi@zupwztshdjsv>
References: <20240801160610.101859-1-mstrodl@csh.rit.edu>
 <20240801160610.101859-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801160610.101859-2-mstrodl@csh.rit.edu>

Hi Mary,

On Thu, Aug 01, 2024 at 12:06:09PM GMT, Mary Strodl wrote:
> The Congatec CGEB is a BIOS interface found on some Congatec x86
> modules. It provides access to on board peripherals like I2C busses
> and watchdogs. This driver contains the basic support for accessing
> the CGEB interface and registers the child devices.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>

Please, next time make sure to run sparse before sending the
patch and avoid the errors signalled by the kernel test robot.

Thanks,
Andi

