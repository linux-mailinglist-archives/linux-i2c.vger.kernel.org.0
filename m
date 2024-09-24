Return-Path: <linux-i2c+bounces-6965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02982984F2B
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 01:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33F4F1C230EA
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 23:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBAB18953A;
	Tue, 24 Sep 2024 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="O/O7787i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0591F80C04;
	Tue, 24 Sep 2024 23:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727222148; cv=none; b=SnlCBuNSCmKGWH9GosgSMVatAqi7ejzmOLknxDB8h4dIExI598GifTMk6pINS+T0rh0pcF01WC/MWjX0weP9c5xr8uxFnYqoIAPdXkfLXN5+w+RQx9PVg3AgzUWr/tAhwduXlqeaG6ibbw810jA39C4QQ4jUKR/7wVRdaHmjPsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727222148; c=relaxed/simple;
	bh=rVKHV8r7feQ9rxZtQ2JS6CvOADyPCPpFxyh8SkNiB3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDLVqxOZdZdD8Tg06NHTjuIdfFuSH3Zo4rYWj0J4HQwv+MB2ljPx1gb9ZqPYDDn9zxTr4xFOndTGwW1m5H5ZMpgLBg1gmijg/LVgcttdbMD4egvNoIRXYxSktkH2mrOrgry8R2fccIzYnoR4uPjB63J7H4kbXYWamC/xvJJSbw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=O/O7787i; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1813F87705;
	Wed, 25 Sep 2024 01:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727222145;
	bh=YaIU3P75YrbUr8RzAtCkpnttoSMxa+vUKhokDYVBhbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O/O7787iMoSuaVv38D8L+JFIQb290kzmSTwzyleCsCqck0Ca4crwgBLW6n+gL7vyz
	 A0Q6tC7zhJO2zCbzAtgR3QZrUr/hYUxvD3YJhkwX2sRS4bKyAGeqJk2mGOB3iL645V
	 mtqQVm/WTDpRG9EIKGNFrRbHBW1/zZGnuNutPRZ4JMCNGmJf0SR4Hm2Bgvl/vJ+QNP
	 FGF9SKyHDYN2fF6bGVVrICnGYYhizjbkyBL1AobWgd8ZXHD7tAjns8TtvglKO+u3kh
	 anE6WHUn2cbrvHZq0FEYbd8I4ENXrG8fV86dtt3rcmu+Gss1eNOSb9kBM1H8S/Zzam
	 gygT7sdoKDg6w==
Message-ID: <c181a856-164b-41cf-b512-b8dba3247ae3@denx.de>
Date: Wed, 25 Sep 2024 00:42:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: core: Check read_only flag for force_ro in
 bin_attr_nvmem_write()
To: linux-i2c@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20240713154001.107439-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240713154001.107439-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/13/24 5:39 PM, Marek Vasut wrote:
> The bin_attr_nvmem_write() must check the read_only flag and block
> writes on read-only devices, now that a nvmem device can be switched
> between read-write and read-only mode at runtime using the force_ro
> attribute. Add the missing check.
> 
> Fixes: 9d7eb234ac7a ("nvmem: core: Implement force_ro sysfs attribute")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: linux-kernel@vger.kernel.org
It seems this bugfix is not even in next, any news ?

