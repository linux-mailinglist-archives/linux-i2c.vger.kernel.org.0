Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1273326A2C0
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 12:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIOKHo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 06:07:44 -0400
Received: from crapouillou.net ([89.234.176.41]:50084 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgIOKHl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Sep 2020 06:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1600164455; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i0x55otxMpUkdJhAxtRyRNzid5yrQkcNryvNuSbY120=;
        b=JjKJkr554CtSU+QnzXW0ch7pQ3bS3gqTytqZwc4VR1umrd3soq7NGPIdyiFbjMUS+Nhzhz
        k6c4fs+MIO2EP24+rEt3Vh8+gJwbbEQ2e5qmiZFukSa0WIG94cUJWezD2ITO7GQ/XBZ2Ps
        k0nygKqOTATm1rLY76iZ1Zc4KXNyyLs=
Date:   Tue, 15 Sep 2020 12:07:24 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] i2c: jz4780: Remove of_match_ptr()
To:     Rob Herring <robh@kernel.org>
Cc:     od@zcrc.me, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <CS2PGQ.I4UMQBYTB15I2@crapouillou.net>
In-Reply-To: <20200914221230.GA349829@bogus>
References: <20200904131152.17390-1-paul@crapouillou.net>
        <20200904131152.17390-3-paul@crapouillou.net>
        <20200914221230.GA349829@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

Le lun. 14 sept. 2020 =E0 16:12, Rob Herring <robh@kernel.org> a =E9crit :
> On Fri, Sep 04, 2020 at 03:11:52PM +0200, Paul Cercueil wrote:
>>  CONFIG_OF is selected by CONFIG_MACH_INGENIC, therefore we don't=20
>> need to
>>  handle the case where Device Tree is not supported.
>=20
> What about COMPILE_TEST? If not supported, why not?

What about it? It will still compile fine with COMPILE_TEST.

-Paul

>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/i2c/busses/i2c-jz4780.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>>  diff --git a/drivers/i2c/busses/i2c-jz4780.c=20
>> b/drivers/i2c/busses/i2c-jz4780.c
>>  index ed2ec86f6f1a..cb4a25ebb890 100644
>>  --- a/drivers/i2c/busses/i2c-jz4780.c
>>  +++ b/drivers/i2c/busses/i2c-jz4780.c
>>  @@ -857,7 +857,7 @@ static struct platform_driver jz4780_i2c_driver=20
>> =3D {
>>   	.remove		=3D jz4780_i2c_remove,
>>   	.driver		=3D {
>>   		.name	=3D "jz4780-i2c",
>>  -		.of_match_table =3D of_match_ptr(jz4780_i2c_of_matches),
>>  +		.of_match_table =3D jz4780_i2c_of_matches,
>>   	},
>>   };
>>=20
>>  --
>>  2.28.0
>>=20


