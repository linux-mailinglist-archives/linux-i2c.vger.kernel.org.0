Return-Path: <linux-i2c+bounces-1137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41DC8251CF
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 11:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9E1281CC6
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 10:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7692F250FA;
	Fri,  5 Jan 2024 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOFAPwkS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05628E27
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cc7d2c1ff0so16891541fa.3
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jan 2024 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704450169; x=1705054969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Otn9loBBsw/UzqwebEZy3Ooa0CujzEAcJwFz8Zj1BXs=;
        b=dOFAPwkSAsJq5YJUiju4J4fVJz0ZZ0Ky14HRIGt40H8EG8j+SXQVMFUUPmE1PGDfsd
         wmGVc9s2cytmOHs83v1AY5GlxQqu4zXrB7ic70u71nFRkU5wVSkMRLUBpVbzM2ZHfcRy
         gMDDroO+8usoVtxCxb9xQV/9H/Ky2W1tSOfAXxoBlX4/MrfkCmESsjnLj/NicbL8sVV4
         cl7pgnGN63tNP8A78galhMAh9rZsobnRg1PjqGZaUp3mRMOmNOV+//cQbbmhZlledYCh
         r1lB1AXZZDON/hnwU/8ZRrhwGGqnS33FfxNsZaxgPL7TCzXlZ0LrxoAkMxCEU90Y1F8B
         uwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704450169; x=1705054969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Otn9loBBsw/UzqwebEZy3Ooa0CujzEAcJwFz8Zj1BXs=;
        b=BbPwEq818zMWL/eMEeihPhy5yE5Igguyuv7cnNR/AA8TJj3sxbR2/NiSzf+fjQQuiW
         K4lLQh15OMShe9CCtUzZ/w0ai0b+BDrRjehE5F6oRVFbz/oMxNPS8KvX5cVFfQwubIVa
         WgxLI+tfXiqZwuGp4nGPi87thterJvSTrCqUUKdLZ/Ruw09zEKd0ZQeqsLipsgpLc7Kn
         R5H5dM3g/Y45eGqlimMg9NncWkh9pPs54Dv7wpzyHq3CY3DHhIIpbhNAW7igyk6i+bdo
         K2PVSgPfUrU17oAE8vNTYf4qbF2dP3EeAB7+v2pqV//LXguMVASAE9qvPj9wGiYZEoSc
         0D2w==
X-Gm-Message-State: AOJu0YzCtXCe2a7iLk2M+G+zMHHUa09DHMu80FEIkz67PC3v1sHBRo+E
	trlhNI9j1FYpITxYrzOE+DmP+9tww057yQ==
X-Google-Smtp-Source: AGHT+IE2UecOtUprnsE+wTP7UJCkRZPB7fx0sJ/qDDVGHx8WV3NGtKzjOZu+swh/2+L77+HG7FmkwQ==
X-Received: by 2002:a2e:a9a2:0:b0:2cc:6bf6:cdc6 with SMTP id x34-20020a2ea9a2000000b002cc6bf6cdc6mr1295046ljq.7.1704450169091;
        Fri, 05 Jan 2024 02:22:49 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id ek21-20020a056402371500b0055732bd1fc0sm474638edb.82.2024.01.05.02.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 02:22:48 -0800 (PST)
Message-ID: <19746c85-6eff-4f63-9370-9592ad73f22c@linaro.org>
Date: Fri, 5 Jan 2024 10:22:46 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] tty: serial: samsung: prepare for different IO
 types
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de,
 semen.protsenko@linaro.org, andre.draszik@linaro.org, saravanak@google.com,
 willmcvicker@google.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 kernel-team@android.com
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
 <20231228125805.661725-5-tudor.ambarus@linaro.org>
 <2024010432-taco-moneyless-53e2@gregkh>
 <a3a9df6a-4270-4076-9e9b-ce2fc7284d54@linaro.org>
 <2024010450-heritage-variety-d72d@gregkh>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2024010450-heritage-variety-d72d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/4/24 15:56, Greg KH wrote:
