Return-Path: <linux-i2c+bounces-4227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C091297C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FCEF286CEE
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5832B664C6;
	Fri, 21 Jun 2024 15:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHvMoV45"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF7257CA7;
	Fri, 21 Jun 2024 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983373; cv=none; b=PL+CK/DGPhDh+5ys1bcSCbSs2QlL1lc4SJGyvMn0yhl76ak9oiIMpngOOhIrNJxbPaqibhRh/0mV2uO7/y3frDrfw8SjQkLxzfz6TBBFDvjqp741onZrdMVgK3OFQXBdYATqrwt0LO8mZoz/VZyn/OvfAvgUX/fK0CHELyWdERg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983373; c=relaxed/simple;
	bh=mibplKt7yrg2ylNU1KRpiE4uThsNa8fXKWWgYJuVF9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQuF0fgLCi49Cta6NfLbqZKr+a3OhxRqqz5Sf+HGMaI+7kO2sAYlYBnVjuH6RJJBwhJtx7w/vjFme3haIko9kmAaRRp++xnLaua0MhZNn4qAu0CmS5S0X8sIW10oK9hVJPo3Clfy0r3V7G7dmWz/fjgSQqU+svjbeCQuKbk/oAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHvMoV45; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36532d177a0so1210683f8f.2;
        Fri, 21 Jun 2024 08:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718983369; x=1719588169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkGR5EJentvUL1VShfMi+kg50D4pwOAkzJOrsMjz8qk=;
        b=hHvMoV45XoKgA12jeEUPqgJX7yzaL5RXpJkR8awHJYncvjLXQFtFxDDEqEG7wQA6SG
         iiNOsC1Z8H8mgmOtmNLQcI9cdSPe80Npx3pCybzZ4Bdvjrce3ENDEyEkco0ytV05bKbw
         vCmDev7SCFMmc2PDMfq/jivTLd9V8zq2dEBknDk6JYHIHcbZ6PTetATD3OysstyqddZp
         tCkgkp07eJwwash0bvDe2hqdP3OR7uK0MKHOn2GhAkQTnCUi+PZ2ntzgNEpCmFILD1bA
         y4dsNVSADZHOxGvkPRFOYBlltZXp9IsEHvMnG6NadHwPSdORnJYQLZ6cd+4xV3/Dwz1M
         miRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718983369; x=1719588169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkGR5EJentvUL1VShfMi+kg50D4pwOAkzJOrsMjz8qk=;
        b=XisVhFoHZnxqasOuVk0hC+8NUDjrL5a/L9jgF4jc8GDelU+pSCcq7JB1eGv2MAlvd+
         uTIHIfrfvWE5crJ7YCjsRe42zMZ296PyUqO3Wkv87qBnbbvjz1c607N7i8xnI6IOtywB
         e/STDK5B6UceWLfOE++2tXWKGLd+zLRqY1y/SNlv8G9c8Iga+gM1o6fjJ+G88xKU2o0l
         E+pCyb6fk/b7dT+kloHv0nfznPPoF9c8AQaETUsq5xp/2a5SgfHizN0PgXJKY7St9bPm
         Nhp/5NW/GmXRAiY7DtoMR1PYJJCZfzRBCkYcC4l+C0i3WsmUWLgd0jAA9VesHTdrE22a
         agXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE7BgqfzuCPMGfbju41yPHk0g8uFcpYAa5T223essjebJfsuNLzDobjWbjfOmBEJdNLt+i1hYYMwAXIvxKqPpL6Ul8G8k4tdyIb9p16/zKHSJuOCTlABXqFjo5kEB9Pef9NzmxHggM
X-Gm-Message-State: AOJu0YxTrt7O3/4T80DbEDH6lvW9I6zan+roQwdf2ONEuGNibpdSE5kL
	lQpAmUEYWW8/Y0+dE/foIMXZDqnawdaW+qIzZUf9lCRoLtfmnRs0
X-Google-Smtp-Source: AGHT+IF9NG8saDwxeiICFI/hTyWoeWVUie5mWBddjO6sIoRMdxV0gFAvfVhnV74lANeVsONmdrpDxg==
X-Received: by 2002:adf:eac1:0:b0:362:3526:4ebb with SMTP id ffacd0b85a97d-36317d737cbmr6808799f8f.37.1718983368601;
        Fri, 21 Jun 2024 08:22:48 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:b162:502a:9bd1:4c8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638d9c1aasm2020326f8f.55.2024.06.21.08.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:22:48 -0700 (PDT)
