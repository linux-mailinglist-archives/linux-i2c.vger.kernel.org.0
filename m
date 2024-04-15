Return-Path: <linux-i2c+bounces-2943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818958A5A3C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 20:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7C8284C62
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 18:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CDE15573C;
	Mon, 15 Apr 2024 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkH7YTlX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB613B78F;
	Mon, 15 Apr 2024 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713207332; cv=none; b=Caz2S5bkV5rylweWMDFC11fmo6dsAatIMftTQvOkUZBydygGYiE91BNNt3Lp9CJo/xkCwYmLCiJxXIZlcPQkrUEroiNTk/d0j7AaWAesy+HYtdb5rb1xfpWuyrp9fFntLcjfFuTLUgJJh+jM1eWaxYRPCpMdaFpQ3fKL6bZoXIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713207332; c=relaxed/simple;
	bh=BIu79DTZKRnzAf747RA2IMR1J9U5moBpMwm0YFS7gXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2ovfcu4mPcna3LDfMSskc/RdOb0NWVrE5Ck+1kidHUA1kEacXCubrIbBAyNChnapxsTIMlqMskrQnXgqrs0zNT8PO1OZ4Z4eoP0TCENAC3oADlcAFOwN+/N8zBk5XQTbEWHSuPYZC1vGFmcpTrQD34QO2HVONn8O+PxrqlC4k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkH7YTlX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C7BC113CC;
	Mon, 15 Apr 2024 18:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713207332;
	bh=BIu79DTZKRnzAf747RA2IMR1J9U5moBpMwm0YFS7gXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkH7YTlXERIuXYn+68xtcPYzP8sY1sspG1c9DucKYRw+7D3i0gWRAaYFWBxc7jMKQ
	 WcUGXVP8i2usFpcpdtr5/8mChYVmkQ/nXDhtxRUfDSb486eZ5BIHA80wSfyqgOE7Ec
	 /zQ0bi1byxIFGPGOGaSj2EkOizk/1Di26dvtnKGC3NtjR8hWj3a80LT7WhnIAqhzhO
	 nPUryWj3tvq3X09hIy3izBs8cJswZIVfnlgiq06XFQiA/Ox7mpbdArtpVXXsb3Tv+f
	 5Xc/ptpl1I6y3gYv4Q4FxUPLHcfZWqy32PUfqpC/vNQcDwAlqm7JOsQ6pJCoGiCNKe
	 C2FclYsrNhM8Q==
Date: Mon, 15 Apr 2024 20:55:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc4
Message-ID: <p4vwnqfv6x72qypebmbgatof7k4vlilauqxp77vh5tvv547l6j@lpf3ejegkprh>
References: <7z65zupqngw4i4mzgablb37osz3gwz6767og5t4b32o4o3joqy@ypkuxdgilibd>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7z65zupqngw4i4mzgablb37osz3gwz6767og5t4b32o4o3joqy@ypkuxdgilibd>

Hi Wolfram,

> In this pull request there is only the path update in the
> MAINTAINER file for the pnx driver from Lukas.

good you didn't take this as this patch ended up in the wrong
branch as it's dependent on:

4f6ed948efc6 ("dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema")

Will move it to the right place.

Sorry for the confusion :/
Andi

