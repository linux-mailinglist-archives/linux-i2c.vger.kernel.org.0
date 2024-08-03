Return-Path: <linux-i2c+bounces-5122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFA4946AA3
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2024 19:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40B0C1C20E1A
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2024 17:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C3117C95;
	Sat,  3 Aug 2024 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV01COD7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BCA4C7B;
	Sat,  3 Aug 2024 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722705601; cv=none; b=MITFFSGjp6JohgByax1Q48NgwXcCo91Kjdoz7TCuMS8HZL8RiByh/xMbQjUamONLsWIE1VynAbN7qUHduRoNF/K025eE2XU+QhIwXp+6lEz3R5tUIbVyqy6yZ1BRxNPbAOmKIVQHN8+vWsm3S4WNg4im7seV6dpk8JMCbP7TTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722705601; c=relaxed/simple;
	bh=cBDrjs88J8d2cOb8TCQ4NZkZSHo5aRp3AKSg9cQo9x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YM0r9tRztATYTYC5ZkyURGQLoo1gsBnMmEzofv+UniyqLxTVqM+Q9agCGOjcdCQVR3yXN4EsMvurpzsHP8fAZ96sEsqpHrTB3Z6lxHffhUiFFGEBFYuGm3m/F18oG5N8RYLklTFVl9wPn5GtWslGeTIFKT+RzT4PaJ4DzIHPJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV01COD7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f15790b472so39235501fa.0;
        Sat, 03 Aug 2024 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722705597; x=1723310397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hbIeq5J9ecdYRtOqWsSVX/7RcEl4xXiM9If78ClQsXA=;
        b=bV01COD7QDqHRLa4RgtAnKFjNWFBwuEuz7HMNBDF9g8U+0gzifCYM9/vAYnogFGjpV
         geX5x86F/hwVl/edbeX4t80hHS595x1hyxiP4P/KGUbFp9o7f0V97Om3013q5dZ8AH2J
         ExLJBuGrWxD9f32xl49ceb3YZ6inRqcqODRF+1+M1YU2Rx98+RU67GHYO+Gm/60rSvFx
         dUZuEPxVphFM7iLPgJ6qQQOZRaCKw4PaZBZYs9+ggxtLeTjeTEwa377bg/WivJwQDSfH
         0Y1KjBwSizpz0SBWJAJx6+vRN/BTSabM3sGl8AeL1c0bHSvw6o+il/fO9TKW+t1bR7Rk
         /ULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722705597; x=1723310397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbIeq5J9ecdYRtOqWsSVX/7RcEl4xXiM9If78ClQsXA=;
        b=tRBuU9V3x+VK7874u3ABl/mmq5R+Ur7KWa6xR5XB3tqaRIyHQjSb5lIO9Y6Buo5MnJ
         5mWoqhgNLxLQJcA341hGnpR6OvGoYxCFkonMELIFOmnCfzA1nyMdhNJjS10ZlsJew4z1
         8C/5Y57gKxZ6HqVbaZd9GtfrUVQ4T4CVCzaV7IdlloWr5cevp3ezxpvTMW+ICy6me0cH
         q+A71F+dNYdJlodHEt7aRjJAc602wSaXJOXtookU359P197wW5UM8xidVh/lD81p6CqE
         jWcCufcKutPB33MGenljPA+Nmszi6QcoGM2xJCwfd5yLDMrmLJKRKTIkC3mx7vnvNEL6
         APKg==
X-Forwarded-Encrypted: i=1; AJvYcCWjbEHTV/tcofCKa1i+8sZg/A3+Hw+ZlbJa4SA9RqUY1JoCqmPUFtdfvmVt6pijxLTvhK7td4SCuYQM3qwJt4qvT7UZGkDNgVrapJt75N7DG+oX1MYle4kDWxOtEuSaNWB82gSccJ4jsu47iqGzqT/p/RvcYdOB+Q0m++giBPmmXvpkmNA=
X-Gm-Message-State: AOJu0YxH11/rgvPk4sUp05GxCUJ7AFZZQB+r5ogD9SqYeOcizkSP9L35
	rOuyOkg8+ImCtzet1Acf6YfPZMUSIyRC8bETnJ0jyacv2MY4ii36Q0+bZA==
X-Google-Smtp-Source: AGHT+IGpgkDheuNXAUMGBiu6bLJfKHtEmderv+Z85vNt3jtPFPqgE/7HgIC6dPGJ7BoL2ymZQKiKnw==
X-Received: by 2002:a05:6512:3d09:b0:52d:582e:4117 with SMTP id 2adb3069b0e04-530bb6c7c39mr4771214e87.54.1722705596832;
        Sat, 03 Aug 2024 10:19:56 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7a11:d500:d521:48a:bf6d:3ab9? (dynamic-2a01-0c22-7a11-d500-d521-048a-bf6d-3ab9.c22.pool.telefonica.de. [2a01:c22:7a11:d500:d521:48a:bf6d:3ab9])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d433e8sm237641966b.135.2024.08.03.10.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Aug 2024 10:19:56 -0700 (PDT)
