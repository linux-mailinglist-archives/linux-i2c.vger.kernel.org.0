Return-Path: <linux-i2c+bounces-4857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E485092DB36
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74F05B225FA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DCB13D886;
	Wed, 10 Jul 2024 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hq3pt4N2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53CD13C3D5;
	Wed, 10 Jul 2024 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720647993; cv=none; b=eYSnuZ0wh56zgihkX25ljrfFzM9KpMoCrXOud6AJYkchbK5MPtPU+rO0V/UxnA6zedvNkVVxC89aYr8Zb20qCUzgW0o2mJvpsAQVfFYc4esWyN8DCxVFKAE3ho9WSxwI+5tofyHHI9wJ1MRY619yM3YP1xaoHYvX/drxuDi2QZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720647993; c=relaxed/simple;
	bh=O+0Dhn4VZQAsFQSipFchj0rkeCvh+/pdzeoWev0Igo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNGa39m3wX/LoIw+GGsIYeBk0xEVm6hBoZO0xcKC97FW7eHTXkms0lX6zRSoHdrtz8bIa9i3s5hoqDD1LkicXYTdpOLAAWbDuRFSXDKGyCZU284qM9zIk8t60j4IwoE7qyruUp8YO6xrw4NVwyGab4Eg44Op38OOcOXvcxaJXGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hq3pt4N2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14537C32781;
	Wed, 10 Jul 2024 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720647992;
	bh=O+0Dhn4VZQAsFQSipFchj0rkeCvh+/pdzeoWev0Igo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hq3pt4N2erXOf/URZtp9WHw8kf7rLaz8chEaoaosL1sxKM6knv2zr7hdqktpdSm5I
	 5Gc00JklhXZdDCqT8qWJb9uhpPrXObqGQmsgZhVMphwwf/LKX9FYu5ABQUSmhZd7xc
	 oad/zlDDrVjuFDtP/XY1FRFv9ybTF9kWgv3NuyJE7nz7ARrwUnJmJF7XNbmbg0syL2
	 P6mu0q2TNHsJCVNZb9uueDw+Al3BZsTwPt+cnU7XJliq+Wv2VaS1rs+EbEThcM8ZC5
	 gn2FXEPNfJDxPqKMVjKe8leX6+SE21fJvkuBggvX/zk0DhKNw4NkzPDJkaHfdg+gm3
	 fmy5bGS4kZPpw==
Date: Wed, 10 Jul 2024 23:46:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 25/60] i2c: kempld: reword according to newest
 specification
Message-ID: <udpnepx7gln6ggbdyesiitq2jz74hk765zgdyqmvaiwn66whuz@y35nagqcniij>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-26-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-26-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:25PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

