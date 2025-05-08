Return-Path: <linux-i2c+bounces-10889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4A2AAF788
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 12:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35BE14C0BC0
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 10:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB55A1C8616;
	Thu,  8 May 2025 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMYf5PxA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAC542065
	for <linux-i2c@vger.kernel.org>; Thu,  8 May 2025 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698975; cv=none; b=pr4Fl/AZbFuj3hbsN8PTQUMV+1y4rBB3eGS3hgitbVVmTjsjZUsMtjhRQTWeJ9u2qopgIl1yf37LRQM/SKe4XD1IaTxTyr4JP0+yuTw5T8zdvHC0jolSXj4EZWbocd4HX30jk/l/o4WWVLdQmdSwQqVE3H8Ysoj56EFrCuNXiHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698975; c=relaxed/simple;
	bh=QflQOJUE/kOZJ0tqQTQ0k3U2zSejdJ4zxXP6fI7KMyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqJimrgwsG6XMvpb/IrIt+d4MAo5uh+dCihduN5qrh4+qE+TERWksKIqi9p6yhbM5MTJhwWCjXhM/7zQ0rCfiq1evb4c2UaQUjDdCWJ9EDJFfiZFpAFm039Eecghfi+qS865f38EOsy0N68uYNEDw3dQ9cTeVH+qoy+PfvWqbWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMYf5PxA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E225C4CEE7;
	Thu,  8 May 2025 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746698974;
	bh=QflQOJUE/kOZJ0tqQTQ0k3U2zSejdJ4zxXP6fI7KMyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dMYf5PxA1ge0xZ6ATIiOWK8No/n18xXHVLCxMgEZhF3Cr2s5WgmLgMAyjtHPkenks
	 5cqWwjjPgdZiegWwuLHP/cJRYMmG+kjhazTTY/vh3xjaZCABbueJVWDqicsSnhaAwg
	 JjKyY5FVbbmxAIuCPa9RcjmUhNv4+kSm08PLEVHAHweTWsPGYKSAEouvUuKAPoqhEh
	 B0H6MsooGg8uQ89c8X5//G7N0v0LtjOpFwlPjuvj/L3tmTQ+NhCl1Gp1MB/jh3ITq0
	 FNHmtHKNQj/38FW1KUM3ovbHXPcnGog7qMF4PjVqNbfPtjt72HX78ne0JsUgi58ydk
	 MnHFP+31L3NIA==
Date: Thu, 8 May 2025 12:09:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] MAINTAINERS: Remove entry for Seth Heasley
Message-ID: <dbhoxuqdag4o5lhy2xmblhioonwxkhrigztlssmt5eeygyhpcz@zlb72qfia5sc>
References: <20250505231511.3175151-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505231511.3175151-1-andi.shyti@kernel.org>

Hi,

On Tue, May 06, 2025 at 01:15:11AM +0200, Andi Shyti wrote:
> Seth's mails bounce back, remove his maintainership.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

merged in i2c/i2c-host-fixes.

Andi

