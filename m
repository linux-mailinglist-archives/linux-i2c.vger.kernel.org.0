Return-Path: <linux-i2c+bounces-11606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C2AE9C7D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 13:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18CA3BDD4A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 11:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED612750F1;
	Thu, 26 Jun 2025 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dyN/dgUH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C0E236457;
	Thu, 26 Jun 2025 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937257; cv=none; b=MWwQiLnTw05GFD3sM0hBSW0B+YCrue2chW5vAcKAUBsDiFB8EqXd9rKvOoWxw51MdOyCR1sWm03TtXbGfVfrOnoQE1nMXHSBfLiWoseuLcZLiB72+bB4bImkwmNHh4xjoIBmawh0qVJgo46vAQWwjOyh1YqP2C7yfOLuhnyOx5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937257; c=relaxed/simple;
	bh=qYNH4vaUk4p2sv3G4E4Kr5GU6WBRTksGNtuSzMmQ3oI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgbfkfxCeIqrq4GOHmkj5Rqjdq2/zaq7n7nMU2tb/xZXVeS33qJV3DTlDxzxxncE0daGnuhyRS/Zv7obaX+a+V41MSlsuQw8mQ2v1ZAw8Prqhu73qv9+YOXPMRSmwh/utG3+6EAplxTxMtY/RAFm7FG7q/ERPlmuF0tCgJUBGvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dyN/dgUH; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA9Noi009058;
	Thu, 26 Jun 2025 13:27:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=vwG4bJ7/mdzDFYMPY5C4D76n
	QjHjkaEsopktP0VfbWs=; b=dyN/dgUHMztZN9BHU495fNr4g9GL8Bz7w4VC7Ncg
	oXjetj3EJLNs/GerzIwKsq8zgfuqzrsMqixhgwFgkn/E/OlqfeOWuZu+ygP6b2od
	sq2TJGB17hTiurvW0VpdxTkm6aozvYFVUVs1dLcw9i76RYznbuCxzLYYJ7onxvf9
	lArPS9MwOUdN5QywFPw3AQxlsN3pBhMK0dUYYKnTv0lbfw8BS3SAgT8+LxO1f0Ia
	paUCIj8hPOh4sDfiYqSiGRojRbljVzHC+fDu/0VUsMjzwKLjGmFZaoJ8xlt612Yk
	nTzQHWaLW+r9G4D8soKHxstdU2yLcFS4eG2ViHl73HiKpw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33q2g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 13:27:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E25874004A;
	Thu, 26 Jun 2025 13:26:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6B515C2EAC;
	Thu, 26 Jun 2025 13:24:35 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 13:24:35 +0200
Date: Thu, 26 Jun 2025 13:24:28 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <long.yunjian@zte.com.cn>
CC: <pierre-yves.mordret@foss.st.com>, <andi.shyti@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <fang.yumeng@zte.com.cn>
Subject: Re: PATCH] i2c: stm32f7: Use str_on_off() helper
Message-ID: <20250626112428.GA350099@gnbcxd0016.gnb.st.com>
References: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01

Hi,

thank you for your patch.

On Mon, Jun 23, 2025 at 08:31:44PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> Remove hard-coded strings by using the str_on_off() helper.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e4aaeb2262d0..ef15475a7ee1 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -34,6 +34,7 @@
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
> 
>  #include "i2c-stm32.h"
> 
> @@ -722,7 +723,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
>  		setup->rise_time, setup->fall_time);
>  	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
> -		(i2c_dev->analog_filter ? "On" : "Off"), i2c_dev->dnf);
> +		str_on_off(i2c_dev->analog_filter), i2c_dev->dnf);
> 
>  	i2c_dev->bus_rate = setup->speed_freq;
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
> -- 
> 2.25.1

