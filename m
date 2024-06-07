Return-Path: <linux-i2c+bounces-3921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2A8900BC2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 20:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AF8D1F21E5D
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151EB19AA7F;
	Fri,  7 Jun 2024 18:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="OyJ3SZix"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B2C1805A;
	Fri,  7 Jun 2024 18:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717784080; cv=none; b=Z8PmgbGx5MtiZFZ6FD2CJrpt3/KbF7m+hqrXfRU/gpj1OxDUZlE+792B2XQxPBBB4cB/K1m12xMnSjOWp9mxBqffLiw8sPbnBzML1N+HU6Y42TfbZ9HCHd+QTd4dSbLNhxQ0T1wkN7WzAnfUnoN3/QkBxdKs38txbkpCwcxPMv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717784080; c=relaxed/simple;
	bh=XSCL4Kp6mXtayBPdsZk+e57k/mgnT3XsXqN83Jok3KA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ftc9k2qfw06qpMbJcX67Eo7KQHfWxqVwwkdPu21wch7juzXBhkLOf0CRZBVCxPl7fTWuvSTcuS63p/mLz8H0nl/mXkavrxY3QzbqrIONY3A5Mu2hMvhHLWWj+8eb6tZC9r6nRxR4RgWhJGfwdyN5MqX4mx04XCAzjIFUcsxkbJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=OyJ3SZix; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 059AB20B915A;
	Fri,  7 Jun 2024 11:14:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 059AB20B915A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1717784079;
	bh=gYS5x90YK2hw9MkYfSAm7yemLyh0UTapDSACzKDm54U=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=OyJ3SZixMebbYuyy5hRN/GhazC41yBGq03tBuXhsGTEsTHLGIjXb3nUO2z8wPSSks
	 g6QODW2D+XolYU0AwL6eDXWGJEd1YF2g8RKCNeqn+XohV0elVGC6SjUoaZ5HD5/vM6
	 y9BzsufDi+P4s6oIBH0JrNF/MEgdYYOdR++dHKoA=
Message-ID: <28a9e3fd-9590-4065-b005-f1af0ae76283@linux.microsoft.com>
Date: Fri, 7 Jun 2024 11:14:19 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andi Shyti <andi.shyti@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] docs: i2c: summary: update I2C specification link
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
 <20240607111726.12678-3-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240607111726.12678-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/7/2024 4:17 AM, Wolfram Sang wrote:
> Luckily, the specs are directly downloadable again, so update the link.
> Also update its title to the original name "I²C".
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/i2c/summary.rst | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index 28ff80a2302b..e3ab1d414014 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -11,11 +11,9 @@ systems. Some systems use variants that don't meet branding requirements,
>  and so are not advertised as being I2C but come under different names,
>  e.g. TWI (Two Wire Interface), IIC.
>  
> -The latest official I2C specification is the `"I2C-bus specification and user
> -manual" (UM10204) <https://www.nxp.com/webapp/Download?colCode=UM10204>`_
> -published by NXP Semiconductors. However, you need to log-in to the site to
> -access the PDF. An older version of the specification (revision 6) is archived
> -`here <https://web.archive.org/web/20210813122132/https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_.
> +The latest official I2C specification is the `"I²C-bus specification and user
> +manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
> +published by NXP Semiconductors, version 7 as of this writing.
>  
>  SMBus (System Management Bus) is based on the I2C protocol, and is mostly
>  a subset of I2C protocols and signaling. Many I2C devices will work on an

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

