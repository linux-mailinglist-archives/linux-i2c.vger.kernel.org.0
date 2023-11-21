Return-Path: <linux-i2c+bounces-365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998F7F277B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 09:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C361C21937
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 08:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033A93B7AD;
	Tue, 21 Nov 2023 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZS0Mpbj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A43B79D;
	Tue, 21 Nov 2023 08:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81623C433C7;
	Tue, 21 Nov 2023 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700555468;
	bh=z4UtWQZZa+ttzNxT4dJLgWb71f/Kl8eEqsMtKTWnNEI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LZS0MpbjcH4E3jcE7IxOrDpOyqzlUQOWrXSGR0l9IgMsDjKEr+nGBZMSkhFLb2uYG
	 LHBzcjKug4c5NS6qE/WOLtt3qjh0joHqMe7HDojtiMCPO3q10pVFMLw2hLzIFn1y5y
	 /UsiINKQHhyDYzFW0d185wvNtL7gRSOKRR62RXhZP+jDQb8Nf+JZXy5kzgNRmMTeSz
	 8iaLs2l8N7dGibLOtGR1QxwzunP165mAt2HSA2E2O9O7hA8GmzUr7Sz0LkuGibpiV3
	 Oxv3eTQmCg9gcWhienCGy9KpKdYPYWM09QGmVRhRp9YbbDj3Ilglt8LDIXELcyTtLK
	 i2SWNfkKjc6xw==
Date: Tue, 21 Nov 2023 09:31:04 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
cc: gupt21@gmail.com, benjamin.tissoires@redhat.com, Enrik.Berkhan@inka.de, 
    sven.zuehlsdorf@vigem.de, linux-i2c@vger.kernel.org, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 0/5] MCP2221 Improvements
In-Reply-To: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
Message-ID: <nycvar.YFH.7.76.2311210930440.29220@cbobk.fhfr.pm>
References: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Hamish Martin wrote:

> Recently I've been prototyping a new system which uses a MCP2221 chip as
> the I2C bus. During that development a few issues were found that form
> the patches in this series.
> 
> The first two are resolving long standing issues that have both been
> reported before, patches submitted, but it appears never accepted.
> The ACPI patch resolves an issue in my x86_64 system.
> The final two address fundamental issues with the driver that have not
> worked correctly from the beginning it seems.
> 
> Please review and let me know what you think.

Hi,

I have applied 1/5 and 2/5 for 6.7 and the rest of the series for 6.8.

Thanks,

-- 
Jiri Kosina
SUSE Labs


