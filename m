Return-Path: <linux-i2c+bounces-5635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E795A611
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 22:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12AB01F231AF
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 20:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C3416DECB;
	Wed, 21 Aug 2024 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu0L81nJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1B0166F07
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724273267; cv=none; b=lJzW9EhmuM3+yiO3z0eXwA/NP3gkEPcexnZZlB0XzJ7WTkzVBreL0hwdB5lefzwl+LRY+MhTHagmPpwBeLYPjA1pCg6MXIrNRDrm2JtzP5ktwphfbT+fDA7G5je6d0LFrhrWdaBZG3wwd+8u1XnDVvoH2GQLOJn7lh4v/7VLQrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724273267; c=relaxed/simple;
	bh=Zc/wQKM6jYV86Da7nkznarmiRL1LAcp9Oxd8h3G1l+A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nCrSausbJT4Er4YbER9qbYTEyJ7tOWhxnuqjRJqIXxD+U1/nPlbUPr+EqTaNk3RbSUkSgjGWI+8ACHccfdEumnqQYGnWNxXCRZ4OVSrxhbCLprNo8nVcpHGR2l6iouSAA8z6bewjw60w91oKmflbuGQtACUbCqiAtCecR7fHlW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lu0L81nJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7a81bd549eso7315266b.3
        for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724273264; x=1724878064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oKNdo7TwrLqn3vb9R/DeO9xho3SOHUiFKUzxQlmGZHA=;
        b=Lu0L81nJ56uuzEoIctb8N7u76kceQsSkQarc1/0zafdmfpP1KHCeWomVTK2z5xCviy
         VoI1QQeDuXmASg4Gx2+Aqe1nzl7piveRLJPy7PIVNy02grMJtXifhaZp28gn8TvIl4RE
         MmGe8JQLpr543oVzLNHdTtW8MFlIvHmCju4vEl6/iK51b742CzhbJg1NFAx0VqT1zi0I
         bvkA+TJuPClQqYxbTWiGBDfk7xot28L9fyu8jsLSMS86B7fjQH47QHngdxOvGq8S8mHS
         5NAnMzswLQUZxtdMyOEdu+Ex646UtlrBP7pCg85p263BLmht26QRxnLChc1RCQz10nPT
         ZenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724273264; x=1724878064;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKNdo7TwrLqn3vb9R/DeO9xho3SOHUiFKUzxQlmGZHA=;
        b=fjJ+Bj20oa3o2YuIwR70lNEVTx5JfwhETq8EcsR2ck/7AMzUEufRGZFUxxhrUdANRV
         mWTtGpg+3LwSw6ER0tTdAbqzPoObpO8JkUVzPZrjnIO2vm/ceqLpU5lrZ2pqfRq2iMun
         UQK9lFlGX98s4dnEn4GSD5cYJQIPZNtJhKh8oM28vkYYc3x0iq+KeH/1GwWbF3uYdHH6
         oGvUO5U8QQ+0RacQkQhqXTUMUjhfzYM2y2M9t/9slwKKj+sKq4WDfEC3orwB0mHWZuKD
         MKmlivjpxlk1lTMet7rM++6qx/QuLYFPLxjr7YW3TfepgDQCNd52WEktSgPHGJai9MS0
         X17w==
X-Gm-Message-State: AOJu0Yyon0P3H895tAAB55vZP+wP3VPgd7H8YdOvGy9RsU8WrFnq6x/6
	BAos2b6H5JfIdLJk4IRtcbEkHWVc55nzDsKZ0X1M0FTmFwNr1YkP3DLRew==
X-Google-Smtp-Source: AGHT+IF90YM8gCIfv0tOw4c2rBwXbjIKCYymyTIdnPMh2DfQ+I4tSwiFgnBoV1WDOt6wyuhmbNCJvA==
X-Received: by 2002:a17:907:2d23:b0:a86:7f9f:9222 with SMTP id a640c23a62f3a-a867f9f9a0cmr237115066b.67.1724273263735;
        Wed, 21 Aug 2024 13:47:43 -0700 (PDT)
Received: from ?IPV6:2a01:c22:76de:5100:1131:aa83:adfe:51dd? (dynamic-2a01-0c22-76de-5100-1131-aa83-adfe-51dd.c22.pool.telefonica.de. [2a01:c22:76de:5100:1131:aa83:adfe:51dd])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a868f220d2bsm9544166b.43.2024.08.21.13.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 13:47:43 -0700 (PDT)
Message-ID: <a1af16cd-5262-432a-a22c-23957af8f8a2@gmail.com>
Date: Wed, 21 Aug 2024 22:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] i2c: Replace list-based mechanism for handling
 userspace-created clients
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9fabf29f-2b45-461e-ae6e-4391a40bcaca@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <9fabf29f-2b45-461e-ae6e-4391a40bcaca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Similarly to the list of auto-detected clients, we can also replace the
list of userspace-created clients with flagging such client devices.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 58 ++++++++++++++-----------------------
 include/linux/i2c.h         |  1 +
 2 files changed, 22 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 549bb76b7..b9f1b1a1b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1265,14 +1265,12 @@ new_device_store(struct device *dev, struct device_attribute *attr,
 		info.flags |= I2C_CLIENT_SLAVE;
 	}
 
