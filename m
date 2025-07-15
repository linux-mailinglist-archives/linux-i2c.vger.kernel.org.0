Return-Path: <linux-i2c+bounces-11948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C2B058DC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jul 2025 13:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C53C5563E5F
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jul 2025 11:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8462D8DBE;
	Tue, 15 Jul 2025 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+qaOCaF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED41F0E24
	for <linux-i2c@vger.kernel.org>; Tue, 15 Jul 2025 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579106; cv=none; b=FcdBk2u0nWsVnp+RlaMM0miDPJs//84yr9hDK3NW3493IOnza415HhdT5o1Tc4vS+riXxefU7JbVwCKAQvGL7BvMWgzTTIzWVBAueFeeACylT6KSZN39ziiN68X2NHHfSsvCDmK2JeJRKWh3tl0DJUL6uDh8y7fHh2XCCjYc3Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579106; c=relaxed/simple;
	bh=B1i0Jy+iCmpT+TMn/plz7n65ehc42gy7Y3dHtaF5bWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksRK3AyD6EturjYvnFXqoIu3YPdi6K4pQyeeGwArxvGP3PBCVz8VQBFD10gb6vj4q5M7i/Qjgkrm+gcsr540eCpgeUD/E26pILYkz5ZYNMwKvNuWDIsjLUiMaoJExkvIaCLzDAqH/m4nddmzjRVe1hK1O16F/m9QWAEo3Sg9AQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+qaOCaF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso38989655e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Jul 2025 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752579102; x=1753183902; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZsnxPQOlzjyNW6a1iVcFG50PC2MlOpTArybpzvfKj8=;
        b=B+qaOCaFm3Sm0HWodh8FZLR3fJzakOEjjy8BcWhrMsAjxlXM/qJQFmHbdluSe762Is
         xuOyuRi3flfn5XjdqAoHDJoyqGBke08wj0NxYI8ZUweuAtpVBHnmvgVfEtC19wtJ7XTr
         mv+KwqcLi3RKqM9tFD6jNjYPTsSVWO3dwv/ojPc2zCmxEjrjNL2ETgrjZY8cpV/IRGTa
         JB4F1KMjRKihuPFXgzY8ws1k3Dv3/MTrFFwUksV8pTgH9lkGzD5/KWawxJw6/gVlxgXX
         UD8Tfg55+PZNInVw9NpwrwgmI4M4dls71AciUNnXOUvXW5GYxnHTYKqVJpVqw7vkpf1d
         sY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752579102; x=1753183902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZsnxPQOlzjyNW6a1iVcFG50PC2MlOpTArybpzvfKj8=;
        b=G+N/pSORXiQGR7GmToJgYuX0yln41CAusjIat4uwsgTRatJqrG5y4iKfPSuiFxQlNn
         QJM6sp4r55d+SdevWI59lPOiCQ6wuoA+G4VtF3HijKBFwMZTh2cPM6nHZevepx3T2tU5
         etLECL6rxTyW1damda60vRVa7WOGcc+z2jealwwsvUdXabtA4LC0XkfqEKgek6/91MHV
         Qpls3/2lgqUvryw6n7a8rPYylek17zxfb2VcKVi5DaRJcPghWDdmsTLBN4LX3VFohkkk
         4cm24l8vXelFuku93OMiNVe8p848+SPXlE+1Mc8JdTTAP9bHVkDt0u8bxlkpzPP0ptDD
         T3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn3PSFfREVWYmmoMb1CQeBTzn3Rv6KkbJrh9gX7CY/JOCdg54TouN9xDhMDIKbFckp2jvS9Ju11pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBa2DaWqwp8HAFYThXpwV0PJKSGai3bXVEG8IfTyYdUbvfKXi
	dfE2Nch5LmFqcsvOvaVQGBG+Yl0hLQsOZlgTTSe7LOoZQyS0mMCsmoBhVew4yjUKyC4=
X-Gm-Gg: ASbGnctzcIJMTqv+zmF27I++rMj0qYdMamysYU9nuThjtsSs1G2KG1f6oA1HF+WfqKC
	Hb9BGbc+YoExXiYmbR6TxZeoagMLrMSb3Cd5Szu3q8ribpNVbcy/iZYRc5j1dsv8tIaCs8uFuw/
	fkq+1yjsQ4IpS9zD39lYHIgzeDCWIhzIFrWxrMEpzFUcMAWJJDi+08qghnnJBnIowiNDzR+yjcB
	XTyEH1jJuI/ocu5huI9NNVTyQMN65PgTPYYo51GNYGsCh4+FSfjz4uQLB+M/IfT49CK8hMMQ44P
	knKjHWkgeYJinzZUhNhtPZdVJTMQGvkw6NXP2rt6zK9T99hoCuHhcaOVrFrNEghjeW2MZC9PlYf
	7mDq0ym1Sm+qFFeYPs6KqbF6Kur+ZDc767dKkeELiPvVCq8RRgXfAzy/hbqAv
X-Google-Smtp-Source: AGHT+IEKhxXOiGy+rRPRZDHvcFkEUJsQ0d14+0tBKDdlW4a1Tc6Bru+r7zuXvqC8THzAs7ZRIPDvKg==
X-Received: by 2002:a05:6000:1446:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5f187a4b4mr14608177f8f.7.1752579101919;
        Tue, 15 Jul 2025 04:31:41 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2025sm15173960f8f.31.2025.07.15.04.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:31:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:31:39 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	tglx@linutronix.de, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/3] dt-bindings: timer: mediatek,timer: Add MediaTek
 MT8196 compatible
Message-ID: <aHY8Gyo5uy8P6VP1@mai.linaro.org>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>

On Wed, Jun 11, 2025 at 01:07:58PM +0200, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the MediaTek MT8196 SoC, fully compatible
> with MT6765.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied patch 1/3, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

