Return-Path: <linux-i2c+bounces-7083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859E98987A
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 01:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B94E51C20DDA
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 23:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10A017F4FF;
	Sun, 29 Sep 2024 23:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="br/MEAn5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5898768E1;
	Sun, 29 Sep 2024 23:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727653988; cv=none; b=osVSd4+VqzV8Aymh1aIiO452+0o7ysmrLYmIv0zHD56qiPGtWti1Wqs+/xekZ1PHjp8GkqoYEzzitucirT5rGoF0QN0Myu06Yg7MKQmJxkGlsLnFUUS5Ee0X8WiDsoQBK3VsDsO4dcNA0vjaFE2JTvxlVcyAMWMmrtT2PpOgZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727653988; c=relaxed/simple;
	bh=LB42RInykBDbIcPuYXGvyRJ1bRQqMsqZUC9Lm2Qioh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksKgYZVn47RiaCg0IS+8KPs9nYwBtuYhUZRaovGCTDnpPLsj8RSUaFpEqttYxMQ8YJcMFHpG9/n6HUEd+ini/C3AIFbIJDNeNr1wf7X7Xhqu4oJccnW5C9+SrWZ4PO2cK21CQFIZ0GuEw2q4zTW+3BqOOW4yoGTtg6B5vNWw0To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=br/MEAn5; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e0c7eaf159so2103463a91.1;
        Sun, 29 Sep 2024 16:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727653986; x=1728258786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZj7rRCbSp5Le72reiEeyBZIYO4Rp1cDLd9uDCcf9yw=;
        b=br/MEAn5WPbFW9BhX0lz1SkC6xv+Ol2x2Yvyp3fZFNr30if0t3AfvINhQSM+t+xMkI
         T+ld+2W19st/68GqgioO18T9pfzu4AlEAfW4DJfeqANNabisge5jHXbyfPej7wh/J3jk
         NlSFoWa8G9RQcW5cJ5MgeRrcLrhI7hDN1ylG5PecFR1AN1gWvXXzXMekJ9oIKJEYcgif
         k/XWBlxvvzw1/0bH3XRkZekjplmiBXErcU1ZSS+woVO6+0Edao5Z2w/5/DOmt6tmr3pr
         AeFS4qadnQmUT10tRnY2+GQrsr8nH+CtdPG+l16QW/newhYDUgWVauvoYvTYd9WZ1ydc
         USpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727653986; x=1728258786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZj7rRCbSp5Le72reiEeyBZIYO4Rp1cDLd9uDCcf9yw=;
        b=ibxvLB5TDR7y1BujnQbXICrhlHk+h7SfZIlL9sqFZ/BrXtLOBkpz4RfvgWowPPJhLG
         2ZVpKj5WjiMsHJuneAm8mvCQq8Rm4Tdr8P0oKdSvjzu4AFwslykeI+B8R6YTr6aVj7C/
         7i3eE1s7CJggFS9sj3ej6orlfgXqqzk4xv0+1B647SGLTi3jd04uLpYYVtqfJyTpesuL
         gmKeHt5gooMGneD0xHOAn9Iw1vXf88jvTETjwmAlCaXYC9ajrBMNZzfYLw7JHZK08l1y
         pxjdvccHw6UAce0K0pPhBpwRUgEsMDAuHi/oSerpGd4prnWo9kZObktLLvtPZHW+NY4f
         wkgg==
X-Forwarded-Encrypted: i=1; AJvYcCVQBqKKYVH1g3QaS41Aa88rC8VK4ljv/jo8MX+by8ir7uvPYmPepbkwAPKxkhe2qxxEXlxMBc1GQzX/XaqB@vger.kernel.org, AJvYcCVdgYRtQxIFm2TgmersiDKML00daE305TIWUdG7gtdKvHvLbX1blna/gVSNHvvM59yhVYmVlnWsYvVH@vger.kernel.org, AJvYcCWYN7VHbSHinr4cRJPyFzE4ZWJRppEvWNjhwS1f4lzRdpXD4ndWwfSHeDlUxPRtEpEC8hdZVUr4gWfm@vger.kernel.org, AJvYcCXNvzbPpFre4tKiyPilz6DLy/rxunq5A9eH5S2wd70GtlHwSQ5yFeeXrqK0pFFATwfdK5N4C6sJku+dgyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWuKdacwhMP5XNPWhLalsNPaiIoVK9dPTp6y+w9E2jAeNMIcP+
	MUDrgn94fahiAaLd5metn8Tay4uPZfoaZhJWyUvSAWt0VQLQnClN
X-Google-Smtp-Source: AGHT+IG9mOvJW4+CYn55cAUlBeq5AoaNchjydiS1B6g7Lp+N+fyK6WtLToJJyPNspzD3bpThL4wCdg==
X-Received: by 2002:a17:90a:ad8b:b0:2e0:9236:5bb1 with SMTP id 98e67ed59e1d1-2e0b8ec017bmr12709284a91.30.1727653986182;
        Sun, 29 Sep 2024 16:53:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6e13d01sm6414300a91.42.2024.09.29.16.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 16:53:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 29 Sep 2024 16:53:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 4/8] hwmon: (amc6821) add support for tsd,mule
Message-ID: <a49f51e4-71d8-4a88-9827-51db67f208da@roeck-us.net>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
 <20240906-dev-mule-i2c-mux-v8-4-dbd28a150e41@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-4-dbd28a150e41@cherry.de>

On Fri, Sep 06, 2024 at 05:54:15PM +0200, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which is an amc6821 and other devices that are reachable through
> an I2C-mux.
> 
> The devices on the mux can be selected by writing the appropriate device
> number to an I2C config register (amc6821: reg 0xff)
> 
> Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
> when probing the amc6821.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Applied to hwmon-next.

Thanks,
Guenter

