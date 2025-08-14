Return-Path: <linux-i2c+bounces-12287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC661B25CFA
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 09:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24337588758
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 07:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5BE25C80F;
	Thu, 14 Aug 2025 07:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSAuDPq8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458F2594B4;
	Thu, 14 Aug 2025 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156026; cv=none; b=E0wtPl3amgLt1LDBWWH1kI5Go796/oGfuwfyIcX9jkcoN6f/8JEUHas4b1WuYQFRZplDcTM818iAliEcdIQd3PrGuQqGM/uYtHXYIv+8l5SS0sJY9qGsejLCzHUCDRPR49YhmX4BUpvqsGbvgTvhY/Z1RMyBme0iH4s+k4U2Z84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156026; c=relaxed/simple;
	bh=pZXmrg8MiW7C8Uhr5fkDtKZ2nKQCR+iwqNestQ30eeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOphZZIZVFfLxQRMDOtW3j6Mkq+AvA3xdkyvHQN/mOuHhETzZB6o9/v8nYLLGz2XXB2MIXotZYMPC51IlyJeUfR63cbhac3d2kEPi/r253hU/0Kk3zWSvgAcfJyU91MiweHtKWbdf8nygFeqiM1Vka2ABnZjYEsVhQCMsmCmjZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSAuDPq8; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6188b733bbaso1183614a12.3;
        Thu, 14 Aug 2025 00:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755156023; x=1755760823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/NHbSr4di9+LOvyh5vB0HjJ5xqdtdZYOflf+Cm7gPY=;
        b=CSAuDPq87ARVz31M1+mxhyNjRjUmRQLn6y69MRc0l8PVdwTGPTIWrLRNI0TjCCfMAe
         KOHUIRMI08SPTY55KM4FSrBeX6Thxyian0Fs+gVmtsT8znNK+P5P/NyJmHWgZyjSxYEh
         f89AJia+ZqKYBGjZGiiOxOHHP9JKtucvU9iEztjgCEBeX9kDu0gcLQ0RQVebsonoFr7r
         yc0GviR//xNWRprszQBakjDtSQpAI/juTHSQd6pmwwucUQyQ5gdzxZVxcNLD5ZCGAi1+
         FMoHSmZJHGDFkBE328jYyFwnOxMfboBJ5S+1HTCPUhWYEIJ3zKu2OzVzVTLcvWKbd2yQ
         OHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156023; x=1755760823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/NHbSr4di9+LOvyh5vB0HjJ5xqdtdZYOflf+Cm7gPY=;
        b=K/1r5gbTUKIMNEaZvRp+6xX5ZBU6P+gIEqe1aa7w1utBzgTJV6+msdHY5TVTxGGICM
         Yy+SG17BAKndfMRU2lWTpFual92FIRgSs5T+8E1k87QDTFx+h7YZFbrVLOgg364/5SDZ
         UftKeRC5JA1KE7UwwA3stot1lK5uqAMFqqK3P24V21g1I7DnLxz7P/iRSdK12W+7XAzV
         on0Ve/sE7qGhKBel9Dna57OM/Hp4FozYHq1i+jYVzWujS55YZAeAQPR1sgDAomtlLJs1
         nCXaEsrJ5ItItcTQiof9L1k7JcNNS8VPp8n5omuU7rAtBVt7Sf0htXYPuIeTeMPxJOcq
         H/XA==
X-Forwarded-Encrypted: i=1; AJvYcCXUUqLbIz0CdtbPvxaCzFnUYWsKUdmN2KSsvC2X4F6SsOWrX0u2n7u4OfGSJvncrnq1XYXwrtOwBj/8ViE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+w2T8GW1TuVaBMreOLkdXtyne8evLBiDFOCZxXaxHOimkxsCk
	BG2QPfdxYnJ9KfApJkqdcBCd9NfZnEYfL0rWF7LZLwd6M/Kl8s/l0X9qnzDaog==
X-Gm-Gg: ASbGncsKEgl4H4nBB5f9wvcKIYbc0CzjD/hUcRu98B4BCFZAmoSLu2YYEpqyv8GKyWp
	3NaRwStf6DWYLBVm1MEOvU9yhlUWezUF5OFtGNWVat3LcUOcfIi8mx3/KZldilhg6lQ48Lf3GVY
	/F5CMxzUCFssZGyRGXjhnY6JzAzcEnX+w0gNMsTwa8EU0uSNvkAkHVD4QB7Ps3O04U4LxYfKNNw
	rzcHcMmF0WjDrZInPV6HFDuKBCXnx1gMvMe3sIk5ZKA64OnlPH069h6KAFTZ/alr0VSIC4F5Q1o
	c6y5b1iEQH8zlxQEkRScX05I5EOTk9LClsQqjdNupRpwBatbzyvtvR/jdDHwrMyqutWbTw97YX/
	fPPQYOLSjrnOx1D/wrrokf6RuoxVxLOhqxof+yDiar/Wwqi6QKglFSw9YRkTI6328wiqSNBIpn5
	dWyatWfNMufoZP+GpqWqvOig==
X-Google-Smtp-Source: AGHT+IHXdusFcYQak4vlZ2g0XYjuaEkrrLAfEahhybzhZ561jawqXJBDs50NQGVWVrnMbl6yAeYtfg==
X-Received: by 2002:a17:907:3f14:b0:af9:e1f0:cd33 with SMTP id a640c23a62f3a-afcb93942b7mr176473066b.2.1755156022407;
        Thu, 14 Aug 2025 00:20:22 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f104:d732:d942:d18e:4382:4b17? ([2001:9e8:f104:d732:d942:d18e:4382:4b17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0763d8sm2564446066b.2.2025.08.14.00.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:20:21 -0700 (PDT)
Message-ID: <0bbc671b-e96c-4089-8540-65d89fa5aa81@gmail.com>
Date: Thu, 14 Aug 2025 09:20:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i2c-host v5 5/5] i2c: rtl9300: Implement I2C block read
 and write
Content-Language: en-GB
To: Sven Eckelmann <sven@narfation.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Harshal Gohel <hg@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>
References: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
 <20250810-i2c-rtl9300-multi-byte-v5-5-cd9dca0db722@narfation.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20250810-i2c-rtl9300-multi-byte-v5-5-cd9dca0db722@narfation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

tested this as far as I've been able too with simple reads and I2C block read
on several RTL93xx devices. No issues and block read is working for me, so
the whole series is getting from me:

Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Jonas Jelonek <jelonek.jonas@gmail.com>

Hopefully we can proceed soon with our efforts in this driver :)

Best,
Jonas

On 10.08.2025 20:05, Sven Eckelmann wrote:
> From: Harshal Gohel <hg@simonwunderlich.de>
>
> It was noticed that the original implementation of SMBus Block Write in the
> driver was actually an I2C Block Write. Both differ only in the Count byte
> before the actual data:
>
>   S Addr Wr [A] Comm [A] Count [A] Data [A] Data [A] ... [A] Data [A] P
>
> The I2C Block Write is just skipping this Count byte and starts directly
> with the data:
>
>   S Addr Wr [A] Comm [A] Data [A] Data [A] ... [A] Data [A] P
>
> The I2C controller of RTL93xx doesn't handle this Count byte special and it
> is simply another one of (16 possible) data bytes. Adding support for the
> I2C Block Write therefore only requires skipping the count byte (0) in
> data->block.
>
> It is similar for reads. The SMBUS Block read is having a Count byte before
> the data:
>
>   S Addr Wr [A] Comm [A]
>             Sr Addr Rd [A] [Count] A [Data] A [Data] A ... A [Data] NA P
>
> And the I2C Block Read is directly starting with the actual data:
>
>   S Addr Wr [A] Comm [A]
>             Sr Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
>
> The I2C controller is also not handling this byte in a special way. It
> simply provides every byte after the Rd marker + Ack as part of the 16 byte
> receive buffer (registers). The content of this buffer just has to be
> copied to the right position in the receive data->block.
>
> Signed-off-by: Harshal Gohel <hg@simonwunderlich.de>
> Co-developed-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/i2c/busses/i2c-rtl9300.c | 37 +++++++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
> index cfafe089102aa208dde37096d5105d4140278ca9..4b215f9a24e6aeb8ff078cfc03a54c7bd9a60c38 100644
> --- a/drivers/i2c/busses/i2c-rtl9300.c
> +++ b/drivers/i2c/busses/i2c-rtl9300.c
> @@ -183,22 +183,32 @@ static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
>  		return -EIO;
>  
>  	if (read_write == I2C_SMBUS_READ) {
> -		if (size == I2C_SMBUS_BYTE || size == I2C_SMBUS_BYTE_DATA) {
> +		switch (size) {
> +		case I2C_SMBUS_BYTE:
> +		case I2C_SMBUS_BYTE_DATA:
>  			ret = regmap_read(i2c->regmap,
>  					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
>  			if (ret)
>  				return ret;
>  			data->byte = val & 0xff;
> -		} else if (size == I2C_SMBUS_WORD_DATA) {
> +			break;
> +		case I2C_SMBUS_WORD_DATA:
>  			ret = regmap_read(i2c->regmap,
>  					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
>  			if (ret)
>  				return ret;
>  			data->word = val & 0xffff;
> -		} else {
> +			break;
> +		case I2C_SMBUS_I2C_BLOCK_DATA:
> +			ret = rtl9300_i2c_read(i2c, &data->block[1], len);
> +			if (ret)
> +				return ret;
> +			break;
> +		default:
>  			ret = rtl9300_i2c_read(i2c, &data->block[0], len);
>  			if (ret)
>  				return ret;
> +			break;
>  		}
>  	}
>  
> @@ -296,6 +306,25 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
>  		len = data->block[0] + 1;
>  		break;
>  
> +	case I2C_SMBUS_I2C_BLOCK_DATA:
> +		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
> +		if (ret)
> +			goto out_unlock;
> +		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX) {
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
> +		if (ret)
> +			goto out_unlock;
> +		if (read_write == I2C_SMBUS_WRITE) {
> +			ret = rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
> +			if (ret)
> +				goto out_unlock;
> +		}
> +		len = data->block[0];
> +		break;
> +
>  	default:
>  		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
>  		ret = -EOPNOTSUPP;
> @@ -314,7 +343,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
>  {
>  	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
>  	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
> -	       I2C_FUNC_SMBUS_BLOCK_DATA;
> +	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_I2C_BLOCK;
>  }
>  
>  static const struct i2c_algorithm rtl9300_i2c_algo = {
>


