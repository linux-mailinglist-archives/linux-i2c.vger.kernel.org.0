Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBE6C5651FE
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jul 2022 12:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbiGDKQp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 4 Jul 2022 06:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233944AbiGDKQS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Jul 2022 06:16:18 -0400
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24BE1DF78
        for <linux-i2c@vger.kernel.org>; Mon,  4 Jul 2022 03:15:52 -0700 (PDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-214-MQlTZlhANB2wfXkNFnzPHQ-1; Mon, 04 Jul 2022 11:15:50 +0100
X-MC-Unique: MQlTZlhANB2wfXkNFnzPHQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Mon, 4 Jul 2022 11:15:48 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Mon, 4 Jul 2022 11:15:48 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "Till Harbaum" <till@harbaum.org>, Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH v1 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
Thread-Topic: [PATCH v1 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
Thread-Index: AQHYjhwAwyV0nbqJdEeAmmpcjNypRK1uAQFQ
Date:   Mon, 4 Jul 2022 10:15:48 +0000
Message-ID: <d19ac9827d064307910edab181b8813f@AcuMS.aculab.com>
References: <20220702135925.73406-1-andriy.shevchenko@linux.intel.com>
 <20220702135925.73406-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220702135925.73406-2-andriy.shevchenko@linux.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko
> Sent: 02 July 2022 14:59
> 
> str_read_write() returns a string literal "read" or "write" based
> on the value. It also allows to unify usage of a such in the kernel.
> 
> For i2c case introduce a wrapper that takes struct i2c_msg as parameter.
> 
...
> 
> -	DEB2("=== SLAVE ADDRESS %#04x+%c=%#04x\n",
> -	     msg->addr, msg->flags & I2C_M_RD ? 'R' : 'W', addr);
> +	DEB2("=== SLAVE ADDRESS %#04x+%s=%#04x\n", msg->addr, i2c_str_read_write(msg), addr);

You should ask yourself whether this actually makes the code more readable.
Imagine someone who is scan-reading the code to see what it does.
They're not going to be impressed when they've chased through
two searches to find out the code does.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

