Return-Path: <linux-i2c+bounces-3922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E62E5900BC5
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 20:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8367E2842B7
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BD1137903;
	Fri,  7 Jun 2024 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="QAONdNVM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96B747A62;
	Fri,  7 Jun 2024 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717784111; cv=none; b=MfXjv9OWmqFQicbpmRqipatUoTqlDYKxj4fZ8V58VdYZA3nTMvBmS4iBaXPI1xPtq771KhurDg9RXBe5shv4CxCqp0p+lzzDBp7OzOLGLbKPkvDoR5MD7g4n+my6T5cU7Q96cc1h8hFfyyv048AlmQCNsg+hm+x57zULFn+8MWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717784111; c=relaxed/simple;
	bh=OXtbpjrqB20OhZsFKM9e7XHtIr0lNobCD3gykvypE7U=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dRe7IbeYOPvgk2z0EoadG/l8e7iGTzJU+jcXT+uls5xWOKuYjDSahKvaRpYfn/G9bj2RRK2GoCkZ/i5rHVNJTJxaOrJRUt5cxpfWKxayYi3v0CBBMn098kmEd8bOJzmaUOp+Jx2OILy8i3prBXT5Njzf7XICLqH3fDgzmnGZiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=QAONdNVM; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7CC292069122;
	Fri,  7 Jun 2024 11:15:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7CC292069122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1717784109;
	bh=aspAjPg5CqxLexLcr/SVBRgR/84wEQv1cxPHwasB51c=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=QAONdNVMuu5BwIDhouUEkXGOu/6Nb7mo+teif9fN3gsJhELJpdJdQPTh9p1Ez3IA3
	 HfCGk1Ofb0HoXsRcuMIXDoKAXXvBaT9EKNECFH2pVl3t3mo2Hc5EwuocfhiahcZCAr
	 71iu27KDk+tNHdo2OJuPjsH7tyi+1hUVXSVZYodQ=
Message-ID: <ba933a0e-9372-4b64-969a-5e13f44de90d@linux.microsoft.com>
Date: Fri, 7 Jun 2024 11:15:08 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andi Shyti <andi.shyti@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] docs: i2c: summary: update speed mode description
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
 <20240607111726.12678-4-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240607111726.12678-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/7/2024 4:17 AM, Wolfram Sang wrote:
> Fastest I2C mode is 5 MHz. Update the docs and reword the paragraph
> slightly.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/i2c/summary.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index e3ab1d414014..a1e5c0715f8b 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -3,8 +3,8 @@ Introduction to I2C and SMBus
>  =============================
>  
>  I²C (pronounce: I squared C and written I2C in the kernel documentation) is
> -a protocol developed by Philips. It is a slow two-wire protocol (variable
> -speed, up to 400 kHz), with a high speed extension (3.4 MHz). It provides
> +a protocol developed by Philips. It is a two-wire protocol with variable
> +speed (typically up to 400 kHz, high speed modes up to 5 MHz). It provides
>  an inexpensive bus for connecting many types of devices with infrequent or
>  low bandwidth communications needs. I2C is widely used with embedded
>  systems. Some systems use variants that don't meet branding requirements,

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

