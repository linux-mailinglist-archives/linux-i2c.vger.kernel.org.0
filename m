Return-Path: <linux-i2c+bounces-10346-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84BA89E1E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 14:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4314219017DC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 12:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3F92951B7;
	Tue, 15 Apr 2025 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjIvUaLD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD88B610B;
	Tue, 15 Apr 2025 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720218; cv=none; b=nugC4YLghdZPghnsPcHuQDT7TFuKkJNv9K85xitoAiEQUoV6C9Ac8NZ9JgjPUHoA+Vfgs8wtofiXw273JeXia3vdHD9AYTuB7Gs8R1gTQQARTtQ33b1TCT5/1L0nzca4cg2dFZCgIX7RHfpOUpahZUy7fNdlFfo8lcq50nMkI1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720218; c=relaxed/simple;
	bh=lcffDkVooMR/L4vsXi2m9Cu8aFIJv4An/EQytAS5lvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egJxwFIID+mE9OQ6Ota8Qqmbu1ZXmK3r/QB1OlaVYh1ULCvK2uywr9U56EPOr3gQDoOk27NXVXhnJ+j3bXxZA7qboIcYnBZJx/OG7dYv32qCivX/Ze89uP5ebQv2Ly8AzU+P2sHy8mc94RNGKLMfbX/DPQ2ZANfwn2uT+DSe8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjIvUaLD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE28C4CEDD;
	Tue, 15 Apr 2025 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744720215;
	bh=lcffDkVooMR/L4vsXi2m9Cu8aFIJv4An/EQytAS5lvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tjIvUaLD7cweJfRpVGTvXrkLq1Uhm7a3OQrcZGvlW505/yTHlF//4ssJxL9pgYbMz
	 IcnnARGsVvrYzGra5Q/qXQ2P0Gi57LdvD/taTXsCEU9r+xWuYKT8O1a1agvN3hgCrx
	 odm/YHFcpt5NxUQ4LWG00owhT0bjjqbJzIYUBvAY2K7DZ0QAc9t8pBZ6CEa+qUppgH
	 72mSXatqMFT1KHZlCZVdumDUTPh6NVpZseSz19QxAEapWWEw5/EgVO17CrzJWueoxt
	 0Rh5d7NIqsVt2I4omvHhhl0PRPY/GQKz6VdoKWyqidHyhkVBGglxvbPmGs6MxYUbsH
	 GMNpxoya+EsaQ==
Message-ID: <36736a3d-9ba1-43d7-ac52-d0f2f8a36bec@kernel.org>
Date: Tue, 15 Apr 2025 14:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hitting WARN_ON_ONCE in i2c-designware-common.c
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Luis Oliveira <lolivei@synopsys.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 kernel-team <kernel-team@cloudflare.com>
References: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
 <Z_5OYSxZS05LO7cE@smile.fi.intel.com> <Z_5Ov9j-tF8rABDZ@smile.fi.intel.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <Z_5Ov9j-tF8rABDZ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/04/2025 14.19, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 03:17:37PM +0300, Andy Shevchenko wrote:
>> On Tue, Apr 15, 2025 at 02:03:26PM +0200, Jesper Dangaard Brouer wrote:
>>> Hi Maintainers,
>>>
>>> I'm hitting a WARN_ON_ONCE in drivers/i2c/busses/i2c-designware-common.c
>>> when booting the kernel on our Gen12 hardware.
>>>
>>> I'm using devel kernel net-next at commit 1a9239bb425 (merge tag
>>> 'net-next-6.15').
>>>
>>> I assume you want this report.
>>>
>>> Maybe it is not a critical error(?)
>>> ... looking the comment in the function:
>>
>> Have you forgotten to compile in the drivers/acpi/acpi_apd.c?
> 

I have double checked that drivers/acpi/acpi_apd.o is compiled.

> Also that driver has the missing error check in acpi_apd_setup() for
> clk_register_clkdev().
> 

Are you saying I'm missing a .config option?

--Jesper