Message-ID: <93f1b363-9d1e-4d18-991f-b85e7ec0cfb0@gmail.com>
Date: Sat, 3 Aug 2024 19:19:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
 <3365237d-5fb7-4cbd-a1c0-aff39433f5c2@gmail.com>
 <be8eb641-a16d-4fc5-b4cc-35c663c37df7@ans.pl>
 <55445bee-03c6-4725-8b1d-5f656018a8af@ans.pl>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <55445bee-03c6-4725-8b1d-5f656018a8af@ans.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2024 16:12, Krzysztof Olędzki wrote:
> On 06.07.2024 at 18:42, Krzysztof Olędzki wrote:
>> On 02.07.2024 at 13:25, Heiner Kallweit wrote:
>>> On 23.06.2024 20:47, Krzysztof Olędzki wrote:
>>>> Hi,
>>>>
>>>> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
>>>>
>>>> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
>>
>> <CUT>
>>
>>>
>>> Could you please test whether the attached two experimental patches fix the issue for you?
>>> They serialize client device instantiation per I2C adapter, and include the client device
>>> name in the check whether a bus address is busy.
>>
>> Sadly, they crash the kernel.
>>
>> I will get serial console attached there next week, so will be able to capture the full crash.
>> For now, I was able to obtain a photo. I'm very sorry for the quality, just wanted to provide
>> something for now.
> 
> Sorry it took me so long - my attempts to coordinate setting up serial console
> were not successful, so it had to wait for me to go there in person...
> 
> I have attached complete dmesg, summary:
> 
> [   10.905953] rtmutex deadlock detected
> [   10.909959] WARNING: CPU: 5 PID: 83 at kernel/locking/rtmutex.c:1642 __rt_mutex_slowlock_locked.constprop.0+0x10f/0x1a5
> [   10.920961] CPU: 5 PID: 83 Comm: kworker/u16:3 Not tainted 6.6.34-o5 #1
> [   10.929970] Hardware name: Dell Inc. PowerEdge T110 II/0PM2CW, BIOS 2.10.0 05/24/2018
> [   10.938954] Workqueue: events_unbound async_run_entry_fn
> 
> 
> [   11.336954] BUG: scheduling while atomic: kworker/u16:3/83/0x00000002
> [   11.342953] Preemption disabled at:
> [   11.342953] [<0000000000000000>] 0x0
> [   11.350953] CPU: 5 PID: 83 Comm: kworker/u16:3 Tainted: G        W          6.6.34-o5 #1
> [   11.361954] Hardware name: Dell Inc. PowerEdge T110 II/0PM2CW, BIOS 2.10.0 05/24/2018
> [   11.369953] Workqueue: events_unbound async_run_entry_fn
> 
Thanks a lot for the comprehensive info. Reason for the deadlock is that calls to
i2c_new_client_device() can be nested. So another solution approach is needed.
I'd appreciate if you could test also the new version below.

> 
> 
> Krzysztof

Heiner

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b63f75e44..c1074d409 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -915,6 +915,29 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 	return 0;
 }
 
+/**
+ * Serialize device instantiation in case it can be instantiated explicitly
+ * and by auto-detection
+ */
+static int i2c_test_and_set_addr_in_instantiation(struct i2c_adapter *adap,
+						  const struct i2c_client *client)
+{
+	if (!(client->flags & I2C_CLIENT_TEN) &&
+	    !(client->flags & I2C_CLIENT_SLAVE) &&
+	    test_and_set_bit(client->addr, adap->addrs_in_instantiation))
+		return -EBUSY;
+
+	return 0;
+}
+
+static void i2c_clear_addr_in_instantiation(struct i2c_adapter *adap,
+					    const struct i2c_client *client)
+{
+	if (!(client->flags & I2C_CLIENT_TEN) &&
+	    !(client->flags & I2C_CLIENT_SLAVE))
+		clear_bit(client->addr, adap->addrs_in_instantiation);
+}
+
 /**
  * i2c_new_client_device - instantiate an i2c device
  * @adap: the adapter managing the device
@@ -962,6 +985,10 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		goto out_err_silent;
 	}
 
+	status = i2c_test_and_set_addr_in_instantiation(adap, client);
+	if (status)
+		goto out_err_silent;
+
 	/* Check for address business */
 	status = i2c_check_addr_busy(adap, i2c_encode_flags_to_addr(client));
 	if (status)
@@ -993,6 +1020,8 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
+	i2c_clear_addr_in_instantiation(adap, client);
+
 	return client;
 
 out_remove_swnode:
@@ -1004,6 +1033,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	dev_err(&adap->dev,
 		"Failed to register i2c client %s at 0x%02x (%d)\n",
 		client->name, client->addr, status);
+	i2c_clear_addr_in_instantiation(adap, client);
 out_err_silent:
 	if (need_put)
 		put_device(&client->dev);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 07e33bbc9..31486455f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -761,6 +761,9 @@ struct i2c_adapter {
 	struct regulator *bus_regulator;
 
 	struct dentry *debugfs;
+
+	/* covers 7bit addresses only */
+	DECLARE_BITMAP(addrs_in_instantiation, 1 << 7);
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.46.0



