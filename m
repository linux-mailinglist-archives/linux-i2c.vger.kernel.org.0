Return-Path: <linux-i2c+bounces-1937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9F860B44
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 08:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 364021C217CA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 07:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA067134A3;
	Fri, 23 Feb 2024 07:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SII6z7j1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0058B12E43
	for <linux-i2c@vger.kernel.org>; Fri, 23 Feb 2024 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708672826; cv=none; b=GAWwFHMX+zfuw1P2eRAh8dhQwvYQNGEL5pxY5BD+nHJj14DEuQY7mGCvxVD2glQhSijYInYhHQIQzVe64vIJwCrDmbGFfwrLXAEeN8s+xlwiZMnQ2G7/Rz/iCdVebOWVbVyK7+C162JPoQDUewMABlswihevZ4VjRGG/5rFerHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708672826; c=relaxed/simple;
	bh=L0EPhHdOj1KL45hpFOky1suP5ENBQnaH2elPe4RUgYg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=IiH5rpn74oocUXUKGo3Sga8zfrr/IRDCmM247XiU0MsfdDarYOvxQWlbmBlp/pC/ROIfls3tp9eAbJTep4QyrjLvElhB7X5KU4u20jB45EjrCFQ3AdhRVjVrG+muGv1nz1MbrlpzSqQZgeU9KM9gY5Z6D0dvOPIolcVrFa6+c9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SII6z7j1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-564d9b0e96dso1157a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 23:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708672823; x=1709277623; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fof8A5tmOvD5m+J3S/4vx/OrVpzuXB6xAXoKAdG/M7w=;
        b=SII6z7j1TUMTUAaknMrHugg0zXyNPjCuXAWVD9huWw0cvvT7N0P1XyIU/Ds6E+zSIS
         AfDrg/9ebbnByXYGn4NqCXL0QQUbqmgtstmT/SZqZJjFV45uWU8e+vFvWVrVOdRIQOHF
         KMTMPkeooHukOC8rNidq8+Jua3WD1DdXFtxGeeNkBWN2X9ESlGYlgVDLITyY0UPcpFsy
         flMDLi4yuBFj29Oc6kVb9eLujyIrfyVcLEMQcYjlKUCjVeqTxhUNs+pdLKVhwQ+41JIy
         Fm9OR2Ti7CUpDS/bQjIEKQksypFaM4eNbHMp/DRltfpHUmV+ubcBFwIYLcrI87BZXUje
         Ao3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708672823; x=1709277623;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fof8A5tmOvD5m+J3S/4vx/OrVpzuXB6xAXoKAdG/M7w=;
        b=gggleHkPfn4UmAAqflOrdXfCijLXY3WJ6LlAuXortKdYxEW3uZ0BLZdXJKhOghhKfJ
         KcIalPliaNPzf39lld68z7a8bwxU2lXrHIeHgrEFHSRvK9MPoMomp1SFAgXZzzf3IJxZ
         S3wWvPIzm3Bx9tQZCGgpruOw6ijOTUH26CDdMXClVBNgg1HiwJUHBMYBgOcX1uWHKPBE
         3mdc1vjM04D2QlHLTDK7rxAR7TlmNh7mktniZwUuxTn6FXuoVEJOucy7R/63p7L3NBO5
         kdgVm7eNm5X9UqIM5Ywv6JfHwFD1MnUGqTBOOlyy30F5gWVqPezrDsNoTYFrOIjINNDU
         cZxg==
X-Gm-Message-State: AOJu0YxXPoqkjnKns9CEdJuP93dzlEwp5eaEnS+s7EXMuRTsZdBLKR9n
	yrEtsS8+Nnwf9cBPA9GVNrL3CG6AWzzaUdxkT/qPd4Fz5RsvO4QIKKfufO8F
X-Google-Smtp-Source: AGHT+IHeNN0wsmeL9IXdSDyA+RTJ3syFGSz5nc6eShKmwxCRZcQwTN8T8LE6NDudAimsqdUbfSWpFw==
X-Received: by 2002:a17:906:eb4a:b0:a3f:29e0:c9b4 with SMTP id mc10-20020a170906eb4a00b00a3f29e0c9b4mr605554ejb.30.1708672823005;
        Thu, 22 Feb 2024 23:20:23 -0800 (PST)
Received: from ?IPV6:2a01:c23:c403:8000:4442:2b24:9c18:44ef? (dynamic-2a01-0c23-c403-8000-4442-2b24-9c18-44ef.c23.pool.telefonica.de. [2a01:c23:c403:8000:4442:2b24:9c18:44ef])
        by smtp.googlemail.com with ESMTPSA id tl6-20020a170907c30600b00a3fd5908c59sm149755ejc.160.2024.02.22.23.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 23:20:22 -0800 (PST)
Message-ID: <4f83d281-7890-4ba5-b73c-616ce6378ba9@gmail.com>
Date: Fri, 23 Feb 2024 08:20:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Fix using mux_pdev before it's set
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

i801_probe_optional_slaves() is called before i801_add_mux().
This results in mux_pdev being checked before it's set by
i801_add_mux(). Fix this by changing the order of the calls.
I consider this safe as I see no dependency in the functions.

Fixes: 80e56b86b59e ("i2c: i801: Simplify class-based client device instantiation")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 223cd2b84..8e95db95c 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1762,9 +1762,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	i801_enable_host_notify(&priv->adapter);
 
-	i801_probe_optional_slaves(priv);
 	/* We ignore errors - multiplexing is optional */
 	i801_add_mux(priv);
+	i801_probe_optional_slaves(priv);
 
 	pci_set_drvdata(dev, priv);
 
-- 
2.43.2