Date: Fri, 21 Jun 2024 17:22:46 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
	andriy.shevchenko@linux.intel.com, marcelo.schmitt@analog.com,
	gnstark@salutedevices.com, francesco.dolcini@toradex.com,
	wsa+renesas@sang-engineering.com, andrew@lunn.ch
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <ZnWaxtfgmLk3SplP@eichest-laptop>
References: <20240531142437.74831-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531142437.74831-1-eichest@gmail.com>

Hi Andi, Andrew, Wolfram, Oleksij,

After some internal discussion we still have some questions which are
blocking us from solving the issue.

On Fri, May 31, 2024 at 04:24:37PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
> the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
> bus is idle. The imx i2c driver will call schedule when waiting for the
> bus to become idle after switching to master mode. When the i2c
> controller switches to master mode it pulls SCL and SDA low, if the
> ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
> clocking, it will timeout and ignore all signals until the next start
> condition occurs (SCL and SDA low). This can occur when the system load
> is high and schedule returns after more than 25 ms.
> 
> This rfc tries to solve the problem by using a udelay for the first 10
> ms before calling schedule. This reduces the chance that we will
> reschedule. However, it is still theoretically possible for the problem
> to occur. To properly solve the problem, we would also need to disable
> interrupts during the transfer.
> 
> After some internal discussion, we see three possible solutions:
> 1. Use udelay as shown in this rfc and also disable the interrupts
>    during the transfer. This would solve the problem but disable the
>    interrupts. Also, we would have to re-enable the interrupts if the
>    timeout is longer than 1ms (TBD).
> 2. We use a retry mechanism in the ti-ads1015 driver. When we see a
>    timeout, we try again.
> 3. We use the suggested solution and accept that there is an edge case
>    where the timeout can happen.
> 
> There may be a better way to do this, which is why this is an RFC.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 3842e527116b7..179f8367490a5 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -503,10 +503,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
>  				"<%s> I2C bus is busy\n", __func__);
>  			return -ETIMEDOUT;
>  		}
> -		if (atomic)
> +		if (atomic) {
>  			udelay(100);
> -		else
> -			schedule();
> +		} else {
> +			/*
> +			 * Avoid rescheduling in the first 10 ms to avoid
> +			 * timeouts for SMBus like devices
> +			 */
> +			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
> +				udelay(10);
> +			else
> +				schedule();
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.40.1

If we want to be sure that the ADS1015 I2C ADC will never timeout, we
would have to add a patch to disable preemption during transmission.
This would look like this:

@@ -1244,6 +1248,12 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	bool is_lastmsg = false;
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
 
+	/* If we are in SMBus mode we need to do the transfer atomically */
+	if (i2c_imx->smbus_mode) {
+		preempt_disable();
+		atomic = true;
+	}
+
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
 	if (result) {
@@ -1320,6 +1330,9 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	if (i2c_imx->slave)
 		i2c_imx_slave_init(i2c_imx);
 
+	if (i2c_imx->smbus_mode)
+		preempt_enable();
+
 	return (result < 0) ? result : num;
 }

However, we are aware that disabling preemption is not a good idea. So
we were discussing how this is normally handled with SMBus devices? Is
it just expected that SMBus devices will timeout in rare cases?

For our use case, the problem would be solved if we could get rid of the
schedule call and replace it with a udelay. It seems that the i.MX8M
Mini I2C controller needs a few ms to clear the IBB flag. In the
reference manual, they write:
> I2C bus busy bit. Indicates the status of the bus. NOTE: When I2C is
> enabled (I2C_I2CR[IEN] = 1), it continuously polls the bus data (SDA)
> and clock (SCL) signals to determine a Start or Stop condition. Bus is
> idle. If a Stop signal is detected, IBB is cleared. Bus is busy. When
> Start is detected, IBB is set.
Unfortunately, it is not clear how often they poll. In our tests the
issue disappeard when we used udelay instead of usleep or schedule for
the first 10 ms.

Since we know we don't have a multi-master configuration, another way
would be to not test for IBB and just start the transfer. We saw that
other drivers use the multi-master device tree property to determine if
multi-master is supported. Here another quote from the reference manual:
> On a multimaster bus system, the busy bus (I2C_I2SR[IBB]) must be
> tested to determine whether the serial bus is free.
We assume this means it is not necessary to test for IBB if we know we
are in a single-master configuration.

Would either of these workarounds be acceptable, and which would be
preferred?

Thanks,
Stefan

