Return-Path: <linux-i2c+bounces-1608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF38468E7
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 08:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E7731C21A49
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 07:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B4C17BA8;
	Fri,  2 Feb 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NO9DZJZk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F9D17988
	for <linux-i2c@vger.kernel.org>; Fri,  2 Feb 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706857249; cv=none; b=JxBMqNHyiro/BI0KrpkIJfEblogPHlkdZoqwaq/acYqCeqD8zp+gnD+7Zj/M5LsShTDZA8688H4KUR0TtI2OHzL7LeSJAPxQAaSaxFUELyUN8I9oDuWnYJ0v7alM8vDRyBbILalxDyEBkTVaHYnnLmHploKMEWbZbzyPX3MJCqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706857249; c=relaxed/simple;
	bh=pKSIkYTHPI57q7sA0FCOYyu65qCVYTrS/CIZbj5bs7E=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=V8I9V1jgS/TEem02rnkJPdmVWVmbyTCwZh7OTmWXn8RtWFMVP7oMPj6xyjKlyFRg5wLzPu4O7TlYEUNCRGuuDiTipVAmiM7VDAVmZAkBYzkdACpkxeu+yAVjwGkdN4fnsDQRV1LOoYRUH8wRqe6uM/YWPbGTIRx4ekLcYD1QR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NO9DZJZk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a35e9161b8cso241500266b.3
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 23:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857245; x=1707462045; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ETW+mR9v/Czh7qV/HKj6LuNKH/JWJEmegel3Eu8EuE=;
        b=NO9DZJZkHJA3Ptl0KhhWICe3wwWX8veNIntXFZIYUnG3/t3V233Es3UCVVNQ0xZYjM
         w186xmuTXSPatfvSRQEKoBynAyHXZE9wTZC7JDJvOIT5JTfG0zriMyNzrN3il2uzcnpq
         Sh2hR2AZo49NiO5RY3V52AALzBd4iCTt5GqnUcX9MVgmHK9UoaoFXkodhYYVRBXsTYWr
         +zCPrfLJCOm1jywKWogzi0ncZCNAdPpfjeNXUFQqKs6pwZC8FT/Gql8Fq+XJqTiblmio
         Bac1GTaerQBcGU/jKqSKHGZjiB6euTF/rTUElgAe2ZGEUBJMEf/gxooALyQqYKJpVV70
         UJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857245; x=1707462045;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ETW+mR9v/Czh7qV/HKj6LuNKH/JWJEmegel3Eu8EuE=;
        b=By5J3pK9NozZaKksRgS3AicMPYPPLgMPN7HcYlSPE/pnyG0UWIjXVnQnDy74Fh4dbN
         yMp5B6SLDuC9cC7JGSvC4Ngnj10doA7vI60T4G3c5ONGrHwfJsVbuU180WesKymV+8lc
         K23HkTLUuRdjpeyyiJQgViE1zsAAEOqOiTsTXz/OBdoAbLRPrHVr3qpO9Y2Mw7s8VLtr
         q5gI5okY36eBMYLPYGovStpG/XWS0GeGL34HDaUY37eaiIASH3YbJXuRqPIbTHg3xmpX
         qoFEnod+lFpgnv74WGX02JehDYNGeHzbrMKDJQvUesMo3OSC3Lo7Et4Md2198l/FHmjL
         jOVw==
X-Gm-Message-State: AOJu0YwZUmC/2ZX+6v5MZdGPJRI9jbS5zR8WzLmmcFPmcTWN8TnALDQe
	j60YUaQBrNFG3sKhSVNVx11YiRL+Q4IlpMLkPXiO5PcOWq8veNQM
X-Google-Smtp-Source: AGHT+IFdH8OwM0tCbh+ya8bWSkocrmEr0EH25KBjbIJMocBozsGrgIophknTosuI/zCdxm/PgjC1Mw==
X-Received: by 2002:a17:906:18ea:b0:a36:3819:940e with SMTP id e10-20020a17090618ea00b00a363819940emr926756ejf.27.1706857245314;
        Thu, 01 Feb 2024 23:00:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU+vHwveOBXlGyrRZWPrWo3taVii7Kizz+msxM+U2tP7i+CtRrA6scy80z1m/14GZeS51n9w8S/X9ce3sXE3S+ebkt8Kbdi3NBsVCNITBdNINBsaCEovoyNlXjmZo/eZhe24aQo3o+Dog==
Received: from ?IPV6:2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea? (dynamic-2a01-0c22-7392-d000-5c1a-bcfc-a8a4-5bea.c22.pool.telefonica.de. [2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea])
        by smtp.googlemail.com with ESMTPSA id c3-20020a170906340300b00a35a659cab5sm563728ejb.179.2024.02.01.23.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:00:44 -0800 (PST)
Message-ID: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
Date: Fri, 2 Feb 2024 08:00:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 0/5] i2c: i801: collection of further improvements /
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
v3
- fix comment style in patch 4

Heiner Kallweit (5):
  i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_ICH4
  i2c: i801: Add helper i801_check_and_clear_pec_error
  i2c: i801: Split i801_block_transaction
  i2c: i801: Add SMBUS_LEN_SENTINEL
  i2c: i801: Add helper i801_get_block_len

 drivers/i2c/busses/i2c-i801.c | 212 ++++++++++++++++++----------------
 1 file changed, 112 insertions(+), 100 deletions(-)

-- 
2.43.0


