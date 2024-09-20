Return-Path: <linux-i2c+bounces-6904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B897D723
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 038921C23462
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 14:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40AE17C227;
	Fri, 20 Sep 2024 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOrnXgTm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33A217B427;
	Fri, 20 Sep 2024 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844121; cv=none; b=gfj/2v3DN2M4sgmyVF5ulpBaq9kTF+OCa4+iF7WAKHEp2Oxfjvpp+KhgPEDmU6r360ue7VMMLLa2fGbw/l8UbLZhN9sesG9efvyHkNIrmi67diqKZVh19KXsNTBDGE3JdxQf+ew7eZy9ypzmy7vrcpAtL9wHc6aBjCEqTVxJGTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844121; c=relaxed/simple;
	bh=yNQF5SZSaV0xZ9gcCY2fWRoUR09TbUOlCkRV9w3aG9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoUqHCoqrNgwivQM3sxsXoutFLDkTBpL02z4oB5tKDjLZs6ERM9F3X3gKIQ1Ok3nFWazeHmWOpfI9YW0Dx1Djdt+aUWC5D5+gf7W3cX8j95pe48n3EPMlSyFw1vYcEz+/7z/VuxAkO68iw3ZEwUIV1jPT9EiGrTzsuvhtgL4Wp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOrnXgTm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2068a7c9286so22622085ad.1;
        Fri, 20 Sep 2024 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726844119; x=1727448919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0aLWCOvmRfQ9tx0++umKXL26ekop1c8YzfPe/jk0KqM=;
        b=iOrnXgTmRrIW7nVlJRALc2xpX8GIuL/5flOZCuid0zv5yqnpHzQX/PxJdCLUZVQdgH
         g0iEI5gIvEHQa2Oy0bWN3a7JbYmupHubXYqSW8yR4nuEplvppxbRvDmnHY+yDbJaPwwo
         dGQhqzJa8GzNnB990eaz2WovnsDzK0Gx6h+POTyRvaWi4/NzsXfcq/axGGoNObG/e9OV
         7nq675oeqqpU/XkeKwh/77MAzET6UcKhEYRpDiUQaBv2cuyzL0dZxxRI5Uxv04zOi+Z5
         oyOMyQ7/R8H+XdiHEAKqaOa2HgvONAZ7EGCnhLYEzveep3fh+sWc/UJ2nUlLGLm0s3HD
         rP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726844119; x=1727448919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aLWCOvmRfQ9tx0++umKXL26ekop1c8YzfPe/jk0KqM=;
        b=dsTnXan6Km7ehtj3vySjBeA+8FR1O2d+ugUPt2hW7ZlbU1feH9Qg9P4a+bea0MAVHs
         +6NqIBb4/enHBGvPfXJU1xn/F9R+P2bsSBqAG1gafOKsS31s8phLVF/BOvL2dy5G1CNb
         35BOBiapctUqDcQmWp65BsU9vws8UM8+IvuF9+19zRRCWIeKHB750v3Yn30AGeSPEW9p
         HF4Dv696QAH1YnktQbqRlti2ioTb4bS2ZUBTW7CvUAD2KQq0cQmqwGv8kg4TREB72M0S
         1zj+Ytl0QFCyv7hrvCuHcZZA7hWWIe+CjU+wJFIvWYqedH3OVJliqt/w9WlPGg6fOYAs
         wrsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLzljOFQDAqZx0qHIOpRahPDJTr7JnKl8Q1XHdaU1dCPeZdxqCwcs88QoSHwK7XNsuJ3MMS8gRl4v5@vger.kernel.org, AJvYcCWTVkfh7tiUQJmc1ATSvzZV33e5uBRS2TgbPOd95PnxpZqGIrL58jSFrL5oBMWG0tas506Br9PFXb3D@vger.kernel.org, AJvYcCWtz0Y4LJuz+H8Gzxqm1nY4gWLfL9eqMTjD50FAk4dqXOwPbt4LZdHnAeWOdDB0g/2X8uh8BGoq/XE6HUI5XXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpI1tpvXPAgIJSpfe5TKwxt0mL84HtcE5wDSmB/IMZqNGq/E1
	evhDT0KkWmGXeWOyquaQvZW32Ql2eFdroZUsRC/qmAntJumpoNId
X-Google-Smtp-Source: AGHT+IFkl3OLlOqVjNuBUjWZomTccHc6drWK6KEhGMPDFIwkIwEKc8KxVKpjStEMwneY8fYtYu0szA==
X-Received: by 2002:a17:902:c40d:b0:205:82d5:2368 with SMTP id d9443c01a7336-208d8414165mr41277205ad.49.1726844119137;
        Fri, 20 Sep 2024 07:55:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794601126sm96179725ad.72.2024.09.20.07.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 07:55:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <05c44952-3421-438c-b8d6-7a6370f52ced@roeck-us.net>
Date: Fri, 20 Sep 2024 07:55:16 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] watchdog: Congatec Board Controller watchdog timer
 driver
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
 <20240503-congatec-board-controller-v2-4-681511a01c8f@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240503-congatec-board-controller-v2-4-681511a01c8f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/24 10:00, Thomas Richard wrote:
> Add watchdog timer support for the Congatec Board Controller.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>


