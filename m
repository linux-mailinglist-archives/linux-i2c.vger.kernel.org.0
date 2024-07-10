Return-Path: <linux-i2c+bounces-4855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5792DB31
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A17CB225BD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011F513C80C;
	Wed, 10 Jul 2024 21:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzFkHA4U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A38286F;
	Wed, 10 Jul 2024 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720647917; cv=none; b=Z4VXLY1eTETpVxVaSVLs2EZ5atfnc/C1QpNP69glPTfCylPeJp5oOYp8V5z2CQ7lb/mc8P9nzlh/AFSr03W9S1/vLahlOT8mVSEYuJX3/lbFmET2FT5mGwT7Kp82WGuEY9EGtKPN0MSBHFJ6UQA9N/RCAsu1QbwjULPBXUuIUzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720647917; c=relaxed/simple;
	bh=mg2sNntkjC2fgc3M+yE6epKZFNy2nZNp+b46SJvG7mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uc7S36s8S8c6pfDiub0JZ0y1RRvCKIIZBndE86wVYGvLXqOa0zkBbFfzvWtAbs+7gokXVy2LYGh0VmqcyKvA4C2YFfG0dsN03bidXVNx5wtaISZOLPnUKC7QXIJo50oeVWbJOyyfDG2IVbAEsANh2ZDiI/Wm/qzWsZ3NgPjirys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzFkHA4U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72E2C32781;
	Wed, 10 Jul 2024 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720647917;
	bh=mg2sNntkjC2fgc3M+yE6epKZFNy2nZNp+b46SJvG7mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzFkHA4UHtLVhI8XcrWjPpsuqsdMFOQpq7whB+0Bd4WBr9Wr1FCqydYyrIa+JQqjw
	 Sztok5jByrG4oUer0M866oIlQ6yXqpOF8GpcMQmarbqaIAUUjHQVie03NtKunb2dbw
	 p4T8WvTiZ/2onIAE4MO6nqMTnfUOzvl3NCuNcK4u1DV8fP1YijOc/i+S1ERi9wZ5kJ
	 1kJismDPNu7qnvrTIELdirART4GGOBAcEqeElTC8ygqNi0ygCkmw40cOvmNQw4ikZe
	 kGl87kFz7Hc0sewcPLao5c57Wq9ANRoQF/rYj2YdWcx+qMp4B9E0GN/sgLQneOWfWL
	 GoYo+8Cey9tVg==
Date: Wed, 10 Jul 2024 23:45:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 23/60] i2c: isch: reword according to newest
 specification
Message-ID: <qpbceevz6s6ijtd5vymbkr2ykyzrevvuelq5yzcqnsmaygjzhv@uh6p3wcz7lxw>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-24-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-24-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:23PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

