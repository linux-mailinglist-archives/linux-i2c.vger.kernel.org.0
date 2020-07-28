Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335DB230907
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 13:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729167AbgG1LkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 07:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729144AbgG1LkY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 07:40:24 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A242C061794
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 04:40:24 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o13so11757753pgf.0
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kBby+eefhQBg3P3osgBqYF0piscRaYFKo6/sKyA7cuM=;
        b=UFG9n7daaeYhLy3/FKS+7iUtniLN4/PSTcxaO5osXTkZIvl5hO1lLnKiVVlZQr3K/i
         paqlrIRxKQJzHrTAcOYPW1MjxyYm2P1YDUGozno2YBuurqMLEWJfRBEed3tvTxsEkuxx
         EeyOVg8vW4H0/YN7dYqsSSR4IiydsZO2eKnOnxxjy5aHBsuy1WTGwXMpxVapEcW4YCGq
         siPQUcXX694HHu4zF1PEXi8tgbo0flGAi9ThFFjzgFeGgU0Xfl6xsyIi0Eh0QewUdBCK
         ai8QdUZ6gOl0JhfwEwUL3ySGELqUlwZjlezUQbSC6iZt60BdkRhkzrsumjnx22t6ewM9
         dEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kBby+eefhQBg3P3osgBqYF0piscRaYFKo6/sKyA7cuM=;
        b=JntHBPytXK7+fwjzw35PBNTwV5pE4tb3gCTn6hhS2DzdOCuQKs7jOWt9VCfRyGfw1j
         6ydfY8Ee1K5JaA2uADjvboIEtCI/Po19Xtbt9F6ddATwB+1Sq6MBMrvWVn+oxGr9pxg5
         +IcAgduHWlcCnnqoj85ZyD1D0gZnYLSSYXMz00I/+zqGv280b+HFNQfdjjtlAPfzz9fP
         2QbWCtZjpyrcbiGX6EPrRxa8WEeVap9fmWuFe6EFJLM8WqqI0EzHbO0SZjLRtvLrzIa7
         vG3m8P5wdHdAvcvApJsGMJ5FXRI+x4VmVoUjazm4l0KBR2IiIMU0AqcuqrNKe8scF75o
         HdpA==
X-Gm-Message-State: AOAM531Tlq56XkPjirss5ZMVDYH88+vIWA9M//deH2Vdnr5DkFifDbAB
        X0Vh2CQQFUaWodKjWbNBwfc=
X-Google-Smtp-Source: ABdhPJyP9u1raRY6M7YQ1O/AmsfSefyQ4JALP7Uh9p0hmidftOszVGZ6Byh3ckcGKRv+0d+mVlLYhg==
X-Received: by 2002:a63:f50b:: with SMTP id w11mr23781856pgh.157.1595936423860;
        Tue, 28 Jul 2020 04:40:23 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id y19sm7136054pfn.77.2020.07.28.04.40.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:40:23 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <20200728111602.GC980@ninjato>
Date:   Tue, 28 Jul 2020 04:40:22 -0700
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <14454F49-740B-4423-A2F9-4B00B18A9A74@gmail.com>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
 <20200728111602.GC980@ninjato>
To:     Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Jul 28, 2020, at 4:16 AM, Wolfram Sang <wsa@kernel.org> wrote:
>=20
>=20
>> * Allocated bit 4 (I2C_SMBUS3_BLOCK=3D0x10), to simplify Smbus2
>>   compatibility: I2C_SMBUS_*BLOCK* =3D (<old type>|0x10)
>=20
> I think the code becomes easier to understand, if we use new transfer
> types a bit more explicitly. Also, I am not sure of the extra bit
> because it is not clearly visible that types >=3D 16 and <=3D 31 will =
have a
> special meaning. We could do like this if we sacrifice one number for
> an unused BROKEN with 255 byte:
>=20
> -#define I2C_SMBUS_BLOCK_DATA	    5
> +#define I2C_SMBUS2_BLOCK_DATA	    5 /* 32 byte only, =
deprecated */
> -#define I2C_SMBUS_I2C_BLOCK_BROKEN  6
> +#define I2C_SMBUS2_I2C_BLOCK_BROKEN  6 /* 32 byte only, deprecated */
> -#define I2C_SMBUS_BLOCK_PROC_CALL   7		/* SMBus 2.0 */
> +#define I2C_SMBUS2_BLOCK_PROC_CALL   7		/* SMBus 2.0, 32 =
byte only, deprecated */
> -#define I2C_SMBUS_I2C_BLOCK_DATA    8
> +#define I2C_SMBUS2_I2C_BLOCK_DATA    8 /* 32 byte only, deprecated */
>=20
> +#define I2C_SMBUS_BLOCK_DATA		9
> +#define I2C_SMBUS_I2C_BLOCK_BROKEN	10 /* FIXME: probably say "don't =
use" here
> +#define I2C_SMBUS_BLOCK_PROC_CALL	11 /* SMBus >=3D 2.0 */
> +#define I2C_SMBUS_I2C_BLOCK_DATA	12
>>=20
>=20
>> +	user_len =3D kmalloc_array(nmsgs, sizeof(*user_len), =
GFP_KERNEL);
>> +	if (!user_len) {
>> +		res =3D -ENOMEM;
>> +		goto out;
>> +	}
>=20
> Maybe on stack? I2C_RDWR_IOCTL_MAX_MSGS will ensure this will stay at =
a
> sane value.
>=20
>> @@ -313,7 +357,19 @@ static noinline int i2cdev_ioctl_smbus(struct =
i2c_client *client,
>> 		union i2c_smbus_data __user *data)
>> {
>> 	union i2c_smbus_data temp =3D {};
>> -	int datasize, res;
>> +	int block_max, datasize, res;
>> +
>=20
> 'size' is really a misleading name :(

Yep. :/

> +	if (size <=3D I2C_SMBUS2_I2C_BLOCK_DATA) {
> +		if (size >=3D I2C_SMBUS2_BLOCK_DATA)
> +			size +=3D I2C_SMBUS_BLOCK_DATA - =
I2C_SMBUS2_BLOCK_DATA;
> +		block_max =3D I2C_SMBUS_BLOCK_MAX;
> +	} else {
> +		block_max =3D I2C_SMBUS3_BLOCK_MAX;
> +	}
>=20
> Would this work, too?

=E2=80=9C3=E2=80=9D ;)

But I get what you mean.

I=E2=80=99m not too passionate about the bit flip. Adding relative =
offsets would work for me too.

In fact, if we just want to keep a full switch (size) {} and map {9, 10, =
11} to {5, 7, 8},
(i.e. no dummy-broken), my world wouldn=E2=80=99t collapse yet.

Daniel





