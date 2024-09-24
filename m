Return-Path: <linux-i2c+bounces-6961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B64984B9A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 21:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7404A28550E
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 19:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62246132114;
	Tue, 24 Sep 2024 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="vUndb1tW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx15lb.world4you.com (mx15lb.world4you.com [81.19.149.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4780C12C530;
	Tue, 24 Sep 2024 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206286; cv=none; b=QOzSOZH3uS2pWLSyczYshHux/GSj5Nm4tAA4F+IDD93gGHCXlUlUL/vdyzAO9RifNsHvZSVCDJvLN2YRcCha+H0bVR+1gvCVPGx4zilwEgu9WuI65Q5XC9uRaJcwTMitExoDW2zv3aFKLyc9IAKwB6MF0O321A885oRVWFghwsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206286; c=relaxed/simple;
	bh=WyMVve/4nOTWUpMDHstdSM0k9eZAZeJvKmnnPzjPQR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=X0GIfaB+0YCdsAZmpwq5k1uUag1piPCgePEMDAGBLvhFQ7WBchXSYmatWQmjImKoAxk1zf+hWevkCMgZJBSd2r0epfFUZ2/JL3boCysp2lNEXl2JZ60zJEp4/Y2ESoVrSIU22NR046+HuznY4ud+xjvEAi+qIEBH9nxaBU2y16k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=vUndb1tW; arc=none smtp.client-ip=81.19.149.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=us32AEeL3zn1alwdBrDjPe6AeXRH5zvhVcY+Vl7353Q=; b=vUndb1tWWxrxNkQ4te0vbq9Dyw
	odTN/iY8vxVG/IVnNO167AUw9DIVIKPc+gqk5/cr5Une6TiiQITdHs3tFyRKFZIUkAr1c5db5xM3P
	t9EhXoJ2wHkG0UajM4Q5hSiRAurOXuCkkBMRuRwZpNH0C8Rh3Svff9YIDeu3op2v3Opk=;
Received: from [88.117.56.173] (helo=[10.0.0.160])
	by mx15lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1stAKc-0000zJ-1g;
	Tue, 24 Sep 2024 20:32:14 +0200
Message-ID: <4abb8472-5b93-4709-b37e-9f19b9fe77b7@engleder-embedded.com>
Date: Tue, 24 Sep 2024 20:32:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: I2C_KEBA should depend on KEBA_CP500
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>
References: <39a6ce50b152c8e435c78825ab56aa714b54fce8.1727170404.git.geert+renesas@glider.be>
 <HE1PR0702MB37698642CB041A4D981B7B70BA682@HE1PR0702MB3769.eurprd07.prod.outlook.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gerhard Engleder <eg@keba.com>, Andi Shyti <andi.shyti@kernel.org>
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <HE1PR0702MB37698642CB041A4D981B7B70BA682@HE1PR0702MB3769.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 24.09.24 11:34, Geert Uytterhoeven wrote:
> The KEBA I2C controller is only present on KEBA PLC devices.  Hence add
> a dependency on KEBA_CP500, to prevent asking the user about this driver
> when configuring a kernel without KEBA CP500 system FPGA support.
> 
> Fixes: c7e08c816cd2fdf8 ("i2c: keba: Add KEBA I2C controller support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/i2c/busses/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig index 0ea437c76167ad2d..229b8166ccc03803 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -782,6 +782,7 @@ config I2C_JZ4780
>   config I2C_KEBA
>          tristate "KEBA I2C controller support"
>          depends on HAS_IOMEM
> +       depends on KEBA_CP500 || COMPILE_TEST

Makes sense. I will add that dependency to the next similar drivers.

Thanks!

Reviewed-by: Gerhard Engleder <eg@keba.com>

