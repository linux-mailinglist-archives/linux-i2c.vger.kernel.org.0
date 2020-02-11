Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D069F158DB0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 12:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbgBKLpA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 11 Feb 2020 06:45:00 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:51110 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727566AbgBKLpA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Feb 2020 06:45:00 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-251-tq3gBPkLNuGQBoRjzQM1HQ-1; Tue, 11 Feb 2020 11:44:55 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 11 Feb 2020 11:44:55 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 11 Feb 2020 11:44:55 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'Gustavo A. R. Silva'" <gustavo@embeddedor.com>,
        Thor Thayer <thor.thayer@linux.intel.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: altera: Use 64-bit arithmetic instead of 32-bit
Thread-Topic: [PATCH] i2c: altera: Use 64-bit arithmetic instead of 32-bit
Thread-Index: AQHV4L9fxboVqkeMN0ihu69bh4WHLagV3sgQ
Date:   Tue, 11 Feb 2020 11:44:55 +0000
Message-ID: <03166245b78c4d85b004dcf746e4e6ee@AcuMS.aculab.com>
References: <20200210192656.GA8412@embeddedor>
In-Reply-To: <20200210192656.GA8412@embeddedor>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: tq3gBPkLNuGQBoRjzQM1HQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gustavo A. R. Silva
> Sent: 10 February 2020 19:27
> 
> Add suffix ULL to constant 300 in order to avoid a potential integer
> overflow and give the compiler complete information about the proper
> arithmetic to use. Notice that this constant is being used in a context
> that expects an expression of type u64, but it's currently evaluated
> using 32-bit arithmetic.
> 
> Addresses-Coverity: 1458369 ("Unintentional integer overflow")
> Fixes: 0560ad576268 ("i2c: altera: Add Altera I2C Controller driver")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/i2c/busses/i2c-altera.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 5255d3755411..526f453f0ff7 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -171,7 +171,8 @@ static void altr_i2c_init(struct altr_i2c_dev *idev)
>  	/* SCL Low Time */
>  	writel(t_low, idev->base + ALTR_I2C_SCL_LOW);
>  	/* SDA Hold Time, 300ns */
> -	writel(div_u64(300 * clk_mhz, 1000), idev->base + ALTR_I2C_SDA_HOLD);
> +	writel(div_u64(300ULL * clk_mhz, 1000),
> +	       idev->base + ALTR_I2C_SDA_HOLD);

Why not factor out the 100?
It may then be you can do 32bit arithmetic (3 * clk_mhz / 10).
If clk_mhz is MHz (not mHz) then the sum will never wrap 32 bits.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

