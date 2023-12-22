Return-Path: <linux-i2c+bounces-966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9207581CC6B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 16:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21724285E9F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 15:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4F72377B;
	Fri, 22 Dec 2023 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laBi0PXw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6262377A
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a235eb41251so243359266b.3
        for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 07:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703260413; x=1703865213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jR0i5R6/MoO43dXK7YzoNWNwN6P7QFzTN9/1M/VZa0s=;
        b=laBi0PXw26FBD/HYlli/Bx++1OUsHXdEu5A5oIuF+kH7TCVFohPhEVfjDyZL/Gj7XT
         OyLu7RPeS8K5ZkOwt68cRWGkekdGIGaFCkvUJOrW6JduQNzUhWwr8tFfCEfN+EPS7b6S
         uH4mQbncqM94EwZrhz3aYkHHtbc0s6fQZ4Jwe9dLZWx4WOaa5xu7gvAA0wC2tgXXE5zo
         rfVC8vICgn+pohH6DQtgoKVYjl05GNVCpRbdTMRdNVx9FyfsrCghGvHMZB3llkYZZjJZ
         Hn1DK7f5IG8wXQB4Flz8/088gw+StqxD5Yqo8wIq44Czum70jWQXI11WnUU3im0lTvaM
         V95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703260413; x=1703865213;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jR0i5R6/MoO43dXK7YzoNWNwN6P7QFzTN9/1M/VZa0s=;
        b=sBi3fePx8aoG5pMURW7B9j34ZdnTPYXRV1swY0NEwRY/538qSD4bG/EXyjvf1+dVLh
         B2CVoXg6Hq0APP5yy6P2jH6VYipaHVWWe9htO447txKYz+JVFphVYD1L0i1dQlnLt0Uv
         FFKx7l9clQKN59Z74khfgA7e/DPtodAVB69SG46ArDD1CzeJ/Hz2DRbbWGUxOLKWIBr0
         0pegar/8A2ijFQUsI2AumAIDJEV4DckhyMuLWtU8SVpVRLY+PFFETq7BmNcdDnnY6Eco
         bbU9qHo2BBbocUWJoVmiHCz4zkCLsf7YptlmzZEppL55D+oWH0EmLKbMqNxcovZOkypf
         CHUQ==
X-Gm-Message-State: AOJu0Yx2hscyjua+xfq4M4XNzFUAgk5eXeztm+Fjz6Opvh+sIpuLQzB5
	TEk9S0mtqZ20JZ5a9aB5K1c=
X-Google-Smtp-Source: AGHT+IGesR55oCjE3LuRGQ3/zeokYx6VQn+wG3SH4hSXak+GQO2+PyA8WcwLISolfdN91aUejXXhAQ==
X-Received: by 2002:a17:907:5004:b0:a23:5a0a:76f3 with SMTP id fw4-20020a170907500400b00a235a0a76f3mr549985ejc.176.1703260413272;
        Fri, 22 Dec 2023 07:53:33 -0800 (PST)
Received: from ?IPV6:2a01:c22:76fe:e700:90c7:5d23:5f70:b2c6? (dynamic-2a01-0c22-76fe-e700-90c7-5d23-5f70-b2c6.c22.pool.telefonica.de. [2a01:c22:76fe:e700:90c7:5d23:5f70:b2c6])
        by smtp.googlemail.com with ESMTPSA id az16-20020a170907905000b00a26ac53c2b7sm1519145ejc.98.2023.12.22.07.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 07:53:32 -0800 (PST)
Message-ID: <c9e20694-38bd-4d88-b390-4cf38055bd47@gmail.com>
Date: Fri, 22 Dec 2023 16:53:34 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RFC 1/3] i2c: smbus: Prepare i2c_register_spd for use on muxed
 segments
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Peter Rosin <peda@axentia.se>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <bdb10285-203b-4f82-ac03-f63c8ec44fe2@gmail.com>
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
In-Reply-To: <bdb10285-203b-4f82-ac03-f63c8ec44fe2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If this is an adapter on a muxed bus segment, assume that each segment
is connected to a subset of the (> 8) overall memory slots. In this
case let's probe the maximum of 8 slots, however stop if the number
of overall populated slots is reached.

If we're not on a muxed segment and the total number of slots is > 8,
report an error, because then not all SPD eeproms can be addressed.
Presumably the bus is muxed, but the mux config is missing.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-smbus.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 74807c6db..ad7ea0215 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -351,13 +351,17 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	if (!dimm_count)
 		return;
 
-	dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
-		 dimm_count, slot_count);
-
-	if (slot_count > 8) {
-		dev_warn(&adap->dev,
-			 "Systems with more than 8 memory slots not supported yet, not instantiating SPD\n");
-		return;
+	/* Check whether we're a child adapter on a muxed segment */
+	if (i2c_parent_is_i2c_adapter(adap)) {
+		slot_count = 8;
+	} else {
+		if (slot_count > 8) {
+			dev_err(&adap->dev,
+				"More than 8 memory slots on a single bus, mux config missing?\n");
+			return;
+		}
+		dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
+			 dimm_count, slot_count);
 	}
 
 	/*
-- 
2.43.0



