Return-Path: <linux-i2c+bounces-10649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E34A9E94F
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 09:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62134189AAF4
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 07:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5201F956;
	Mon, 28 Apr 2025 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbD8rf4d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB33211;
	Mon, 28 Apr 2025 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825429; cv=none; b=To1nUWzRjd3BDn7B/iWEmkYh4CooBpPisD1EGDVmAw0tgvQiqS60/zUf9CgZQ8xmkF4GevRzHUm2yjtnKQkDtca0tEQwYM5ywEVnVV1iZigAq/ovx3j1fHrKW3Wz5Hfr1yEIiXRI7AI61PfgkWLXAWVeMa88Ty1vGfvOOVtPf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825429; c=relaxed/simple;
	bh=3+qHAzREPSO7ZVsXnhFnpTU/Wp/puSd3Dna1Y4OKAww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5y/mP6YoAp7HubUEHLSPIFTL0XiW1iCmc5Y9o2jOuwEkxSmxtf7yVfq7jyREPgKDMsP1XFeEhB2fkKJZhftzYq8DGEJeYaxg5xmyB44jG9EOQerZjxXC0akSqDaZ+z2l2JsFR7eXlFrM3925Y3ahA0PbWZ7QTo2CkAIRP9xglc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbD8rf4d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0180DC4CEE4;
	Mon, 28 Apr 2025 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745825428;
	bh=3+qHAzREPSO7ZVsXnhFnpTU/Wp/puSd3Dna1Y4OKAww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AbD8rf4dRiaYOkoNHPAXLAD/XxoHB+eNIvPZ/tQST/bGX6JzDkEbdubRW2F/vcyaZ
	 /UeWVKc7+ZbeIeWYweol/gAKWf1EHu2bwdLGcS0/GyfTMBKWIn5UXf7hJvYExx6bP/
	 dEEgtcQNyXNdJNZZFdRZOQAMLUR5BJUoJeaCdBLPXl80blVjNqiNqvtbb8jTr8TxA3
	 V8rRIrguq8BNtVO+CJYSb0hEzibM/hZzMn9IBE4ENxI97kAqlKQKtvBDKLjCQQjLUg
	 RNG1EacO8QyoDmZE6JGs1N0jAHfTC2E9T6g8OQAUiMlRs83+Cks06Tnz6rwDwpLgOA
	 Cqpf5BWF65YGQ==
Date: Mon, 28 Apr 2025 09:30:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: mlimonci@amd.com, christophe.jaillet@wanadoo.fr, krzk@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, benjamin.chan@amd.com, 
	bin.du@amd.com, gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com, 
	Venkata Narendra Kumar Gutta <vengutta@amd.com>
Subject: Re: [PATCH v2] i2c: amd-isp: Add ISP i2c-designware driver
Message-ID: <i4fqptobrabmsok6eaphyte3ihwgqnz6ar6k6h6tw7d5ovimek@vjp2tjlzm7oh>
References: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424184952.1290019-1-pratap.nirujogi@amd.com>

Hi Pratap,

On Thu, Apr 24, 2025 at 02:49:26PM -0400, Pratap Nirujogi wrote:
> The camera sensor is connected via ISP I2C bus in AMD SOC
> architectures. Add new I2C designware driver to support
> new camera sensors on AMD HW.
> 
> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> Co-developed-by: Bin Du <bin.du@amd.com>
> Signed-off-by: Bin Du <bin.du@amd.com>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

merged to i2c/i2c-host.

Thanks,
Andi

