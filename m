Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77909303AD
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 22:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfE3U7T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 16:59:19 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51173 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfE3U7T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 16:59:19 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9494D8365B
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 08:59:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1559249956;
        bh=vYvCiteI1Kp7faMs6jomFZfgYQobeGhqvCgWsLGRlrw=;
        h=From:To:Subject:Date:References;
        b=PYGBsgkQE6g/yaOEAZgdPL09pA940HgFsJNtlcXL3m5GOM44Fs3SjZqAEvK7juPrP
         SZnedf0v7V8SQy3S4Deq/sOONdTYHnPbjBaRBGlClTtIW0pbS5ljT4ekq7hOs5C+i2
         AtFueeoG4IPMQQaCAMlgj3Gcl5Kzw/cJHV+UOyN0agt9PhGQO8iN/E869HMSlV0Vgs
         fNSvNq6pSTe8+OHi6jWCttsFXTwBw0CmOOWq+KEcsmOfM8QF0NdzSJbYgCOltUMqu1
         uMxhHvNiHGow+blkuFDajemB9okPSoBs+aR7IoaVLrhYO85AfudzZeOhnOL0y1j6P4
         2V5QTt2YuUSNw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5cf044240000>; Fri, 31 May 2019 08:59:16 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Fri, 31 May 2019 08:59:11 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 31 May 2019 08:59:11 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: pca: Fix GPIO lookup code
Thread-Topic: [PATCH] i2c: pca: Fix GPIO lookup code
Thread-Index: AQHVFyW1EiHej+T5HkG5ceqFqpt4tw==
Date:   Thu, 30 May 2019 20:59:10 +0000
Message-ID: <7f417ef2ae6d49f89828655272292978@svr-chch-ex1.atlnz.lc>
References: <20190530202424.13937-1-linus.walleij@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Linus,=0A=
=0A=
On 31/05/19 8:24 AM, Linus Walleij wrote:=0A=
> The devm_gpiod_request_gpiod() call will add "-gpios" to=0A=
> any passed connection ID before looking it up.=0A=
> =0A=
> I do not think the reset GPIO on this platform is named=0A=
> "reset-gpios-gpios" but rather "reset-gpios" in the device=0A=
> tree, so fix this up so that we get a proper reset GPIO=0A=
> handle.=0A=
> =0A=
> Also drop the inclusion of the legacy GPIO header.=0A=
> =0A=
> Fixes: 0e8ce93bdceb ("i2c: pca-platform: add devicetree awareness")=0A=
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>=0A=
=0A=
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
Thanks.=0A=
=0A=
> ---=0A=
>   drivers/i2c/busses/i2c-pca-platform.c | 3 +--=0A=
>   1 file changed, 1 insertion(+), 2 deletions(-)=0A=
> =0A=
> diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i=
2c-pca-platform.c=0A=
> index de3fe6e828cb..f50afa8e3cba 100644=0A=
> --- a/drivers/i2c/busses/i2c-pca-platform.c=0A=
> +++ b/drivers/i2c/busses/i2c-pca-platform.c=0A=
> @@ -21,7 +21,6 @@=0A=
>   #include <linux/platform_device.h>=0A=
>   #include <linux/i2c-algo-pca.h>=0A=
>   #include <linux/platform_data/i2c-pca-platform.h>=0A=
> -#include <linux/gpio.h>=0A=
>   #include <linux/gpio/consumer.h>=0A=
>   #include <linux/io.h>=0A=
>   #include <linux/of.h>=0A=
> @@ -173,7 +172,7 @@ static int i2c_pca_pf_probe(struct platform_device *p=
dev)=0A=
>   	i2c->adap.dev.parent =3D &pdev->dev;=0A=
>   	i2c->adap.dev.of_node =3D np;=0A=
>   =0A=
> -	i2c->gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset-gpios", GPIOD_=
OUT_LOW);=0A=
> +	i2c->gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_OUT_LO=
W);=0A=
>   	if (IS_ERR(i2c->gpio))=0A=
>   		return PTR_ERR(i2c->gpio);=0A=
>   =0A=
> =0A=
=0A=
