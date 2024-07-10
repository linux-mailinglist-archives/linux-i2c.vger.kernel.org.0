Return-Path: <linux-i2c+bounces-4853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D592DB29
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A08BA2821A1
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6614613C3D5;
	Wed, 10 Jul 2024 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkfD7rJP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2113C13B59E;
	Wed, 10 Jul 2024 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720647810; cv=none; b=k8DTnJMuENM/IaX/beIFB4j2uiw9wZPYb9l2iXSOjD5IJYa1kOQ8DaX0EJzM8E7/qRK808WNdRQVNGkVKLebCMkQbq2W+aNILl7M8balBC093tA+kqdc7u4IlpZy1T6Ue3VFfEjW97UBWG3L1yCCuqa4F3FZSDZDZjdGhQToYnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720647810; c=relaxed/simple;
	bh=KAGhnFA4T3yXcCVxWsnY2T1LnYc2xHUfaowuR51ARg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiuEnJCwnI0P4OhVernzWG6LQS315vys7+go0KSe2Jr6nV8JoOC89gcTqFWwUZq6QDX7Xp7nD1C8Wgq6dpAOtmRt7kjXk6mIK0WdRs5+9LNMzEbaD5RRHCUYsZAvVYKkWnkQmPm2I6A0s36ocWA8F0z5PzeIui6o5aoLeni2AGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkfD7rJP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB29C32781;
	Wed, 10 Jul 2024 21:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720647809;
	bh=KAGhnFA4T3yXcCVxWsnY2T1LnYc2xHUfaowuR51ARg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkfD7rJP8N+LRNA2umEfDdStpVnlyoEwcHsgay3JVOPOAKfE6cJHQJ24GCF9jrhEm
	 voEvbAcPnVLV1yOTJ8oexbnacqO9WZyE+vHGnpCrEGPRt/UkaHL21qUrSu4tEmRYdo
	 dC1NvF3iR+d/yYynvXaeKTVXg7WtGm5Mn2SJj3DJ7+O/w7UJqKk7yeo2bgtw0Co5mm
	 8pVToahozsBe0aiOx6WNAPQxluKpSjD5jxwKQzdCXd994ET9k3ye+NjJoloSovPsxv
	 iaaUK+Oc8VxLVrrIR2bgDWveS8riDW0FBMNhaA/NBttJP/hQ6NhUtbZKKXixTfgGXE
	 r/iivR5ymaB6w==
Date: Wed, 10 Jul 2024 23:43:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 21/60] i2c: ibm_iic: reword according to newest
 specification
Message-ID: <mttj35w7mezhxvyooyuaa6stu72dylfppw7sumnxulgpu3p6r5@cz3bvdoe4ijk>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-22-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-22-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:21PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> Remove a useless comment while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

