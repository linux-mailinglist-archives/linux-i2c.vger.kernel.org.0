Return-Path: <linux-i2c+bounces-4234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B1912B02
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 18:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21AAD287CC9
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 16:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8628F15FCE7;
	Fri, 21 Jun 2024 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="CtUxue4e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F09F15FA65;
	Fri, 21 Jun 2024 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718986321; cv=none; b=PPWlOrPtdGeRqx4YV9zvI5hO060TJqwBjzpw/qRqg3Ti0KTlo+mgQyWQCC3j2f3fYidFRnM6KdpE9R6NJT3rpoCbWDQIET/kNJUjs0/gZefZEV9eD09Kl8kDzryVV3p8Fu0d4vUB+gvP0igABimTbTW1nC5cR0INkbLzr9Fmaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718986321; c=relaxed/simple;
	bh=QvvDuDvbrukcLrOcjyh23EIIArxuyK9vhuF4A8WlSrc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=R0CHh2PcwZBbX3SEsBJcWx4vPozB4L7cWa40toQeJFUR47t2fr8d40LYqp+9KxykqD5lMsO+hhbr6PA2x4FJ1isQntEkBIJd6lEmHmOg4BcCyBQWxYwomCD/pVoTvw3yYs4tpoCyYR6O2e0qkzwLr11e+L/x0z86CMdkARfk72s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=CtUxue4e; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8E38F20B7001;
	Fri, 21 Jun 2024 09:11:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8E38F20B7001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1718986319;
	bh=EEiubN4IPYExst72rrOF1HBGfkUSySKf4nywX7nKgeg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=CtUxue4e7A1g6TqPGMOO/KmQSaiIWobdlVVvGNa5CP+jrnUrohn1NAKNugUjOeEyk
	 KSarcF8KDIktkvO/jXl5NXKj2+IdSVIBaajjQDw0DBPhygKNhH23VDAPf2WHA7nbpl
	 /2JobM3nEhvMBRejxbWeXJQCUF0xr0zofuW6mShg=
Message-ID: <ca2c671f-3e38-47ac-a96e-50ce776a3500@linux.microsoft.com>
Date: Fri, 21 Jun 2024 09:11:59 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 6/6] docs: i2c: summary: be clearer with
 'controller/target' and 'adapter/client' pairs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
References: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
 <20240621073015.5443-7-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240621073015.5443-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/2024 12:30 AM, Wolfram Sang wrote:
> This not only includes rewording, but also where to put which emphasis
> on terms in this document.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/i2c/summary.rst | 41 ++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index ff8bda32b9c3..579a1c7df200 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -31,9 +31,7 @@ implement all the common SMBus protocol semantics or messages.

Looks good to me. Thanks for the patience and the update!

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

