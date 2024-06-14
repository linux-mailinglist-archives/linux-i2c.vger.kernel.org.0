Return-Path: <linux-i2c+bounces-4037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F263908F7D
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 18:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B1412868A0
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 16:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C55915ECD0;
	Fri, 14 Jun 2024 16:01:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E72946C;
	Fri, 14 Jun 2024 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718380891; cv=none; b=Gb+A9sJzmNyDQ5K5dljjAo+3iSgY42jBwqRJ3CV39eppMuy9nRAhw0/qB5lwazOSpARmUnMRo+JPbUDEaMybOWIcFRFbd4isJDj312wcAzz1MXSWm3S3KcYujupqDYDtJIo7tQvJBRmVeHy4ZyNZd+SaSNf1rgupI7g5MSghx2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718380891; c=relaxed/simple;
	bh=PF06UVAUwNRTBfsiJ21LK7Zw9YpeWoI6dp0UuAuGFXs=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iC9DD7Y5sI8QiQFqt1PxpR9o3/UEZcFw7hZ33EqpZjm0oXuvuYD6E+HY71yjJt4AOZK80fcSogk34PReVfAVGLVBTFAVKgeeoQ6T0d/9bbIWSCYAxubRTQrGsBbwejU3NfLhU/kZg9BW3/FVqYVAUTqgM6u3lVTgGxH36LwQegY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W13rc72Q9z6H7Wv;
	Sat, 15 Jun 2024 00:00:00 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 690CF140D26;
	Sat, 15 Jun 2024 00:01:25 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 14 Jun
 2024 17:01:24 +0100
Date: Fri, 14 Jun 2024 17:01:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Abel Vesa
	<abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li
	<Frank.Li@nxp.com>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <20240614170123.00002e0f@Huawei.com>
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Fri, 14 Jun 2024 11:59:27 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Emails to Anson Huang bounce:
> 
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access denied.
> 
> Add IMX platform maintainers for bindings which would become orphaned.
That doesn't make much sense for the magnetometer which has nothing to do with
imx.

Make that one my problem under my jic23@kernel.org address.

Thanks,

Jonathan


> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml b/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
> index 6b54d32323fc..467002a5da43 100644
> --- a/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
> @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#

Not sure the new maintainers make sense here.

Flip it to me if no one else volunteers.

>  title: Freescale MAG3110 magnetometer sensor
>  
>  maintainers:
> -  - Anson Huang <Anson.Huang@nxp.com>
> +  - Shawn Guo <shawnguo@kernel.org>
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +  - Fabio Estevam <festevam@gmail.com>
>  
>  properties:
>    compatible:



