Return-Path: <linux-i2c+bounces-12264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB0FB247B4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 12:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041361B6667C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 10:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969652F1FE2;
	Wed, 13 Aug 2025 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw/Ep4/Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FB428F4;
	Wed, 13 Aug 2025 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755082240; cv=none; b=BB6/BuBhooqkKqRBUh9oiSBP2XKHv1Vt0SpqbbTTs1ujzCHUo+vMxvySyR0CbbtbeXgFR4s02nlb6kUhI99dnpqU1P87rBSLSp0pCr0GPVF6knwvy38vZNuSJZw7Twkgk/Fo3phWGbaM3S2+bCmdeMR4eOtoWQh/hDzzCiWlJ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755082240; c=relaxed/simple;
	bh=QdJHHA/5Te0Xa4HimQXd431V5eEGjN4FPvBE6vvCYDU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tn024y9UneuCBBlyges5vXK1r35EYmWZzUXbmX0fIABkC6v/HzAWkG38WRIAXMapgWZ8wRdkgdlleqL9aBb0fB2F+DXjO6+4/XtML0UuZpLX/FMuawS30Qt1GtIwVMkJf+wPJIb25KvXyv7i2rJR8UTREASBYyJ+o2l3S3yePYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw/Ep4/Z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so62339075e9.3;
        Wed, 13 Aug 2025 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082237; x=1755687037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXWzRkiMkta7AXQW3GKZoQIEt3iuhCo3P5z2A+Zulxc=;
        b=Zw/Ep4/ZfwUVU21UfnKJda+jjYxZTwJMEYkwD/LtiBFB2Yt+y8oq0JlEbyoyTu9dsH
         qy267i9xQJ+FHGC2EC+G6ovDr1OK13alaQ2Iq6wmvkeaYvt7rRFqVi0HEWNIgSMLVUgm
         zWGV32/rScV8WU/M6tZ8XygcUse7JkvSJDxJWklekf/WM4gfIspz7e3EL/yM3nOAruU1
         uW4/EGMcdHTo8pIfK42tSMRGP5XcQSeFVSc4X1yWrS91UFzLVMJI8vM4SoqkQAOc5exT
         caINqRV7l+oZSY/fqaAR5ZFXOnO+sToa6h1pm2lsA1TsTTwgKQ6fF7L/Pzf3wzRhGEJ8
         QjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082237; x=1755687037;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXWzRkiMkta7AXQW3GKZoQIEt3iuhCo3P5z2A+Zulxc=;
        b=dggp70zR8zwaKsgP4hTKXgGtyG7mL83C+GtbUQMSURmUQOKenVhX/6bPqu64r9wYHf
         HW/itD+aNGUiK9RBvvg1cx8S1UosxXqT+9aRBeRPEJVdwmUNSmD1dVzy2noA6dkL1dvR
         uaBBdWV6BvzXEAZpnsMr1QSe8ZLY4mkZ3zO0RszN53Nu/bsD8NHRTjnJLibVibf/4n1I
         Mn8NxNhodtzI7rQEWLJgRrJmG69K87hULhSTJBIyOUGDGwaSdQ15/KSGtBgCt/7qbOn4
         Yq4bFPy/149HL9tKE0U4DpbUD0al+GvXqDMqbgKyoiecb+Eb0oi1JxlmJMlXpCYfKPSI
         97mA==
X-Forwarded-Encrypted: i=1; AJvYcCV3jeA05YNnjE3vKeTt4/n7kb994fcBZI/7mGlPin5AzMDBxtH4DOGZnIP1VPQbe79XChAJO1drpik=@vger.kernel.org, AJvYcCV7LV2WiPyXvNtxcoXB5Ly8AXf2KnBoiMHdCCT1rMeBDIyThEnD5pkebu0jdByeNDlukwq+7LYpKB3CEmTm@vger.kernel.org, AJvYcCVUyQAx+BqfHgOLJRWLN0AwkFxOZdI3eIwdvg1b25piQTgXKHTk+Z0drg1DLakEBfbm5BZ8NhAu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/cGGNMGipmLM11dgz4PHZrj9R+dPPpSATqHzj7NID3BoKgrDK
	NV+WQT+2dKxQVHDzhjtzD1FbtMHVw8IT4Is6Pq8mGPQerMHot0jKLS7F
X-Gm-Gg: ASbGncuepeKHMZDmmdsOAECEcJkVFhgjK4sqxYbS1HSE2MVMiIIZ4c28GhagjYgQRmG
	XZcaO0ZW+E9r0updAxcFJyg3YJ/+Mh3govQ2zPTxYBB4AYhzVfoOuSQ4SwRwb+ZOWg9/+rEmsyb
	0QR26FYooiHyVyvOQfrVgRGHuVCgCUfJFBbZGE1U3HVDbBmIC9nBRuemXgXj1HHtLA5BbcDZuRp
	tFfGj9IMAT5GTw+Sc7bAZr3qqUQaGvitean8VF89f++8k13Qw/xzsC4y+F8QqxgP1C6r3/uorCX
	fjyc4hAF8QD/hALd4ecHgqqDrdmqOH5tf6G8bPABMTQLRmo8PwqaDFm0CejBXgEtnMbHEWQMnnq
	YbRPgk4iktZVGF6dHSsLAjowjMc6+ShlxnI/t+acFNC9uoDBU8C21el1iaKSwaYiM2VI5rxtLJQ
	==
X-Google-Smtp-Source: AGHT+IFfeNVkXHJUpoFaQ8q/KLnyc90CUdhzECYGMjZz7MgoGX4gYx9MY3J94IfFsD95TsIwFrL/DA==
X-Received: by 2002:a05:600c:4e93:b0:456:19be:5cc with SMTP id 5b1f17b1804b1-45a165ce311mr21270095e9.14.1755082236778;
        Wed, 13 Aug 2025 03:50:36 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c338c7dsm47505136f8f.0.2025.08.13.03.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:50:36 -0700 (PDT)
Message-ID: <27906f7b-b137-4af2-aa87-49519495a34d@gmail.com>
Date: Wed, 13 Aug 2025 12:50:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
 <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 11. 22:31 keltezéssel, Andy Shevchenko írta:
> On Mon, Aug 11, 2025 at 09:49:57PM +0200, Gabor Juhos wrote:
>> Under some circumstances I2C recovery fails on Armada 3700. At least
>> on the Methode uDPU board, removing and replugging an SFP module fails
>> often, like this:
>>
>>   [   36.953127] sfp sfp-eth1: module removed
>>   [   38.468549] i2c i2c-1: i2c_pxa: timeout waiting for bus free
>>   [   38.486960] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
>>   [   38.496867] mvneta d0040000.ethernet eth1: unsupported SFP module: no common interface modes
>>   [   38.521448] hwmon hwmon2: temp1_input not attached to any thermal zone
>>   [   39.249196] sfp sfp-eth1: module removed
>>   ...
>>   [  292.568799] sfp sfp-eth1: please wait, module slow to respond
>>   ...
>>   [  625.208814] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>>
>> Note that the 'unsupported SFP module' messages are not relevant. The
>> module is used only for testing the I2C recovery funcionality, because
>> the error can be triggered easily with this specific one.
>>
>> Enabling debug in the i2c-pxa driver reveals the following:
>>
>>   [   82.034678] sfp sfp-eth1: module removed
>>   [   90.008654] i2c i2c-1: slave_0x50 error: timeout with active message
>>   [   90.015112] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
>>   [   90.020464] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
>>   [   90.027906] i2c i2c-1: log:
>>   [   90.030787]
>>
>> This continues until the retries are exhausted ...
>>
>>   [  110.192489] i2c i2c-1: slave_0x50 error: exhausted retries
>>   [  110.198012] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
>>   [  110.203323] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
>>   [  110.210810] i2c i2c-1: log:
>>   [  110.213633]
>>
>> ... then the whole sequence starts again ...
>>
>>   [  115.368641] i2c i2c-1: slave_0x50 error: timeout with active message
>>
>> ... while finally the SFP core gives up:
>>
>>   [  671.975258] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>>
>> When we analyze the log, it can be seen that bit 1 and 11 is set in the
>> ISR (Interface Status Register). Bit 1 indicates the ACK/NACK status, but
>> the purpose of bit 11 is not documented in the driver code unfortunately.
>>
>> The 'Functional Specification' document of the Armada 3700 SoCs family
>> however says that this bit indicates an 'Early Bus Busy' condition. The
>> document also notes that whenever this bit is set, it is not possible to
>> initiate a transaction on the I2C bus. The observed behaviour corresponds
>> to this statement.
>>
>> Unfortunately, I2C recovery does not help as it never runs in this
>> special case. Although the driver checks the busyness of the bus at
>> several places, but since it does not consider the A3700 specific bit
>> in these checks it can't determine the actual status of the bus correctly
>> which results in the errors above.
>>
>> In order to fix the problem, add a new member to struct 'i2c_pxa' to
>> store a controller specific bitmask containing the bits indicating the
>> busy status, and use that in the code while checking the actual status
>> of the bus. This ensures that the correct status can be determined on
>> the Armada 3700 based devices without causing functional changes on
>> devices based on other SoCs.
>>
>> With the change applied, the driver detects the busy condition, and runs
>> the recovery process:
>>
>>   [  742.617312] i2c i2c-1: state:i2c_pxa_wait_bus_not_busy:449: ISR=00000802, ICR=000007e0, IBMR=03
>>   [  742.626099] i2c i2c-1: i2c_pxa: timeout waiting for bus free
>>   [  742.631933] i2c i2c-1: recovery: resetting controller, ISR=0x00000802
>>   [  742.638421] i2c i2c-1: recovery: IBMR 0x00000003 ISR 0x00000000
>>
>> This clears the EBB bit in the ISR register, so it makes it possible to
>> initiate transactions on the I2C bus again.
>>
>> After this patch, the SFP module used for testing can be removed and
>> replugged numerous times without causing the error described at the
>> beginning. Previously, the error happened after a few such attempts.
>>
>> The patch has been tested also with the following kernel versions:
>> 5.10.237, 5.15.182, 6.1.138, 6.6.90, 6.12.28, 6.14.6. It improves
>> recoverabilty on all of them.
> 
> ...
> 
>> Note: the patch is included in this series for completeness however
>> it can be applied independently from the preceding patches. On kernels
>> 6.3+, it restores I2C functionality even in itself because it recovers
>> the controller from the bad state described in the previous patch.
> 
> Sounds to me like this one should be applied first independently on the
> discussion / conclusion on the patch 1.

Yes. At least the users would have a working although not optimal solution in
the meantime.

Regards,
Gabor

