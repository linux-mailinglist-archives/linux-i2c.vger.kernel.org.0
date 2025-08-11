Return-Path: <linux-i2c+bounces-12242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937DB211B8
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 18:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 267FF684998
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 16:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8913A2E2675;
	Mon, 11 Aug 2025 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSyh0M2p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413442E265B
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928783; cv=none; b=e64cSR/ZjirictqYGuGLc7Ev1ZOV2+X/vt4kxdxE6cSFHigl/T0FChb0A9/r+1vZ7LYtMj9HRpo4rB74Ojlnb6dIsWEhvZsqyGHSbtsjTiuC+4XM8eBNRqzr5MiTM7bK+PtumyudjXKbb+MBKwjchwlx1pgJTIy+SeJ7npaiaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928783; c=relaxed/simple;
	bh=sdcquYL9LCEdj0rf4SjNKoacwa3L7q0NPmRbFt63VgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKglbaiLVSrXsF3DcQv18L4Vki9H11GMm9Xg2cLwgtLEivMK9GAcRbp2pV8DzKA+1EAtm1QVcb85o60734/Es64Q3YsiLcnSBwDzw+SO1irpNG6hlhgbW0j18H2PPOV8AUn97GyyMRr9ySA/b2x4bGBgqGXoc5ExR1RG/+YTEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSyh0M2p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A02FC4CEED;
	Mon, 11 Aug 2025 16:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928782;
	bh=sdcquYL9LCEdj0rf4SjNKoacwa3L7q0NPmRbFt63VgM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WSyh0M2pKerUaE6ZU/c25KWrQzfnS5upssYVicTGvR+Gj+gEhHlDc5RnZpf6aGAQA
	 owMm7ZcWzqIS3i4k8mgvk1pfgY15q5+H5LX4wTjDWnMLnG+73sfqvxijUb8TCf5n/e
	 6sw9rviRAasvexyubCFsdJ5ur8w8DWqlgAo0LY4lIncToCc0y9C7ck9bfSkQMBtETf
	 WewFxgX6k6qFUTPcJMngbXNWauoxaVhKKEDxk+Xu3txIThNjBKtAHk6tK9jqDgbLX1
	 GI9ZkCeDj7sW13JKpRbJImOm1ZsjNbpKVktrqeE8OtRf6C2/WxI9ER4LQJJNhT7+gW
	 Gc31F9lilPPlg==
Message-ID: <d4b0a847-0617-4735-b6a1-ff5375f166bd@kernel.org>
Date: Mon, 11 Aug 2025 18:12:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-pasemi messages since kernel 6.16
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linux-i2c@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>
References: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

hi,

On 10.08.25 18:47, Christian Zigotzky wrote:
> Hello Sven,
> 
> Since the kernel 6.16 we have the following messages during the boot.
> 
> [    9.459706] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
> [    9.649736] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 0x08210100 (xfstatus 0x00000001)
> [    9.690696] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
> [    9.708651] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 0x08210100 (xfstatus 0x00000001)
> [    9.892693] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
> [    9.911535] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 0x08210100 (xfstatus 0x00000001)
> 
> What exactly do these messages mean?

Do you just see these messages or are there also any other issues like a 
device on the i2c bus not working anymore when it worked fine before?
We added some additional logging recently and I suspect that this has 
always been happening and no one noticed.



Sven



