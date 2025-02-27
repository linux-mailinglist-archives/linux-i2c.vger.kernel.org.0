Return-Path: <linux-i2c+bounces-9632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E3A48851
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 19:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F523B96B2
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 18:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC5C1EFF95;
	Thu, 27 Feb 2025 18:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsvFlZap"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFDE482EF;
	Thu, 27 Feb 2025 18:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740682410; cv=none; b=VDarxh8S/kWmngczJhVV1Gzv1+goZU2qew8chXZDsU7+hJSFXkLUYihRqJkfR3keUg2/Wo1li6wcVA650q9GQCnN53qym0jOuwKE0JnLY4UXvp3KHk9Ra5zTBteNqOxjQSEVMRVmAMZNG1srEnVXT1rWSiHDE7OKaug7d8qX3+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740682410; c=relaxed/simple;
	bh=tiI29qrmeWsjWhA18quuPEWgXxbDfdCAkCEs7/zzF+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePVUBaxudU3pze6M29iSg1TQvYNqXJZnGXWjiBBU6cRXVM9fA8AvCBXX0/S6d0okHsrGVsZ4eu0oWGUj13Jx9aKiA4sSN0i+vebISW0DJfsvLy3WDyZYGlQL0TgHMPaqZuEcnGgNhRR5vBRaWE2NMe2DF9VWEBuSH7yqltfERx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsvFlZap; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A039CC4CEDD;
	Thu, 27 Feb 2025 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740682409;
	bh=tiI29qrmeWsjWhA18quuPEWgXxbDfdCAkCEs7/zzF+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsvFlZapXhT5CcYIEibfq8venNzobLYytQrJ8IEvtwwsfaHzuHaYkYjfB8n5QSYFN
	 vOM/s4KZgiHrQ5PjoGfZjj4S8xqp/Uy7Obx2g5zG/tGurnaozGPv1b0lnBbonP3mXl
	 R5f8bLeBbr2FB8PlZfZBu/2KC/iiDVi6jELeIPmcEg4ehqN0Az+1dnjr9h3YVEVQMD
	 qygq5CF2xV97LN3RUgmmwRrW1Yjz2I41YHl473d/hhJYjG21ZFVYX0NNRzdXgsmNVg
	 W16PX4dASKlBcXBYk0/rWT/YDDxhaFg8vwQpk6r5vlz3tHatyCESicigrYrI5nbRF+
	 mi6iFDcQHBkhQ==
Date: Thu, 27 Feb 2025 19:53:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Anindya Sundar Gayen <anindya.sg@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com
Subject: Re: [PATCH] i2c-algo-bit: cpu_relax/ yield replaced with cond_resched
Message-ID: <2neytitd4amwksu25ujj6qcgnu3gqrg25t242d5czalwfibt35@cqv4y3ncgfbt>
References: <CGME20250225121943epcas5p129c54f2e9ad44af2ce342c26267fe38a@epcas5p1.samsung.com>
 <20250225113724.14653-1-anindya.sg@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225113724.14653-1-anindya.sg@samsung.com>

On Tue, Feb 25, 2025 at 05:07:24PM +0530, Anindya Sundar Gayen wrote:
> cpu_relax/ yield replaced with better flexible approach in kernel
> with cond_resched.

they are three different functions normally used in different
contexts, I would need a better justification for this patch.

Andi

