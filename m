Return-Path: <linux-i2c+bounces-12542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3457B3E7CB
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 16:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13DD91A8664F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 14:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFEB340D86;
	Mon,  1 Sep 2025 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xip1or9B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2096212575;
	Mon,  1 Sep 2025 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738167; cv=none; b=mOtS96CubN2rcuRXc+8H669LpgRWBoqyQ2n4sW7FLe7TJg78gvk0BMMWHQaEAa6di0b3mtqGc1SW7wcQvWTT4ArRe6miheeo+SdrGIftcEyBK5zNfiz0Y4woh3xbHkr4YWHUsq6EmXfIdtBO5ow1ylytVfwQr4ukU15FhMO0LBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738167; c=relaxed/simple;
	bh=k0bFzCK8PRAWkJ6lPZuCCzGBzsv5QXY2t4q1dCUumyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLPoH+UXtCuVy1chuGssRk2hqhEjevn7xoLxOOg/W7iEr+V1F6pc+HBNW/iJjCf6YQS1vf22o112mfOXY5m4Dss/0UQprPSWOFKrGvytQHXRCqHsIsnSQ4msaCWGVts878WyZiJj3G1vWhkP3G3UU7DR20bDhwvieV6RG1boftM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xip1or9B; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3d48b45f9deso973579f8f.1;
        Mon, 01 Sep 2025 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756738164; x=1757342964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/giPzS+fk2Ol9RxCiUq6yACQ50TfsIs6m8m4/nlKqu4=;
        b=Xip1or9BAvjByzDtNTnoQOIf1ezMJVxQDdRNIhhMV3yBJzD1L/b9VadjtSrnG7NZKq
         PBGtHsNmAvH/55bWdwfj0OuhVEB/VeGmzcRpiE85TG/LphQcQ4OE7F2mI4AZl9G6zZ/S
         J9nDIlX37+YiIGmhqHKJi87LT+BAecImjkpHOHuJkBEQZ9pRyQ1DxmFHPh/TPRISBzcT
         nq1zVv+0qrc5vNnWzE6u5oX7j9KBi0EPX30gUqOciX8hTfVdk2pWb9H2lkLkGiPzFocI
         8J5H8qWE4Nj4Kewx6NrN1zoonq3xZHzui+3Q5BajFQ0SRv1AeJXXFVxlNYjM01nzARSr
         Cy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756738164; x=1757342964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/giPzS+fk2Ol9RxCiUq6yACQ50TfsIs6m8m4/nlKqu4=;
        b=isQCMu+1CD7AZktdW/MzPGqs6iMMisDCEXcpMfWADpn/IOZYDJRbLIp+dH21FdkGuc
         ZDddQSgJ/s2PZtnHR5jG1wP1c/b7HBR9I0iWaOUIu+6LtHqmaMcrQ4nm3X+ZBOnjS65n
         rqVAspBj1mSHiJJUr0wSKUvnsXqrwaCmrBMR02lBP6l4Lk/yZj2+HIvIFgIhJMr20RE2
         qZIu4CqUu1ah7EV0Jy9vB8UEB4g7IwrFGWL+JxkkTkh47VPRLe14oe7cYz37x8eX4rCx
         pnUzGtB3w60FDvX374cAsnwKAKPt65xnOJm7wQhiBezxGZtNcNt6kCPyguWNfJ0vj2X8
         aBPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtQ7/EiiVlG+DGok9N6rla+9/4A1NtAH6RwzpLQynroEu/zPu95rxU490MGuE2cj7BKrkibgDpWlkyKanf@vger.kernel.org, AJvYcCWXGS+qfXY8KV9zxe/TbDsM8Rp1E+tTjZnGvONnqA7/cOvCNNnDlMwkzD2sgRxJf6J27YuoIsm5@vger.kernel.org, AJvYcCWmekuuNoM+N+PpJaNnkn/dCKd5N/T0puMgXIJW3g0mCnqkhX/TqsxbiEs0TIUHkS31JfXW5EfnLqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXa8GKXsb50t7YtqG1gC/KP4lVVUPkf/vUp8T6l2I5eDFkM0R
	23pmgvdEfN3d41LgXl2IylNkT/PwjvCA2Qq+svgsl7AK5iUmkBVY/K9r
X-Gm-Gg: ASbGnctGRyMZmI+NMfO6a37gXvtLtbpgaVvzvIsDop1tDUx2W/nkaaufqw9okjrFHo3
	5JOwyeLx7wTjNd0LJr5fz2obiMnp6Kxr3+7UlqXCM4stRqmkv9oibOWoimVmH0hz74atF87znZR
	b0kasNSc4V3LXq3EXCdzZ5pVR8cbJ5Rom/EdY92SGDXlNuLfJZit/aUttbcK4szN2CD5zwdUp09
	VYfC2uNBgfOcZ224vGL+1lxTHwJnIV73iITjMm2Iwxdo59r6C+B3YeravKmyIRKXgjXgKou0kbV
	fJu5bqf4MITRJqLH9/wm32UAYEXWDC70cmYvsTaei9Lj7yIZ51sfR+c9Zt5h9lzNI4u049REbg3
	DLIY2XT8CsJChu9t6jZEdL/8KKtKLOpvf
X-Google-Smtp-Source: AGHT+IEZGoGq98Ijbab1SmiHs2tS3qW8FBTqQ1v4FFAbuRCRgb71MOcnfTnqVgiDXIcwenCjplVkJQ==
X-Received: by 2002:a05:6000:26cb:b0:3ca:3206:29f with SMTP id ffacd0b85a97d-3d1de4bc29emr6618252f8f.40.1756738163806;
        Mon, 01 Sep 2025 07:49:23 -0700 (PDT)
Received: from [192.168.20.170] ([93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83f86c8dsm69415965e9.7.2025.09.01.07.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 07:49:23 -0700 (PDT)
Message-ID: <587f46d8-598e-4509-bc19-1e6d1b61a624@gmail.com>
Date: Mon, 1 Sep 2025 16:49:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Content-Language: hu
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <aLVle-fEMXlQlDR-@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aLVle-fEMXlQlDR-@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 09. 01. 11:20 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
>> There is a long standing bug which causes I2C communication not to
>> work on the Armada 3700 based boards. The first patch in the series
>> fixes that regression. The second patch improves recovery to make it
>> more robust which helps to avoid communication problems with certain
>> SFP modules.
> 
>> Changes in v3:
>>   - rebase on tip of i2c/for-current
> 
> Hmm... Why not the i2c/i2c-host branch? (It's Andi's tree)
> 

Simply, because the previous versions of the series were based on that since
they contained a patch for the I2C core code. Additionally, I did not notice
that there is a separate tree for host driver patches.

Although, I could send a new version, but that seems pointless since the i2c-pxa
driver code is the same in both trees currently.

Regards,
Gabor


