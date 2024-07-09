Return-Path: <linux-i2c+bounces-4790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0979192B516
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 12:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AA6AB2152F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 10:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A68E156654;
	Tue,  9 Jul 2024 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jmtMqa7a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15917154C04;
	Tue,  9 Jul 2024 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520529; cv=none; b=icsC4eqpkYJ5vvXw0I/g0o3EawELDodX+kcPts8HUse338YDFWmZJoA8mdRPA59VJn5pQ8KpkK6dLW1d/8EXvYMTA4Wjkk0GlsyFkODwS6rhRODWxoYSyTgAfOO/dRASuul0VED/Fl8qS3FIdK0ps/ViZk8t1FEAPvBzqCTs+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520529; c=relaxed/simple;
	bh=EEZI0oOKHSccww6P7hFSmluieVKgyeacOxph00ecItI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9vqpMrYrMw2FKdsJ5As0uopxKEo8Mec/H2IaBdhJRsiU62sZDg79GMRWBrFDNNsnqrIywzBmQVCZXiB5o2T8UJqCEk8O0mv4XQKQOofP70RkolJxzv0Tqobm17bINdbMF65gGVCDep+vHsE98eOs1YjJ+/0xQOsukI/X1zc3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jmtMqa7a; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4698S9mv031021;
	Tue, 9 Jul 2024 12:22:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=61h9FpLIz7qYk5YX7xxf1ILI
	zrao7vVFXIrWakkeQ0Q=; b=jmtMqa7aV7kvPEsVQHMliovwTWRYqgWJxojYA2dZ
	gHue4FKVuhBDlfUQspGZd7k4PAVdHsYjtwY6gitiwcPcuGvOO7j2nn1GZu44cs1I
	w3lNJFedBRTJpiY3si1WJ4oQ1diK40h7pfAtJ7XDSWFyVi9BpLBGoanminP+xqUz
	1Rt/3OJwSJcilYdUtdBmsKj/V2GyaDJfYa0o+NHkuwhB8hwvE4uhKWGLdIWu5nRb
	E7VZ5Mpai5KMSzWToSUWYFN8cNGhzTTB9f5GIaJSsJT6s2nuhm/86kPTUHTVQuwY
	9bBle0QtdHvHXT7spft7p/XHmSbyigUo4yoy/04Xi/Qwhw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406whhk8jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 12:22:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 83D8440044;
	Tue,  9 Jul 2024 12:21:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4A1F21B531;
	Tue,  9 Jul 2024 12:21:39 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jul
 2024 12:21:39 +0200
Date: Tue, 9 Jul 2024 12:21:34 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-i2c@vger.kernel.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 60/60] i2c: st: reword according to newest
 specification
Message-ID: <20240709102134.GA55503@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-61-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-61-wsa+renesas@sang-engineering.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_01,2024-07-08_01,2024-05-17_01

Hi,

On Sat, Jul 06, 2024 at 01:21:00PM +0200, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

> ---
>  drivers/i2c/busses/i2c-st.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 5e01fe3dbb63..05b19ede65a0 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 STMicroelectronics
>   *
> - * I2C master mode controller driver, used in STMicroelectronics devices.
> + * I2C controller driver, used in STMicroelectronics devices.
>   *
>   * Author: Maxime Coquelin <maxime.coquelin@st.com>
>   */
> @@ -150,7 +150,7 @@ struct st_i2c_timings {
>  
>  /**
>   * struct st_i2c_client - client specific data
> - * @addr: 8-bit slave addr, including r/w bit
> + * @addr: 8-bit target addr, including r/w bit
>   * @count: number of bytes to be transfered
>   * @xfered: number of bytes already transferred
>   * @buf: data buffer
> @@ -667,7 +667,7 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
>  		i2c |= SSC_I2C_ACKG;
>  	st_i2c_set_bits(i2c_dev->base + SSC_I2C, i2c);
>  
> -	/* Write slave address */
> +	/* Write target address */
>  	st_i2c_write_tx_fifo(i2c_dev, c->addr);
>  
>  	/* Pre-fill Tx fifo with data in case of write */
> @@ -766,7 +766,7 @@ static u32 st_i2c_func(struct i2c_adapter *adap)
>  }
>  
>  static const struct i2c_algorithm st_i2c_algo = {
> -	.master_xfer = st_i2c_xfer,
> +	.xfer = st_i2c_xfer,
>  	.functionality = st_i2c_func,
>  };
>  
> -- 
> 2.43.0
> 
> 

