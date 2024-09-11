Return-Path: <linux-i2c+bounces-6558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F969751DE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BF60B2B817
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1FA184537;
	Wed, 11 Sep 2024 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIMbvVnP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA3A188A05
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057183; cv=none; b=ps/c6BGNV2dLRL+cf+VpvUspoz+s0j6u7jQgmuZk4lAgqnTnyz4Cm9LgYhlRaVO38RbkKAimxxRe5jjXZoqyrIgWOXos+XVaoPz4GcDpzvhX/n5MDZRnXsw3lzbeDP0dx246PjB7OP9bOQlC/YpTpItsyhTCrkxrbC/rmNNB3DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057183; c=relaxed/simple;
	bh=uEzmMuo9jpv7qkjQa8O9cVT9B4DNIpNTPLrxuL0Giuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDHydtKw1YLv7RSUpEWUDB4mq+2ZB5/hNWpwiVOToUVzhnI8CuL5GWlZyWkVLyCW2+8qevye4dD/wT+5ODGf/EcDVZNzLUeDFv9/idxg86U32Dwnwypw+8R+T/q9+qPJ2hxKLQX4FZDsfBFIgiVDJIvDbIYDIMr3oNvxtCzcVSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIMbvVnP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615DDC4CECE;
	Wed, 11 Sep 2024 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726057183;
	bh=uEzmMuo9jpv7qkjQa8O9cVT9B4DNIpNTPLrxuL0Giuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIMbvVnPUKHhQE9P44j1gNZ8qHcQ51NSG4WnaTNnzD2EnUqhRum79P4Z9HuMmstx4
	 LoxwQJ6lcqUcEGyH7UyMV0SuD4YDXS68y1ozC/4gglM2cjyC8AdVWZ9h1FTYT22bas
	 i6oglu9q+b9Bsc52VB4+jBDzf7km8OtgCyosB5L3wZc0wP5Wz936M0ZOZZpNyoyjpW
	 dkHBoV4DMGphq3uYd2E50I/a/GPKmm9lb20NePdxKz40X9AgiUO2YTR28mes7zjRgh
	 3ZBGDQY3drRfxCRqNLepEvr93RH7fXSyVd/QVsiRvuqorA7ZhJjKOTEggQDcQtX0FY
	 WupFZAteGL7UA==
Date: Wed, 11 Sep 2024 14:19:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, 
	Robert Hancock <robert.hancock@calian.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"Goud, Srinivas" <srinivas.goud@amd.com>, "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, 
	"Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
Message-ID: <ewsgp6osyya2uhc6zkdmnxdpzwijwaukcdub2rq5nbya6wagkj@zvphj4txxjov>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
 <DM4PR12MB61092C8804E50438DB36609B8C5E2@DM4PR12MB6109.namprd12.prod.outlook.com>
 <4d071efb-d951-43cf-a845-8eef57483643@amd.com>
 <DM4PR12MB6109CF657C93DDD9096815268C9B2@DM4PR12MB6109.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR12MB6109CF657C93DDD9096815268C9B2@DM4PR12MB6109.namprd12.prod.outlook.com>

Hi Manikanta,

On Wed, Sep 11, 2024 at 11:42:09AM GMT, Guntupalli, Manikanta wrote:
> Could you please review the patch series that has been awaiting feedback for some time? we believe it deserves your attention.

yes, I'm sorry this skipped from my review list. Thanks for
bringing it up, I will check it.

> Thank you for your time and consideration.

Thank you!

Andi

