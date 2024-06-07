Return-Path: <linux-i2c+bounces-3923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60734900BCF
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 20:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 931212858F9
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4889D4D9F6;
	Fri,  7 Jun 2024 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="gljl7/U8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF72520328;
	Fri,  7 Jun 2024 18:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717784272; cv=none; b=ZypGuhczCTQgVzY6w94UzTzZf/9h9+BY4GqCUPYseQocgoPCKDUWcMbwgwuSBOm5d0gC4WH3JkG13qLdIpva+eIMcF4gNRMEbMytlvBGEJl4mwyFgo9dCOuDPOhJGtpJebJX3QTHajTwIwqCR1rGzFnl9WOTOZTg/HLRwUTs8/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717784272; c=relaxed/simple;
	bh=Zvc0uGf/+ZSh7r7LBRpQmsHZ+U28a0XyakDZPbEa4/E=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BnnyY0HdX6/dp4pJoDVrRhQjFcokYktP4mfRkStzScvN/aL5fdVbAOpGKVIYYhrnfgd7TTRD3cGuVhnvQbKKyEnSjqPVMBTaCQC/uOoukXf5xam8n6GeQPdPjYkFN5eaVRa6/MOAG4LGiLX4utZWio6IyzaWdzJXnGxyz4lNYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=gljl7/U8; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5BF3920B915A;
	Fri,  7 Jun 2024 11:17:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5BF3920B915A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1717784270;
	bh=mgT5WWFF+1CTJUM1HUgzvebaxmCwTYZ7FOOIKhMzd+Y=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=gljl7/U8uzHf9P+ygZbNVCqxlFgh633na/pHbMrMa2jK0t/iGiVQelaV1Ys7LLB6x
	 Ox2PDtbDsSMRADeDsuSoYs0O95YwBMGmg9CTWklf0/g8aV3CgHsAPegB7rqBOohqxd
	 9rg3PQGwLKCYz1Fb3X6eZ5VXLTwG0uDD3h5CqGl8=
Message-ID: <760abc2e-d6d6-41a4-8691-09e4040dd1b4@linux.microsoft.com>
Date: Fri, 7 Jun 2024 11:17:49 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andi Shyti <andi.shyti@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: i2c: summary: rephrase paragraph explaining the
 figure
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
 <20240607111726.12678-6-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240607111726.12678-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/7/2024 4:17 AM, Wolfram Sang wrote:
> Use 'controller/target' and 'adapter/client' pairs consistently.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/i2c/summary.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index b10b6aaafcec..1b5bc7ed46aa 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -55,9 +55,9 @@ in a directory specific to the feature they provide, for example
>  ``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
>  video-related chips.
>  
> -For the example configuration in figure, you will need a driver for your
> -I2C adapter, and drivers for your I2C devices (usually one driver for each
> -device).
> +For the example configuration in the figure above, you will need one adapter
> +driver for the I2C controller, and client drivers for your I2C targets. Usually
> +one driver for each client.
>  
>  Outdated terminology
>  --------------------

Similar feedback as for patch 4. I thought we agreed on using {local,
remote} target for in-line clarity.

Thanks,
Easwar

