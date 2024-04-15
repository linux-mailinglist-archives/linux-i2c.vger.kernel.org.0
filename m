Return-Path: <linux-i2c+bounces-2940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E78A527E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 15:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4C0E283CD0
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 13:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397D574420;
	Mon, 15 Apr 2024 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="H9u2sNuJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033D33080;
	Mon, 15 Apr 2024 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713189579; cv=none; b=en7i98GhW5g0NHgUpIIlR/qL8EZTW9MbQaqijT8hNK+kx8FHEhKTUKMNgdw1Nx7QsQPUECkDj2V6Rzmmu4PZ5iS0iaKqcI+KOEcoI7yv4yLzMXtZvpWWeMqajEHlETrx/7tOU/W3VxZQdBeKmJdqSJ/8KUcWMVLgmKFnEB2nGcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713189579; c=relaxed/simple;
	bh=Tq5QuPKNZYFTN293/j6KeFKcIq45oy1FskvMM4kUq8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CuoM7/Jz6EEUt2vOwLAdQ44Ff6OiAHO8lxW2UnYRbhcblPA8KNinb+oqfQsych1pH/qBvCiOMzUkSotuuZQoXSzR4EjH7ig+tKaBFNCxGLm29ocsfIgGgF2If0nG8o8JZFtM1SK43eckxeIXc/dCWuaL0e82wkMRPtmsa0u70Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=H9u2sNuJ; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4E294881EF;
	Mon, 15 Apr 2024 15:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1713189575;
	bh=Cj3mFW1RPC+XTHLspPi7w+Q+NY6KDZvpqLKAR5dglRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H9u2sNuJjz6Ek0bTU51pap3mtWmT8tl7Y5MVVwT940pK5pchDyCVyKTnUOLF7Dgi+
	 30ol21PCeqEd/NDwmAkPyzqYH5xjOK/O4sV8esz8Vo1tmc60y0cvyAlsK0vC7yxGP7
	 2bB08hLdLquNXrdeKshYDrIH+If7E/YP2DsBgJF5BoidPuVRBF1i/pbKDwHyl+tCiv
	 lkvJXc5aK0AW4Jlp5D5rE7kRv4x67xps0Z7q+ZsIj1YQ6qu1zUVsygMfS7p5f0us+E
	 hPmPHfxuUyYg+W/rxPX6NGcmWI1s1IbAzi7YjRF2RNkjxhTFvhgXFTO3Gec9DqZw3R
	 3ZvvJYyFp29Ow==
Message-ID: <cb857412-add7-4f06-8fbd-7eef57331f8b@denx.de>
Date: Mon, 15 Apr 2024 15:26:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Fix ST M24C64-D compatible
 schema
To: Rob Herring <robh@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240415131104.2807041-1-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240415131104.2807041-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 4/15/24 3:11 PM, Rob Herring wrote:
> The schema for the ST M24C64-D compatible string doesn't work.
> Validation fails as the 'd-wl' suffix is not added to the preceeding
> schema which defines the entries and vendors. The actual users are
> incorrect as well because the vendor is listed as Atmel whereas the
> part is made by ST.
> 
> As this part doesn't appear to have multiple vendors, move it to its own
> entry.
> 
> Fixes: 0997ff1fc143 ("dt-bindings: at24: add ST M24C64-D Additional Write lockable page")
> Fixes: c761068f484c ("dt-bindings: at24: add ST M24C32-D Additional Write lockable page")
> Signed-off-by: Rob Herring <robh@kernel.org>

For what it is worth:

Reviewed-by: Marek Vasut <marex@denx.de>

