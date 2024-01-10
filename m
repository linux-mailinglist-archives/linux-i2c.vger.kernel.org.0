Return-Path: <linux-i2c+bounces-1256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CCE82A201
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 21:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 658911C2291A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 20:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BCE58105;
	Wed, 10 Jan 2024 20:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvA/yK4N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7491B58103
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so5577399e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 12:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704917582; x=1705522382; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:to:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UFRVZD6zkDu08NvTbyVYLv17VRavMRdMrQY4BEpMcc=;
        b=NvA/yK4Nbo7/asUiof7SERD6UQPc0pPAV6R3JrbjkcBEVALvIg6xRc7i1vb1h0Cl8m
         yQYVPIJg3U0P2ix9yV40aLAGzYabLadN4/eemJ+Y3TFXpQFjA8li95hsrl95n6d10iY5
         mX6pf67R8xq9Iv3VJ1POs/Xx7oRl2PWB8AYwolEr5k/EspVYz4N4dMfLtKyI5l3nmMPq
         8X9LFGF3H5hinydjt+0WbSja5ExWyJ+vFukIBaYApRNeJNXshoGube7KnXA37yh9ck0w
         ix5/UUkO8WN97b58ma5xjgbHgfxE7NRzhPPaLPCta09rFQIWq91Ycsu2hZwZk15C9cZd
         8lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704917582; x=1705522382;
        h=content-transfer-encoding:subject:cc:to:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UFRVZD6zkDu08NvTbyVYLv17VRavMRdMrQY4BEpMcc=;
        b=j6wetF1tW22hS7FYCJVYMwk/uEvZzXoDoPRlVS2FJ2FCtF1zkr/ujfyUQBl9z6QIVS
         bSNt0QExkQcEirabDubaeuYRzCQRwRS4o5QEbV2VGvb2oL0ohwFnc9L+UIv4rTEKRrzQ
         Kxb8OSisqKAZruqZWRIQMH2fMJXQo3nGYbmnp8sqhuesD9GZTFLL/9gfggd4VxU/3Do1
         NR2TLquOWptYAnWWUF1/iq37tWNrA7rLYVqxB13jPdcU2tkNHd/7CXdFQC9aVdfToxSh
         tiSnqXiJKUG0e/ozP3XZg+zt82Kjsr9Dqmo2AoY2zpiTk4GhpESZMOHsYpnJ1bZgKUSd
         6XWw==
X-Gm-Message-State: AOJu0YyH05TW3BdQtUgQqdm77K72yOD+BmWGJy2yBQnwdhf7cN36mgR4
	H/VRY0Srs/7/irpxIWzOZ+A=
X-Google-Smtp-Source: AGHT+IF41gW2X+jBtKZik14m1kaG2vOLUvWrvUG/AEYvRMnNQm5ejfKVuFDI4ZDt5pqrHOKtvytoUg==
X-Received: by 2002:a05:6512:1243:b0:50e:69f0:3cda with SMTP id fb3-20020a056512124300b0050e69f03cdamr960723lfb.20.1704917582165;
        Wed, 10 Jan 2024 12:13:02 -0800 (PST)
Received: from ?IPV6:2a01:c23:bd4e:3500:5df0:e74e:ef8d:49d1? (dynamic-2a01-0c23-bd4e-3500-5df0-e74e-ef8d-49d1.c23.pool.telefonica.de. [2a01:c23:bd4e:3500:5df0:e74e:ef8d:49d1])
        by smtp.googlemail.com with ESMTPSA id lk19-20020a170906cb1300b00a2c20c5f444sm264915ejb.6.2024.01.10.12.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 12:13:01 -0800 (PST)
Message-ID: <fc057deb-49f9-49cf-9549-13b2538ed92b@gmail.com>
Date: Wed, 10 Jan 2024 21:13:00 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
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
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [PATCH 0/4] i2c: Support i2c_register_spd() on multiplexed bus
 segments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

i801 is the last bus driver supporting I2C_CLASS_SPD. It's used for
device probing on muxed bus segments. Only known use case so far is
systems with more than 8 memory modules (with thermal sensor) on
muxed smbus segments.
As discussed with Jean, to be able to remove I2C_CLASS_SPD completely
the following has to be done:

1. Extend i2c_register_spd() for use on muxed bus segments
2. Enable explicit instantiation of thermal sensors on memory modules
3. Extend i801 to call i2c_register_spd() on muxed bus segments

Step 2 has been accomplished:
caba40ec3531 ("eeprom: at24: Probe for DDR3 thermal sensor in the SPD case")
393bd1000f81 ("eeprom: ee1004: add support for temperature sensor")

Patch 1 does step 1
Patches 2 and 3 provide the basis for patch 4
Patch 4 does step 3

Note: i801 creates the mux platform device, loading and probing of the
mux driver may be asynchronous. Therefore we can't call i2c_register_spd()
for the muxed segments from i801. Instead we have to add a flag to the
platform data, so that the mux driver knows it's supposed to call
i2c_register_spd().

This series replaces the earlier RFC series.

Heiner Kallweit (4):
  i2c: smbus: Prepare i2c_register_spd for usage on muxed segments
  i2c: mux: add basic support for calling i2c_register_spd on muxed bus
    segments
  i2c: mux: gpio: Allow to call i2c_register_spd on a muxed segment
  i2c: i801: Call i2c_register_spd() on muxed bus segments

 drivers/i2c/busses/i2c-i801.c              |  1 +
 drivers/i2c/i2c-mux.c                      |  4 ++++
 drivers/i2c/i2c-smbus.c                    | 19 ++++++++++++-------
 drivers/i2c/muxes/i2c-mux-gpio.c           |  1 +
 include/linux/i2c-mux.h                    |  1 +
 include/linux/platform_data/i2c-mux-gpio.h |  2 ++
 6 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.43.0