> On Thu, Jan 04, 2024 at 03:41:28PM +0000, Tudor Ambarus wrote:
>>
>>
>> On 1/4/24 15:32, Greg KH wrote:
>>> On Thu, Dec 28, 2023 at 12:57:57PM +0000, Tudor Ambarus wrote:
>>>> GS101's Connectivity Peripheral blocks (peric0/1 blocks) which
>>>> include the I3C and USI (I2C, SPI, UART) only allow 32-bit
>>>> register accesses. If using 8-bit register accesses, a SError
>>>> Interrupt is raised causing the system unusable.
>>>>
>>>> Instead of specifying the reg-io-width = 4 everywhere, for each node,
>>>> the requirement should be deduced from the compatible.
>>>>
>>>> Prepare the samsung tty driver to allow IO types different than
>>>> UPIO_MEM. ``struct uart_port::iotype`` is an unsigned char where all
>>>> its 8 bits are exposed to uapi. We can't make NULL checks on it to
>>>> verify if it's set, thus always set it from the driver's data.
>>>>
>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> ---
>>>> v2: new patch
>>>>
>>>>  drivers/tty/serial/samsung_tty.c | 9 ++++++++-
>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>>>> index 66bd6c090ace..97ce4b2424af 100644
>>>> --- a/drivers/tty/serial/samsung_tty.c
>>>> +++ b/drivers/tty/serial/samsung_tty.c
>>>> @@ -72,6 +72,7 @@ struct s3c24xx_uart_info {
>>>>  	const char		*name;
>>>>  	enum s3c24xx_port_type	type;
>>>>  	unsigned int		port_type;
>>>> +	unsigned char		iotype;
>>>>  	unsigned int		fifosize;
>>>>  	unsigned long		rx_fifomask;
>>>>  	unsigned long		rx_fifoshift;
>>>
>>> Is there a reason you are trying to add unused memory spaces to this
>>> structure for no valid reason?  I don't think you could have picked a
>>> more incorrect place in there to add this :)
>>>
>>> Please fix.
>>>
>>
>> Will put it after "const char *name".
> 
> If you do, spend some time with the tool, pahole, and see if that's
> really the best place for it or not.  Might be, might not be, but you
> should verify it please.
> 

Thanks!

I played with pahole a bit. For arm32 this struct is not as bad defined
as for arm64, all members fit in the same cacheline. There are some
holes though and 2 cachelines for arm64 where this struct needs some
love. The best and minimum invasive change for my iotype member would be
to put it before the "has_divslot" member, as the has_divslot bitfield
will be combined with the previous field.

But I think the entire struct has to be reworked and the driver
butchered a bit so that we get to a better memory footprint and a single
cacheline. I volunteer to do this in a separate patch set so that we
don't block this series. I think the final struct can look as following:

struct s3c24xx_uart_info {
	const char  *              name;                 /*     0     8 */
	enum s3c24xx_port_type     type;                 /*     8     4 */
	unsigned int               port_type;            /*    12     4 */
	unsigned int               fifosize;             /*    16     4 */
	u32                        rx_fifomask;          /*    20     4 */
	u32                        rx_fifoshift;         /*    24     4 */
	u32                        rx_fifofull;          /*    28     4 */
	u32                        tx_fifomask;          /*    32     4 */
	u32                        tx_fifoshift;         /*    36     4 */
	u32                        tx_fifofull;          /*    40     4 */
	u32                        clksel_mask;          /*    44     4 */
	u32                        clksel_shift;         /*    48     4 */
	u32                        ucon_mask;            /*    52     4 */
	u8                         def_clk_sel;          /*    56     1 */
	u8                         num_clks;             /*    57     1 */
	u8                         iotype;               /*    58     1 */
	u8                         has_divslot:1;        /*    59: 0  1 */

	/* size: 64, cachelines: 1, members: 17 */
	/* padding: 4 */
	/* bit_padding: 7 bits */
};


This looks a lot better than what we have now:
	/* size: 120, cachelines: 2, members: 17 */
	/* sum members: 105, holes: 2, sum holes: 8 */
	/* sum bitfield members: 1 bits (0 bytes) */
	/* padding: 4 */
	/* bit_padding: 23 bits */
	/* last cacheline: 56 bytes */

I'll put iotype before has_divslot and then follow up with a patch set
to clean the driver. Cheers,
ta