+	info.flags |= I2C_CLIENT_USER;
+
 	client = i2c_new_client_device(adap, &info);
 	if (IS_ERR(client))
 		return PTR_ERR(client);
 
-	/* Keep track of the added device */
-	mutex_lock(&adap->userspace_clients_lock);
-	list_add_tail(&client->detected, &adap->userspace_clients);
-	mutex_unlock(&adap->userspace_clients_lock);
 	dev_info(dev, "%s: Instantiated device %s at 0x%02hx\n", "new_device",
 		 info.type, info.addr);
 
@@ -1280,6 +1278,15 @@ new_device_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_WO(new_device);
 
+static int __i2c_find_user_addr(struct device *dev, void *addrp)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	unsigned short addr = *(unsigned short *)addrp;
+
+	return client && client->flags & I2C_CLIENT_USER &&
+	       i2c_encode_flags_to_addr(client) == addr;
+}
+
 /*
  * And of course let the users delete the devices they instantiated, if
  * they got it wrong. This interface can only be used to delete devices
@@ -1294,7 +1301,8 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 		    const char *buf, size_t count)
 {
 	struct i2c_adapter *adap = to_i2c_adapter(dev);
-	struct i2c_client *client, *next;
+	struct i2c_client *client;
+	struct device *child_dev;
 	unsigned short addr;
 	char end;
 	int res;
@@ -1311,27 +1319,16 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	/* Make sure the device was added through sysfs */
-	res = -ENOENT;
-	mutex_lock_nested(&adap->userspace_clients_lock,
-			  i2c_adapter_depth(adap));
-	list_for_each_entry_safe(client, next, &adap->userspace_clients,
-				 detected) {
-		if (i2c_encode_flags_to_addr(client) == addr) {
-			dev_info(dev, "%s: Deleting device %s at 0x%02hx\n",
-				 "delete_device", client->name, client->addr);
-
-			list_del(&client->detected);
-			i2c_unregister_device(client);
-			res = count;
-			break;
-		}
+	child_dev = device_find_child(&adap->dev, &addr, __i2c_find_user_addr);
+	if (!child_dev) {
+		dev_err(dev, "Can't find userspace-created device at %#x\n", addr);
+		return -ENOENT;
 	}
-	mutex_unlock(&adap->userspace_clients_lock);
+	client = i2c_verify_client(child_dev);
+	i2c_unregister_device(client);
+	put_device(child_dev);
 
-	if (res < 0)
-		dev_err(dev, "%s: Can't find device in list\n",
-			"delete_device");
-	return res;
+	return count;
 }
 static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, S_IWUSR, NULL,
 				  delete_device_store);
@@ -1688,7 +1685,6 @@ static int __unregister_dummy(struct device *dev, void *dummy)
 void i2c_del_adapter(struct i2c_adapter *adap)
 {
 	struct i2c_adapter *found;
-	struct i2c_client *client, *next;
 
 	/* First make sure that this adapter was ever added */
 	mutex_lock(&core_lock);
@@ -1701,18 +1697,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 
 	i2c_acpi_remove_space_handler(adap);
 
-	/* Remove devices instantiated from sysfs */
-	mutex_lock_nested(&adap->userspace_clients_lock,
-			  i2c_adapter_depth(adap));
-	list_for_each_entry_safe(client, next, &adap->userspace_clients,
-				 detected) {
-		dev_dbg(&adap->dev, "Removing %s at 0x%x\n", client->name,
-			client->addr);
-		list_del(&client->detected);
-		i2c_unregister_device(client);
-	}
-	mutex_unlock(&adap->userspace_clients_lock);
-
 	/* Detach any active clients. This can't fail, thus we do not
 	 * check the returned value. This is a two-pass process, because
 	 * we can't remove the dummy devices during the first pass: they
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 910a9b259..ba2564fe4 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -333,6 +333,7 @@ struct i2c_client {
 #define I2C_CLIENT_HOST_NOTIFY	0x40	/* We want to use I2C host notify */
 #define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
 #define I2C_CLIENT_AUTO		0x100	/* for board_info; auto-detected */
+#define I2C_CLIENT_USER		0x200	/* for board_info; userspace-created */
 #define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
 
-- 
2.46.0



