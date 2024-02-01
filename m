Return-Path: <linux-i2c+bounces-1597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1808461C4
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7905AB21B5F
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 20:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2912885293;
	Thu,  1 Feb 2024 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCV54+ZY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CE985289
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706818095; cv=none; b=po1rpZoR/a5Fv2c83uLM+eAgFHi+7oR72UwiNr6xvkaWksggNeuBlZoSIWgUDdfyHFnxIs60C6Bw2koBU7SXaQpz7HbBgW592LsQ+fOTFkSvwwrP1jfYjwQH3vVBqmHcYyKWzEt2t/iDJrZHf1OYmxWvEEHYVAio++mpflhpc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706818095; c=relaxed/simple;
	bh=6JTeCxGFiNfBYPhTAzbxPPcToZiTGbelW3Z3oK7JZLU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Vkf/zA1FjHFGoG/lasqDU4EL936/tMJdwLft3Yy4yhLmhXOiNB8zl27gZRUmWwG5n6HXcG3s7si83aj8I5G7DCN/PnJ9I2bZeaxbETmRWpDI7JppKlFlmtOKoP7UEZMenGh9ps5vVhCbx1rrkulpxOMCm+oKGdauJF93nitphjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCV54+ZY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a359e6fde44so141517966b.3
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 12:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706818092; x=1707422892; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evwJRRt9e+zbREee0vIUSIW6gL9r6lZLMDIRmCg8VEs=;
        b=kCV54+ZY3JwPl+Po3Xa4dBMxLcAr6dL8R8/B9nsqzMI+ji1WdwhwLtk4EXFG14Lklc
         AfpAA44JLu+CMkBFrWchjkMzMmNUqhpv5FFhOjuWkMxC5IdaEE7QJ2yHUnvljZysXOqk
         Dq8FUbbnzfrAHnEupflR6MBILPFBU1+x4AMK14p3gIi1eoEPaO4QVxdh6VA/TRMJzzrq
         V5fI4LD6eDIhwJIv9sWfTkelnukVG3/r3ettyfw1iQlZbIu9y3qwhmVfeAclxQDlehm/
         gwfrxDSfQvlCEyW9Qc66B+4yBuzGYeHmyw9/WoKi2Jn9SRK+0MRlQv0W3HPffhS81yFD
         OyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706818092; x=1707422892;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evwJRRt9e+zbREee0vIUSIW6gL9r6lZLMDIRmCg8VEs=;
        b=sxcVDbCiklp24P/6Nlg7msmTv5/G1IsKsBy7vcVlJgvNXPI3fyNXGxB2EFviHoQ4tX
         C4qLMShnGiVUr9MmkNXKNq02cuQGnPdrpdaj8ojEOi/N+svaVHUzJ5xYStU4hLMCRlwl
         /Tkb6qTZJCAoGRup+F3137QvfxfXgBdNnljOz5qNswRlio3+dlrvyhZ8BaukV/ayoQs8
         aUcS5pyryV35MdoYnkKlOdGAERnzStYNRgzYTqMSahu7PF2KJskZWf9KcCi3RY03i4rE
         O0L8IULJxIWxZhzUmm7Hezt+de8AtiwKVpeUQRvDdzUCQEZD4sAZreQ2WDMj9Zgr21jt
         qBcg==
X-Gm-Message-State: AOJu0YzUcnaAxj6TJCzWVZGGvjKinfsRdY5LNkRNFZ42JTUxBRVLzNyk
	bPPj/oqwhe2n1VEuTAJFZO0xrfYE1CRuuqpjH02PDzbt2EfqgGkKTKTfEfnh
X-Google-Smtp-Source: AGHT+IEHgNAd4lXYWuCJKvwrKPKilLmVA/TdYdiJv+Lbx7E1HUmWO+pNFnJcWG+EZMDMN75tBELiNA==
X-Received: by 2002:a17:906:d114:b0:a36:6970:9d16 with SMTP id b20-20020a170906d11400b00a3669709d16mr4690082ejz.13.1706818092307;
        Thu, 01 Feb 2024 12:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUf5PsZscVS7T1BlpupiQOAgJYNxwJLB+ryv63y7UYx3d5BGozlDGLkHGsXNw2l87tiL8446U1vMXomv1KGxTEQ0iGQfRCt8PSe2DaCokBzYqM=
Received: from ?IPV6:2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac? (dynamic-2a01-0c23-bcb7-3100-59fd-7b30-8e23-b0ac.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac])
        by smtp.googlemail.com with ESMTPSA id cb11-20020a170906a44b00b00a349318ea10sm114415ejb.199.2024.02.01.12.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 12:08:12 -0800 (PST)
Message-ID: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
Date: Thu, 1 Feb 2024 21:08:13 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/5] i2c: i801: collection of further improvements /
 refactorings
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series contains further improvements and refactorings.

v2:
- omit patches 1 and 2 as they have been applied already
- remove patch 3 for now
- patch 4 in new series: add comments

Heiner Kallweit (5):
  i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_ICH4
  i2c: i801: Add helper i801_check_and_clear_pec_error
  i2c: i801: Split i801_block_transaction
  i2c: i801: Add SMBUS_LEN_SENTINEL
  i2c: i801: Add helper i801_get_block_len

 drivers/i2c/busses/i2c-i801.c | 209 ++++++++++++++++++----------------
 1 file changed, 109 insertions(+), 100 deletions(-)

-- 
2.43.0


