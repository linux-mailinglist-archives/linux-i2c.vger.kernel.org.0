Return-Path: <linux-i2c+bounces-13954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD9C2CDD2
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 16:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9BB5B4F44A2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 15:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678DD284890;
	Mon,  3 Nov 2025 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHUXA9Fr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB9F28506C
	for <linux-i2c@vger.kernel.org>; Mon,  3 Nov 2025 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762184195; cv=none; b=RedgqIdTuiLw7pzWxPhj52pcJQpDTztGbyulHHGAwNk1D7Bzutv+/TiZCaZzlorSJfrTh0Pqr/nbzjaOuqS20iPEYpOG8+aqcKSh2137nC9oeqKUhZBmmfFR5B8v0Pon1kKcCBgsOZB+NkJe6Y0JEpIDRCyM3+jXUs4nufcZmD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762184195; c=relaxed/simple;
	bh=9a21/KBVvkmPQPp7FHNPyVGxLF+TxYPOvWDp28f6V84=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FvjdNX4C6+FULkgJVo7lFWA+Hv5azVJ5uLawDTZ+li6xyBiGahZPXQ1xuUZUGgezOGQn242AGMJrxtff8deDfSaaHArp38qxWUXSo8JMV0MgLEPLp+/49PSi70FBvQM9t022x15gaBpmQ5RWiULQW0L5mI2nbMiQV2Aeb4bLDzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHUXA9Fr; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63c0b633c7cso936038a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 03 Nov 2025 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762184190; x=1762788990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqsZQdpm3Rfa0Tiqla/fYhy8mwOqTJ7ORQKYe8z/7ZI=;
        b=DHUXA9FrVs8Eor4vKmFRHOUnUgQ/87PlGwcdRDHxg53nn4jtgT0Eh/yQ06X/lag/SF
         NOQF1DfZd3UXBTrpvML4xtahIqasNHt7BKwtUklRXtD/+X6PE8DwonJjatBXBqUufVEy
         WEyQrglGWD8GnucZhFBNWgLkUvX+GEcpl9YR6Ce/Dn5NrxvQAOrAu0fZo5r7c2ZtUTjd
         gLvKK07+YNOnrgdU2OLZg2STqu4sq+2lyDHlAYK9/kCBjLSv0pOFK2KQ5iQzvnev0pCn
         RmOf4iYFkGNcvMTRpWCnd6cUSh0kk0ISxnlrikm6xtr59+J5qqteeSys0uscI7HnTLK+
         sv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762184190; x=1762788990;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqsZQdpm3Rfa0Tiqla/fYhy8mwOqTJ7ORQKYe8z/7ZI=;
        b=kT/SSt+i2maZD6TxVpa+BkS+rv8YaC5mU49oSKFh+MvnQH8xct2B/RQZV8qChjGZhP
         UdRNtxeTRbrkCEx0QsDzqDIIMLPCAEm1Fez+PNzQmZvToP1Nyck4z5SmQY9d9GmRxPci
         ls6QEfZB/An3XHGtxrzJZxDuhoTBVt0BJs0Za6VnL1evHn7QF799uZDGKqD8ZTWvdvYm
         b9qAkIQ9CusjWGT2b1bZiGsBIlEDTAD9AQQhrZ6oklYTz0Jd5/DR6/q7u5cTT4ZAkFeN
         DujDio+Zrw2Jj4p+c0aiEyZZACPI7e1w8Wnr8RG5QN8GSrzo9PQkp4J6d6BjEL6QPL0z
         I31Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIMaL6z8svoEs4OM6jA49EfJ13IT/YrEwnobuW0I0HsDl7tEQCXpNOJV4T1zI4sMWRiiev/nRyyig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3I0avPxoq/4ZdTpK63HKfxKzLsDdsk9aNPW75FF9sjQaRO/4T
	SvJZdLVr7bNvqzounuy/hiZRSUXUWrs3HDC2iN4dDxZEGTO0xJEDTKmwtCbKOtqk0mPJ0BuoSnw
	gg6cP
X-Gm-Gg: ASbGncsWlhU4rSgJqlDiN+cWpj8/EqMCA3BH+p8teL6DjN9DnygbfudUUNqzJEPYhfM
	0ZRkAeM3KoOFMJhctxjTj0KBr9cHZ+hL6uWNI9gxEw1kWsJngi4q1DEXia9Xk8hCS7EnV0HXNJY
	09VlFGIBYnmv3zd+sfU8iKv0rACosSexdqkipOUG4bg02qfU6xLWk/kaiqwFsIwTt8zyCK0JSf8
	xJRTzBBUhRgvji6N3VTjXQRsMin2BRx6FH3FIuFL4whogRySQSwmDztH7DepFiCNm3+1Me91gaX
	kvkuC8vq4EfpjZtPQbWr3La01lQCc/EmQ9eohdSDsILZh5vdBYcVXfCl3xP89x/Rs/3K/RF3t3j
	TAqJ3MEiNI6EzRpivY6Uhb9UbukiIV7uOhmXkK2YIL0pp4Dxi84QjrjEiHvMPriN2rNqOnqqoK4
	Tulwlq4sqGoEJsJiBqC4etY1P9X7IKjFU=
X-Google-Smtp-Source: AGHT+IHqIxq5JiN0BcZx+uDcuhLaOrCJKa4dQlLUXmaoi/Ex8VvhSxyr9CvgZ/uD+gqIH/QVdOsjpA==
X-Received: by 2002:a17:906:c114:b0:b41:873d:e215 with SMTP id a640c23a62f3a-b70700b6ec2mr689292166b.1.1762184190576;
        Mon, 03 Nov 2025 07:36:30 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975d24sm1076029366b.1.2025.11.03.07.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:36:30 -0800 (PST)
Message-ID: <69ef304b-491a-4434-97c1-97eccd99ea66@linaro.org>
Date: Mon, 3 Nov 2025 16:36:29 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: muxes: pca954x: Fix broken reset-gpio usage
To: Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wojciech Siudy <wojciech.siudy@nokia.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251103151905.297014-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251103151905.297014-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2025 16:19, Krzysztof Kozlowski wrote:
> Revert commit 690de2902dca ("i2c: muxes: pca954x: Use reset controller
> only") and its dependent commit 94c296776403 ("i2c: muxes: pca954x:
> Reset if (de)select fails") because the first breaks all users of the
> driver, by requiring a completely optional reset-gpio driver.  These
> commits cause that mux driver simply stops working when optional
> reset-gpio is not included, but that reset-gpio is not pulled anyhow.
> 
> Driver cannot remove legacy reset-gpios handling.
> 
> Fixes: 690de2902dca ("i2c: muxes: pca954x: Use reset controller only")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---


Maybe I should also add to emphasize:

That offending commit 690de2902dca breaks the ABI which was:
1. documented at
Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml (line 57)
2. implemented in Linux kernel around v3.14.

This ABI breakage was not justified at all, not explained not even
mentioned in the commit msg, which is a requirement (see writing
bindings document).

Best regards,
Krzysztof

